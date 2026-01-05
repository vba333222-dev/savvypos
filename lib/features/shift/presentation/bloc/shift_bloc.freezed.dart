// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shift_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ShiftEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() checkStatus,
    required TResult Function(double startCash) openShift,
    required TResult Function(double actualCash) closeShift,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? checkStatus,
    TResult? Function(double startCash)? openShift,
    TResult? Function(double actualCash)? closeShift,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? checkStatus,
    TResult Function(double startCash)? openShift,
    TResult Function(double actualCash)? closeShift,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CheckStatus value) checkStatus,
    required TResult Function(_OpenShift value) openShift,
    required TResult Function(_CloseShift value) closeShift,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CheckStatus value)? checkStatus,
    TResult? Function(_OpenShift value)? openShift,
    TResult? Function(_CloseShift value)? closeShift,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CheckStatus value)? checkStatus,
    TResult Function(_OpenShift value)? openShift,
    TResult Function(_CloseShift value)? closeShift,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShiftEventCopyWith<$Res> {
  factory $ShiftEventCopyWith(
          ShiftEvent value, $Res Function(ShiftEvent) then) =
      _$ShiftEventCopyWithImpl<$Res, ShiftEvent>;
}

/// @nodoc
class _$ShiftEventCopyWithImpl<$Res, $Val extends ShiftEvent>
    implements $ShiftEventCopyWith<$Res> {
  _$ShiftEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ShiftEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$CheckStatusImplCopyWith<$Res> {
  factory _$$CheckStatusImplCopyWith(
          _$CheckStatusImpl value, $Res Function(_$CheckStatusImpl) then) =
      __$$CheckStatusImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CheckStatusImplCopyWithImpl<$Res>
    extends _$ShiftEventCopyWithImpl<$Res, _$CheckStatusImpl>
    implements _$$CheckStatusImplCopyWith<$Res> {
  __$$CheckStatusImplCopyWithImpl(
      _$CheckStatusImpl _value, $Res Function(_$CheckStatusImpl) _then)
      : super(_value, _then);

  /// Create a copy of ShiftEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$CheckStatusImpl implements _CheckStatus {
  const _$CheckStatusImpl();

  @override
  String toString() {
    return 'ShiftEvent.checkStatus()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$CheckStatusImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() checkStatus,
    required TResult Function(double startCash) openShift,
    required TResult Function(double actualCash) closeShift,
  }) {
    return checkStatus();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? checkStatus,
    TResult? Function(double startCash)? openShift,
    TResult? Function(double actualCash)? closeShift,
  }) {
    return checkStatus?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? checkStatus,
    TResult Function(double startCash)? openShift,
    TResult Function(double actualCash)? closeShift,
    required TResult orElse(),
  }) {
    if (checkStatus != null) {
      return checkStatus();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CheckStatus value) checkStatus,
    required TResult Function(_OpenShift value) openShift,
    required TResult Function(_CloseShift value) closeShift,
  }) {
    return checkStatus(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CheckStatus value)? checkStatus,
    TResult? Function(_OpenShift value)? openShift,
    TResult? Function(_CloseShift value)? closeShift,
  }) {
    return checkStatus?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CheckStatus value)? checkStatus,
    TResult Function(_OpenShift value)? openShift,
    TResult Function(_CloseShift value)? closeShift,
    required TResult orElse(),
  }) {
    if (checkStatus != null) {
      return checkStatus(this);
    }
    return orElse();
  }
}

abstract class _CheckStatus implements ShiftEvent {
  const factory _CheckStatus() = _$CheckStatusImpl;
}

/// @nodoc
abstract class _$$OpenShiftImplCopyWith<$Res> {
  factory _$$OpenShiftImplCopyWith(
          _$OpenShiftImpl value, $Res Function(_$OpenShiftImpl) then) =
      __$$OpenShiftImplCopyWithImpl<$Res>;
  @useResult
  $Res call({double startCash});
}

/// @nodoc
class __$$OpenShiftImplCopyWithImpl<$Res>
    extends _$ShiftEventCopyWithImpl<$Res, _$OpenShiftImpl>
    implements _$$OpenShiftImplCopyWith<$Res> {
  __$$OpenShiftImplCopyWithImpl(
      _$OpenShiftImpl _value, $Res Function(_$OpenShiftImpl) _then)
      : super(_value, _then);

  /// Create a copy of ShiftEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? startCash = null,
  }) {
    return _then(_$OpenShiftImpl(
      null == startCash
          ? _value.startCash
          : startCash // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$OpenShiftImpl implements _OpenShift {
  const _$OpenShiftImpl(this.startCash);

  @override
  final double startCash;

  @override
  String toString() {
    return 'ShiftEvent.openShift(startCash: $startCash)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OpenShiftImpl &&
            (identical(other.startCash, startCash) ||
                other.startCash == startCash));
  }

  @override
  int get hashCode => Object.hash(runtimeType, startCash);

  /// Create a copy of ShiftEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OpenShiftImplCopyWith<_$OpenShiftImpl> get copyWith =>
      __$$OpenShiftImplCopyWithImpl<_$OpenShiftImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() checkStatus,
    required TResult Function(double startCash) openShift,
    required TResult Function(double actualCash) closeShift,
  }) {
    return openShift(startCash);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? checkStatus,
    TResult? Function(double startCash)? openShift,
    TResult? Function(double actualCash)? closeShift,
  }) {
    return openShift?.call(startCash);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? checkStatus,
    TResult Function(double startCash)? openShift,
    TResult Function(double actualCash)? closeShift,
    required TResult orElse(),
  }) {
    if (openShift != null) {
      return openShift(startCash);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CheckStatus value) checkStatus,
    required TResult Function(_OpenShift value) openShift,
    required TResult Function(_CloseShift value) closeShift,
  }) {
    return openShift(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CheckStatus value)? checkStatus,
    TResult? Function(_OpenShift value)? openShift,
    TResult? Function(_CloseShift value)? closeShift,
  }) {
    return openShift?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CheckStatus value)? checkStatus,
    TResult Function(_OpenShift value)? openShift,
    TResult Function(_CloseShift value)? closeShift,
    required TResult orElse(),
  }) {
    if (openShift != null) {
      return openShift(this);
    }
    return orElse();
  }
}

abstract class _OpenShift implements ShiftEvent {
  const factory _OpenShift(final double startCash) = _$OpenShiftImpl;

  double get startCash;

  /// Create a copy of ShiftEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OpenShiftImplCopyWith<_$OpenShiftImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CloseShiftImplCopyWith<$Res> {
  factory _$$CloseShiftImplCopyWith(
          _$CloseShiftImpl value, $Res Function(_$CloseShiftImpl) then) =
      __$$CloseShiftImplCopyWithImpl<$Res>;
  @useResult
  $Res call({double actualCash});
}

/// @nodoc
class __$$CloseShiftImplCopyWithImpl<$Res>
    extends _$ShiftEventCopyWithImpl<$Res, _$CloseShiftImpl>
    implements _$$CloseShiftImplCopyWith<$Res> {
  __$$CloseShiftImplCopyWithImpl(
      _$CloseShiftImpl _value, $Res Function(_$CloseShiftImpl) _then)
      : super(_value, _then);

  /// Create a copy of ShiftEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? actualCash = null,
  }) {
    return _then(_$CloseShiftImpl(
      null == actualCash
          ? _value.actualCash
          : actualCash // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$CloseShiftImpl implements _CloseShift {
  const _$CloseShiftImpl(this.actualCash);

  @override
  final double actualCash;

  @override
  String toString() {
    return 'ShiftEvent.closeShift(actualCash: $actualCash)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CloseShiftImpl &&
            (identical(other.actualCash, actualCash) ||
                other.actualCash == actualCash));
  }

  @override
  int get hashCode => Object.hash(runtimeType, actualCash);

  /// Create a copy of ShiftEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CloseShiftImplCopyWith<_$CloseShiftImpl> get copyWith =>
      __$$CloseShiftImplCopyWithImpl<_$CloseShiftImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() checkStatus,
    required TResult Function(double startCash) openShift,
    required TResult Function(double actualCash) closeShift,
  }) {
    return closeShift(actualCash);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? checkStatus,
    TResult? Function(double startCash)? openShift,
    TResult? Function(double actualCash)? closeShift,
  }) {
    return closeShift?.call(actualCash);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? checkStatus,
    TResult Function(double startCash)? openShift,
    TResult Function(double actualCash)? closeShift,
    required TResult orElse(),
  }) {
    if (closeShift != null) {
      return closeShift(actualCash);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CheckStatus value) checkStatus,
    required TResult Function(_OpenShift value) openShift,
    required TResult Function(_CloseShift value) closeShift,
  }) {
    return closeShift(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CheckStatus value)? checkStatus,
    TResult? Function(_OpenShift value)? openShift,
    TResult? Function(_CloseShift value)? closeShift,
  }) {
    return closeShift?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CheckStatus value)? checkStatus,
    TResult Function(_OpenShift value)? openShift,
    TResult Function(_CloseShift value)? closeShift,
    required TResult orElse(),
  }) {
    if (closeShift != null) {
      return closeShift(this);
    }
    return orElse();
  }
}

abstract class _CloseShift implements ShiftEvent {
  const factory _CloseShift(final double actualCash) = _$CloseShiftImpl;

  double get actualCash;

  /// Create a copy of ShiftEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CloseShiftImplCopyWith<_$CloseShiftImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ShiftState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(ShiftSessionTableData shift) open,
    required TResult Function() closed,
    required TResult Function(String message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(ShiftSessionTableData shift)? open,
    TResult? Function()? closed,
    TResult? Function(String message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(ShiftSessionTableData shift)? open,
    TResult Function()? closed,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Open value) open,
    required TResult Function(_Closed value) closed,
    required TResult Function(_Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Open value)? open,
    TResult? Function(_Closed value)? closed,
    TResult? Function(_Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Open value)? open,
    TResult Function(_Closed value)? closed,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShiftStateCopyWith<$Res> {
  factory $ShiftStateCopyWith(
          ShiftState value, $Res Function(ShiftState) then) =
      _$ShiftStateCopyWithImpl<$Res, ShiftState>;
}

/// @nodoc
class _$ShiftStateCopyWithImpl<$Res, $Val extends ShiftState>
    implements $ShiftStateCopyWith<$Res> {
  _$ShiftStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ShiftState
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
    extends _$ShiftStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of ShiftState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'ShiftState.initial()';
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
    required TResult Function(ShiftSessionTableData shift) open,
    required TResult Function() closed,
    required TResult Function(String message) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(ShiftSessionTableData shift)? open,
    TResult? Function()? closed,
    TResult? Function(String message)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(ShiftSessionTableData shift)? open,
    TResult Function()? closed,
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
    required TResult Function(_Open value) open,
    required TResult Function(_Closed value) closed,
    required TResult Function(_Error value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Open value)? open,
    TResult? Function(_Closed value)? closed,
    TResult? Function(_Error value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Open value)? open,
    TResult Function(_Closed value)? closed,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements ShiftState {
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
    extends _$ShiftStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of ShiftState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'ShiftState.loading()';
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
    required TResult Function(ShiftSessionTableData shift) open,
    required TResult Function() closed,
    required TResult Function(String message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(ShiftSessionTableData shift)? open,
    TResult? Function()? closed,
    TResult? Function(String message)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(ShiftSessionTableData shift)? open,
    TResult Function()? closed,
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
    required TResult Function(_Open value) open,
    required TResult Function(_Closed value) closed,
    required TResult Function(_Error value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Open value)? open,
    TResult? Function(_Closed value)? closed,
    TResult? Function(_Error value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Open value)? open,
    TResult Function(_Closed value)? closed,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements ShiftState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$OpenImplCopyWith<$Res> {
  factory _$$OpenImplCopyWith(
          _$OpenImpl value, $Res Function(_$OpenImpl) then) =
      __$$OpenImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ShiftSessionTableData shift});
}

/// @nodoc
class __$$OpenImplCopyWithImpl<$Res>
    extends _$ShiftStateCopyWithImpl<$Res, _$OpenImpl>
    implements _$$OpenImplCopyWith<$Res> {
  __$$OpenImplCopyWithImpl(_$OpenImpl _value, $Res Function(_$OpenImpl) _then)
      : super(_value, _then);

  /// Create a copy of ShiftState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? shift = freezed,
  }) {
    return _then(_$OpenImpl(
      freezed == shift
          ? _value.shift
          : shift // ignore: cast_nullable_to_non_nullable
              as ShiftSessionTableData,
    ));
  }
}

/// @nodoc

class _$OpenImpl implements _Open {
  const _$OpenImpl(this.shift);

  @override
  final ShiftSessionTableData shift;

  @override
  String toString() {
    return 'ShiftState.open(shift: $shift)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OpenImpl &&
            const DeepCollectionEquality().equals(other.shift, shift));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(shift));

  /// Create a copy of ShiftState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OpenImplCopyWith<_$OpenImpl> get copyWith =>
      __$$OpenImplCopyWithImpl<_$OpenImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(ShiftSessionTableData shift) open,
    required TResult Function() closed,
    required TResult Function(String message) error,
  }) {
    return open(shift);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(ShiftSessionTableData shift)? open,
    TResult? Function()? closed,
    TResult? Function(String message)? error,
  }) {
    return open?.call(shift);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(ShiftSessionTableData shift)? open,
    TResult Function()? closed,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (open != null) {
      return open(shift);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Open value) open,
    required TResult Function(_Closed value) closed,
    required TResult Function(_Error value) error,
  }) {
    return open(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Open value)? open,
    TResult? Function(_Closed value)? closed,
    TResult? Function(_Error value)? error,
  }) {
    return open?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Open value)? open,
    TResult Function(_Closed value)? closed,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (open != null) {
      return open(this);
    }
    return orElse();
  }
}

abstract class _Open implements ShiftState {
  const factory _Open(final ShiftSessionTableData shift) = _$OpenImpl;

  ShiftSessionTableData get shift;

  /// Create a copy of ShiftState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OpenImplCopyWith<_$OpenImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ClosedImplCopyWith<$Res> {
  factory _$$ClosedImplCopyWith(
          _$ClosedImpl value, $Res Function(_$ClosedImpl) then) =
      __$$ClosedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ClosedImplCopyWithImpl<$Res>
    extends _$ShiftStateCopyWithImpl<$Res, _$ClosedImpl>
    implements _$$ClosedImplCopyWith<$Res> {
  __$$ClosedImplCopyWithImpl(
      _$ClosedImpl _value, $Res Function(_$ClosedImpl) _then)
      : super(_value, _then);

  /// Create a copy of ShiftState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ClosedImpl implements _Closed {
  const _$ClosedImpl();

  @override
  String toString() {
    return 'ShiftState.closed()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ClosedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(ShiftSessionTableData shift) open,
    required TResult Function() closed,
    required TResult Function(String message) error,
  }) {
    return closed();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(ShiftSessionTableData shift)? open,
    TResult? Function()? closed,
    TResult? Function(String message)? error,
  }) {
    return closed?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(ShiftSessionTableData shift)? open,
    TResult Function()? closed,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (closed != null) {
      return closed();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Open value) open,
    required TResult Function(_Closed value) closed,
    required TResult Function(_Error value) error,
  }) {
    return closed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Open value)? open,
    TResult? Function(_Closed value)? closed,
    TResult? Function(_Error value)? error,
  }) {
    return closed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Open value)? open,
    TResult Function(_Closed value)? closed,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (closed != null) {
      return closed(this);
    }
    return orElse();
  }
}

abstract class _Closed implements ShiftState {
  const factory _Closed() = _$ClosedImpl;
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
    extends _$ShiftStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of ShiftState
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
    return 'ShiftState.error(message: $message)';
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

  /// Create a copy of ShiftState
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
    required TResult Function(ShiftSessionTableData shift) open,
    required TResult Function() closed,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(ShiftSessionTableData shift)? open,
    TResult? Function()? closed,
    TResult? Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(ShiftSessionTableData shift)? open,
    TResult Function()? closed,
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
    required TResult Function(_Open value) open,
    required TResult Function(_Closed value) closed,
    required TResult Function(_Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Open value)? open,
    TResult? Function(_Closed value)? closed,
    TResult? Function(_Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Open value)? open,
    TResult Function(_Closed value)? closed,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements ShiftState {
  const factory _Error(final String message) = _$ErrorImpl;

  String get message;

  /// Create a copy of ShiftState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
