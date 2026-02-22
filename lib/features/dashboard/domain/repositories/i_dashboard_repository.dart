import 'package:savvy_pos/features/dashboard/domain/entities/dashboard_data.dart';

abstract class IDashboardRepository {
  Future<DashboardStats> getStatsForPeriod(DateTime start, DateTime end);
  Future<List<HourlySalesData>> getHourlySales(DateTime date);
  Future<List<TopProductData>> getTopProducts(DateTime start, DateTime end,
      {int limit = 5});
}
