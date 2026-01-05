import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:savvy_pos/features/customers/domain/entities/customer.dart';
import 'package:savvy_pos/features/inventory/domain/entities/product.dart';
import 'package:savvy_pos/features/inventory/domain/entities/modifier.dart';

part 'cart_event.freezed.dart';

@freezed
class CartEvent with _$CartEvent {
  const factory CartEvent.addProduct(Product product, {
    @Default([]) List<ModifierItem> modifiers,
  }) = _AddProduct;
  const factory CartEvent.updateQuantity(String itemUuid, int quantity) = _UpdateQuantity;
  const factory CartEvent.removeFromCart(String itemUuid) = _RemoveFromCart;
  const factory CartEvent.clearCart() = _ClearCart;
  
  // Advanced Cart
  const factory CartEvent.selectCustomer(Customer? customer) = _SelectCustomer;
  const factory CartEvent.applyDiscount({double? percent, double? fixed}) = _ApplyDiscount;
  
  const factory CartEvent.checkoutProcessed({
    required String paymentMethod,
    double? tenderedAmount,
    double? changeAmount,
  }) = _CheckoutProcessed;

  // Dine-In
  const factory CartEvent.parkOrder(String tableUuid) = _ParkOrder;
  const factory CartEvent.retrieveOrder(String orderUuid, String tableUuid) = _RetrieveOrder;
  const factory CartEvent.checkoutSplit(List<CartItem> items, String paymentMethod) = _CheckoutSplit;
  
  // Kitchen Flow
  const factory CartEvent.updateNote(String productUuid, String? note) = _UpdateNote;
}
