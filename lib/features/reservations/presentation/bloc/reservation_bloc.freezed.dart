// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reservation_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ReservationEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadReservations,
    required TResult Function(String name, String phone, int pax, DateTime time)
        addReservation,
    required TResult Function(String uuid, String status, String? tableUuid)
        updateStatus,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadReservations,
    TResult? Function(String name, String phone, int pax, DateTime time)?
        addReservation,
    TResult? Function(String uuid, String status, String? tableUuid)?
        updateStatus,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadReservations,
    TResult Function(String name, String phone, int pax, DateTime time)?
        addReservation,
    TResult Function(String uuid, String status, String? tableUuid)?
        updateStatus,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadReservations value) loadReservations,
    required TResult Function(_AddReservation value) addReservation,
    required TResult Function(_UpdateStatus value) updateStatus,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadReservations value)? loadReservations,
    TResult? Function(_AddReservation value)? addReservation,
    TResult? Function(_UpdateStatus value)? updateStatus,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadReservations value)? loadReservations,
    TResult Function(_AddReservation value)? addReservation,
    TResult Function(_UpdateStatus value)? updateStatus,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReservationEventCopyWith<$Res> {
  factory $ReservationEventCopyWith(
          ReservationEvent value, $Res Function(ReservationEvent) then) =
      _$ReservationEventCopyWithImpl<$Res, ReservationEvent>;
}

/// @nodoc
class _$ReservationEventCopyWithImpl<$Res, $Val extends ReservationEvent>
    implements $ReservationEventCopyWith<$Res> {
  _$ReservationEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ReservationEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$LoadReservationsImplCopyWith<$Res> {
  factory _$$LoadReservationsImplCopyWith(_$LoadReservationsImpl value,
          $Res Function(_$LoadReservationsImpl) then) =
      __$$LoadReservationsImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadReservationsImplCopyWithImpl<$Res>
    extends _$ReservationEventCopyWithImpl<$Res, _$LoadReservationsImpl>
    implements _$$LoadReservationsImplCopyWith<$Res> {
  __$$LoadReservationsImplCopyWithImpl(_$LoadReservationsImpl _value,
      $Res Function(_$LoadReservationsImpl) _then)
      : super(_value, _then);

  /// Create a copy of ReservationEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadReservationsImpl implements _LoadReservations {
  const _$LoadReservationsImpl();

  @override
  String toString() {
    return 'ReservationEvent.loadReservations()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadReservationsImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadReservations,
    required TResult Function(String name, String phone, int pax, DateTime time)
        addReservation,
    required TResult Function(String uuid, String status, String? tableUuid)
        updateStatus,
  }) {
    return loadReservations();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadReservations,
    TResult? Function(String name, String phone, int pax, DateTime time)?
        addReservation,
    TResult? Function(String uuid, String status, String? tableUuid)?
        updateStatus,
  }) {
    return loadReservations?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadReservations,
    TResult Function(String name, String phone, int pax, DateTime time)?
        addReservation,
    TResult Function(String uuid, String status, String? tableUuid)?
        updateStatus,
    required TResult orElse(),
  }) {
    if (loadReservations != null) {
      return loadReservations();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadReservations value) loadReservations,
    required TResult Function(_AddReservation value) addReservation,
    required TResult Function(_UpdateStatus value) updateStatus,
  }) {
    return loadReservations(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadReservations value)? loadReservations,
    TResult? Function(_AddReservation value)? addReservation,
    TResult? Function(_UpdateStatus value)? updateStatus,
  }) {
    return loadReservations?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadReservations value)? loadReservations,
    TResult Function(_AddReservation value)? addReservation,
    TResult Function(_UpdateStatus value)? updateStatus,
    required TResult orElse(),
  }) {
    if (loadReservations != null) {
      return loadReservations(this);
    }
    return orElse();
  }
}

abstract class _LoadReservations implements ReservationEvent {
  const factory _LoadReservations() = _$LoadReservationsImpl;
}

/// @nodoc
abstract class _$$AddReservationImplCopyWith<$Res> {
  factory _$$AddReservationImplCopyWith(_$AddReservationImpl value,
          $Res Function(_$AddReservationImpl) then) =
      __$$AddReservationImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String name, String phone, int pax, DateTime time});
}

/// @nodoc
class __$$AddReservationImplCopyWithImpl<$Res>
    extends _$ReservationEventCopyWithImpl<$Res, _$AddReservationImpl>
    implements _$$AddReservationImplCopyWith<$Res> {
  __$$AddReservationImplCopyWithImpl(
      _$AddReservationImpl _value, $Res Function(_$AddReservationImpl) _then)
      : super(_value, _then);

  /// Create a copy of ReservationEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? phone = null,
    Object? pax = null,
    Object? time = null,
  }) {
    return _then(_$AddReservationImpl(
      null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      null == pax
          ? _value.pax
          : pax // ignore: cast_nullable_to_non_nullable
              as int,
      null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$AddReservationImpl implements _AddReservation {
  const _$AddReservationImpl(this.name, this.phone, this.pax, this.time);

  @override
  final String name;
  @override
  final String phone;
  @override
  final int pax;
  @override
  final DateTime time;

  @override
  String toString() {
    return 'ReservationEvent.addReservation(name: $name, phone: $phone, pax: $pax, time: $time)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddReservationImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.pax, pax) || other.pax == pax) &&
            (identical(other.time, time) || other.time == time));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, phone, pax, time);

  /// Create a copy of ReservationEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AddReservationImplCopyWith<_$AddReservationImpl> get copyWith =>
      __$$AddReservationImplCopyWithImpl<_$AddReservationImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadReservations,
    required TResult Function(String name, String phone, int pax, DateTime time)
        addReservation,
    required TResult Function(String uuid, String status, String? tableUuid)
        updateStatus,
  }) {
    return addReservation(name, phone, pax, time);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadReservations,
    TResult? Function(String name, String phone, int pax, DateTime time)?
        addReservation,
    TResult? Function(String uuid, String status, String? tableUuid)?
        updateStatus,
  }) {
    return addReservation?.call(name, phone, pax, time);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadReservations,
    TResult Function(String name, String phone, int pax, DateTime time)?
        addReservation,
    TResult Function(String uuid, String status, String? tableUuid)?
        updateStatus,
    required TResult orElse(),
  }) {
    if (addReservation != null) {
      return addReservation(name, phone, pax, time);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadReservations value) loadReservations,
    required TResult Function(_AddReservation value) addReservation,
    required TResult Function(_UpdateStatus value) updateStatus,
  }) {
    return addReservation(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadReservations value)? loadReservations,
    TResult? Function(_AddReservation value)? addReservation,
    TResult? Function(_UpdateStatus value)? updateStatus,
  }) {
    return addReservation?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadReservations value)? loadReservations,
    TResult Function(_AddReservation value)? addReservation,
    TResult Function(_UpdateStatus value)? updateStatus,
    required TResult orElse(),
  }) {
    if (addReservation != null) {
      return addReservation(this);
    }
    return orElse();
  }
}

abstract class _AddReservation implements ReservationEvent {
  const factory _AddReservation(final String name, final String phone,
      final int pax, final DateTime time) = _$AddReservationImpl;

  String get name;
  String get phone;
  int get pax;
  DateTime get time;

  /// Create a copy of ReservationEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AddReservationImplCopyWith<_$AddReservationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateStatusImplCopyWith<$Res> {
  factory _$$UpdateStatusImplCopyWith(
          _$UpdateStatusImpl value, $Res Function(_$UpdateStatusImpl) then) =
      __$$UpdateStatusImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String uuid, String status, String? tableUuid});
}

/// @nodoc
class __$$UpdateStatusImplCopyWithImpl<$Res>
    extends _$ReservationEventCopyWithImpl<$Res, _$UpdateStatusImpl>
    implements _$$UpdateStatusImplCopyWith<$Res> {
  __$$UpdateStatusImplCopyWithImpl(
      _$UpdateStatusImpl _value, $Res Function(_$UpdateStatusImpl) _then)
      : super(_value, _then);

  /// Create a copy of ReservationEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
    Object? status = null,
    Object? tableUuid = freezed,
  }) {
    return _then(_$UpdateStatusImpl(
      null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      tableUuid: freezed == tableUuid
          ? _value.tableUuid
          : tableUuid // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$UpdateStatusImpl implements _UpdateStatus {
  const _$UpdateStatusImpl(this.uuid, this.status, {this.tableUuid});

  @override
  final String uuid;
  @override
  final String status;
  @override
  final String? tableUuid;

  @override
  String toString() {
    return 'ReservationEvent.updateStatus(uuid: $uuid, status: $status, tableUuid: $tableUuid)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateStatusImpl &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.tableUuid, tableUuid) ||
                other.tableUuid == tableUuid));
  }

  @override
  int get hashCode => Object.hash(runtimeType, uuid, status, tableUuid);

  /// Create a copy of ReservationEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateStatusImplCopyWith<_$UpdateStatusImpl> get copyWith =>
      __$$UpdateStatusImplCopyWithImpl<_$UpdateStatusImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadReservations,
    required TResult Function(String name, String phone, int pax, DateTime time)
        addReservation,
    required TResult Function(String uuid, String status, String? tableUuid)
        updateStatus,
  }) {
    return updateStatus(uuid, status, tableUuid);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadReservations,
    TResult? Function(String name, String phone, int pax, DateTime time)?
        addReservation,
    TResult? Function(String uuid, String status, String? tableUuid)?
        updateStatus,
  }) {
    return updateStatus?.call(uuid, status, tableUuid);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadReservations,
    TResult Function(String name, String phone, int pax, DateTime time)?
        addReservation,
    TResult Function(String uuid, String status, String? tableUuid)?
        updateStatus,
    required TResult orElse(),
  }) {
    if (updateStatus != null) {
      return updateStatus(uuid, status, tableUuid);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadReservations value) loadReservations,
    required TResult Function(_AddReservation value) addReservation,
    required TResult Function(_UpdateStatus value) updateStatus,
  }) {
    return updateStatus(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadReservations value)? loadReservations,
    TResult? Function(_AddReservation value)? addReservation,
    TResult? Function(_UpdateStatus value)? updateStatus,
  }) {
    return updateStatus?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadReservations value)? loadReservations,
    TResult Function(_AddReservation value)? addReservation,
    TResult Function(_UpdateStatus value)? updateStatus,
    required TResult orElse(),
  }) {
    if (updateStatus != null) {
      return updateStatus(this);
    }
    return orElse();
  }
}

abstract class _UpdateStatus implements ReservationEvent {
  const factory _UpdateStatus(final String uuid, final String status,
      {final String? tableUuid}) = _$UpdateStatusImpl;

  String get uuid;
  String get status;
  String? get tableUuid;

  /// Create a copy of ReservationEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateStatusImplCopyWith<_$UpdateStatusImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ReservationState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<ReservationTableData> reservations) loaded,
    required TResult Function(String message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<ReservationTableData> reservations)? loaded,
    TResult? Function(String message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<ReservationTableData> reservations)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReservationStateCopyWith<$Res> {
  factory $ReservationStateCopyWith(
          ReservationState value, $Res Function(ReservationState) then) =
      _$ReservationStateCopyWithImpl<$Res, ReservationState>;
}

/// @nodoc
class _$ReservationStateCopyWithImpl<$Res, $Val extends ReservationState>
    implements $ReservationStateCopyWith<$Res> {
  _$ReservationStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ReservationState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$ReservationStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of ReservationState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'ReservationState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<ReservationTableData> reservations) loaded,
    required TResult Function(String message) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<ReservationTableData> reservations)? loaded,
    TResult? Function(String message)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<ReservationTableData> reservations)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements ReservationState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$ReservationStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of ReservationState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'ReservationState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<ReservationTableData> reservations) loaded,
    required TResult Function(String message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<ReservationTableData> reservations)? loaded,
    TResult? Function(String message)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<ReservationTableData> reservations)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements ReservationState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$LoadedImplCopyWith<$Res> {
  factory _$$LoadedImplCopyWith(
          _$LoadedImpl value, $Res Function(_$LoadedImpl) then) =
      __$$LoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<ReservationTableData> reservations});
}

/// @nodoc
class __$$LoadedImplCopyWithImpl<$Res>
    extends _$ReservationStateCopyWithImpl<$Res, _$LoadedImpl>
    implements _$$LoadedImplCopyWith<$Res> {
  __$$LoadedImplCopyWithImpl(
      _$LoadedImpl _value, $Res Function(_$LoadedImpl) _then)
      : super(_value, _then);

  /// Create a copy of ReservationState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reservations = null,
  }) {
    return _then(_$LoadedImpl(
      null == reservations
          ? _value._reservations
          : reservations // ignore: cast_nullable_to_non_nullable
              as List<ReservationTableData>,
    ));
  }
}

/// @nodoc

class _$LoadedImpl implements _Loaded {
  const _$LoadedImpl(final List<ReservationTableData> reservations)
      : _reservations = reservations;

  final List<ReservationTableData> _reservations;
  @override
  List<ReservationTableData> get reservations {
    if (_reservations is EqualUnmodifiableListView) return _reservations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_reservations);
  }

  @override
  String toString() {
    return 'ReservationState.loaded(reservations: $reservations)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadedImpl &&
            const DeepCollectionEquality()
                .equals(other._reservations, _reservations));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_reservations));

  /// Create a copy of ReservationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadedImplCopyWith<_$LoadedImpl> get copyWith =>
      __$$LoadedImplCopyWithImpl<_$LoadedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<ReservationTableData> reservations) loaded,
    required TResult Function(String message) error,
  }) {
    return loaded(reservations);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<ReservationTableData> reservations)? loaded,
    TResult? Function(String message)? error,
  }) {
    return loaded?.call(reservations);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<ReservationTableData> reservations)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(reservations);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class _Loaded implements ReservationState {
  const factory _Loaded(final List<ReservationTableData> reservations) =
      _$LoadedImpl;

  List<ReservationTableData> get reservations;

  /// Create a copy of ReservationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadedImplCopyWith<_$LoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<$Res> {
  factory _$$ErrorImplCopyWith(
          _$ErrorImpl value, $Res Function(_$ErrorImpl) then) =
      __$$ErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<$Res>
    extends _$ReservationStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of ReservationState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$ErrorImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ErrorImpl implements _Error {
  const _$ErrorImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'ReservationState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of ReservationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      __$$ErrorImplCopyWithImpl<_$ErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<ReservationTableData> reservations) loaded,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<ReservationTableData> reservations)? loaded,
    TResult? Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<ReservationTableData> reservations)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements ReservationState {
  const factory _Error(final String message) = _$ErrorImpl;

  String get message;

  /// Create a copy of ReservationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
