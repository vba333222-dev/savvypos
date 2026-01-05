import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:savvy_pos/features/inventory/domain/entities/product.dart';

part 'cart_event.freezed.dart';

@freezed
class CartEvent with _$CartEvent {
  const factory CartEvent.addProduct(Product product) = _AddProduct;
  const factory CartEvent.updateQuantity(String productUuid, int quantity) = _UpdateQuantity;
  const factory CartEvent.removeFromCart(String productUuid) = _RemoveFromCart;
  const factory CartEvent.clearCart() = _ClearCart;
}
