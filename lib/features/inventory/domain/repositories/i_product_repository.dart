import 'package:savvy_pos/features/inventory/domain/entities/product.dart';

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
}
