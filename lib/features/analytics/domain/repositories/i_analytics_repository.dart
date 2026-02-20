import 'package:flutter/material.dart';
import 'package:savvy_pos/features/analytics/domain/entities/analytics_entities.dart';

abstract class IAnalyticsRepository {
  /// Get sales summary for a date range
  Future<SalesSummary> getSalesSummary(DateTimeRange range);

  /// Get labor cost metrics for a date range
  Future<LaborMetric> getLaborMetrics(DateTimeRange range);

  /// Get product mix (PMIX) analysis for a date range
  Future<List<MenuPerformance>> getProductMix(DateTimeRange range);
  
  /// Get hourly sales breakdown for a specific day
  Future<List<HourlySales>> getHourlySales(DateTime date);
}
