// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'marketing_campaign.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MarketingCampaignImpl _$$MarketingCampaignImplFromJson(
        Map<String, dynamic> json) =>
    _$MarketingCampaignImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      channel: $enumDecode(_$CampaignChannelEnumMap, json['channel']),
      triggerType:
          $enumDecode(_$CampaignTriggerTypeEnumMap, json['triggerType']),
      triggerValue: json['triggerValue'] as String?,
      content: json['content'] as String,
      isActive: json['isActive'] as bool? ?? true,
      attributedSales: (json['attributedSales'] as num?)?.toDouble() ?? 0.0,
      sentCount: (json['sentCount'] as num?)?.toInt() ?? 0,
      lastRunAt: json['lastRunAt'] == null
          ? null
          : DateTime.parse(json['lastRunAt'] as String),
    );

Map<String, dynamic> _$$MarketingCampaignImplToJson(
        _$MarketingCampaignImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'channel': _$CampaignChannelEnumMap[instance.channel]!,
      'triggerType': _$CampaignTriggerTypeEnumMap[instance.triggerType]!,
      'triggerValue': instance.triggerValue,
      'content': instance.content,
      'isActive': instance.isActive,
      'attributedSales': instance.attributedSales,
      'sentCount': instance.sentCount,
      'lastRunAt': instance.lastRunAt?.toIso8601String(),
    };

const _$CampaignChannelEnumMap = {
  CampaignChannel.sms: 'sms',
  CampaignChannel.email: 'email',
};

const _$CampaignTriggerTypeEnumMap = {
  CampaignTriggerType.inactive30Days: 'inactive30Days',
  CampaignTriggerType.bigSpender: 'bigSpender',
  CampaignTriggerType.birthday: 'birthday',
  CampaignTriggerType.manual: 'manual',
};
