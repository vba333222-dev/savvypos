import 'package:savvy_pos/core/utils/time_helper.dart';
import 'package:drift/drift.dart';
import 'package:flutter/material.dart' show DateTimeRange;
import 'package:savvy_pos/core/database/database.dart';
import 'package:savvy_pos/features/shifts/domain/entities/shift_entities.dart';
import 'package:savvy_pos/features/shifts/domain/repositories/i_shift_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:uuid/uuid.dart';

@LazySingleton(as: IShiftRepository)
class ShiftRepositoryImpl implements IShiftRepository {
  final AppDatabase db;

  ShiftRepositoryImpl(this.db);

  ShiftSession _mapToEntity(ShiftSessionTableData row) {
    return ShiftSession(
      id: row.uuid,
      employeeUuid: row.staffId,
      employeeName: row.staffName,
      startTime: row.startShift,
      endTime: row.endShift,
      breakMinutes: 0, // Not tracked in current schema
      tipsDeclared: 0.0, // Not tracked in current schema
      status: row.isClosed ? ShiftStatus.completed : ShiftStatus.active,
    );
  }

  @override
  Future<ShiftSession> clockIn(String employeeUuid, String employeeName) async {
    final uuid = const Uuid().v4();
    final now = TimeHelper.now();

    await db.into(db.shiftSessionTable).insert(
          ShiftSessionTableCompanion.insert(
            uuid: uuid,
            staffId: employeeUuid,
            staffName: employeeName,
            startShift: now,
            startCash: 0.0,
            expectedCash: 0.0,
            actualCash: 0.0,
            difference: 0.0,
            isClosed: const Value(false),
            isSynced: const Value(false),
          ),
        );

    return ShiftSession(
      id: uuid,
      employeeUuid: employeeUuid,
      employeeName: employeeName,
      startTime: now,
      status: ShiftStatus.active,
    );
  }

  @override
  Future<ShiftSession> clockOut(String employeeUuid,
      {double tipsDeclared = 0.0}) async {
    final now = TimeHelper.now();

    // Find active shift
    final activeShift = await (db.select(db.shiftSessionTable)
          ..where(
              (t) => t.staffId.equals(employeeUuid) & t.isClosed.equals(false)))
        .getSingleOrNull();

    if (activeShift == null) {
      throw Exception('No active shift found for employee');
    }

    // Update shift to closed
    await (db.update(db.shiftSessionTable)
          ..where((t) => t.uuid.equals(activeShift.uuid)))
        .write(
      ShiftSessionTableCompanion(
        endShift: Value(now),
        isClosed: const Value(true),
      ),
    );

    return ShiftSession(
      id: activeShift.uuid,
      employeeUuid: employeeUuid,
      employeeName: activeShift.staffName,
      startTime: activeShift.startShift,
      endTime: now,
      tipsDeclared: tipsDeclared,
      status: ShiftStatus.completed,
    );
  }

  @override
  Future<ShiftSession?> getCurrentShift(String employeeUuid) async {
    final row = await (db.select(db.shiftSessionTable)
          ..where(
              (t) => t.staffId.equals(employeeUuid) & t.isClosed.equals(false)))
        .getSingleOrNull();

    return row != null ? _mapToEntity(row) : null;
  }

  @override
  Future<List<ShiftSession>> getActiveShifts() async {
    final rows = await (db.select(db.shiftSessionTable)
          ..where((t) => t.isClosed.equals(false))
          ..orderBy([(t) => OrderingTerm.asc(t.startShift)]))
        .get();

    return rows.map(_mapToEntity).toList();
  }

  @override
  Future<List<ShiftSession>> getShiftHistory(
      String employeeUuid, DateTimeRange range) async {
    final rows = await (db.select(db.shiftSessionTable)
          ..where((t) =>
              t.staffId.equals(employeeUuid) &
              t.startShift.isBiggerOrEqualValue(range.start) &
              t.startShift.isSmallerOrEqualValue(range.end))
          ..orderBy([(t) => OrderingTerm.desc(t.startShift)]))
        .get();

    return rows.map(_mapToEntity).toList();
  }

  @override
  Future<EmployeeShiftSummary> getEmployeeSummary(
      String employeeUuid, DateTimeRange range) async {
    final shifts = await getShiftHistory(employeeUuid, range);

    double totalHours = 0;
    double regularHours = 0;
    double overtimeHours = 0;
    double totalTips = 0;

    for (final shift in shifts) {
      totalHours += shift.workedHours;
      regularHours += shift.regularHours;
      overtimeHours += shift.overtimeHours;
      totalTips += shift.tipsDeclared;
    }

    final employeeName =
        shifts.isNotEmpty ? shifts.first.employeeName : 'Unknown';

    return EmployeeShiftSummary(
      employeeUuid: employeeUuid,
      employeeName: employeeName,
      totalHours: totalHours,
      regularHours: regularHours,
      overtimeHours: overtimeHours,
      totalTips: totalTips,
      shiftCount: shifts.length,
    );
  }

  @override
  Future<void> startBreak(String shiftId) async {
    // Break tracking not implemented in current schema
    // Would require adding breakStartTime column or separate BreakTable
  }

  @override
  Future<void> endBreak(String shiftId) async {
    // Break tracking not implemented in current schema
  }

  // --- Cash Management Implementation ---

  @override
  Future<void> openCashShift(
      double startCash, String staffId, String staffName) async {
    final now = TimeHelper.now();
    await db
        .into(db.shiftSessionTable)
        .insert(ShiftSessionTableCompanion.insert(
          uuid: const Uuid().v4(),
          startShift: now,
          startCash: startCash,
          isClosed: const Value(false),
          staffId: staffId,
          staffName: staffName,
          expectedCash: 0.0,
          actualCash: 0.0,
          difference: 0.0,
        ));
  }

  @override
  Future<void> closeShift(
      String shiftUuid, double calculatedEndCash, double actualCash,
      {String? varianceReason}) async {
    final now = TimeHelper.now();
    await (db.update(db.shiftSessionTable)
          ..where((t) => t.uuid.equals(shiftUuid)))
        .write(
      ShiftSessionTableCompanion(
        endShift: Value(now),
        expectedCash: Value(calculatedEndCash),
        actualCash: Value(actualCash),
        difference: Value(actualCash - calculatedEndCash),
        varianceReason: Value(varianceReason),
        isClosed: const Value(true),
      ),
    );
  }

  @override
  Future<int> getOpenOrderCount() async {
    final results = await (db.select(db.orderTable)
          ..where((t) => t.status.equals('OPEN')))
        .get();
    return results.length;
  }

  @override
  Future<double> getShiftSalesTotal(String shiftUuid) async {
    final shift = await (db.select(db.shiftSessionTable)
          ..where((t) => t.uuid.equals(shiftUuid)))
        .getSingleOrNull();
    if (shift == null) return 0.0;

    // Sum all COMPLETED orders created after shift start
    final orders = await (db.select(db.orderTable)
          ..where(
              (t) => t.transactionDate.isBiggerOrEqualValue(shift.startShift))
          ..where((t) => t.status.equals('COMPLETED')))
        .get();

    double total = 0.0;
    for (var o in orders) {
      total += o.grandTotal;
    }
    return total;
  }

  @override
  Future<void> addCashTransaction(
      String shiftUuid, String type, double amount, String reason) async {
    final now = TimeHelper.now();
    // Assuming cashTransactionTable exists in schema as per old repo assumption
    await db
        .into(db.cashTransactionTable)
        .insert(CashTransactionTableCompanion.insert(
          uuid: const Uuid().v4(),
          shiftUuid: Value(shiftUuid),
          type: type,
          amount: amount,
          reason: Value(reason),
          createdAt: now,
        ));
  }

  @override
  Future<Map<String, double>> getCashTransactionSummary(
      String shiftUuid) async {
    final payIns = await (db.select(db.cashTransactionTable)
          ..where(
              (t) => t.shiftUuid.equals(shiftUuid) & t.type.equals('PAY_IN')))
        .get();
    final payOuts = await (db.select(db.cashTransactionTable)
          ..where(
              (t) => t.shiftUuid.equals(shiftUuid) & t.type.equals('PAY_OUT')))
        .get();
    final safeDrops = await (db.select(db.cashTransactionTable)
          ..where((t) =>
              t.shiftUuid.equals(shiftUuid) & t.type.equals('SAFE_DROP')))
        .get();

    double totalIn = payIns.fold(0, (sum, i) => sum + i.amount);
    double totalOut = payOuts.fold(0, (sum, i) => sum + i.amount);
    double totalSafeDrop = safeDrops.fold(0, (sum, i) => sum + i.amount);

    return {'payIn': totalIn, 'payOut': totalOut, 'safeDrop': totalSafeDrop};
  }
}
