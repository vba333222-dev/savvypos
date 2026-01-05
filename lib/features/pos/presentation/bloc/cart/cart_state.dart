import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:savvy_pos/features/inventory/domain/entities/product.dart';

part 'cart_state.freezed.dart';

/// Represents a single line item in the cart
@freezed
class CartItem with _$CartItem {
  const factory CartItem({
    required Product product,
    required int quantity,
    required double total, // price * quantity - discount
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
    @Default(false) bool isLoading,
    @Default(false) bool isSuccess,
    String? error,
  }) = _CartState;

  factory CartState.initial() => const CartState();
}
