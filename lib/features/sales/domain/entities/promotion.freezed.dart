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
  String get name => throw _privateConstructorUsedError;
  String get code => throw _privateConstructorUsedError;
  PromotionConstraints get constraints => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String id, String name, String code,
            double percentage, PromotionConstraints constraints)
        percentage,
    required TResult Function(String id, String name, String code,
            double amount, PromotionConstraints constraints)
        fixedAmount,
    required TResult Function(String id, String name, String code, int buyQty,
            int getQty, String buyProductId, PromotionConstraints constraints)
        buyXGetY,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String id, String name, String code, double percentage,
            PromotionConstraints constraints)?
        percentage,
    TResult? Function(String id, String name, String code, double amount,
            PromotionConstraints constraints)?
        fixedAmount,
    TResult? Function(String id, String name, String code, int buyQty,
            int getQty, String buyProductId, PromotionConstraints constraints)?
        buyXGetY,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id, String name, String code, double percentage,
            PromotionConstraints constraints)?
        percentage,
    TResult Function(String id, String name, String code, double amount,
            PromotionConstraints constraints)?
        fixedAmount,
    TResult Function(String id, String name, String code, int buyQty,
            int getQty, String buyProductId, PromotionConstraints constraints)?
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
      {String id, String name, String code, PromotionConstraints constraints});

  $PromotionConstraintsCopyWith<$Res> get constraints;
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
    Object? name = null,
    Object? code = null,
    Object? constraints = null,
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
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      constraints: null == constraints
          ? _value.constraints
          : constraints // ignore: cast_nullable_to_non_nullable
              as PromotionConstraints,
    ) as $Val);
  }

  /// Create a copy of Promotion
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PromotionConstraintsCopyWith<$Res> get constraints {
    return $PromotionConstraintsCopyWith<$Res>(_value.constraints, (value) {
      return _then(_value.copyWith(constraints: value) as $Val);
    });
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
      String name,
      String code,
      double percentage,
      PromotionConstraints constraints});

  @override
  $PromotionConstraintsCopyWith<$Res> get constraints;
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
    Object? name = null,
    Object? code = null,
    Object? percentage = null,
    Object? constraints = null,
  }) {
    return _then(_$PercentageDiscountImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      percentage: null == percentage
          ? _value.percentage
          : percentage // ignore: cast_nullable_to_non_nullable
              as double,
      constraints: null == constraints
          ? _value.constraints
          : constraints // ignore: cast_nullable_to_non_nullable
              as PromotionConstraints,
    ));
  }
}

/// @nodoc

class _$PercentageDiscountImpl extends PercentageDiscount {
  const _$PercentageDiscountImpl(
      {required this.id,
      required this.name,
      required this.code,
      required this.percentage,
      this.constraints = const PromotionConstraints()})
      : super._();

  @override
  final String id;
  @override
  final String name;
  @override
  final String code;
  @override
  final double percentage;
  @override
  @JsonKey()
  final PromotionConstraints constraints;

  @override
  String toString() {
    return 'Promotion.percentage(id: $id, name: $name, code: $code, percentage: $percentage, constraints: $constraints)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PercentageDiscountImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.percentage, percentage) ||
                other.percentage == percentage) &&
            (identical(other.constraints, constraints) ||
                other.constraints == constraints));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, code, percentage, constraints);

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
    required TResult Function(String id, String name, String code,
            double percentage, PromotionConstraints constraints)
        percentage,
    required TResult Function(String id, String name, String code,
            double amount, PromotionConstraints constraints)
        fixedAmount,
    required TResult Function(String id, String name, String code, int buyQty,
            int getQty, String buyProductId, PromotionConstraints constraints)
        buyXGetY,
  }) {
    return percentage(id, name, code, this.percentage, constraints);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String id, String name, String code, double percentage,
            PromotionConstraints constraints)?
        percentage,
    TResult? Function(String id, String name, String code, double amount,
            PromotionConstraints constraints)?
        fixedAmount,
    TResult? Function(String id, String name, String code, int buyQty,
            int getQty, String buyProductId, PromotionConstraints constraints)?
        buyXGetY,
  }) {
    return percentage?.call(id, name, code, this.percentage, constraints);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id, String name, String code, double percentage,
            PromotionConstraints constraints)?
        percentage,
    TResult Function(String id, String name, String code, double amount,
            PromotionConstraints constraints)?
        fixedAmount,
    TResult Function(String id, String name, String code, int buyQty,
            int getQty, String buyProductId, PromotionConstraints constraints)?
        buyXGetY,
    required TResult orElse(),
  }) {
    if (percentage != null) {
      return percentage(id, name, code, this.percentage, constraints);
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
      required final String name,
      required final String code,
      required final double percentage,
      final PromotionConstraints constraints}) = _$PercentageDiscountImpl;
  const PercentageDiscount._() : super._();

  @override
  String get id;
  @override
  String get name;
  @override
  String get code;
  double get percentage;
  @override
  PromotionConstraints get constraints;

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
      String name,
      String code,
      double amount,
      PromotionConstraints constraints});

  @override
  $PromotionConstraintsCopyWith<$Res> get constraints;
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
    Object? name = null,
    Object? code = null,
    Object? amount = null,
    Object? constraints = null,
  }) {
    return _then(_$FixedAmountDiscountImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      constraints: null == constraints
          ? _value.constraints
          : constraints // ignore: cast_nullable_to_non_nullable
              as PromotionConstraints,
    ));
  }
}

/// @nodoc

class _$FixedAmountDiscountImpl extends FixedAmountDiscount {
  const _$FixedAmountDiscountImpl(
      {required this.id,
      required this.name,
      required this.code,
      required this.amount,
      this.constraints = const PromotionConstraints()})
      : super._();

  @override
  final String id;
  @override
  final String name;
  @override
  final String code;
  @override
  final double amount;
  @override
  @JsonKey()
  final PromotionConstraints constraints;

  @override
  String toString() {
    return 'Promotion.fixedAmount(id: $id, name: $name, code: $code, amount: $amount, constraints: $constraints)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FixedAmountDiscountImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.constraints, constraints) ||
                other.constraints == constraints));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, code, amount, constraints);

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
    required TResult Function(String id, String name, String code,
            double percentage, PromotionConstraints constraints)
        percentage,
    required TResult Function(String id, String name, String code,
            double amount, PromotionConstraints constraints)
        fixedAmount,
    required TResult Function(String id, String name, String code, int buyQty,
            int getQty, String buyProductId, PromotionConstraints constraints)
        buyXGetY,
  }) {
    return fixedAmount(id, name, code, amount, constraints);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String id, String name, String code, double percentage,
            PromotionConstraints constraints)?
        percentage,
    TResult? Function(String id, String name, String code, double amount,
            PromotionConstraints constraints)?
        fixedAmount,
    TResult? Function(String id, String name, String code, int buyQty,
            int getQty, String buyProductId, PromotionConstraints constraints)?
        buyXGetY,
  }) {
    return fixedAmount?.call(id, name, code, amount, constraints);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id, String name, String code, double percentage,
            PromotionConstraints constraints)?
        percentage,
    TResult Function(String id, String name, String code, double amount,
            PromotionConstraints constraints)?
        fixedAmount,
    TResult Function(String id, String name, String code, int buyQty,
            int getQty, String buyProductId, PromotionConstraints constraints)?
        buyXGetY,
    required TResult orElse(),
  }) {
    if (fixedAmount != null) {
      return fixedAmount(id, name, code, amount, constraints);
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
      required final String name,
      required final String code,
      required final double amount,
      final PromotionConstraints constraints}) = _$FixedAmountDiscountImpl;
  const FixedAmountDiscount._() : super._();

  @override
  String get id;
  @override
  String get name;
  @override
  String get code;
  double get amount;
  @override
  PromotionConstraints get constraints;

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
      String name,
      String code,
      int buyQty,
      int getQty,
      String buyProductId,
      PromotionConstraints constraints});

  @override
  $PromotionConstraintsCopyWith<$Res> get constraints;
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
    Object? name = null,
    Object? code = null,
    Object? buyQty = null,
    Object? getQty = null,
    Object? buyProductId = null,
    Object? constraints = null,
  }) {
    return _then(_$BuyXGetYPromotionImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
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
      constraints: null == constraints
          ? _value.constraints
          : constraints // ignore: cast_nullable_to_non_nullable
              as PromotionConstraints,
    ));
  }
}

/// @nodoc

class _$BuyXGetYPromotionImpl extends BuyXGetYPromotion {
  const _$BuyXGetYPromotionImpl(
      {required this.id,
      required this.name,
      required this.code,
      required this.buyQty,
      required this.getQty,
      required this.buyProductId,
      this.constraints = const PromotionConstraints()})
      : super._();

  @override
  final String id;
  @override
  final String name;
  @override
  final String code;
  @override
  final int buyQty;
  @override
  final int getQty;
  @override
  final String buyProductId;
// 'ANY' or specific UUID
  @override
  @JsonKey()
  final PromotionConstraints constraints;

  @override
  String toString() {
    return 'Promotion.buyXGetY(id: $id, name: $name, code: $code, buyQty: $buyQty, getQty: $getQty, buyProductId: $buyProductId, constraints: $constraints)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BuyXGetYPromotionImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.buyQty, buyQty) || other.buyQty == buyQty) &&
            (identical(other.getQty, getQty) || other.getQty == getQty) &&
            (identical(other.buyProductId, buyProductId) ||
                other.buyProductId == buyProductId) &&
            (identical(other.constraints, constraints) ||
                other.constraints == constraints));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, id, name, code, buyQty, getQty, buyProductId, constraints);

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
    required TResult Function(String id, String name, String code,
            double percentage, PromotionConstraints constraints)
        percentage,
    required TResult Function(String id, String name, String code,
            double amount, PromotionConstraints constraints)
        fixedAmount,
    required TResult Function(String id, String name, String code, int buyQty,
            int getQty, String buyProductId, PromotionConstraints constraints)
        buyXGetY,
  }) {
    return buyXGetY(id, name, code, buyQty, getQty, buyProductId, constraints);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String id, String name, String code, double percentage,
            PromotionConstraints constraints)?
        percentage,
    TResult? Function(String id, String name, String code, double amount,
            PromotionConstraints constraints)?
        fixedAmount,
    TResult? Function(String id, String name, String code, int buyQty,
            int getQty, String buyProductId, PromotionConstraints constraints)?
        buyXGetY,
  }) {
    return buyXGetY?.call(
        id, name, code, buyQty, getQty, buyProductId, constraints);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id, String name, String code, double percentage,
            PromotionConstraints constraints)?
        percentage,
    TResult Function(String id, String name, String code, double amount,
            PromotionConstraints constraints)?
        fixedAmount,
    TResult Function(String id, String name, String code, int buyQty,
            int getQty, String buyProductId, PromotionConstraints constraints)?
        buyXGetY,
    required TResult orElse(),
  }) {
    if (buyXGetY != null) {
      return buyXGetY(
          id, name, code, buyQty, getQty, buyProductId, constraints);
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
      required final String name,
      required final String code,
      required final int buyQty,
      required final int getQty,
      required final String buyProductId,
      final PromotionConstraints constraints}) = _$BuyXGetYPromotionImpl;
  const BuyXGetYPromotion._() : super._();

  @override
  String get id;
  @override
  String get name;
  @override
  String get code;
  int get buyQty;
  int get getQty;
  String get buyProductId; // 'ANY' or specific UUID
  @override
  PromotionConstraints get constraints;

  /// Create a copy of Promotion
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BuyXGetYPromotionImplCopyWith<_$BuyXGetYPromotionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$PromotionConstraints {
  double? get minPurchaseAmount => throw _privateConstructorUsedError;
  DateTime? get startDate => throw _privateConstructorUsedError;
  DateTime? get endDate => throw _privateConstructorUsedError;
  List<String>? get applicableProductIds => throw _privateConstructorUsedError;
  HappyHourTimeRange? get happyHourTimeRange =>
      throw _privateConstructorUsedError;

  /// Create a copy of PromotionConstraints
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PromotionConstraintsCopyWith<PromotionConstraints> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PromotionConstraintsCopyWith<$Res> {
  factory $PromotionConstraintsCopyWith(PromotionConstraints value,
          $Res Function(PromotionConstraints) then) =
      _$PromotionConstraintsCopyWithImpl<$Res, PromotionConstraints>;
  @useResult
  $Res call(
      {double? minPurchaseAmount,
      DateTime? startDate,
      DateTime? endDate,
      List<String>? applicableProductIds,
      HappyHourTimeRange? happyHourTimeRange});

  $HappyHourTimeRangeCopyWith<$Res>? get happyHourTimeRange;
}

/// @nodoc
class _$PromotionConstraintsCopyWithImpl<$Res,
        $Val extends PromotionConstraints>
    implements $PromotionConstraintsCopyWith<$Res> {
  _$PromotionConstraintsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PromotionConstraints
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? minPurchaseAmount = freezed,
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? applicableProductIds = freezed,
    Object? happyHourTimeRange = freezed,
  }) {
    return _then(_value.copyWith(
      minPurchaseAmount: freezed == minPurchaseAmount
          ? _value.minPurchaseAmount
          : minPurchaseAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      applicableProductIds: freezed == applicableProductIds
          ? _value.applicableProductIds
          : applicableProductIds // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      happyHourTimeRange: freezed == happyHourTimeRange
          ? _value.happyHourTimeRange
          : happyHourTimeRange // ignore: cast_nullable_to_non_nullable
              as HappyHourTimeRange?,
    ) as $Val);
  }

  /// Create a copy of PromotionConstraints
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $HappyHourTimeRangeCopyWith<$Res>? get happyHourTimeRange {
    if (_value.happyHourTimeRange == null) {
      return null;
    }

    return $HappyHourTimeRangeCopyWith<$Res>(_value.happyHourTimeRange!,
        (value) {
      return _then(_value.copyWith(happyHourTimeRange: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PromotionConstraintsImplCopyWith<$Res>
    implements $PromotionConstraintsCopyWith<$Res> {
  factory _$$PromotionConstraintsImplCopyWith(_$PromotionConstraintsImpl value,
          $Res Function(_$PromotionConstraintsImpl) then) =
      __$$PromotionConstraintsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double? minPurchaseAmount,
      DateTime? startDate,
      DateTime? endDate,
      List<String>? applicableProductIds,
      HappyHourTimeRange? happyHourTimeRange});

  @override
  $HappyHourTimeRangeCopyWith<$Res>? get happyHourTimeRange;
}

/// @nodoc
class __$$PromotionConstraintsImplCopyWithImpl<$Res>
    extends _$PromotionConstraintsCopyWithImpl<$Res, _$PromotionConstraintsImpl>
    implements _$$PromotionConstraintsImplCopyWith<$Res> {
  __$$PromotionConstraintsImplCopyWithImpl(_$PromotionConstraintsImpl _value,
      $Res Function(_$PromotionConstraintsImpl) _then)
      : super(_value, _then);

  /// Create a copy of PromotionConstraints
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? minPurchaseAmount = freezed,
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? applicableProductIds = freezed,
    Object? happyHourTimeRange = freezed,
  }) {
    return _then(_$PromotionConstraintsImpl(
      minPurchaseAmount: freezed == minPurchaseAmount
          ? _value.minPurchaseAmount
          : minPurchaseAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      applicableProductIds: freezed == applicableProductIds
          ? _value._applicableProductIds
          : applicableProductIds // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      happyHourTimeRange: freezed == happyHourTimeRange
          ? _value.happyHourTimeRange
          : happyHourTimeRange // ignore: cast_nullable_to_non_nullable
              as HappyHourTimeRange?,
    ));
  }
}

/// @nodoc

class _$PromotionConstraintsImpl extends _PromotionConstraints {
  const _$PromotionConstraintsImpl(
      {this.minPurchaseAmount,
      this.startDate,
      this.endDate,
      final List<String>? applicableProductIds,
      this.happyHourTimeRange})
      : _applicableProductIds = applicableProductIds,
        super._();

  @override
  final double? minPurchaseAmount;
  @override
  final DateTime? startDate;
  @override
  final DateTime? endDate;
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
  final HappyHourTimeRange? happyHourTimeRange;

  @override
  String toString() {
    return 'PromotionConstraints(minPurchaseAmount: $minPurchaseAmount, startDate: $startDate, endDate: $endDate, applicableProductIds: $applicableProductIds, happyHourTimeRange: $happyHourTimeRange)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PromotionConstraintsImpl &&
            (identical(other.minPurchaseAmount, minPurchaseAmount) ||
                other.minPurchaseAmount == minPurchaseAmount) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            const DeepCollectionEquality()
                .equals(other._applicableProductIds, _applicableProductIds) &&
            (identical(other.happyHourTimeRange, happyHourTimeRange) ||
                other.happyHourTimeRange == happyHourTimeRange));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      minPurchaseAmount,
      startDate,
      endDate,
      const DeepCollectionEquality().hash(_applicableProductIds),
      happyHourTimeRange);

  /// Create a copy of PromotionConstraints
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PromotionConstraintsImplCopyWith<_$PromotionConstraintsImpl>
      get copyWith =>
          __$$PromotionConstraintsImplCopyWithImpl<_$PromotionConstraintsImpl>(
              this, _$identity);
}

abstract class _PromotionConstraints extends PromotionConstraints {
  const factory _PromotionConstraints(
          {final double? minPurchaseAmount,
          final DateTime? startDate,
          final DateTime? endDate,
          final List<String>? applicableProductIds,
          final HappyHourTimeRange? happyHourTimeRange}) =
      _$PromotionConstraintsImpl;
  const _PromotionConstraints._() : super._();

  @override
  double? get minPurchaseAmount;
  @override
  DateTime? get startDate;
  @override
  DateTime? get endDate;
  @override
  List<String>? get applicableProductIds;
  @override
  HappyHourTimeRange? get happyHourTimeRange;

  /// Create a copy of PromotionConstraints
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PromotionConstraintsImplCopyWith<_$PromotionConstraintsImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$HappyHourTimeRange {
  int get startHour => throw _privateConstructorUsedError;
  int get startMinute => throw _privateConstructorUsedError;
  int get endHour => throw _privateConstructorUsedError;
  int get endMinute => throw _privateConstructorUsedError;

  /// Create a copy of HappyHourTimeRange
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HappyHourTimeRangeCopyWith<HappyHourTimeRange> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HappyHourTimeRangeCopyWith<$Res> {
  factory $HappyHourTimeRangeCopyWith(
          HappyHourTimeRange value, $Res Function(HappyHourTimeRange) then) =
      _$HappyHourTimeRangeCopyWithImpl<$Res, HappyHourTimeRange>;
  @useResult
  $Res call({int startHour, int startMinute, int endHour, int endMinute});
}

/// @nodoc
class _$HappyHourTimeRangeCopyWithImpl<$Res, $Val extends HappyHourTimeRange>
    implements $HappyHourTimeRangeCopyWith<$Res> {
  _$HappyHourTimeRangeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HappyHourTimeRange
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? startHour = null,
    Object? startMinute = null,
    Object? endHour = null,
    Object? endMinute = null,
  }) {
    return _then(_value.copyWith(
      startHour: null == startHour
          ? _value.startHour
          : startHour // ignore: cast_nullable_to_non_nullable
              as int,
      startMinute: null == startMinute
          ? _value.startMinute
          : startMinute // ignore: cast_nullable_to_non_nullable
              as int,
      endHour: null == endHour
          ? _value.endHour
          : endHour // ignore: cast_nullable_to_non_nullable
              as int,
      endMinute: null == endMinute
          ? _value.endMinute
          : endMinute // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HappyHourTimeRangeImplCopyWith<$Res>
    implements $HappyHourTimeRangeCopyWith<$Res> {
  factory _$$HappyHourTimeRangeImplCopyWith(_$HappyHourTimeRangeImpl value,
          $Res Function(_$HappyHourTimeRangeImpl) then) =
      __$$HappyHourTimeRangeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int startHour, int startMinute, int endHour, int endMinute});
}

/// @nodoc
class __$$HappyHourTimeRangeImplCopyWithImpl<$Res>
    extends _$HappyHourTimeRangeCopyWithImpl<$Res, _$HappyHourTimeRangeImpl>
    implements _$$HappyHourTimeRangeImplCopyWith<$Res> {
  __$$HappyHourTimeRangeImplCopyWithImpl(_$HappyHourTimeRangeImpl _value,
      $Res Function(_$HappyHourTimeRangeImpl) _then)
      : super(_value, _then);

  /// Create a copy of HappyHourTimeRange
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? startHour = null,
    Object? startMinute = null,
    Object? endHour = null,
    Object? endMinute = null,
  }) {
    return _then(_$HappyHourTimeRangeImpl(
      startHour: null == startHour
          ? _value.startHour
          : startHour // ignore: cast_nullable_to_non_nullable
              as int,
      startMinute: null == startMinute
          ? _value.startMinute
          : startMinute // ignore: cast_nullable_to_non_nullable
              as int,
      endHour: null == endHour
          ? _value.endHour
          : endHour // ignore: cast_nullable_to_non_nullable
              as int,
      endMinute: null == endMinute
          ? _value.endMinute
          : endMinute // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$HappyHourTimeRangeImpl extends _HappyHourTimeRange {
  const _$HappyHourTimeRangeImpl(
      {required this.startHour,
      required this.startMinute,
      required this.endHour,
      required this.endMinute})
      : super._();

  @override
  final int startHour;
  @override
  final int startMinute;
  @override
  final int endHour;
  @override
  final int endMinute;

  @override
  String toString() {
    return 'HappyHourTimeRange(startHour: $startHour, startMinute: $startMinute, endHour: $endHour, endMinute: $endMinute)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HappyHourTimeRangeImpl &&
            (identical(other.startHour, startHour) ||
                other.startHour == startHour) &&
            (identical(other.startMinute, startMinute) ||
                other.startMinute == startMinute) &&
            (identical(other.endHour, endHour) || other.endHour == endHour) &&
            (identical(other.endMinute, endMinute) ||
                other.endMinute == endMinute));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, startHour, startMinute, endHour, endMinute);

  /// Create a copy of HappyHourTimeRange
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HappyHourTimeRangeImplCopyWith<_$HappyHourTimeRangeImpl> get copyWith =>
      __$$HappyHourTimeRangeImplCopyWithImpl<_$HappyHourTimeRangeImpl>(
          this, _$identity);
}

abstract class _HappyHourTimeRange extends HappyHourTimeRange {
  const factory _HappyHourTimeRange(
      {required final int startHour,
      required final int startMinute,
      required final int endHour,
      required final int endMinute}) = _$HappyHourTimeRangeImpl;
  const _HappyHourTimeRange._() : super._();

  @override
  int get startHour;
  @override
  int get startMinute;
  @override
  int get endHour;
  @override
  int get endMinute;

  /// Create a copy of HappyHourTimeRange
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HappyHourTimeRangeImplCopyWith<_$HappyHourTimeRangeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
