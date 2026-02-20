import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:savvy_pos/features/shifts/domain/entities/shift_entities.dart';
import 'package:savvy_pos/features/shifts/domain/repositories/i_shift_repository.dart';

part 'shift_bloc.freezed.dart';

@freezed
class ShiftEvent with _$ShiftEvent {
  const factory ShiftEvent.checkStatus() = _CheckStatus;
  const factory ShiftEvent.openShift(double startCash, String userId, String userName) = _OpenShift;
  const factory ShiftEvent.closeShift(double actualCash) = _CloseShift;
  const factory ShiftEvent.payIn(double amount, String reason) = _PayIn;
  const factory ShiftEvent.payOut(double amount, String reason) = _PayOut;
  const factory ShiftEvent.safeDrop(double amount, String reason) = _SafeDrop;
}

@freezed
class ShiftState with _$ShiftState {
  const factory ShiftState.initial() = _Initial;
  const factory ShiftState.loading() = _Loading;
  const factory ShiftState.open(ShiftSession shift, {
    @Default(0.0) double totalPayIn,
    @Default(0.0) double totalPayOut,
    @Default(0.0) double totalSafeDrops,
    @Default(0.0) double totalSales,
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
    on<_SafeDrop>(_onSafeDrop);
  }

  Future<void> _onCheckStatus(_CheckStatus event, Emitter<ShiftState> emit) async {
    emit(const ShiftState.loading());
    try {
      // Find any active shift for this device context
      final activeShifts = await _repository.getActiveShifts();
      
      if (activeShifts.isNotEmpty) {
        final shift = activeShifts.first;
        // Load Details
        final summary = await _repository.getCashTransactionSummary(shift.id);
        final sales = await _repository.getShiftSalesTotal(shift.id);
        
        emit(ShiftState.open(
          shift, 
          totalPayIn: summary['payIn'] ?? 0.0, 
          totalPayOut: summary['payOut'] ?? 0.0,
          totalSafeDrops: summary['safeDrop'] ?? 0.0,
          totalSales: sales,
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
      await _repository.openCashShift(event.startCash, event.userId, event.userName);
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
        return;
      }

      emit(const ShiftState.loading());

      // 2. Calculate System Totals
      final summary = await _repository.getCashTransactionSummary(currentState.shift.id);
      final sales = await _repository.getShiftSalesTotal(currentState.shift.id);
      
      final startCash = currentState.shift.startCash;
      final payIn = summary['payIn'] ?? 0.0;
      final payOut = summary['payOut'] ?? 0.0;
      final safeDrop = summary['safeDrop'] ?? 0.0;
      
      // Formula: Start + PayIn - PayOut - SafeDrop + Sales
      final systemEndCash = startCash + payIn - payOut - safeDrop + sales;

      await _repository.closeShift(currentState.shift.id, systemEndCash, event.actualCash);
      emit(const ShiftState.closed());
    } catch (e) {
      emit(ShiftState.error(e.toString()));
    }
  }

  Future<void> _onPayIn(_PayIn event, Emitter<ShiftState> emit) async {
    final currentState = state;
    if (currentState is! _Open) return;
    
    try {
        await _repository.addCashTransaction(currentState.shift.id, 'PAY_IN', event.amount, event.reason);
        add(const ShiftEvent.checkStatus());
    } catch (e) {
        emit(ShiftState.error(e.toString()));
    }
  }

  Future<void> _onPayOut(_PayOut event, Emitter<ShiftState> emit) async {
    final currentState = state;
    if (currentState is! _Open) return;
    
    try {
        await _repository.addCashTransaction(currentState.shift.id, 'PAY_OUT', event.amount, event.reason);
        add(const ShiftEvent.checkStatus());
    } catch (e) {
        emit(ShiftState.error(e.toString()));
    }
  }

  Future<void> _onSafeDrop(_SafeDrop event, Emitter<ShiftState> emit) async {
    final currentState = state;
    if (currentState is! _Open) return;
    
    try {
        await _repository.addCashTransaction(currentState.shift.id, 'SAFE_DROP', event.amount, event.reason);
        add(const ShiftEvent.checkStatus());
    } catch (e) {
        emit(ShiftState.error(e.toString()));
    }
  }
}
