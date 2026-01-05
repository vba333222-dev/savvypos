import 'package:savvy_pos/features/reports/domain/entities/sales_report_item.dart';
import 'package:savvy_pos/features/reports/domain/entities/stock_ledger_item.dart';

abstract class IReportRepository {
  Future<List<SalesReportItem>> getSalesReport(DateTime start, DateTime end);
  Future<List<StockLedgerItem>> getStockLedger(String productUuid);
}
