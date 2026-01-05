import 'package:injectable/injectable.dart';
import 'package:savvy_pos/features/inventory/domain/entities/product.dart';
import 'package:savvy_pos/features/inventory/domain/repositories/i_product_repository.dart';

@injectable
class GetProductsUseCase {
  final IProductRepository repository;

  GetProductsUseCase(this.repository);

  Stream<List<Product>> execute() {
    return repository.watchAllProducts();
  }
}
