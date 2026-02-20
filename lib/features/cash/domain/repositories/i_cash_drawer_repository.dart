import 'package:savvy_pos/features/cash/domain/entities/cash_drawer_entities.dart';

abstract class ICashDrawerRepository {
  /// Open a new cash drawer for current shift
  Future<CashDrawer> openDrawer(String shiftUuid, String employeeUuid, String employeeName, double startingBalance);

  /// Get current open drawer for a shift
  Future<CashDrawer?> getCurrentDrawer(String shiftUuid);

  /// Record a cash event (in/out/drop/noSale)
  Future<CashEvent> recordEvent(String drawerUuid, CashEventType type, double amount, String reason, {String? comment, String? orderUuid});

  /// Close the drawer with actual counted balance
  Future<CashDrawer> closeDrawer(String drawerUuid, double actualBalance);

  /// Get all events for a drawer
  Future<List<CashEvent>> getDrawerEvents(String drawerUuid);

  /// Get summary for a drawer
  Future<CashDrawerSummary> getDrawerSummary(String drawerUuid);

  /// Get drawer history for a date range
  Future<List<CashDrawer>> getDrawerHistory(DateTime start, DateTime end);

  /// Reopen a closed drawer (for adjustments)
  Future<CashDrawer> reopenDrawer(String drawerUuid);
}
