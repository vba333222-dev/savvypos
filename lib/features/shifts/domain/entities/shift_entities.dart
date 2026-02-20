import 'package:freezed_annotation/freezed_annotation.dart';

part 'shift_entities.freezed.dart';
part 'shift_entities.g.dart';

enum ShiftStatus {
  active,     // Currently clocked in
  completed,  // Clocked out normally
  autoEnded,  // System ended shift (forgot to clock out)
}

@freezed
class ShiftSession with _$ShiftSession {
  const factory ShiftSession({
    required String id,
    required String employeeUuid,
    required String employeeName,
    required DateTime startTime,
    DateTime? endTime,
    @Default(0) int breakMinutes,
    @Default(0.0) double tipsDeclared,
    @Default(0.0) double startCash,
    @Default(0.0) double expectedCash,
    @Default(0.0) double actualCash,
    @Default(0.0) double difference, // Over/Short
    @Default(ShiftStatus.active) ShiftStatus status,
  }) = _ShiftSession;

  factory ShiftSession.fromJson(Map<String, dynamic> json) => _$ShiftSessionFromJson(json);
}

extension ShiftSessionX on ShiftSession {
  /// Calculate total worked hours (excluding breaks)
  double get workedHours {
    if (endTime == null) {
      // Still active, calculate from now
      final duration = DateTime.now().difference(startTime);
      return (duration.inMinutes - breakMinutes) / 60.0;
    }
    final duration = endTime!.difference(startTime);
    return (duration.inMinutes - breakMinutes) / 60.0;
  }

  /// Check if this shift has overtime (>8 hours)
  bool get hasOvertime => workedHours > 8.0;

  /// Get overtime hours (anything beyond 8 hours)
  double get overtimeHours => workedHours > 8.0 ? workedHours - 8.0 : 0.0;

  /// Get regular hours (capped at 8)
  double get regularHours => workedHours > 8.0 ? 8.0 : workedHours;
}

@freezed
class EmployeeShiftSummary with _$EmployeeShiftSummary {
  const factory EmployeeShiftSummary({
    required String employeeUuid,
    required String employeeName,
    required double totalHours,
    required double regularHours,
    required double overtimeHours,
    required double totalTips,
    required int shiftCount,
  }) = _EmployeeShiftSummary;

  factory EmployeeShiftSummary.fromJson(Map<String, dynamic> json) => _$EmployeeShiftSummaryFromJson(json);
}
