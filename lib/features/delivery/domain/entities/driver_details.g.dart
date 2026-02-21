// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'driver_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DriverDetailsImpl _$$DriverDetailsImplFromJson(Map<String, dynamic> json) =>
    _$DriverDetailsImpl(
      name: json['name'] as String,
      licensePlate: json['licensePlate'] as String,
      phone: json['phone'] as String,
      eta: json['eta'] == null ? null : DateTime.parse(json['eta'] as String),
    );

Map<String, dynamic> _$$DriverDetailsImplToJson(_$DriverDetailsImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'licensePlate': instance.licensePlate,
      'phone': instance.phone,
      'eta': instance.eta?.toIso8601String(),
    };
