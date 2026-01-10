// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

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
      ingredient:
          Ingredient.fromJson(json['ingredient'] as Map<String, dynamic>),
      quantity: (json['quantity'] as num).toDouble(),
    );

Map<String, dynamic> _$$RecipeItemImplToJson(_$RecipeItemImpl instance) =>
    <String, dynamic>{
      'ingredient': instance.ingredient,
      'quantity': instance.quantity,
    };
