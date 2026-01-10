
import 'package:dartz/dartz.dart';
import 'package:mockito/mockito.dart';
import 'package:savvy_pos/core/error/failures.dart';
import 'package:savvy_pos/features/inventory/domain/entities/ingredient.dart';
import 'package:savvy_pos/features/inventory/domain/entities/modifier.dart';
import 'package:savvy_pos/features/inventory/domain/entities/product.dart';
import 'package:savvy_pos/features/inventory/domain/entities/recipe.dart';
import 'package:savvy_pos/features/inventory/domain/repositories/i_product_repository.dart';

class MockProductRepository extends Mock implements IProductRepository {
  @override
  Future<void> deleteProduct(String uuid) async {}
  
  @override
  Future<Product?> getProductByUuid(String uuid) async { return null; }
  
  @override
  Future<void> saveProduct(Product product) async {}
  
  @override
  Future<List<Product>> searchProducts(String query) async { return []; }

  @override
  Stream<List<Product>> watchAllProducts() {
    return const Stream.empty();
  }

  @override
  Stream<List<ProductStock>> watchInventory(String warehouseId) {
    return const Stream.empty();
  }

  Future<List<Product>> getProducts() async {
    return [
      const Product(
        uuid: '1', 
        name: 'Coffee', 
        price: 2.50, 
        categoryId: 'Drinks',
        trackStock: true,
        isService: false,
      ),
      const Product(
        uuid: '2', 
        name: 'Muffin', 
        price: 3.00, 
        categoryId: 'Food',
        trackStock: true,
        isService: false,
      ),
    ];
  }
  
  @override
  Future<Either<Failure, List<Ingredient>>> getIngredients(String productId) async {
    return const Right([]);
  }

  @override
  Future<Either<Failure, List<Ingredient>>> getAllIngredients() async {
    return const Right([]);
  }

  @override
  Future<Either<Failure, void>> saveIngredient(Ingredient ingredient) async {
    return const Right(null);
  }

  @override
  Future<Either<Failure, void>> deleteIngredient(String uuid) async {
    return const Right(null);
  }

  @override
  Future<Either<Failure, List<ModifierGroup>>> getModifierGroups(String productId) async {
    return const Right([]);
  }

  @override
  Future<Either<Failure, List<ModifierGroup>>> getAllModifierGroups() async {
    return const Right([]);
  }

  @override
  Future<Either<Failure, void>> saveModifierGroup(ModifierGroup group) async {
    return const Right(null);
  }

  @override
  Future<Either<Failure, void>> deleteModifierGroup(String uuid) async {
    return const Right(null);
  }

  @override
  Future<Either<Failure, void>> updateProductModifiers(String productId, List<String> modifierIds) async {
    return const Right(null);
  }

  @override
  Future<Either<Failure, Recipe?>> getRecipeForProduct(String productId) async {
    return const Right(null);
  }

  @override
  Future<Either<Failure, void>> updateRecipe(Recipe recipe) async {
    return const Right(null);
  }

  @override
  Future<void> updateStock(String productId, int quantity) async {}
}
