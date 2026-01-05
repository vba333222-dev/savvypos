import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:savvy_pos/features/inventory/domain/entities/product.dart';
import 'package:savvy_pos/features/pos/presentation/bloc/cart/cart_event.dart';
import 'package:savvy_pos/features/pos/presentation/bloc/cart/cart_state.dart';

@injectable
class CartBloc extends Bloc<CartEvent, CartState> {
  // In a real app, inject a UseCase to persist/restore from DB
  // final SaveCartUseCase saveCart;
  // final RestoreCartUseCase restoreCart;

  CartBloc() : super(CartState.initial()) {
    on<_AddProduct>(_onAddProduct);
    on<_UpdateQuantity>(_onUpdateQuantity);
    on<_RemoveFromCart>(_onRemoveFromCart);
    on<_ClearCart>(_onClearCart);
  }

  void _onAddProduct(_AddProduct event, Emitter<CartState> emit) {
    try {
      final existingIndex = state.items.indexWhere((item) => item.product.uuid == event.product.uuid);
      List<CartItem> updatedItems;

      if (existingIndex >= 0) {
        // Increment quantity
        final existingItem = state.items[existingIndex];
        final newQuantity = existingItem.quantity + 1;
        final newItem = existingItem.copyWith(
          quantity: newQuantity,
          total: newQuantity * existingItem.product.price,
        );
        updatedItems = List.from(state.items)..[existingIndex] = newItem;
      } else {
        // Add new item
        updatedItems = List.from(state.items)
          ..add(CartItem(
            product: event.product,
            quantity: 1,
            total: event.product.price,
          ));
      }

      emit(_calculateTotals(updatedItems));
    } catch (e) {
      emit(state.copyWith(error: e.toString()));
    }
  }

  void _onUpdateQuantity(_UpdateQuantity event, Emitter<CartState> emit) {
    if (event.quantity <= 0) {
       add(CartEvent.removeFromCart(event.productUuid));
       return;
    }

    final index = state.items.indexWhere((item) => item.product.uuid == event.productUuid);
    if (index == -1) return;

    final existingItem = state.items[index];
    final newItem = existingItem.copyWith(
      quantity: event.quantity,
      total: event.quantity * existingItem.product.price,
    );

    final updatedItems = List<CartItem>.from(state.items)..[index] = newItem;
    emit(_calculateTotals(updatedItems));
  }

  void _onRemoveFromCart(_RemoveFromCart event, Emitter<CartState> emit) {
    final updatedItems = state.items.where((item) => item.product.uuid != event.productUuid).toList();
    emit(_calculateTotals(updatedItems));
  }

  void _onClearCart(_ClearCart event, Emitter<CartState> emit) {
    emit(CartState.initial());
  }

  CartState _calculateTotals(List<CartItem> items) {
    double subtotal = 0.0;
    for (var item in items) {
      subtotal += item.total;
    }

    // Example tax calculation (e.g., 10%) - should come from TenantConfig
    const taxRate = 0.10;
    final tax = subtotal * taxRate;
    final total = subtotal + tax;

    return state.copyWith(
      items: items,
      subtotal: subtotal,
      tax: tax,
      total: total,
      error: null,
    );
  }
}
