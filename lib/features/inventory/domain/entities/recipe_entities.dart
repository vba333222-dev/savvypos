import 'package:freezed_annotation/freezed_annotation.dart';

part 'recipe_entities.freezed.dart';
part 'recipe_entities.g.dart';

@freezed
class Ingredient with _$Ingredient {
  const factory Ingredient({
    required String uuid,
    required String name,
    required String unit, // g, ml, pcs
    required double currentStock,
    required double costPerUnit,
    @Default(false) bool isDeleted,
  }) = _Ingredient;

  factory Ingredient.fromJson(Map<String, dynamic> json) =>
      _$IngredientFromJson(json);
}

@freezed
class Recipe with _$Recipe {
  const factory Recipe({
    required String productUuid,
    required List<RecipeItem> items,
  }) = _Recipe;

  factory Recipe.fromJson(Map<String, dynamic> json) => _$RecipeFromJson(json);
}

@freezed
class RecipeItem with _$RecipeItem {
  const factory RecipeItem({
    required String ingredientUuid,
    required double quantityRequired,
    String? ingredientName, // Helper for UI
    String? unit, // Helper for UI
  }) = _RecipeItem;

  factory RecipeItem.fromJson(Map<String, dynamic> json) =>
      _$RecipeItemFromJson(json);
}
