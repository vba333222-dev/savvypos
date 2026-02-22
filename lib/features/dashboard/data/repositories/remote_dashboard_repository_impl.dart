import 'package:injectable/injectable.dart';
import 'package:savvy_pos/core/network/api_client.dart';
import 'package:savvy_pos/features/dashboard/domain/repositories/i_dashboard_repository.dart';
import 'package:savvy_pos/features/dashboard/domain/entities/dashboard_data.dart';

@LazySingleton(as: IDashboardRepository, env: ['web'])
class RemoteDashboardRepositoryImpl implements IDashboardRepository {
  final ApiClient apiClient;

  RemoteDashboardRepositoryImpl(this.apiClient);

  Future<int> getPendingSyncCount() async {
    // Web reads directly from server, so "pending sync" from local device standpoint doesn't exist.
    // However, we could fetch "Offline Devices" count from server if API existed.
    // For now, return 0.
    return 0;
  }

  Future<List<DailySalesData>> getSalesLast7Days() async {
    final data = await apiClient.getSalesChart();
    return data.map((e) {
      // Backend returns "YYYY-MM-DD"
      final date = DateTime.tryParse(e['date'] as String) ?? DateTime.now();
      final total = (e['total'] as num).toDouble();
      return DailySalesData(date, total);
    }).toList();
  }

  Future<double> getTodaySales() async {
    final data = await apiClient.getAnalyticsSummary();
    if (data == null) return 0.0;
    return (data['today_sales'] as num).toDouble();
  }

  @override
  Future<List<TopProductData>> getTopProducts(DateTime start, DateTime end,
      {int limit = 5}) async {
    final data = await apiClient.getTopProducts(); // Pass dates if API supports
    return data.take(limit).map((e) {
      return TopProductData(
        e['name'] as String,
        (e['quantity'] as num).toDouble(),
        totalSales: (e['total_sales'] as num?)?.toDouble() ?? 0.0,
      );
    }).toList();
  }

  @override
  Future<DashboardStats> getStatsForPeriod(DateTime start, DateTime end) async {
    // Mock or fetch from API
    return DashboardStats(
      totalSales: 0.0,
      transactionCount: 0,
      avgBasketSize: 0.0,
      topCategory: 'N/A',
    );
  }

  @override
  Future<List<HourlySalesData>> getHourlySales(DateTime date) async {
    return [];
  }
}
