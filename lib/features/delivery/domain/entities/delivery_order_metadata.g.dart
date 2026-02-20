// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delivery_order_metadata.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DeliveryOrderMetadataImpl _$$DeliveryOrderMetadataImplFromJson(
        Map<String, dynamic> json) =>
    _$DeliveryOrderMetadataImpl(
      orderUuid: json['orderUuid'] as String,
      provider: $enumDecode(_$DeliveryProviderEnumMap, json['provider']),
      externalOrderId: json['externalOrderId'] as String,
      driverName: json['driverName'] as String?,
      driverPhone: json['driverPhone'] as String?,
      driverPlate: json['driverPlate'] as String?,
      pickupTime: json['pickupTime'] == null
          ? null
          : DateTime.parse(json['pickupTime'] as String),
      deliveryStatus: json['deliveryStatus'] as String? ?? 'NEW',
    );

Map<String, dynamic> _$$DeliveryOrderMetadataImplToJson(
        _$DeliveryOrderMetadataImpl instance) =>
    <String, dynamic>{
      'orderUuid': instance.orderUuid,
      'provider': _$DeliveryProviderEnumMap[instance.provider]!,
      'externalOrderId': instance.externalOrderId,
      'driverName': instance.driverName,
      'driverPhone': instance.driverPhone,
      'driverPlate': instance.driverPlate,
      'pickupTime': instance.pickupTime?.toIso8601String(),
      'deliveryStatus': instance.deliveryStatus,
    };

const _$DeliveryProviderEnumMap = {
  DeliveryProvider.uberEats: 'uberEats',
  DeliveryProvider.grabFood: 'grabFood',
  DeliveryProvider.goFood: 'goFood',
  DeliveryProvider.doorDash: 'doorDash',
  DeliveryProvider.manual: 'manual',
};
