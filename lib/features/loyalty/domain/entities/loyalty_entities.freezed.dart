// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'loyalty_entities.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LoyaltyConfig _$LoyaltyConfigFromJson(Map<String, dynamic> json) {
  return _LoyaltyConfig.fromJson(json);
}

/// @nodoc
mixin _$LoyaltyConfig {
  double get pointsPerDollar =>
      throw _privateConstructorUsedError; // How many points per $1 spent
  int get pointsForVisit =>
      throw _privateConstructorUsedError; // Bonus points per visit
  int get signupBonus =>
      throw _privateConstructorUsedError; // Points for new registration
  int get birthdayBonus =>
      throw _privateConstructorUsedError; // Birthday reward points
  int get redeemThreshold =>
      throw _privateConstructorUsedError; // Minimum points to redeem
  double get redeemValue => throw _privateConstructorUsedError;

  /// Serializes this LoyaltyConfig to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LoyaltyConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LoyaltyConfigCopyWith<LoyaltyConfig> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoyaltyConfigCopyWith<$Res> {
  factory $LoyaltyConfigCopyWith(
          LoyaltyConfig value, $Res Function(LoyaltyConfig) then) =
      _$LoyaltyConfigCopyWithImpl<$Res, LoyaltyConfig>;
  @useResult
  $Res call(
      {double pointsPerDollar,
      int pointsForVisit,
      int signupBonus,
      int birthdayBonus,
      int redeemThreshold,
      double redeemValue});
}

/// @nodoc
class _$LoyaltyConfigCopyWithImpl<$Res, $Val extends LoyaltyConfig>
    implements $LoyaltyConfigCopyWith<$Res> {
  _$LoyaltyConfigCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LoyaltyConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pointsPerDollar = null,
    Object? pointsForVisit = null,
    Object? signupBonus = null,
    Object? birthdayBonus = null,
    Object? redeemThreshold = null,
    Object? redeemValue = null,
  }) {
    return _then(_value.copyWith(
      pointsPerDollar: null == pointsPerDollar
          ? _value.pointsPerDollar
          : pointsPerDollar // ignore: cast_nullable_to_non_nullable
              as double,
      pointsForVisit: null == pointsForVisit
          ? _value.pointsForVisit
          : pointsForVisit // ignore: cast_nullable_to_non_nullable
              as int,
      signupBonus: null == signupBonus
          ? _value.signupBonus
          : signupBonus // ignore: cast_nullable_to_non_nullable
              as int,
      birthdayBonus: null == birthdayBonus
          ? _value.birthdayBonus
          : birthdayBonus // ignore: cast_nullable_to_non_nullable
              as int,
      redeemThreshold: null == redeemThreshold
          ? _value.redeemThreshold
          : redeemThreshold // ignore: cast_nullable_to_non_nullable
              as int,
      redeemValue: null == redeemValue
          ? _value.redeemValue
          : redeemValue // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LoyaltyConfigImplCopyWith<$Res>
    implements $LoyaltyConfigCopyWith<$Res> {
  factory _$$LoyaltyConfigImplCopyWith(
          _$LoyaltyConfigImpl value, $Res Function(_$LoyaltyConfigImpl) then) =
      __$$LoyaltyConfigImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double pointsPerDollar,
      int pointsForVisit,
      int signupBonus,
      int birthdayBonus,
      int redeemThreshold,
      double redeemValue});
}

/// @nodoc
class __$$LoyaltyConfigImplCopyWithImpl<$Res>
    extends _$LoyaltyConfigCopyWithImpl<$Res, _$LoyaltyConfigImpl>
    implements _$$LoyaltyConfigImplCopyWith<$Res> {
  __$$LoyaltyConfigImplCopyWithImpl(
      _$LoyaltyConfigImpl _value, $Res Function(_$LoyaltyConfigImpl) _then)
      : super(_value, _then);

  /// Create a copy of LoyaltyConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pointsPerDollar = null,
    Object? pointsForVisit = null,
    Object? signupBonus = null,
    Object? birthdayBonus = null,
    Object? redeemThreshold = null,
    Object? redeemValue = null,
  }) {
    return _then(_$LoyaltyConfigImpl(
      pointsPerDollar: null == pointsPerDollar
          ? _value.pointsPerDollar
          : pointsPerDollar // ignore: cast_nullable_to_non_nullable
              as double,
      pointsForVisit: null == pointsForVisit
          ? _value.pointsForVisit
          : pointsForVisit // ignore: cast_nullable_to_non_nullable
              as int,
      signupBonus: null == signupBonus
          ? _value.signupBonus
          : signupBonus // ignore: cast_nullable_to_non_nullable
              as int,
      birthdayBonus: null == birthdayBonus
          ? _value.birthdayBonus
          : birthdayBonus // ignore: cast_nullable_to_non_nullable
              as int,
      redeemThreshold: null == redeemThreshold
          ? _value.redeemThreshold
          : redeemThreshold // ignore: cast_nullable_to_non_nullable
              as int,
      redeemValue: null == redeemValue
          ? _value.redeemValue
          : redeemValue // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LoyaltyConfigImpl implements _LoyaltyConfig {
  const _$LoyaltyConfigImpl(
      {this.pointsPerDollar = 1.0,
      this.pointsForVisit = 10,
      this.signupBonus = 50,
      this.birthdayBonus = 100,
      this.redeemThreshold = 100,
      this.redeemValue = 10.0});

  factory _$LoyaltyConfigImpl.fromJson(Map<String, dynamic> json) =>
      _$$LoyaltyConfigImplFromJson(json);

  @override
  @JsonKey()
  final double pointsPerDollar;
// How many points per $1 spent
  @override
  @JsonKey()
  final int pointsForVisit;
// Bonus points per visit
  @override
  @JsonKey()
  final int signupBonus;
// Points for new registration
  @override
  @JsonKey()
  final int birthdayBonus;
// Birthday reward points
  @override
  @JsonKey()
  final int redeemThreshold;
// Minimum points to redeem
  @override
  @JsonKey()
  final double redeemValue;

  @override
  String toString() {
    return 'LoyaltyConfig(pointsPerDollar: $pointsPerDollar, pointsForVisit: $pointsForVisit, signupBonus: $signupBonus, birthdayBonus: $birthdayBonus, redeemThreshold: $redeemThreshold, redeemValue: $redeemValue)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoyaltyConfigImpl &&
            (identical(other.pointsPerDollar, pointsPerDollar) ||
                other.pointsPerDollar == pointsPerDollar) &&
            (identical(other.pointsForVisit, pointsForVisit) ||
                other.pointsForVisit == pointsForVisit) &&
            (identical(other.signupBonus, signupBonus) ||
                other.signupBonus == signupBonus) &&
            (identical(other.birthdayBonus, birthdayBonus) ||
                other.birthdayBonus == birthdayBonus) &&
            (identical(other.redeemThreshold, redeemThreshold) ||
                other.redeemThreshold == redeemThreshold) &&
            (identical(other.redeemValue, redeemValue) ||
                other.redeemValue == redeemValue));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, pointsPerDollar, pointsForVisit,
      signupBonus, birthdayBonus, redeemThreshold, redeemValue);

  /// Create a copy of LoyaltyConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoyaltyConfigImplCopyWith<_$LoyaltyConfigImpl> get copyWith =>
      __$$LoyaltyConfigImplCopyWithImpl<_$LoyaltyConfigImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LoyaltyConfigImplToJson(
      this,
    );
  }
}

abstract class _LoyaltyConfig implements LoyaltyConfig {
  const factory _LoyaltyConfig(
      {final double pointsPerDollar,
      final int pointsForVisit,
      final int signupBonus,
      final int birthdayBonus,
      final int redeemThreshold,
      final double redeemValue}) = _$LoyaltyConfigImpl;

  factory _LoyaltyConfig.fromJson(Map<String, dynamic> json) =
      _$LoyaltyConfigImpl.fromJson;

  @override
  double get pointsPerDollar; // How many points per $1 spent
  @override
  int get pointsForVisit; // Bonus points per visit
  @override
  int get signupBonus; // Points for new registration
  @override
  int get birthdayBonus; // Birthday reward points
  @override
  int get redeemThreshold; // Minimum points to redeem
  @override
  double get redeemValue;

  /// Create a copy of LoyaltyConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoyaltyConfigImplCopyWith<_$LoyaltyConfigImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

LoyaltyMember _$LoyaltyMemberFromJson(Map<String, dynamic> json) {
  return _LoyaltyMember.fromJson(json);
}

/// @nodoc
mixin _$LoyaltyMember {
  String get customerUuid => throw _privateConstructorUsedError;
  String get customerName => throw _privateConstructorUsedError;
  String get phoneNumber => throw _privateConstructorUsedError;
  int get currentPoints => throw _privateConstructorUsedError;
  int get lifetimePoints => throw _privateConstructorUsedError;
  LoyaltyTier get tier => throw _privateConstructorUsedError;
  DateTime? get enrolledAt => throw _privateConstructorUsedError;
  DateTime? get lastEarnedAt => throw _privateConstructorUsedError;
  DateTime? get birthday => throw _privateConstructorUsedError;

  /// Serializes this LoyaltyMember to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LoyaltyMember
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LoyaltyMemberCopyWith<LoyaltyMember> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoyaltyMemberCopyWith<$Res> {
  factory $LoyaltyMemberCopyWith(
          LoyaltyMember value, $Res Function(LoyaltyMember) then) =
      _$LoyaltyMemberCopyWithImpl<$Res, LoyaltyMember>;
  @useResult
  $Res call(
      {String customerUuid,
      String customerName,
      String phoneNumber,
      int currentPoints,
      int lifetimePoints,
      LoyaltyTier tier,
      DateTime? enrolledAt,
      DateTime? lastEarnedAt,
      DateTime? birthday});
}

/// @nodoc
class _$LoyaltyMemberCopyWithImpl<$Res, $Val extends LoyaltyMember>
    implements $LoyaltyMemberCopyWith<$Res> {
  _$LoyaltyMemberCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LoyaltyMember
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? customerUuid = null,
    Object? customerName = null,
    Object? phoneNumber = null,
    Object? currentPoints = null,
    Object? lifetimePoints = null,
    Object? tier = null,
    Object? enrolledAt = freezed,
    Object? lastEarnedAt = freezed,
    Object? birthday = freezed,
  }) {
    return _then(_value.copyWith(
      customerUuid: null == customerUuid
          ? _value.customerUuid
          : customerUuid // ignore: cast_nullable_to_non_nullable
              as String,
      customerName: null == customerName
          ? _value.customerName
          : customerName // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      currentPoints: null == currentPoints
          ? _value.currentPoints
          : currentPoints // ignore: cast_nullable_to_non_nullable
              as int,
      lifetimePoints: null == lifetimePoints
          ? _value.lifetimePoints
          : lifetimePoints // ignore: cast_nullable_to_non_nullable
              as int,
      tier: null == tier
          ? _value.tier
          : tier // ignore: cast_nullable_to_non_nullable
              as LoyaltyTier,
      enrolledAt: freezed == enrolledAt
          ? _value.enrolledAt
          : enrolledAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      lastEarnedAt: freezed == lastEarnedAt
          ? _value.lastEarnedAt
          : lastEarnedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      birthday: freezed == birthday
          ? _value.birthday
          : birthday // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LoyaltyMemberImplCopyWith<$Res>
    implements $LoyaltyMemberCopyWith<$Res> {
  factory _$$LoyaltyMemberImplCopyWith(
          _$LoyaltyMemberImpl value, $Res Function(_$LoyaltyMemberImpl) then) =
      __$$LoyaltyMemberImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String customerUuid,
      String customerName,
      String phoneNumber,
      int currentPoints,
      int lifetimePoints,
      LoyaltyTier tier,
      DateTime? enrolledAt,
      DateTime? lastEarnedAt,
      DateTime? birthday});
}

/// @nodoc
class __$$LoyaltyMemberImplCopyWithImpl<$Res>
    extends _$LoyaltyMemberCopyWithImpl<$Res, _$LoyaltyMemberImpl>
    implements _$$LoyaltyMemberImplCopyWith<$Res> {
  __$$LoyaltyMemberImplCopyWithImpl(
      _$LoyaltyMemberImpl _value, $Res Function(_$LoyaltyMemberImpl) _then)
      : super(_value, _then);

  /// Create a copy of LoyaltyMember
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? customerUuid = null,
    Object? customerName = null,
    Object? phoneNumber = null,
    Object? currentPoints = null,
    Object? lifetimePoints = null,
    Object? tier = null,
    Object? enrolledAt = freezed,
    Object? lastEarnedAt = freezed,
    Object? birthday = freezed,
  }) {
    return _then(_$LoyaltyMemberImpl(
      customerUuid: null == customerUuid
          ? _value.customerUuid
          : customerUuid // ignore: cast_nullable_to_non_nullable
              as String,
      customerName: null == customerName
          ? _value.customerName
          : customerName // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      currentPoints: null == currentPoints
          ? _value.currentPoints
          : currentPoints // ignore: cast_nullable_to_non_nullable
              as int,
      lifetimePoints: null == lifetimePoints
          ? _value.lifetimePoints
          : lifetimePoints // ignore: cast_nullable_to_non_nullable
              as int,
      tier: null == tier
          ? _value.tier
          : tier // ignore: cast_nullable_to_non_nullable
              as LoyaltyTier,
      enrolledAt: freezed == enrolledAt
          ? _value.enrolledAt
          : enrolledAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      lastEarnedAt: freezed == lastEarnedAt
          ? _value.lastEarnedAt
          : lastEarnedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      birthday: freezed == birthday
          ? _value.birthday
          : birthday // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LoyaltyMemberImpl implements _LoyaltyMember {
  const _$LoyaltyMemberImpl(
      {required this.customerUuid,
      required this.customerName,
      required this.phoneNumber,
      required this.currentPoints,
      required this.lifetimePoints,
      required this.tier,
      this.enrolledAt,
      this.lastEarnedAt,
      this.birthday});

  factory _$LoyaltyMemberImpl.fromJson(Map<String, dynamic> json) =>
      _$$LoyaltyMemberImplFromJson(json);

  @override
  final String customerUuid;
  @override
  final String customerName;
  @override
  final String phoneNumber;
  @override
  final int currentPoints;
  @override
  final int lifetimePoints;
  @override
  final LoyaltyTier tier;
  @override
  final DateTime? enrolledAt;
  @override
  final DateTime? lastEarnedAt;
  @override
  final DateTime? birthday;

  @override
  String toString() {
    return 'LoyaltyMember(customerUuid: $customerUuid, customerName: $customerName, phoneNumber: $phoneNumber, currentPoints: $currentPoints, lifetimePoints: $lifetimePoints, tier: $tier, enrolledAt: $enrolledAt, lastEarnedAt: $lastEarnedAt, birthday: $birthday)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoyaltyMemberImpl &&
            (identical(other.customerUuid, customerUuid) ||
                other.customerUuid == customerUuid) &&
            (identical(other.customerName, customerName) ||
                other.customerName == customerName) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.currentPoints, currentPoints) ||
                other.currentPoints == currentPoints) &&
            (identical(other.lifetimePoints, lifetimePoints) ||
                other.lifetimePoints == lifetimePoints) &&
            (identical(other.tier, tier) || other.tier == tier) &&
            (identical(other.enrolledAt, enrolledAt) ||
                other.enrolledAt == enrolledAt) &&
            (identical(other.lastEarnedAt, lastEarnedAt) ||
                other.lastEarnedAt == lastEarnedAt) &&
            (identical(other.birthday, birthday) ||
                other.birthday == birthday));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      customerUuid,
      customerName,
      phoneNumber,
      currentPoints,
      lifetimePoints,
      tier,
      enrolledAt,
      lastEarnedAt,
      birthday);

  /// Create a copy of LoyaltyMember
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoyaltyMemberImplCopyWith<_$LoyaltyMemberImpl> get copyWith =>
      __$$LoyaltyMemberImplCopyWithImpl<_$LoyaltyMemberImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LoyaltyMemberImplToJson(
      this,
    );
  }
}

abstract class _LoyaltyMember implements LoyaltyMember {
  const factory _LoyaltyMember(
      {required final String customerUuid,
      required final String customerName,
      required final String phoneNumber,
      required final int currentPoints,
      required final int lifetimePoints,
      required final LoyaltyTier tier,
      final DateTime? enrolledAt,
      final DateTime? lastEarnedAt,
      final DateTime? birthday}) = _$LoyaltyMemberImpl;

  factory _LoyaltyMember.fromJson(Map<String, dynamic> json) =
      _$LoyaltyMemberImpl.fromJson;

  @override
  String get customerUuid;
  @override
  String get customerName;
  @override
  String get phoneNumber;
  @override
  int get currentPoints;
  @override
  int get lifetimePoints;
  @override
  LoyaltyTier get tier;
  @override
  DateTime? get enrolledAt;
  @override
  DateTime? get lastEarnedAt;
  @override
  DateTime? get birthday;

  /// Create a copy of LoyaltyMember
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoyaltyMemberImplCopyWith<_$LoyaltyMemberImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

LoyaltyTransaction _$LoyaltyTransactionFromJson(Map<String, dynamic> json) {
  return _LoyaltyTransaction.fromJson(json);
}

/// @nodoc
mixin _$LoyaltyTransaction {
  String get id => throw _privateConstructorUsedError;
  String get customerUuid => throw _privateConstructorUsedError;
  int get pointsChange =>
      throw _privateConstructorUsedError; // Positive = earned, Negative = redeemed
  String get reason =>
      throw _privateConstructorUsedError; // 'purchase', 'redeem', 'signup_bonus', 'birthday'
  DateTime? get transactionDate => throw _privateConstructorUsedError;
  String? get orderUuid => throw _privateConstructorUsedError;

  /// Serializes this LoyaltyTransaction to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LoyaltyTransaction
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LoyaltyTransactionCopyWith<LoyaltyTransaction> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoyaltyTransactionCopyWith<$Res> {
  factory $LoyaltyTransactionCopyWith(
          LoyaltyTransaction value, $Res Function(LoyaltyTransaction) then) =
      _$LoyaltyTransactionCopyWithImpl<$Res, LoyaltyTransaction>;
  @useResult
  $Res call(
      {String id,
      String customerUuid,
      int pointsChange,
      String reason,
      DateTime? transactionDate,
      String? orderUuid});
}

/// @nodoc
class _$LoyaltyTransactionCopyWithImpl<$Res, $Val extends LoyaltyTransaction>
    implements $LoyaltyTransactionCopyWith<$Res> {
  _$LoyaltyTransactionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LoyaltyTransaction
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? customerUuid = null,
    Object? pointsChange = null,
    Object? reason = null,
    Object? transactionDate = freezed,
    Object? orderUuid = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      customerUuid: null == customerUuid
          ? _value.customerUuid
          : customerUuid // ignore: cast_nullable_to_non_nullable
              as String,
      pointsChange: null == pointsChange
          ? _value.pointsChange
          : pointsChange // ignore: cast_nullable_to_non_nullable
              as int,
      reason: null == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String,
      transactionDate: freezed == transactionDate
          ? _value.transactionDate
          : transactionDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      orderUuid: freezed == orderUuid
          ? _value.orderUuid
          : orderUuid // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LoyaltyTransactionImplCopyWith<$Res>
    implements $LoyaltyTransactionCopyWith<$Res> {
  factory _$$LoyaltyTransactionImplCopyWith(_$LoyaltyTransactionImpl value,
          $Res Function(_$LoyaltyTransactionImpl) then) =
      __$$LoyaltyTransactionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String customerUuid,
      int pointsChange,
      String reason,
      DateTime? transactionDate,
      String? orderUuid});
}

/// @nodoc
class __$$LoyaltyTransactionImplCopyWithImpl<$Res>
    extends _$LoyaltyTransactionCopyWithImpl<$Res, _$LoyaltyTransactionImpl>
    implements _$$LoyaltyTransactionImplCopyWith<$Res> {
  __$$LoyaltyTransactionImplCopyWithImpl(_$LoyaltyTransactionImpl _value,
      $Res Function(_$LoyaltyTransactionImpl) _then)
      : super(_value, _then);

  /// Create a copy of LoyaltyTransaction
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? customerUuid = null,
    Object? pointsChange = null,
    Object? reason = null,
    Object? transactionDate = freezed,
    Object? orderUuid = freezed,
  }) {
    return _then(_$LoyaltyTransactionImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      customerUuid: null == customerUuid
          ? _value.customerUuid
          : customerUuid // ignore: cast_nullable_to_non_nullable
              as String,
      pointsChange: null == pointsChange
          ? _value.pointsChange
          : pointsChange // ignore: cast_nullable_to_non_nullable
              as int,
      reason: null == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String,
      transactionDate: freezed == transactionDate
          ? _value.transactionDate
          : transactionDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      orderUuid: freezed == orderUuid
          ? _value.orderUuid
          : orderUuid // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LoyaltyTransactionImpl implements _LoyaltyTransaction {
  const _$LoyaltyTransactionImpl(
      {required this.id,
      required this.customerUuid,
      required this.pointsChange,
      required this.reason,
      this.transactionDate,
      this.orderUuid});

  factory _$LoyaltyTransactionImpl.fromJson(Map<String, dynamic> json) =>
      _$$LoyaltyTransactionImplFromJson(json);

  @override
  final String id;
  @override
  final String customerUuid;
  @override
  final int pointsChange;
// Positive = earned, Negative = redeemed
  @override
  final String reason;
// 'purchase', 'redeem', 'signup_bonus', 'birthday'
  @override
  final DateTime? transactionDate;
  @override
  final String? orderUuid;

  @override
  String toString() {
    return 'LoyaltyTransaction(id: $id, customerUuid: $customerUuid, pointsChange: $pointsChange, reason: $reason, transactionDate: $transactionDate, orderUuid: $orderUuid)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoyaltyTransactionImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.customerUuid, customerUuid) ||
                other.customerUuid == customerUuid) &&
            (identical(other.pointsChange, pointsChange) ||
                other.pointsChange == pointsChange) &&
            (identical(other.reason, reason) || other.reason == reason) &&
            (identical(other.transactionDate, transactionDate) ||
                other.transactionDate == transactionDate) &&
            (identical(other.orderUuid, orderUuid) ||
                other.orderUuid == orderUuid));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, customerUuid, pointsChange,
      reason, transactionDate, orderUuid);

  /// Create a copy of LoyaltyTransaction
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoyaltyTransactionImplCopyWith<_$LoyaltyTransactionImpl> get copyWith =>
      __$$LoyaltyTransactionImplCopyWithImpl<_$LoyaltyTransactionImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LoyaltyTransactionImplToJson(
      this,
    );
  }
}

abstract class _LoyaltyTransaction implements LoyaltyTransaction {
  const factory _LoyaltyTransaction(
      {required final String id,
      required final String customerUuid,
      required final int pointsChange,
      required final String reason,
      final DateTime? transactionDate,
      final String? orderUuid}) = _$LoyaltyTransactionImpl;

  factory _LoyaltyTransaction.fromJson(Map<String, dynamic> json) =
      _$LoyaltyTransactionImpl.fromJson;

  @override
  String get id;
  @override
  String get customerUuid;
  @override
  int get pointsChange; // Positive = earned, Negative = redeemed
  @override
  String get reason; // 'purchase', 'redeem', 'signup_bonus', 'birthday'
  @override
  DateTime? get transactionDate;
  @override
  String? get orderUuid;

  /// Create a copy of LoyaltyTransaction
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoyaltyTransactionImplCopyWith<_$LoyaltyTransactionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

LoyaltyReward _$LoyaltyRewardFromJson(Map<String, dynamic> json) {
  return _LoyaltyReward.fromJson(json);
}

/// @nodoc
mixin _$LoyaltyReward {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  int get pointsCost => throw _privateConstructorUsedError;
  String get type =>
      throw _privateConstructorUsedError; // 'discount', 'freeItem'
  double? get discountAmount =>
      throw _privateConstructorUsedError; // For 'discount' type
  String? get freeItemUuid =>
      throw _privateConstructorUsedError; // For 'freeItem' type
  bool get isActive => throw _privateConstructorUsedError;

  /// Serializes this LoyaltyReward to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LoyaltyReward
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LoyaltyRewardCopyWith<LoyaltyReward> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoyaltyRewardCopyWith<$Res> {
  factory $LoyaltyRewardCopyWith(
          LoyaltyReward value, $Res Function(LoyaltyReward) then) =
      _$LoyaltyRewardCopyWithImpl<$Res, LoyaltyReward>;
  @useResult
  $Res call(
      {String id,
      String name,
      int pointsCost,
      String type,
      double? discountAmount,
      String? freeItemUuid,
      bool isActive});
}

/// @nodoc
class _$LoyaltyRewardCopyWithImpl<$Res, $Val extends LoyaltyReward>
    implements $LoyaltyRewardCopyWith<$Res> {
  _$LoyaltyRewardCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LoyaltyReward
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? pointsCost = null,
    Object? type = null,
    Object? discountAmount = freezed,
    Object? freeItemUuid = freezed,
    Object? isActive = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      pointsCost: null == pointsCost
          ? _value.pointsCost
          : pointsCost // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      discountAmount: freezed == discountAmount
          ? _value.discountAmount
          : discountAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      freeItemUuid: freezed == freeItemUuid
          ? _value.freeItemUuid
          : freeItemUuid // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LoyaltyRewardImplCopyWith<$Res>
    implements $LoyaltyRewardCopyWith<$Res> {
  factory _$$LoyaltyRewardImplCopyWith(
          _$LoyaltyRewardImpl value, $Res Function(_$LoyaltyRewardImpl) then) =
      __$$LoyaltyRewardImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      int pointsCost,
      String type,
      double? discountAmount,
      String? freeItemUuid,
      bool isActive});
}

/// @nodoc
class __$$LoyaltyRewardImplCopyWithImpl<$Res>
    extends _$LoyaltyRewardCopyWithImpl<$Res, _$LoyaltyRewardImpl>
    implements _$$LoyaltyRewardImplCopyWith<$Res> {
  __$$LoyaltyRewardImplCopyWithImpl(
      _$LoyaltyRewardImpl _value, $Res Function(_$LoyaltyRewardImpl) _then)
      : super(_value, _then);

  /// Create a copy of LoyaltyReward
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? pointsCost = null,
    Object? type = null,
    Object? discountAmount = freezed,
    Object? freeItemUuid = freezed,
    Object? isActive = null,
  }) {
    return _then(_$LoyaltyRewardImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      pointsCost: null == pointsCost
          ? _value.pointsCost
          : pointsCost // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      discountAmount: freezed == discountAmount
          ? _value.discountAmount
          : discountAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      freeItemUuid: freezed == freeItemUuid
          ? _value.freeItemUuid
          : freeItemUuid // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LoyaltyRewardImpl implements _LoyaltyReward {
  const _$LoyaltyRewardImpl(
      {required this.id,
      required this.name,
      required this.pointsCost,
      required this.type,
      this.discountAmount,
      this.freeItemUuid,
      this.isActive = true});

  factory _$LoyaltyRewardImpl.fromJson(Map<String, dynamic> json) =>
      _$$LoyaltyRewardImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final int pointsCost;
  @override
  final String type;
// 'discount', 'freeItem'
  @override
  final double? discountAmount;
// For 'discount' type
  @override
  final String? freeItemUuid;
// For 'freeItem' type
  @override
  @JsonKey()
  final bool isActive;

  @override
  String toString() {
    return 'LoyaltyReward(id: $id, name: $name, pointsCost: $pointsCost, type: $type, discountAmount: $discountAmount, freeItemUuid: $freeItemUuid, isActive: $isActive)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoyaltyRewardImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.pointsCost, pointsCost) ||
                other.pointsCost == pointsCost) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.discountAmount, discountAmount) ||
                other.discountAmount == discountAmount) &&
            (identical(other.freeItemUuid, freeItemUuid) ||
                other.freeItemUuid == freeItemUuid) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, pointsCost, type,
      discountAmount, freeItemUuid, isActive);

  /// Create a copy of LoyaltyReward
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoyaltyRewardImplCopyWith<_$LoyaltyRewardImpl> get copyWith =>
      __$$LoyaltyRewardImplCopyWithImpl<_$LoyaltyRewardImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LoyaltyRewardImplToJson(
      this,
    );
  }
}

abstract class _LoyaltyReward implements LoyaltyReward {
  const factory _LoyaltyReward(
      {required final String id,
      required final String name,
      required final int pointsCost,
      required final String type,
      final double? discountAmount,
      final String? freeItemUuid,
      final bool isActive}) = _$LoyaltyRewardImpl;

  factory _LoyaltyReward.fromJson(Map<String, dynamic> json) =
      _$LoyaltyRewardImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  int get pointsCost;
  @override
  String get type; // 'discount', 'freeItem'
  @override
  double? get discountAmount; // For 'discount' type
  @override
  String? get freeItemUuid; // For 'freeItem' type
  @override
  bool get isActive;

  /// Create a copy of LoyaltyReward
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoyaltyRewardImplCopyWith<_$LoyaltyRewardImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
