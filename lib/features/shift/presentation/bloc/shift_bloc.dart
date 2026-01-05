import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:savvy_pos/core/database/database.dart';
import 'package:savvy_pos/features/shift/domain/repositories/i_shift_repository.dart';

part 'shift_bloc.freezed.dart';

@freezed
class ShiftEvent with _$ShiftEvent {
  const factory ShiftEvent.checkStatus() = _CheckStatus;
  const factory ShiftEvent.openShift(double startCash) = _OpenShift;
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
      await _repository.openShift(event.startCash, 'STAFF-001', 'Admin Cashier');
      add(const ShiftEvent.checkStatus());
    } catch (e) {
      emit(ShiftState.error(e.toString()));
    }
  }

  Future<void> _onCloseShift(_CloseShift event, Emitter<ShiftState> emit) async {
    final currentState = state;
    if (currentState is! _Open) return;

    emit(const ShiftState.loading());
    try {
      await _repository.closeShift(currentState.shift.uuid, event.actualCash);
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
