import 'package:savvy_pos/core/utils/time_helper.dart';
import 'dart:convert';
import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';
import 'package:savvy_pos/core/database/database.dart';
import 'package:savvy_pos/features/employees/domain/entities/employee.dart';
import 'package:savvy_pos/features/employees/domain/repositories/i_employee_repository.dart';
import 'package:uuid/uuid.dart';

@LazySingleton(as: IEmployeeRepository)
class EmployeeRepositoryImpl implements IEmployeeRepository {
  final AppDatabase _db;
  final _uuid = const Uuid();

  EmployeeRepositoryImpl(this._db);

  // ===================================
  // EMPLOYEE CRUD
  // ===================================

  @override
  Future<List<Employee>> getEmployees({
    EmploymentStatus? status,
    EmployeeRole? role,
    String? searchQuery,
  }) async {
    final query = _db.select(_db.employeeTable);

    if (searchQuery != null && searchQuery.isNotEmpty) {
      query.where((t) => t.name.contains(searchQuery));
    }

    if (role != null) {
      query.where((t) => t.role.equals(role.name.toUpperCase()));
    }

    final rows = await query.get();

    // Join with extended table for full data
    final List<Employee> employees = [];
    for (final row in rows) {
      final extended = await (_db.select(_db.employeeExtendedTable)
            ..where((t) => t.employeeUuid.equals(row.uuid)))
          .getSingleOrNull();

      employees.add(_mapToEmployee(row, extended));
    }

    // Filter by status if provided
    if (status != null) {
      return employees.where((e) => e.status == status).toList();
    }

    return employees;
  }

  @override
  Future<Employee?> getEmployee(String uuid) async {
    final row = await (_db.select(_db.employeeTable)
          ..where((t) => t.uuid.equals(uuid)))
        .getSingleOrNull();

    if (row == null) return null;

    final extended = await (_db.select(_db.employeeExtendedTable)
          ..where((t) => t.employeeUuid.equals(uuid)))
        .getSingleOrNull();

    return _mapToEmployee(row, extended);
  }

  @override
  Future<Employee?> getEmployeeByPin(String pin) async {
    final row = await (_db.select(_db.employeeTable)
          ..where((t) => t.pin.equals(pin)))
        .getSingleOrNull();

    if (row == null) return null;

    final extended = await (_db.select(_db.employeeExtendedTable)
          ..where((t) => t.employeeUuid.equals(row.uuid)))
        .getSingleOrNull();

    return _mapToEmployee(row, extended);
  }

  @override
  Future<Employee> createEmployee(Employee employee) async {
    final uuid = employee.uuid.isEmpty ? _uuid.v4() : employee.uuid;
    final now = TimeHelper.now();

    // Insert into main employee table
    await _db.into(_db.employeeTable).insert(EmployeeTableCompanion(
          uuid: Value(uuid),
          name: Value(employee.name),
          pin: Value(employee.pin),
          role: Value(employee.role.name.toUpperCase()),
          isActive: Value(employee.status == EmploymentStatus.active),
          createdAt: Value(now),
          updatedAt: Value(now),
        ));

    // Insert into extended table
    await _db
        .into(_db.employeeExtendedTable)
        .insert(EmployeeExtendedTableCompanion(
          employeeUuid: Value(uuid),
          hourlyRate: Value(employee.hourlyRate),
          salary: Value(employee.salary),
          payType: Value(employee.payType.name),
          employmentStatus: Value(employee.status.name),
          phone: Value(employee.phone),
          email: Value(employee.email),
          avatarUrl: Value(employee.avatarUrl),
          hireDate: Value(employee.hireDate),
          permissionsJson: Value(jsonEncode(employee.permissions)),
          updatedAt: Value(now),
        ));

    return employee.copyWith(uuid: uuid, createdAt: now, updatedAt: now);
  }

  @override
  Future<void> updateEmployee(Employee employee) async {
    final now = TimeHelper.now();

    await (_db.update(_db.employeeTable)
          ..where((t) => t.uuid.equals(employee.uuid)))
        .write(EmployeeTableCompanion(
      name: Value(employee.name),
      role: Value(employee.role.name.toUpperCase()),
      isActive: Value(employee.status == EmploymentStatus.active),
      updatedAt: Value(now),
    ));

    await (_db.update(_db.employeeExtendedTable)
          ..where((t) => t.employeeUuid.equals(employee.uuid)))
        .write(EmployeeExtendedTableCompanion(
      hourlyRate: Value(employee.hourlyRate),
      salary: Value(employee.salary),
      payType: Value(employee.payType.name),
      employmentStatus: Value(employee.status.name),
      phone: Value(employee.phone),
      email: Value(employee.email),
      avatarUrl: Value(employee.avatarUrl),
      hireDate: Value(employee.hireDate),
      terminationDate: Value(employee.terminationDate),
      permissionsJson: Value(jsonEncode(employee.permissions)),
      updatedAt: Value(now),
    ));
  }

  @override
  Future<void> deactivateEmployee(String uuid) async {
    final now = TimeHelper.now();

    await (_db.update(_db.employeeTable)..where((t) => t.uuid.equals(uuid)))
        .write(EmployeeTableCompanion(
      isActive: const Value(false),
      updatedAt: Value(now),
    ));

    await (_db.update(_db.employeeExtendedTable)
          ..where((t) => t.employeeUuid.equals(uuid)))
        .write(EmployeeExtendedTableCompanion(
      employmentStatus: Value(EmploymentStatus.terminated.name),
      terminationDate: Value(now),
      updatedAt: Value(now),
    ));
  }

  // ===================================
  // TIME CLOCK
  // ===================================

  @override
  Future<TimeEntry> clockIn({
    required String employeeUuid,
    String? shiftUuid,
    String? notes,
  }) async {
    final uuid = _uuid.v4();
    final now = TimeHelper.now();

    await _db.into(_db.timeEntryTable).insert(TimeEntryTableCompanion(
          uuid: Value(uuid),
          employeeUuid: Value(employeeUuid),
          clockIn: Value(now),
          shiftUuid: Value(shiftUuid),
          notes: Value(notes),
          createdAt: Value(now),
        ));

    return TimeEntry(
      uuid: uuid,
      employeeUuid: employeeUuid,
      clockIn: now,
      shiftUuid: shiftUuid,
      notes: notes,
      createdAt: now,
    );
  }

  @override
  Future<TimeEntry> clockOut({
    required String timeEntryUuid,
    double? cashTips,
    double? cardTips,
    String? notes,
  }) async {
    final now = TimeHelper.now();

    // Get entry to calculate hours
    final entry = await (_db.select(_db.timeEntryTable)
          ..where((t) => t.uuid.equals(timeEntryUuid)))
        .getSingle();

    // Calculate hours
    final workedMinutes = now.difference(entry.clockIn).inMinutes;
    final breakMins = entry.breakMinutes;
    final netMinutes = workedMinutes - breakMins;
    final regularHours = (netMinutes / 60).clamp(0.0, 8.0).toDouble();
    final overtimeHours = netMinutes / 60 > 8 ? (netMinutes / 60) - 8 : 0.0;

    await (_db.update(_db.timeEntryTable)
          ..where((t) => t.uuid.equals(timeEntryUuid)))
        .write(TimeEntryTableCompanion(
      clockOut: Value(now),
      regularHours: Value(regularHours),
      overtimeHours: Value(overtimeHours),
      cashTips: Value(cashTips ?? 0),
      cardTips: Value(cardTips ?? 0),
      notes: Value(notes ?? entry.notes),
    ));

    return TimeEntry(
      uuid: timeEntryUuid,
      employeeUuid: entry.employeeUuid,
      clockIn: entry.clockIn,
      clockOut: now,
      regularHours: regularHours.toDouble(),
      overtimeHours: overtimeHours.toDouble(),
      cashTips: cashTips ?? 0,
      cardTips: cardTips ?? 0,
      createdAt: entry.createdAt,
    );
  }

  @override
  Future<void> startBreak(String timeEntryUuid) async {
    await (_db.update(_db.timeEntryTable)
          ..where((t) => t.uuid.equals(timeEntryUuid)))
        .write(TimeEntryTableCompanion(
      breakStart: Value(TimeHelper.now()),
    ));
  }

  @override
  Future<void> endBreak(String timeEntryUuid) async {
    final entry = await (_db.select(_db.timeEntryTable)
          ..where((t) => t.uuid.equals(timeEntryUuid)))
        .getSingle();

    if (entry.breakStart != null) {
      final breakMins =
          TimeHelper.now().difference(entry.breakStart!).inMinutes.toDouble();

      await (_db.update(_db.timeEntryTable)
            ..where((t) => t.uuid.equals(timeEntryUuid)))
          .write(TimeEntryTableCompanion(
        breakEnd: Value(TimeHelper.now()),
        breakMinutes: Value(entry.breakMinutes + breakMins),
      ));
    }
  }

  @override
  Future<TimeEntry?> getCurrentTimeEntry(String employeeUuid) async {
    final row = await (_db.select(_db.timeEntryTable)
          ..where(
              (t) => t.employeeUuid.equals(employeeUuid) & t.clockOut.isNull())
          ..orderBy([(t) => OrderingTerm.desc(t.clockIn)])
          ..limit(1))
        .getSingleOrNull();

    if (row == null) return null;
    return _mapToTimeEntry(row);
  }

  @override
  Future<List<TimeEntry>> getTimeEntries({
    String? employeeUuid,
    DateTime? startDate,
    DateTime? endDate,
    bool? pendingApproval,
  }) async {
    final query = _db.select(_db.timeEntryTable);

    if (employeeUuid != null) {
      query.where((t) => t.employeeUuid.equals(employeeUuid));
    }
    if (startDate != null) {
      query.where((t) => t.clockIn.isBiggerOrEqualValue(startDate));
    }
    if (endDate != null) {
      query.where((t) => t.clockIn.isSmallerOrEqualValue(endDate));
    }
    if (pendingApproval == true) {
      query.where((t) => t.isApproved.equals(false) & t.clockOut.isNotNull());
    }

    query.orderBy([(t) => OrderingTerm.desc(t.clockIn)]);

    final rows = await query.get();
    return rows.map(_mapToTimeEntry).toList();
  }

  @override
  Future<void> approveTimeEntry(String timeEntryUuid, String approvedBy) async {
    await (_db.update(_db.timeEntryTable)
          ..where((t) => t.uuid.equals(timeEntryUuid)))
        .write(TimeEntryTableCompanion(
      isApproved: const Value(true),
      approvedBy: Value(approvedBy),
    ));
  }

  @override
  Future<void> editTimeEntry(TimeEntry entry) async {
    await (_db.update(_db.timeEntryTable)
          ..where((t) => t.uuid.equals(entry.uuid)))
        .write(TimeEntryTableCompanion(
      clockIn: Value(entry.clockIn),
      clockOut: Value(entry.clockOut),
      regularHours: Value(entry.regularHours),
      overtimeHours: Value(entry.overtimeHours),
      breakMinutes: Value(entry.breakMinutes),
      cashTips: Value(entry.cashTips),
      cardTips: Value(entry.cardTips),
      notes: Value(entry.notes),
    ));
  }

  // ===================================
  // SCHEDULING
  // ===================================

  @override
  Future<List<ScheduledShift>> getScheduledShifts({
    String? employeeUuid,
    DateTime? startDate,
    DateTime? endDate,
    bool? isPublished,
  }) async {
    final query = _db.select(_db.scheduledShiftTable);

    if (employeeUuid != null) {
      query.where((t) => t.employeeUuid.equals(employeeUuid));
    }
    if (startDate != null) {
      query.where((t) => t.date.isBiggerOrEqualValue(startDate));
    }
    if (endDate != null) {
      query.where((t) => t.date.isSmallerOrEqualValue(endDate));
    }
    if (isPublished != null) {
      query.where((t) => t.isPublished.equals(isPublished));
    }

    query.orderBy([
      (t) => OrderingTerm.asc(t.date),
      (t) => OrderingTerm.asc(t.startTime)
    ]);

    final rows = await query.get();
    return rows.map(_mapToScheduledShift).toList();
  }

  @override
  Future<ScheduledShift> createShift(ScheduledShift shift) async {
    final uuid = shift.uuid.isEmpty ? _uuid.v4() : shift.uuid;
    final now = TimeHelper.now();

    await _db.into(_db.scheduledShiftTable).insert(ScheduledShiftTableCompanion(
          uuid: Value(uuid),
          employeeUuid: Value(shift.employeeUuid),
          date: Value(shift.date),
          startTime: Value(shift.startTime),
          endTime: Value(shift.endTime),
          position: Value(shift.position),
          notes: Value(shift.notes),
          isPublished: Value(shift.isPublished),
          createdAt: Value(now),
          updatedAt: Value(now),
        ));

    return shift.copyWith(uuid: uuid, createdAt: now, updatedAt: now);
  }

  @override
  Future<void> updateShift(ScheduledShift shift) async {
    await (_db.update(_db.scheduledShiftTable)
          ..where((t) => t.uuid.equals(shift.uuid)))
        .write(ScheduledShiftTableCompanion(
      date: Value(shift.date),
      startTime: Value(shift.startTime),
      endTime: Value(shift.endTime),
      position: Value(shift.position),
      notes: Value(shift.notes),
      isPublished: Value(shift.isPublished),
      updatedAt: Value(TimeHelper.now()),
    ));
  }

  @override
  Future<void> deleteShift(String shiftUuid) async {
    await (_db.delete(_db.scheduledShiftTable)
          ..where((t) => t.uuid.equals(shiftUuid)))
        .go();
  }

  @override
  Future<void> publishSchedule(DateTime weekStart) async {
    final weekEnd = weekStart.add(const Duration(days: 7));

    await (_db.update(_db.scheduledShiftTable)
          ..where((t) =>
              t.date.isBiggerOrEqualValue(weekStart) &
              t.date.isSmallerThanValue(weekEnd)))
        .write(const ScheduledShiftTableCompanion(
      isPublished: Value(true),
    ));
  }

  @override
  Future<void> requestShiftSwap({
    required String shiftUuid,
    required String requestingEmployeeUuid,
    required String targetEmployeeUuid,
  }) async {
    await (_db.update(_db.scheduledShiftTable)
          ..where((t) => t.uuid.equals(shiftUuid)))
        .write(ScheduledShiftTableCompanion(
      swapRequestedWith: Value(targetEmployeeUuid),
      isSwapPending: const Value(true),
      updatedAt: Value(TimeHelper.now()),
    ));
  }

  @override
  Future<void> resolveShiftSwap({
    required String shiftUuid,
    required bool approved,
    required String resolvedBy,
  }) async {
    if (approved) {
      // Get the shift
      final shift = await (_db.select(_db.scheduledShiftTable)
            ..where((t) => t.uuid.equals(shiftUuid)))
          .getSingle();

      // Swap the employee
      final targetEmployee = shift.swapRequestedWith;
      if (targetEmployee != null) {
        await (_db.update(_db.scheduledShiftTable)
              ..where((t) => t.uuid.equals(shiftUuid)))
            .write(ScheduledShiftTableCompanion(
          employeeUuid: Value(targetEmployee),
          swapRequestedWith: const Value(null),
          isSwapPending: const Value(false),
          updatedAt: Value(TimeHelper.now()),
        ));
      }
    } else {
      // Reject swap
      await (_db.update(_db.scheduledShiftTable)
            ..where((t) => t.uuid.equals(shiftUuid)))
          .write(ScheduledShiftTableCompanion(
        swapRequestedWith: const Value(null),
        isSwapPending: const Value(false),
        updatedAt: Value(TimeHelper.now()),
      ));
    }
  }

  // ===================================
  // REPORTS & LABOR ANALYTICS
  // ===================================

  @override
  Future<List<LaborSummary>> getLaborSummary({
    DateTime? startDate,
    DateTime? endDate,
    String? employeeUuid,
  }) async {
    final employees = await getEmployees();
    final List<LaborSummary> summaries = [];

    for (final emp in employees) {
      if (employeeUuid != null && emp.uuid != employeeUuid) continue;

      final entries = await getTimeEntries(
        employeeUuid: emp.uuid,
        startDate: startDate,
        endDate: endDate,
      );

      double totalRegular = 0;
      double totalOvertime = 0;
      double totalTips = 0;

      for (final e in entries) {
        totalRegular += e.regularHours;
        totalOvertime += e.overtimeHours;
        totalTips += e.cashTips + e.cardTips;
      }

      final laborCost = (totalRegular * emp.hourlyRate) +
          (totalOvertime * emp.hourlyRate * 1.5);

      summaries.add(LaborSummary(
        employeeUuid: emp.uuid,
        employeeName: emp.name,
        totalHours: totalRegular + totalOvertime,
        regularHours: totalRegular,
        overtimeHours: totalOvertime,
        laborCost: laborCost,
        tipTotal: totalTips,
        shiftsWorked: entries.where((e) => e.clockOut != null).length,
        periodStart: startDate,
        periodEnd: endDate,
      ));
    }

    return summaries;
  }

  @override
  Future<double> getTotalLaborCost({
    required DateTime startDate,
    required DateTime endDate,
  }) async {
    final summaries =
        await getLaborSummary(startDate: startDate, endDate: endDate);
    return summaries.fold<double>(0.0, (sum, s) => sum + s.laborCost);
  }

  @override
  Future<List<Employee>> getOvertimeAlerts({
    required DateTime weekStart,
    double thresholdHours = 40,
  }) async {
    final weekEnd = weekStart.add(const Duration(days: 7));
    final summaries =
        await getLaborSummary(startDate: weekStart, endDate: weekEnd);
    final employees = await getEmployees();

    final List<Employee> alerts = [];
    for (final summary in summaries) {
      if (summary.totalHours >= thresholdHours * 0.9) {
        // 90% of threshold
        final emp = employees.firstWhere((e) => e.uuid == summary.employeeUuid);
        alerts.add(emp);
      }
    }

    return alerts;
  }

  // ===================================
  // MAPPERS
  // ===================================

  Employee _mapToEmployee(
      EmployeeTableData row, EmployeeExtendedTableData? extended) {
    return Employee(
      uuid: row.uuid,
      name: row.name,
      pin: row.pin,
      role: EmployeeRole.values.firstWhere(
        (e) => e.name.toUpperCase() == row.role.toUpperCase(),
        orElse: () => EmployeeRole.cashier,
      ),
      status: extended != null
          ? EmploymentStatus.values.firstWhere(
              (e) => e.name == extended.employmentStatus,
              orElse: () => row.isActive
                  ? EmploymentStatus.active
                  : EmploymentStatus.inactive,
            )
          : (row.isActive
              ? EmploymentStatus.active
              : EmploymentStatus.inactive),
      hourlyRate: extended?.hourlyRate ?? 0,
      salary: extended?.salary ?? 0,
      payType: extended != null
          ? PayType.values.firstWhere((e) => e.name == extended.payType,
              orElse: () => PayType.hourly)
          : PayType.hourly,
      phone: extended?.phone,
      email: extended?.email,
      avatarUrl: extended?.avatarUrl,
      hireDate: extended?.hireDate,
      terminationDate: extended?.terminationDate,
      permissions: extended?.permissionsJson != null
          ? List<String>.from(jsonDecode(extended!.permissionsJson))
          : [],
      createdAt: row.createdAt,
      updatedAt: row.updatedAt,
    );
  }

  TimeEntry _mapToTimeEntry(TimeEntryTableData row) {
    return TimeEntry(
      uuid: row.uuid,
      employeeUuid: row.employeeUuid,
      clockIn: row.clockIn,
      clockOut: row.clockOut,
      breakStart: row.breakStart,
      breakEnd: row.breakEnd,
      regularHours: row.regularHours,
      overtimeHours: row.overtimeHours,
      breakMinutes: row.breakMinutes,
      cashTips: row.cashTips,
      cardTips: row.cardTips,
      shiftUuid: row.shiftUuid,
      notes: row.notes,
      isApproved: row.isApproved,
      approvedBy: row.approvedBy,
      createdAt: row.createdAt,
    );
  }

  ScheduledShift _mapToScheduledShift(ScheduledShiftTableData row) {
    return ScheduledShift(
      uuid: row.uuid,
      employeeUuid: row.employeeUuid,
      date: row.date,
      startTime: row.startTime,
      endTime: row.endTime,
      position: row.position,
      notes: row.notes,
      isPublished: row.isPublished,
      isAcknowledged: row.isAcknowledged,
      swapRequestedWith: row.swapRequestedWith,
      isSwapPending: row.isSwapPending,
      createdAt: row.createdAt,
      updatedAt: row.updatedAt,
    );
  }
}
