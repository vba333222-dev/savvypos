// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employee.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EmployeeImpl _$$EmployeeImplFromJson(Map<String, dynamic> json) =>
    _$EmployeeImpl(
      uuid: json['uuid'] as String,
      name: json['name'] as String,
      pin: json['pin'] as String,
      role: $enumDecode(_$EmployeeRoleEnumMap, json['role']),
      phone: json['phone'] as String?,
      email: json['email'] as String?,
      avatarUrl: json['avatarUrl'] as String?,
      status: $enumDecodeNullable(_$EmploymentStatusEnumMap, json['status']) ??
          EmploymentStatus.active,
      payType: $enumDecodeNullable(_$PayTypeEnumMap, json['payType']) ??
          PayType.hourly,
      hourlyRate: (json['hourlyRate'] as num?)?.toDouble() ?? 0.0,
      salary: (json['salary'] as num?)?.toDouble() ?? 0.0,
      hireDate: json['hireDate'] == null
          ? null
          : DateTime.parse(json['hireDate'] as String),
      terminationDate: json['terminationDate'] == null
          ? null
          : DateTime.parse(json['terminationDate'] as String),
      isClockedIn: json['isClockedIn'] as bool? ?? false,
      lastClockIn: json['lastClockIn'] == null
          ? null
          : DateTime.parse(json['lastClockIn'] as String),
      lastClockOut: json['lastClockOut'] == null
          ? null
          : DateTime.parse(json['lastClockOut'] as String),
      permissions: (json['permissions'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$EmployeeImplToJson(_$EmployeeImpl instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'name': instance.name,
      'pin': instance.pin,
      'role': _$EmployeeRoleEnumMap[instance.role]!,
      'phone': instance.phone,
      'email': instance.email,
      'avatarUrl': instance.avatarUrl,
      'status': _$EmploymentStatusEnumMap[instance.status]!,
      'payType': _$PayTypeEnumMap[instance.payType]!,
      'hourlyRate': instance.hourlyRate,
      'salary': instance.salary,
      'hireDate': instance.hireDate?.toIso8601String(),
      'terminationDate': instance.terminationDate?.toIso8601String(),
      'isClockedIn': instance.isClockedIn,
      'lastClockIn': instance.lastClockIn?.toIso8601String(),
      'lastClockOut': instance.lastClockOut?.toIso8601String(),
      'permissions': instance.permissions,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };

const _$EmployeeRoleEnumMap = {
  EmployeeRole.owner: 'owner',
  EmployeeRole.manager: 'manager',
  EmployeeRole.cashier: 'cashier',
  EmployeeRole.server: 'server',
  EmployeeRole.host: 'host',
  EmployeeRole.bartender: 'bartender',
  EmployeeRole.kitchen: 'kitchen',
};

const _$EmploymentStatusEnumMap = {
  EmploymentStatus.active: 'active',
  EmploymentStatus.inactive: 'inactive',
  EmploymentStatus.terminated: 'terminated',
  EmploymentStatus.onLeave: 'onLeave',
};

const _$PayTypeEnumMap = {
  PayType.hourly: 'hourly',
  PayType.salary: 'salary',
};

_$TimeEntryImpl _$$TimeEntryImplFromJson(Map<String, dynamic> json) =>
    _$TimeEntryImpl(
      uuid: json['uuid'] as String,
      employeeUuid: json['employeeUuid'] as String,
      clockIn: DateTime.parse(json['clockIn'] as String),
      clockOut: json['clockOut'] == null
          ? null
          : DateTime.parse(json['clockOut'] as String),
      breakStart: json['breakStart'] == null
          ? null
          : DateTime.parse(json['breakStart'] as String),
      breakEnd: json['breakEnd'] == null
          ? null
          : DateTime.parse(json['breakEnd'] as String),
      regularHours: (json['regularHours'] as num?)?.toDouble() ?? 0.0,
      overtimeHours: (json['overtimeHours'] as num?)?.toDouble() ?? 0.0,
      breakMinutes: (json['breakMinutes'] as num?)?.toDouble() ?? 0.0,
      cashTips: (json['cashTips'] as num?)?.toDouble() ?? 0.0,
      cardTips: (json['cardTips'] as num?)?.toDouble() ?? 0.0,
      shiftUuid: json['shiftUuid'] as String?,
      notes: json['notes'] as String?,
      isApproved: json['isApproved'] as bool? ?? false,
      approvedBy: json['approvedBy'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$TimeEntryImplToJson(_$TimeEntryImpl instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'employeeUuid': instance.employeeUuid,
      'clockIn': instance.clockIn.toIso8601String(),
      'clockOut': instance.clockOut?.toIso8601String(),
      'breakStart': instance.breakStart?.toIso8601String(),
      'breakEnd': instance.breakEnd?.toIso8601String(),
      'regularHours': instance.regularHours,
      'overtimeHours': instance.overtimeHours,
      'breakMinutes': instance.breakMinutes,
      'cashTips': instance.cashTips,
      'cardTips': instance.cardTips,
      'shiftUuid': instance.shiftUuid,
      'notes': instance.notes,
      'isApproved': instance.isApproved,
      'approvedBy': instance.approvedBy,
      'createdAt': instance.createdAt?.toIso8601String(),
    };

_$ScheduledShiftImpl _$$ScheduledShiftImplFromJson(Map<String, dynamic> json) =>
    _$ScheduledShiftImpl(
      uuid: json['uuid'] as String,
      employeeUuid: json['employeeUuid'] as String,
      date: DateTime.parse(json['date'] as String),
      startTime: DateTime.parse(json['startTime'] as String),
      endTime: DateTime.parse(json['endTime'] as String),
      position: json['position'] as String?,
      notes: json['notes'] as String?,
      isPublished: json['isPublished'] as bool? ?? false,
      isAcknowledged: json['isAcknowledged'] as bool? ?? false,
      swapRequestedWith: json['swapRequestedWith'] as String?,
      isSwapPending: json['isSwapPending'] as bool? ?? false,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$ScheduledShiftImplToJson(
        _$ScheduledShiftImpl instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'employeeUuid': instance.employeeUuid,
      'date': instance.date.toIso8601String(),
      'startTime': instance.startTime.toIso8601String(),
      'endTime': instance.endTime.toIso8601String(),
      'position': instance.position,
      'notes': instance.notes,
      'isPublished': instance.isPublished,
      'isAcknowledged': instance.isAcknowledged,
      'swapRequestedWith': instance.swapRequestedWith,
      'isSwapPending': instance.isSwapPending,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };

_$LaborSummaryImpl _$$LaborSummaryImplFromJson(Map<String, dynamic> json) =>
    _$LaborSummaryImpl(
      employeeUuid: json['employeeUuid'] as String,
      employeeName: json['employeeName'] as String,
      totalHours: (json['totalHours'] as num).toDouble(),
      regularHours: (json['regularHours'] as num).toDouble(),
      overtimeHours: (json['overtimeHours'] as num).toDouble(),
      laborCost: (json['laborCost'] as num).toDouble(),
      tipTotal: (json['tipTotal'] as num).toDouble(),
      shiftsWorked: (json['shiftsWorked'] as num?)?.toInt() ?? 0,
      periodStart: json['periodStart'] == null
          ? null
          : DateTime.parse(json['periodStart'] as String),
      periodEnd: json['periodEnd'] == null
          ? null
          : DateTime.parse(json['periodEnd'] as String),
    );

Map<String, dynamic> _$$LaborSummaryImplToJson(_$LaborSummaryImpl instance) =>
    <String, dynamic>{
      'employeeUuid': instance.employeeUuid,
      'employeeName': instance.employeeName,
      'totalHours': instance.totalHours,
      'regularHours': instance.regularHours,
      'overtimeHours': instance.overtimeHours,
      'laborCost': instance.laborCost,
      'tipTotal': instance.tipTotal,
      'shiftsWorked': instance.shiftsWorked,
      'periodStart': instance.periodStart?.toIso8601String(),
      'periodEnd': instance.periodEnd?.toIso8601String(),
    };
