import 'package:savvy_pos/features/inventory/domain/entities/recipe_entities.dart';

abstract class IRecipeRepository {
  // Ingredients
  Future<List<Ingredient>> getIngredients();
  Future<void> saveIngredient(Ingredient ingredient);
  Future<void> deleteIngredient(String uuid);

  // Recipes
  Future<Recipe?> getRecipeForProduct(String productUuid);
  Future<void> saveRecipe(Recipe recipe);

  // Logic
  Future<void> deductStockForProduct(String productUuid, int quantity);
}
