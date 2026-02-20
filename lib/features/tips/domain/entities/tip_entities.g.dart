// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tip_entities.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TipImpl _$$TipImplFromJson(Map<String, dynamic> json) => _$TipImpl(
      uuid: json['uuid'] as String,
      orderUuid: json['orderUuid'] as String,
      orderNumber: json['orderNumber'] as String,
      type: $enumDecode(_$TipTypeEnumMap, json['type']),
      amount: (json['amount'] as num).toDouble(),
      processedByUuid: json['processedByUuid'] as String,
      processedByName: json['processedByName'] as String,
      isPooled: json['isPooled'] as bool? ?? false,
      poolUuid: json['poolUuid'] as String?,
      notes: json['notes'] as String?,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$TipImplToJson(_$TipImpl instance) => <String, dynamic>{
      'uuid': instance.uuid,
      'orderUuid': instance.orderUuid,
      'orderNumber': instance.orderNumber,
      'type': _$TipTypeEnumMap[instance.type]!,
      'amount': instance.amount,
      'processedByUuid': instance.processedByUuid,
      'processedByName': instance.processedByName,
      'isPooled': instance.isPooled,
      'poolUuid': instance.poolUuid,
      'notes': instance.notes,
      'createdAt': instance.createdAt.toIso8601String(),
    };

const _$TipTypeEnumMap = {
  TipType.cash: 'cash',
  TipType.card: 'card',
  TipType.split: 'split',
};

_$TipPoolImpl _$$TipPoolImplFromJson(Map<String, dynamic> json) =>
    _$TipPoolImpl(
      uuid: json['uuid'] as String,
      name: json['name'] as String,
      method: $enumDecodeNullable(_$TipPoolMethodEnumMap, json['method']) ??
          TipPoolMethod.equal,
      isActive: json['isActive'] as bool? ?? true,
      rolePercentages: (json['rolePercentages'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(k, (e as num).toInt()),
          ) ??
          const {},
      rolePoints: (json['rolePoints'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(k, (e as num).toDouble()),
          ) ??
          const {},
      excludedRoles: (json['excludedRoles'] as List<dynamic>?)
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

Map<String, dynamic> _$$TipPoolImplToJson(_$TipPoolImpl instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'name': instance.name,
      'method': _$TipPoolMethodEnumMap[instance.method]!,
      'isActive': instance.isActive,
      'rolePercentages': instance.rolePercentages,
      'rolePoints': instance.rolePoints,
      'excludedRoles': instance.excludedRoles,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };

const _$TipPoolMethodEnumMap = {
  TipPoolMethod.equal: 'equal',
  TipPoolMethod.hoursWorked: 'hoursWorked',
  TipPoolMethod.points: 'points',
  TipPoolMethod.percentage: 'percentage',
};

_$TipDistributionImpl _$$TipDistributionImplFromJson(
        Map<String, dynamic> json) =>
    _$TipDistributionImpl(
      uuid: json['uuid'] as String,
      tipUuid: json['tipUuid'] as String,
      employeeUuid: json['employeeUuid'] as String,
      employeeName: json['employeeName'] as String,
      employeeRole: json['employeeRole'] as String,
      amount: (json['amount'] as num).toDouble(),
      percentage: (json['percentage'] as num).toDouble(),
      hoursWorked: (json['hoursWorked'] as num?)?.toDouble(),
      pointsEarned: (json['pointsEarned'] as num?)?.toDouble(),
      isPaidOut: json['isPaidOut'] as bool? ?? false,
      paidOutAt: json['paidOutAt'] == null
          ? null
          : DateTime.parse(json['paidOutAt'] as String),
      paidOutByUuid: json['paidOutByUuid'] as String?,
      distributedAt: DateTime.parse(json['distributedAt'] as String),
    );

Map<String, dynamic> _$$TipDistributionImplToJson(
        _$TipDistributionImpl instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'tipUuid': instance.tipUuid,
      'employeeUuid': instance.employeeUuid,
      'employeeName': instance.employeeName,
      'employeeRole': instance.employeeRole,
      'amount': instance.amount,
      'percentage': instance.percentage,
      'hoursWorked': instance.hoursWorked,
      'pointsEarned': instance.pointsEarned,
      'isPaidOut': instance.isPaidOut,
      'paidOutAt': instance.paidOutAt?.toIso8601String(),
      'paidOutByUuid': instance.paidOutByUuid,
      'distributedAt': instance.distributedAt.toIso8601String(),
    };

_$TipReportImpl _$$TipReportImplFromJson(Map<String, dynamic> json) =>
    _$TipReportImpl(
      totalTips: (json['totalTips'] as num).toDouble(),
      cashTips: (json['cashTips'] as num).toDouble(),
      cardTips: (json['cardTips'] as num).toDouble(),
      tipCount: (json['tipCount'] as num).toInt(),
      averageTip: (json['averageTip'] as num).toDouble(),
      averageTipPercentage: (json['averageTipPercentage'] as num).toDouble(),
      employeeSummaries: (json['employeeSummaries'] as List<dynamic>?)
              ?.map(
                  (e) => TipEmployeeSummary.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      periodStart: json['periodStart'] == null
          ? null
          : DateTime.parse(json['periodStart'] as String),
      periodEnd: json['periodEnd'] == null
          ? null
          : DateTime.parse(json['periodEnd'] as String),
    );

Map<String, dynamic> _$$TipReportImplToJson(_$TipReportImpl instance) =>
    <String, dynamic>{
      'totalTips': instance.totalTips,
      'cashTips': instance.cashTips,
      'cardTips': instance.cardTips,
      'tipCount': instance.tipCount,
      'averageTip': instance.averageTip,
      'averageTipPercentage': instance.averageTipPercentage,
      'employeeSummaries': instance.employeeSummaries,
      'periodStart': instance.periodStart?.toIso8601String(),
      'periodEnd': instance.periodEnd?.toIso8601String(),
    };

_$TipEmployeeSummaryImpl _$$TipEmployeeSummaryImplFromJson(
        Map<String, dynamic> json) =>
    _$TipEmployeeSummaryImpl(
      employeeUuid: json['employeeUuid'] as String,
      employeeName: json['employeeName'] as String,
      role: json['role'] as String,
      totalTips: (json['totalTips'] as num).toDouble(),
      ordersServed: (json['ordersServed'] as num).toInt(),
      averageTipPerOrder: (json['averageTipPerOrder'] as num).toDouble(),
      hoursWorked: (json['hoursWorked'] as num).toDouble(),
      tipsPerHour: (json['tipsPerHour'] as num).toDouble(),
    );

Map<String, dynamic> _$$TipEmployeeSummaryImplToJson(
        _$TipEmployeeSummaryImpl instance) =>
    <String, dynamic>{
      'employeeUuid': instance.employeeUuid,
      'employeeName': instance.employeeName,
      'role': instance.role,
      'totalTips': instance.totalTips,
      'ordersServed': instance.ordersServed,
      'averageTipPerOrder': instance.averageTipPerOrder,
      'hoursWorked': instance.hoursWorked,
      'tipsPerHour': instance.tipsPerHour,
    };
