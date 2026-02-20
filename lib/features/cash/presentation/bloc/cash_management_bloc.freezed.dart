// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cash_management_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CashManagementEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String shiftUuid) started,
    required TResult Function(double amount) openDrawer,
    required TResult Function(double amount, String reason) cashDrop,
    required TResult Function(double actualBalance) closeShift,
    required TResult Function() toggleBalanceVisibility,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String shiftUuid)? started,
    TResult? Function(double amount)? openDrawer,
    TResult? Function(double amount, String reason)? cashDrop,
    TResult? Function(double actualBalance)? closeShift,
    TResult? Function()? toggleBalanceVisibility,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String shiftUuid)? started,
    TResult Function(double amount)? openDrawer,
    TResult Function(double amount, String reason)? cashDrop,
    TResult Function(double actualBalance)? closeShift,
    TResult Function()? toggleBalanceVisibility,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_OpenDrawer value) openDrawer,
    required TResult Function(_CashDrop value) cashDrop,
    required TResult Function(_CloseShift value) closeShift,
    required TResult Function(_ToggleBalanceVisibility value)
        toggleBalanceVisibility,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_OpenDrawer value)? openDrawer,
    TResult? Function(_CashDrop value)? cashDrop,
    TResult? Function(_CloseShift value)? closeShift,
    TResult? Function(_ToggleBalanceVisibility value)? toggleBalanceVisibility,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_OpenDrawer value)? openDrawer,
    TResult Function(_CashDrop value)? cashDrop,
    TResult Function(_CloseShift value)? closeShift,
    TResult Function(_ToggleBalanceVisibility value)? toggleBalanceVisibility,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CashManagementEventCopyWith<$Res> {
  factory $CashManagementEventCopyWith(
          CashManagementEvent value, $Res Function(CashManagementEvent) then) =
      _$CashManagementEventCopyWithImpl<$Res, CashManagementEvent>;
}

/// @nodoc
class _$CashManagementEventCopyWithImpl<$Res, $Val extends CashManagementEvent>
    implements $CashManagementEventCopyWith<$Res> {
  _$CashManagementEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CashManagementEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$StartedImplCopyWith<$Res> {
  factory _$$StartedImplCopyWith(
          _$StartedImpl value, $Res Function(_$StartedImpl) then) =
      __$$StartedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String shiftUuid});
}

/// @nodoc
class __$$StartedImplCopyWithImpl<$Res>
    extends _$CashManagementEventCopyWithImpl<$Res, _$StartedImpl>
    implements _$$StartedImplCopyWith<$Res> {
  __$$StartedImplCopyWithImpl(
      _$StartedImpl _value, $Res Function(_$StartedImpl) _then)
      : super(_value, _then);

  /// Create a copy of CashManagementEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? shiftUuid = null,
  }) {
    return _then(_$StartedImpl(
      null == shiftUuid
          ? _value.shiftUuid
          : shiftUuid // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$StartedImpl implements _Started {
  const _$StartedImpl(this.shiftUuid);

  @override
  final String shiftUuid;

  @override
  String toString() {
    return 'CashManagementEvent.started(shiftUuid: $shiftUuid)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StartedImpl &&
            (identical(other.shiftUuid, shiftUuid) ||
                other.shiftUuid == shiftUuid));
  }

  @override
  int get hashCode => Object.hash(runtimeType, shiftUuid);

  /// Create a copy of CashManagementEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StartedImplCopyWith<_$StartedImpl> get copyWith =>
      __$$StartedImplCopyWithImpl<_$StartedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String shiftUuid) started,
    required TResult Function(double amount) openDrawer,
    required TResult Function(double amount, String reason) cashDrop,
    required TResult Function(double actualBalance) closeShift,
    required TResult Function() toggleBalanceVisibility,
  }) {
    return started(shiftUuid);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String shiftUuid)? started,
    TResult? Function(double amount)? openDrawer,
    TResult? Function(double amount, String reason)? cashDrop,
    TResult? Function(double actualBalance)? closeShift,
    TResult? Function()? toggleBalanceVisibility,
  }) {
    return started?.call(shiftUuid);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String shiftUuid)? started,
    TResult Function(double amount)? openDrawer,
    TResult Function(double amount, String reason)? cashDrop,
    TResult Function(double actualBalance)? closeShift,
    TResult Function()? toggleBalanceVisibility,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(shiftUuid);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_OpenDrawer value) openDrawer,
    required TResult Function(_CashDrop value) cashDrop,
    required TResult Function(_CloseShift value) closeShift,
    required TResult Function(_ToggleBalanceVisibility value)
        toggleBalanceVisibility,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_OpenDrawer value)? openDrawer,
    TResult? Function(_CashDrop value)? cashDrop,
    TResult? Function(_CloseShift value)? closeShift,
    TResult? Function(_ToggleBalanceVisibility value)? toggleBalanceVisibility,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_OpenDrawer value)? openDrawer,
    TResult Function(_CashDrop value)? cashDrop,
    TResult Function(_CloseShift value)? closeShift,
    TResult Function(_ToggleBalanceVisibility value)? toggleBalanceVisibility,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements CashManagementEvent {
  const factory _Started(final String shiftUuid) = _$StartedImpl;

  String get shiftUuid;

  /// Create a copy of CashManagementEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StartedImplCopyWith<_$StartedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$OpenDrawerImplCopyWith<$Res> {
  factory _$$OpenDrawerImplCopyWith(
          _$OpenDrawerImpl value, $Res Function(_$OpenDrawerImpl) then) =
      __$$OpenDrawerImplCopyWithImpl<$Res>;
  @useResult
  $Res call({double amount});
}

/// @nodoc
class __$$OpenDrawerImplCopyWithImpl<$Res>
    extends _$CashManagementEventCopyWithImpl<$Res, _$OpenDrawerImpl>
    implements _$$OpenDrawerImplCopyWith<$Res> {
  __$$OpenDrawerImplCopyWithImpl(
      _$OpenDrawerImpl _value, $Res Function(_$OpenDrawerImpl) _then)
      : super(_value, _then);

  /// Create a copy of CashManagementEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amount = null,
  }) {
    return _then(_$OpenDrawerImpl(
      null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$OpenDrawerImpl implements _OpenDrawer {
  const _$OpenDrawerImpl(this.amount);

  @override
  final double amount;

  @override
  String toString() {
    return 'CashManagementEvent.openDrawer(amount: $amount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OpenDrawerImpl &&
            (identical(other.amount, amount) || other.amount == amount));
  }

  @override
  int get hashCode => Object.hash(runtimeType, amount);

  /// Create a copy of CashManagementEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OpenDrawerImplCopyWith<_$OpenDrawerImpl> get copyWith =>
      __$$OpenDrawerImplCopyWithImpl<_$OpenDrawerImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String shiftUuid) started,
    required TResult Function(double amount) openDrawer,
    required TResult Function(double amount, String reason) cashDrop,
    required TResult Function(double actualBalance) closeShift,
    required TResult Function() toggleBalanceVisibility,
  }) {
    return openDrawer(amount);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String shiftUuid)? started,
    TResult? Function(double amount)? openDrawer,
    TResult? Function(double amount, String reason)? cashDrop,
    TResult? Function(double actualBalance)? closeShift,
    TResult? Function()? toggleBalanceVisibility,
  }) {
    return openDrawer?.call(amount);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String shiftUuid)? started,
    TResult Function(double amount)? openDrawer,
    TResult Function(double amount, String reason)? cashDrop,
    TResult Function(double actualBalance)? closeShift,
    TResult Function()? toggleBalanceVisibility,
    required TResult orElse(),
  }) {
    if (openDrawer != null) {
      return openDrawer(amount);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_OpenDrawer value) openDrawer,
    required TResult Function(_CashDrop value) cashDrop,
    required TResult Function(_CloseShift value) closeShift,
    required TResult Function(_ToggleBalanceVisibility value)
        toggleBalanceVisibility,
  }) {
    return openDrawer(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_OpenDrawer value)? openDrawer,
    TResult? Function(_CashDrop value)? cashDrop,
    TResult? Function(_CloseShift value)? closeShift,
    TResult? Function(_ToggleBalanceVisibility value)? toggleBalanceVisibility,
  }) {
    return openDrawer?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_OpenDrawer value)? openDrawer,
    TResult Function(_CashDrop value)? cashDrop,
    TResult Function(_CloseShift value)? closeShift,
    TResult Function(_ToggleBalanceVisibility value)? toggleBalanceVisibility,
    required TResult orElse(),
  }) {
    if (openDrawer != null) {
      return openDrawer(this);
    }
    return orElse();
  }
}

abstract class _OpenDrawer implements CashManagementEvent {
  const factory _OpenDrawer(final double amount) = _$OpenDrawerImpl;

  double get amount;

  /// Create a copy of CashManagementEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OpenDrawerImplCopyWith<_$OpenDrawerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CashDropImplCopyWith<$Res> {
  factory _$$CashDropImplCopyWith(
          _$CashDropImpl value, $Res Function(_$CashDropImpl) then) =
      __$$CashDropImplCopyWithImpl<$Res>;
  @useResult
  $Res call({double amount, String reason});
}

/// @nodoc
class __$$CashDropImplCopyWithImpl<$Res>
    extends _$CashManagementEventCopyWithImpl<$Res, _$CashDropImpl>
    implements _$$CashDropImplCopyWith<$Res> {
  __$$CashDropImplCopyWithImpl(
      _$CashDropImpl _value, $Res Function(_$CashDropImpl) _then)
      : super(_value, _then);

  /// Create a copy of CashManagementEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amount = null,
    Object? reason = null,
  }) {
    return _then(_$CashDropImpl(
      null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      null == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$CashDropImpl implements _CashDrop {
  const _$CashDropImpl(this.amount, this.reason);

  @override
  final double amount;
  @override
  final String reason;

  @override
  String toString() {
    return 'CashManagementEvent.cashDrop(amount: $amount, reason: $reason)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CashDropImpl &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.reason, reason) || other.reason == reason));
  }

  @override
  int get hashCode => Object.hash(runtimeType, amount, reason);

  /// Create a copy of CashManagementEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CashDropImplCopyWith<_$CashDropImpl> get copyWith =>
      __$$CashDropImplCopyWithImpl<_$CashDropImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String shiftUuid) started,
    required TResult Function(double amount) openDrawer,
    required TResult Function(double amount, String reason) cashDrop,
    required TResult Function(double actualBalance) closeShift,
    required TResult Function() toggleBalanceVisibility,
  }) {
    return cashDrop(amount, reason);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String shiftUuid)? started,
    TResult? Function(double amount)? openDrawer,
    TResult? Function(double amount, String reason)? cashDrop,
    TResult? Function(double actualBalance)? closeShift,
    TResult? Function()? toggleBalanceVisibility,
  }) {
    return cashDrop?.call(amount, reason);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String shiftUuid)? started,
    TResult Function(double amount)? openDrawer,
    TResult Function(double amount, String reason)? cashDrop,
    TResult Function(double actualBalance)? closeShift,
    TResult Function()? toggleBalanceVisibility,
    required TResult orElse(),
  }) {
    if (cashDrop != null) {
      return cashDrop(amount, reason);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_OpenDrawer value) openDrawer,
    required TResult Function(_CashDrop value) cashDrop,
    required TResult Function(_CloseShift value) closeShift,
    required TResult Function(_ToggleBalanceVisibility value)
        toggleBalanceVisibility,
  }) {
    return cashDrop(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_OpenDrawer value)? openDrawer,
    TResult? Function(_CashDrop value)? cashDrop,
    TResult? Function(_CloseShift value)? closeShift,
    TResult? Function(_ToggleBalanceVisibility value)? toggleBalanceVisibility,
  }) {
    return cashDrop?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_OpenDrawer value)? openDrawer,
    TResult Function(_CashDrop value)? cashDrop,
    TResult Function(_CloseShift value)? closeShift,
    TResult Function(_ToggleBalanceVisibility value)? toggleBalanceVisibility,
    required TResult orElse(),
  }) {
    if (cashDrop != null) {
      return cashDrop(this);
    }
    return orElse();
  }
}

abstract class _CashDrop implements CashManagementEvent {
  const factory _CashDrop(final double amount, final String reason) =
      _$CashDropImpl;

  double get amount;
  String get reason;

  /// Create a copy of CashManagementEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CashDropImplCopyWith<_$CashDropImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CloseShiftImplCopyWith<$Res> {
  factory _$$CloseShiftImplCopyWith(
          _$CloseShiftImpl value, $Res Function(_$CloseShiftImpl) then) =
      __$$CloseShiftImplCopyWithImpl<$Res>;
  @useResult
  $Res call({double actualBalance});
}

/// @nodoc
class __$$CloseShiftImplCopyWithImpl<$Res>
    extends _$CashManagementEventCopyWithImpl<$Res, _$CloseShiftImpl>
    implements _$$CloseShiftImplCopyWith<$Res> {
  __$$CloseShiftImplCopyWithImpl(
      _$CloseShiftImpl _value, $Res Function(_$CloseShiftImpl) _then)
      : super(_value, _then);

  /// Create a copy of CashManagementEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? actualBalance = null,
  }) {
    return _then(_$CloseShiftImpl(
      null == actualBalance
          ? _value.actualBalance
          : actualBalance // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$CloseShiftImpl implements _CloseShift {
  const _$CloseShiftImpl(this.actualBalance);

  @override
  final double actualBalance;

  @override
  String toString() {
    return 'CashManagementEvent.closeShift(actualBalance: $actualBalance)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CloseShiftImpl &&
            (identical(other.actualBalance, actualBalance) ||
                other.actualBalance == actualBalance));
  }

  @override
  int get hashCode => Object.hash(runtimeType, actualBalance);

  /// Create a copy of CashManagementEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CloseShiftImplCopyWith<_$CloseShiftImpl> get copyWith =>
      __$$CloseShiftImplCopyWithImpl<_$CloseShiftImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String shiftUuid) started,
    required TResult Function(double amount) openDrawer,
    required TResult Function(double amount, String reason) cashDrop,
    required TResult Function(double actualBalance) closeShift,
    required TResult Function() toggleBalanceVisibility,
  }) {
    return closeShift(actualBalance);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String shiftUuid)? started,
    TResult? Function(double amount)? openDrawer,
    TResult? Function(double amount, String reason)? cashDrop,
    TResult? Function(double actualBalance)? closeShift,
    TResult? Function()? toggleBalanceVisibility,
  }) {
    return closeShift?.call(actualBalance);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String shiftUuid)? started,
    TResult Function(double amount)? openDrawer,
    TResult Function(double amount, String reason)? cashDrop,
    TResult Function(double actualBalance)? closeShift,
    TResult Function()? toggleBalanceVisibility,
    required TResult orElse(),
  }) {
    if (closeShift != null) {
      return closeShift(actualBalance);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_OpenDrawer value) openDrawer,
    required TResult Function(_CashDrop value) cashDrop,
    required TResult Function(_CloseShift value) closeShift,
    required TResult Function(_ToggleBalanceVisibility value)
        toggleBalanceVisibility,
  }) {
    return closeShift(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_OpenDrawer value)? openDrawer,
    TResult? Function(_CashDrop value)? cashDrop,
    TResult? Function(_CloseShift value)? closeShift,
    TResult? Function(_ToggleBalanceVisibility value)? toggleBalanceVisibility,
  }) {
    return closeShift?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_OpenDrawer value)? openDrawer,
    TResult Function(_CashDrop value)? cashDrop,
    TResult Function(_CloseShift value)? closeShift,
    TResult Function(_ToggleBalanceVisibility value)? toggleBalanceVisibility,
    required TResult orElse(),
  }) {
    if (closeShift != null) {
      return closeShift(this);
    }
    return orElse();
  }
}

abstract class _CloseShift implements CashManagementEvent {
  const factory _CloseShift(final double actualBalance) = _$CloseShiftImpl;

  double get actualBalance;

  /// Create a copy of CashManagementEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CloseShiftImplCopyWith<_$CloseShiftImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ToggleBalanceVisibilityImplCopyWith<$Res> {
  factory _$$ToggleBalanceVisibilityImplCopyWith(
          _$ToggleBalanceVisibilityImpl value,
          $Res Function(_$ToggleBalanceVisibilityImpl) then) =
      __$$ToggleBalanceVisibilityImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ToggleBalanceVisibilityImplCopyWithImpl<$Res>
    extends _$CashManagementEventCopyWithImpl<$Res,
        _$ToggleBalanceVisibilityImpl>
    implements _$$ToggleBalanceVisibilityImplCopyWith<$Res> {
  __$$ToggleBalanceVisibilityImplCopyWithImpl(
      _$ToggleBalanceVisibilityImpl _value,
      $Res Function(_$ToggleBalanceVisibilityImpl) _then)
      : super(_value, _then);

  /// Create a copy of CashManagementEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ToggleBalanceVisibilityImpl implements _ToggleBalanceVisibility {
  const _$ToggleBalanceVisibilityImpl();

  @override
  String toString() {
    return 'CashManagementEvent.toggleBalanceVisibility()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ToggleBalanceVisibilityImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String shiftUuid) started,
    required TResult Function(double amount) openDrawer,
    required TResult Function(double amount, String reason) cashDrop,
    required TResult Function(double actualBalance) closeShift,
    required TResult Function() toggleBalanceVisibility,
  }) {
    return toggleBalanceVisibility();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String shiftUuid)? started,
    TResult? Function(double amount)? openDrawer,
    TResult? Function(double amount, String reason)? cashDrop,
    TResult? Function(double actualBalance)? closeShift,
    TResult? Function()? toggleBalanceVisibility,
  }) {
    return toggleBalanceVisibility?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String shiftUuid)? started,
    TResult Function(double amount)? openDrawer,
    TResult Function(double amount, String reason)? cashDrop,
    TResult Function(double actualBalance)? closeShift,
    TResult Function()? toggleBalanceVisibility,
    required TResult orElse(),
  }) {
    if (toggleBalanceVisibility != null) {
      return toggleBalanceVisibility();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_OpenDrawer value) openDrawer,
    required TResult Function(_CashDrop value) cashDrop,
    required TResult Function(_CloseShift value) closeShift,
    required TResult Function(_ToggleBalanceVisibility value)
        toggleBalanceVisibility,
  }) {
    return toggleBalanceVisibility(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_OpenDrawer value)? openDrawer,
    TResult? Function(_CashDrop value)? cashDrop,
    TResult? Function(_CloseShift value)? closeShift,
    TResult? Function(_ToggleBalanceVisibility value)? toggleBalanceVisibility,
  }) {
    return toggleBalanceVisibility?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_OpenDrawer value)? openDrawer,
    TResult Function(_CashDrop value)? cashDrop,
    TResult Function(_CloseShift value)? closeShift,
    TResult Function(_ToggleBalanceVisibility value)? toggleBalanceVisibility,
    required TResult orElse(),
  }) {
    if (toggleBalanceVisibility != null) {
      return toggleBalanceVisibility(this);
    }
    return orElse();
  }
}

abstract class _ToggleBalanceVisibility implements CashManagementEvent {
  const factory _ToggleBalanceVisibility() = _$ToggleBalanceVisibilityImpl;
}

/// @nodoc
mixin _$CashManagementState {
  String get shiftUuid => throw _privateConstructorUsedError;
  CashDrawer? get currentDrawer => throw _privateConstructorUsedError;
  CashDrawerSummary? get summary => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isBalanceVisible => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;
  bool get isShiftClosed => throw _privateConstructorUsedError;

  /// Create a copy of CashManagementState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CashManagementStateCopyWith<CashManagementState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CashManagementStateCopyWith<$Res> {
  factory $CashManagementStateCopyWith(
          CashManagementState value, $Res Function(CashManagementState) then) =
      _$CashManagementStateCopyWithImpl<$Res, CashManagementState>;
  @useResult
  $Res call(
      {String shiftUuid,
      CashDrawer? currentDrawer,
      CashDrawerSummary? summary,
      bool isLoading,
      bool isBalanceVisible,
      String? errorMessage,
      bool isShiftClosed});

  $CashDrawerCopyWith<$Res>? get currentDrawer;
  $CashDrawerSummaryCopyWith<$Res>? get summary;
}

/// @nodoc
class _$CashManagementStateCopyWithImpl<$Res, $Val extends CashManagementState>
    implements $CashManagementStateCopyWith<$Res> {
  _$CashManagementStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CashManagementState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? shiftUuid = null,
    Object? currentDrawer = freezed,
    Object? summary = freezed,
    Object? isLoading = null,
    Object? isBalanceVisible = null,
    Object? errorMessage = freezed,
    Object? isShiftClosed = null,
  }) {
    return _then(_value.copyWith(
      shiftUuid: null == shiftUuid
          ? _value.shiftUuid
          : shiftUuid // ignore: cast_nullable_to_non_nullable
              as String,
      currentDrawer: freezed == currentDrawer
          ? _value.currentDrawer
          : currentDrawer // ignore: cast_nullable_to_non_nullable
              as CashDrawer?,
      summary: freezed == summary
          ? _value.summary
          : summary // ignore: cast_nullable_to_non_nullable
              as CashDrawerSummary?,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isBalanceVisible: null == isBalanceVisible
          ? _value.isBalanceVisible
          : isBalanceVisible // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      isShiftClosed: null == isShiftClosed
          ? _value.isShiftClosed
          : isShiftClosed // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  /// Create a copy of CashManagementState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CashDrawerCopyWith<$Res>? get currentDrawer {
    if (_value.currentDrawer == null) {
      return null;
    }

    return $CashDrawerCopyWith<$Res>(_value.currentDrawer!, (value) {
      return _then(_value.copyWith(currentDrawer: value) as $Val);
    });
  }

  /// Create a copy of CashManagementState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CashDrawerSummaryCopyWith<$Res>? get summary {
    if (_value.summary == null) {
      return null;
    }

    return $CashDrawerSummaryCopyWith<$Res>(_value.summary!, (value) {
      return _then(_value.copyWith(summary: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CashManagementStateImplCopyWith<$Res>
    implements $CashManagementStateCopyWith<$Res> {
  factory _$$CashManagementStateImplCopyWith(_$CashManagementStateImpl value,
          $Res Function(_$CashManagementStateImpl) then) =
      __$$CashManagementStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String shiftUuid,
      CashDrawer? currentDrawer,
      CashDrawerSummary? summary,
      bool isLoading,
      bool isBalanceVisible,
      String? errorMessage,
      bool isShiftClosed});

  @override
  $CashDrawerCopyWith<$Res>? get currentDrawer;
  @override
  $CashDrawerSummaryCopyWith<$Res>? get summary;
}

/// @nodoc
class __$$CashManagementStateImplCopyWithImpl<$Res>
    extends _$CashManagementStateCopyWithImpl<$Res, _$CashManagementStateImpl>
    implements _$$CashManagementStateImplCopyWith<$Res> {
  __$$CashManagementStateImplCopyWithImpl(_$CashManagementStateImpl _value,
      $Res Function(_$CashManagementStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of CashManagementState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? shiftUuid = null,
    Object? currentDrawer = freezed,
    Object? summary = freezed,
    Object? isLoading = null,
    Object? isBalanceVisible = null,
    Object? errorMessage = freezed,
    Object? isShiftClosed = null,
  }) {
    return _then(_$CashManagementStateImpl(
      shiftUuid: null == shiftUuid
          ? _value.shiftUuid
          : shiftUuid // ignore: cast_nullable_to_non_nullable
              as String,
      currentDrawer: freezed == currentDrawer
          ? _value.currentDrawer
          : currentDrawer // ignore: cast_nullable_to_non_nullable
              as CashDrawer?,
      summary: freezed == summary
          ? _value.summary
          : summary // ignore: cast_nullable_to_non_nullable
              as CashDrawerSummary?,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isBalanceVisible: null == isBalanceVisible
          ? _value.isBalanceVisible
          : isBalanceVisible // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      isShiftClosed: null == isShiftClosed
          ? _value.isShiftClosed
          : isShiftClosed // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$CashManagementStateImpl implements _CashManagementState {
  const _$CashManagementStateImpl(
      {required this.shiftUuid,
      this.currentDrawer,
      this.summary,
      this.isLoading = false,
      this.isBalanceVisible = false,
      this.errorMessage,
      this.isShiftClosed = false});

  @override
  final String shiftUuid;
  @override
  final CashDrawer? currentDrawer;
  @override
  final CashDrawerSummary? summary;
  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isBalanceVisible;
  @override
  final String? errorMessage;
  @override
  @JsonKey()
  final bool isShiftClosed;

  @override
  String toString() {
    return 'CashManagementState(shiftUuid: $shiftUuid, currentDrawer: $currentDrawer, summary: $summary, isLoading: $isLoading, isBalanceVisible: $isBalanceVisible, errorMessage: $errorMessage, isShiftClosed: $isShiftClosed)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CashManagementStateImpl &&
            (identical(other.shiftUuid, shiftUuid) ||
                other.shiftUuid == shiftUuid) &&
            (identical(other.currentDrawer, currentDrawer) ||
                other.currentDrawer == currentDrawer) &&
            (identical(other.summary, summary) || other.summary == summary) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isBalanceVisible, isBalanceVisible) ||
                other.isBalanceVisible == isBalanceVisible) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.isShiftClosed, isShiftClosed) ||
                other.isShiftClosed == isShiftClosed));
  }

  @override
  int get hashCode => Object.hash(runtimeType, shiftUuid, currentDrawer,
      summary, isLoading, isBalanceVisible, errorMessage, isShiftClosed);

  /// Create a copy of CashManagementState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CashManagementStateImplCopyWith<_$CashManagementStateImpl> get copyWith =>
      __$$CashManagementStateImplCopyWithImpl<_$CashManagementStateImpl>(
          this, _$identity);
}

abstract class _CashManagementState implements CashManagementState {
  const factory _CashManagementState(
      {required final String shiftUuid,
      final CashDrawer? currentDrawer,
      final CashDrawerSummary? summary,
      final bool isLoading,
      final bool isBalanceVisible,
      final String? errorMessage,
      final bool isShiftClosed}) = _$CashManagementStateImpl;

  @override
  String get shiftUuid;
  @override
  CashDrawer? get currentDrawer;
  @override
  CashDrawerSummary? get summary;
  @override
  bool get isLoading;
  @override
  bool get isBalanceVisible;
  @override
  String? get errorMessage;
  @override
  bool get isShiftClosed;

  /// Create a copy of CashManagementState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CashManagementStateImplCopyWith<_$CashManagementStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
