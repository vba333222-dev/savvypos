import 'package:injectable/injectable.dart';
import 'package:savvy_pos/core/database/database.dart';
import 'package:savvy_pos/features/inventory/domain/entities/recipe_entities.dart';
import 'package:savvy_pos/features/inventory/domain/repositories/i_recipe_repository.dart';
import 'package:drift/drift.dart' as drift;

@LazySingleton(as: IRecipeRepository)
class RecipeRepositoryImpl implements IRecipeRepository {
  final AppDatabase _db;

  RecipeRepositoryImpl(this._db);

  @override
  Future<List<Ingredient>> getIngredients() async {
    final rows = await (_db.select(_db.ingredientTable)
          ..where((t) => t.isDeleted.equals(false)))
        .get();
    return rows
        .map((r) => Ingredient(
              uuid: r.uuid,
              name: r.name,
              unit: r.unit,
              currentStock: r.currentStock,
              costPerUnit: r.costPerUnit,
            ))
        .toList();
  }

  @override
  Future<void> saveIngredient(Ingredient ingredient) async {
    await _db.into(_db.ingredientTable).insert(
          IngredientTableCompanion.insert(
            uuid: ingredient.uuid,
            name: ingredient.name,
            unit: ingredient.unit,
            currentStock: drift.Value(ingredient.currentStock),
            costPerUnit: drift.Value(ingredient.costPerUnit),
            updatedAt: DateTime.now(),
          ),
          mode: drift.InsertMode.insertOrReplace,
        );
  }

  @override
  Future<void> deleteIngredient(String uuid) async {
    await (_db.update(_db.ingredientTable)..where((t) => t.uuid.equals(uuid)))
        .write(const IngredientTableCompanion(isDeleted: drift.Value(true)));
  }

  @override
  Future<Recipe?> getRecipeForProduct(String productUuid) async {
    // 1. Get recipe links
    final query = _db.select(_db.recipeTable).join([
      drift.innerJoin(_db.ingredientTable,
          _db.ingredientTable.uuid.equalsExp(_db.recipeTable.ingredientUuid))
    ])
      ..where(_db.recipeTable.productUuid.equals(productUuid));

    final rows = await query.get();

    if (rows.isEmpty) return null;

    final items = rows.map((row) {
      final recipe = row.readTable(_db.recipeTable);
      final ingredient = row.readTable(_db.ingredientTable);

      return RecipeItem(
        ingredientUuid: recipe.ingredientUuid,
        quantityRequired: recipe.quantityRequired,
        ingredientName: ingredient.name,
        unit: ingredient.unit,
      );
    }).toList();

    return Recipe(productUuid: productUuid, items: items);
  }

  @override
  Future<void> saveRecipe(Recipe recipe) async {
    await _db.transaction(() async {
      // 1. Delete existing connections
      await (_db.delete(_db.recipeTable)
            ..where((t) => t.productUuid.equals(recipe.productUuid)))
          .go();

      // 2. Insert new ones
      for (final item in recipe.items) {
        await _db.into(_db.recipeTable).insert(
              RecipeTableCompanion.insert(
                productUuid: recipe.productUuid,
                ingredientUuid: item.ingredientUuid,
                quantityRequired: item.quantityRequired,
              ),
            );
      }

      // 3. Update Product isComposite flag
      await (_db.update(_db.productTable)
            ..where((t) => t.uuid.equals(recipe.productUuid)))
          .write(ProductTableCompanion(
              isComposite: drift.Value(recipe.items.isNotEmpty)));
    });
  }

  @override
  Future<void> deductStockForProduct(String productUuid, int quantity) async {
    final recipe = await getRecipeForProduct(productUuid);
    if (recipe == null) return; // No recipe, no deduction (or simple inventory)

    await _db.transaction(() async {
      for (final item in recipe.items) {
        final deduction = item.quantityRequired * quantity;

        // Find ingredient and update stock
        // Note: Using custom SQL might be atomic, but read-modify-write in transaction is okay for now
        final ingredient = await (_db.select(_db.ingredientTable)
              ..where((t) => t.uuid.equals(item.ingredientUuid)))
            .getSingle();

        final newStock = ingredient.currentStock - deduction;

        await (_db.update(_db.ingredientTable)
              ..where((t) => t.uuid.equals(item.ingredientUuid)))
            .write(
                IngredientTableCompanion(currentStock: drift.Value(newStock)));

        // TODO: Log to InventoryLedger (omitted for brevity, but crucial for auditing)
      }
    });
  }
}
