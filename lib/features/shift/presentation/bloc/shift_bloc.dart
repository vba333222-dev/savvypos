import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:savvy_pos/core/database/database.dart';
import 'package:savvy_pos/features/shift/domain/repositories/i_shift_repository.dart';

part 'shift_bloc.freezed.dart';

@freezed
class ShiftEvent with _$ShiftEvent {
  const factory ShiftEvent.checkStatus() = _CheckStatus;
  const factory ShiftEvent.openShift(double startCash, String userId, String userName) = _OpenShift;
  const factory ShiftEvent.closeShift(double actualCash) = _CloseShift;
  const factory ShiftEvent.payIn(double amount, String reason) = _PayIn;
  const factory ShiftEvent.payOut(double amount, String reason) = _PayOut;
}

@freezed
class ShiftState with _$ShiftState {
  const factory ShiftState.initial() = _Initial;
  const factory ShiftState.loading() = _Loading;
  const factory ShiftState.open(ShiftSessionTableData shift, {
    @Default(0.0) double totalPayIn,
    @Default(0.0) double totalPayOut,
  }) = _Open;
  const factory ShiftState.closed() = _Closed;
  const factory ShiftState.error(String message) = _Error;
}

@lazySingleton
class ShiftBloc extends Bloc<ShiftEvent, ShiftState> {
  final IShiftRepository _repository;

  ShiftBloc(this._repository) : super(const ShiftState.initial()) {
    on<_CheckStatus>(_onCheckStatus);
    on<_OpenShift>(_onOpenShift);
    on<_CloseShift>(_onCloseShift);
    on<_PayIn>(_onPayIn);
    on<_PayOut>(_onPayOut);
  }

  Future<void> _onCheckStatus(_CheckStatus event, Emitter<ShiftState> emit) async {
    emit(const ShiftState.loading());
    try {
      final shift = await _repository.getCurrentShift();
      if (shift != null) {
        // Load Details
        final summary = await _repository.getCashTransactionSummary(shift.uuid);
        emit(ShiftState.open(
          shift, 
          totalPayIn: summary['payIn'] ?? 0.0, 
          totalPayOut: summary['payOut'] ?? 0.0
        ));
      } else {
        emit(const ShiftState.closed());
      }
    } catch (e) {
      emit(ShiftState.error(e.toString()));
    }
  }

  Future<void> _onOpenShift(_OpenShift event, Emitter<ShiftState> emit) async {
    emit(const ShiftState.loading());
    try {
      // Hardcoded staff for now
      await _repository.openShift(event.startCash, event.userId, event.userName);
      add(const ShiftEvent.checkStatus());
    } catch (e) {
      emit(ShiftState.error(e.toString()));
    }
  }

  Future<void> _onCloseShift(_CloseShift event, Emitter<ShiftState> emit) async {
    final currentState = state;
    if (currentState is! _Open) return;

    try {
      // 1. Check Open Orders
      final openOrders = await _repository.getOpenOrderCount();
      if (openOrders > 0) {
        emit(ShiftState.error('Cannot close shift: $openOrders parked order(s) must be cleared first.'));
        // Re-emit open state to dismiss loading if we emitted it? 
        // We haven't emitted loading yet. 
        // But if error is terminal state, we lose the open state data.
        // Better to emit error then re-emit open? Or use distinct error state that holds data?
        // ShiftState.error is a replacement state.
        // For now, let's emit error. The UI should handle it (snackbar) and not navigate away.
        // Ideally, we emit error as Side Effect.
        // Changing state to Error will replace Open state, which might unmount UI.
        // Quick fix: emit Error, then re-emit Open logic?
        // Let's just emit Error. The UI should listen for Error.
        return;
      }

      emit(const ShiftState.loading());

      // 2. Calculate System Totals
      final summary = await _repository.getCashTransactionSummary(currentState.shift.uuid);
      final sales = await _repository.getShiftSalesTotal(currentState.shift.uuid);
      
      final startCash = currentState.shift.startCash;
      final payIn = summary['payIn'] ?? 0.0;
      final payOut = summary['payOut'] ?? 0.0;
      
      final systemEndCash = startCash + payIn - payOut + sales;

      await _repository.closeShift(currentState.shift.uuid, systemEndCash, event.actualCash);
      emit(const ShiftState.closed());
    } catch (e) {
      emit(ShiftState.error(e.toString()));
    }
  }

  Future<void> _onPayIn(_PayIn event, Emitter<ShiftState> emit) async {
    final currentState = state;
    if (currentState is! _Open) return;
    
    // Optimistic Update or Loading?
    // Let's just do logic -> fetch -> emit.
    try {
        await _repository.addCashTransaction(currentState.shift.uuid, 'PAY_IN', event.amount, event.reason);
        // Refresh
        add(const ShiftEvent.checkStatus());
    } catch (e) {
        emit(ShiftState.error(e.toString()));
    }
  }

  Future<void> _onPayOut(_PayOut event, Emitter<ShiftState> emit) async {
    final currentState = state;
    if (currentState is! _Open) return;
    
    try {
        await _repository.addCashTransaction(currentState.shift.uuid, 'PAY_OUT', event.amount, event.reason);
        // Refresh
        add(const ShiftEvent.checkStatus());
    } catch (e) {
        emit(ShiftState.error(e.toString()));
    }
  }
}
