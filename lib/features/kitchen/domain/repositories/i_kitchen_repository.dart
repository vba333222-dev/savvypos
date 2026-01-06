import 'package:savvy_pos/features/kitchen/domain/entities/kitchen_order.dart';

abstract class IKitchenRepository {
  Stream<List<KitchenOrder>> getActiveKitchenOrders();
  Future<void> markOrderFulfilled(String orderUuid);
}
