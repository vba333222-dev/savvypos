abstract class IDashboardRepository {
  Future<List<DailySalesData>> getSalesLast7Days();
  Future<double> getTodaySales();
  Future<int> getPendingSyncCount();
}

class DailySalesData {
  final DateTime date;
  final double total;
  DailySalesData(this.date, this.total);
}
