import 'package:freezed_annotation/freezed_annotation.dart';

part 'analytics_entities.freezed.dart';
part 'analytics_entities.g.dart';

@freezed
class SalesSummary with _$SalesSummary {
  const factory SalesSummary({
    required double totalSales,
    required double netSales,
    required double grossProfit,
    required int transactionCount,
    required double avgTicketSize,
    required double discountTotal,
    required double taxTotal,
  }) = _SalesSummary;

  factory SalesSummary.fromJson(Map<String, dynamic> json) =>
      _$SalesSummaryFromJson(json);
}

@freezed
class LaborMetric with _$LaborMetric {
  const factory LaborMetric({
    required double totalLaborCost,
    required double laborPercentage, // Labor Cost / Net Sales
    required double salesPerLaborHour, // Net Sales / Total Labor Hours (SPLH)
    required double totalLaborHours,
  }) = _LaborMetric;

  factory LaborMetric.fromJson(Map<String, dynamic> json) =>
      _$LaborMetricFromJson(json);
}

enum MenuItemCategory {
  star, // High Profit, High Volume
  plowhorse, // Low Profit, High Volume
  puzzle, // High Profit, Low Volume
  dog, // Low Profit, Low Volume
}

@freezed
class MenuPerformance with _$MenuPerformance {
  const factory MenuPerformance({
    required String itemId,
    required String itemName,
    required int qtySold,
    required double totalRevenue,
    required double cost,
    required double margin, // (Revenue - Cost) / Revenue
    required MenuItemCategory category,
  }) = _MenuPerformance;

  factory MenuPerformance.fromJson(Map<String, dynamic> json) =>
      _$MenuPerformanceFromJson(json);
}

@freezed
class HourlySales with _$HourlySales {
  const factory HourlySales({
    required int hour, // 0-23
    required double sales,
    required int transactionCount,
  }) = _HourlySales;

  factory HourlySales.fromJson(Map<String, dynamic> json) =>
      _$HourlySalesFromJson(json);
}
