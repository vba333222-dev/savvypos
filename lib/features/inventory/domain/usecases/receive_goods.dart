import 'dart:convert';
import 'package:drift/drift.dart';
import 'package:savvy_pos/core/database/database.dart';
import 'package:savvy_pos/core/database/tables.dart';
import 'package:uuid/uuid.dart';

class ReceiveGoods {
  final AppDatabase db;

  ReceiveGoods(this.db);

  Future<void> execute({
    required String purchaseOrderUuid,
    required String warehouseUuid, 
    required List<Map<String, dynamic>> items, // [{productUuid, quantityReceived}]
  }) async {
    final timestamp = DateTime.now();

    await db.transaction(() async {
      // 1. Update Local Stock (Immediate Availability)
      for (final item in items) {
        final productUuid = item['productUuid'] as String;
        final qtyReceived = (item['quantityReceived'] as num).toDouble();

        // Check if stock record exists
        final existing = await (db.select(db.localStocksTable)
          ..where((t) => t.productUuid.equals(productUuid) & t.warehouseUuid.equals(warehouseUuid)))
          .getSingleOrNull();

        if (existing != null) {
           // Increment
           await (db.update(db.localStocksTable)
              ..where((t) => t.id.equals(existing.id)))
              .write(LocalStocksTableCompanion(
                quantity: Value(existing.quantity + qtyReceived),
                updatedAt: Value(timestamp),
              ));
        } else {
           // Insert new
           await db.into(db.localStocksTable).insert(LocalStocksTableCompanion(
              productUuid: Value(productUuid),
              warehouseUuid: Value(warehouseUuid),
              quantity: Value(qtyReceived),
              updatedAt: Value(timestamp),
           ));
        }
        
        // 2 Create Ledger Entry (Optional, but good for tracking)
        await db.into(db.inventoryLedgerTable).insert(InventoryLedgerTableCompanion(
           productUuid: Value(productUuid),
           quantityChange: Value(qtyReceived),
           referenceId: Value(purchaseOrderUuid),
           type: Value('GOODS_RECEIPT'),
           timestamp: Value(timestamp),
        ));
      }

      // 3. Queue Sync Action (Background Sync)
      final payload = {
        'purchaseOrderUuid': purchaseOrderUuid,
        'warehouseUuid': warehouseUuid,
        'receivedAt': timestamp.toIso8601String(),
        'items': items,
      };

      await db.into(db.syncQueue).insert(SyncQueueCompanion(
         actionType: Value('GOODS_RECEIPT'),
         payloadJson: Value(jsonEncode(payload)),
         idempotencyKey: Value(const Uuid().v4()),
         createdAt: Value(timestamp),
      ));
    });
  }
}
