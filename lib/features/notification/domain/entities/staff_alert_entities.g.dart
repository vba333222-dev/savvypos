// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'staff_alert_entities.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StaffAlertImpl _$$StaffAlertImplFromJson(Map<String, dynamic> json) =>
    _$StaffAlertImpl(
      uuid: json['uuid'] as String,
      type: $enumDecode(_$AlertTypeEnumMap, json['type']),
      priority: $enumDecode(_$AlertPriorityEnumMap, json['priority']),
      title: json['title'] as String,
      message: json['message'] as String,
      status: $enumDecodeNullable(_$AlertStatusEnumMap, json['status']) ??
          AlertStatus.active,
      targetRoles: (json['targetRoles'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      targetUserUuids: (json['targetUserUuids'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      broadcastToAll: json['broadcastToAll'] as bool? ?? true,
      relatedOrderUuid: json['relatedOrderUuid'] as String?,
      relatedTableUuid: json['relatedTableUuid'] as String?,
      relatedCustomerUuid: json['relatedCustomerUuid'] as String?,
      actionLabel: json['actionLabel'] as String?,
      actionRoute: json['actionRoute'] as String?,
      createdAt: DateTime.parse(json['createdAt'] as String),
      expiresAt: json['expiresAt'] == null
          ? null
          : DateTime.parse(json['expiresAt'] as String),
      acknowledgedAt: json['acknowledgedAt'] == null
          ? null
          : DateTime.parse(json['acknowledgedAt'] as String),
      acknowledgedByUuid: json['acknowledgedByUuid'] as String?,
      resolvedAt: json['resolvedAt'] == null
          ? null
          : DateTime.parse(json['resolvedAt'] as String),
      resolvedByUuid: json['resolvedByUuid'] as String?,
      playSound: json['playSound'] as bool? ?? true,
      vibrate: json['vibrate'] as bool? ?? true,
    );

Map<String, dynamic> _$$StaffAlertImplToJson(_$StaffAlertImpl instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'type': _$AlertTypeEnumMap[instance.type]!,
      'priority': _$AlertPriorityEnumMap[instance.priority]!,
      'title': instance.title,
      'message': instance.message,
      'status': _$AlertStatusEnumMap[instance.status]!,
      'targetRoles': instance.targetRoles,
      'targetUserUuids': instance.targetUserUuids,
      'broadcastToAll': instance.broadcastToAll,
      'relatedOrderUuid': instance.relatedOrderUuid,
      'relatedTableUuid': instance.relatedTableUuid,
      'relatedCustomerUuid': instance.relatedCustomerUuid,
      'actionLabel': instance.actionLabel,
      'actionRoute': instance.actionRoute,
      'createdAt': instance.createdAt.toIso8601String(),
      'expiresAt': instance.expiresAt?.toIso8601String(),
      'acknowledgedAt': instance.acknowledgedAt?.toIso8601String(),
      'acknowledgedByUuid': instance.acknowledgedByUuid,
      'resolvedAt': instance.resolvedAt?.toIso8601String(),
      'resolvedByUuid': instance.resolvedByUuid,
      'playSound': instance.playSound,
      'vibrate': instance.vibrate,
    };

const _$AlertTypeEnumMap = {
  AlertType.tableReady: 'tableReady',
  AlertType.orderReady: 'orderReady',
  AlertType.kitchenAlert: 'kitchenAlert',
  AlertType.lowStock: 'lowStock',
  AlertType.paymentIssue: 'paymentIssue',
  AlertType.customerRequest: 'customerRequest',
  AlertType.staffMessage: 'staffMessage',
  AlertType.systemAlert: 'systemAlert',
};

const _$AlertPriorityEnumMap = {
  AlertPriority.low: 'low',
  AlertPriority.medium: 'medium',
  AlertPriority.high: 'high',
  AlertPriority.critical: 'critical',
};

const _$AlertStatusEnumMap = {
  AlertStatus.active: 'active',
  AlertStatus.acknowledged: 'acknowledged',
  AlertStatus.resolved: 'resolved',
  AlertStatus.expired: 'expired',
};

_$AlertTemplateImpl _$$AlertTemplateImplFromJson(Map<String, dynamic> json) =>
    _$AlertTemplateImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      type: $enumDecode(_$AlertTypeEnumMap, json['type']),
      priority: $enumDecode(_$AlertPriorityEnumMap, json['priority']),
      messageTemplate: json['messageTemplate'] as String,
    );

Map<String, dynamic> _$$AlertTemplateImplToJson(_$AlertTemplateImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'type': _$AlertTypeEnumMap[instance.type]!,
      'priority': _$AlertPriorityEnumMap[instance.priority]!,
      'messageTemplate': instance.messageTemplate,
    };
