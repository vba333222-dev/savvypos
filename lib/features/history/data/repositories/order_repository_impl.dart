import 'package:savvy_pos/core/utils/time_helper.dart';
import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';
import 'package:savvy_pos/core/database/database.dart';
import 'package:savvy_pos/features/history/domain/repositories/i_order_repository.dart';
import 'package:savvy_pos/features/auth/domain/repositories/i_tenant_repository.dart';

@LazySingleton(as: IOrderRepository)
class OrderRepositoryImpl implements IOrderRepository {
  final AppDatabase db;
  final ITenantRepository _tenantRepo;

  OrderRepositoryImpl(this.db, this._tenantRepo);

  @override
  Future<List<OrderTableData>> getOrders({int limit = 50, int offset = 0}) async {
    final scope = await _tenantRepo.getActiveScope();
    return (db.select(db.orderTable)
          ..where((t) => t.outletId.equals(scope['outletId'] ?? ''))
          ..orderBy([
            (t) => OrderingTerm(
                expression: t.transactionDate, mode: OrderingMode.desc)
          ])
          ..limit(limit, offset: offset))
        .get();
  }

  @override
  Future<List<OrderItemTableData>> getOrderItems(String orderUuid) {
    return (db.select(db.orderItemTable)
          ..where((t) => t.orderUuid.equals(orderUuid)))
        .get();
  }

  @override
  Future<List<OrderTableData>> getOrdersByDateRange(
      DateTime start, DateTime end) async {
    final scope = await _tenantRepo.getActiveScope();
    return (db.select(db.orderTable)
          ..where((tbl) =>
              tbl.outletId.equals(scope['outletId'] ?? '') &
              tbl.transactionDate.isBetweenValues(start, end))
          ..orderBy([(tbl) => OrderingTerm.desc(tbl.transactionDate)]))
        .get();
  }

  @override
  Stream<List<OrderTableData>> watchKitchenOrders() async* {
    final scope = await _tenantRepo.getActiveScope();
    yield* (db.select(db.orderTable)
          ..where((t) =>
              t.outletId.equals(scope['outletId'] ?? '') &
              t.isFulfilled.equals(false))
          ..orderBy([
            (t) => OrderingTerm(
                expression: t.transactionDate, mode: OrderingMode.asc)
          ]))
        .watch();
  }

  @override
  Future<void> markOrderFulfilled(String uuid) async {
    await (db.update(db.orderTable)..where((t) => t.uuid.equals(uuid)))
        .write(OrderTableCompanion(
      isFulfilled: const Value(true),
      updatedAt: Value(TimeHelper.now()), // Timestamp updated for change tracking
    ));
  }

  @override
  Future<void> upsertOrderWithConflictResolution(
      OrderTableData remoteOrder) async {
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
        await (db.update(db.orderTable)
              ..where((t) => t.uuid.equals(existing.uuid)))
            .write(const OrderTableCompanion(isSynced: Value(false)));
      }
    });
  }
}
