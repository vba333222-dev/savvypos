// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'analytics_entities.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SalesSummary _$SalesSummaryFromJson(Map<String, dynamic> json) {
  return _SalesSummary.fromJson(json);
}

/// @nodoc
mixin _$SalesSummary {
  double get totalSales => throw _privateConstructorUsedError;
  double get netSales => throw _privateConstructorUsedError;
  double get grossProfit => throw _privateConstructorUsedError;
  int get transactionCount => throw _privateConstructorUsedError;
  double get avgTicketSize => throw _privateConstructorUsedError;
  double get discountTotal => throw _privateConstructorUsedError;
  double get taxTotal => throw _privateConstructorUsedError;

  /// Serializes this SalesSummary to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SalesSummary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SalesSummaryCopyWith<SalesSummary> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SalesSummaryCopyWith<$Res> {
  factory $SalesSummaryCopyWith(
          SalesSummary value, $Res Function(SalesSummary) then) =
      _$SalesSummaryCopyWithImpl<$Res, SalesSummary>;
  @useResult
  $Res call(
      {double totalSales,
      double netSales,
      double grossProfit,
      int transactionCount,
      double avgTicketSize,
      double discountTotal,
      double taxTotal});
}

/// @nodoc
class _$SalesSummaryCopyWithImpl<$Res, $Val extends SalesSummary>
    implements $SalesSummaryCopyWith<$Res> {
  _$SalesSummaryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SalesSummary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalSales = null,
    Object? netSales = null,
    Object? grossProfit = null,
    Object? transactionCount = null,
    Object? avgTicketSize = null,
    Object? discountTotal = null,
    Object? taxTotal = null,
  }) {
    return _then(_value.copyWith(
      totalSales: null == totalSales
          ? _value.totalSales
          : totalSales // ignore: cast_nullable_to_non_nullable
              as double,
      netSales: null == netSales
          ? _value.netSales
          : netSales // ignore: cast_nullable_to_non_nullable
              as double,
      grossProfit: null == grossProfit
          ? _value.grossProfit
          : grossProfit // ignore: cast_nullable_to_non_nullable
              as double,
      transactionCount: null == transactionCount
          ? _value.transactionCount
          : transactionCount // ignore: cast_nullable_to_non_nullable
              as int,
      avgTicketSize: null == avgTicketSize
          ? _value.avgTicketSize
          : avgTicketSize // ignore: cast_nullable_to_non_nullable
              as double,
      discountTotal: null == discountTotal
          ? _value.discountTotal
          : discountTotal // ignore: cast_nullable_to_non_nullable
              as double,
      taxTotal: null == taxTotal
          ? _value.taxTotal
          : taxTotal // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SalesSummaryImplCopyWith<$Res>
    implements $SalesSummaryCopyWith<$Res> {
  factory _$$SalesSummaryImplCopyWith(
          _$SalesSummaryImpl value, $Res Function(_$SalesSummaryImpl) then) =
      __$$SalesSummaryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double totalSales,
      double netSales,
      double grossProfit,
      int transactionCount,
      double avgTicketSize,
      double discountTotal,
      double taxTotal});
}

/// @nodoc
class __$$SalesSummaryImplCopyWithImpl<$Res>
    extends _$SalesSummaryCopyWithImpl<$Res, _$SalesSummaryImpl>
    implements _$$SalesSummaryImplCopyWith<$Res> {
  __$$SalesSummaryImplCopyWithImpl(
      _$SalesSummaryImpl _value, $Res Function(_$SalesSummaryImpl) _then)
      : super(_value, _then);

  /// Create a copy of SalesSummary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalSales = null,
    Object? netSales = null,
    Object? grossProfit = null,
    Object? transactionCount = null,
    Object? avgTicketSize = null,
    Object? discountTotal = null,
    Object? taxTotal = null,
  }) {
    return _then(_$SalesSummaryImpl(
      totalSales: null == totalSales
          ? _value.totalSales
          : totalSales // ignore: cast_nullable_to_non_nullable
              as double,
      netSales: null == netSales
          ? _value.netSales
          : netSales // ignore: cast_nullable_to_non_nullable
              as double,
      grossProfit: null == grossProfit
          ? _value.grossProfit
          : grossProfit // ignore: cast_nullable_to_non_nullable
              as double,
      transactionCount: null == transactionCount
          ? _value.transactionCount
          : transactionCount // ignore: cast_nullable_to_non_nullable
              as int,
      avgTicketSize: null == avgTicketSize
          ? _value.avgTicketSize
          : avgTicketSize // ignore: cast_nullable_to_non_nullable
              as double,
      discountTotal: null == discountTotal
          ? _value.discountTotal
          : discountTotal // ignore: cast_nullable_to_non_nullable
              as double,
      taxTotal: null == taxTotal
          ? _value.taxTotal
          : taxTotal // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SalesSummaryImpl implements _SalesSummary {
  const _$SalesSummaryImpl(
      {required this.totalSales,
      required this.netSales,
      required this.grossProfit,
      required this.transactionCount,
      required this.avgTicketSize,
      required this.discountTotal,
      required this.taxTotal});

  factory _$SalesSummaryImpl.fromJson(Map<String, dynamic> json) =>
      _$$SalesSummaryImplFromJson(json);

  @override
  final double totalSales;
  @override
  final double netSales;
  @override
  final double grossProfit;
  @override
  final int transactionCount;
  @override
  final double avgTicketSize;
  @override
  final double discountTotal;
  @override
  final double taxTotal;

  @override
  String toString() {
    return 'SalesSummary(totalSales: $totalSales, netSales: $netSales, grossProfit: $grossProfit, transactionCount: $transactionCount, avgTicketSize: $avgTicketSize, discountTotal: $discountTotal, taxTotal: $taxTotal)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SalesSummaryImpl &&
            (identical(other.totalSales, totalSales) ||
                other.totalSales == totalSales) &&
            (identical(other.netSales, netSales) ||
                other.netSales == netSales) &&
            (identical(other.grossProfit, grossProfit) ||
                other.grossProfit == grossProfit) &&
            (identical(other.transactionCount, transactionCount) ||
                other.transactionCount == transactionCount) &&
            (identical(other.avgTicketSize, avgTicketSize) ||
                other.avgTicketSize == avgTicketSize) &&
            (identical(other.discountTotal, discountTotal) ||
                other.discountTotal == discountTotal) &&
            (identical(other.taxTotal, taxTotal) ||
                other.taxTotal == taxTotal));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, totalSales, netSales,
      grossProfit, transactionCount, avgTicketSize, discountTotal, taxTotal);

  /// Create a copy of SalesSummary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SalesSummaryImplCopyWith<_$SalesSummaryImpl> get copyWith =>
      __$$SalesSummaryImplCopyWithImpl<_$SalesSummaryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SalesSummaryImplToJson(
      this,
    );
  }
}

abstract class _SalesSummary implements SalesSummary {
  const factory _SalesSummary(
      {required final double totalSales,
      required final double netSales,
      required final double grossProfit,
      required final int transactionCount,
      required final double avgTicketSize,
      required final double discountTotal,
      required final double taxTotal}) = _$SalesSummaryImpl;

  factory _SalesSummary.fromJson(Map<String, dynamic> json) =
      _$SalesSummaryImpl.fromJson;

  @override
  double get totalSales;
  @override
  double get netSales;
  @override
  double get grossProfit;
  @override
  int get transactionCount;
  @override
  double get avgTicketSize;
  @override
  double get discountTotal;
  @override
  double get taxTotal;

  /// Create a copy of SalesSummary
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SalesSummaryImplCopyWith<_$SalesSummaryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

LaborMetric _$LaborMetricFromJson(Map<String, dynamic> json) {
  return _LaborMetric.fromJson(json);
}

/// @nodoc
mixin _$LaborMetric {
  double get totalLaborCost => throw _privateConstructorUsedError;
  double get laborPercentage =>
      throw _privateConstructorUsedError; // Labor Cost / Net Sales
  double get salesPerLaborHour =>
      throw _privateConstructorUsedError; // Net Sales / Total Labor Hours (SPLH)
  double get totalLaborHours => throw _privateConstructorUsedError;

  /// Serializes this LaborMetric to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LaborMetric
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LaborMetricCopyWith<LaborMetric> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LaborMetricCopyWith<$Res> {
  factory $LaborMetricCopyWith(
          LaborMetric value, $Res Function(LaborMetric) then) =
      _$LaborMetricCopyWithImpl<$Res, LaborMetric>;
  @useResult
  $Res call(
      {double totalLaborCost,
      double laborPercentage,
      double salesPerLaborHour,
      double totalLaborHours});
}

/// @nodoc
class _$LaborMetricCopyWithImpl<$Res, $Val extends LaborMetric>
    implements $LaborMetricCopyWith<$Res> {
  _$LaborMetricCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LaborMetric
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalLaborCost = null,
    Object? laborPercentage = null,
    Object? salesPerLaborHour = null,
    Object? totalLaborHours = null,
  }) {
    return _then(_value.copyWith(
      totalLaborCost: null == totalLaborCost
          ? _value.totalLaborCost
          : totalLaborCost // ignore: cast_nullable_to_non_nullable
              as double,
      laborPercentage: null == laborPercentage
          ? _value.laborPercentage
          : laborPercentage // ignore: cast_nullable_to_non_nullable
              as double,
      salesPerLaborHour: null == salesPerLaborHour
          ? _value.salesPerLaborHour
          : salesPerLaborHour // ignore: cast_nullable_to_non_nullable
              as double,
      totalLaborHours: null == totalLaborHours
          ? _value.totalLaborHours
          : totalLaborHours // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LaborMetricImplCopyWith<$Res>
    implements $LaborMetricCopyWith<$Res> {
  factory _$$LaborMetricImplCopyWith(
          _$LaborMetricImpl value, $Res Function(_$LaborMetricImpl) then) =
      __$$LaborMetricImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double totalLaborCost,
      double laborPercentage,
      double salesPerLaborHour,
      double totalLaborHours});
}

/// @nodoc
class __$$LaborMetricImplCopyWithImpl<$Res>
    extends _$LaborMetricCopyWithImpl<$Res, _$LaborMetricImpl>
    implements _$$LaborMetricImplCopyWith<$Res> {
  __$$LaborMetricImplCopyWithImpl(
      _$LaborMetricImpl _value, $Res Function(_$LaborMetricImpl) _then)
      : super(_value, _then);

  /// Create a copy of LaborMetric
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalLaborCost = null,
    Object? laborPercentage = null,
    Object? salesPerLaborHour = null,
    Object? totalLaborHours = null,
  }) {
    return _then(_$LaborMetricImpl(
      totalLaborCost: null == totalLaborCost
          ? _value.totalLaborCost
          : totalLaborCost // ignore: cast_nullable_to_non_nullable
              as double,
      laborPercentage: null == laborPercentage
          ? _value.laborPercentage
          : laborPercentage // ignore: cast_nullable_to_non_nullable
              as double,
      salesPerLaborHour: null == salesPerLaborHour
          ? _value.salesPerLaborHour
          : salesPerLaborHour // ignore: cast_nullable_to_non_nullable
              as double,
      totalLaborHours: null == totalLaborHours
          ? _value.totalLaborHours
          : totalLaborHours // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LaborMetricImpl implements _LaborMetric {
  const _$LaborMetricImpl(
      {required this.totalLaborCost,
      required this.laborPercentage,
      required this.salesPerLaborHour,
      required this.totalLaborHours});

  factory _$LaborMetricImpl.fromJson(Map<String, dynamic> json) =>
      _$$LaborMetricImplFromJson(json);

  @override
  final double totalLaborCost;
  @override
  final double laborPercentage;
// Labor Cost / Net Sales
  @override
  final double salesPerLaborHour;
// Net Sales / Total Labor Hours (SPLH)
  @override
  final double totalLaborHours;

  @override
  String toString() {
    return 'LaborMetric(totalLaborCost: $totalLaborCost, laborPercentage: $laborPercentage, salesPerLaborHour: $salesPerLaborHour, totalLaborHours: $totalLaborHours)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LaborMetricImpl &&
            (identical(other.totalLaborCost, totalLaborCost) ||
                other.totalLaborCost == totalLaborCost) &&
            (identical(other.laborPercentage, laborPercentage) ||
                other.laborPercentage == laborPercentage) &&
            (identical(other.salesPerLaborHour, salesPerLaborHour) ||
                other.salesPerLaborHour == salesPerLaborHour) &&
            (identical(other.totalLaborHours, totalLaborHours) ||
                other.totalLaborHours == totalLaborHours));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, totalLaborCost, laborPercentage,
      salesPerLaborHour, totalLaborHours);

  /// Create a copy of LaborMetric
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LaborMetricImplCopyWith<_$LaborMetricImpl> get copyWith =>
      __$$LaborMetricImplCopyWithImpl<_$LaborMetricImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LaborMetricImplToJson(
      this,
    );
  }
}

abstract class _LaborMetric implements LaborMetric {
  const factory _LaborMetric(
      {required final double totalLaborCost,
      required final double laborPercentage,
      required final double salesPerLaborHour,
      required final double totalLaborHours}) = _$LaborMetricImpl;

  factory _LaborMetric.fromJson(Map<String, dynamic> json) =
      _$LaborMetricImpl.fromJson;

  @override
  double get totalLaborCost;
  @override
  double get laborPercentage; // Labor Cost / Net Sales
  @override
  double get salesPerLaborHour; // Net Sales / Total Labor Hours (SPLH)
  @override
  double get totalLaborHours;

  /// Create a copy of LaborMetric
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LaborMetricImplCopyWith<_$LaborMetricImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MenuPerformance _$MenuPerformanceFromJson(Map<String, dynamic> json) {
  return _MenuPerformance.fromJson(json);
}

/// @nodoc
mixin _$MenuPerformance {
  String get itemId => throw _privateConstructorUsedError;
  String get itemName => throw _privateConstructorUsedError;
  int get qtySold => throw _privateConstructorUsedError;
  double get totalRevenue => throw _privateConstructorUsedError;
  double get cost => throw _privateConstructorUsedError;
  double get margin =>
      throw _privateConstructorUsedError; // (Revenue - Cost) / Revenue
  MenuItemCategory get category => throw _privateConstructorUsedError;

  /// Serializes this MenuPerformance to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MenuPerformance
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MenuPerformanceCopyWith<MenuPerformance> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MenuPerformanceCopyWith<$Res> {
  factory $MenuPerformanceCopyWith(
          MenuPerformance value, $Res Function(MenuPerformance) then) =
      _$MenuPerformanceCopyWithImpl<$Res, MenuPerformance>;
  @useResult
  $Res call(
      {String itemId,
      String itemName,
      int qtySold,
      double totalRevenue,
      double cost,
      double margin,
      MenuItemCategory category});
}

/// @nodoc
class _$MenuPerformanceCopyWithImpl<$Res, $Val extends MenuPerformance>
    implements $MenuPerformanceCopyWith<$Res> {
  _$MenuPerformanceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MenuPerformance
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? itemId = null,
    Object? itemName = null,
    Object? qtySold = null,
    Object? totalRevenue = null,
    Object? cost = null,
    Object? margin = null,
    Object? category = null,
  }) {
    return _then(_value.copyWith(
      itemId: null == itemId
          ? _value.itemId
          : itemId // ignore: cast_nullable_to_non_nullable
              as String,
      itemName: null == itemName
          ? _value.itemName
          : itemName // ignore: cast_nullable_to_non_nullable
              as String,
      qtySold: null == qtySold
          ? _value.qtySold
          : qtySold // ignore: cast_nullable_to_non_nullable
              as int,
      totalRevenue: null == totalRevenue
          ? _value.totalRevenue
          : totalRevenue // ignore: cast_nullable_to_non_nullable
              as double,
      cost: null == cost
          ? _value.cost
          : cost // ignore: cast_nullable_to_non_nullable
              as double,
      margin: null == margin
          ? _value.margin
          : margin // ignore: cast_nullable_to_non_nullable
              as double,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as MenuItemCategory,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MenuPerformanceImplCopyWith<$Res>
    implements $MenuPerformanceCopyWith<$Res> {
  factory _$$MenuPerformanceImplCopyWith(_$MenuPerformanceImpl value,
          $Res Function(_$MenuPerformanceImpl) then) =
      __$$MenuPerformanceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String itemId,
      String itemName,
      int qtySold,
      double totalRevenue,
      double cost,
      double margin,
      MenuItemCategory category});
}

/// @nodoc
class __$$MenuPerformanceImplCopyWithImpl<$Res>
    extends _$MenuPerformanceCopyWithImpl<$Res, _$MenuPerformanceImpl>
    implements _$$MenuPerformanceImplCopyWith<$Res> {
  __$$MenuPerformanceImplCopyWithImpl(
      _$MenuPerformanceImpl _value, $Res Function(_$MenuPerformanceImpl) _then)
      : super(_value, _then);

  /// Create a copy of MenuPerformance
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? itemId = null,
    Object? itemName = null,
    Object? qtySold = null,
    Object? totalRevenue = null,
    Object? cost = null,
    Object? margin = null,
    Object? category = null,
  }) {
    return _then(_$MenuPerformanceImpl(
      itemId: null == itemId
          ? _value.itemId
          : itemId // ignore: cast_nullable_to_non_nullable
              as String,
      itemName: null == itemName
          ? _value.itemName
          : itemName // ignore: cast_nullable_to_non_nullable
              as String,
      qtySold: null == qtySold
          ? _value.qtySold
          : qtySold // ignore: cast_nullable_to_non_nullable
              as int,
      totalRevenue: null == totalRevenue
          ? _value.totalRevenue
          : totalRevenue // ignore: cast_nullable_to_non_nullable
              as double,
      cost: null == cost
          ? _value.cost
          : cost // ignore: cast_nullable_to_non_nullable
              as double,
      margin: null == margin
          ? _value.margin
          : margin // ignore: cast_nullable_to_non_nullable
              as double,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as MenuItemCategory,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MenuPerformanceImpl implements _MenuPerformance {
  const _$MenuPerformanceImpl(
      {required this.itemId,
      required this.itemName,
      required this.qtySold,
      required this.totalRevenue,
      required this.cost,
      required this.margin,
      required this.category});

  factory _$MenuPerformanceImpl.fromJson(Map<String, dynamic> json) =>
      _$$MenuPerformanceImplFromJson(json);

  @override
  final String itemId;
  @override
  final String itemName;
  @override
  final int qtySold;
  @override
  final double totalRevenue;
  @override
  final double cost;
  @override
  final double margin;
// (Revenue - Cost) / Revenue
  @override
  final MenuItemCategory category;

  @override
  String toString() {
    return 'MenuPerformance(itemId: $itemId, itemName: $itemName, qtySold: $qtySold, totalRevenue: $totalRevenue, cost: $cost, margin: $margin, category: $category)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MenuPerformanceImpl &&
            (identical(other.itemId, itemId) || other.itemId == itemId) &&
            (identical(other.itemName, itemName) ||
                other.itemName == itemName) &&
            (identical(other.qtySold, qtySold) || other.qtySold == qtySold) &&
            (identical(other.totalRevenue, totalRevenue) ||
                other.totalRevenue == totalRevenue) &&
            (identical(other.cost, cost) || other.cost == cost) &&
            (identical(other.margin, margin) || other.margin == margin) &&
            (identical(other.category, category) ||
                other.category == category));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, itemId, itemName, qtySold,
      totalRevenue, cost, margin, category);

  /// Create a copy of MenuPerformance
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MenuPerformanceImplCopyWith<_$MenuPerformanceImpl> get copyWith =>
      __$$MenuPerformanceImplCopyWithImpl<_$MenuPerformanceImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MenuPerformanceImplToJson(
      this,
    );
  }
}

abstract class _MenuPerformance implements MenuPerformance {
  const factory _MenuPerformance(
      {required final String itemId,
      required final String itemName,
      required final int qtySold,
      required final double totalRevenue,
      required final double cost,
      required final double margin,
      required final MenuItemCategory category}) = _$MenuPerformanceImpl;

  factory _MenuPerformance.fromJson(Map<String, dynamic> json) =
      _$MenuPerformanceImpl.fromJson;

  @override
  String get itemId;
  @override
  String get itemName;
  @override
  int get qtySold;
  @override
  double get totalRevenue;
  @override
  double get cost;
  @override
  double get margin; // (Revenue - Cost) / Revenue
  @override
  MenuItemCategory get category;

  /// Create a copy of MenuPerformance
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MenuPerformanceImplCopyWith<_$MenuPerformanceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

HourlySales _$HourlySalesFromJson(Map<String, dynamic> json) {
  return _HourlySales.fromJson(json);
}

/// @nodoc
mixin _$HourlySales {
  int get hour => throw _privateConstructorUsedError; // 0-23
  double get sales => throw _privateConstructorUsedError;
  int get transactionCount => throw _privateConstructorUsedError;

  /// Serializes this HourlySales to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of HourlySales
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HourlySalesCopyWith<HourlySales> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HourlySalesCopyWith<$Res> {
  factory $HourlySalesCopyWith(
          HourlySales value, $Res Function(HourlySales) then) =
      _$HourlySalesCopyWithImpl<$Res, HourlySales>;
  @useResult
  $Res call({int hour, double sales, int transactionCount});
}

/// @nodoc
class _$HourlySalesCopyWithImpl<$Res, $Val extends HourlySales>
    implements $HourlySalesCopyWith<$Res> {
  _$HourlySalesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HourlySales
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hour = null,
    Object? sales = null,
    Object? transactionCount = null,
  }) {
    return _then(_value.copyWith(
      hour: null == hour
          ? _value.hour
          : hour // ignore: cast_nullable_to_non_nullable
              as int,
      sales: null == sales
          ? _value.sales
          : sales // ignore: cast_nullable_to_non_nullable
              as double,
      transactionCount: null == transactionCount
          ? _value.transactionCount
          : transactionCount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HourlySalesImplCopyWith<$Res>
    implements $HourlySalesCopyWith<$Res> {
  factory _$$HourlySalesImplCopyWith(
          _$HourlySalesImpl value, $Res Function(_$HourlySalesImpl) then) =
      __$$HourlySalesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int hour, double sales, int transactionCount});
}

/// @nodoc
class __$$HourlySalesImplCopyWithImpl<$Res>
    extends _$HourlySalesCopyWithImpl<$Res, _$HourlySalesImpl>
    implements _$$HourlySalesImplCopyWith<$Res> {
  __$$HourlySalesImplCopyWithImpl(
      _$HourlySalesImpl _value, $Res Function(_$HourlySalesImpl) _then)
      : super(_value, _then);

  /// Create a copy of HourlySales
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hour = null,
    Object? sales = null,
    Object? transactionCount = null,
  }) {
    return _then(_$HourlySalesImpl(
      hour: null == hour
          ? _value.hour
          : hour // ignore: cast_nullable_to_non_nullable
              as int,
      sales: null == sales
          ? _value.sales
          : sales // ignore: cast_nullable_to_non_nullable
              as double,
      transactionCount: null == transactionCount
          ? _value.transactionCount
          : transactionCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$HourlySalesImpl implements _HourlySales {
  const _$HourlySalesImpl(
      {required this.hour,
      required this.sales,
      required this.transactionCount});

  factory _$HourlySalesImpl.fromJson(Map<String, dynamic> json) =>
      _$$HourlySalesImplFromJson(json);

  @override
  final int hour;
// 0-23
  @override
  final double sales;
  @override
  final int transactionCount;

  @override
  String toString() {
    return 'HourlySales(hour: $hour, sales: $sales, transactionCount: $transactionCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HourlySalesImpl &&
            (identical(other.hour, hour) || other.hour == hour) &&
            (identical(other.sales, sales) || other.sales == sales) &&
            (identical(other.transactionCount, transactionCount) ||
                other.transactionCount == transactionCount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, hour, sales, transactionCount);

  /// Create a copy of HourlySales
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HourlySalesImplCopyWith<_$HourlySalesImpl> get copyWith =>
      __$$HourlySalesImplCopyWithImpl<_$HourlySalesImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HourlySalesImplToJson(
      this,
    );
  }
}

abstract class _HourlySales implements HourlySales {
  const factory _HourlySales(
      {required final int hour,
      required final double sales,
      required final int transactionCount}) = _$HourlySalesImpl;

  factory _HourlySales.fromJson(Map<String, dynamic> json) =
      _$HourlySalesImpl.fromJson;

  @override
  int get hour; // 0-23
  @override
  double get sales;
  @override
  int get transactionCount;

  /// Create a copy of HourlySales
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HourlySalesImplCopyWith<_$HourlySalesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
