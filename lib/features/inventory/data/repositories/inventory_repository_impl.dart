import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:savvy_pos/core/database/database.dart';
import 'package:savvy_pos/features/inventory/domain/exceptions/inventory_exceptions.dart';
import 'package:savvy_pos/features/inventory/domain/repositories/i_inventory_repository.dart';
import 'package:uuid/uuid.dart';

@LazySingleton(as: IInventoryRepository)
class InventoryRepositoryImpl implements IInventoryRepository {
  final AppDatabase db;
  final Uuid _uuid = const Uuid();

  InventoryRepositoryImpl(this.db);

  @override
  Future<void> transferStock({
    required String sourceWarehouseId,
    required String targetWarehouseId,
    required List<StockTransferItem> items,
    required String referenceNote,
  }) async {
    return db.transaction(() async {
      for (final item in items) {
        // Step A: Verify Source Stock
        final sourceStock = await (db.select(db.localStocksTable)
              ..where((t) => t.productUuid.equals(item.productUuid) & t.warehouseUuid.equals(sourceWarehouseId)))
            .getSingleOrNull();

        if (sourceStock == null || sourceStock.quantity < item.quantity) {
          throw InsufficientStockException(item.productUuid, 'Insufficient stock for product ${item.productUuid} in source warehouse.');
        }

        // Step B: Decrement Source
        await (db.update(db.localStocksTable)
              ..where((t) => t.id.equals(sourceStock.id)))
            .write(LocalStocksTableCompanion(
          quantity: Value(sourceStock.quantity - item.quantity),
          updatedAt: Value(DateTime.now()),
        ));

        // Step C: Increment Target (Upsert)
        final targetStock = await (db.select(db.localStocksTable)
              ..where((t) => t.productUuid.equals(item.productUuid) & t.warehouseUuid.equals(targetWarehouseId)))
            .getSingleOrNull();

        if (targetStock != null) {
          await (db.update(db.localStocksTable)
                ..where((t) => t.id.equals(targetStock.id)))
              .write(LocalStocksTableCompanion(
            quantity: Value(targetStock.quantity + item.quantity),
            updatedAt: Value(DateTime.now()),
          ));
        } else {
          await db.into(db.localStocksTable).insert(LocalStocksTableCompanion.insert(
            productUuid: item.productUuid,
            warehouseUuid: targetWarehouseId,
            quantity: Value(item.quantity),
            updatedAt: DateTime.now(),
          ));
        }

        // Step D: Log to InventoryLedger
        await db.into(db.inventoryLedgerTable).insert(InventoryLedgerTableCompanion.insert(
          productUuid: item.productUuid,
          quantityChange: -item.quantity, // Source logging
          referenceId: 'TRF-${_uuid.v4().substring(0, 8)}',
          type: 'transfer_out',
          timestamp: DateTime.now(),
        ));
         await db.into(db.inventoryLedgerTable).insert(InventoryLedgerTableCompanion.insert(
          productUuid: item.productUuid,
          quantityChange: item.quantity, // Target logging
          referenceId: 'TRF-${_uuid.v4().substring(0, 8)}',
          type: 'transfer_in',
          timestamp: DateTime.now(),
        ));
      }

      // Step 3: Queue Sync Event
      final payload = {
        'source_warehouse_id': sourceWarehouseId,
        'target_warehouse_id': targetWarehouseId,
        'items': items.map((i) => {'product_uuid': i.productUuid, 'quantity': i.quantity}).toList(),
        'note': referenceNote,
      };

      await db.into(db.syncQueue).insert(SyncQueueCompanion.insert(
        actionType: 'STOCK_TRANSFER',
        payloadJson: jsonEncode(payload),
        idempotencyKey: _uuid.v4(),
        createdAt: DateTime.now(),
      ));
      
      Logger().i('Stock Transfer of ${items.length} items completed successfully.');
    });
    @override
  Future<void> receiveGoods({
    required String purchaseOrderUuid,
    required String warehouseUuid,
    required List<Map<String, dynamic>> items,
  }) async {
    return db.transaction(() async {
      final timestamp = DateTime.now();

      // 1. Process Items & Update Stock
      for (final item in items) {
        final productUuid = item['productUuid'] as String;
        final qtyReceived = (item['quantityReceived'] as num).toDouble();

        // A. Update Local Stock (Immediate Availability)
        final existingStock = await (db.select(db.localStocksTable)
          ..where((t) => t.productUuid.equals(productUuid) & t.warehouseUuid.equals(warehouseUuid)))
          .getSingleOrNull();

        if (existingStock != null) {
           await (db.update(db.localStocksTable)..where((t) => t.id.equals(existingStock.id)))
              .write(LocalStocksTableCompanion(
                quantity: Value(existingStock.quantity + qtyReceived),
                updatedAt: Value(timestamp),
              ));
        } else {
           await db.into(db.localStocksTable).insert(LocalStocksTableCompanion(
              productUuid: Value(productUuid),
              warehouseUuid: Value(warehouseUuid),
              quantity: Value(qtyReceived),
              updatedAt: Value(timestamp),
           ));
        }
        
        // B. Update Purchase Order Item Received Qty
        final poLineItem = await (db.select(db.purchaseOrderItemTable)
            ..where((t) => t.poUuid.equals(purchaseOrderUuid) & t.productUuid.equals(productUuid)))
            .getSingleOrNull();
            
        if (poLineItem != null) {
          await (db.update(db.purchaseOrderItemTable)
              ..where((t) => t.id.equals(poLineItem.id)))
              .write(PurchaseOrderItemTableCompanion(
                quantityReceived: Value(poLineItem.quantityReceived + qtyReceived),
              ));
        }

        // C. Ledger Entry
        await db.into(db.inventoryLedgerTable).insert(InventoryLedgerTableCompanion(
           productUuid: Value(productUuid),
           quantityChange: Value(qtyReceived),
           referenceId: Value(purchaseOrderUuid),
           type: Value('GOODS_RECEIPT'),
           timestamp: Value(timestamp),
        ));
      }

      // 2. Update Purchase Order Status
      final allItems = await (db.select(db.purchaseOrderItemTable)
        ..where((t) => t.poUuid.equals(purchaseOrderUuid)))
        .get();
      
      bool isFullyReceived = true;
      bool isAtLeastPartial = false;

      for (var line in allItems) {
        if (line.quantityReceived < line.quantityOrdered) {
          isFullyReceived = false;
        }
        if (line.quantityReceived > 0) {
          isAtLeastPartial = true;
        }
      }

      String newStatus = 'PENDING';
      if (isFullyReceived && allItems.isNotEmpty) {
        newStatus = 'COMPLETED';
      } else if (isAtLeastPartial) {
        newStatus = 'PARTIALLY_RECEIVED';
      }

      await (db.update(db.purchaseOrderTable)
          ..where((t) => t.uuid.equals(purchaseOrderUuid)))
          .write(PurchaseOrderTableCompanion(
            status: Value(newStatus),
            updatedAt: Value(timestamp),
          ));

      // 3. Queue Sync Action (Background Sync)
      final payload = {
        'purchaseOrderUuid': purchaseOrderUuid,
        'warehouseUuid': warehouseUuid,
        'receivedAt': timestamp.toIso8601String(),
        'items': items,
        'status': newStatus,
      };

      await db.into(db.syncQueue).insert(SyncQueueCompanion.insert(
         actionType: 'GOODS_RECEIPT',
         payloadJson: jsonEncode(payload),
         idempotencyKey: _uuid.v4(),
         createdAt: timestamp,
      ));
      
      Logger().i('Goods Receipt PO#$purchaseOrderUuid processed successfully.');
    });
  }
}
}
