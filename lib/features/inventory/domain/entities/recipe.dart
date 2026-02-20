
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:savvy_pos/features/inventory/domain/entities/ingredient.dart';

part 'recipe.freezed.dart';
part 'recipe.g.dart';

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
    required Ingredient ingredient,
    required double quantity,
  }) = _RecipeItem;

  factory RecipeItem.fromJson(Map<String, dynamic> json) => _$RecipeItemFromJson(json);
}
