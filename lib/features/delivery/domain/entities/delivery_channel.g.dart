// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delivery_channel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DeliveryChannelConfigImpl _$$DeliveryChannelConfigImplFromJson(
        Map<String, dynamic> json) =>
    _$DeliveryChannelConfigImpl(
      id: json['id'] as String,
      provider: $enumDecode(_$DeliveryProviderEnumMap, json['provider']),
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
      'provider': _$DeliveryProviderEnumMap[instance.provider]!,
      'isActive': instance.isActive,
      'autoAcceptOrders': instance.autoAcceptOrders,
      'surchargePercent': instance.surchargePercent,
      'lastSyncedAt': instance.lastSyncedAt?.toIso8601String(),
    };

const _$DeliveryProviderEnumMap = {
  DeliveryProvider.uberEats: 'uberEats',
  DeliveryProvider.grabFood: 'grabFood',
  DeliveryProvider.goFood: 'goFood',
  DeliveryProvider.doorDash: 'doorDash',
  DeliveryProvider.manual: 'manual',
};
