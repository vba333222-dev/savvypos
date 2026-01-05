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
          ..orderBy([(t) => OrderingTerm(expression: t.createdAt, mode: OrderingMode.desc)]))
        .watch();
  }

  @override
  Future<List<OrderItemTableData>> getOrderItems(String orderUuid) {
    return (db.select(db.orderItemTable)..where((t) => t.orderUuid.equals(orderUuid))).get();
  }
}
