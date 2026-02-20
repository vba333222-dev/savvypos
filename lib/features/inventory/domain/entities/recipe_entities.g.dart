// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_entities.dart';

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
      isDeleted: json['isDeleted'] as bool? ?? false,
    );

Map<String, dynamic> _$$IngredientImplToJson(_$IngredientImpl instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'name': instance.name,
      'unit': instance.unit,
      'currentStock': instance.currentStock,
      'costPerUnit': instance.costPerUnit,
      'isDeleted': instance.isDeleted,
    };

_$RecipeImpl _$$RecipeImplFromJson(Map<String, dynamic> json) => _$RecipeImpl(
      productUuid: json['productUuid'] as String,
      items: (json['items'] as List<dynamic>)
          .map((e) => RecipeItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$RecipeImplToJson(_$RecipeImpl instance) =>
    <String, dynamic>{
      'productUuid': instance.productUuid,
      'items': instance.items,
    };

_$RecipeItemImpl _$$RecipeItemImplFromJson(Map<String, dynamic> json) =>
    _$RecipeItemImpl(
      ingredientUuid: json['ingredientUuid'] as String,
      quantityRequired: (json['quantityRequired'] as num).toDouble(),
      ingredientName: json['ingredientName'] as String?,
      unit: json['unit'] as String?,
    );

Map<String, dynamic> _$$RecipeItemImplToJson(_$RecipeItemImpl instance) =>
    <String, dynamic>{
      'ingredientUuid': instance.ingredientUuid,
      'quantityRequired': instance.quantityRequired,
      'ingredientName': instance.ingredientName,
      'unit': instance.unit,
    };
