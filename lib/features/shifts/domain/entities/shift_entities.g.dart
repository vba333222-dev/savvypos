// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shift_entities.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ShiftSessionImpl _$$ShiftSessionImplFromJson(Map<String, dynamic> json) =>
    _$ShiftSessionImpl(
      id: json['id'] as String,
      employeeUuid: json['employeeUuid'] as String,
      employeeName: json['employeeName'] as String,
      startTime: DateTime.parse(json['startTime'] as String),
      endTime: json['endTime'] == null
          ? null
          : DateTime.parse(json['endTime'] as String),
      breakMinutes: (json['breakMinutes'] as num?)?.toInt() ?? 0,
      tipsDeclared: (json['tipsDeclared'] as num?)?.toDouble() ?? 0.0,
      startCash: (json['startCash'] as num?)?.toDouble() ?? 0.0,
      expectedCash: (json['expectedCash'] as num?)?.toDouble() ?? 0.0,
      actualCash: (json['actualCash'] as num?)?.toDouble() ?? 0.0,
      difference: (json['difference'] as num?)?.toDouble() ?? 0.0,
      status: $enumDecodeNullable(_$ShiftStatusEnumMap, json['status']) ??
          ShiftStatus.active,
    );

Map<String, dynamic> _$$ShiftSessionImplToJson(_$ShiftSessionImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'employeeUuid': instance.employeeUuid,
      'employeeName': instance.employeeName,
      'startTime': instance.startTime.toIso8601String(),
      'endTime': instance.endTime?.toIso8601String(),
      'breakMinutes': instance.breakMinutes,
      'tipsDeclared': instance.tipsDeclared,
      'startCash': instance.startCash,
      'expectedCash': instance.expectedCash,
      'actualCash': instance.actualCash,
      'difference': instance.difference,
      'status': _$ShiftStatusEnumMap[instance.status]!,
    };

const _$ShiftStatusEnumMap = {
  ShiftStatus.active: 'active',
  ShiftStatus.completed: 'completed',
  ShiftStatus.autoEnded: 'autoEnded',
};

_$EmployeeShiftSummaryImpl _$$EmployeeShiftSummaryImplFromJson(
        Map<String, dynamic> json) =>
    _$EmployeeShiftSummaryImpl(
      employeeUuid: json['employeeUuid'] as String,
      employeeName: json['employeeName'] as String,
      totalHours: (json['totalHours'] as num).toDouble(),
      regularHours: (json['regularHours'] as num).toDouble(),
      overtimeHours: (json['overtimeHours'] as num).toDouble(),
      totalTips: (json['totalTips'] as num).toDouble(),
      shiftCount: (json['shiftCount'] as num).toInt(),
    );

Map<String, dynamic> _$$EmployeeShiftSummaryImplToJson(
        _$EmployeeShiftSummaryImpl instance) =>
    <String, dynamic>{
      'employeeUuid': instance.employeeUuid,
      'employeeName': instance.employeeName,
      'totalHours': instance.totalHours,
      'regularHours': instance.regularHours,
      'overtimeHours': instance.overtimeHours,
      'totalTips': instance.totalTips,
      'shiftCount': instance.shiftCount,
    };
