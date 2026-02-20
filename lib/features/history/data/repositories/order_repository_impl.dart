import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';
import 'package:savvy_pos/core/database/database.dart';
import 'package:savvy_pos/features/history/domain/repositories/i_order_repository.dart';

@LazySingleton(as: IOrderRepository)
class OrderRepositoryImpl implements IOrderRepository {
  final AppDatabase db;

  OrderRepositoryImpl(this.db);

  @override
  Stream<List<OrderTableData>> getOrders() {
    return (db.select(db.orderTable)
          ..orderBy([(t) => OrderingTerm(expression: t.transactionDate, mode: OrderingMode.desc)]))
        .watch();
  }

  @override
  Future<List<OrderItemTableData>> getOrderItems(String orderUuid) {
    return (db.select(db.orderItemTable)..where((t) => t.orderUuid.equals(orderUuid))).get();
  }

  @override
  Future<List<OrderTableData>> getOrdersByDateRange(DateTime start, DateTime end) {
    return (db.select(db.orderTable)
      ..where((tbl) => tbl.transactionDate.isBetweenValues(start, end))
      ..orderBy([(tbl) => OrderingTerm.desc(tbl.transactionDate)]))
      .get();
  }

  @override
  Stream<List<OrderTableData>> watchKitchenOrders() {
    return (db.select(db.orderTable)
      ..where((t) => t.isFulfilled.equals(false))
      ..orderBy([(t) => OrderingTerm(expression: t.transactionDate, mode: OrderingMode.asc)]))
      .watch();
  }

  @override
  Future<void> markOrderFulfilled(String uuid) async {
    await (db.update(db.orderTable)..where((t) => t.uuid.equals(uuid))).write(
      OrderTableCompanion(
        isFulfilled: const Value(true),
        updatedAt: Value(DateTime.now()), // Timestamp updated for change tracking
      )
    );
  }

  @override
  Future<void> upsertOrderWithConflictResolution(OrderTableData remoteOrder) async {
    return await db.transaction(() async {
      final existing = await (db.select(db.orderTable)
        ..where((t) => t.uuid.equals(remoteOrder.uuid)))
        .getSingleOrNull();

      if (existing == null) {
        // Doesn't exist locally, insert blindly
        await db.into(db.orderTable).insert(remoteOrder);
        return;
      }

      // Conflict Resolution Logic: Last Write Wins based on 'updatedAt'
      if (remoteOrder.updatedAt.isAfter(existing.updatedAt)) {
        // Remote is newer, but let's do a smart field-level merge for specific statuses
        // Example: Kitchen fulfilled status shouldn't be reverted lightly
        final mergedOrder = remoteOrder.copyWith(
          // Keep local kitchen status if local is fulfilled already
          isFulfilled: existing.isFulfilled || remoteOrder.isFulfilled,
        );
        
        await db.update(db.orderTable).replace(mergedOrder);
      } else {
        // Local is newer. Current local state wins.
        // We ensure it gets queued for sync so the server gets our fresher update.
        await (db.update(db.orderTable)..where((t) => t.uuid.equals(existing.uuid))).write(
          const OrderTableCompanion(isSynced: Value(false))
        );
      }
    });
  }
}
