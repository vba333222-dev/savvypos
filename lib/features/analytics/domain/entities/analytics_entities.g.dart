// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'analytics_entities.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SalesSummaryImpl _$$SalesSummaryImplFromJson(Map<String, dynamic> json) =>
    _$SalesSummaryImpl(
      totalSales: (json['totalSales'] as num).toDouble(),
      netSales: (json['netSales'] as num).toDouble(),
      grossProfit: (json['grossProfit'] as num).toDouble(),
      transactionCount: (json['transactionCount'] as num).toInt(),
      avgTicketSize: (json['avgTicketSize'] as num).toDouble(),
      discountTotal: (json['discountTotal'] as num).toDouble(),
      taxTotal: (json['taxTotal'] as num).toDouble(),
    );

Map<String, dynamic> _$$SalesSummaryImplToJson(_$SalesSummaryImpl instance) =>
    <String, dynamic>{
      'totalSales': instance.totalSales,
      'netSales': instance.netSales,
      'grossProfit': instance.grossProfit,
      'transactionCount': instance.transactionCount,
      'avgTicketSize': instance.avgTicketSize,
      'discountTotal': instance.discountTotal,
      'taxTotal': instance.taxTotal,
    };

_$LaborMetricImpl _$$LaborMetricImplFromJson(Map<String, dynamic> json) =>
    _$LaborMetricImpl(
      totalLaborCost: (json['totalLaborCost'] as num).toDouble(),
      laborPercentage: (json['laborPercentage'] as num).toDouble(),
      salesPerLaborHour: (json['salesPerLaborHour'] as num).toDouble(),
      totalLaborHours: (json['totalLaborHours'] as num).toDouble(),
    );

Map<String, dynamic> _$$LaborMetricImplToJson(_$LaborMetricImpl instance) =>
    <String, dynamic>{
      'totalLaborCost': instance.totalLaborCost,
      'laborPercentage': instance.laborPercentage,
      'salesPerLaborHour': instance.salesPerLaborHour,
      'totalLaborHours': instance.totalLaborHours,
    };

_$MenuPerformanceImpl _$$MenuPerformanceImplFromJson(
        Map<String, dynamic> json) =>
    _$MenuPerformanceImpl(
      itemId: json['itemId'] as String,
      itemName: json['itemName'] as String,
      qtySold: (json['qtySold'] as num).toInt(),
      totalRevenue: (json['totalRevenue'] as num).toDouble(),
      cost: (json['cost'] as num).toDouble(),
      margin: (json['margin'] as num).toDouble(),
      category: $enumDecode(_$MenuItemCategoryEnumMap, json['category']),
    );

Map<String, dynamic> _$$MenuPerformanceImplToJson(
        _$MenuPerformanceImpl instance) =>
    <String, dynamic>{
      'itemId': instance.itemId,
      'itemName': instance.itemName,
      'qtySold': instance.qtySold,
      'totalRevenue': instance.totalRevenue,
      'cost': instance.cost,
      'margin': instance.margin,
      'category': _$MenuItemCategoryEnumMap[instance.category]!,
    };

const _$MenuItemCategoryEnumMap = {
  MenuItemCategory.star: 'star',
  MenuItemCategory.plowhorse: 'plowhorse',
  MenuItemCategory.puzzle: 'puzzle',
  MenuItemCategory.dog: 'dog',
};

_$HourlySalesImpl _$$HourlySalesImplFromJson(Map<String, dynamic> json) =>
    _$HourlySalesImpl(
      hour: (json['hour'] as num).toInt(),
      sales: (json['sales'] as num).toDouble(),
      transactionCount: (json['transactionCount'] as num).toInt(),
    );

Map<String, dynamic> _$$HourlySalesImplToJson(_$HourlySalesImpl instance) =>
    <String, dynamic>{
      'hour': instance.hour,
      'sales': instance.sales,
      'transactionCount': instance.transactionCount,
    };
