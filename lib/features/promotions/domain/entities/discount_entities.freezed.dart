// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'discount_entities.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Discount _$DiscountFromJson(Map<String, dynamic> json) {
  return _Discount.fromJson(json);
}

/// @nodoc
mixin _$Discount {
  String get uuid => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get code => throw _privateConstructorUsedError; // Promo code
  String? get description => throw _privateConstructorUsedError;
  DiscountType get type => throw _privateConstructorUsedError;
  DiscountScope get scope => throw _privateConstructorUsedError;
  DiscountStatus get status =>
      throw _privateConstructorUsedError; // Value based on type
  double? get percentageOff =>
      throw _privateConstructorUsedError; // For percentage type
  double? get fixedAmountOff =>
      throw _privateConstructorUsedError; // For fixed type
  int? get buyQuantity =>
      throw _privateConstructorUsedError; // For BOGO/buyXGetY
  int? get getQuantity =>
      throw _privateConstructorUsedError; // For BOGO/buyXGetY
  double? get getDiscountPercent =>
      throw _privateConstructorUsedError; // Discount on the "get" items
// Tier thresholds (for tiered discounts)
  List<DiscountTier> get tiers =>
      throw _privateConstructorUsedError; // Restrictions
  double? get minOrderAmount => throw _privateConstructorUsedError;
  double? get maxDiscountAmount => throw _privateConstructorUsedError;
  int? get maxUsesTotal => throw _privateConstructorUsedError;
  int? get maxUsesPerCustomer => throw _privateConstructorUsedError;
  int? get currentUsageCount =>
      throw _privateConstructorUsedError; // Scope restrictions
  List<String> get applicableProductUuids => throw _privateConstructorUsedError;
  List<String> get applicableCategoryUuids =>
      throw _privateConstructorUsedError;
  List<String> get applicableCustomerUuids =>
      throw _privateConstructorUsedError; // Scheduling
  DateTime? get validFrom => throw _privateConstructorUsedError;
  DateTime? get validUntil => throw _privateConstructorUsedError;
  List<int> get validDaysOfWeek =>
      throw _privateConstructorUsedError; // 1-7 (Mon-Sun)
  String? get validTimeStart => throw _privateConstructorUsedError; // "11:00"
  String? get validTimeEnd => throw _privateConstructorUsedError; // "14:00"
// Stacking rules
  bool get canStackWithOthers => throw _privateConstructorUsedError;
  int get stackPriority =>
      throw _privateConstructorUsedError; // Lower = applies first
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this Discount to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Discount
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DiscountCopyWith<Discount> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DiscountCopyWith<$Res> {
  factory $DiscountCopyWith(Discount value, $Res Function(Discount) then) =
      _$DiscountCopyWithImpl<$Res, Discount>;
  @useResult
  $Res call(
      {String uuid,
      String name,
      String code,
      String? description,
      DiscountType type,
      DiscountScope scope,
      DiscountStatus status,
      double? percentageOff,
      double? fixedAmountOff,
      int? buyQuantity,
      int? getQuantity,
      double? getDiscountPercent,
      List<DiscountTier> tiers,
      double? minOrderAmount,
      double? maxDiscountAmount,
      int? maxUsesTotal,
      int? maxUsesPerCustomer,
      int? currentUsageCount,
      List<String> applicableProductUuids,
      List<String> applicableCategoryUuids,
      List<String> applicableCustomerUuids,
      DateTime? validFrom,
      DateTime? validUntil,
      List<int> validDaysOfWeek,
      String? validTimeStart,
      String? validTimeEnd,
      bool canStackWithOthers,
      int stackPriority,
      DateTime? createdAt,
      DateTime? updatedAt});
}

/// @nodoc
class _$DiscountCopyWithImpl<$Res, $Val extends Discount>
    implements $DiscountCopyWith<$Res> {
  _$DiscountCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Discount
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
    Object? name = null,
    Object? code = null,
    Object? description = freezed,
    Object? type = null,
    Object? scope = null,
    Object? status = null,
    Object? percentageOff = freezed,
    Object? fixedAmountOff = freezed,
    Object? buyQuantity = freezed,
    Object? getQuantity = freezed,
    Object? getDiscountPercent = freezed,
    Object? tiers = null,
    Object? minOrderAmount = freezed,
    Object? maxDiscountAmount = freezed,
    Object? maxUsesTotal = freezed,
    Object? maxUsesPerCustomer = freezed,
    Object? currentUsageCount = freezed,
    Object? applicableProductUuids = null,
    Object? applicableCategoryUuids = null,
    Object? applicableCustomerUuids = null,
    Object? validFrom = freezed,
    Object? validUntil = freezed,
    Object? validDaysOfWeek = null,
    Object? validTimeStart = freezed,
    Object? validTimeEnd = freezed,
    Object? canStackWithOthers = null,
    Object? stackPriority = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as DiscountType,
      scope: null == scope
          ? _value.scope
          : scope // ignore: cast_nullable_to_non_nullable
              as DiscountScope,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as DiscountStatus,
      percentageOff: freezed == percentageOff
          ? _value.percentageOff
          : percentageOff // ignore: cast_nullable_to_non_nullable
              as double?,
      fixedAmountOff: freezed == fixedAmountOff
          ? _value.fixedAmountOff
          : fixedAmountOff // ignore: cast_nullable_to_non_nullable
              as double?,
      buyQuantity: freezed == buyQuantity
          ? _value.buyQuantity
          : buyQuantity // ignore: cast_nullable_to_non_nullable
              as int?,
      getQuantity: freezed == getQuantity
          ? _value.getQuantity
          : getQuantity // ignore: cast_nullable_to_non_nullable
              as int?,
      getDiscountPercent: freezed == getDiscountPercent
          ? _value.getDiscountPercent
          : getDiscountPercent // ignore: cast_nullable_to_non_nullable
              as double?,
      tiers: null == tiers
          ? _value.tiers
          : tiers // ignore: cast_nullable_to_non_nullable
              as List<DiscountTier>,
      minOrderAmount: freezed == minOrderAmount
          ? _value.minOrderAmount
          : minOrderAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      maxDiscountAmount: freezed == maxDiscountAmount
          ? _value.maxDiscountAmount
          : maxDiscountAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      maxUsesTotal: freezed == maxUsesTotal
          ? _value.maxUsesTotal
          : maxUsesTotal // ignore: cast_nullable_to_non_nullable
              as int?,
      maxUsesPerCustomer: freezed == maxUsesPerCustomer
          ? _value.maxUsesPerCustomer
          : maxUsesPerCustomer // ignore: cast_nullable_to_non_nullable
              as int?,
      currentUsageCount: freezed == currentUsageCount
          ? _value.currentUsageCount
          : currentUsageCount // ignore: cast_nullable_to_non_nullable
              as int?,
      applicableProductUuids: null == applicableProductUuids
          ? _value.applicableProductUuids
          : applicableProductUuids // ignore: cast_nullable_to_non_nullable
              as List<String>,
      applicableCategoryUuids: null == applicableCategoryUuids
          ? _value.applicableCategoryUuids
          : applicableCategoryUuids // ignore: cast_nullable_to_non_nullable
              as List<String>,
      applicableCustomerUuids: null == applicableCustomerUuids
          ? _value.applicableCustomerUuids
          : applicableCustomerUuids // ignore: cast_nullable_to_non_nullable
              as List<String>,
      validFrom: freezed == validFrom
          ? _value.validFrom
          : validFrom // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      validUntil: freezed == validUntil
          ? _value.validUntil
          : validUntil // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      validDaysOfWeek: null == validDaysOfWeek
          ? _value.validDaysOfWeek
          : validDaysOfWeek // ignore: cast_nullable_to_non_nullable
              as List<int>,
      validTimeStart: freezed == validTimeStart
          ? _value.validTimeStart
          : validTimeStart // ignore: cast_nullable_to_non_nullable
              as String?,
      validTimeEnd: freezed == validTimeEnd
          ? _value.validTimeEnd
          : validTimeEnd // ignore: cast_nullable_to_non_nullable
              as String?,
      canStackWithOthers: null == canStackWithOthers
          ? _value.canStackWithOthers
          : canStackWithOthers // ignore: cast_nullable_to_non_nullable
              as bool,
      stackPriority: null == stackPriority
          ? _value.stackPriority
          : stackPriority // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DiscountImplCopyWith<$Res>
    implements $DiscountCopyWith<$Res> {
  factory _$$DiscountImplCopyWith(
          _$DiscountImpl value, $Res Function(_$DiscountImpl) then) =
      __$$DiscountImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String uuid,
      String name,
      String code,
      String? description,
      DiscountType type,
      DiscountScope scope,
      DiscountStatus status,
      double? percentageOff,
      double? fixedAmountOff,
      int? buyQuantity,
      int? getQuantity,
      double? getDiscountPercent,
      List<DiscountTier> tiers,
      double? minOrderAmount,
      double? maxDiscountAmount,
      int? maxUsesTotal,
      int? maxUsesPerCustomer,
      int? currentUsageCount,
      List<String> applicableProductUuids,
      List<String> applicableCategoryUuids,
      List<String> applicableCustomerUuids,
      DateTime? validFrom,
      DateTime? validUntil,
      List<int> validDaysOfWeek,
      String? validTimeStart,
      String? validTimeEnd,
      bool canStackWithOthers,
      int stackPriority,
      DateTime? createdAt,
      DateTime? updatedAt});
}

/// @nodoc
class __$$DiscountImplCopyWithImpl<$Res>
    extends _$DiscountCopyWithImpl<$Res, _$DiscountImpl>
    implements _$$DiscountImplCopyWith<$Res> {
  __$$DiscountImplCopyWithImpl(
      _$DiscountImpl _value, $Res Function(_$DiscountImpl) _then)
      : super(_value, _then);

  /// Create a copy of Discount
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
    Object? name = null,
    Object? code = null,
    Object? description = freezed,
    Object? type = null,
    Object? scope = null,
    Object? status = null,
    Object? percentageOff = freezed,
    Object? fixedAmountOff = freezed,
    Object? buyQuantity = freezed,
    Object? getQuantity = freezed,
    Object? getDiscountPercent = freezed,
    Object? tiers = null,
    Object? minOrderAmount = freezed,
    Object? maxDiscountAmount = freezed,
    Object? maxUsesTotal = freezed,
    Object? maxUsesPerCustomer = freezed,
    Object? currentUsageCount = freezed,
    Object? applicableProductUuids = null,
    Object? applicableCategoryUuids = null,
    Object? applicableCustomerUuids = null,
    Object? validFrom = freezed,
    Object? validUntil = freezed,
    Object? validDaysOfWeek = null,
    Object? validTimeStart = freezed,
    Object? validTimeEnd = freezed,
    Object? canStackWithOthers = null,
    Object? stackPriority = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$DiscountImpl(
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as DiscountType,
      scope: null == scope
          ? _value.scope
          : scope // ignore: cast_nullable_to_non_nullable
              as DiscountScope,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as DiscountStatus,
      percentageOff: freezed == percentageOff
          ? _value.percentageOff
          : percentageOff // ignore: cast_nullable_to_non_nullable
              as double?,
      fixedAmountOff: freezed == fixedAmountOff
          ? _value.fixedAmountOff
          : fixedAmountOff // ignore: cast_nullable_to_non_nullable
              as double?,
      buyQuantity: freezed == buyQuantity
          ? _value.buyQuantity
          : buyQuantity // ignore: cast_nullable_to_non_nullable
              as int?,
      getQuantity: freezed == getQuantity
          ? _value.getQuantity
          : getQuantity // ignore: cast_nullable_to_non_nullable
              as int?,
      getDiscountPercent: freezed == getDiscountPercent
          ? _value.getDiscountPercent
          : getDiscountPercent // ignore: cast_nullable_to_non_nullable
              as double?,
      tiers: null == tiers
          ? _value._tiers
          : tiers // ignore: cast_nullable_to_non_nullable
              as List<DiscountTier>,
      minOrderAmount: freezed == minOrderAmount
          ? _value.minOrderAmount
          : minOrderAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      maxDiscountAmount: freezed == maxDiscountAmount
          ? _value.maxDiscountAmount
          : maxDiscountAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      maxUsesTotal: freezed == maxUsesTotal
          ? _value.maxUsesTotal
          : maxUsesTotal // ignore: cast_nullable_to_non_nullable
              as int?,
      maxUsesPerCustomer: freezed == maxUsesPerCustomer
          ? _value.maxUsesPerCustomer
          : maxUsesPerCustomer // ignore: cast_nullable_to_non_nullable
              as int?,
      currentUsageCount: freezed == currentUsageCount
          ? _value.currentUsageCount
          : currentUsageCount // ignore: cast_nullable_to_non_nullable
              as int?,
      applicableProductUuids: null == applicableProductUuids
          ? _value._applicableProductUuids
          : applicableProductUuids // ignore: cast_nullable_to_non_nullable
              as List<String>,
      applicableCategoryUuids: null == applicableCategoryUuids
          ? _value._applicableCategoryUuids
          : applicableCategoryUuids // ignore: cast_nullable_to_non_nullable
              as List<String>,
      applicableCustomerUuids: null == applicableCustomerUuids
          ? _value._applicableCustomerUuids
          : applicableCustomerUuids // ignore: cast_nullable_to_non_nullable
              as List<String>,
      validFrom: freezed == validFrom
          ? _value.validFrom
          : validFrom // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      validUntil: freezed == validUntil
          ? _value.validUntil
          : validUntil // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      validDaysOfWeek: null == validDaysOfWeek
          ? _value._validDaysOfWeek
          : validDaysOfWeek // ignore: cast_nullable_to_non_nullable
              as List<int>,
      validTimeStart: freezed == validTimeStart
          ? _value.validTimeStart
          : validTimeStart // ignore: cast_nullable_to_non_nullable
              as String?,
      validTimeEnd: freezed == validTimeEnd
          ? _value.validTimeEnd
          : validTimeEnd // ignore: cast_nullable_to_non_nullable
              as String?,
      canStackWithOthers: null == canStackWithOthers
          ? _value.canStackWithOthers
          : canStackWithOthers // ignore: cast_nullable_to_non_nullable
              as bool,
      stackPriority: null == stackPriority
          ? _value.stackPriority
          : stackPriority // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DiscountImpl extends _Discount {
  const _$DiscountImpl(
      {required this.uuid,
      required this.name,
      required this.code,
      this.description,
      required this.type,
      required this.scope,
      this.status = DiscountStatus.active,
      this.percentageOff,
      this.fixedAmountOff,
      this.buyQuantity,
      this.getQuantity,
      this.getDiscountPercent,
      final List<DiscountTier> tiers = const [],
      this.minOrderAmount,
      this.maxDiscountAmount,
      this.maxUsesTotal,
      this.maxUsesPerCustomer,
      this.currentUsageCount,
      final List<String> applicableProductUuids = const [],
      final List<String> applicableCategoryUuids = const [],
      final List<String> applicableCustomerUuids = const [],
      this.validFrom,
      this.validUntil,
      final List<int> validDaysOfWeek = const [],
      this.validTimeStart,
      this.validTimeEnd,
      this.canStackWithOthers = false,
      this.stackPriority = 0,
      this.createdAt,
      this.updatedAt})
      : _tiers = tiers,
        _applicableProductUuids = applicableProductUuids,
        _applicableCategoryUuids = applicableCategoryUuids,
        _applicableCustomerUuids = applicableCustomerUuids,
        _validDaysOfWeek = validDaysOfWeek,
        super._();

  factory _$DiscountImpl.fromJson(Map<String, dynamic> json) =>
      _$$DiscountImplFromJson(json);

  @override
  final String uuid;
  @override
  final String name;
  @override
  final String code;
// Promo code
  @override
  final String? description;
  @override
  final DiscountType type;
  @override
  final DiscountScope scope;
  @override
  @JsonKey()
  final DiscountStatus status;
// Value based on type
  @override
  final double? percentageOff;
// For percentage type
  @override
  final double? fixedAmountOff;
// For fixed type
  @override
  final int? buyQuantity;
// For BOGO/buyXGetY
  @override
  final int? getQuantity;
// For BOGO/buyXGetY
  @override
  final double? getDiscountPercent;
// Discount on the "get" items
// Tier thresholds (for tiered discounts)
  final List<DiscountTier> _tiers;
// Discount on the "get" items
// Tier thresholds (for tiered discounts)
  @override
  @JsonKey()
  List<DiscountTier> get tiers {
    if (_tiers is EqualUnmodifiableListView) return _tiers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tiers);
  }

// Restrictions
  @override
  final double? minOrderAmount;
  @override
  final double? maxDiscountAmount;
  @override
  final int? maxUsesTotal;
  @override
  final int? maxUsesPerCustomer;
  @override
  final int? currentUsageCount;
// Scope restrictions
  final List<String> _applicableProductUuids;
// Scope restrictions
  @override
  @JsonKey()
  List<String> get applicableProductUuids {
    if (_applicableProductUuids is EqualUnmodifiableListView)
      return _applicableProductUuids;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_applicableProductUuids);
  }

  final List<String> _applicableCategoryUuids;
  @override
  @JsonKey()
  List<String> get applicableCategoryUuids {
    if (_applicableCategoryUuids is EqualUnmodifiableListView)
      return _applicableCategoryUuids;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_applicableCategoryUuids);
  }

  final List<String> _applicableCustomerUuids;
  @override
  @JsonKey()
  List<String> get applicableCustomerUuids {
    if (_applicableCustomerUuids is EqualUnmodifiableListView)
      return _applicableCustomerUuids;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_applicableCustomerUuids);
  }

// Scheduling
  @override
  final DateTime? validFrom;
  @override
  final DateTime? validUntil;
  final List<int> _validDaysOfWeek;
  @override
  @JsonKey()
  List<int> get validDaysOfWeek {
    if (_validDaysOfWeek is EqualUnmodifiableListView) return _validDaysOfWeek;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_validDaysOfWeek);
  }

// 1-7 (Mon-Sun)
  @override
  final String? validTimeStart;
// "11:00"
  @override
  final String? validTimeEnd;
// "14:00"
// Stacking rules
  @override
  @JsonKey()
  final bool canStackWithOthers;
  @override
  @JsonKey()
  final int stackPriority;
// Lower = applies first
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'Discount(uuid: $uuid, name: $name, code: $code, description: $description, type: $type, scope: $scope, status: $status, percentageOff: $percentageOff, fixedAmountOff: $fixedAmountOff, buyQuantity: $buyQuantity, getQuantity: $getQuantity, getDiscountPercent: $getDiscountPercent, tiers: $tiers, minOrderAmount: $minOrderAmount, maxDiscountAmount: $maxDiscountAmount, maxUsesTotal: $maxUsesTotal, maxUsesPerCustomer: $maxUsesPerCustomer, currentUsageCount: $currentUsageCount, applicableProductUuids: $applicableProductUuids, applicableCategoryUuids: $applicableCategoryUuids, applicableCustomerUuids: $applicableCustomerUuids, validFrom: $validFrom, validUntil: $validUntil, validDaysOfWeek: $validDaysOfWeek, validTimeStart: $validTimeStart, validTimeEnd: $validTimeEnd, canStackWithOthers: $canStackWithOthers, stackPriority: $stackPriority, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DiscountImpl &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.scope, scope) || other.scope == scope) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.percentageOff, percentageOff) ||
                other.percentageOff == percentageOff) &&
            (identical(other.fixedAmountOff, fixedAmountOff) ||
                other.fixedAmountOff == fixedAmountOff) &&
            (identical(other.buyQuantity, buyQuantity) ||
                other.buyQuantity == buyQuantity) &&
            (identical(other.getQuantity, getQuantity) ||
                other.getQuantity == getQuantity) &&
            (identical(other.getDiscountPercent, getDiscountPercent) ||
                other.getDiscountPercent == getDiscountPercent) &&
            const DeepCollectionEquality().equals(other._tiers, _tiers) &&
            (identical(other.minOrderAmount, minOrderAmount) ||
                other.minOrderAmount == minOrderAmount) &&
            (identical(other.maxDiscountAmount, maxDiscountAmount) ||
                other.maxDiscountAmount == maxDiscountAmount) &&
            (identical(other.maxUsesTotal, maxUsesTotal) ||
                other.maxUsesTotal == maxUsesTotal) &&
            (identical(other.maxUsesPerCustomer, maxUsesPerCustomer) ||
                other.maxUsesPerCustomer == maxUsesPerCustomer) &&
            (identical(other.currentUsageCount, currentUsageCount) ||
                other.currentUsageCount == currentUsageCount) &&
            const DeepCollectionEquality().equals(
                other._applicableProductUuids, _applicableProductUuids) &&
            const DeepCollectionEquality().equals(
                other._applicableCategoryUuids, _applicableCategoryUuids) &&
            const DeepCollectionEquality().equals(
                other._applicableCustomerUuids, _applicableCustomerUuids) &&
            (identical(other.validFrom, validFrom) ||
                other.validFrom == validFrom) &&
            (identical(other.validUntil, validUntil) ||
                other.validUntil == validUntil) &&
            const DeepCollectionEquality()
                .equals(other._validDaysOfWeek, _validDaysOfWeek) &&
            (identical(other.validTimeStart, validTimeStart) ||
                other.validTimeStart == validTimeStart) &&
            (identical(other.validTimeEnd, validTimeEnd) ||
                other.validTimeEnd == validTimeEnd) &&
            (identical(other.canStackWithOthers, canStackWithOthers) ||
                other.canStackWithOthers == canStackWithOthers) &&
            (identical(other.stackPriority, stackPriority) ||
                other.stackPriority == stackPriority) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        uuid,
        name,
        code,
        description,
        type,
        scope,
        status,
        percentageOff,
        fixedAmountOff,
        buyQuantity,
        getQuantity,
        getDiscountPercent,
        const DeepCollectionEquality().hash(_tiers),
        minOrderAmount,
        maxDiscountAmount,
        maxUsesTotal,
        maxUsesPerCustomer,
        currentUsageCount,
        const DeepCollectionEquality().hash(_applicableProductUuids),
        const DeepCollectionEquality().hash(_applicableCategoryUuids),
        const DeepCollectionEquality().hash(_applicableCustomerUuids),
        validFrom,
        validUntil,
        const DeepCollectionEquality().hash(_validDaysOfWeek),
        validTimeStart,
        validTimeEnd,
        canStackWithOthers,
        stackPriority,
        createdAt,
        updatedAt
      ]);

  /// Create a copy of Discount
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DiscountImplCopyWith<_$DiscountImpl> get copyWith =>
      __$$DiscountImplCopyWithImpl<_$DiscountImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DiscountImplToJson(
      this,
    );
  }
}

abstract class _Discount extends Discount {
  const factory _Discount(
      {required final String uuid,
      required final String name,
      required final String code,
      final String? description,
      required final DiscountType type,
      required final DiscountScope scope,
      final DiscountStatus status,
      final double? percentageOff,
      final double? fixedAmountOff,
      final int? buyQuantity,
      final int? getQuantity,
      final double? getDiscountPercent,
      final List<DiscountTier> tiers,
      final double? minOrderAmount,
      final double? maxDiscountAmount,
      final int? maxUsesTotal,
      final int? maxUsesPerCustomer,
      final int? currentUsageCount,
      final List<String> applicableProductUuids,
      final List<String> applicableCategoryUuids,
      final List<String> applicableCustomerUuids,
      final DateTime? validFrom,
      final DateTime? validUntil,
      final List<int> validDaysOfWeek,
      final String? validTimeStart,
      final String? validTimeEnd,
      final bool canStackWithOthers,
      final int stackPriority,
      final DateTime? createdAt,
      final DateTime? updatedAt}) = _$DiscountImpl;
  const _Discount._() : super._();

  factory _Discount.fromJson(Map<String, dynamic> json) =
      _$DiscountImpl.fromJson;

  @override
  String get uuid;
  @override
  String get name;
  @override
  String get code; // Promo code
  @override
  String? get description;
  @override
  DiscountType get type;
  @override
  DiscountScope get scope;
  @override
  DiscountStatus get status; // Value based on type
  @override
  double? get percentageOff; // For percentage type
  @override
  double? get fixedAmountOff; // For fixed type
  @override
  int? get buyQuantity; // For BOGO/buyXGetY
  @override
  int? get getQuantity; // For BOGO/buyXGetY
  @override
  double? get getDiscountPercent; // Discount on the "get" items
// Tier thresholds (for tiered discounts)
  @override
  List<DiscountTier> get tiers; // Restrictions
  @override
  double? get minOrderAmount;
  @override
  double? get maxDiscountAmount;
  @override
  int? get maxUsesTotal;
  @override
  int? get maxUsesPerCustomer;
  @override
  int? get currentUsageCount; // Scope restrictions
  @override
  List<String> get applicableProductUuids;
  @override
  List<String> get applicableCategoryUuids;
  @override
  List<String> get applicableCustomerUuids; // Scheduling
  @override
  DateTime? get validFrom;
  @override
  DateTime? get validUntil;
  @override
  List<int> get validDaysOfWeek; // 1-7 (Mon-Sun)
  @override
  String? get validTimeStart; // "11:00"
  @override
  String? get validTimeEnd; // "14:00"
// Stacking rules
  @override
  bool get canStackWithOthers;
  @override
  int get stackPriority; // Lower = applies first
  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;

  /// Create a copy of Discount
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DiscountImplCopyWith<_$DiscountImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DiscountTier _$DiscountTierFromJson(Map<String, dynamic> json) {
  return _DiscountTier.fromJson(json);
}

/// @nodoc
mixin _$DiscountTier {
  double get minAmount => throw _privateConstructorUsedError;
  double get discountPercent => throw _privateConstructorUsedError;

  /// Serializes this DiscountTier to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DiscountTier
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DiscountTierCopyWith<DiscountTier> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DiscountTierCopyWith<$Res> {
  factory $DiscountTierCopyWith(
          DiscountTier value, $Res Function(DiscountTier) then) =
      _$DiscountTierCopyWithImpl<$Res, DiscountTier>;
  @useResult
  $Res call({double minAmount, double discountPercent});
}

/// @nodoc
class _$DiscountTierCopyWithImpl<$Res, $Val extends DiscountTier>
    implements $DiscountTierCopyWith<$Res> {
  _$DiscountTierCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DiscountTier
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? minAmount = null,
    Object? discountPercent = null,
  }) {
    return _then(_value.copyWith(
      minAmount: null == minAmount
          ? _value.minAmount
          : minAmount // ignore: cast_nullable_to_non_nullable
              as double,
      discountPercent: null == discountPercent
          ? _value.discountPercent
          : discountPercent // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DiscountTierImplCopyWith<$Res>
    implements $DiscountTierCopyWith<$Res> {
  factory _$$DiscountTierImplCopyWith(
          _$DiscountTierImpl value, $Res Function(_$DiscountTierImpl) then) =
      __$$DiscountTierImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double minAmount, double discountPercent});
}

/// @nodoc
class __$$DiscountTierImplCopyWithImpl<$Res>
    extends _$DiscountTierCopyWithImpl<$Res, _$DiscountTierImpl>
    implements _$$DiscountTierImplCopyWith<$Res> {
  __$$DiscountTierImplCopyWithImpl(
      _$DiscountTierImpl _value, $Res Function(_$DiscountTierImpl) _then)
      : super(_value, _then);

  /// Create a copy of DiscountTier
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? minAmount = null,
    Object? discountPercent = null,
  }) {
    return _then(_$DiscountTierImpl(
      minAmount: null == minAmount
          ? _value.minAmount
          : minAmount // ignore: cast_nullable_to_non_nullable
              as double,
      discountPercent: null == discountPercent
          ? _value.discountPercent
          : discountPercent // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DiscountTierImpl implements _DiscountTier {
  const _$DiscountTierImpl(
      {required this.minAmount, required this.discountPercent});

  factory _$DiscountTierImpl.fromJson(Map<String, dynamic> json) =>
      _$$DiscountTierImplFromJson(json);

  @override
  final double minAmount;
  @override
  final double discountPercent;

  @override
  String toString() {
    return 'DiscountTier(minAmount: $minAmount, discountPercent: $discountPercent)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DiscountTierImpl &&
            (identical(other.minAmount, minAmount) ||
                other.minAmount == minAmount) &&
            (identical(other.discountPercent, discountPercent) ||
                other.discountPercent == discountPercent));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, minAmount, discountPercent);

  /// Create a copy of DiscountTier
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DiscountTierImplCopyWith<_$DiscountTierImpl> get copyWith =>
      __$$DiscountTierImplCopyWithImpl<_$DiscountTierImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DiscountTierImplToJson(
      this,
    );
  }
}

abstract class _DiscountTier implements DiscountTier {
  const factory _DiscountTier(
      {required final double minAmount,
      required final double discountPercent}) = _$DiscountTierImpl;

  factory _DiscountTier.fromJson(Map<String, dynamic> json) =
      _$DiscountTierImpl.fromJson;

  @override
  double get minAmount;
  @override
  double get discountPercent;

  /// Create a copy of DiscountTier
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DiscountTierImplCopyWith<_$DiscountTierImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AppliedDiscount _$AppliedDiscountFromJson(Map<String, dynamic> json) {
  return _AppliedDiscount.fromJson(json);
}

/// @nodoc
mixin _$AppliedDiscount {
  String get uuid => throw _privateConstructorUsedError;
  String get orderUuid => throw _privateConstructorUsedError;
  String get discountUuid => throw _privateConstructorUsedError;
  String get discountName => throw _privateConstructorUsedError;
  String get discountCode => throw _privateConstructorUsedError;
  DiscountType get type => throw _privateConstructorUsedError;
  double get discountAmount =>
      throw _privateConstructorUsedError; // Item-specific details
  String? get appliedToItemUuid => throw _privateConstructorUsedError;
  String? get appliedToItemName => throw _privateConstructorUsedError;
  DateTime get appliedAt => throw _privateConstructorUsedError;
  String? get appliedByUuid => throw _privateConstructorUsedError;

  /// Serializes this AppliedDiscount to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AppliedDiscount
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AppliedDiscountCopyWith<AppliedDiscount> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppliedDiscountCopyWith<$Res> {
  factory $AppliedDiscountCopyWith(
          AppliedDiscount value, $Res Function(AppliedDiscount) then) =
      _$AppliedDiscountCopyWithImpl<$Res, AppliedDiscount>;
  @useResult
  $Res call(
      {String uuid,
      String orderUuid,
      String discountUuid,
      String discountName,
      String discountCode,
      DiscountType type,
      double discountAmount,
      String? appliedToItemUuid,
      String? appliedToItemName,
      DateTime appliedAt,
      String? appliedByUuid});
}

/// @nodoc
class _$AppliedDiscountCopyWithImpl<$Res, $Val extends AppliedDiscount>
    implements $AppliedDiscountCopyWith<$Res> {
  _$AppliedDiscountCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AppliedDiscount
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
    Object? orderUuid = null,
    Object? discountUuid = null,
    Object? discountName = null,
    Object? discountCode = null,
    Object? type = null,
    Object? discountAmount = null,
    Object? appliedToItemUuid = freezed,
    Object? appliedToItemName = freezed,
    Object? appliedAt = null,
    Object? appliedByUuid = freezed,
  }) {
    return _then(_value.copyWith(
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      orderUuid: null == orderUuid
          ? _value.orderUuid
          : orderUuid // ignore: cast_nullable_to_non_nullable
              as String,
      discountUuid: null == discountUuid
          ? _value.discountUuid
          : discountUuid // ignore: cast_nullable_to_non_nullable
              as String,
      discountName: null == discountName
          ? _value.discountName
          : discountName // ignore: cast_nullable_to_non_nullable
              as String,
      discountCode: null == discountCode
          ? _value.discountCode
          : discountCode // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as DiscountType,
      discountAmount: null == discountAmount
          ? _value.discountAmount
          : discountAmount // ignore: cast_nullable_to_non_nullable
              as double,
      appliedToItemUuid: freezed == appliedToItemUuid
          ? _value.appliedToItemUuid
          : appliedToItemUuid // ignore: cast_nullable_to_non_nullable
              as String?,
      appliedToItemName: freezed == appliedToItemName
          ? _value.appliedToItemName
          : appliedToItemName // ignore: cast_nullable_to_non_nullable
              as String?,
      appliedAt: null == appliedAt
          ? _value.appliedAt
          : appliedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      appliedByUuid: freezed == appliedByUuid
          ? _value.appliedByUuid
          : appliedByUuid // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AppliedDiscountImplCopyWith<$Res>
    implements $AppliedDiscountCopyWith<$Res> {
  factory _$$AppliedDiscountImplCopyWith(_$AppliedDiscountImpl value,
          $Res Function(_$AppliedDiscountImpl) then) =
      __$$AppliedDiscountImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String uuid,
      String orderUuid,
      String discountUuid,
      String discountName,
      String discountCode,
      DiscountType type,
      double discountAmount,
      String? appliedToItemUuid,
      String? appliedToItemName,
      DateTime appliedAt,
      String? appliedByUuid});
}

/// @nodoc
class __$$AppliedDiscountImplCopyWithImpl<$Res>
    extends _$AppliedDiscountCopyWithImpl<$Res, _$AppliedDiscountImpl>
    implements _$$AppliedDiscountImplCopyWith<$Res> {
  __$$AppliedDiscountImplCopyWithImpl(
      _$AppliedDiscountImpl _value, $Res Function(_$AppliedDiscountImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppliedDiscount
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
    Object? orderUuid = null,
    Object? discountUuid = null,
    Object? discountName = null,
    Object? discountCode = null,
    Object? type = null,
    Object? discountAmount = null,
    Object? appliedToItemUuid = freezed,
    Object? appliedToItemName = freezed,
    Object? appliedAt = null,
    Object? appliedByUuid = freezed,
  }) {
    return _then(_$AppliedDiscountImpl(
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      orderUuid: null == orderUuid
          ? _value.orderUuid
          : orderUuid // ignore: cast_nullable_to_non_nullable
              as String,
      discountUuid: null == discountUuid
          ? _value.discountUuid
          : discountUuid // ignore: cast_nullable_to_non_nullable
              as String,
      discountName: null == discountName
          ? _value.discountName
          : discountName // ignore: cast_nullable_to_non_nullable
              as String,
      discountCode: null == discountCode
          ? _value.discountCode
          : discountCode // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as DiscountType,
      discountAmount: null == discountAmount
          ? _value.discountAmount
          : discountAmount // ignore: cast_nullable_to_non_nullable
              as double,
      appliedToItemUuid: freezed == appliedToItemUuid
          ? _value.appliedToItemUuid
          : appliedToItemUuid // ignore: cast_nullable_to_non_nullable
              as String?,
      appliedToItemName: freezed == appliedToItemName
          ? _value.appliedToItemName
          : appliedToItemName // ignore: cast_nullable_to_non_nullable
              as String?,
      appliedAt: null == appliedAt
          ? _value.appliedAt
          : appliedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      appliedByUuid: freezed == appliedByUuid
          ? _value.appliedByUuid
          : appliedByUuid // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AppliedDiscountImpl implements _AppliedDiscount {
  const _$AppliedDiscountImpl(
      {required this.uuid,
      required this.orderUuid,
      required this.discountUuid,
      required this.discountName,
      required this.discountCode,
      required this.type,
      required this.discountAmount,
      this.appliedToItemUuid,
      this.appliedToItemName,
      required this.appliedAt,
      this.appliedByUuid});

  factory _$AppliedDiscountImpl.fromJson(Map<String, dynamic> json) =>
      _$$AppliedDiscountImplFromJson(json);

  @override
  final String uuid;
  @override
  final String orderUuid;
  @override
  final String discountUuid;
  @override
  final String discountName;
  @override
  final String discountCode;
  @override
  final DiscountType type;
  @override
  final double discountAmount;
// Item-specific details
  @override
  final String? appliedToItemUuid;
  @override
  final String? appliedToItemName;
  @override
  final DateTime appliedAt;
  @override
  final String? appliedByUuid;

  @override
  String toString() {
    return 'AppliedDiscount(uuid: $uuid, orderUuid: $orderUuid, discountUuid: $discountUuid, discountName: $discountName, discountCode: $discountCode, type: $type, discountAmount: $discountAmount, appliedToItemUuid: $appliedToItemUuid, appliedToItemName: $appliedToItemName, appliedAt: $appliedAt, appliedByUuid: $appliedByUuid)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppliedDiscountImpl &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.orderUuid, orderUuid) ||
                other.orderUuid == orderUuid) &&
            (identical(other.discountUuid, discountUuid) ||
                other.discountUuid == discountUuid) &&
            (identical(other.discountName, discountName) ||
                other.discountName == discountName) &&
            (identical(other.discountCode, discountCode) ||
                other.discountCode == discountCode) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.discountAmount, discountAmount) ||
                other.discountAmount == discountAmount) &&
            (identical(other.appliedToItemUuid, appliedToItemUuid) ||
                other.appliedToItemUuid == appliedToItemUuid) &&
            (identical(other.appliedToItemName, appliedToItemName) ||
                other.appliedToItemName == appliedToItemName) &&
            (identical(other.appliedAt, appliedAt) ||
                other.appliedAt == appliedAt) &&
            (identical(other.appliedByUuid, appliedByUuid) ||
                other.appliedByUuid == appliedByUuid));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      uuid,
      orderUuid,
      discountUuid,
      discountName,
      discountCode,
      type,
      discountAmount,
      appliedToItemUuid,
      appliedToItemName,
      appliedAt,
      appliedByUuid);

  /// Create a copy of AppliedDiscount
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AppliedDiscountImplCopyWith<_$AppliedDiscountImpl> get copyWith =>
      __$$AppliedDiscountImplCopyWithImpl<_$AppliedDiscountImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AppliedDiscountImplToJson(
      this,
    );
  }
}

abstract class _AppliedDiscount implements AppliedDiscount {
  const factory _AppliedDiscount(
      {required final String uuid,
      required final String orderUuid,
      required final String discountUuid,
      required final String discountName,
      required final String discountCode,
      required final DiscountType type,
      required final double discountAmount,
      final String? appliedToItemUuid,
      final String? appliedToItemName,
      required final DateTime appliedAt,
      final String? appliedByUuid}) = _$AppliedDiscountImpl;

  factory _AppliedDiscount.fromJson(Map<String, dynamic> json) =
      _$AppliedDiscountImpl.fromJson;

  @override
  String get uuid;
  @override
  String get orderUuid;
  @override
  String get discountUuid;
  @override
  String get discountName;
  @override
  String get discountCode;
  @override
  DiscountType get type;
  @override
  double get discountAmount; // Item-specific details
  @override
  String? get appliedToItemUuid;
  @override
  String? get appliedToItemName;
  @override
  DateTime get appliedAt;
  @override
  String? get appliedByUuid;

  /// Create a copy of AppliedDiscount
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AppliedDiscountImplCopyWith<_$AppliedDiscountImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

QuickDiscount _$QuickDiscountFromJson(Map<String, dynamic> json) {
  return _QuickDiscount.fromJson(json);
}

/// @nodoc
mixin _$QuickDiscount {
  String get label => throw _privateConstructorUsedError;
  double get percentage => throw _privateConstructorUsedError;
  IconType get iconType => throw _privateConstructorUsedError;

  /// Serializes this QuickDiscount to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of QuickDiscount
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $QuickDiscountCopyWith<QuickDiscount> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuickDiscountCopyWith<$Res> {
  factory $QuickDiscountCopyWith(
          QuickDiscount value, $Res Function(QuickDiscount) then) =
      _$QuickDiscountCopyWithImpl<$Res, QuickDiscount>;
  @useResult
  $Res call({String label, double percentage, IconType iconType});
}

/// @nodoc
class _$QuickDiscountCopyWithImpl<$Res, $Val extends QuickDiscount>
    implements $QuickDiscountCopyWith<$Res> {
  _$QuickDiscountCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of QuickDiscount
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? label = null,
    Object? percentage = null,
    Object? iconType = null,
  }) {
    return _then(_value.copyWith(
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      percentage: null == percentage
          ? _value.percentage
          : percentage // ignore: cast_nullable_to_non_nullable
              as double,
      iconType: null == iconType
          ? _value.iconType
          : iconType // ignore: cast_nullable_to_non_nullable
              as IconType,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$QuickDiscountImplCopyWith<$Res>
    implements $QuickDiscountCopyWith<$Res> {
  factory _$$QuickDiscountImplCopyWith(
          _$QuickDiscountImpl value, $Res Function(_$QuickDiscountImpl) then) =
      __$$QuickDiscountImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String label, double percentage, IconType iconType});
}

/// @nodoc
class __$$QuickDiscountImplCopyWithImpl<$Res>
    extends _$QuickDiscountCopyWithImpl<$Res, _$QuickDiscountImpl>
    implements _$$QuickDiscountImplCopyWith<$Res> {
  __$$QuickDiscountImplCopyWithImpl(
      _$QuickDiscountImpl _value, $Res Function(_$QuickDiscountImpl) _then)
      : super(_value, _then);

  /// Create a copy of QuickDiscount
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? label = null,
    Object? percentage = null,
    Object? iconType = null,
  }) {
    return _then(_$QuickDiscountImpl(
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      percentage: null == percentage
          ? _value.percentage
          : percentage // ignore: cast_nullable_to_non_nullable
              as double,
      iconType: null == iconType
          ? _value.iconType
          : iconType // ignore: cast_nullable_to_non_nullable
              as IconType,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$QuickDiscountImpl implements _QuickDiscount {
  const _$QuickDiscountImpl(
      {required this.label, required this.percentage, required this.iconType});

  factory _$QuickDiscountImpl.fromJson(Map<String, dynamic> json) =>
      _$$QuickDiscountImplFromJson(json);

  @override
  final String label;
  @override
  final double percentage;
  @override
  final IconType iconType;

  @override
  String toString() {
    return 'QuickDiscount(label: $label, percentage: $percentage, iconType: $iconType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuickDiscountImpl &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.percentage, percentage) ||
                other.percentage == percentage) &&
            (identical(other.iconType, iconType) ||
                other.iconType == iconType));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, label, percentage, iconType);

  /// Create a copy of QuickDiscount
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$QuickDiscountImplCopyWith<_$QuickDiscountImpl> get copyWith =>
      __$$QuickDiscountImplCopyWithImpl<_$QuickDiscountImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$QuickDiscountImplToJson(
      this,
    );
  }
}

abstract class _QuickDiscount implements QuickDiscount {
  const factory _QuickDiscount(
      {required final String label,
      required final double percentage,
      required final IconType iconType}) = _$QuickDiscountImpl;

  factory _QuickDiscount.fromJson(Map<String, dynamic> json) =
      _$QuickDiscountImpl.fromJson;

  @override
  String get label;
  @override
  double get percentage;
  @override
  IconType get iconType;

  /// Create a copy of QuickDiscount
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$QuickDiscountImplCopyWith<_$QuickDiscountImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
