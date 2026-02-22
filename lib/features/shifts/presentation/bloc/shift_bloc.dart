import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:savvy_pos/features/shifts/domain/entities/shift_entities.dart';
import 'package:savvy_pos/features/shifts/domain/repositories/i_shift_repository.dart';
import 'package:savvy_pos/features/shifts/domain/usecases/calculate_eod_financials.dart';
import 'package:savvy_pos/features/integration/domain/usecases/sync_eod_to_accounting.dart';

part 'shift_bloc.freezed.dart';

@freezed
class ShiftEvent with _$ShiftEvent {
  const factory ShiftEvent.checkStatus() = _CheckStatus;
  const factory ShiftEvent.openShift(
      double startCash, String userId, String userName) = _OpenShift;
  const factory ShiftEvent.closeShift(double actualCash,
      {String? varianceReason}) = _CloseShift;
  const factory ShiftEvent.closeShiftWithEod(double actualCash,
      {String? varianceReason}) = _CloseShiftWithEod;
  const factory ShiftEvent.verifyCashCount(double actualCash) =
      _VerifyCashCount;
  const factory ShiftEvent.payIn(double amount, String reason) = _PayIn;
  const factory ShiftEvent.payOut(double amount, String reason) = _PayOut;
  const factory ShiftEvent.safeDrop(double amount, String reason) = _SafeDrop;
}

@freezed
class ShiftState with _$ShiftState {
  const factory ShiftState.initial() = _Initial;
  const factory ShiftState.loading() = _Loading;
  const factory ShiftState.open(
    ShiftSession shift, {
    @Default(0.0) double totalPayIn,
    @Default(0.0) double totalPayOut,
    @Default(0.0) double totalSafeDrops,
    @Default(0.0) double totalSales,
  }) = _Open;
  const factory ShiftState.varianceWarning(double variance, double actualCash) =
      _VarianceWarning;
  const factory ShiftState.closed() = _Closed;
  const factory ShiftState.syncingEod() = _SyncingEod;
  const factory ShiftState.syncSuccess() = _SyncSuccess;
  const factory ShiftState.error(String message) = _Error;
}

@lazySingleton
class ShiftBloc extends Bloc<ShiftEvent, ShiftState> {
  final IShiftRepository _repository;
  final CalculateEodFinancialsUseCase _calcEod;
  final SyncEodToAccountingUseCase _syncEod;

  ShiftBloc(this._repository, this._calcEod, this._syncEod)
      : super(const ShiftState.initial()) {
    on<_CheckStatus>(_onCheckStatus);
    on<_OpenShift>(_onOpenShift);
    on<_CloseShift>(_onCloseShift);
    on<_CloseShiftWithEod>(_onCloseShiftWithEod);
    on<_VerifyCashCount>(_onVerifyCashCount);
    on<_PayIn>(_onPayIn);
    on<_PayOut>(_onPayOut);
    on<_SafeDrop>(_onSafeDrop);
  }

  Future<void> _onCheckStatus(
      _CheckStatus event, Emitter<ShiftState> emit) async {
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
      await _repository.openCashShift(
          event.startCash, event.userId, event.userName);
      add(const ShiftEvent.checkStatus());
    } catch (e) {
      emit(ShiftState.error(e.toString()));
    }
  }

  Future<void> _onVerifyCashCount(
      _VerifyCashCount event, Emitter<ShiftState> emit) async {
    final currentState = state;
    if (currentState is! _Open) return;

    try {
      // 1. Check Open Orders
      final openOrders = await _repository.getOpenOrderCount();
      if (openOrders > 0) {
        emit(ShiftState.error(
            'Cannot close shift: $openOrders parked order(s) must be cleared first.'));
        return;
      }

      emit(const ShiftState.loading());

      // 2. Calculate System Totals
      final summary =
          await _repository.getCashTransactionSummary(currentState.shift.id);
      final sales = await _repository.getShiftSalesTotal(currentState.shift.id);

      final startCash = currentState.shift.startCash;
      final payIn = summary['payIn'] ?? 0.0;
      final payOut = summary['payOut'] ?? 0.0;
      final safeDrop = summary['safeDrop'] ?? 0.0;

      // Formula: Start + PayIn - PayOut - SafeDrop + Sales
      final expectedCash = startCash + payIn - payOut - safeDrop + sales;
      final variance = event.actualCash - expectedCash;

      if (variance.abs() > 0.01) {
        // Variance detected, ask for reason
        emit(ShiftState.varianceWarning(variance, event.actualCash));
        // We also need to emit Open again so the UI can stay in the "Open" state behind the dialog,
        // or the UI handles varianceWarning without losing the dialog context.
        // It's better to just emit varianceWarning and let the UI handle it.
      } else {
        // Perfect match
        add(ShiftEvent.closeShift(event.actualCash));
      }
    } catch (e) {
      emit(ShiftState.error(e.toString()));
    }
  }

  Future<void> _onCloseShift(
      _CloseShift event, Emitter<ShiftState> emit) async {
    // Re-calculating system totals just to be safe, but we know the actualCash
    // if this is called directly from verifyCashCount (0 variance) or after reason (has variance)

    // Check if we have an active shift ID (since state might be VarianceWarning)
    // Actually, state is no longer _Open if we came from VarianceWarning.
    // Let's modify approach: We should fetch active shift.

    try {
      emit(const ShiftState.loading());
      final activeShifts = await _repository.getActiveShifts();
      if (activeShifts.isEmpty) {
        emit(const ShiftState.error('No active shift found to close.'));
        return;
      }
      final shift = activeShifts.first;

      final summary = await _repository.getCashTransactionSummary(shift.id);
      final sales = await _repository.getShiftSalesTotal(shift.id);

      final startCash = shift.startCash;
      final payIn = summary['payIn'] ?? 0.0;
      final payOut = summary['payOut'] ?? 0.0;
      final safeDrop = summary['safeDrop'] ?? 0.0;

      final systemEndCash = startCash + payIn - payOut - safeDrop + sales;

      await _repository.closeShift(shift.id, systemEndCash, event.actualCash,
          varianceReason: event.varianceReason);
      emit(const ShiftState.closed());
    } catch (e) {
      emit(ShiftState.error(e.toString()));
    }
  }

  Future<void> _onCloseShiftWithEod(
      _CloseShiftWithEod event, Emitter<ShiftState> emit) async {
    try {
      emit(const ShiftState.loading());
      final activeShifts = await _repository.getActiveShifts();
      if (activeShifts.isEmpty) {
        emit(const ShiftState.error('No active shift found to close.'));
        return;
      }
      final shift = activeShifts.first;

      final summary = await _repository.getCashTransactionSummary(shift.id);
      final sales = await _repository.getShiftSalesTotal(shift.id);

      final startCash = shift.startCash;
      final payIn = summary['payIn'] ?? 0.0;
      final payOut = summary['payOut'] ?? 0.0;
      final safeDrop = summary['safeDrop'] ?? 0.0;

      final systemEndCash = startCash + payIn - payOut - safeDrop + sales;

      emit(const ShiftState.syncingEod());
      // Compile Financials
      final financials = await _calcEod(shift.startTime);

      // Dispatch API to Go Backend
      await _syncEod(shift.id, financials);
      emit(const ShiftState.syncSuccess());

      // Finally close locally
      await _repository.closeShift(shift.id, systemEndCash, event.actualCash,
          varianceReason: event.varianceReason);

      emit(const ShiftState.closed());
    } catch (e) {
      emit(ShiftState.error(e.toString()));
    }
  }

  Future<void> _onPayIn(_PayIn event, Emitter<ShiftState> emit) async {
    final currentState = state;
    if (currentState is! _Open) return;

    try {
      await _repository.addCashTransaction(
          currentState.shift.id, 'PAY_IN', event.amount, event.reason);
      add(const ShiftEvent.checkStatus());
    } catch (e) {
      emit(ShiftState.error(e.toString()));
    }
  }

  Future<void> _onPayOut(_PayOut event, Emitter<ShiftState> emit) async {
    final currentState = state;
    if (currentState is! _Open) return;

    try {
      await _repository.addCashTransaction(
          currentState.shift.id, 'PAY_OUT', event.amount, event.reason);
      add(const ShiftEvent.checkStatus());
    } catch (e) {
      emit(ShiftState.error(e.toString()));
    }
  }

  Future<void> _onSafeDrop(_SafeDrop event, Emitter<ShiftState> emit) async {
    final currentState = state;
    if (currentState is! _Open) return;

    try {
      await _repository.addCashTransaction(
          currentState.shift.id, 'SAFE_DROP', event.amount, event.reason);
      add(const ShiftEvent.checkStatus());
    } catch (e) {
      emit(ShiftState.error(e.toString()));
    }
  }
}
