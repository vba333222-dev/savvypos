import 'package:freezed_annotation/freezed_annotation.dart';

part 'sales_report_item.freezed.dart';

@freezed
class SalesReportItem with _$SalesReportItem {
  const factory SalesReportItem({
    required String categoryName,
    required String productName,
    required double quantitySold,
    required double grossSales,
    required double costOfGoodsSold,
    required double grossProfit,
  }) = _SalesReportItem;
}
