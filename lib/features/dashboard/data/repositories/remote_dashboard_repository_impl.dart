import 'package:injectable/injectable.dart';
import 'package:savvy_pos/core/network/api_client.dart';
import 'package:savvy_pos/features/dashboard/domain/repositories/i_dashboard_repository.dart';

@LazySingleton(as: IDashboardRepository, env: ['web'])
class RemoteDashboardRepositoryImpl implements IDashboardRepository {
  final ApiClient apiClient;

  RemoteDashboardRepositoryImpl(this.apiClient);

  @override
  Future<int> getPendingSyncCount() async {
    // Web reads directly from server, so "pending sync" from local device standpoint doesn't exist.
    // However, we could fetch "Offline Devices" count from server if API existed.
    // For now, return 0.
    return 0;
  }

  @override
  Future<List<DailySalesData>> getSalesLast7Days() async {
    final data = await apiClient.getSalesChart();
    return data.map((e) {
      // Backend returns "YYYY-MM-DD"
      final date = DateTime.tryParse(e['date'] as String) ?? DateTime.now();
      final total = (e['total'] as num).toDouble();
      return DailySalesData(date, total);
    }).toList();
  }

  @override
  Future<double> getTodaySales() async {
    final data = await apiClient.getAnalyticsSummary();
    if (data == null) return 0.0;
    return (data['today_sales'] as num).toDouble();
  }

  @override
  Future<List<TopSellingItem>> getTopSellingProducts() async {
    final data = await apiClient.getTopProducts();
    return data.map((e) {
      return TopSellingItem(
        e['name'] as String,
        (e['quantity'] as num).toDouble(),
      );
    }).toList();
  }
}
