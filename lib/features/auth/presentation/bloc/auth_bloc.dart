import 'package:bloc/bloc.dart';
import 'package:flutter/painting.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:savvy_pos/core/database/database.dart';
import 'package:savvy_pos/core/sync/sync_worker.dart';
import 'package:savvy_pos/features/auth/domain/repositories/i_tenant_repository.dart';

part 'auth_bloc.freezed.dart';

// Trigger rebuild

@freezed
class AuthEvent with _$AuthEvent {
  const factory AuthEvent.loginWithPin(String pin) = _LoginWithPin;
  const factory AuthEvent.logout() = _Logout;
  const factory AuthEvent.checkSession() = _CheckSession;
  const factory AuthEvent.changeActiveOutlet(
      String outletId, String warehouseId) = _ChangeActiveOutlet;
  const factory AuthEvent.appOutdated() = _AppOutdated;
}

@freezed
class AuthState with _$AuthState {
  const factory AuthState({
    EmployeeTableData? employee,
    String? activeOutletId,
    String? activeWarehouseId,
    @Default(false) bool isLoading,
    @Default(false) bool isOutdated,
    String? error,
  }) = _AuthState;
}

@lazySingleton
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AppDatabase db;
  final ITenantRepository _tenantRepo;

  AuthBloc(this.db, this._tenantRepo) : super(const AuthState()) {
    on<_LoginWithPin>(_onLoginWithPin);
    on<_Logout>(_onLogout);
    on<_CheckSession>(_onCheckSession);
    on<_ChangeActiveOutlet>(_onChangeActiveOutlet);
    on<_AppOutdated>(_onAppOutdated);
  }

  void _onAppOutdated(_AppOutdated event, Emitter<AuthState> emit) {
    emit(state.copyWith(isOutdated: true));
  }

  Future<void> _onLoginWithPin(
      _LoginWithPin event, Emitter<AuthState> emit) async {
    emit(state.copyWith(isLoading: true, error: null));
    try {
      final employee = await (db.select(db.employeeTable)
            ..where((tbl) => tbl.pin.equals(event.pin)))
          .getSingleOrNull();

      if (employee != null) {
        if (employee.isActive) {
          final prefs = await SharedPreferences.getInstance();
          await prefs.setString('auth_token', 'mock-token-123');
          await prefs.setString('tenant_id', 'default-tenant');

          // Load Active Scope
          final scope = await _tenantRepo.getActiveScope();

          try {
            await processSyncQueue(db, Logger());
          } catch (e) {
            Logger().w('Initial Sync failed: $e');
          }

          emit(state.copyWith(
            isLoading: false,
            employee: employee,
            activeOutletId: scope['outletId'],
            activeWarehouseId: scope['warehouseId'],
          ));
        } else {
          emit(state.copyWith(isLoading: false, error: 'Account is inactive'));
        }
      } else {
        emit(state.copyWith(isLoading: false, error: 'Invalid PIN'));
      }
    } catch (e) {
      emit(state.copyWith(isLoading: false, error: 'Login Failed: $e'));
    }
  }

  Future<void> _onLogout(_Logout event, Emitter<AuthState> emit) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('auth_token');
    await prefs.remove('tenant_id');
    await prefs.remove('last_synced_at');

    // ── Ultra-Strict Memory Wipe (Image Cache Flush) ──
    // Clears decoded image RAM to avoid memory leaks when changing shifts/users.
    PaintingBinding.instance.imageCache.clear();
    PaintingBinding.instance.imageCache.clearLiveImages();
    Logger().i('Image Cache cleared on Logout');

    emit(const AuthState());
  }

  Future<void> _onCheckSession(
      _CheckSession event, Emitter<AuthState> emit) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('auth_token');
    if (token != null) {
      final scope = await _tenantRepo.getActiveScope();
      emit(state.copyWith(
        activeOutletId: scope['outletId'],
        activeWarehouseId: scope['warehouseId'],
      ));
      // In real app, re-fetch employee profile here
    }
  }

  Future<void> _onChangeActiveOutlet(
      _ChangeActiveOutlet event, Emitter<AuthState> emit) async {
    emit(state.copyWith(isLoading: true));

    await _tenantRepo.saveActiveScope(event.outletId, event.warehouseId);

    // Trigger Sync for new scope
    try {
      await processSyncQueue(db, Logger());
    } catch (e) {
      Logger().w('Scope Switch Sync failed: $e');
    }

    emit(state.copyWith(
      isLoading: false,
      activeOutletId: event.outletId,
      activeWarehouseId: event.warehouseId,
    ));
  }
}
