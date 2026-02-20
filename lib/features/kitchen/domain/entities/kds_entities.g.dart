// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kds_entities.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$KDSTicketImpl _$$KDSTicketImplFromJson(Map<String, dynamic> json) =>
    _$KDSTicketImpl(
      uuid: json['uuid'] as String,
      orderUuid: json['orderUuid'] as String,
      orderNumber: json['orderNumber'] as String,
      tableUuid: json['tableUuid'] as String?,
      tableName: json['tableName'] as String?,
      serverName: json['serverName'] as String?,
      items: (json['items'] as List<dynamic>?)
              ?.map((e) => KDSItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      status: $enumDecodeNullable(_$KDSTicketStatusEnumMap, json['status']) ??
          KDSTicketStatus.fired,
      firedAt: DateTime.parse(json['firedAt'] as String),
      startedAt: json['startedAt'] == null
          ? null
          : DateTime.parse(json['startedAt'] as String),
      completedAt: json['completedAt'] == null
          ? null
          : DateTime.parse(json['completedAt'] as String),
      targetTime: json['targetTime'] == null
          ? null
          : DateTime.parse(json['targetTime'] as String),
      note: json['note'] as String?,
      isRush: json['isRush'] as bool? ?? false,
    );

Map<String, dynamic> _$$KDSTicketImplToJson(_$KDSTicketImpl instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'orderUuid': instance.orderUuid,
      'orderNumber': instance.orderNumber,
      'tableUuid': instance.tableUuid,
      'tableName': instance.tableName,
      'serverName': instance.serverName,
      'items': instance.items,
      'status': _$KDSTicketStatusEnumMap[instance.status]!,
      'firedAt': instance.firedAt.toIso8601String(),
      'startedAt': instance.startedAt?.toIso8601String(),
      'completedAt': instance.completedAt?.toIso8601String(),
      'targetTime': instance.targetTime?.toIso8601String(),
      'note': instance.note,
      'isRush': instance.isRush,
    };

const _$KDSTicketStatusEnumMap = {
  KDSTicketStatus.fired: 'fired',
  KDSTicketStatus.prep: 'prep',
  KDSTicketStatus.ready: 'ready',
  KDSTicketStatus.served: 'served',
  KDSTicketStatus.voided: 'voided',
};

_$KDSItemImpl _$$KDSItemImplFromJson(Map<String, dynamic> json) =>
    _$KDSItemImpl(
      uuid: json['uuid'] as String,
      ticketUuid: json['ticketUuid'] as String,
      orderItemUuid: json['orderItemUuid'] as String,
      name: json['name'] as String,
      quantity: (json['quantity'] as num).toInt(),
      modifiers: (json['modifiers'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      note: json['note'] as String?,
      course: $enumDecodeNullable(_$KDSCourseEnumMap, json['course']) ??
          KDSCourse.main,
      status: $enumDecodeNullable(_$KDSTicketStatusEnumMap, json['status']) ??
          KDSTicketStatus.fired,
    );

Map<String, dynamic> _$$KDSItemImplToJson(_$KDSItemImpl instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'ticketUuid': instance.ticketUuid,
      'orderItemUuid': instance.orderItemUuid,
      'name': instance.name,
      'quantity': instance.quantity,
      'modifiers': instance.modifiers,
      'note': instance.note,
      'course': _$KDSCourseEnumMap[instance.course]!,
      'status': _$KDSTicketStatusEnumMap[instance.status]!,
    };

const _$KDSCourseEnumMap = {
  KDSCourse.drink: 'drink',
  KDSCourse.appetizer: 'appetizer',
  KDSCourse.main: 'main',
  KDSCourse.dessert: 'dessert',
  KDSCourse.other: 'other',
};

_$KDSExpoSummaryImpl _$$KDSExpoSummaryImplFromJson(Map<String, dynamic> json) =>
    _$KDSExpoSummaryImpl(
      totalActiveTickets: (json['totalActiveTickets'] as num).toInt(),
      itemsInPrep: (json['itemsInPrep'] as num).toInt(),
      itemsReady: (json['itemsReady'] as num).toInt(),
      avgPrepTimeMinutes: (json['avgPrepTimeMinutes'] as num).toDouble(),
      activeItemCounts: Map<String, int>.from(json['activeItemCounts'] as Map),
    );

Map<String, dynamic> _$$KDSExpoSummaryImplToJson(
        _$KDSExpoSummaryImpl instance) =>
    <String, dynamic>{
      'totalActiveTickets': instance.totalActiveTickets,
      'itemsInPrep': instance.itemsInPrep,
      'itemsReady': instance.itemsReady,
      'avgPrepTimeMinutes': instance.avgPrepTimeMinutes,
      'activeItemCounts': instance.activeItemCounts,
    };
