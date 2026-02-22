import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:savvy_pos/features/customers/domain/entities/customer.dart';
import 'package:savvy_pos/features/inventory/domain/entities/product.dart';
import 'package:savvy_pos/features/inventory/domain/entities/modifier.dart';

part 'cart_event.freezed.dart';

@freezed
class CartEvent with _$CartEvent {
  const factory CartEvent.addProduct(
    Product product, {
    @Default([]) List<ModifierItem> modifiers,
  }) = AddProduct;
  const factory CartEvent.updateQuantity(String itemUuid, int quantity) =
      UpdateQuantity;
  const factory CartEvent.removeFromCart(String itemUuid) = RemoveFromCart;
  const factory CartEvent.clearCart() = ClearCart;
  const factory CartEvent.scanItem(String barcode) = ScanItem;

  // Advanced Cart
  const factory CartEvent.selectCustomer(Customer? customer) = SelectCustomer;
  const factory CartEvent.applyDiscount({double? percent, double? fixed}) =
      ApplyDiscount;
  const factory CartEvent.addPromoCode(String code) = AddPromoCode;

  const factory CartEvent.checkoutProcessed({
    required String paymentMethod,
    double? tenderedAmount,
    double? changeAmount,
  }) = CheckoutProcessed;

  // Dine-In
  const factory CartEvent.parkOrder(String tableUuid) = ParkOrder;
  const factory CartEvent.selectTable(String tableUuid) = SelectTable;
  const factory CartEvent.retrieveOrder(String orderUuid, String tableUuid) =
      RetrieveOrder;
  const factory CartEvent.checkoutSplit(
      List<String> itemUuids, String paymentMethod) = CheckoutSplit;

  // Kitchen Flow
  const factory CartEvent.updateNote(String productUuid, String? note) =
      UpdateNote;
  const factory CartEvent.toggleItemHold(String itemUuid) = ToggleItemHold;
  const factory CartEvent.fireItem(String itemUuid) = FireItem;
}
