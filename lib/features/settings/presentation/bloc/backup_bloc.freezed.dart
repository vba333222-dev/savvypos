// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'backup_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$BackupEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() createBackup,
    required TResult Function() restoreBackup,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? createBackup,
    TResult? Function()? restoreBackup,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? createBackup,
    TResult Function()? restoreBackup,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CreateBackup value) createBackup,
    required TResult Function(_RestoreBackup value) restoreBackup,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CreateBackup value)? createBackup,
    TResult? Function(_RestoreBackup value)? restoreBackup,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CreateBackup value)? createBackup,
    TResult Function(_RestoreBackup value)? restoreBackup,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BackupEventCopyWith<$Res> {
  factory $BackupEventCopyWith(
          BackupEvent value, $Res Function(BackupEvent) then) =
      _$BackupEventCopyWithImpl<$Res, BackupEvent>;
}

/// @nodoc
class _$BackupEventCopyWithImpl<$Res, $Val extends BackupEvent>
    implements $BackupEventCopyWith<$Res> {
  _$BackupEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BackupEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$CreateBackupImplCopyWith<$Res> {
  factory _$$CreateBackupImplCopyWith(
          _$CreateBackupImpl value, $Res Function(_$CreateBackupImpl) then) =
      __$$CreateBackupImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CreateBackupImplCopyWithImpl<$Res>
    extends _$BackupEventCopyWithImpl<$Res, _$CreateBackupImpl>
    implements _$$CreateBackupImplCopyWith<$Res> {
  __$$CreateBackupImplCopyWithImpl(
      _$CreateBackupImpl _value, $Res Function(_$CreateBackupImpl) _then)
      : super(_value, _then);

  /// Create a copy of BackupEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$CreateBackupImpl implements _CreateBackup {
  const _$CreateBackupImpl();

  @override
  String toString() {
    return 'BackupEvent.createBackup()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$CreateBackupImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() createBackup,
    required TResult Function() restoreBackup,
  }) {
    return createBackup();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? createBackup,
    TResult? Function()? restoreBackup,
  }) {
    return createBackup?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? createBackup,
    TResult Function()? restoreBackup,
    required TResult orElse(),
  }) {
    if (createBackup != null) {
      return createBackup();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CreateBackup value) createBackup,
    required TResult Function(_RestoreBackup value) restoreBackup,
  }) {
    return createBackup(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CreateBackup value)? createBackup,
    TResult? Function(_RestoreBackup value)? restoreBackup,
  }) {
    return createBackup?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CreateBackup value)? createBackup,
    TResult Function(_RestoreBackup value)? restoreBackup,
    required TResult orElse(),
  }) {
    if (createBackup != null) {
      return createBackup(this);
    }
    return orElse();
  }
}

abstract class _CreateBackup implements BackupEvent {
  const factory _CreateBackup() = _$CreateBackupImpl;
}

/// @nodoc
abstract class _$$RestoreBackupImplCopyWith<$Res> {
  factory _$$RestoreBackupImplCopyWith(
          _$RestoreBackupImpl value, $Res Function(_$RestoreBackupImpl) then) =
      __$$RestoreBackupImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RestoreBackupImplCopyWithImpl<$Res>
    extends _$BackupEventCopyWithImpl<$Res, _$RestoreBackupImpl>
    implements _$$RestoreBackupImplCopyWith<$Res> {
  __$$RestoreBackupImplCopyWithImpl(
      _$RestoreBackupImpl _value, $Res Function(_$RestoreBackupImpl) _then)
      : super(_value, _then);

  /// Create a copy of BackupEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$RestoreBackupImpl implements _RestoreBackup {
  const _$RestoreBackupImpl();

  @override
  String toString() {
    return 'BackupEvent.restoreBackup()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$RestoreBackupImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() createBackup,
    required TResult Function() restoreBackup,
  }) {
    return restoreBackup();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? createBackup,
    TResult? Function()? restoreBackup,
  }) {
    return restoreBackup?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? createBackup,
    TResult Function()? restoreBackup,
    required TResult orElse(),
  }) {
    if (restoreBackup != null) {
      return restoreBackup();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CreateBackup value) createBackup,
    required TResult Function(_RestoreBackup value) restoreBackup,
  }) {
    return restoreBackup(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CreateBackup value)? createBackup,
    TResult? Function(_RestoreBackup value)? restoreBackup,
  }) {
    return restoreBackup?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CreateBackup value)? createBackup,
    TResult Function(_RestoreBackup value)? restoreBackup,
    required TResult orElse(),
  }) {
    if (restoreBackup != null) {
      return restoreBackup(this);
    }
    return orElse();
  }
}

abstract class _RestoreBackup implements BackupEvent {
  const factory _RestoreBackup() = _$RestoreBackupImpl;
}

/// @nodoc
mixin _$BackupState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isSuccess => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;

  /// Create a copy of BackupState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BackupStateCopyWith<BackupState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BackupStateCopyWith<$Res> {
  factory $BackupStateCopyWith(
          BackupState value, $Res Function(BackupState) then) =
      _$BackupStateCopyWithImpl<$Res, BackupState>;
  @useResult
  $Res call({bool isLoading, bool isSuccess, String? message, String? error});
}

/// @nodoc
class _$BackupStateCopyWithImpl<$Res, $Val extends BackupState>
    implements $BackupStateCopyWith<$Res> {
  _$BackupStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BackupState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isSuccess = null,
    Object? message = freezed,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isSuccess: null == isSuccess
          ? _value.isSuccess
          : isSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BackupStateImplCopyWith<$Res>
    implements $BackupStateCopyWith<$Res> {
  factory _$$BackupStateImplCopyWith(
          _$BackupStateImpl value, $Res Function(_$BackupStateImpl) then) =
      __$$BackupStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoading, bool isSuccess, String? message, String? error});
}

/// @nodoc
class __$$BackupStateImplCopyWithImpl<$Res>
    extends _$BackupStateCopyWithImpl<$Res, _$BackupStateImpl>
    implements _$$BackupStateImplCopyWith<$Res> {
  __$$BackupStateImplCopyWithImpl(
      _$BackupStateImpl _value, $Res Function(_$BackupStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of BackupState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isSuccess = null,
    Object? message = freezed,
    Object? error = freezed,
  }) {
    return _then(_$BackupStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isSuccess: null == isSuccess
          ? _value.isSuccess
          : isSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$BackupStateImpl implements _BackupState {
  const _$BackupStateImpl(
      {this.isLoading = false,
      this.isSuccess = false,
      this.message,
      this.error});

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isSuccess;
  @override
  final String? message;
  @override
  final String? error;

  @override
  String toString() {
    return 'BackupState(isLoading: $isLoading, isSuccess: $isSuccess, message: $message, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BackupStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isSuccess, isSuccess) ||
                other.isSuccess == isSuccess) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, isLoading, isSuccess, message, error);

  /// Create a copy of BackupState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BackupStateImplCopyWith<_$BackupStateImpl> get copyWith =>
      __$$BackupStateImplCopyWithImpl<_$BackupStateImpl>(this, _$identity);
}

abstract class _BackupState implements BackupState {
  const factory _BackupState(
      {final bool isLoading,
      final bool isSuccess,
      final String? message,
      final String? error}) = _$BackupStateImpl;

  @override
  bool get isLoading;
  @override
  bool get isSuccess;
  @override
  String? get message;
  @override
  String? get error;

  /// Create a copy of BackupState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BackupStateImplCopyWith<_$BackupStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
