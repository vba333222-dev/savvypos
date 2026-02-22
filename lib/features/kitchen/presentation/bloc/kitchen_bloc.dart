import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:savvy_pos/features/auth/domain/repositories/i_tenant_repository.dart';
import 'package:savvy_pos/features/kitchen/domain/entities/kitchen_order.dart';
import 'package:savvy_pos/features/kitchen/domain/repositories/i_kitchen_repository.dart';

part 'kitchen_bloc.freezed.dart';

@freezed
class KitchenEvent with _$KitchenEvent {
  const factory KitchenEvent.startListening() = _StartListening;
  const factory KitchenEvent.ordersUpdated(List<KitchenOrder> orders) =
      _OrdersUpdated;
  const factory KitchenEvent.markAsDone(String orderUuid) = _MarkAsDone;

  /// Per-item done: marks one line-item as cooked (double-tap gesture)
  const factory KitchenEvent.markItemDone(String itemUuid) = _MarkItemDone;

  /// Bumps order status to "started" (swipe-right gesture confirmation)
  const factory KitchenEvent.markOrderStarted(String orderUuid) =
      _MarkOrderStarted;
  const factory KitchenEvent.resetAndReload() = _ResetAndReload;
}

@freezed
class KitchenState with _$KitchenState {
  const factory KitchenState.initial() = _Initial;
  const factory KitchenState.loading() = _Loading;
  const factory KitchenState.loaded(List<KitchenOrder> orders) = _Loaded;
  const factory KitchenState.error(String message) = _Error;
}

@injectable
class KitchenBloc extends Bloc<KitchenEvent, KitchenState> {
  final IKitchenRepository _repository;
  final ITenantRepository _tenantRepo;
  StreamSubscription<List<KitchenOrder>>? _subscription;
  StreamSubscription? _outletChangeSubscription;

  KitchenBloc(this._repository, this._tenantRepo)
      : super(const KitchenState.initial()) {
    _outletChangeSubscription = _tenantRepo.onOutletChanged.listen((_) {
      add(const KitchenEvent.resetAndReload());
    });

    on<_StartListening>(_onStartListening);
    on<_OrdersUpdated>(_onOrdersUpdated);
    on<_MarkAsDone>(_onMarkAsDone);
    on<_MarkItemDone>(_onMarkItemDone);
    on<_MarkOrderStarted>(_onMarkOrderStarted);
    on<_ResetAndReload>(_onResetAndReload);
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    _outletChangeSubscription?.cancel();
    return super.close();
  }

  Future<void> _onResetAndReload(
      _ResetAndReload event, Emitter<KitchenState> emit) async {
    // Drop all KDS arrays in UI RAM, fallback to Initial loading and re-subscribe
    emit(const KitchenState.initial());
    add(const KitchenEvent.startListening());
  }

  Future<void> _onStartListening(
      _StartListening event, Emitter<KitchenState> emit) async {
    emit(const KitchenState.loading());
    await _subscription?.cancel();
    _subscription = _repository.getActiveKitchenOrders().listen(
          (orders) => add(KitchenEvent.ordersUpdated(orders)),
          onError: (e) =>
              add(KitchenEvent.ordersUpdated([])), // Or handle error state?
        );
  }

  Future<void> _onOrdersUpdated(
      _OrdersUpdated event, Emitter<KitchenState> emit) async {
    emit(KitchenState.loaded(event.orders));
  }

  Future<void> _onMarkAsDone(
      _MarkAsDone event, Emitter<KitchenState> emit) async {
    try {
      await _repository.markOrderFulfilled(event.orderUuid);
    } catch (e) {
      // Non-blocking: snackbar side effect handled in UI
    }
  }

  Future<void> _onMarkItemDone(
      _MarkItemDone event, Emitter<KitchenState> emit) async {
    try {
      await _repository.markItemFulfilled(event.itemUuid);
    } catch (e) {
      // Non-blocking
    }
  }

  Future<void> _onMarkOrderStarted(
      _MarkOrderStarted event, Emitter<KitchenState> emit) async {
    try {
      await _repository.markOrderStarted(event.orderUuid);
    } catch (e) {
      // Non-blocking
    }
  }
}
