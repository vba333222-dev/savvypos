import 'package:savvy_pos/core/database/database.dart';

abstract class IOrderRepository {
  Stream<List<OrderTableData>> getOrders();
  Future<List<OrderItemTableData>> getOrderItems(String orderUuid);
}
