import 'package:savvy_pos/core/database/database.dart';

abstract class IShiftRepository {
  Future<ShiftSessionTableData?> getCurrentShift();
  Future<void> openShift(double startCash, String staffId, String staffName);
  Future<void> closeShift(String shiftUuid, double actualCash);
}
