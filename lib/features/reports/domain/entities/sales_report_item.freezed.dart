// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sales_report_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SalesReportItem {
  String get categoryName => throw _privateConstructorUsedError;
  String get productName => throw _privateConstructorUsedError;
  double get quantitySold => throw _privateConstructorUsedError;
  double get grossSales => throw _privateConstructorUsedError;
  double get costOfGoodsSold => throw _privateConstructorUsedError;
  double get grossProfit => throw _privateConstructorUsedError;

  /// Create a copy of SalesReportItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SalesReportItemCopyWith<SalesReportItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SalesReportItemCopyWith<$Res> {
  factory $SalesReportItemCopyWith(
          SalesReportItem value, $Res Function(SalesReportItem) then) =
      _$SalesReportItemCopyWithImpl<$Res, SalesReportItem>;
  @useResult
  $Res call(
      {String categoryName,
      String productName,
      double quantitySold,
      double grossSales,
      double costOfGoodsSold,
      double grossProfit});
}

/// @nodoc
class _$SalesReportItemCopyWithImpl<$Res, $Val extends SalesReportItem>
    implements $SalesReportItemCopyWith<$Res> {
  _$SalesReportItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SalesReportItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categoryName = null,
    Object? productName = null,
    Object? quantitySold = null,
    Object? grossSales = null,
    Object? costOfGoodsSold = null,
    Object? grossProfit = null,
  }) {
    return _then(_value.copyWith(
      categoryName: null == categoryName
          ? _value.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
              as String,
      productName: null == productName
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String,
      quantitySold: null == quantitySold
          ? _value.quantitySold
          : quantitySold // ignore: cast_nullable_to_non_nullable
              as double,
      grossSales: null == grossSales
          ? _value.grossSales
          : grossSales // ignore: cast_nullable_to_non_nullable
              as double,
      costOfGoodsSold: null == costOfGoodsSold
          ? _value.costOfGoodsSold
          : costOfGoodsSold // ignore: cast_nullable_to_non_nullable
              as double,
      grossProfit: null == grossProfit
          ? _value.grossProfit
          : grossProfit // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SalesReportItemImplCopyWith<$Res>
    implements $SalesReportItemCopyWith<$Res> {
  factory _$$SalesReportItemImplCopyWith(_$SalesReportItemImpl value,
          $Res Function(_$SalesReportItemImpl) then) =
      __$$SalesReportItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String categoryName,
      String productName,
      double quantitySold,
      double grossSales,
      double costOfGoodsSold,
      double grossProfit});
}

/// @nodoc
class __$$SalesReportItemImplCopyWithImpl<$Res>
    extends _$SalesReportItemCopyWithImpl<$Res, _$SalesReportItemImpl>
    implements _$$SalesReportItemImplCopyWith<$Res> {
  __$$SalesReportItemImplCopyWithImpl(
      _$SalesReportItemImpl _value, $Res Function(_$SalesReportItemImpl) _then)
      : super(_value, _then);

  /// Create a copy of SalesReportItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categoryName = null,
    Object? productName = null,
    Object? quantitySold = null,
    Object? grossSales = null,
    Object? costOfGoodsSold = null,
    Object? grossProfit = null,
  }) {
    return _then(_$SalesReportItemImpl(
      categoryName: null == categoryName
          ? _value.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
              as String,
      productName: null == productName
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String,
      quantitySold: null == quantitySold
          ? _value.quantitySold
          : quantitySold // ignore: cast_nullable_to_non_nullable
              as double,
      grossSales: null == grossSales
          ? _value.grossSales
          : grossSales // ignore: cast_nullable_to_non_nullable
              as double,
      costOfGoodsSold: null == costOfGoodsSold
          ? _value.costOfGoodsSold
          : costOfGoodsSold // ignore: cast_nullable_to_non_nullable
              as double,
      grossProfit: null == grossProfit
          ? _value.grossProfit
          : grossProfit // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$SalesReportItemImpl implements _SalesReportItem {
  const _$SalesReportItemImpl(
      {required this.categoryName,
      required this.productName,
      required this.quantitySold,
      required this.grossSales,
      required this.costOfGoodsSold,
      required this.grossProfit});

  @override
  final String categoryName;
  @override
  final String productName;
  @override
  final double quantitySold;
  @override
  final double grossSales;
  @override
  final double costOfGoodsSold;
  @override
  final double grossProfit;

  @override
  String toString() {
    return 'SalesReportItem(categoryName: $categoryName, productName: $productName, quantitySold: $quantitySold, grossSales: $grossSales, costOfGoodsSold: $costOfGoodsSold, grossProfit: $grossProfit)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SalesReportItemImpl &&
            (identical(other.categoryName, categoryName) ||
                other.categoryName == categoryName) &&
            (identical(other.productName, productName) ||
                other.productName == productName) &&
            (identical(other.quantitySold, quantitySold) ||
                other.quantitySold == quantitySold) &&
            (identical(other.grossSales, grossSales) ||
                other.grossSales == grossSales) &&
            (identical(other.costOfGoodsSold, costOfGoodsSold) ||
                other.costOfGoodsSold == costOfGoodsSold) &&
            (identical(other.grossProfit, grossProfit) ||
                other.grossProfit == grossProfit));
  }

  @override
  int get hashCode => Object.hash(runtimeType, categoryName, productName,
      quantitySold, grossSales, costOfGoodsSold, grossProfit);

  /// Create a copy of SalesReportItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SalesReportItemImplCopyWith<_$SalesReportItemImpl> get copyWith =>
      __$$SalesReportItemImplCopyWithImpl<_$SalesReportItemImpl>(
          this, _$identity);
}

abstract class _SalesReportItem implements SalesReportItem {
  const factory _SalesReportItem(
      {required final String categoryName,
      required final String productName,
      required final double quantitySold,
      required final double grossSales,
      required final double costOfGoodsSold,
      required final double grossProfit}) = _$SalesReportItemImpl;

  @override
  String get categoryName;
  @override
  String get productName;
  @override
  double get quantitySold;
  @override
  double get grossSales;
  @override
  double get costOfGoodsSold;
  @override
  double get grossProfit;

  /// Create a copy of SalesReportItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SalesReportItemImplCopyWith<_$SalesReportItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
