import 'package:injectable/injectable.dart';
import 'package:savvy_pos/features/inventory/domain/entities/product.dart';
import 'package:savvy_pos/features/sales/domain/entities/cart.dart';
import 'package:savvy_pos/features/sales/domain/entities/category.dart';
import 'package:savvy_pos/features/sales/domain/repositories/i_sales_repository.dart';

@injectable
class WatchCategoriesUseCase {
  final ISalesRepository _repository;
  WatchCategoriesUseCase(this._repository);

  Stream<List<Category>> call() => _repository.watchCategories();
}

@injectable
class WatchProductsByCategoryUseCase {
  final ISalesRepository _repository;
  WatchProductsByCategoryUseCase(this._repository);

  Stream<List<Product>> call({String? categoryId}) =>
      _repository.watchProducts(categoryId: categoryId);
}

@injectable
class CreateOrderUseCase {
  final ISalesRepository _repository;
  CreateOrderUseCase(this._repository);

  Future<String> call(Cart cart, {String? tableUuid, String? customerUuid}) =>
      _repository.createOrder(cart, tableUuid, customerUuid);
}
