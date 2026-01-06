import 'package:savvy_pos/core/database/database.dart';

abstract class IShiftRepository {
  Future<ShiftSessionTableData?> getCurrentShift();
  Future<void> openShift(double startCash, String staffId, String staffName);
  Future<void> closeShift(String shiftUuid, double calculatedEndCash, double actualCash);
  
  Future<void> addCashTransaction(String shiftUuid, String type, double amount, String reason);
  Future<Map<String, double>> getCashTransactionSummary(String shiftUuid);
  
  Future<int> getOpenOrderCount();
  Future<double> getShiftSalesTotal(String shiftUuid);
}
