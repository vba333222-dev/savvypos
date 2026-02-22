import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:savvy_pos/core/utils/sound_helper.dart';
import 'package:savvy_pos/features/delivery/domain/repositories/i_delivery_repository.dart';
import 'package:savvy_pos/features/delivery/domain/entities/delivery_status.dart';

import 'delivery_management_event.dart';
import 'delivery_management_state.dart';

@injectable
class DeliveryManagementBloc
    extends Bloc<DeliveryManagementEvent, DeliveryManagementState> {
  final IDeliveryRepository _repository;
  final SoundHelper _soundHelper;

  DeliveryManagementBloc(this._repository, this._soundHelper)
      : super(const DeliveryManagementState()) {
    on<IncomingOrderReceived>(_onIncomingOrderReceived);
    on<AcceptOrder>(_onAcceptOrder);
    on<RejectOrder>(_onRejectOrder);
    on<ToggleAutoAccept>(_onToggleAutoAccept);
    on<LoadPendingOrders>(_onLoadPendingOrders);
    on<MarkOrderReady>(_onMarkOrderReady);
    on<CompleteOrder>(_onCompleteOrder);
  }

  Future<void> _onIncomingOrderReceived(IncomingOrderReceived event,
      Emitter<DeliveryManagementState> emit) async {
    // 1. Log or Store the order
    // In a real scenario, this is where we'd persist it to the local DB if not already done by socket service.

    if (state.isAutoAcceptEnabled) {
      // 2. Auto-Accept Flow
      await _repository.updateDeliveryStatus(
          event.order.deliveryUuid, DeliveryStatus.accepted.name);

      final updatedOrder =
          event.order.copyWith(status: DeliveryStatus.accepted);
      emit(state.copyWith(
        activeOrders: [...state.activeOrders, updatedOrder],
        lastReceivedOrder:
            updatedOrder, // Still trigger notification that it was accepted
      ));
      await _soundHelper.playSuccess(); // Success sound for auto-accept
    } else {
      // 3. Manual Review Flow
      emit(state.copyWith(
        pendingOrders: [...state.pendingOrders, event.order],
        lastReceivedOrder: event.order,
      ));

      // Ring the bell for cashier attention
      await _soundHelper.playIncomingOrderRing();
    }
  }

  Future<void> _onAcceptOrder(
      AcceptOrder event, Emitter<DeliveryManagementState> emit) async {
    try {
      emit(state.copyWith(isLoading: true));
      // Update DB
      await _repository.updateDeliveryStatus(
          event.deliveryUuid, DeliveryStatus.accepted.name);

      // Move from pending to active
      final order = state.pendingOrders
          .firstWhere((o) => o.deliveryUuid == event.deliveryUuid);
      final updatedOrder = order.copyWith(status: DeliveryStatus.accepted);

      final newPending = state.pendingOrders
          .where((o) => o.deliveryUuid != event.deliveryUuid)
          .toList();
      emit(state.copyWith(
        pendingOrders: newPending,
        activeOrders: [...state.activeOrders, updatedOrder],
        isLoading: false,
      ));
    } catch (e) {
      emit(state.copyWith(error: e.toString(), isLoading: false));
    }
  }

  Future<void> _onRejectOrder(
      RejectOrder event, Emitter<DeliveryManagementState> emit) async {
    try {
      emit(state.copyWith(isLoading: true));
      await _repository.updateDeliveryStatus(
          event.deliveryUuid, DeliveryStatus.cancelled.name);

      final newPending = state.pendingOrders
          .where((o) => o.deliveryUuid != event.deliveryUuid)
          .toList();
      emit(state.copyWith(pendingOrders: newPending, isLoading: false));
    } catch (e) {
      emit(state.copyWith(error: e.toString(), isLoading: false));
    }
  }

  void _onToggleAutoAccept(
      ToggleAutoAccept event, Emitter<DeliveryManagementState> emit) {
    emit(state.copyWith(isAutoAcceptEnabled: event.isAuto));
  }

  void _onLoadPendingOrders(
      LoadPendingOrders event, Emitter<DeliveryManagementState> emit) {
    // Intentionally left blank for MVP. In reality, fetch from DB where status is newUnaccepted.
  }

  Future<void> _onMarkOrderReady(
      MarkOrderReady event, Emitter<DeliveryManagementState> emit) async {
    try {
      emit(state.copyWith(isLoading: true));
      await _repository.updateDeliveryStatus(
          event.deliveryUuid, DeliveryStatus.readyForPickup.name);

      final updatedOrders = state.activeOrders.map((o) {
        if (o.deliveryUuid == event.deliveryUuid)
          return o.copyWith(status: DeliveryStatus.readyForPickup);
        return o;
      }).toList();

      emit(state.copyWith(activeOrders: updatedOrders, isLoading: false));
    } catch (e) {
      emit(state.copyWith(error: e.toString(), isLoading: false));
    }
  }

  Future<void> _onCompleteOrder(
      CompleteOrder event, Emitter<DeliveryManagementState> emit) async {
    try {
      emit(state.copyWith(isLoading: true));
      await _repository.updateDeliveryStatus(
          event.deliveryUuid, DeliveryStatus.pickedUp.name);

      // Remove from active orders once picked up
      final updatedOrders = state.activeOrders
          .where((o) => o.deliveryUuid != event.deliveryUuid)
          .toList();
      emit(state.copyWith(activeOrders: updatedOrders, isLoading: false));
    } catch (e) {
      emit(state.copyWith(error: e.toString(), isLoading: false));
    }
  }
}
