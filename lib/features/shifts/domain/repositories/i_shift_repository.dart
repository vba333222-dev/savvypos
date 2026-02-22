import 'package:flutter/material.dart';
import 'package:savvy_pos/features/shifts/domain/entities/shift_entities.dart';

abstract class IShiftRepository {
  /// Clock in an employee (start a new shift)
  Future<ShiftSession> clockIn(String employeeUuid, String employeeName);

  /// Clock out an employee (end current shift)
  Future<ShiftSession> clockOut(String employeeUuid,
      {double tipsDeclared = 0.0});

  /// Get the current active shift for an employee (null if not clocked in)
  Future<ShiftSession?> getCurrentShift(String employeeUuid);

  /// Get all currently active shifts (for manager overview)
  Future<List<ShiftSession>> getActiveShifts();

  /// Get shift history for an employee within a date range
  Future<List<ShiftSession>> getShiftHistory(
      String employeeUuid, DateTimeRange range);

  /// Get summary of hours worked for an employee in a date range
  Future<EmployeeShiftSummary> getEmployeeSummary(
      String employeeUuid, DateTimeRange range);

  /// Start a break for current shift
  Future<void> startBreak(String shiftId);

  /// End a break for current shift
  Future<void> endBreak(String shiftId);

  // Cash Management Methods (Merged from features/shift)
  Future<void> openCashShift(
      double startCash, String staffId, String staffName);
  Future<void> closeShift(
      String shiftUuid, double calculatedEndCash, double actualCash,
      {String? varianceReason});
  Future<void> addCashTransaction(
      String shiftUuid, String type, double amount, String reason);
  Future<Map<String, double>> getCashTransactionSummary(String shiftUuid);
  Future<int> getOpenOrderCount();
  Future<double> getShiftSalesTotal(String shiftUuid);
}
