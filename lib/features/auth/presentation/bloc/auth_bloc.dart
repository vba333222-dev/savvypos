import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:savvy_pos/core/database/database.dart';

part 'auth_bloc.freezed.dart';

@freezed
class AuthEvent with _$AuthEvent {
  const factory AuthEvent.loginWithPin(String pin) = _LoginWithPin;
  const factory AuthEvent.logout() = _Logout;
  const factory AuthEvent.checkSession() = _CheckSession;
}

@freezed
class AuthState with _$AuthState {
  const factory AuthState({
    EmployeeTableData? employee, // Updated from StaffTableData
    @Default(false) bool isLoading,
    String? error,
  }) = _AuthState;
}

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AppDatabase db;

  AuthBloc(this.db) : super(const AuthState()) {
    on<_LoginWithPin>(_onLoginWithPin);
    on<_Logout>(_onLogout);
    on<_CheckSession>(_onCheckSession);
  }

  Future<void> _onLoginWithPin(_LoginWithPin event, Emitter<AuthState> emit) async {
    emit(state.copyWith(isLoading: true, error: null));
    try {
      // Find employee by PIN
      final employee = await (db.select(db.employeeTable)..where((tbl) => tbl.pin.equals(event.pin))).getSingleOrNull();
      
      if (employee != null) {
        if (employee.isActive) {
           emit(state.copyWith(isLoading: false, employee: employee));
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
    emit(const AuthState());
  }
  
  Future<void> _onCheckSession(_CheckSession event, Emitter<AuthState> emit) async {
    // Stub
  }
}
