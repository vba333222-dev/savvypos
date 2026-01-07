// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'promotion.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Promotion {
  String get id => throw _privateConstructorUsedError;
  String get code => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  DateTime? get startDate => throw _privateConstructorUsedError;
  DateTime? get endDate => throw _privateConstructorUsedError;
  double? get minPurchaseAmount => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String id,
            String code,
            String name,
            double percentage,
            DateTime? startDate,
            DateTime? endDate,
            double? minPurchaseAmount,
            List<String>? applicableProductIds)
        percentage,
    required TResult Function(
            String id,
            String code,
            String name,
            double amount,
            DateTime? startDate,
            DateTime? endDate,
            double? minPurchaseAmount,
            List<String>? applicableProductIds)
        fixedAmount,
    required TResult Function(
            String id,
            String code,
            String name,
            int buyQty,
            int getQty,
            String buyProductId,
            String? getProductId,
            DateTime? startDate,
            DateTime? endDate,
            double? minPurchaseAmount)
        buyXGetY,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String id,
            String code,
            String name,
            double percentage,
            DateTime? startDate,
            DateTime? endDate,
            double? minPurchaseAmount,
            List<String>? applicableProductIds)?
        percentage,
    TResult? Function(
            String id,
            String code,
            String name,
            double amount,
            DateTime? startDate,
            DateTime? endDate,
            double? minPurchaseAmount,
            List<String>? applicableProductIds)?
        fixedAmount,
    TResult? Function(
            String id,
            String code,
            String name,
            int buyQty,
            int getQty,
            String buyProductId,
            String? getProductId,
            DateTime? startDate,
            DateTime? endDate,
            double? minPurchaseAmount)?
        buyXGetY,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String id,
            String code,
            String name,
            double percentage,
            DateTime? startDate,
            DateTime? endDate,
            double? minPurchaseAmount,
            List<String>? applicableProductIds)?
        percentage,
    TResult Function(
            String id,
            String code,
            String name,
            double amount,
            DateTime? startDate,
            DateTime? endDate,
            double? minPurchaseAmount,
            List<String>? applicableProductIds)?
        fixedAmount,
    TResult Function(
            String id,
            String code,
            String name,
            int buyQty,
            int getQty,
            String buyProductId,
            String? getProductId,
            DateTime? startDate,
            DateTime? endDate,
            double? minPurchaseAmount)?
        buyXGetY,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PercentageDiscount value) percentage,
    required TResult Function(FixedAmountDiscount value) fixedAmount,
    required TResult Function(BuyXGetYPromotion value) buyXGetY,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PercentageDiscount value)? percentage,
    TResult? Function(FixedAmountDiscount value)? fixedAmount,
    TResult? Function(BuyXGetYPromotion value)? buyXGetY,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PercentageDiscount value)? percentage,
    TResult Function(FixedAmountDiscount value)? fixedAmount,
    TResult Function(BuyXGetYPromotion value)? buyXGetY,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Create a copy of Promotion
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PromotionCopyWith<Promotion> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PromotionCopyWith<$Res> {
  factory $PromotionCopyWith(Promotion value, $Res Function(Promotion) then) =
      _$PromotionCopyWithImpl<$Res, Promotion>;
  @useResult
  $Res call(
      {String id,
      String code,
      String name,
      DateTime? startDate,
      DateTime? endDate,
      double? minPurchaseAmount});
}

/// @nodoc
class _$PromotionCopyWithImpl<$Res, $Val extends Promotion>
    implements $PromotionCopyWith<$Res> {
  _$PromotionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Promotion
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? code = null,
    Object? name = null,
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? minPurchaseAmount = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      minPurchaseAmount: freezed == minPurchaseAmount
          ? _value.minPurchaseAmount
          : minPurchaseAmount // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PercentageDiscountImplCopyWith<$Res>
    implements $PromotionCopyWith<$Res> {
  factory _$$PercentageDiscountImplCopyWith(_$PercentageDiscountImpl value,
          $Res Function(_$PercentageDiscountImpl) then) =
      __$$PercentageDiscountImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String code,
      String name,
      double percentage,
      DateTime? startDate,
      DateTime? endDate,
      double? minPurchaseAmount,
      List<String>? applicableProductIds});
}

/// @nodoc
class __$$PercentageDiscountImplCopyWithImpl<$Res>
    extends _$PromotionCopyWithImpl<$Res, _$PercentageDiscountImpl>
    implements _$$PercentageDiscountImplCopyWith<$Res> {
  __$$PercentageDiscountImplCopyWithImpl(_$PercentageDiscountImpl _value,
      $Res Function(_$PercentageDiscountImpl) _then)
      : super(_value, _then);

  /// Create a copy of Promotion
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? code = null,
    Object? name = null,
    Object? percentage = null,
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? minPurchaseAmount = freezed,
    Object? applicableProductIds = freezed,
  }) {
    return _then(_$PercentageDiscountImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      percentage: null == percentage
          ? _value.percentage
          : percentage // ignore: cast_nullable_to_non_nullable
              as double,
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      minPurchaseAmount: freezed == minPurchaseAmount
          ? _value.minPurchaseAmount
          : minPurchaseAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      applicableProductIds: freezed == applicableProductIds
          ? _value._applicableProductIds
          : applicableProductIds // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc

class _$PercentageDiscountImpl extends PercentageDiscount {
  const _$PercentageDiscountImpl(
      {required this.id,
      required this.code,
      required this.name,
      required this.percentage,
      this.startDate,
      this.endDate,
      this.minPurchaseAmount,
      final List<String>? applicableProductIds})
      : _applicableProductIds = applicableProductIds,
        super._();

  @override
  final String id;
  @override
  final String code;
  @override
  final String name;
  @override
  final double percentage;
  @override
  final DateTime? startDate;
  @override
  final DateTime? endDate;
  @override
  final double? minPurchaseAmount;
  final List<String>? _applicableProductIds;
  @override
  List<String>? get applicableProductIds {
    final value = _applicableProductIds;
    if (value == null) return null;
    if (_applicableProductIds is EqualUnmodifiableListView)
      return _applicableProductIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Promotion.percentage(id: $id, code: $code, name: $name, percentage: $percentage, startDate: $startDate, endDate: $endDate, minPurchaseAmount: $minPurchaseAmount, applicableProductIds: $applicableProductIds)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PercentageDiscountImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.percentage, percentage) ||
                other.percentage == percentage) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.minPurchaseAmount, minPurchaseAmount) ||
                other.minPurchaseAmount == minPurchaseAmount) &&
            const DeepCollectionEquality()
                .equals(other._applicableProductIds, _applicableProductIds));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      code,
      name,
      percentage,
      startDate,
      endDate,
      minPurchaseAmount,
      const DeepCollectionEquality().hash(_applicableProductIds));

  /// Create a copy of Promotion
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PercentageDiscountImplCopyWith<_$PercentageDiscountImpl> get copyWith =>
      __$$PercentageDiscountImplCopyWithImpl<_$PercentageDiscountImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String id,
            String code,
            String name,
            double percentage,
            DateTime? startDate,
            DateTime? endDate,
            double? minPurchaseAmount,
            List<String>? applicableProductIds)
        percentage,
    required TResult Function(
            String id,
            String code,
            String name,
            double amount,
            DateTime? startDate,
            DateTime? endDate,
            double? minPurchaseAmount,
            List<String>? applicableProductIds)
        fixedAmount,
    required TResult Function(
            String id,
            String code,
            String name,
            int buyQty,
            int getQty,
            String buyProductId,
            String? getProductId,
            DateTime? startDate,
            DateTime? endDate,
            double? minPurchaseAmount)
        buyXGetY,
  }) {
    return percentage(id, code, name, this.percentage, startDate, endDate,
        minPurchaseAmount, applicableProductIds);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String id,
            String code,
            String name,
            double percentage,
            DateTime? startDate,
            DateTime? endDate,
            double? minPurchaseAmount,
            List<String>? applicableProductIds)?
        percentage,
    TResult? Function(
            String id,
            String code,
            String name,
            double amount,
            DateTime? startDate,
            DateTime? endDate,
            double? minPurchaseAmount,
            List<String>? applicableProductIds)?
        fixedAmount,
    TResult? Function(
            String id,
            String code,
            String name,
            int buyQty,
            int getQty,
            String buyProductId,
            String? getProductId,
            DateTime? startDate,
            DateTime? endDate,
            double? minPurchaseAmount)?
        buyXGetY,
  }) {
    return percentage?.call(id, code, name, this.percentage, startDate, endDate,
        minPurchaseAmount, applicableProductIds);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String id,
            String code,
            String name,
            double percentage,
            DateTime? startDate,
            DateTime? endDate,
            double? minPurchaseAmount,
            List<String>? applicableProductIds)?
        percentage,
    TResult Function(
            String id,
            String code,
            String name,
            double amount,
            DateTime? startDate,
            DateTime? endDate,
            double? minPurchaseAmount,
            List<String>? applicableProductIds)?
        fixedAmount,
    TResult Function(
            String id,
            String code,
            String name,
            int buyQty,
            int getQty,
            String buyProductId,
            String? getProductId,
            DateTime? startDate,
            DateTime? endDate,
            double? minPurchaseAmount)?
        buyXGetY,
    required TResult orElse(),
  }) {
    if (percentage != null) {
      return percentage(id, code, name, this.percentage, startDate, endDate,
          minPurchaseAmount, applicableProductIds);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PercentageDiscount value) percentage,
    required TResult Function(FixedAmountDiscount value) fixedAmount,
    required TResult Function(BuyXGetYPromotion value) buyXGetY,
  }) {
    return percentage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PercentageDiscount value)? percentage,
    TResult? Function(FixedAmountDiscount value)? fixedAmount,
    TResult? Function(BuyXGetYPromotion value)? buyXGetY,
  }) {
    return percentage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PercentageDiscount value)? percentage,
    TResult Function(FixedAmountDiscount value)? fixedAmount,
    TResult Function(BuyXGetYPromotion value)? buyXGetY,
    required TResult orElse(),
  }) {
    if (percentage != null) {
      return percentage(this);
    }
    return orElse();
  }
}

abstract class PercentageDiscount extends Promotion {
  const factory PercentageDiscount(
      {required final String id,
      required final String code,
      required final String name,
      required final double percentage,
      final DateTime? startDate,
      final DateTime? endDate,
      final double? minPurchaseAmount,
      final List<String>? applicableProductIds}) = _$PercentageDiscountImpl;
  const PercentageDiscount._() : super._();

  @override
  String get id;
  @override
  String get code;
  @override
  String get name;
  double get percentage;
  @override
  DateTime? get startDate;
  @override
  DateTime? get endDate;
  @override
  double? get minPurchaseAmount;
  List<String>? get applicableProductIds;

  /// Create a copy of Promotion
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PercentageDiscountImplCopyWith<_$PercentageDiscountImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FixedAmountDiscountImplCopyWith<$Res>
    implements $PromotionCopyWith<$Res> {
  factory _$$FixedAmountDiscountImplCopyWith(_$FixedAmountDiscountImpl value,
          $Res Function(_$FixedAmountDiscountImpl) then) =
      __$$FixedAmountDiscountImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String code,
      String name,
      double amount,
      DateTime? startDate,
      DateTime? endDate,
      double? minPurchaseAmount,
      List<String>? applicableProductIds});
}

/// @nodoc
class __$$FixedAmountDiscountImplCopyWithImpl<$Res>
    extends _$PromotionCopyWithImpl<$Res, _$FixedAmountDiscountImpl>
    implements _$$FixedAmountDiscountImplCopyWith<$Res> {
  __$$FixedAmountDiscountImplCopyWithImpl(_$FixedAmountDiscountImpl _value,
      $Res Function(_$FixedAmountDiscountImpl) _then)
      : super(_value, _then);

  /// Create a copy of Promotion
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? code = null,
    Object? name = null,
    Object? amount = null,
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? minPurchaseAmount = freezed,
    Object? applicableProductIds = freezed,
  }) {
    return _then(_$FixedAmountDiscountImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      minPurchaseAmount: freezed == minPurchaseAmount
          ? _value.minPurchaseAmount
          : minPurchaseAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      applicableProductIds: freezed == applicableProductIds
          ? _value._applicableProductIds
          : applicableProductIds // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc

class _$FixedAmountDiscountImpl extends FixedAmountDiscount {
  const _$FixedAmountDiscountImpl(
      {required this.id,
      required this.code,
      required this.name,
      required this.amount,
      this.startDate,
      this.endDate,
      this.minPurchaseAmount,
      final List<String>? applicableProductIds})
      : _applicableProductIds = applicableProductIds,
        super._();

  @override
  final String id;
  @override
  final String code;
  @override
  final String name;
  @override
  final double amount;
  @override
  final DateTime? startDate;
  @override
  final DateTime? endDate;
  @override
  final double? minPurchaseAmount;
  final List<String>? _applicableProductIds;
  @override
  List<String>? get applicableProductIds {
    final value = _applicableProductIds;
    if (value == null) return null;
    if (_applicableProductIds is EqualUnmodifiableListView)
      return _applicableProductIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Promotion.fixedAmount(id: $id, code: $code, name: $name, amount: $amount, startDate: $startDate, endDate: $endDate, minPurchaseAmount: $minPurchaseAmount, applicableProductIds: $applicableProductIds)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FixedAmountDiscountImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.minPurchaseAmount, minPurchaseAmount) ||
                other.minPurchaseAmount == minPurchaseAmount) &&
            const DeepCollectionEquality()
                .equals(other._applicableProductIds, _applicableProductIds));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      code,
      name,
      amount,
      startDate,
      endDate,
      minPurchaseAmount,
      const DeepCollectionEquality().hash(_applicableProductIds));

  /// Create a copy of Promotion
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FixedAmountDiscountImplCopyWith<_$FixedAmountDiscountImpl> get copyWith =>
      __$$FixedAmountDiscountImplCopyWithImpl<_$FixedAmountDiscountImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String id,
            String code,
            String name,
            double percentage,
            DateTime? startDate,
            DateTime? endDate,
            double? minPurchaseAmount,
            List<String>? applicableProductIds)
        percentage,
    required TResult Function(
            String id,
            String code,
            String name,
            double amount,
            DateTime? startDate,
            DateTime? endDate,
            double? minPurchaseAmount,
            List<String>? applicableProductIds)
        fixedAmount,
    required TResult Function(
            String id,
            String code,
            String name,
            int buyQty,
            int getQty,
            String buyProductId,
            String? getProductId,
            DateTime? startDate,
            DateTime? endDate,
            double? minPurchaseAmount)
        buyXGetY,
  }) {
    return fixedAmount(id, code, name, amount, startDate, endDate,
        minPurchaseAmount, applicableProductIds);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String id,
            String code,
            String name,
            double percentage,
            DateTime? startDate,
            DateTime? endDate,
            double? minPurchaseAmount,
            List<String>? applicableProductIds)?
        percentage,
    TResult? Function(
            String id,
            String code,
            String name,
            double amount,
            DateTime? startDate,
            DateTime? endDate,
            double? minPurchaseAmount,
            List<String>? applicableProductIds)?
        fixedAmount,
    TResult? Function(
            String id,
            String code,
            String name,
            int buyQty,
            int getQty,
            String buyProductId,
            String? getProductId,
            DateTime? startDate,
            DateTime? endDate,
            double? minPurchaseAmount)?
        buyXGetY,
  }) {
    return fixedAmount?.call(id, code, name, amount, startDate, endDate,
        minPurchaseAmount, applicableProductIds);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String id,
            String code,
            String name,
            double percentage,
            DateTime? startDate,
            DateTime? endDate,
            double? minPurchaseAmount,
            List<String>? applicableProductIds)?
        percentage,
    TResult Function(
            String id,
            String code,
            String name,
            double amount,
            DateTime? startDate,
            DateTime? endDate,
            double? minPurchaseAmount,
            List<String>? applicableProductIds)?
        fixedAmount,
    TResult Function(
            String id,
            String code,
            String name,
            int buyQty,
            int getQty,
            String buyProductId,
            String? getProductId,
            DateTime? startDate,
            DateTime? endDate,
            double? minPurchaseAmount)?
        buyXGetY,
    required TResult orElse(),
  }) {
    if (fixedAmount != null) {
      return fixedAmount(id, code, name, amount, startDate, endDate,
          minPurchaseAmount, applicableProductIds);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PercentageDiscount value) percentage,
    required TResult Function(FixedAmountDiscount value) fixedAmount,
    required TResult Function(BuyXGetYPromotion value) buyXGetY,
  }) {
    return fixedAmount(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PercentageDiscount value)? percentage,
    TResult? Function(FixedAmountDiscount value)? fixedAmount,
    TResult? Function(BuyXGetYPromotion value)? buyXGetY,
  }) {
    return fixedAmount?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PercentageDiscount value)? percentage,
    TResult Function(FixedAmountDiscount value)? fixedAmount,
    TResult Function(BuyXGetYPromotion value)? buyXGetY,
    required TResult orElse(),
  }) {
    if (fixedAmount != null) {
      return fixedAmount(this);
    }
    return orElse();
  }
}

abstract class FixedAmountDiscount extends Promotion {
  const factory FixedAmountDiscount(
      {required final String id,
      required final String code,
      required final String name,
      required final double amount,
      final DateTime? startDate,
      final DateTime? endDate,
      final double? minPurchaseAmount,
      final List<String>? applicableProductIds}) = _$FixedAmountDiscountImpl;
  const FixedAmountDiscount._() : super._();

  @override
  String get id;
  @override
  String get code;
  @override
  String get name;
  double get amount;
  @override
  DateTime? get startDate;
  @override
  DateTime? get endDate;
  @override
  double? get minPurchaseAmount;
  List<String>? get applicableProductIds;

  /// Create a copy of Promotion
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FixedAmountDiscountImplCopyWith<_$FixedAmountDiscountImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$BuyXGetYPromotionImplCopyWith<$Res>
    implements $PromotionCopyWith<$Res> {
  factory _$$BuyXGetYPromotionImplCopyWith(_$BuyXGetYPromotionImpl value,
          $Res Function(_$BuyXGetYPromotionImpl) then) =
      __$$BuyXGetYPromotionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String code,
      String name,
      int buyQty,
      int getQty,
      String buyProductId,
      String? getProductId,
      DateTime? startDate,
      DateTime? endDate,
      double? minPurchaseAmount});
}

/// @nodoc
class __$$BuyXGetYPromotionImplCopyWithImpl<$Res>
    extends _$PromotionCopyWithImpl<$Res, _$BuyXGetYPromotionImpl>
    implements _$$BuyXGetYPromotionImplCopyWith<$Res> {
  __$$BuyXGetYPromotionImplCopyWithImpl(_$BuyXGetYPromotionImpl _value,
      $Res Function(_$BuyXGetYPromotionImpl) _then)
      : super(_value, _then);

  /// Create a copy of Promotion
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? code = null,
    Object? name = null,
    Object? buyQty = null,
    Object? getQty = null,
    Object? buyProductId = null,
    Object? getProductId = freezed,
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? minPurchaseAmount = freezed,
  }) {
    return _then(_$BuyXGetYPromotionImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      buyQty: null == buyQty
          ? _value.buyQty
          : buyQty // ignore: cast_nullable_to_non_nullable
              as int,
      getQty: null == getQty
          ? _value.getQty
          : getQty // ignore: cast_nullable_to_non_nullable
              as int,
      buyProductId: null == buyProductId
          ? _value.buyProductId
          : buyProductId // ignore: cast_nullable_to_non_nullable
              as String,
      getProductId: freezed == getProductId
          ? _value.getProductId
          : getProductId // ignore: cast_nullable_to_non_nullable
              as String?,
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      minPurchaseAmount: freezed == minPurchaseAmount
          ? _value.minPurchaseAmount
          : minPurchaseAmount // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc

class _$BuyXGetYPromotionImpl extends BuyXGetYPromotion {
  const _$BuyXGetYPromotionImpl(
      {required this.id,
      required this.code,
      required this.name,
      required this.buyQty,
      required this.getQty,
      required this.buyProductId,
      this.getProductId,
      this.startDate,
      this.endDate,
      this.minPurchaseAmount})
      : super._();

  @override
  final String id;
  @override
  final String code;
  @override
  final String name;
  @override
  final int buyQty;
  @override
  final int getQty;
  @override
  final String buyProductId;
  @override
  final String? getProductId;
  @override
  final DateTime? startDate;
  @override
  final DateTime? endDate;
  @override
  final double? minPurchaseAmount;

  @override
  String toString() {
    return 'Promotion.buyXGetY(id: $id, code: $code, name: $name, buyQty: $buyQty, getQty: $getQty, buyProductId: $buyProductId, getProductId: $getProductId, startDate: $startDate, endDate: $endDate, minPurchaseAmount: $minPurchaseAmount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BuyXGetYPromotionImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.buyQty, buyQty) || other.buyQty == buyQty) &&
            (identical(other.getQty, getQty) || other.getQty == getQty) &&
            (identical(other.buyProductId, buyProductId) ||
                other.buyProductId == buyProductId) &&
            (identical(other.getProductId, getProductId) ||
                other.getProductId == getProductId) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.minPurchaseAmount, minPurchaseAmount) ||
                other.minPurchaseAmount == minPurchaseAmount));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, code, name, buyQty, getQty,
      buyProductId, getProductId, startDate, endDate, minPurchaseAmount);

  /// Create a copy of Promotion
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BuyXGetYPromotionImplCopyWith<_$BuyXGetYPromotionImpl> get copyWith =>
      __$$BuyXGetYPromotionImplCopyWithImpl<_$BuyXGetYPromotionImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String id,
            String code,
            String name,
            double percentage,
            DateTime? startDate,
            DateTime? endDate,
            double? minPurchaseAmount,
            List<String>? applicableProductIds)
        percentage,
    required TResult Function(
            String id,
            String code,
            String name,
            double amount,
            DateTime? startDate,
            DateTime? endDate,
            double? minPurchaseAmount,
            List<String>? applicableProductIds)
        fixedAmount,
    required TResult Function(
            String id,
            String code,
            String name,
            int buyQty,
            int getQty,
            String buyProductId,
            String? getProductId,
            DateTime? startDate,
            DateTime? endDate,
            double? minPurchaseAmount)
        buyXGetY,
  }) {
    return buyXGetY(id, code, name, buyQty, getQty, buyProductId, getProductId,
        startDate, endDate, minPurchaseAmount);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String id,
            String code,
            String name,
            double percentage,
            DateTime? startDate,
            DateTime? endDate,
            double? minPurchaseAmount,
            List<String>? applicableProductIds)?
        percentage,
    TResult? Function(
            String id,
            String code,
            String name,
            double amount,
            DateTime? startDate,
            DateTime? endDate,
            double? minPurchaseAmount,
            List<String>? applicableProductIds)?
        fixedAmount,
    TResult? Function(
            String id,
            String code,
            String name,
            int buyQty,
            int getQty,
            String buyProductId,
            String? getProductId,
            DateTime? startDate,
            DateTime? endDate,
            double? minPurchaseAmount)?
        buyXGetY,
  }) {
    return buyXGetY?.call(id, code, name, buyQty, getQty, buyProductId,
        getProductId, startDate, endDate, minPurchaseAmount);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String id,
            String code,
            String name,
            double percentage,
            DateTime? startDate,
            DateTime? endDate,
            double? minPurchaseAmount,
            List<String>? applicableProductIds)?
        percentage,
    TResult Function(
            String id,
            String code,
            String name,
            double amount,
            DateTime? startDate,
            DateTime? endDate,
            double? minPurchaseAmount,
            List<String>? applicableProductIds)?
        fixedAmount,
    TResult Function(
            String id,
            String code,
            String name,
            int buyQty,
            int getQty,
            String buyProductId,
            String? getProductId,
            DateTime? startDate,
            DateTime? endDate,
            double? minPurchaseAmount)?
        buyXGetY,
    required TResult orElse(),
  }) {
    if (buyXGetY != null) {
      return buyXGetY(id, code, name, buyQty, getQty, buyProductId,
          getProductId, startDate, endDate, minPurchaseAmount);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PercentageDiscount value) percentage,
    required TResult Function(FixedAmountDiscount value) fixedAmount,
    required TResult Function(BuyXGetYPromotion value) buyXGetY,
  }) {
    return buyXGetY(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PercentageDiscount value)? percentage,
    TResult? Function(FixedAmountDiscount value)? fixedAmount,
    TResult? Function(BuyXGetYPromotion value)? buyXGetY,
  }) {
    return buyXGetY?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PercentageDiscount value)? percentage,
    TResult Function(FixedAmountDiscount value)? fixedAmount,
    TResult Function(BuyXGetYPromotion value)? buyXGetY,
    required TResult orElse(),
  }) {
    if (buyXGetY != null) {
      return buyXGetY(this);
    }
    return orElse();
  }
}

abstract class BuyXGetYPromotion extends Promotion {
  const factory BuyXGetYPromotion(
      {required final String id,
      required final String code,
      required final String name,
      required final int buyQty,
      required final int getQty,
      required final String buyProductId,
      final String? getProductId,
      final DateTime? startDate,
      final DateTime? endDate,
      final double? minPurchaseAmount}) = _$BuyXGetYPromotionImpl;
  const BuyXGetYPromotion._() : super._();

  @override
  String get id;
  @override
  String get code;
  @override
  String get name;
  int get buyQty;
  int get getQty;
  String get buyProductId;
  String? get getProductId;
  @override
  DateTime? get startDate;
  @override
  DateTime? get endDate;
  @override
  double? get minPurchaseAmount;

  /// Create a copy of Promotion
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BuyXGetYPromotionImplCopyWith<_$BuyXGetYPromotionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
