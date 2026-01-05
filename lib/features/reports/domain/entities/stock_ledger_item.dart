import 'package:freezed_annotation/freezed_annotation.dart';

part 'stock_ledger_item.freezed.dart';

@freezed
class StockLedgerItem with _$StockLedgerItem {
  const factory StockLedgerItem({
    required DateTime date,
    required String type, // 'SALE', 'RESTOCK', 'ADJUSTMENT'
    required double quantityChange,
    required String referenceId, // Order # or PO #
    required double newStockLevel, // Snapshot after movement
  }) = _StockLedgerItem;
}
