import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:savvy_pos/features/delivery/domain/entities/delivery_order.dart';

part 'delivery_management_event.freezed.dart';

@freezed
class DeliveryManagementEvent with _$DeliveryManagementEvent {
  const factory DeliveryManagementEvent.incomingOrderReceived(
      DeliveryOrder order) = IncomingOrderReceived;
  const factory DeliveryManagementEvent.acceptOrder(String deliveryUuid) =
      AcceptOrder;
  const factory DeliveryManagementEvent.rejectOrder(
      String deliveryUuid, String reason) = RejectOrder;
  const factory DeliveryManagementEvent.toggleAutoAccept(bool isAuto) =
      ToggleAutoAccept;
  const factory DeliveryManagementEvent.loadPendingOrders() = LoadPendingOrders;
  const factory DeliveryManagementEvent.markOrderReady(String deliveryUuid) =
      MarkOrderReady;
  const factory DeliveryManagementEvent.completeOrder(String deliveryUuid) =
      CompleteOrder;
}
