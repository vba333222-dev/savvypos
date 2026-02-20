// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'loyalty_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$LoyaltyEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String customerUuid) loadMember,
    required TResult Function(String customerUuid, String name, String phone)
        enroll,
    required TResult Function(
            String customerUuid, double amount, String orderUuid)
        earnPoints,
    required TResult Function(
            String customerUuid, LoyaltyReward reward, String orderUuid)
        redeemReward,
    required TResult Function() loadRewards,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String customerUuid)? loadMember,
    TResult? Function(String customerUuid, String name, String phone)? enroll,
    TResult? Function(String customerUuid, double amount, String orderUuid)?
        earnPoints,
    TResult? Function(
            String customerUuid, LoyaltyReward reward, String orderUuid)?
        redeemReward,
    TResult? Function()? loadRewards,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String customerUuid)? loadMember,
    TResult Function(String customerUuid, String name, String phone)? enroll,
    TResult Function(String customerUuid, double amount, String orderUuid)?
        earnPoints,
    TResult Function(
            String customerUuid, LoyaltyReward reward, String orderUuid)?
        redeemReward,
    TResult Function()? loadRewards,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadMember value) loadMember,
    required TResult Function(EnrollMember value) enroll,
    required TResult Function(EarnPoints value) earnPoints,
    required TResult Function(RedeemReward value) redeemReward,
    required TResult Function(LoadRewards value) loadRewards,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadMember value)? loadMember,
    TResult? Function(EnrollMember value)? enroll,
    TResult? Function(EarnPoints value)? earnPoints,
    TResult? Function(RedeemReward value)? redeemReward,
    TResult? Function(LoadRewards value)? loadRewards,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadMember value)? loadMember,
    TResult Function(EnrollMember value)? enroll,
    TResult Function(EarnPoints value)? earnPoints,
    TResult Function(RedeemReward value)? redeemReward,
    TResult Function(LoadRewards value)? loadRewards,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoyaltyEventCopyWith<$Res> {
  factory $LoyaltyEventCopyWith(
          LoyaltyEvent value, $Res Function(LoyaltyEvent) then) =
      _$LoyaltyEventCopyWithImpl<$Res, LoyaltyEvent>;
}

/// @nodoc
class _$LoyaltyEventCopyWithImpl<$Res, $Val extends LoyaltyEvent>
    implements $LoyaltyEventCopyWith<$Res> {
  _$LoyaltyEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LoyaltyEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$LoadMemberImplCopyWith<$Res> {
  factory _$$LoadMemberImplCopyWith(
          _$LoadMemberImpl value, $Res Function(_$LoadMemberImpl) then) =
      __$$LoadMemberImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String customerUuid});
}

/// @nodoc
class __$$LoadMemberImplCopyWithImpl<$Res>
    extends _$LoyaltyEventCopyWithImpl<$Res, _$LoadMemberImpl>
    implements _$$LoadMemberImplCopyWith<$Res> {
  __$$LoadMemberImplCopyWithImpl(
      _$LoadMemberImpl _value, $Res Function(_$LoadMemberImpl) _then)
      : super(_value, _then);

  /// Create a copy of LoyaltyEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? customerUuid = null,
  }) {
    return _then(_$LoadMemberImpl(
      null == customerUuid
          ? _value.customerUuid
          : customerUuid // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$LoadMemberImpl implements LoadMember {
  const _$LoadMemberImpl(this.customerUuid);

  @override
  final String customerUuid;

  @override
  String toString() {
    return 'LoyaltyEvent.loadMember(customerUuid: $customerUuid)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadMemberImpl &&
            (identical(other.customerUuid, customerUuid) ||
                other.customerUuid == customerUuid));
  }

  @override
  int get hashCode => Object.hash(runtimeType, customerUuid);

  /// Create a copy of LoyaltyEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadMemberImplCopyWith<_$LoadMemberImpl> get copyWith =>
      __$$LoadMemberImplCopyWithImpl<_$LoadMemberImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String customerUuid) loadMember,
    required TResult Function(String customerUuid, String name, String phone)
        enroll,
    required TResult Function(
            String customerUuid, double amount, String orderUuid)
        earnPoints,
    required TResult Function(
            String customerUuid, LoyaltyReward reward, String orderUuid)
        redeemReward,
    required TResult Function() loadRewards,
  }) {
    return loadMember(customerUuid);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String customerUuid)? loadMember,
    TResult? Function(String customerUuid, String name, String phone)? enroll,
    TResult? Function(String customerUuid, double amount, String orderUuid)?
        earnPoints,
    TResult? Function(
            String customerUuid, LoyaltyReward reward, String orderUuid)?
        redeemReward,
    TResult? Function()? loadRewards,
  }) {
    return loadMember?.call(customerUuid);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String customerUuid)? loadMember,
    TResult Function(String customerUuid, String name, String phone)? enroll,
    TResult Function(String customerUuid, double amount, String orderUuid)?
        earnPoints,
    TResult Function(
            String customerUuid, LoyaltyReward reward, String orderUuid)?
        redeemReward,
    TResult Function()? loadRewards,
    required TResult orElse(),
  }) {
    if (loadMember != null) {
      return loadMember(customerUuid);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadMember value) loadMember,
    required TResult Function(EnrollMember value) enroll,
    required TResult Function(EarnPoints value) earnPoints,
    required TResult Function(RedeemReward value) redeemReward,
    required TResult Function(LoadRewards value) loadRewards,
  }) {
    return loadMember(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadMember value)? loadMember,
    TResult? Function(EnrollMember value)? enroll,
    TResult? Function(EarnPoints value)? earnPoints,
    TResult? Function(RedeemReward value)? redeemReward,
    TResult? Function(LoadRewards value)? loadRewards,
  }) {
    return loadMember?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadMember value)? loadMember,
    TResult Function(EnrollMember value)? enroll,
    TResult Function(EarnPoints value)? earnPoints,
    TResult Function(RedeemReward value)? redeemReward,
    TResult Function(LoadRewards value)? loadRewards,
    required TResult orElse(),
  }) {
    if (loadMember != null) {
      return loadMember(this);
    }
    return orElse();
  }
}

abstract class LoadMember implements LoyaltyEvent {
  const factory LoadMember(final String customerUuid) = _$LoadMemberImpl;

  String get customerUuid;

  /// Create a copy of LoyaltyEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadMemberImplCopyWith<_$LoadMemberImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$EnrollMemberImplCopyWith<$Res> {
  factory _$$EnrollMemberImplCopyWith(
          _$EnrollMemberImpl value, $Res Function(_$EnrollMemberImpl) then) =
      __$$EnrollMemberImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String customerUuid, String name, String phone});
}

/// @nodoc
class __$$EnrollMemberImplCopyWithImpl<$Res>
    extends _$LoyaltyEventCopyWithImpl<$Res, _$EnrollMemberImpl>
    implements _$$EnrollMemberImplCopyWith<$Res> {
  __$$EnrollMemberImplCopyWithImpl(
      _$EnrollMemberImpl _value, $Res Function(_$EnrollMemberImpl) _then)
      : super(_value, _then);

  /// Create a copy of LoyaltyEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? customerUuid = null,
    Object? name = null,
    Object? phone = null,
  }) {
    return _then(_$EnrollMemberImpl(
      null == customerUuid
          ? _value.customerUuid
          : customerUuid // ignore: cast_nullable_to_non_nullable
              as String,
      null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$EnrollMemberImpl implements EnrollMember {
  const _$EnrollMemberImpl(this.customerUuid, this.name, this.phone);

  @override
  final String customerUuid;
  @override
  final String name;
  @override
  final String phone;

  @override
  String toString() {
    return 'LoyaltyEvent.enroll(customerUuid: $customerUuid, name: $name, phone: $phone)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EnrollMemberImpl &&
            (identical(other.customerUuid, customerUuid) ||
                other.customerUuid == customerUuid) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.phone, phone) || other.phone == phone));
  }

  @override
  int get hashCode => Object.hash(runtimeType, customerUuid, name, phone);

  /// Create a copy of LoyaltyEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EnrollMemberImplCopyWith<_$EnrollMemberImpl> get copyWith =>
      __$$EnrollMemberImplCopyWithImpl<_$EnrollMemberImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String customerUuid) loadMember,
    required TResult Function(String customerUuid, String name, String phone)
        enroll,
    required TResult Function(
            String customerUuid, double amount, String orderUuid)
        earnPoints,
    required TResult Function(
            String customerUuid, LoyaltyReward reward, String orderUuid)
        redeemReward,
    required TResult Function() loadRewards,
  }) {
    return enroll(customerUuid, name, phone);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String customerUuid)? loadMember,
    TResult? Function(String customerUuid, String name, String phone)? enroll,
    TResult? Function(String customerUuid, double amount, String orderUuid)?
        earnPoints,
    TResult? Function(
            String customerUuid, LoyaltyReward reward, String orderUuid)?
        redeemReward,
    TResult? Function()? loadRewards,
  }) {
    return enroll?.call(customerUuid, name, phone);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String customerUuid)? loadMember,
    TResult Function(String customerUuid, String name, String phone)? enroll,
    TResult Function(String customerUuid, double amount, String orderUuid)?
        earnPoints,
    TResult Function(
            String customerUuid, LoyaltyReward reward, String orderUuid)?
        redeemReward,
    TResult Function()? loadRewards,
    required TResult orElse(),
  }) {
    if (enroll != null) {
      return enroll(customerUuid, name, phone);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadMember value) loadMember,
    required TResult Function(EnrollMember value) enroll,
    required TResult Function(EarnPoints value) earnPoints,
    required TResult Function(RedeemReward value) redeemReward,
    required TResult Function(LoadRewards value) loadRewards,
  }) {
    return enroll(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadMember value)? loadMember,
    TResult? Function(EnrollMember value)? enroll,
    TResult? Function(EarnPoints value)? earnPoints,
    TResult? Function(RedeemReward value)? redeemReward,
    TResult? Function(LoadRewards value)? loadRewards,
  }) {
    return enroll?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadMember value)? loadMember,
    TResult Function(EnrollMember value)? enroll,
    TResult Function(EarnPoints value)? earnPoints,
    TResult Function(RedeemReward value)? redeemReward,
    TResult Function(LoadRewards value)? loadRewards,
    required TResult orElse(),
  }) {
    if (enroll != null) {
      return enroll(this);
    }
    return orElse();
  }
}

abstract class EnrollMember implements LoyaltyEvent {
  const factory EnrollMember(
          final String customerUuid, final String name, final String phone) =
      _$EnrollMemberImpl;

  String get customerUuid;
  String get name;
  String get phone;

  /// Create a copy of LoyaltyEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EnrollMemberImplCopyWith<_$EnrollMemberImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$EarnPointsImplCopyWith<$Res> {
  factory _$$EarnPointsImplCopyWith(
          _$EarnPointsImpl value, $Res Function(_$EarnPointsImpl) then) =
      __$$EarnPointsImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String customerUuid, double amount, String orderUuid});
}

/// @nodoc
class __$$EarnPointsImplCopyWithImpl<$Res>
    extends _$LoyaltyEventCopyWithImpl<$Res, _$EarnPointsImpl>
    implements _$$EarnPointsImplCopyWith<$Res> {
  __$$EarnPointsImplCopyWithImpl(
      _$EarnPointsImpl _value, $Res Function(_$EarnPointsImpl) _then)
      : super(_value, _then);

  /// Create a copy of LoyaltyEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? customerUuid = null,
    Object? amount = null,
    Object? orderUuid = null,
  }) {
    return _then(_$EarnPointsImpl(
      null == customerUuid
          ? _value.customerUuid
          : customerUuid // ignore: cast_nullable_to_non_nullable
              as String,
      null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      null == orderUuid
          ? _value.orderUuid
          : orderUuid // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$EarnPointsImpl implements EarnPoints {
  const _$EarnPointsImpl(this.customerUuid, this.amount, this.orderUuid);

  @override
  final String customerUuid;
  @override
  final double amount;
  @override
  final String orderUuid;

  @override
  String toString() {
    return 'LoyaltyEvent.earnPoints(customerUuid: $customerUuid, amount: $amount, orderUuid: $orderUuid)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EarnPointsImpl &&
            (identical(other.customerUuid, customerUuid) ||
                other.customerUuid == customerUuid) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.orderUuid, orderUuid) ||
                other.orderUuid == orderUuid));
  }

  @override
  int get hashCode => Object.hash(runtimeType, customerUuid, amount, orderUuid);

  /// Create a copy of LoyaltyEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EarnPointsImplCopyWith<_$EarnPointsImpl> get copyWith =>
      __$$EarnPointsImplCopyWithImpl<_$EarnPointsImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String customerUuid) loadMember,
    required TResult Function(String customerUuid, String name, String phone)
        enroll,
    required TResult Function(
            String customerUuid, double amount, String orderUuid)
        earnPoints,
    required TResult Function(
            String customerUuid, LoyaltyReward reward, String orderUuid)
        redeemReward,
    required TResult Function() loadRewards,
  }) {
    return earnPoints(customerUuid, amount, orderUuid);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String customerUuid)? loadMember,
    TResult? Function(String customerUuid, String name, String phone)? enroll,
    TResult? Function(String customerUuid, double amount, String orderUuid)?
        earnPoints,
    TResult? Function(
            String customerUuid, LoyaltyReward reward, String orderUuid)?
        redeemReward,
    TResult? Function()? loadRewards,
  }) {
    return earnPoints?.call(customerUuid, amount, orderUuid);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String customerUuid)? loadMember,
    TResult Function(String customerUuid, String name, String phone)? enroll,
    TResult Function(String customerUuid, double amount, String orderUuid)?
        earnPoints,
    TResult Function(
            String customerUuid, LoyaltyReward reward, String orderUuid)?
        redeemReward,
    TResult Function()? loadRewards,
    required TResult orElse(),
  }) {
    if (earnPoints != null) {
      return earnPoints(customerUuid, amount, orderUuid);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadMember value) loadMember,
    required TResult Function(EnrollMember value) enroll,
    required TResult Function(EarnPoints value) earnPoints,
    required TResult Function(RedeemReward value) redeemReward,
    required TResult Function(LoadRewards value) loadRewards,
  }) {
    return earnPoints(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadMember value)? loadMember,
    TResult? Function(EnrollMember value)? enroll,
    TResult? Function(EarnPoints value)? earnPoints,
    TResult? Function(RedeemReward value)? redeemReward,
    TResult? Function(LoadRewards value)? loadRewards,
  }) {
    return earnPoints?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadMember value)? loadMember,
    TResult Function(EnrollMember value)? enroll,
    TResult Function(EarnPoints value)? earnPoints,
    TResult Function(RedeemReward value)? redeemReward,
    TResult Function(LoadRewards value)? loadRewards,
    required TResult orElse(),
  }) {
    if (earnPoints != null) {
      return earnPoints(this);
    }
    return orElse();
  }
}

abstract class EarnPoints implements LoyaltyEvent {
  const factory EarnPoints(final String customerUuid, final double amount,
      final String orderUuid) = _$EarnPointsImpl;

  String get customerUuid;
  double get amount;
  String get orderUuid;

  /// Create a copy of LoyaltyEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EarnPointsImplCopyWith<_$EarnPointsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RedeemRewardImplCopyWith<$Res> {
  factory _$$RedeemRewardImplCopyWith(
          _$RedeemRewardImpl value, $Res Function(_$RedeemRewardImpl) then) =
      __$$RedeemRewardImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String customerUuid, LoyaltyReward reward, String orderUuid});

  $LoyaltyRewardCopyWith<$Res> get reward;
}

/// @nodoc
class __$$RedeemRewardImplCopyWithImpl<$Res>
    extends _$LoyaltyEventCopyWithImpl<$Res, _$RedeemRewardImpl>
    implements _$$RedeemRewardImplCopyWith<$Res> {
  __$$RedeemRewardImplCopyWithImpl(
      _$RedeemRewardImpl _value, $Res Function(_$RedeemRewardImpl) _then)
      : super(_value, _then);

  /// Create a copy of LoyaltyEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? customerUuid = null,
    Object? reward = null,
    Object? orderUuid = null,
  }) {
    return _then(_$RedeemRewardImpl(
      null == customerUuid
          ? _value.customerUuid
          : customerUuid // ignore: cast_nullable_to_non_nullable
              as String,
      null == reward
          ? _value.reward
          : reward // ignore: cast_nullable_to_non_nullable
              as LoyaltyReward,
      null == orderUuid
          ? _value.orderUuid
          : orderUuid // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }

  /// Create a copy of LoyaltyEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LoyaltyRewardCopyWith<$Res> get reward {
    return $LoyaltyRewardCopyWith<$Res>(_value.reward, (value) {
      return _then(_value.copyWith(reward: value));
    });
  }
}

/// @nodoc

class _$RedeemRewardImpl implements RedeemReward {
  const _$RedeemRewardImpl(this.customerUuid, this.reward, this.orderUuid);

  @override
  final String customerUuid;
  @override
  final LoyaltyReward reward;
  @override
  final String orderUuid;

  @override
  String toString() {
    return 'LoyaltyEvent.redeemReward(customerUuid: $customerUuid, reward: $reward, orderUuid: $orderUuid)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RedeemRewardImpl &&
            (identical(other.customerUuid, customerUuid) ||
                other.customerUuid == customerUuid) &&
            (identical(other.reward, reward) || other.reward == reward) &&
            (identical(other.orderUuid, orderUuid) ||
                other.orderUuid == orderUuid));
  }

  @override
  int get hashCode => Object.hash(runtimeType, customerUuid, reward, orderUuid);

  /// Create a copy of LoyaltyEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RedeemRewardImplCopyWith<_$RedeemRewardImpl> get copyWith =>
      __$$RedeemRewardImplCopyWithImpl<_$RedeemRewardImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String customerUuid) loadMember,
    required TResult Function(String customerUuid, String name, String phone)
        enroll,
    required TResult Function(
            String customerUuid, double amount, String orderUuid)
        earnPoints,
    required TResult Function(
            String customerUuid, LoyaltyReward reward, String orderUuid)
        redeemReward,
    required TResult Function() loadRewards,
  }) {
    return redeemReward(customerUuid, reward, orderUuid);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String customerUuid)? loadMember,
    TResult? Function(String customerUuid, String name, String phone)? enroll,
    TResult? Function(String customerUuid, double amount, String orderUuid)?
        earnPoints,
    TResult? Function(
            String customerUuid, LoyaltyReward reward, String orderUuid)?
        redeemReward,
    TResult? Function()? loadRewards,
  }) {
    return redeemReward?.call(customerUuid, reward, orderUuid);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String customerUuid)? loadMember,
    TResult Function(String customerUuid, String name, String phone)? enroll,
    TResult Function(String customerUuid, double amount, String orderUuid)?
        earnPoints,
    TResult Function(
            String customerUuid, LoyaltyReward reward, String orderUuid)?
        redeemReward,
    TResult Function()? loadRewards,
    required TResult orElse(),
  }) {
    if (redeemReward != null) {
      return redeemReward(customerUuid, reward, orderUuid);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadMember value) loadMember,
    required TResult Function(EnrollMember value) enroll,
    required TResult Function(EarnPoints value) earnPoints,
    required TResult Function(RedeemReward value) redeemReward,
    required TResult Function(LoadRewards value) loadRewards,
  }) {
    return redeemReward(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadMember value)? loadMember,
    TResult? Function(EnrollMember value)? enroll,
    TResult? Function(EarnPoints value)? earnPoints,
    TResult? Function(RedeemReward value)? redeemReward,
    TResult? Function(LoadRewards value)? loadRewards,
  }) {
    return redeemReward?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadMember value)? loadMember,
    TResult Function(EnrollMember value)? enroll,
    TResult Function(EarnPoints value)? earnPoints,
    TResult Function(RedeemReward value)? redeemReward,
    TResult Function(LoadRewards value)? loadRewards,
    required TResult orElse(),
  }) {
    if (redeemReward != null) {
      return redeemReward(this);
    }
    return orElse();
  }
}

abstract class RedeemReward implements LoyaltyEvent {
  const factory RedeemReward(final String customerUuid,
      final LoyaltyReward reward, final String orderUuid) = _$RedeemRewardImpl;

  String get customerUuid;
  LoyaltyReward get reward;
  String get orderUuid;

  /// Create a copy of LoyaltyEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RedeemRewardImplCopyWith<_$RedeemRewardImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadRewardsImplCopyWith<$Res> {
  factory _$$LoadRewardsImplCopyWith(
          _$LoadRewardsImpl value, $Res Function(_$LoadRewardsImpl) then) =
      __$$LoadRewardsImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadRewardsImplCopyWithImpl<$Res>
    extends _$LoyaltyEventCopyWithImpl<$Res, _$LoadRewardsImpl>
    implements _$$LoadRewardsImplCopyWith<$Res> {
  __$$LoadRewardsImplCopyWithImpl(
      _$LoadRewardsImpl _value, $Res Function(_$LoadRewardsImpl) _then)
      : super(_value, _then);

  /// Create a copy of LoyaltyEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadRewardsImpl implements LoadRewards {
  const _$LoadRewardsImpl();

  @override
  String toString() {
    return 'LoyaltyEvent.loadRewards()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadRewardsImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String customerUuid) loadMember,
    required TResult Function(String customerUuid, String name, String phone)
        enroll,
    required TResult Function(
            String customerUuid, double amount, String orderUuid)
        earnPoints,
    required TResult Function(
            String customerUuid, LoyaltyReward reward, String orderUuid)
        redeemReward,
    required TResult Function() loadRewards,
  }) {
    return loadRewards();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String customerUuid)? loadMember,
    TResult? Function(String customerUuid, String name, String phone)? enroll,
    TResult? Function(String customerUuid, double amount, String orderUuid)?
        earnPoints,
    TResult? Function(
            String customerUuid, LoyaltyReward reward, String orderUuid)?
        redeemReward,
    TResult? Function()? loadRewards,
  }) {
    return loadRewards?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String customerUuid)? loadMember,
    TResult Function(String customerUuid, String name, String phone)? enroll,
    TResult Function(String customerUuid, double amount, String orderUuid)?
        earnPoints,
    TResult Function(
            String customerUuid, LoyaltyReward reward, String orderUuid)?
        redeemReward,
    TResult Function()? loadRewards,
    required TResult orElse(),
  }) {
    if (loadRewards != null) {
      return loadRewards();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadMember value) loadMember,
    required TResult Function(EnrollMember value) enroll,
    required TResult Function(EarnPoints value) earnPoints,
    required TResult Function(RedeemReward value) redeemReward,
    required TResult Function(LoadRewards value) loadRewards,
  }) {
    return loadRewards(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadMember value)? loadMember,
    TResult? Function(EnrollMember value)? enroll,
    TResult? Function(EarnPoints value)? earnPoints,
    TResult? Function(RedeemReward value)? redeemReward,
    TResult? Function(LoadRewards value)? loadRewards,
  }) {
    return loadRewards?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadMember value)? loadMember,
    TResult Function(EnrollMember value)? enroll,
    TResult Function(EarnPoints value)? earnPoints,
    TResult Function(RedeemReward value)? redeemReward,
    TResult Function(LoadRewards value)? loadRewards,
    required TResult orElse(),
  }) {
    if (loadRewards != null) {
      return loadRewards(this);
    }
    return orElse();
  }
}

abstract class LoadRewards implements LoyaltyEvent {
  const factory LoadRewards() = _$LoadRewardsImpl;
}
