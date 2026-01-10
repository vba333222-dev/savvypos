// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ingredient.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$IngredientImpl _$$IngredientImplFromJson(Map<String, dynamic> json) =>
    _$IngredientImpl(
      uuid: json['uuid'] as String,
      name: json['name'] as String,
      unit: json['unit'] as String,
      currentStock: (json['currentStock'] as num).toDouble(),
      costPerUnit: (json['costPerUnit'] as num).toDouble(),
    );

Map<String, dynamic> _$$IngredientImplToJson(_$IngredientImpl instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'name': instance.name,
      'unit': instance.unit,
      'currentStock': instance.currentStock,
      'costPerUnit': instance.costPerUnit,
    };
