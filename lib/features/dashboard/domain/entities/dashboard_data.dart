class DashboardStats {
  final double totalSales;
  final int transactionCount;
  final double avgBasketSize;

  const DashboardStats({
    required this.totalSales,
    required this.transactionCount,
    required this.avgBasketSize,
  });
}

class HourlySalesData {
  final int hour;
  final double total;

  const HourlySalesData(this.hour, this.total);
}

class TopProductData {
  final String productName;
  final int quantity;
  final double totalSales;

  const TopProductData({
    required this.productName,
    required this.quantity,
    required this.totalSales,
  });
}
