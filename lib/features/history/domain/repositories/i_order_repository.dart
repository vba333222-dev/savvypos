import 'package:savvy_pos/core/database/database.dart';

abstract class IOrderRepository {
  Stream<List<OrderTableData>> getOrders();
  Future<List<OrderItemTableData>> getOrderItems(String orderUuid);
  Future<List<OrderTableData>> getOrdersByDateRange(
      DateTime start, DateTime end);

  // KDS
  Stream<List<OrderTableData>> watchKitchenOrders();
  Future<void> markOrderFulfilled(String uuid);

  // Sync / Offline-First
  Future<void> upsertOrderWithConflictResolution(OrderTableData remoteOrder);
}
