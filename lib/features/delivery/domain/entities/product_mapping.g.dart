// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_mapping.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductMappingImpl _$$ProductMappingImplFromJson(Map<String, dynamic> json) =>
    _$ProductMappingImpl(
      externalItemRef: json['externalItemRef'] as String,
      internalProductId: json['internalProductId'] as String,
      channel: $enumDecode(_$DeliveryChannelEnumMap, json['channel']),
    );

Map<String, dynamic> _$$ProductMappingImplToJson(
        _$ProductMappingImpl instance) =>
    <String, dynamic>{
      'externalItemRef': instance.externalItemRef,
      'internalProductId': instance.internalProductId,
      'channel': _$DeliveryChannelEnumMap[instance.channel]!,
    };

const _$DeliveryChannelEnumMap = {
  DeliveryChannel.grab: 'grab',
  DeliveryChannel.gojek: 'gojek',
  DeliveryChannel.shopee: 'shopee',
  DeliveryChannel.web: 'web',
  DeliveryChannel.unknown: 'unknown',
};
