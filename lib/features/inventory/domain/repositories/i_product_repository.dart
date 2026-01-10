import 'package:savvy_pos/features/inventory/domain/entities/product.dart';
import 'package:savvy_pos/features/inventory/domain/entities/modifier.dart';

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
  
  /// Get modifier groups for a product
  Future<List<ModifierGroup>> getModifiersForProduct(String productUuid);

  /// Quick update stock (for tactile inventory)
  Future<void> updateStock(String productUuid, int delta);
  
  /// Watch inventory for a specific warehouse
  Stream<List<ProductStock>> watchInventory(String warehouseId);

  // Add other methods if stricly required, but this is the critical one for now.
}

class ProductStock {
  final Product product;
  final double quantity;

  const ProductStock({required this.product, required this.quantity});
}
