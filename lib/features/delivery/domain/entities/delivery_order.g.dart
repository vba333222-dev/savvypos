// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delivery_order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DeliveryOrderImpl _$$DeliveryOrderImplFromJson(Map<String, dynamic> json) =>
    _$DeliveryOrderImpl(
      deliveryUuid: json['deliveryUuid'] as String,
      externalOrderId: json['externalOrderId'] as String,
      channel: $enumDecode(_$DeliveryChannelEnumMap, json['channel']),
      status: $enumDecodeNullable(_$DeliveryStatusEnumMap, json['status']) ??
          DeliveryStatus.newUnaccepted,
      deliveryFee: (json['deliveryFee'] as num?)?.toDouble() ?? 0.0,
      packagingFee: (json['packagingFee'] as num?)?.toDouble() ?? 0.0,
      driverDetails: json['driverDetails'] == null
          ? null
          : DriverDetails.fromJson(
              json['driverDetails'] as Map<String, dynamic>),
      internalOrderUuid: json['internalOrderUuid'] as String?,
    );

Map<String, dynamic> _$$DeliveryOrderImplToJson(_$DeliveryOrderImpl instance) =>
    <String, dynamic>{
      'deliveryUuid': instance.deliveryUuid,
      'externalOrderId': instance.externalOrderId,
      'channel': _$DeliveryChannelEnumMap[instance.channel]!,
      'status': _$DeliveryStatusEnumMap[instance.status]!,
      'deliveryFee': instance.deliveryFee,
      'packagingFee': instance.packagingFee,
      'driverDetails': instance.driverDetails,
      'internalOrderUuid': instance.internalOrderUuid,
    };

const _$DeliveryChannelEnumMap = {
  DeliveryChannel.grab: 'grab',
  DeliveryChannel.gojek: 'gojek',
  DeliveryChannel.shopee: 'shopee',
  DeliveryChannel.web: 'web',
  DeliveryChannel.unknown: 'unknown',
};

const _$DeliveryStatusEnumMap = {
  DeliveryStatus.newUnaccepted: 'new_unaccepted',
  DeliveryStatus.accepted: 'accepted',
  DeliveryStatus.preparing: 'preparing',
  DeliveryStatus.readyForPickup: 'ready_for_pickup',
  DeliveryStatus.pickedUp: 'picked_up',
  DeliveryStatus.cancelled: 'cancelled',
};
