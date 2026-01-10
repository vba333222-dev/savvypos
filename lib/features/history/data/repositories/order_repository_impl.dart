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
      const OrderTableCompanion(isFulfilled: Value(true))
    );
  }
}
