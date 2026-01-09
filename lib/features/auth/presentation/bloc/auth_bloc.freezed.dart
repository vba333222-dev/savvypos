// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AuthEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String pin) loginWithPin,
    required TResult Function() logout,
    required TResult Function() checkSession,
    required TResult Function(String outletId, String warehouseId)
        changeActiveOutlet,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String pin)? loginWithPin,
    TResult? Function()? logout,
    TResult? Function()? checkSession,
    TResult? Function(String outletId, String warehouseId)? changeActiveOutlet,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String pin)? loginWithPin,
    TResult Function()? logout,
    TResult Function()? checkSession,
    TResult Function(String outletId, String warehouseId)? changeActiveOutlet,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoginWithPin value) loginWithPin,
    required TResult Function(_Logout value) logout,
    required TResult Function(_CheckSession value) checkSession,
    required TResult Function(_ChangeActiveOutlet value) changeActiveOutlet,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoginWithPin value)? loginWithPin,
    TResult? Function(_Logout value)? logout,
    TResult? Function(_CheckSession value)? checkSession,
    TResult? Function(_ChangeActiveOutlet value)? changeActiveOutlet,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoginWithPin value)? loginWithPin,
    TResult Function(_Logout value)? logout,
    TResult Function(_CheckSession value)? checkSession,
    TResult Function(_ChangeActiveOutlet value)? changeActiveOutlet,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthEventCopyWith<$Res> {
  factory $AuthEventCopyWith(AuthEvent value, $Res Function(AuthEvent) then) =
      _$AuthEventCopyWithImpl<$Res, AuthEvent>;
}

/// @nodoc
class _$AuthEventCopyWithImpl<$Res, $Val extends AuthEvent>
    implements $AuthEventCopyWith<$Res> {
  _$AuthEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$LoginWithPinImplCopyWith<$Res> {
  factory _$$LoginWithPinImplCopyWith(
          _$LoginWithPinImpl value, $Res Function(_$LoginWithPinImpl) then) =
      __$$LoginWithPinImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String pin});
}

/// @nodoc
class __$$LoginWithPinImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$LoginWithPinImpl>
    implements _$$LoginWithPinImplCopyWith<$Res> {
  __$$LoginWithPinImplCopyWithImpl(
      _$LoginWithPinImpl _value, $Res Function(_$LoginWithPinImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pin = null,
  }) {
    return _then(_$LoginWithPinImpl(
      null == pin
          ? _value.pin
          : pin // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$LoginWithPinImpl implements _LoginWithPin {
  const _$LoginWithPinImpl(this.pin);

  @override
  final String pin;

  @override
  String toString() {
    return 'AuthEvent.loginWithPin(pin: $pin)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginWithPinImpl &&
            (identical(other.pin, pin) || other.pin == pin));
  }

  @override
  int get hashCode => Object.hash(runtimeType, pin);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginWithPinImplCopyWith<_$LoginWithPinImpl> get copyWith =>
      __$$LoginWithPinImplCopyWithImpl<_$LoginWithPinImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String pin) loginWithPin,
    required TResult Function() logout,
    required TResult Function() checkSession,
    required TResult Function(String outletId, String warehouseId)
        changeActiveOutlet,
  }) {
    return loginWithPin(pin);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String pin)? loginWithPin,
    TResult? Function()? logout,
    TResult? Function()? checkSession,
    TResult? Function(String outletId, String warehouseId)? changeActiveOutlet,
  }) {
    return loginWithPin?.call(pin);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String pin)? loginWithPin,
    TResult Function()? logout,
    TResult Function()? checkSession,
    TResult Function(String outletId, String warehouseId)? changeActiveOutlet,
    required TResult orElse(),
  }) {
    if (loginWithPin != null) {
      return loginWithPin(pin);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoginWithPin value) loginWithPin,
    required TResult Function(_Logout value) logout,
    required TResult Function(_CheckSession value) checkSession,
    required TResult Function(_ChangeActiveOutlet value) changeActiveOutlet,
  }) {
    return loginWithPin(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoginWithPin value)? loginWithPin,
    TResult? Function(_Logout value)? logout,
    TResult? Function(_CheckSession value)? checkSession,
    TResult? Function(_ChangeActiveOutlet value)? changeActiveOutlet,
  }) {
    return loginWithPin?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoginWithPin value)? loginWithPin,
    TResult Function(_Logout value)? logout,
    TResult Function(_CheckSession value)? checkSession,
    TResult Function(_ChangeActiveOutlet value)? changeActiveOutlet,
    required TResult orElse(),
  }) {
    if (loginWithPin != null) {
      return loginWithPin(this);
    }
    return orElse();
  }
}

abstract class _LoginWithPin implements AuthEvent {
  const factory _LoginWithPin(final String pin) = _$LoginWithPinImpl;

  String get pin;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoginWithPinImplCopyWith<_$LoginWithPinImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LogoutImplCopyWith<$Res> {
  factory _$$LogoutImplCopyWith(
          _$LogoutImpl value, $Res Function(_$LogoutImpl) then) =
      __$$LogoutImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LogoutImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$LogoutImpl>
    implements _$$LogoutImplCopyWith<$Res> {
  __$$LogoutImplCopyWithImpl(
      _$LogoutImpl _value, $Res Function(_$LogoutImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LogoutImpl implements _Logout {
  const _$LogoutImpl();

  @override
  String toString() {
    return 'AuthEvent.logout()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LogoutImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String pin) loginWithPin,
    required TResult Function() logout,
    required TResult Function() checkSession,
    required TResult Function(String outletId, String warehouseId)
        changeActiveOutlet,
  }) {
    return logout();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String pin)? loginWithPin,
    TResult? Function()? logout,
    TResult? Function()? checkSession,
    TResult? Function(String outletId, String warehouseId)? changeActiveOutlet,
  }) {
    return logout?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String pin)? loginWithPin,
    TResult Function()? logout,
    TResult Function()? checkSession,
    TResult Function(String outletId, String warehouseId)? changeActiveOutlet,
    required TResult orElse(),
  }) {
    if (logout != null) {
      return logout();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoginWithPin value) loginWithPin,
    required TResult Function(_Logout value) logout,
    required TResult Function(_CheckSession value) checkSession,
    required TResult Function(_ChangeActiveOutlet value) changeActiveOutlet,
  }) {
    return logout(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoginWithPin value)? loginWithPin,
    TResult? Function(_Logout value)? logout,
    TResult? Function(_CheckSession value)? checkSession,
    TResult? Function(_ChangeActiveOutlet value)? changeActiveOutlet,
  }) {
    return logout?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoginWithPin value)? loginWithPin,
    TResult Function(_Logout value)? logout,
    TResult Function(_CheckSession value)? checkSession,
    TResult Function(_ChangeActiveOutlet value)? changeActiveOutlet,
    required TResult orElse(),
  }) {
    if (logout != null) {
      return logout(this);
    }
    return orElse();
  }
}

abstract class _Logout implements AuthEvent {
  const factory _Logout() = _$LogoutImpl;
}

/// @nodoc
abstract class _$$CheckSessionImplCopyWith<$Res> {
  factory _$$CheckSessionImplCopyWith(
          _$CheckSessionImpl value, $Res Function(_$CheckSessionImpl) then) =
      __$$CheckSessionImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CheckSessionImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$CheckSessionImpl>
    implements _$$CheckSessionImplCopyWith<$Res> {
  __$$CheckSessionImplCopyWithImpl(
      _$CheckSessionImpl _value, $Res Function(_$CheckSessionImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$CheckSessionImpl implements _CheckSession {
  const _$CheckSessionImpl();

  @override
  String toString() {
    return 'AuthEvent.checkSession()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$CheckSessionImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String pin) loginWithPin,
    required TResult Function() logout,
    required TResult Function() checkSession,
    required TResult Function(String outletId, String warehouseId)
        changeActiveOutlet,
  }) {
    return checkSession();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String pin)? loginWithPin,
    TResult? Function()? logout,
    TResult? Function()? checkSession,
    TResult? Function(String outletId, String warehouseId)? changeActiveOutlet,
  }) {
    return checkSession?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String pin)? loginWithPin,
    TResult Function()? logout,
    TResult Function()? checkSession,
    TResult Function(String outletId, String warehouseId)? changeActiveOutlet,
    required TResult orElse(),
  }) {
    if (checkSession != null) {
      return checkSession();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoginWithPin value) loginWithPin,
    required TResult Function(_Logout value) logout,
    required TResult Function(_CheckSession value) checkSession,
    required TResult Function(_ChangeActiveOutlet value) changeActiveOutlet,
  }) {
    return checkSession(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoginWithPin value)? loginWithPin,
    TResult? Function(_Logout value)? logout,
    TResult? Function(_CheckSession value)? checkSession,
    TResult? Function(_ChangeActiveOutlet value)? changeActiveOutlet,
  }) {
    return checkSession?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoginWithPin value)? loginWithPin,
    TResult Function(_Logout value)? logout,
    TResult Function(_CheckSession value)? checkSession,
    TResult Function(_ChangeActiveOutlet value)? changeActiveOutlet,
    required TResult orElse(),
  }) {
    if (checkSession != null) {
      return checkSession(this);
    }
    return orElse();
  }
}

abstract class _CheckSession implements AuthEvent {
  const factory _CheckSession() = _$CheckSessionImpl;
}

/// @nodoc
abstract class _$$ChangeActiveOutletImplCopyWith<$Res> {
  factory _$$ChangeActiveOutletImplCopyWith(_$ChangeActiveOutletImpl value,
          $Res Function(_$ChangeActiveOutletImpl) then) =
      __$$ChangeActiveOutletImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String outletId, String warehouseId});
}

/// @nodoc
class __$$ChangeActiveOutletImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$ChangeActiveOutletImpl>
    implements _$$ChangeActiveOutletImplCopyWith<$Res> {
  __$$ChangeActiveOutletImplCopyWithImpl(_$ChangeActiveOutletImpl _value,
      $Res Function(_$ChangeActiveOutletImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? outletId = null,
    Object? warehouseId = null,
  }) {
    return _then(_$ChangeActiveOutletImpl(
      null == outletId
          ? _value.outletId
          : outletId // ignore: cast_nullable_to_non_nullable
              as String,
      null == warehouseId
          ? _value.warehouseId
          : warehouseId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ChangeActiveOutletImpl implements _ChangeActiveOutlet {
  const _$ChangeActiveOutletImpl(this.outletId, this.warehouseId);

  @override
  final String outletId;
  @override
  final String warehouseId;

  @override
  String toString() {
    return 'AuthEvent.changeActiveOutlet(outletId: $outletId, warehouseId: $warehouseId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChangeActiveOutletImpl &&
            (identical(other.outletId, outletId) ||
                other.outletId == outletId) &&
            (identical(other.warehouseId, warehouseId) ||
                other.warehouseId == warehouseId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, outletId, warehouseId);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChangeActiveOutletImplCopyWith<_$ChangeActiveOutletImpl> get copyWith =>
      __$$ChangeActiveOutletImplCopyWithImpl<_$ChangeActiveOutletImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String pin) loginWithPin,
    required TResult Function() logout,
    required TResult Function() checkSession,
    required TResult Function(String outletId, String warehouseId)
        changeActiveOutlet,
  }) {
    return changeActiveOutlet(outletId, warehouseId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String pin)? loginWithPin,
    TResult? Function()? logout,
    TResult? Function()? checkSession,
    TResult? Function(String outletId, String warehouseId)? changeActiveOutlet,
  }) {
    return changeActiveOutlet?.call(outletId, warehouseId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String pin)? loginWithPin,
    TResult Function()? logout,
    TResult Function()? checkSession,
    TResult Function(String outletId, String warehouseId)? changeActiveOutlet,
    required TResult orElse(),
  }) {
    if (changeActiveOutlet != null) {
      return changeActiveOutlet(outletId, warehouseId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoginWithPin value) loginWithPin,
    required TResult Function(_Logout value) logout,
    required TResult Function(_CheckSession value) checkSession,
    required TResult Function(_ChangeActiveOutlet value) changeActiveOutlet,
  }) {
    return changeActiveOutlet(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoginWithPin value)? loginWithPin,
    TResult? Function(_Logout value)? logout,
    TResult? Function(_CheckSession value)? checkSession,
    TResult? Function(_ChangeActiveOutlet value)? changeActiveOutlet,
  }) {
    return changeActiveOutlet?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoginWithPin value)? loginWithPin,
    TResult Function(_Logout value)? logout,
    TResult Function(_CheckSession value)? checkSession,
    TResult Function(_ChangeActiveOutlet value)? changeActiveOutlet,
    required TResult orElse(),
  }) {
    if (changeActiveOutlet != null) {
      return changeActiveOutlet(this);
    }
    return orElse();
  }
}

abstract class _ChangeActiveOutlet implements AuthEvent {
  const factory _ChangeActiveOutlet(
          final String outletId, final String warehouseId) =
      _$ChangeActiveOutletImpl;

  String get outletId;
  String get warehouseId;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChangeActiveOutletImplCopyWith<_$ChangeActiveOutletImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$AuthState {
  EmployeeTableData? get employee => throw _privateConstructorUsedError;
  String? get activeOutletId => throw _privateConstructorUsedError;
  String? get activeWarehouseId => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AuthStateCopyWith<AuthState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthStateCopyWith<$Res> {
  factory $AuthStateCopyWith(AuthState value, $Res Function(AuthState) then) =
      _$AuthStateCopyWithImpl<$Res, AuthState>;
  @useResult
  $Res call(
      {EmployeeTableData? employee,
      String? activeOutletId,
      String? activeWarehouseId,
      bool isLoading,
      String? error});
}

/// @nodoc
class _$AuthStateCopyWithImpl<$Res, $Val extends AuthState>
    implements $AuthStateCopyWith<$Res> {
  _$AuthStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? employee = freezed,
    Object? activeOutletId = freezed,
    Object? activeWarehouseId = freezed,
    Object? isLoading = null,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      employee: freezed == employee
          ? _value.employee
          : employee // ignore: cast_nullable_to_non_nullable
              as EmployeeTableData?,
      activeOutletId: freezed == activeOutletId
          ? _value.activeOutletId
          : activeOutletId // ignore: cast_nullable_to_non_nullable
              as String?,
      activeWarehouseId: freezed == activeWarehouseId
          ? _value.activeWarehouseId
          : activeWarehouseId // ignore: cast_nullable_to_non_nullable
              as String?,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AuthStateImplCopyWith<$Res>
    implements $AuthStateCopyWith<$Res> {
  factory _$$AuthStateImplCopyWith(
          _$AuthStateImpl value, $Res Function(_$AuthStateImpl) then) =
      __$$AuthStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {EmployeeTableData? employee,
      String? activeOutletId,
      String? activeWarehouseId,
      bool isLoading,
      String? error});
}

/// @nodoc
class __$$AuthStateImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$AuthStateImpl>
    implements _$$AuthStateImplCopyWith<$Res> {
  __$$AuthStateImplCopyWithImpl(
      _$AuthStateImpl _value, $Res Function(_$AuthStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? employee = freezed,
    Object? activeOutletId = freezed,
    Object? activeWarehouseId = freezed,
    Object? isLoading = null,
    Object? error = freezed,
  }) {
    return _then(_$AuthStateImpl(
      employee: freezed == employee
          ? _value.employee
          : employee // ignore: cast_nullable_to_non_nullable
              as EmployeeTableData?,
      activeOutletId: freezed == activeOutletId
          ? _value.activeOutletId
          : activeOutletId // ignore: cast_nullable_to_non_nullable
              as String?,
      activeWarehouseId: freezed == activeWarehouseId
          ? _value.activeWarehouseId
          : activeWarehouseId // ignore: cast_nullable_to_non_nullable
              as String?,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$AuthStateImpl implements _AuthState {
  const _$AuthStateImpl(
      {this.employee,
      this.activeOutletId,
      this.activeWarehouseId,
      this.isLoading = false,
      this.error});

  @override
  final EmployeeTableData? employee;
  @override
  final String? activeOutletId;
  @override
  final String? activeWarehouseId;
  @override
  @JsonKey()
  final bool isLoading;
  @override
  final String? error;

  @override
  String toString() {
    return 'AuthState(employee: $employee, activeOutletId: $activeOutletId, activeWarehouseId: $activeWarehouseId, isLoading: $isLoading, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthStateImpl &&
            const DeepCollectionEquality().equals(other.employee, employee) &&
            (identical(other.activeOutletId, activeOutletId) ||
                other.activeOutletId == activeOutletId) &&
            (identical(other.activeWarehouseId, activeWarehouseId) ||
                other.activeWarehouseId == activeWarehouseId) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(employee),
      activeOutletId,
      activeWarehouseId,
      isLoading,
      error);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthStateImplCopyWith<_$AuthStateImpl> get copyWith =>
      __$$AuthStateImplCopyWithImpl<_$AuthStateImpl>(this, _$identity);
}

abstract class _AuthState implements AuthState {
  const factory _AuthState(
      {final EmployeeTableData? employee,
      final String? activeOutletId,
      final String? activeWarehouseId,
      final bool isLoading,
      final String? error}) = _$AuthStateImpl;

  @override
  EmployeeTableData? get employee;
  @override
  String? get activeOutletId;
  @override
  String? get activeWarehouseId;
  @override
  bool get isLoading;
  @override
  String? get error;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AuthStateImplCopyWith<_$AuthStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
