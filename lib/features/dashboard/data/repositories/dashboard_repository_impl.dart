import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';
import 'package:savvy_pos/core/database/database.dart';
import 'package:savvy_pos/features/dashboard/domain/entities/dashboard_data.dart';
import 'package:savvy_pos/features/dashboard/domain/repositories/i_dashboard_repository.dart';

@LazySingleton(as: IDashboardRepository, env: ['mobile'])
class DashboardRepositoryImpl implements IDashboardRepository {
  final AppDatabase db;

  DashboardRepositoryImpl(this.db);

  @override
  Future<DashboardStats> getStatsForPeriod(DateTime start, DateTime end) async {
    final totalSales = db.orderTable.grandTotal.sum();
    final count = db.orderTable.id.count();
    final avg = db.orderTable.grandTotal.avg();

    final query = db.selectOnly(db.orderTable)
      ..addColumns([totalSales, count, avg])
      ..where(db.orderTable.transactionDate.isBetweenValues(start, end) &
          db.orderTable.status.equals('COMPLETED'));

    final result = await query.getSingle();

    return DashboardStats(
      totalSales: result.read(totalSales) ?? 0.0,
      transactionCount: result.read(count) ?? 0,
      avgBasketSize: result.read(avg) ?? 0.0,
    );
  }

  @override
  Future<List<HourlySalesData>> getHourlySales(DateTime date) async {
    // Start and End of the specific day
    final startOfDay = DateTime(date.year, date.month, date.day);
    final endOfDay = startOfDay.add(const Duration(days: 1)).subtract(const Duration(seconds: 1));

    // SQLite 'strftime' to extract hour.
    // Note: Drift stores DateTime as Unix timestamp (seconds) usually in NativeDatabase.
    // We use 'unixepoch' modifier if it's int, or just %H if text. 
    // Safer approach in pure Drift: Fetch all for the day and aggregate in Dart 
    // IF we are unsure of storage. 
    // BUT the user demanded SQL Group By.
    // Let's assume standard Drift Native setup: Int (Unix Seconds).
    // strftime('%H', transaction_date, 'unixepoch', 'localtime')
    
    // Custom Expression for Hour
    // We'll trust Drift's `hour` getter if available, otherwise raw SQL.
    // Drift doesn't have a direct `.hour` on expression yet in all versions.
    // Let's use custom expression.
    
    final hourExp = FunctionCallExpression('strftime', [
      const Constant<String>('%H'),
      db.orderTable.transactionDate,
      const Constant<String>('unixepoch'),
      const Constant<String>('localtime'),
    ]);
    
    final totalExp = db.orderTable.grandTotal.sum();

    final query = db.selectOnly(db.orderTable)
      ..addColumns([hourExp, totalExp])
      ..where(db.orderTable.transactionDate.isBetweenValues(startOfDay, endOfDay) &
          db.orderTable.status.equals('COMPLETED'))
      ..groupBy([hourExp]);

    final results = await query.get();

    return results.map((row) {
      final hourStr = row.read(hourExp) as String?; // Cast to String
      final total = row.read(totalExp);
      return HourlySalesData(int.tryParse(hourStr ?? '0') ?? 0, total ?? 0.0);
    }).toList();
  }

  @override
  Future<List<TopProductData>> getTopProducts(DateTime start, DateTime end, {int limit = 5}) async {
    final qtySum = db.orderItemTable.quantity.sum();
    final salesSum = db.orderItemTable.total.sum();

    // Join Orders, OrderItems, Products
    final query = db.selectOnly(db.orderItemTable)
      ..join([
        innerJoin(db.orderTable, db.orderTable.uuid.equalsExp(db.orderItemTable.orderUuid)),
        innerJoin(db.productTable, db.productTable.uuid.equalsExp(db.orderItemTable.productUuid)), // Assuming productUuid link
        // Note: OrderItemTable has productUuid column based on tables.dart? 
        // tables.dart: TextColumn get productUuid => text()(); 
        // It's not a reference() but a manual link. That's fine.
      ])
      ..addColumns([db.productTable.name, qtySum, salesSum])
      ..where(db.orderTable.transactionDate.isBetweenValues(start, end) &
          db.orderTable.status.equals('COMPLETED'))
      ..groupBy([db.orderItemTable.productUuid])
      ..orderBy([OrderingTerm(expression: qtySum, mode: OrderingMode.desc)])
      ..limit(limit);

    final results = await query.get();

    return results.map((row) {
      return TopProductData(
        row.read(db.productTable.name) ?? 'Unknown',
        row.read(qtySum)?.toDouble() ?? 0.0,
        totalSales: row.read(salesSum) ?? 0.0,
      );
    }).toList();
  }
}
