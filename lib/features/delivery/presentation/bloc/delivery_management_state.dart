import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:savvy_pos/features/delivery/domain/entities/delivery_order.dart';

part 'delivery_management_state.freezed.dart';

@freezed
class DeliveryManagementState with _$DeliveryManagementState {
  const factory DeliveryManagementState({
    @Default([]) List<DeliveryOrder> pendingOrders,
    @Default([]) List<DeliveryOrder> activeOrders, // Accepted but not finished
    @Default(false) bool isAutoAcceptEnabled,
    DeliveryOrder? lastReceivedOrder, // Transient state to trigger UI overlay
    @Default(false) bool isLoading,
    String? error,
  }) = _DeliveryManagementState;
}
