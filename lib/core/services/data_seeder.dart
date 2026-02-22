import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';
import 'package:savvy_pos/core/database/database.dart';
import 'package:uuid/uuid.dart';

@lazySingleton
class DataSeeder {
  final AppDatabase db;
  final Uuid _uuid = const Uuid();

  DataSeeder(this.db);

  Future<void> seed(String businessType) async {
    // 1. Transactional Seed
    await db.transaction(() async {
      // Clear existing demo data if any (optional, usually Genesis runs on empty)

      switch (businessType) {
        case 'CAFE':
          await _seedCafe();
          break;
        case 'RETAIL':
          await _seedRetail();
          break;
        case 'SERVICE':
          await _seedService();
          break;
        default:
          await _seedCafe(); // Default
      }
    });
  }

  Future<void> _seedCafe() async {
    // Categories
    final catCoffee = await _createCategory('Coffee', '#795548');
    final catPastry = await _createCategory('Pastry', '#FF9800');

    // Products
    await _createProduct('Espresso', 2.50, catCoffee, sku: 'COF-001');
    await _createProduct('Cappuccino', 3.50, catCoffee, sku: 'COF-002');
    await _createProduct('Latte', 4.00, catCoffee, sku: 'COF-003');
    await _createProduct('Croissant', 2.00, catPastry, sku: 'PAS-001');
    await _createProduct('Muffin', 2.50, catPastry, sku: 'PAS-002');
  }

  Future<void> _seedRetail() async {
    final catMens = await _createCategory('Men\'s Wear', '#3F51B5');
    final catAcc = await _createCategory('Accessories', '#9C27B0');

    await _createProduct('Basic T-Shirt', 15.00, catMens,
        sku: 'TSH-001', trackStock: true);
    await _createProduct('Jeans', 45.00, catMens,
        sku: 'JNS-001', trackStock: true);
    await _createProduct('Baseball Cap', 10.00, catAcc, sku: 'CAP-001');
  }

  Future<void> _seedService() async {
    final catHair = await _createCategory('Haircuts', '#E91E63');
    await _createProduct('Men\'s Cut', 20.00, catHair, isService: true);
    await _createProduct('Women\'s Cut', 35.00, catHair, isService: true);
  }

  Future<String> _createCategory(String name, String color) async {
    final id = _uuid.v4();
    await db.into(db.categoryTable).insert(CategoryTableCompanion.insert(
          uuid: id,
          name: name,
          colorHex: Value(color),
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        ));
    return id;
  }

  Future<void> _createProduct(String name, double price, String catId,
      {String? sku, bool trackStock = false, bool isService = false}) async {
    final id = _uuid.v4();
    await db.into(db.productTable).insert(ProductTableCompanion.insert(
          uuid: id,
          name: name,
          price: price,
          costPrice: Value(price * 0.4), // 40% cost assumption
          categoryId: catId,
          sku: Value(sku ?? ''),
          trackStock: trackStock,
          isService: isService,
          colorHex: const Value('#FFFFFF'),
          // createdAt: DateTime.now(), // Removed
          updatedAt: DateTime.now(),
          // tenantId: const Value('default-tenant'), // Removed
        ));

    // Initial Stock if tracking
    if (trackStock) {
      await db
          .into(db.inventoryLedgerTable)
          .insert(InventoryLedgerTableCompanion.insert(
            // uuid: _uuid.v4(), // No UUID in InventoryLedgerTable
            productUuid: id,
            referenceId: 'GENESIS',
            type: 'INITIAL',
            quantityChange: 100, // Start with 100
            // snapshotCost: price * 0.4, // Removed
            timestamp: DateTime.now(), // Was createdAt
          ));
    }
  }
}
