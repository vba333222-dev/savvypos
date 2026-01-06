abstract class IDashboardRepository {
  Future<List<DailySalesData>> getSalesLast7Days();
  Future<double> getTodaySales();
  Future<int> getPendingSyncCount();
  Future<List<TopSellingItem>> getTopSellingProducts();
}

class DailySalesData {
  final DateTime date;
  final double total;
  DailySalesData(this.date, this.total);
}

class TopSellingItem {
  final String name;
  final double quantity;
  TopSellingItem(this.name, this.quantity);
}
