import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';
import 'package:savvy_pos/core/database/database.dart';
import 'package:savvy_pos/features/inventory/domain/entities/product.dart';
import 'package:savvy_pos/features/inventory/domain/repositories/i_product_repository.dart';

@LazySingleton(as: IProductRepository)
class ProductRepositoryImpl implements IProductRepository {
  final AppDatabase db;

  ProductRepositoryImpl(this.db);

  @override
  Stream<List<Product>> watchAllProducts() {
    return db.select(db.productTable).watch().map((rows) {
      return rows.map((row) => _mapToDomain(row)).toList();
    });
  }

  @override
  Future<List<Product>> searchProducts(String query) async {
    final rows = await (db.select(db.productTable)
      ..where((tbl) => tbl.name.contains(query) | tbl.sku.contains(query)))
      .get();
      
    return rows.map((row) => _mapToDomain(row)).toList();
  }

  @override
  Future<Product?> getProductByUuid(String uuid) async {
    final row = await (db.select(db.productTable)..where((tbl) => tbl.uuid.equals(uuid))).getSingleOrNull();
    return row != null ? _mapToDomain(row) : null;
  }

  @override
  Future<void> saveProduct(Product product) async {
    final companion = ProductTableCompanion(
      uuid: Value(product.uuid),
      name: Value(product.name),
      sku: Value(product.sku),
      price: Value(product.price),
      imageUrl: Value(product.imageUrl),
      colorHex: Value(product.colorHex),
      categoryId: Value(product.categoryId),
      trackStock: Value(product.trackStock),
      isService: Value(product.isService),
      printerCategory: Value(product.printerCategory),
      updatedAt: Value(DateTime.now()),
      isSynced: const Value(false),
    );

    // Use insertOnConflictUpdate assuming UUID is unique key
    await db.into(db.productTable).insertOnConflictUpdate(companion);
  }

  @override
  Future<void> deleteProduct(String uuid) async {
    await (db.update(db.productTable)
      ..where((t) => t.uuid.equals(uuid)))
      .write(ProductTableCompanion(
        isDeleted: const Value(true),
        updatedAt: Value(DateTime.now()),
        isSynced: const Value(false),
      ));
  }

  @override
  Future<List<ModifierGroup>> getModifierGroups() async {
    final rows = await db.select(db.modifierGroupTable).get();
    return Future.wait(rows.map((row) async {
       final items = await (db.select(db.modifierItemTable)
         ..where((t) => t.groupUuid.equals(row.uuid))).get();
       
       return ModifierGroup(
         uuid: row.uuid,
         name: row.name,
         allowMultiSelect: row.allowMultiSelect,
         minSelection: row.minSelection,
         maxSelection: row.maxSelection,
         items: items.map((i) => ModifierItem(uuid: i.uuid, name: i.name, priceDelta: i.priceDelta)).toList(),
       );
    }));
  }

  @override
  Future<void> saveModifierGroup(ModifierGroup group) async {
    // 1. Save Group
    await db.into(db.modifierGroupTable).insertOnConflictUpdate(ModifierGroupTableCompanion(
      uuid: Value(group.uuid),
      name: Value(group.name),
      allowMultiSelect: Value(group.allowMultiSelect),
      minSelection: Value(group.minSelection),
      maxSelection: Value(group.maxSelection),
      updatedAt: Value(DateTime.now()),
    ));
    
    // 2. Save Items (Delete existing for simplicity or upsert?)
    // Simplest: Delete all items for group and re-insert.
    await (db.delete(db.modifierItemTable)..where((t) => t.groupUuid.equals(group.uuid))).go();
    
    for (var item in group.items) {
      await db.into(db.modifierItemTable).insert(ModifierItemTableCompanion.insert(
        uuid: item.uuid,
        groupUuid: group.uuid,
        name: item.name,
        priceDelta: Value(item.priceDelta),
        updatedAt: DateTime.now(),
      ));
    }
  }
  
  @override
  Future<void> deleteModifierGroup(String uuid) async {
    await (db.delete(db.modifierGroupTable)..where((t) => t.uuid.equals(uuid))).go();
  }

  @override
  Future<List<ModifierGroup>> getModifiersForProduct(String productUuid) async {
     // Join ProductModifierLink -> ModifierGroup
     final query = db.select(db.productModifierLinkTable).join([
       innerJoin(db.modifierGroupTable, db.modifierGroupTable.uuid.equalsExp(db.productModifierLinkTable.modifierGroupUuid))
     ])..where(db.productModifierLinkTable.productUuid.equals(productUuid));
     
     final rows = await query.get();
     
     // Fetch full details including items
     // MVP: Optimize later
     final groups = <ModifierGroup>[];
     for (var row in rows) {
        final groupRow = row.readTable(db.modifierGroupTable);
        // Fetch items
        final items = await (db.select(db.modifierItemTable)..where((t) => t.groupUuid.equals(groupRow.uuid))).get();
        groups.add(ModifierGroup(
           uuid: groupRow.uuid,
           name: groupRow.name,
           allowMultiSelect: groupRow.allowMultiSelect,
           minSelection: groupRow.minSelection,
           maxSelection: groupRow.maxSelection,
           items: items.map((i) => ModifierItem(uuid: i.uuid, name: i.name, priceDelta: i.priceDelta)).toList(),
        ));
     }
     return groups;
  }
  
  @override
  Future<void> updateProductModifiers(String productUuid, List<String> modifierGroupUuids) async {
     await (db.delete(db.productModifierLinkTable)..where((t) => t.productUuid.equals(productUuid))).go();
     for (var groupUuid in modifierGroupUuids) {
       await db.into(db.productModifierLinkTable).insert(ProductModifierLinkTableCompanion.insert(
         productUuid: productUuid,
         modifierGroupUuid: groupUuid,
       ));
     }
  }

  // Ingredients stub (implement fully when needed or now)
  @override
  Future<List<Ingredient>> getIngredients() async {
    final rows = await db.select(db.ingredientTable).get();
    return rows.map((r) => Ingredient(
      uuid: r.uuid, 
      name: r.name, 
      unit: r.unit, 
      currentStock: r.currentStock, 
      costPerUnit: r.costPerUnit
    )).toList();
  }

  @override
  Future<void> saveIngredient(Ingredient ingredient) async {
    await db.into(db.ingredientTable).insertOnConflictUpdate(IngredientTableCompanion(
      uuid: Value(ingredient.uuid),
      name: Value(ingredient.name),
      unit: Value(ingredient.unit),
      currentStock: Value(ingredient.currentStock),
      costPerUnit: Value(ingredient.costPerUnit),
      updatedAt: Value(DateTime.now()),
    ));
  }

  @override
  Future<void> deleteIngredient(String uuid) async {
     await (db.delete(db.ingredientTable)..where((t) => t.uuid.equals(uuid))).go();
  }

  @override
  Future<Map<Ingredient, double>> getRecipeForProduct(String productUuid) async {
    final query = db.select(db.recipeTable).join([
      innerJoin(db.ingredientTable, db.ingredientTable.uuid.equalsExp(db.recipeTable.ingredientUuid))
    ])..where(db.recipeTable.productUuid.equals(productUuid));
    
    final rows = await query.get();
    final result = <Ingredient, double>{};
    
    for (var row in rows) {
      final ingRow = row.readTable(db.ingredientTable);
      final recipeRow = row.readTable(db.recipeTable);
      final ingredient = Ingredient(
        uuid: ingRow.uuid, 
        name: ingRow.name, 
        unit: ingRow.unit, 
        currentStock: ingRow.currentStock, 
        costPerUnit: ingRow.costPerUnit
      );
      result[ingredient] = recipeRow.quantityRequired;
    }
    return result;
  }

  @override
  Future<void> updateRecipe(String productUuid, Map<String, double> ingredients) async {
    await (db.delete(db.recipeTable)..where((t) => t.productUuid.equals(productUuid))).go();
    for (var entry in ingredients.entries) {
      await db.into(db.recipeTable).insert(RecipeTableCompanion.insert(
        productUuid: productUuid,
        ingredientUuid: entry.key,
        quantityRequired: entry.value,
      ));
    }
  }

  Product _mapToDomain(ProductTableData row) {
    return Product(
      uuid: row.uuid,
      name: row.name,
      sku: row.sku,
      price: row.price,
      imageUrl: row.imageUrl,
      colorHex: row.colorHex,
      categoryId: row.categoryId,
      trackStock: row.trackStock,
      isService: row.isService,
      isComposite: row.isComposite,
      printerCategory: row.printerCategory,
    );
  }
}
