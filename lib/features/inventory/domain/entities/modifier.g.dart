// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'modifier.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ModifierGroupImpl _$$ModifierGroupImplFromJson(Map<String, dynamic> json) =>
    _$ModifierGroupImpl(
      uuid: json['uuid'] as String,
      name: json['name'] as String,
      allowMultiSelect: json['allowMultiSelect'] as bool,
      minSelection: (json['minSelection'] as num).toInt(),
      maxSelection: (json['maxSelection'] as num?)?.toInt(),
      items: (json['items'] as List<dynamic>?)
              ?.map((e) => ModifierItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$ModifierGroupImplToJson(_$ModifierGroupImpl instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'name': instance.name,
      'allowMultiSelect': instance.allowMultiSelect,
      'minSelection': instance.minSelection,
      'maxSelection': instance.maxSelection,
      'items': instance.items,
    };

_$ModifierItemImpl _$$ModifierItemImplFromJson(Map<String, dynamic> json) =>
    _$ModifierItemImpl(
      uuid: json['uuid'] as String,
      name: json['name'] as String,
      priceDelta: (json['priceDelta'] as num).toDouble(),
    );

Map<String, dynamic> _$$ModifierItemImplToJson(_$ModifierItemImpl instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'name': instance.name,
      'priceDelta': instance.priceDelta,
    };
