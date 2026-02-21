// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delivery_channel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DeliveryChannelConfigImpl _$$DeliveryChannelConfigImplFromJson(
        Map<String, dynamic> json) =>
    _$DeliveryChannelConfigImpl(
      id: json['id'] as String,
      provider: $enumDecode(_$DeliveryChannelEnumMap, json['provider']),
      isActive: json['isActive'] as bool? ?? true,
      autoAcceptOrders: json['autoAcceptOrders'] as bool? ?? true,
      surchargePercent: (json['surchargePercent'] as num?)?.toDouble() ?? 0.0,
      lastSyncedAt: json['lastSyncedAt'] == null
          ? null
          : DateTime.parse(json['lastSyncedAt'] as String),
    );

Map<String, dynamic> _$$DeliveryChannelConfigImplToJson(
        _$DeliveryChannelConfigImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'provider': _$DeliveryChannelEnumMap[instance.provider]!,
      'isActive': instance.isActive,
      'autoAcceptOrders': instance.autoAcceptOrders,
      'surchargePercent': instance.surchargePercent,
      'lastSyncedAt': instance.lastSyncedAt?.toIso8601String(),
    };

const _$DeliveryChannelEnumMap = {
  DeliveryChannel.grab: 'grab',
  DeliveryChannel.gojek: 'gojek',
  DeliveryChannel.shopee: 'shopee',
  DeliveryChannel.web: 'web',
  DeliveryChannel.unknown: 'unknown',
};
