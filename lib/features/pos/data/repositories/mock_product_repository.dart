import 'dart:async';
import 'package:savvy_pos/features/inventory/domain/entities/modifier.dart'; // Ensure this matches actual location
import 'package:savvy_pos/features/inventory/domain/entities/product.dart';
import 'package:savvy_pos/features/inventory/domain/repositories/i_product_repository.dart';

class MockProductRepository implements IProductRepository {
  final List<Product> _dummyProducts = [
    const Product(
      uuid: 'p-001',
      name: 'Caramel Macchiato',
      price: 5.50,
      categoryId: 'coffee',
      imageUrl: 'https://images.unsplash.com/photo-1485808191679-5f8c7c413768?w=800&auto=format&fit=crop',
      colorHex: '#C68E17',
      trackStock: true,
      isService: false,
    ),
    const Product(
      uuid: 'p-002',
      name: 'Croissant',
      price: 3.00,
      categoryId: 'bakery',
      imageUrl: 'https://images.unsplash.com/photo-1555507036-ab1f4038808a?w=800&auto=format&fit=crop',
      colorHex: '#EBB05F',
      trackStock: true,
      isService: false,
    ),
    const Product(
      uuid: 'p-003',
      name: 'Iced Americano',
      price: 4.00,
      categoryId: 'coffee',
      colorHex: '#4B3621',
      trackStock: true,
      isService: false,
    ),
    const Product(
      uuid: 'p-004',
      name: 'Avocado Toast',
      price: 8.50,
      categoryId: 'food',
      imageUrl: 'https://images.unsplash.com/photo-1603046891744-1f7636440a2d?w=800&auto=format&fit=crop',
      colorHex: '#568203',
      trackStock: true,
      isService: false,
    ),
    const Product(
      uuid: 'p-005',
      name: 'Matcha Latte',
      price: 5.00,
      categoryId: 'tea',
      colorHex: '#88B04B',
      trackStock: true,
      isService: false,
    ),
    const Product(
      uuid: 'p-tax',
      name: 'Tax Item (10%)',
      price: 0.00, // Dynamic
      categoryId: 'tax',
      trackStock: false,
      isService: true,
    ),
  ];

  @override
  Stream<List<Product>> watchAllProducts() {
    return Stream.value(_dummyProducts);
  }

  @override
  Future<List<Product>> searchProducts(String query) async {
    await Future.delayed(const Duration(milliseconds: 300));
    return _dummyProducts.where((p) => 
      p.name.toLowerCase().contains(query.toLowerCase())
    ).toList();
  }

  @override
  Future<Product?> getProductByUuid(String uuid) async {
    try {
      return _dummyProducts.firstWhere((p) => p.uuid == uuid);
    } catch (_) {
      return null;
    }
  }

  @override
  Future<void> saveProduct(Product product) async {
    // No-op for mock
  }

  @override
  Future<void> deleteProduct(String uuid) async {
    _dummyProducts.removeWhere((p) => p.uuid == uuid);
  }

  @override
  Future<List<ModifierGroup>> getModifiersForProduct(String productId) async {
     await Future.delayed(const Duration(milliseconds: 100));
     if (productId == 'p-001' || productId == 'p-003') {
       return [
         ModifierGroup(
           uuid: 'mg-001',
           name: 'Add-ons',
           allowMultiSelect: true,
           minSelection: 0,
           maxSelection: 5,
           items: const [
             ModifierItem(name: 'Extra Shot', priceDelta: 1.0, uuid: 'm-001'),
             ModifierItem(name: 'Oat Milk', priceDelta: 0.8, uuid: 'm-002'),
             ModifierItem(name: 'Sugar Free', priceDelta: 0.0, uuid: 'm-003'),
           ],
         ),
       ];
     }
     return [];
  }

  @override
  Stream<List<ProductStock>> watchInventory(String warehouseId) {
    return Stream.value(_dummyProducts.map((p) => ProductStock(product: p, quantity: 100)).toList());
  }

  @override
  Future<void> updateStock(String productUuid, int delta) async {
     // Mock implementation
  }
}
