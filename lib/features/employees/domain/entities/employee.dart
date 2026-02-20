import 'package:freezed_annotation/freezed_annotation.dart';

part 'employee.freezed.dart';
part 'employee.g.dart';

/// Employee role enumeration matching Toast POS 2025 standards
enum EmployeeRole {
  owner,
  manager,
  cashier,
  server,
  host,
  bartender,
  kitchen;
  
  String get displayName {
    switch (this) {
      case EmployeeRole.owner: return 'Owner';
      case EmployeeRole.manager: return 'Manager';
      case EmployeeRole.cashier: return 'Cashier';
      case EmployeeRole.server: return 'Server';
      case EmployeeRole.host: return 'Host';
      case EmployeeRole.bartender: return 'Bartender';
      case EmployeeRole.kitchen: return 'Kitchen Staff';
    }
  }
  
  /// Check if role has management permissions
  bool get isManager => this == EmployeeRole.owner || this == EmployeeRole.manager;
}

/// Employment status
enum EmploymentStatus { active, inactive, terminated, onLeave }

/// Pay type
enum PayType { hourly, salary }

/// Comprehensive Employee entity with scheduling and time clock support
@freezed
class Employee with _$Employee {
  const factory Employee({
    required String uuid,
    required String name,
    required String pin, // Hashed for security
    required EmployeeRole role,
    String? phone,
    String? email,
    String? avatarUrl,
    
    // Employment details
    @Default(EmploymentStatus.active) EmploymentStatus status,
    @Default(PayType.hourly) PayType payType,
    @Default(0.0) double hourlyRate,
    @Default(0.0) double salary,
    DateTime? hireDate,
    DateTime? terminationDate,
    
    // Time & Attendance
    @Default(false) bool isClockedIn,
    DateTime? lastClockIn,
    DateTime? lastClockOut,
    
    // Permissions (for RBAC)
    @Default([]) List<String> permissions,
    
    // Metadata
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _Employee;
  
  factory Employee.fromJson(Map<String, dynamic> json) => _$EmployeeFromJson(json);
}

/// Time Entry for tracking work hours
@freezed
class TimeEntry with _$TimeEntry {
  const factory TimeEntry({
    required String uuid,
    required String employeeUuid,
    required DateTime clockIn,
    DateTime? clockOut,
    DateTime? breakStart,
    DateTime? breakEnd,
    
    // Calculated (can be computed or stored)
    @Default(0.0) double regularHours,
    @Default(0.0) double overtimeHours,
    @Default(0.0) double breakMinutes,
    
    // Tips for the shift
    @Default(0.0) double cashTips,
    @Default(0.0) double cardTips,
    
    String? shiftUuid, // Link to shift session if applicable
    String? notes,
    
    // Auto-approved or needs manager review
    @Default(false) bool isApproved,
    String? approvedBy,
    
    DateTime? createdAt,
  }) = _TimeEntry;
  
  factory TimeEntry.fromJson(Map<String, dynamic> json) => _$TimeEntryFromJson(json);
  
  const TimeEntry._();
  
  /// Calculate total worked hours
  double get totalHours => regularHours + overtimeHours;
  
  /// Check if entry is open (still clocked in)
  bool get isOpen => clockOut == null;
  
  /// Calculate break duration in minutes
  double get calculatedBreakMinutes {
    if (breakStart == null || breakEnd == null) return 0;
    return breakEnd!.difference(breakStart!).inMinutes.toDouble();
  }
}

/// Scheduled Shift for weekly/monthly scheduling
@freezed
class ScheduledShift with _$ScheduledShift {
  const factory ScheduledShift({
    required String uuid,
    required String employeeUuid,
    required DateTime date,
    required DateTime startTime,
    required DateTime endTime,
    
    String? position, // e.g., "Cashier", "Bar", "Floor"
    String? notes,
    
    @Default(false) bool isPublished,
    @Default(false) bool isAcknowledged,
    
    // Swap request
    String? swapRequestedWith, // Another employee's UUID
    @Default(false) bool isSwapPending,
    
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _ScheduledShift;
  
  factory ScheduledShift.fromJson(Map<String, dynamic> json) => _$ScheduledShiftFromJson(json);
  
  const ScheduledShift._();
  
  /// Calculate scheduled hours
  double get scheduledHours => endTime.difference(startTime).inMinutes / 60.0;
}

/// Labor Summary for reporting
@freezed
class LaborSummary with _$LaborSummary {
  const factory LaborSummary({
    required String employeeUuid,
    required String employeeName,
    required double totalHours,
    required double regularHours,
    required double overtimeHours,
    required double laborCost,
    required double tipTotal,
    @Default(0) int shiftsWorked,
    DateTime? periodStart,
    DateTime? periodEnd,
  }) = _LaborSummary;
  
  factory LaborSummary.fromJson(Map<String, dynamic> json) => _$LaborSummaryFromJson(json);
}
