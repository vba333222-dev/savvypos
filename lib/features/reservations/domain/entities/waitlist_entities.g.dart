// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'waitlist_entities.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WaitlistEntryImpl _$$WaitlistEntryImplFromJson(Map<String, dynamic> json) =>
    _$WaitlistEntryImpl(
      uuid: json['uuid'] as String,
      guestName: json['guestName'] as String,
      phoneNumber: json['phoneNumber'] as String,
      partySize: (json['partySize'] as num).toInt(),
      specialRequests: json['specialRequests'] as String?,
      highchairNeeded: json['highchairNeeded'] as bool? ?? false,
      wheelchairAccessible: json['wheelchairAccessible'] as bool? ?? false,
      tablePreference: json['tablePreference'] as String?,
      status: $enumDecodeNullable(_$WaitlistStatusEnumMap, json['status']) ??
          WaitlistStatus.waiting,
      createdAt: DateTime.parse(json['createdAt'] as String),
      quotedWaitTime: json['quotedWaitTime'] == null
          ? null
          : DateTime.parse(json['quotedWaitTime'] as String),
      notifiedAt: json['notifiedAt'] == null
          ? null
          : DateTime.parse(json['notifiedAt'] as String),
      seatedAt: json['seatedAt'] == null
          ? null
          : DateTime.parse(json['seatedAt'] as String),
      seatedTableUuid: json['seatedTableUuid'] as String?,
      queuePosition: (json['queuePosition'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$WaitlistEntryImplToJson(_$WaitlistEntryImpl instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'guestName': instance.guestName,
      'phoneNumber': instance.phoneNumber,
      'partySize': instance.partySize,
      'specialRequests': instance.specialRequests,
      'highchairNeeded': instance.highchairNeeded,
      'wheelchairAccessible': instance.wheelchairAccessible,
      'tablePreference': instance.tablePreference,
      'status': _$WaitlistStatusEnumMap[instance.status]!,
      'createdAt': instance.createdAt.toIso8601String(),
      'quotedWaitTime': instance.quotedWaitTime?.toIso8601String(),
      'notifiedAt': instance.notifiedAt?.toIso8601String(),
      'seatedAt': instance.seatedAt?.toIso8601String(),
      'seatedTableUuid': instance.seatedTableUuid,
      'queuePosition': instance.queuePosition,
    };

const _$WaitlistStatusEnumMap = {
  WaitlistStatus.waiting: 'waiting',
  WaitlistStatus.seated: 'seated',
  WaitlistStatus.cancelled: 'cancelled',
  WaitlistStatus.noShow: 'noShow',
};

_$WaitlistSummaryImpl _$$WaitlistSummaryImplFromJson(
        Map<String, dynamic> json) =>
    _$WaitlistSummaryImpl(
      totalWaiting: (json['totalWaiting'] as num).toInt(),
      avgWaitMinutes: (json['avgWaitMinutes'] as num).toInt(),
      longestWaitMinutes: (json['longestWaitMinutes'] as num).toInt(),
      partySizeDistribution:
          (json['partySizeDistribution'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(int.parse(k), (e as num).toInt()),
      ),
    );

Map<String, dynamic> _$$WaitlistSummaryImplToJson(
        _$WaitlistSummaryImpl instance) =>
    <String, dynamic>{
      'totalWaiting': instance.totalWaiting,
      'avgWaitMinutes': instance.avgWaitMinutes,
      'longestWaitMinutes': instance.longestWaitMinutes,
      'partySizeDistribution': instance.partySizeDistribution
          .map((k, e) => MapEntry(k.toString(), e)),
    };
