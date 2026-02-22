import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:savvy_pos/features/cash/domain/entities/cash_drawer_entities.dart';
import 'package:savvy_pos/features/cash/domain/repositories/i_cash_drawer_repository.dart';
import 'package:savvy_pos/features/cash/domain/usecases/cash_usecases.dart';

part 'cash_management_bloc.freezed.dart';

@freezed
class CashManagementEvent with _$CashManagementEvent {
  const factory CashManagementEvent.started(String shiftUuid) = _Started;
  const factory CashManagementEvent.openDrawer(double amount) = _OpenDrawer;
  const factory CashManagementEvent.cashDrop(double amount, String reason) =
      _CashDrop;
  const factory CashManagementEvent.closeShift(double actualBalance) =
      _CloseShift;
  const factory CashManagementEvent.toggleBalanceVisibility() =
      _ToggleBalanceVisibility;
}

@freezed
class CashManagementState with _$CashManagementState {
  const factory CashManagementState({
    required String shiftUuid,
    CashDrawer? currentDrawer,
    CashDrawerSummary? summary,
    @Default(false) bool isLoading,
    @Default(false) bool isBalanceVisible,
    String? errorMessage,
    @Default(false) bool isShiftClosed, // Success flag
  }) = _CashManagementState;
}

@injectable
class CashManagementBloc
    extends Bloc<CashManagementEvent, CashManagementState> {
  final StartShiftUseCase _startShift;
  final CloseShiftUseCase _closeShift;
  final CashDropUseCase _cashDrop;
  final GetShiftReportUseCase _getReport;

  // We need a repository getter to fetch initial drawer or we do it via UseCase.
  // Assuming we use 'CheckDrawerStatusUseCase' or similar.
  // For MVP: We will use `_getReport` if drawer is open, or rely on passed state.
  // Actually, we need to KNOW if drawer is open.
  // Let's inject Repository directly for 'getCurrentDrawer' since its a simple query,
  // or add a UseCase. Adding UseCase is cleaner but for speed, I'll update UseCase file or use repo.
  // Updated plan: I'll use repository via UseCase if possible, or direct if read-only.
  // Let's stick to UseCase pattern. I'll add `GetCurrentDrawerUseCase`.

  final ICashDrawerRepository
      _repository; // Pragmatic choice for "GetCurrent" and "Events"

  CashManagementBloc(
    this._startShift,
    this._closeShift,
    this._cashDrop,
    this._getReport,
    this._repository,
  ) : super(const CashManagementState(shiftUuid: '')) {
    on<_Started>(_onStarted);
    on<_OpenDrawer>(_onOpenDrawer);
    on<_CashDrop>(_onCashDrop);
    on<_CloseShift>(_onCloseShift);
    on<_ToggleBalanceVisibility>((_, emit) =>
        emit(state.copyWith(isBalanceVisible: !state.isBalanceVisible)));
  }

  Future<void> _onStarted(
      _Started event, Emitter<CashManagementState> emit) async {
    emit(state.copyWith(isLoading: true, shiftUuid: event.shiftUuid));
    try {
      final drawer = await _repository.getCurrentDrawer(event.shiftUuid);
      if (drawer != null) {
        final summary = await _getReport(drawer.id);
        emit(state.copyWith(
            isLoading: false, currentDrawer: drawer, summary: summary));
      } else {
        emit(state.copyWith(isLoading: false));
      }
    } catch (e) {
      emit(state.copyWith(isLoading: false, errorMessage: e.toString()));
    }
  }

  Future<void> _onOpenDrawer(
      _OpenDrawer event, Emitter<CashManagementState> emit) async {
    emit(state.copyWith(isLoading: true));
    try {
      // Mock Employee Info (In real app, get from AuthBloc)
      final drawer = await _startShift(
          shiftUuid: state.shiftUuid,
          employeeUuid: 'EMP-001',
          employeeName: 'Manager',
          startingCash: event.amount);
      final summary = await _getReport(drawer.id);
      emit(state.copyWith(
          isLoading: false, currentDrawer: drawer, summary: summary));
    } catch (e) {
      emit(state.copyWith(isLoading: false, errorMessage: e.toString()));
    }
  }

  Future<void> _onCashDrop(
      _CashDrop event, Emitter<CashManagementState> emit) async {
    if (state.currentDrawer == null) return;
    emit(state.copyWith(isLoading: true));
    try {
      await _cashDrop(
          drawerUuid: state.currentDrawer!.id,
          amount: event.amount,
          reason: event.reason);
      // Refresh Summary
      final summary = await _getReport(state.currentDrawer!.id);
      final drawer = await _repository
          .getCurrentDrawer(state.shiftUuid); // Refresh drawer balances
      emit(state.copyWith(
          isLoading: false, summary: summary, currentDrawer: drawer));
    } catch (e) {
      emit(state.copyWith(isLoading: false, errorMessage: e.toString()));
    }
  }

  Future<void> _onCloseShift(
      _CloseShift event, Emitter<CashManagementState> emit) async {
    if (state.currentDrawer == null) return;
    emit(state.copyWith(isLoading: true));
    try {
      await _closeShift(
          drawerUuid: state.currentDrawer!.id,
          actualClosingBalance: event.actualBalance);
      emit(state.copyWith(isLoading: false, isShiftClosed: true));
    } catch (e) {
      emit(state.copyWith(isLoading: false, errorMessage: e.toString()));
    }
  }
}
