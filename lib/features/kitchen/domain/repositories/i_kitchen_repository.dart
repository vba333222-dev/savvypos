import 'package:savvy_pos/features/kitchen/domain/entities/kitchen_order.dart';

abstract class IKitchenRepository {
  Stream<List<KitchenOrder>> getActiveKitchenOrders();
  Future<void> markOrderFulfilled(String orderUuid);
  /// Marks a single line-item as cooked. Triggered by double-tap gesture.
  Future<void> markItemFulfilled(String itemUuid);
  /// Bumps order to "started/prep" status. Triggered by swipe-right gesture.
  Future<void> markOrderStarted(String orderUuid);
}

