import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';
import 'package:savvy_pos/core/database/database.dart';
import 'package:savvy_pos/features/inventory/domain/entities/inventory_entities.dart';
import 'package:savvy_pos/features/inventory/domain/entities/waste_record.dart';
import 'package:savvy_pos/features/inventory/domain/repositories/i_inventory_repository.dart';

@LazySingleton(as: IInventoryRepository)
class InventoryRepositoryImpl implements IInventoryRepository {
  final AppDatabase _db;

  InventoryRepositoryImpl(this._db);

  // ===================================
  // SUPPLIER
  // ===================================
  @override
  Future<List<Supplier>> getSuppliers() async {
    final rows = await _db.select(_db.supplierTable).get();
    return rows
        .map((r) => Supplier(
              uuid: r.uuid,
              name: r.name,
              email: r.email,
              phone: r.phone,
              address: r.address,
              leadTimeDays: r.leadTimeDays,
              updatedAt: r.updatedAt,
            ))
        .toList();
  }

  @override
  Future<void> saveSupplier(Supplier supplier) async {
    await _db
        .into(_db.supplierTable)
        .insertOnConflictUpdate(SupplierTableCompanion(
          uuid: Value(supplier.uuid),
          name: Value(supplier.name),
          email: Value(supplier.email),
          phone: Value(supplier.phone),
          address: Value(supplier.address),
          leadTimeDays: Value(supplier.leadTimeDays),
          updatedAt: Value(DateTime.now()),
        ));
  }

  // ===================================
  // PURCHASE ORDER
  // ===================================
  @override
  Future<List<PurchaseOrder>> getPurchaseOrders({PoStatus? status}) async {
    final query = _db.select(_db.purchaseOrderTable);
    if (status != null) {
      query.where((t) => t.status.equals(status.name));
    }
    final rows = await query.get();
    return rows
        .map((r) => PurchaseOrder(
              uuid: r.uuid,
              supplierUuid: r.supplierUuid,
              targetWarehouseUuid: r.targetWarehouseUuid,
              status: PoStatus.values.firstWhere((e) => e.name == r.status),
              referenceNumber: r.referenceNumber,
              notes: r.notes,
              totalCost: r.totalCost,
              createdAt: r.createdAt,
              updatedAt: r.updatedAt,
              items: [],
            ))
        .toList();
  }

  @override
  Future<PurchaseOrder?> getPurchaseOrder(String uuid) async {
    final poRow = await (_db.select(_db.purchaseOrderTable)
          ..where((t) => t.uuid.equals(uuid)))
        .getSingleOrNull();
    if (poRow == null) return null;

    final itemsRows = await (_db.select(_db.purchaseOrderItemTable)
          ..where((t) => t.poUuid.equals(uuid)))
        .get();

    final items = <PurchaseOrderItem>[];
    for (final i in itemsRows) {
      final product = i.productUuid != null
          ? await (_db.select(_db.productTable)
                ..where((t) => t.uuid.equals(i.productUuid!)))
              .getSingleOrNull()
          : null;
      final ingredient = i.ingredientUuid != null
          ? await (_db.select(_db.ingredientTable)
                ..where((t) => t.uuid.equals(i.ingredientUuid!)))
              .getSingleOrNull()
          : null;

      items.add(PurchaseOrderItem(
        poUuid: i.poUuid,
        productUuid: i.productUuid,
        ingredientUuid: i.ingredientUuid,
        quantityOrdered: i.quantityOrdered,
        quantityReceived: i.quantityReceived,
        unitCost: i.unitCost,
        productName: product?.name ?? ingredient?.name,
      ));
    }

    return PurchaseOrder(
      uuid: poRow.uuid,
      supplierUuid: poRow.supplierUuid,
      targetWarehouseUuid: poRow.targetWarehouseUuid,
      status: PoStatus.values.firstWhere((e) => e.name == poRow.status),
      referenceNumber: poRow.referenceNumber,
      notes: poRow.notes,
      totalCost: poRow.totalCost,
      createdAt: poRow.createdAt,
      updatedAt: poRow.updatedAt,
      items: items,
    );
  }

  @override
  Future<void> savePurchaseOrder(PurchaseOrder po) async {
    await _db.transaction(() async {
      await _db
          .into(_db.purchaseOrderTable)
          .insertOnConflictUpdate(PurchaseOrderTableCompanion(
            uuid: Value(po.uuid),
            supplierUuid: Value(po.supplierUuid),
            targetWarehouseUuid: Value(po.targetWarehouseUuid),
            status: Value(po.status.name),
            referenceNumber: Value(po.referenceNumber),
            notes: Value(po.notes),
            totalCost: Value(po.totalCost),
            createdAt: Value(po.createdAt ?? DateTime.now()),
            updatedAt: Value(DateTime.now()),
          ));

      await (_db.delete(_db.purchaseOrderItemTable)
            ..where((t) => t.poUuid.equals(po.uuid)))
          .go();

      for (final item in po.items) {
        await _db
            .into(_db.purchaseOrderItemTable)
            .insert(PurchaseOrderItemTableCompanion(
              poUuid: Value(po.uuid),
              productUuid: Value(item.productUuid),
              ingredientUuid: Value(item.ingredientUuid),
              quantityOrdered: Value(item.quantityOrdered),
              quantityReceived: Value(item.quantityReceived),
              unitCost: Value(item.unitCost),
            ));
      }
    });
  }

  @override
  Future<void> receivePurchaseOrder(
      String poUuid, Map<String, double> receivedQuantities) async {
    await _db.transaction(() async {
      final po = await getPurchaseOrder(poUuid);
      if (po == null) throw Exception("PO not found");

      bool allReceived = true;

      for (final item in po.items) {
        final itemId = item.productUuid ?? item.ingredientUuid!;
        final rcv = receivedQuantities[itemId] ?? 0;
        final newReceivedTotal = item.quantityReceived + rcv;

        if (newReceivedTotal < item.quantityOrdered) allReceived = false;

        final updateQuery = _db.update(_db.purchaseOrderItemTable)
          ..where((t) => t.poUuid.equals(poUuid));

        if (item.productUuid != null) {
          updateQuery.where((t) => t.productUuid.equals(item.productUuid!));
        } else {
          updateQuery
              .where((t) => t.ingredientUuid.equals(item.ingredientUuid!));
        }

        await updateQuery.write(PurchaseOrderItemTableCompanion(
            quantityReceived: Value(newReceivedTotal)));

        if (rcv > 0) {
          if (item.productUuid != null) {
            await updateStock(item.productUuid!, po.targetWarehouseUuid, rcv,
                "PO Receive ${po.referenceNumber}",
                referenceId: poUuid);
          } else if (item.ingredientUuid != null) {
            final ing = await (_db.select(_db.ingredientTable)
                  ..where((t) => t.uuid.equals(item.ingredientUuid!)))
                .getSingle();
            final newStock = ing.currentStock + rcv;
            await (_db.update(_db.ingredientTable)
                  ..where((t) => t.uuid.equals(item.ingredientUuid!)))
                .write(IngredientTableCompanion(currentStock: Value(newStock)));
          }
        }
      }

      final newStatus = allReceived
          ? PoStatus.completed.name
          : PoStatus.partiallyReceived.name;
      await (_db.update(_db.purchaseOrderTable)
            ..where((t) => t.uuid.equals(poUuid)))
          .write(PurchaseOrderTableCompanion(status: Value(newStatus)));
    });
  }

  // ===================================
  // STOCK LOGIC
  // ===================================
  @override
  Future<void> updateStock(String productUuid, String warehouseUuid,
      double quantityChange, String reason,
      {String? referenceId}) async {
    await _db
        .into(_db.inventoryLedgerTable)
        .insert(InventoryLedgerTableCompanion.insert(
          productUuid: productUuid,
          quantityChange: quantityChange,
          referenceId: referenceId ?? '',
          type: quantityChange > 0 ? 'restock' : 'deduct',
          timestamp: DateTime.now(),
        ));

    final currentStock = await (_db.select(_db.localStocksTable)
          ..where((t) =>
              t.productUuid.equals(productUuid) &
              t.warehouseUuid.equals(warehouseUuid)))
        .getSingleOrNull();

    if (currentStock == null) {
      await _db
          .into(_db.localStocksTable)
          .insert(LocalStocksTableCompanion.insert(
            productUuid: productUuid,
            warehouseUuid: warehouseUuid,
            quantity: Value(quantityChange),
            updatedAt: DateTime.now(),
          ));
    } else {
      await (_db.update(_db.localStocksTable)
            ..where((t) => t.id.equals(currentStock.id)))
          .write(LocalStocksTableCompanion(
        quantity: Value(currentStock.quantity + quantityChange),
        updatedAt: Value(DateTime.now()),
      ));
    }
  }

  @override
  Future<double> getStockQuantity(String productUuid) async {
    const warehouseUuid = 'MAIN_WH';
    final row = await (_db.select(_db.localStocksTable)
          ..where((t) =>
              t.productUuid.equals(productUuid) &
              t.warehouseUuid.equals(warehouseUuid)))
        .getSingleOrNull();
    return row?.quantity ?? 0.0;
  }

  // ===================================
  // STOCK COUNT
  // ===================================
  @override
  Future<void> startStockCount(StockCount count) async {
    await _db.into(_db.stockCountTable).insert(StockCountTableCompanion.insert(
          uuid: count.uuid,
          warehouseUuid: count.warehouseUuid,
          conductedBy: count.conductedBy,
          startedAt: count.startedAt,
          status: const Value('IN_PROGRESS'),
        ));
  }

  @override
  Future<void> submitStockCount(StockCount count) async {
    await _db.transaction(() async {
      await (_db.update(_db.stockCountTable)
            ..where((t) => t.uuid.equals(count.uuid)))
          .write(StockCountTableCompanion(
        status: const Value('COMPLETED'),
        completedAt: Value(DateTime.now()),
      ));

      for (final item in count.items) {
        await _db
            .into(_db.stockCountItemTable)
            .insert(StockCountItemTableCompanion.insert(
              countUuid: count.uuid,
              productUuid: item.productUuid,
              expectedQty: item.expectedQty,
              countedQty: item.countedQty,
              variance: item.variance,
            ));

        if (item.variance != 0) {
          await updateStock(item.productUuid, count.warehouseUuid,
              item.variance, "Stock Count Adjustment",
              referenceId: count.uuid);
        }
      }
    });
  }

  // ===================================
  // STOCK TRANSFER
  // ===================================
  @override
  Future<void> transferStock(StockTransfer transfer) async {
    await _db.transaction(() async {
      await _db
          .into(_db.stockTransferTable)
          .insert(StockTransferTableCompanion.insert(
            uuid: transfer.uuid,
            transferNumber: 'TRF-${DateTime.now().millisecondsSinceEpoch}',
            sourceWarehouseUuid: transfer.sourceWarehouseUuid,
            sourceWarehouseName: 'Cache Source',
            targetWarehouseUuid: transfer.targetWarehouseUuid,
            targetWarehouseName: 'Cache Target',
            status: const Value('IN_TRANSIT'),
            createdBy: transfer.createdBy,
            createdByName: transfer.createdBy,
            createdAt: DateTime.now(),
            updatedAt: DateTime.now(),
          ));

      for (final item in transfer.items) {
        await _db
            .into(_db.stockTransferItemTable)
            .insert(StockTransferItemTableCompanion.insert(
              transferUuid: transfer.uuid,
              productUuid: item.productUuid,
              productName: 'Cache Product',
              quantityRequested: item.quantity,
              quantityShipped: Value(item.quantity),
              unitCost: 0.0,
            ));

        await updateStock(item.productUuid, transfer.sourceWarehouseUuid,
            -item.quantity, 'Transfer Out',
            referenceId: transfer.uuid);
      }
    });
  }

  @override
  Future<void> receiveStockTransfer(
      String transferUuid, String receiverId) async {
    await _db.transaction(() async {
      final transfer = await (_db.select(_db.stockTransferTable)
            ..where((t) => t.uuid.equals(transferUuid)))
          .getSingleOrNull();
      if (transfer == null) throw Exception('Transfer not found');

      await (_db.update(_db.stockTransferTable)
            ..where((t) => t.uuid.equals(transferUuid)))
          .write(StockTransferTableCompanion(
        status: const Value('COMPLETED'),
        receivedAt: Value(DateTime.now()),
        updatedAt: Value(DateTime.now()),
      ));

      final items = await (_db.select(_db.stockTransferItemTable)
            ..where((t) => t.transferUuid.equals(transferUuid)))
          .get();

      for (final item in items) {
        await (_db.update(_db.stockTransferItemTable)
              ..where((t) => t.id.equals(item.id)))
            .write(StockTransferItemTableCompanion(
                quantityReceived: Value(item.quantityShipped)));

        await updateStock(item.productUuid, transfer.targetWarehouseUuid,
            item.quantityShipped, 'Transfer In',
            referenceId: transferUuid);
      }
    });
  }

  @override
  Future<List<StockTransfer>> getIncomingTransfers(
      String targetWarehouseUuid) async {
    final rows = await (_db.select(_db.stockTransferTable)
          ..where((t) =>
              t.targetWarehouseUuid.equals(targetWarehouseUuid) &
              t.status.equals('IN_TRANSIT')))
        .get();

    final mapped = <StockTransfer>[];
    for (final row in rows) {
      final itemsRows = await (_db.select(_db.stockTransferItemTable)
            ..where((t) => t.transferUuid.equals(row.uuid)))
          .get();
      final items = itemsRows
          .map((i) => StockTransferItem(
              productUuid: i.productUuid, quantity: i.quantityShipped))
          .toList();

      mapped.add(StockTransfer(
        uuid: row.uuid,
        sourceWarehouseUuid: row.sourceWarehouseUuid,
        targetWarehouseUuid: row.targetWarehouseUuid,
        status: row.status,
        createdBy: row.createdBy,
        createdAt: row.createdAt,
        items: items,
      ));
    }
    return mapped;
  }

  // ===================================
  // RECEIVING (Alias for receivePurchaseOrder)
  // ===================================
  @override
  Future<void> receiveGoods(
      String poUuid, Map<String, double> quantities) async {
    await receivePurchaseOrder(poUuid, quantities);
  }

  // ===================================
  // WASTE REPORTS
  // ===================================
  @override
  Future<List<WasteRecord>> getWasteReports(
      {DateTime? from, DateTime? to}) async {
    // TODO: Implement when wasteRecordTable is added to database
    // For now return empty list to satisfy interface
    return [];
  }
}
