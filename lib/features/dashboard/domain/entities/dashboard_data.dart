class DailySalesData {
  final DateTime date;
  final double total;

  const DailySalesData(this.date, this.total);
}

class HourlySalesData {
  final int hour;
  final double total;

  const HourlySalesData(this.hour, this.total);
}

class TopProductData {
  final String productName;
  final double quantity; // Changed from int to double to match Repo
  final double totalSales;

  const TopProductData(
    this.productName,
    this.quantity, {
    this.totalSales = 0.0,
  });
}

class DashboardStats {
  final double totalSales;
  final int transactionCount;
  final double avgBasketSize;
  final String? topCategory; // Added

  const DashboardStats({
    required this.totalSales,
    required this.transactionCount,
    required this.avgBasketSize,
    this.topCategory,
  });
}
