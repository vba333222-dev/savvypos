import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';
import 'package:savvy_pos/core/database/database.dart';
import 'package:savvy_pos/features/reports/domain/entities/sales_report_item.dart';
import 'package:savvy_pos/features/reports/domain/entities/stock_ledger_item.dart';
import 'package:savvy_pos/features/reports/domain/repositories/i_report_repository.dart';
import 'package:savvy_pos/core/utils/isolate_helper.dart';

@LazySingleton(as: IReportRepository)
class ReportRepositoryImpl implements IReportRepository {
  final AppDatabase db;

  ReportRepositoryImpl(this.db);

  @override
  Future<List<SalesReportItem>> getSalesReport(
      DateTime start, DateTime end) async {
    // 1. Query Orders in Range (Main Isolate)
    final query = db.select(db.orderItemTable).join([
      innerJoin(db.orderTable,
          db.orderTable.uuid.equalsExp(db.orderItemTable.orderUuid)),
      innerJoin(db.productTable,
          db.productTable.uuid.equalsExp(db.orderItemTable.productUuid)),
    ])
      ..where(db.orderTable.transactionDate.isBetweenValues(start, end) &
          db.orderTable.status.equals('COMPLETED'));

    final rows = await query.get();

    // 2. Map to transferrable DTOs (Lightweight)
    final rawItems = rows.map((row) {
      final item = row.readTable(db.orderItemTable);
      final product = row.readTable(db.productTable);
      return _RawSaleItem(
        productUuid: product.uuid,
        categoryName: product.categoryId,
        productName: product.name,
        quantity: item.quantity,
        revenue: item.total,
        costPrice: product.costPrice ?? 0.0,
      );
    }).toList();

    // 3. Aggregate in Background Isolate (Warp Core)
    return IsolateHelper.run(_aggregateSales, rawItems.cast<_RawSaleItem>());
  }

  @override
  Future<List<StockLedgerItem>> getStockLedger(String productUuid) async {
    final rows = await (db.select(db.inventoryLedgerTable)
          ..where((t) => t.productUuid.equals(productUuid))
          ..orderBy([
            (t) => OrderingTerm(expression: t.timestamp, mode: OrderingMode.asc)
          ]))
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

// Transferrable DTO
class _RawSaleItem {
  final String productUuid;
  final String categoryName;
  final String productName;
  final double quantity;
  final double revenue;
  final double costPrice;

  _RawSaleItem({
    required this.productUuid,
    required this.categoryName,
    required this.productName,
    required this.quantity,
    required this.revenue,
    required this.costPrice,
  });
}

// Static/Top-level function for Isolate
List<SalesReportItem> _aggregateSales(List<_RawSaleItem> items) {
  final Map<String, SalesReportItem> aggregation = {};

  for (var item in items) {
    final key = item.productUuid;
    final current = aggregation[key];

    final cost = item.costPrice * item.quantity;
    final profit = item.revenue - cost;

    if (current == null) {
      aggregation[key] = SalesReportItem(
        categoryName: item.categoryName,
        productName: item.productName,
        quantitySold: item.quantity,
        grossSales: item.revenue,
        costOfGoodsSold: cost,
        grossProfit: profit,
      );
    } else {
      aggregation[key] = current.copyWith(
        quantitySold: current.quantitySold + item.quantity,
        grossSales: current.grossSales + item.revenue,
        costOfGoodsSold: current.costOfGoodsSold + cost,
        grossProfit: current.grossProfit + profit,
      );
    }
  }

  return aggregation.values.toList();
}
