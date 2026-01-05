import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';
import 'package:savvy_pos/core/database/database.dart';
import 'package:savvy_pos/features/reports/domain/entities/sales_report_item.dart';
import 'package:savvy_pos/features/reports/domain/entities/stock_ledger_item.dart';
import 'package:savvy_pos/features/reports/domain/repositories/i_report_repository.dart';

@LazySingleton(as: IReportRepository)
class ReportRepositoryImpl implements IReportRepository {
  final AppDatabase db;

  ReportRepositoryImpl(this.db);

  @override
  Future<List<SalesReportItem>> getSalesReport(DateTime start, DateTime end) async {
    // 1. Query Orders in Range
    // We join OrderItem -> Order -> Product to get Category and Cost
    final query = db.select(db.orderItemTable).join([
      innerJoin(db.orderTable, db.orderTable.uuid.equalsExp(db.orderItemTable.orderUuid)),
      innerJoin(db.productTable, db.productTable.uuid.equalsExp(db.orderItemTable.productUuid)),
    ])
      ..where(db.orderTable.transactionDate.isBetweenValues(start, end) &
          db.orderTable.status.equals('COMPLETED'));

    final rows = await query.get();

    // 2. Aggregate in Dart (Drift GroupBy is powerful but Dart is easier for calculated fields like Profit)
    final Map<String, SalesReportItem> aggregation = {};

    for (var row in rows) {
      final item = row.readTable(db.orderItemTable);
      final product = row.readTable(db.productTable);
      
      final key = product.uuid;
      final current = aggregation[key];
      
      final qty = item.quantity;
      final revenue = item.total; // already net of discount? Assuming total is realized price.
      final cost = (product.costPrice ?? 0.0) * qty;
      final profit = revenue - cost;

      if (current == null) {
        aggregation[key] = SalesReportItem(
          categoryName: product.categoryId, // Ideally join Category table if exists, else ID
          productName: product.name,
          quantitySold: qty,
          grossSales: revenue,
          costOfGoodsSold: cost,
          grossProfit: profit,
        );
      } else {
        aggregation[key] = current.copyWith(
          quantitySold: current.quantitySold + qty,
          grossSales: current.grossSales + revenue,
          costOfGoodsSold: current.costOfGoodsSold + cost,
          grossProfit: current.grossProfit + profit,
        );
      }
    }

    return aggregation.values.toList();
  }

  @override
  Future<List<StockLedgerItem>> getStockLedger(String productUuid) async {
    final rows = await (db.select(db.inventoryLedgerTable)
      ..where((t) => t.productUuid.equals(productUuid))
      ..orderBy([(t) => OrderingTerm(expression: t.timestamp, mode: OrderingMode.asc)]))
      .get();
      
    double runningStock = 0;
    final List<StockLedgerItem> result = [];

    for (var row in rows) {
      runningStock += row.quantityChange;
      result.add(StockLedgerItem(
        date: row.timestamp,
        type: row.type,
        quantityChange: row.quantityChange,
        referenceId: row.referenceId,
        newStockLevel: runningStock,
      ));
    }
    
    // Reverse to show newest first?
    return result.reversed.toList();
  }
}
