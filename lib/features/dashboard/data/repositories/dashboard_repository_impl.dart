import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';
import 'package:savvy_pos/core/database/database.dart';
import 'package:savvy_pos/features/dashboard/domain/repositories/i_dashboard_repository.dart';

@LazySingleton(as: IDashboardRepository)
class DashboardRepositoryImpl implements IDashboardRepository {
  final AppDatabase db;

  DashboardRepositoryImpl(this.db);

  @override
  Future<List<DailySalesData>> getSalesLast7Days() async {
    final now = DateTime.now();
    final sevenDaysAgo = now.subtract(const Duration(days: 7));
    
    // Group by Date query (Native SQL or Drift complexity, keeping it simple -> fetch and map)
    // For large datasets, this should be optimized.
    final orders = await (db.select(db.orderTable)
          ..where((t) => t.transactionDate.isBiggerOrEqualValue(sevenDaysAgo)))
        .get();

    final Map<DateTime, double> grouped = {};
    
    // Initialize last 7 days with 0
    for (int i = 0; i < 7; i++) {
      final d = now.subtract(Duration(days: i));
      final dateOnly = DateTime(d.year, d.month, d.day);
      grouped[dateOnly] = 0.0;
    }

    for (var o in orders) {
      final dateOnly = DateTime(o.transactionDate.year, o.transactionDate.month, o.transactionDate.day);
      if (grouped.containsKey(dateOnly)) {
        grouped[dateOnly] = grouped[dateOnly]! + o.grandTotal;
      }
    }

    return grouped.entries
        .map((e) => DailySalesData(e.key, e.value))
        .toList()
        ..sort((a, b) => a.date.compareTo(b.date));
  }

  @override
  Future<double> getTodaySales() async {
    final now = DateTime.now();
    final startOfDay = DateTime(now.year, now.month, now.day);
    
    final orders = await (db.select(db.orderTable)
          ..where((t) => t.transactionDate.isBiggerOrEqualValue(startOfDay)))
        .get();
        
    return orders.fold(0.0, (sum, o) => sum + o.grandTotal);
  }

  @override
  Future<int> getPendingSyncCount() async {
    final count = countAll();
    final result = await (db.selectOnly(db.syncQueue)..addColumns([count])).getSingle();
    return result.read(count) ?? 0;
  }
}
