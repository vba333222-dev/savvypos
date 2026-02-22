import 'package:freezed_annotation/freezed_annotation.dart';

part 'cash_drawer_entities.freezed.dart';
part 'cash_drawer_entities.g.dart';

enum DrawerState {
  open, // Active or paused
  closed, // Reconciled and closed
}

enum CashEventType {
  cashIn, // Add cash (non-transactional)
  cashOut, // Remove cash (payout, tip out)
  cashDrop, // Drop to safe
  noSale, // Drawer open without transaction
  sale, // Cash received from sale
  refund, // Cash returned for refund
}

@freezed
class CashDrawer with _$CashDrawer {
  const factory CashDrawer({
    required String id,
    required String shiftUuid, // Linked to ShiftSession
    required String employeeUuid,
    required String employeeName,
    required double startingBalance,
    required double currentBalance,
    required double expectedBalance, // Calculated from transactions
    required DrawerState state,
    required DateTime openedAt,
    DateTime? closedAt,
    double? closingBalance, // Actual count at close
    double? variance, // closingBalance - expectedBalance
  }) = _CashDrawer;

  factory CashDrawer.fromJson(Map<String, dynamic> json) =>
      _$CashDrawerFromJson(json);
}

extension CashDrawerX on CashDrawer {
  bool get hasVariance => variance != null && variance!.abs() > 0.01;
  bool get isOverage => variance != null && variance! > 0;
  bool get isShortage => variance != null && variance! < 0;
}

@freezed
class CashEvent with _$CashEvent {
  const factory CashEvent({
    required String id,
    required String drawerUuid,
    required CashEventType type,
    required double amount,
    required String reason, // 'tip_out', 'bank_deposit', 'change', etc.
    String? comment,
    String? performedBy,
    String? orderUuid, // For sale/refund
    required DateTime timestamp,
  }) = _CashEvent;

  factory CashEvent.fromJson(Map<String, dynamic> json) =>
      _$CashEventFromJson(json);
}

@freezed
class CashDrawerSummary with _$CashDrawerSummary {
  const factory CashDrawerSummary({
    required double totalCashIn,
    required double totalCashOut,
    required double totalSales,
    required double totalRefunds,
    required double totalDrops,
    required int noSaleCount,
    required double
        netCash, // starting + sales - refunds + cashIn - cashOut - drops
  }) = _CashDrawerSummary;

  factory CashDrawerSummary.fromJson(Map<String, dynamic> json) =>
      _$CashDrawerSummaryFromJson(json);
}
