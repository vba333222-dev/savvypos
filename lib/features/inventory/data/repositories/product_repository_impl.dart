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
      trackStock: row.trackStock,
      isService: row.isService,
      printerCategory: row.printerCategory,
    );
  }
}
