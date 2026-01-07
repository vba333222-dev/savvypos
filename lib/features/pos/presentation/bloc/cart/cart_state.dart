import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:savvy_pos/core/database/database.dart';
import 'package:savvy_pos/features/customers/domain/entities/customer.dart';
import 'package:savvy_pos/features/inventory/domain/entities/product.dart';

import 'package:savvy_pos/features/inventory/domain/entities/modifier.dart';
import 'package:savvy_pos/features/sales/domain/entities/promotion.dart';

part 'cart_state.freezed.dart';

/// Represents a single line item in the cart
@freezed
class CartItem with _$CartItem {
  const factory CartItem({
    required String uuid, // Unique ID for this line item (to distinguish variants)
    required Product product,
    required int quantity,
    required double total, // (price + modifiers) * quantity - discount
    @Default(0.0) double discountedTotal, // New field for display Strikethrough
    @Default([]) List<ModifierItem> modifiers,
    String? note,
    String? appliedPromoCode, // To track which promo hit this item
  }) = _CartItem;
}

@freezed
class CartState with _$CartState {
  const factory CartState({
    @Default([]) List<CartItem> items,
    @Default(0.0) double subtotal,
    @Default(0.0) double tax,
    @Default(0.0) double discount,
    @Default(0.0) double total,
    
    // CRM & Advanced
    Customer? customer,
    @Default(0.0) double discountPercent, 
    @Default(0.0) double discountFixed,
    
    // Promotions
    @Default([]) List<Promotion> activePromotions,
    
    // Dine-In
    String? activeTableUuid,
    String? activeOrderUuid, // Only if retrieving an OPEN order
    
    String? lastOrderNumber,
    OrderTableData? lastCompletedOrder,

    @Default(false) bool isLoading,
    @Default(false) bool isSuccess,
    String? error,
  }) = _CartState;

  factory CartState.initial() => const CartState();
}
