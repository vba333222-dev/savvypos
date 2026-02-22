import 'package:savvy_pos/features/employees/domain/entities/employee.dart';

/// Repository interface for Employee management with time clock functionality
abstract class IEmployeeRepository {
  // ===================================
  // EMPLOYEE CRUD
  // ===================================

  /// Get all employees with optional filtering
  Future<List<Employee>> getEmployees({
    EmploymentStatus? status,
    EmployeeRole? role,
    String? searchQuery,
  });

  /// Get a single employee by UUID
  Future<Employee?> getEmployee(String uuid);

  /// Get employee by PIN for login
  Future<Employee?> getEmployeeByPin(String pin);

  /// Create a new employee
  Future<Employee> createEmployee(Employee employee);

  /// Update an existing employee
  Future<void> updateEmployee(Employee employee);

  /// Deactivate (soft delete) an employee
  Future<void> deactivateEmployee(String uuid);

  // ===================================
  // TIME CLOCK
  // ===================================

  /// Clock in an employee
  Future<TimeEntry> clockIn({
    required String employeeUuid,
    String? shiftUuid,
    String? notes,
  });

  /// Clock out an employee
  Future<TimeEntry> clockOut({
    required String timeEntryUuid,
    double? cashTips,
    double? cardTips,
    String? notes,
  });

  /// Start a break
  Future<void> startBreak(String timeEntryUuid);

  /// End a break
  Future<void> endBreak(String timeEntryUuid);

  /// Get current open time entry for an employee (if clocked in)
  Future<TimeEntry?> getCurrentTimeEntry(String employeeUuid);

  /// Get time entries for a date range
  Future<List<TimeEntry>> getTimeEntries({
    String? employeeUuid,
    DateTime? startDate,
    DateTime? endDate,
    bool? pendingApproval,
  });

  /// Approve a time entry (manager only)
  Future<void> approveTimeEntry(String timeEntryUuid, String approvedBy);

  /// Edit a time entry (corrections)
  Future<void> editTimeEntry(TimeEntry entry);

  // ===================================
  // SCHEDULING
  // ===================================

  /// Get scheduled shifts for a date range
  Future<List<ScheduledShift>> getScheduledShifts({
    String? employeeUuid,
    DateTime? startDate,
    DateTime? endDate,
    bool? isPublished,
  });

  /// Create a scheduled shift
  Future<ScheduledShift> createShift(ScheduledShift shift);

  /// Update a scheduled shift
  Future<void> updateShift(ScheduledShift shift);

  /// Delete a scheduled shift
  Future<void> deleteShift(String shiftUuid);

  /// Publish schedule (make visible to employees)
  Future<void> publishSchedule(DateTime weekStart);

  /// Request shift swap
  Future<void> requestShiftSwap({
    required String shiftUuid,
    required String requestingEmployeeUuid,
    required String targetEmployeeUuid,
  });

  /// Approve/deny shift swap
  Future<void> resolveShiftSwap({
    required String shiftUuid,
    required bool approved,
    required String resolvedBy,
  });

  // ===================================
  // REPORTS & LABOR ANALYTICS
  // ===================================

  /// Get labor summary for a date range
  Future<List<LaborSummary>> getLaborSummary({
    DateTime? startDate,
    DateTime? endDate,
    String? employeeUuid,
  });

  /// Calculate total labor cost for a period
  Future<double> getTotalLaborCost({
    required DateTime startDate,
    required DateTime endDate,
  });

  /// Get overtime alerts (employees approaching/exceeding thresholds)
  Future<List<Employee>> getOvertimeAlerts({
    required DateTime weekStart,
    double thresholdHours = 40,
  });
}
