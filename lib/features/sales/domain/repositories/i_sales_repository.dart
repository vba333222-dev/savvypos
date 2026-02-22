import 'package:savvy_pos/core/database/database.dart';
import 'package:savvy_pos/features/inventory/domain/entities/product.dart';
import 'package:savvy_pos/features/sales/domain/entities/category.dart';
import 'package:savvy_pos/features/sales/domain/entities/cart.dart';

abstract class ISalesRepository {
  Stream<List<Category>> watchCategories();
  Stream<List<Product>> watchProducts({String? categoryId});
  Future<List<ModifierGroupTableData>> getModifierGroups(String productUuid);
  Future<List<ModifierItemTableData>> getModifierItems(String groupId);
  Future<String> createOrder(
      Cart cart, String? tableUuid, String? customerUuid);
}
