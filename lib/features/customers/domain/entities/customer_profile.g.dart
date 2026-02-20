// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CustomerProfileImpl _$$CustomerProfileImplFromJson(
        Map<String, dynamic> json) =>
    _$CustomerProfileImpl(
      uuid: json['uuid'] as String,
      name: json['name'] as String,
      email: json['email'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      birthday: json['birthday'] == null
          ? null
          : DateTime.parse(json['birthday'] as String),
      visitCount: (json['visitCount'] as num?)?.toInt() ?? 0,
      totalSpent: (json['totalSpent'] as num?)?.toDouble() ?? 0.0,
      averageOrderValue: (json['averageOrderValue'] as num?)?.toDouble() ?? 0.0,
      firstVisit: json['firstVisit'] == null
          ? null
          : DateTime.parse(json['firstVisit'] as String),
      lastVisit: json['lastVisit'] == null
          ? null
          : DateTime.parse(json['lastVisit'] as String),
      tags:
          (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              const [],
      notes: (json['notes'] as List<dynamic>?)
              ?.map((e) => CustomerNote.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      segment: $enumDecodeNullable(_$CustomerSegmentEnumMap, json['segment']) ??
          CustomerSegment.newGuest,
    );

Map<String, dynamic> _$$CustomerProfileImplToJson(
        _$CustomerProfileImpl instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'name': instance.name,
      'email': instance.email,
      'phoneNumber': instance.phoneNumber,
      'birthday': instance.birthday?.toIso8601String(),
      'visitCount': instance.visitCount,
      'totalSpent': instance.totalSpent,
      'averageOrderValue': instance.averageOrderValue,
      'firstVisit': instance.firstVisit?.toIso8601String(),
      'lastVisit': instance.lastVisit?.toIso8601String(),
      'tags': instance.tags,
      'notes': instance.notes,
      'segment': _$CustomerSegmentEnumMap[instance.segment]!,
    };

const _$CustomerSegmentEnumMap = {
  CustomerSegment.newGuest: 'newGuest',
  CustomerSegment.returning: 'returning',
  CustomerSegment.regular: 'regular',
  CustomerSegment.vip: 'vip',
  CustomerSegment.lapsed: 'lapsed',
};

_$CustomerNoteImpl _$$CustomerNoteImplFromJson(Map<String, dynamic> json) =>
    _$CustomerNoteImpl(
      id: json['id'] as String,
      content: json['content'] as String,
      createdBy: json['createdBy'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      isCritical: json['isCritical'] as bool? ?? false,
    );

Map<String, dynamic> _$$CustomerNoteImplToJson(_$CustomerNoteImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'content': instance.content,
      'createdBy': instance.createdBy,
      'createdAt': instance.createdAt.toIso8601String(),
      'isCritical': instance.isCritical,
    };

_$OrderHistoryItemImpl _$$OrderHistoryItemImplFromJson(
        Map<String, dynamic> json) =>
    _$OrderHistoryItemImpl(
      orderUuid: json['orderUuid'] as String,
      orderDate: DateTime.parse(json['orderDate'] as String),
      total: (json['total'] as num).toDouble(),
      itemCount: (json['itemCount'] as num).toInt(),
      paymentMethod: json['paymentMethod'] as String,
      channel: json['channel'] as String?,
    );

Map<String, dynamic> _$$OrderHistoryItemImplToJson(
        _$OrderHistoryItemImpl instance) =>
    <String, dynamic>{
      'orderUuid': instance.orderUuid,
      'orderDate': instance.orderDate.toIso8601String(),
      'total': instance.total,
      'itemCount': instance.itemCount,
      'paymentMethod': instance.paymentMethod,
      'channel': instance.channel,
    };

_$CustomerInsightsImpl _$$CustomerInsightsImplFromJson(
        Map<String, dynamic> json) =>
    _$CustomerInsightsImpl(
      totalNewGuests: (json['totalNewGuests'] as num).toInt(),
      totalReturning: (json['totalReturning'] as num).toInt(),
      totalLapsed: (json['totalLapsed'] as num).toInt(),
      averageSpendAll: (json['averageSpendAll'] as num).toDouble(),
      topItem: json['topItem'] as String,
      lastOrderChannel: json['lastOrderChannel'] as String?,
    );

Map<String, dynamic> _$$CustomerInsightsImplToJson(
        _$CustomerInsightsImpl instance) =>
    <String, dynamic>{
      'totalNewGuests': instance.totalNewGuests,
      'totalReturning': instance.totalReturning,
      'totalLapsed': instance.totalLapsed,
      'averageSpendAll': instance.averageSpendAll,
      'topItem': instance.topItem,
      'lastOrderChannel': instance.lastOrderChannel,
    };
