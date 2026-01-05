import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';
import 'package:savvy_pos/core/database/database.dart';
import 'package:savvy_pos/features/inventory/domain/entities/product.dart';
import 'package:savvy_pos/features/pos/presentation/bloc/cart/cart_event.dart';
import 'package:savvy_pos/features/pos/presentation/bloc/cart/cart_state.dart';
import 'package:uuid/uuid.dart';

@injectable
class CartBloc extends Bloc<CartEvent, CartState> {
  final AppDatabase db;
  final Uuid _uuid = const Uuid();

  CartBloc(this.db) : super(CartState.initial()) {
    on<_AddProduct>(_onAddProduct);
    on<_UpdateQuantity>(_onUpdateQuantity);
    on<_RemoveFromCart>(_onRemoveFromCart);
    on<_ClearCart>(_onClearCart);
    on<_CheckoutProcessed>(_onCheckoutProcessed);
  }

  void _onAddProduct(_AddProduct event, Emitter<CartState> emit) {
    try {
      final existingIndex = state.items.indexWhere((item) => item.product.uuid == event.product.uuid);
      List<CartItem> updatedItems;

      if (existingIndex >= 0) {
        final existingItem = state.items[existingIndex];
        final newQuantity = existingItem.quantity + 1;
        final newItem = existingItem.copyWith(
          quantity: newQuantity,
          total: newQuantity * existingItem.product.price,
        );
        updatedItems = List.from(state.items)..[existingIndex] = newItem;
      } else {
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

  Future<void> _onCheckoutProcessed(_CheckoutProcessed event, Emitter<CartState> emit) async {
    if (state.items.isEmpty) return;
    
    emit(state.copyWith(isLoading: true, error: null));

    try {
      await db.transaction(() async {
        final orderUuid = _uuid.v4();
        final now = DateTime.now();

        // 1. Create Order
        await db.into(db.orderTable).insert(OrderTableCompanion.insert(
          uuid: orderUuid,
          orderNumber: 'ORD-${now.millisecondsSinceEpoch}', // Simple generation
          tenantId: 'default-tenant', // Should be dynamic
          status: 'COMPLETED',
          paymentStatus: 'PAID',
          subTotal: state.subtotal,
          taxTotal: state.tax,
          discountTotal: state.discount,
          grandTotal: state.total,
          createdAt: now,
          updatedAt: now,
          isSynced: const Value(false),
        ));

        // 2. Create Order Items & Update Inventory
        for (final item in state.items) {
           await db.into(db.orderItemTable).insert(OrderItemTableCompanion.insert(
             uuid: _uuid.v4(),
             orderUuid: orderUuid,
             productUuid: item.product.uuid,
             productName: item.product.name,
             quantity: item.quantity,
             unitPrice: item.product.price,
             totalPrice: item.total,
             createdAt: now,
           ));

           // Update Inventory Ledger (Deduct Stock)
           // CRITICAL: Negative Change
           await db.into(db.inventoryLedgerTable).insert(InventoryLedgerTableCompanion.insert(
             uuid: _uuid.v4(),
             productUuid: item.product.uuid,
             referenceId: orderUuid,
             type: 'SALE',
             quantityChange: -item.quantity, 
             snapshotCost: 0.0, // Should come from product cost
             createdAt: now,
           ));
        }

        // 3. Create Sync Queue Entry
        final payload = {
          'orderUuid': orderUuid,
          'items': state.items.map((e) => {
            'productUuid': e.product.uuid, 
            'quantity': e.quantity
          }).toList(),
          'total': state.total,
        };

        await db.into(db.syncQueue).insert(SyncQueueCompanion.insert(
          actionType: 'CREATE_ORDER',
          payloadJson: jsonEncode(payload),
          idempotencyKey: orderUuid, // Use order UUID as idempotency key
          createdAt: now,
        ));
      });

      // 4. Success & Cleanup
      emit(state.copyWith(isLoading: false, isSuccess: true));
      add(const CartEvent.clearCart());

    } catch (e) {
      emit(state.copyWith(isLoading: false, error: 'Checkout Failed: $e'));
    }
  }

  CartState _calculateTotals(List<CartItem> items) {
    double subtotal = 0.0;
    for (var item in items) {
      subtotal += item.total;
    }

    const taxRate = 0.10;
    final tax = subtotal * taxRate;
    final total = subtotal + tax;

    return state.copyWith(
      items: items,
      subtotal: subtotal,
      tax: tax,
      total: total,
      error: null,
      isSuccess: false, // Reset success on modification
    );
  }
}
