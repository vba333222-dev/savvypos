import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:savvy_pos/core/database/database.dart';
import 'package:savvy_pos/features/history/domain/repositories/i_order_repository.dart';

part 'kitchen_bloc.freezed.dart';

@freezed
class KitchenEvent with _$KitchenEvent {
  const factory KitchenEvent.startMonitoring() = _StartMonitoring;
  const factory KitchenEvent.markFulfilled(String orderUuid) = _MarkFulfilled;
  const factory KitchenEvent.ordersUpdated(List<OrderTableData> orders) = _OrdersUpdated;
}

@freezed
class KitchenState with _$KitchenState {
  const factory KitchenState.initial() = _Initial;
  const factory KitchenState.loading() = _Loading;
  const factory KitchenState.loaded(List<OrderTableData> orders) = _Loaded;
  const factory KitchenState.error(String message) = _Error;
}

@injectable
class KitchenBloc extends Bloc<KitchenEvent, KitchenState> {
  final IOrderRepository _repository;
  StreamSubscription<List<OrderTableData>>? _subscription;

  KitchenBloc(this._repository) : super(const KitchenState.initial()) {
    on<_StartMonitoring>(_onStartMonitoring);
    on<_MarkFulfilled>(_onMarkFulfilled);
    on<_OrdersUpdated>((event, emit) => emit(KitchenState.loaded(event.orders)));
  }

  Future<void> _onStartMonitoring(_StartMonitoring event, Emitter<KitchenState> emit) async {
    emit(const KitchenState.loading());
    await _subscription?.cancel();
    _subscription = _repository.watchKitchenOrders().listen((orders) {
      add(KitchenEvent.ordersUpdated(orders));
    }, onError: (e) {
      // emit error? difficult from outside.
      // We could add error event, but for now log it.
    });
  }

  Future<void> _onMarkFulfilled(_MarkFulfilled event, Emitter<KitchenState> emit) async {
    try {
      await _repository.markOrderFulfilled(event.orderUuid);
    } catch (e) {
       // emit error or snackbar logic?
       // For KDS, rapid fire, ignoring error visually might be ok, but ideally show toast.
       // Current state is Loaded, we prefer not to switch to Error to replace list.
    }
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}
