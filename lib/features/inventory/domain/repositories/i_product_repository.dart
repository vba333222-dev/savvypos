import 'package:dartz/dartz.dart';
import 'package:savvy_pos/core/error/failures.dart';
import 'package:savvy_pos/features/inventory/domain/entities/product.dart';
import 'package:savvy_pos/features/inventory/domain/entities/recipe.dart';
import 'package:savvy_pos/features/inventory/domain/entities/modifier.dart';
import 'package:savvy_pos/features/inventory/domain/entities/ingredient.dart';

abstract class IProductRepository {
  /// Get all products (paginated or stream)
  Stream<List<Product>> watchAllProducts(); 

  /// Search products by name or SKU
  Future<List<Product>> searchProducts(String query);

  /// Get product by UUID
  Future<Product?> getProductByUuid(String uuid);

  /// Save or Update product
  Future<void> saveProduct(Product product);

  /// Soft delete product
  Future<void> deleteProduct(String uuid);
  
  /// Quick update stock (for tactile inventory)
  Future<void> updateStock(String productUuid, int delta);
  
  /// Watch inventory for a specific warehouse
  Stream<List<ProductStock>> watchInventory(String warehouseId);

  // Add other methods if stricly required, but this is the critical one for now.
  // Ingredients
  Future<Either<Failure, List<Ingredient>>> getIngredients(String productId);
  Future<Either<Failure, List<Ingredient>>> getAllIngredients();
  Future<Either<Failure, void>> saveIngredient(Ingredient ingredient);
  Future<Either<Failure, void>> deleteIngredient(String ingredientId);

  // Modifiers
  Future<Either<Failure, List<ModifierGroup>>> getModifierGroups(String productId);
  Future<Either<Failure, List<ModifierGroup>>> getAllModifierGroups();
  Future<Either<Failure, void>> saveModifierGroup(ModifierGroup group);
  Future<Either<Failure, void>> deleteModifierGroup(String groupId);
  Future<Either<Failure, void>> updateProductModifiers(String productId, List<String> modifierIds);

  // Recipes
  Future<Either<Failure, Recipe?>> getRecipeForProduct(String productId);
  Future<Either<Failure, void>> updateRecipe(Recipe recipe);
}

class ProductStock {
  final Product product;
  final double quantity;

  const ProductStock({required this.product, required this.quantity});
}
