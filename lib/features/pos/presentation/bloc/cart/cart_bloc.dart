import 'dart:async';
import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';
import 'package:savvy_pos/core/database/database.dart';
import 'package:savvy_pos/core/services/socket_service.dart'; // Import SocketService
import 'package:savvy_pos/features/auth/domain/repositories/i_tenant_repository.dart';
import 'package:savvy_pos/features/inventory/domain/entities/product.dart';
import 'package:savvy_pos/features/sales/domain/entities/promotion.dart';
import 'package:savvy_pos/features/pos/presentation/bloc/cart/cart_event.dart';
import 'package:savvy_pos/features/pos/presentation/bloc/cart/cart_state.dart';
import 'package:savvy_pos/features/inventory/domain/entities/modifier.dart';
import 'package:savvy_pos/core/utils/sound_helper.dart';
import 'package:uuid/uuid.dart';
import 'package:savvy_pos/core/sync/sync_worker.dart';

@injectable
class CartBloc extends Bloc<CartEvent, CartState> {
  final AppDatabase db;
  final SoundHelper _sound;
  final SyncWorker _syncWorker; // Injected
  final SocketService _socketService; // Injected
  final ITenantRepository _tenantRepo; // Injected for Multi-Store State Purging
  final Uuid _uuid = const Uuid();
  StreamSubscription? _outletChangeSubscription;

  CartBloc(this.db, this._sound, this._syncWorker, this._socketService, this._tenantRepo) : super(CartState.initial()) {
    // Drop all cart data globally whenever the active branch/store scope switches
    _outletChangeSubscription = _tenantRepo.onOutletChanged.listen((_) {
      add(const CartEvent.clearCart());
    });
    
    on<AddProduct>(_onAddProduct);
    on<UpdateQuantity>(_onUpdateQuantity);
    on<RemoveFromCart>(_onRemoveFromCart);
    on<ClearCart>(_onClearCart);
    on<SelectCustomer>(_onSelectCustomer);
    on<AddPromoCode>(_onAddPromoCode); 
    on<ApplyDiscount>(_onApplyDiscount);
    on<CheckoutProcessed>(_onCheckoutProcessed);
    on<ParkOrder>(_onParkOrder);
    on<RetrieveOrder>(_onRetrieveOrder);
    on<SelectTable>(_onSelectTable);
    on<CheckoutSplit>(_onCheckoutSplit);
    on<UpdateNote>(_onUpdateNote);
    on<ScanItem>(_onScanItem);
    on<ToggleItemHold>(_onToggleItemHold);
    on<FireItem>(_onFireItem);
  }

  @override
  Future<void> close() {
    _outletChangeSubscription?.cancel();
    return super.close();
  }

  Future<void> _onScanItem(ScanItem event, Emitter<CartState> emit) async {
    try {
      // 1. Find Product by SKU or Barcode
      final productRow = await (db.select(db.productTable)
        ..where((t) => t.sku.equals(event.barcode) | t.barcode.equals(event.barcode)))
        .getSingleOrNull();

      if (productRow != null) {
        // Map to Domain Entity
        final product = Product(
          uuid: productRow.uuid,
          name: productRow.name,
          price: productRow.price,
          sku: productRow.sku ?? '',
          categoryId: productRow.categoryId,
          trackStock: productRow.trackStock,
          isService: productRow.isService,
          colorHex: productRow.colorHex,
          imageUrl: productRow.imageUrl,
        );
        
        // 2. Add to Cart
        add(CartEvent.addProduct(product));
        
        // 3. Feedback (Beep) -> Handled in _onAddProduct or here? 
        // _onAddProduct already beeps, so just adding event is enough.
      } else {
        // Product Not Found
        _sound.playError(); // Needs implementation or separate sound
        emit(state.copyWith(error: 'Product not found: ${event.barcode}'));
      }
    } catch (e) {
      emit(state.copyWith(error: 'Scan failed: $e'));
    }
  }

  void _onUpdateNote(UpdateNote event, Emitter<CartState> emit) {
    if (state.items.isEmpty) return;
    
    // Find item and update note
    final updatedItems = state.items.map((item) {
      if (item.product.uuid == event.productUuid) {
        return item.copyWith(note: event.note);
      }
      return item;
    }).toList();
    
    emit(state.copyWith(items: updatedItems));
  }

  void _onToggleItemHold(ToggleItemHold event, Emitter<CartState> emit) {
    final updatedItems = state.items.map((item) {
      if (item.uuid == event.itemUuid) {
        final newStatus = item.firingStatus == FiringStatus.hold
            ? FiringStatus.fired
            : FiringStatus.hold;
        return item.copyWith(firingStatus: newStatus);
      }
      return item;
    }).toList();
    emit(state.copyWith(items: updatedItems));
  }

  void _onFireItem(FireItem event, Emitter<CartState> emit) {
    // 1. Find item and set status to fired
    CartItem? firedItem;
    final updatedItems = state.items.map((item) {
      if (item.uuid == event.itemUuid) {
        firedItem = item.copyWith(firingStatus: FiringStatus.fired);
        return firedItem!;
      }
      return item;
    }).toList();

    if (firedItem != null) {
      // 2. Broadcast purely for Kitchen visualization (KDS)
      _socketService.emit('KDS_ITEM_FIRED', {
        'ticketId': state.activeOrderUuid ?? state.lastOrderNumber ?? 'NEW',
        'itemUuid': firedItem!.uuid,
        'name': firedItem!.product.name,
        'course': firedItem!.courseType.toString(),
      });
      _sound.playBeep(); // Audio feedback for firing
      emit(state.copyWith(items: updatedItems));
    }
  }

  void _onSelectCustomer(SelectCustomer event, Emitter<CartState> emit) {
    emit(state.copyWith(customer: event.customer));
  }

  void _onApplyDiscount(ApplyDiscount event, Emitter<CartState> emit) {
    final newState = state.copyWith(
      discountPercent: event.percent ?? 0.0,
      discountFixed: event.fixed ?? 0.0,
    );
    // Recalculate totals with new discount
    // Recalculate totals with new discount
    emit(_calculateTotals(newState.items, newState));
  }

  void _onClearCart(ClearCart event, Emitter<CartState> emit) {
    emit(CartState.initial());
  }

  // ... (Other handlers unchanged)
  
  void _onAddProduct(AddProduct event, Emitter<CartState> emit) {
    _sound.playBeep();
    
    final existingIndex = state.items.indexWhere((item) => 
        item.product.uuid == event.product.uuid && 
        _areModifiersEqual(item.modifiers, event.modifiers));

    List<CartItem> updatedItems;
    
    if (existingIndex != -1) {
      // Update Quantity
      final existingItem = state.items[existingIndex];
      final newQuantity = existingItem.quantity + 1;
      
      // Recalc Item Total
      final unitPrice = event.product.price + event.modifiers.fold(0.0, (sum, m) => sum + m.priceDelta);
      final newTotal = unitPrice * newQuantity;

      updatedItems = List.from(state.items);
      updatedItems[existingIndex] = existingItem.copyWith(quantity: newQuantity, total: newTotal);
    } else {
      // Add New
      final unitPrice = event.product.price + event.modifiers.fold(0.0, (sum, m) => sum + m.priceDelta);
      updatedItems = List.from(state.items)..add(CartItem(
        uuid: _uuid.v4(),
        product: event.product,
        quantity: 1,
        total: unitPrice,
        modifiers: event.modifiers,
      ));
    }

    emit(_calculateTotals(updatedItems));
  }

  void _onUpdateQuantity(UpdateQuantity event, Emitter<CartState> emit) {
    if (event.quantity <= 0) {
      add(CartEvent.removeFromCart(event.itemUuid));
      return;
    }

    final updatedItems = state.items.map((item) {
      if (item.uuid == event.itemUuid) {
        // Recalc Total
        final unitPrice = item.product.price + item.modifiers.fold(0.0, (sum, m) => sum + m.priceDelta);
        return item.copyWith(
          quantity: event.quantity,
          total: unitPrice * event.quantity,
        );
      }
      return item;
    }).toList();

    emit(_calculateTotals(updatedItems));
  }

  void _onRemoveFromCart(RemoveFromCart event, Emitter<CartState> emit) {
    final updatedItems = state.items.where((item) => item.uuid != event.itemUuid).toList();
    emit(_calculateTotals(updatedItems));
  }

  bool _areModifiersEqual(List<ModifierItem> a, List<ModifierItem> b) {
    if (a.length != b.length) return false;
    // Simple check: Sort by UUID and match? Or just containsAll?
    final aIds = a.map((e) => e.uuid).toSet();
    final bIds = b.map((e) => e.uuid).toSet();
    return aIds.containsAll(bIds) && bIds.containsAll(aIds);
  }

  Future<void> _onCheckoutProcessed(CheckoutProcessed event, Emitter<CartState> emit) async {
    if (state.items.isEmpty) return;
    
    emit(state.copyWith(isLoading: true, error: null));

    try {
      final orderUuid = _uuid.v4();
      final now = DateTime.now();
      final orderNumber = 'ORD-${now.millisecondsSinceEpoch}';

      await db.transaction(() async {

        // 1. Create Order
        await db.into(db.orderTable).insert(OrderTableCompanion.insert(
          uuid: orderUuid,
          orderNumber: orderNumber,
          tenantId: const Value('default-tenant'), 
          status: const Value('COMPLETED'),
          paymentStatus: const Value('PAID'),
          subtotal: state.subtotal,
          taxTotal: state.tax,
          discountTotal: state.discount,
          grandTotal: state.total,
          customerUuid: Value(state.customer?.uuid),
          
          paymentMethod: Value(event.paymentMethod),
          tenderedAmount: Value(event.tenderedAmount),
          changeAmount: Value(event.changeAmount),
          
          transactionDate: now,
          isSynced: const Value(false),
        ));

        // 2. Create Order Items & Update Inventory
        for (final item in state.items) {
           await db.into(db.orderItemTable).insert(OrderItemTableCompanion.insert(
             // uuid: _uuid.v4(), // Auto-increment ID
             orderUuid: orderUuid,
             productUuid: item.product.uuid,
             name: item.product.name,
             price: item.product.price,
             quantity: item.quantity.toDouble(),
             total: item.total,
             modifiersJson: Value(jsonEncode(item.modifiers.map((e) => e.toJson()).toList())),
             updatedAt: Value(now),
           ));

           if (item.product.isComposite) {
              // Deduct Ingredients
              final recipeItems = await (db.select(db.recipeTable)..where((r) => r.productUuid.equals(item.product.uuid))).get();
              for (final r in recipeItems) {
                 final qtyToDeduct = r.quantityRequired * item.quantity;
                 
                 final ingredient = await (db.select(db.ingredientTable)..where((i) => i.uuid.equals(r.ingredientUuid))).getSingleOrNull();
                 if (ingredient != null) {
                    await (db.update(db.ingredientTable)..where((i) => i.uuid.equals(ingredient.uuid))).write(
                       IngredientTableCompanion(
                          currentStock: Value(ingredient.currentStock - qtyToDeduct)
                       )
                    );
                 }
              }
           } else {
             // Deduct Product Stock via Ledger
             await db.into(db.inventoryLedgerTable).insert(InventoryLedgerTableCompanion.insert(
               // uuid: _uuid.v4(), // Auto-increment
               productUuid: item.product.uuid,
               referenceId: orderUuid,
               type: 'SALE',
               quantityChange: -item.quantity.toDouble(), 
               timestamp: now,
             ));
           }
        }

        // 3. Create Sync Queue Entry
        final payload = {
          'orderUuid': orderUuid,
          'customerUuid': state.customer?.uuid,
          'paymentMethod': event.paymentMethod,
          'items': state.items.map((e) => {
            'productUuid': e.product.uuid, 
            'quantity': e.quantity
          }).toList(),
          'subtotal': state.subtotal,
          'discount': state.discount,
          'total': state.total,
        };

        await db.into(db.syncQueue).insert(SyncQueueCompanion.insert(
          actionType: 'CREATE_ORDER',
          payloadJson: jsonEncode(payload),
          idempotencyKey: orderUuid, 
          createdAt: now,
        ));
      });

      // 4. Success & Cleanup
      final completedOrder = OrderTableData(
        id: 0, // Placeholder
        uuid: orderUuid,
        orderNumber: orderNumber,
        tenantId: 'default-tenant', 
        status: 'COMPLETED',
        paymentStatus: 'PAID',
        subtotal: state.subtotal,
        taxTotal: state.tax,
        discountTotal: state.discount,
        grandTotal: state.total,
        customerUuid: state.customer?.uuid,
        paymentMethod: event.paymentMethod,
        tenderedAmount: event.tenderedAmount,
        changeAmount: event.changeAmount,
        transactionDate: now,
        isSynced: false,
        syncAttempts: 0,
        isFulfilled: false,
        version: 1,
        updatedAt: now,
      );

      emit(state.copyWith(
        isLoading: false, 
        isSuccess: true, 
        lastOrderNumber: orderNumber,
        lastCompletedOrder: completedOrder
      ));
      
      // Trigger Background Sync Immediately
      _syncWorker.sync();
      
      add(const CartEvent.clearCart());

    } catch (e) {
      emit(state.copyWith(isLoading: false, error: 'Checkout Failed: $e'));
    }
  }

  void _onAddPromoCode(AddPromoCode event, Emitter<CartState> emit) {
    // MVP: Mock Promo lookup - In real app, verify against repo or backend
    Promotion? foundPromo;
    
    // Demo Logic
    final code = event.code.toUpperCase();
    if (code == 'SUMMER10') {
      foundPromo = const Promotion.percentage(
        id: 'promo-001', 
        name: 'Summer Sale', 
        code: 'SUMMER10', 
        percentage: 10,
      );
    } else if (code == 'MINUS5') {
       foundPromo = const Promotion.fixedAmount(
         id: 'promo-002', 
         name: '\$5 OFF', 
         code: 'MINUS5', 
         amount: 5.0,
         constraints: PromotionConstraints(minPurchaseAmount: 20.0),
       );
    } else if (code == 'BOGO') {
       foundPromo = const Promotion.buyXGetY(
         id: 'promo-003',
         name: 'Buy 1 Get 1',
         code: 'BOGO',
         buyQty: 1,
         getQty: 1,
         buyProductId: 'ANY', 
       );
    }

    if (foundPromo != null) {
      if (foundPromo.isValidNow() && foundPromo.meetsMinPurchase(state.subtotal)) {
         final currentPromos = List<Promotion>.from(state.activePromotions);
         // Avoid duplicates
         if (!currentPromos.any((p) => p.code == foundPromo!.code)) {
            currentPromos.add(foundPromo);
            emit(_calculateTotals(state.items, state.copyWith(activePromotions: currentPromos)));
         } else {
            emit(state.copyWith(error: 'Promotion already applied'));
         }
      } else {
         emit(state.copyWith(error: 'Conditions not met for ${foundPromo.name}'));
      }
    } else {
      emit(state.copyWith(error: 'Invalid Promo Code'));
    }
  }

  Future<void> _onParkOrder(ParkOrder event, Emitter<CartState> emit) async {
    if (state.items.isEmpty) return;
    emit(state.copyWith(isLoading: true, error: null));

    try {
      await db.transaction(() async {
        final now = DateTime.now();
        // Use existing UUID if updating, else new
        final orderUuid = state.activeOrderUuid ?? _uuid.v4();
        final orderNumber = state.lastOrderNumber ?? 'ORD-${now.millisecondsSinceEpoch}';

        // 1. Upsert Order (Status = OPEN)
        await db.into(db.orderTable).insertOnConflictUpdate(OrderTableCompanion.insert(
          uuid: orderUuid,
          orderNumber: orderNumber,
          tenantId: const Value('default-tenant'),
          status: const Value('OPEN'), // OPEN status
          paymentStatus: const Value('PENDING'),
          subtotal: state.subtotal,
          taxTotal: state.tax,
          discountTotal: state.discount,
          grandTotal: state.total,
          customerUuid: Value(state.customer?.uuid),
          paymentMethod: const Value('PENDING'),
          transactionDate: now,
          isSynced: const Value(false),
        ));

        // 2. Delete existing items if updating to avoid duplicates (Simpler than diffing)
        await (db.delete(db.orderItemTable)..where((t) => t.orderUuid.equals(orderUuid))).go();

        // 3. Insert Items
        for (final item in state.items) {
            await db.into(db.orderItemTable).insert(OrderItemTableCompanion.insert(
              // uuid: _uuid.v4(), // Removed as per schema
              orderUuid: orderUuid,
              productUuid: item.product.uuid,
              name: item.product.name,
              price: item.product.price,
              quantity: item.quantity.toDouble(), // Fixed int -> double
              total: item.total,
              modifiersJson: Value(jsonEncode(item.modifiers.map((e) => e.toJson()).toList())),
              updatedAt: Value(now),
            ));
        }
        
        // 4. Update Table Status
        await (db.update(db.restaurantTable)..where((t) => t.uuid.equals(event.tableUuid))).write(
          RestaurantTableCompanion(
            isOccupied: const Value(true),
            currentOrderUuid: Value(orderUuid),
            updatedAt: Value(now),
          ),
        );
      });

      emit(CartState.initial().copyWith(isSuccess: true, lastOrderNumber: 'Parked'));
    } catch (e) {
      emit(state.copyWith(isLoading: false, error: 'Park Failed: $e'));
    }
  }

  void _onSelectTable(SelectTable event, Emitter<CartState> emit) {
    if (state.items.isNotEmpty && state.activeOrderUuid != null) {
      // If valid order is in progress, maybe prompt? 
      // User says: "Tapping a table should navigate to PosPage passing tableId"
      // Assuming new clean order for that table if not retrieving.
    }
    // We clear current context if moving to a new table (unless we support multi-tab logic, unlikely needed yet)
    // Wait, if we select a table that is empty (Green), we want to start a new order for it.
    // If we have items in cart currently, they might belong to "Walk-in".
    // MVP: Just switch table context.
    emit(state.copyWith(
      activeTableUuid: event.tableUuid, 
      activeOrderUuid: null, 
      customer: null,
      lastCompletedOrder: null,
      items: [], // Clear items? Yes, new table = new cart.
      subtotal: 0, tax: 0, discount: 0, total: 0
    ));
  }

  Future<void> _onRetrieveOrder(RetrieveOrder event, Emitter<CartState> emit) async {
    emit(state.copyWith(isLoading: true));
    try {
      // 1. Fetch Order
      final order = await (db.select(db.orderTable)..where((t) => t.uuid.equals(event.orderUuid))).getSingle();
      
      // 2. Fetch Items & Join with Product to get full details
      final query = db.select(db.orderItemTable).join([
        innerJoin(db.productTable, db.productTable.uuid.equalsExp(db.orderItemTable.productUuid))
      ])..where(db.orderItemTable.orderUuid.equals(event.orderUuid));

      final rows = await query.get();
      
      final cartItems = rows.map((row) {
        final productRow = row.readTable(db.productTable);
        final itemRow = row.readTable(db.orderItemTable);
        
        final product = Product(
          uuid: productRow.uuid,
          name: productRow.name,
          price: productRow.price,
          sku: productRow.sku ?? '',
          categoryId: productRow.categoryId,
          trackStock: productRow.trackStock,
          isService: productRow.isService,
          colorHex: productRow.colorHex,
          imageUrl: productRow.imageUrl,
        );

        return CartItem(
          uuid: _uuid.v4(), // Generate temporary UUID for cart item
          product: product,
          quantity: itemRow.quantity.toInt(),
          total: itemRow.total,
        );
      }).toList();

      // 3. Fetch Customer if exists
      if (order.customerUuid != null) {
         // fetch customer logic if needed, skipped for brevity or assume simple load
      }

      // 4. Update State
      final newState = state.copyWith(
        activeTableUuid: event.tableUuid,
        activeOrderUuid: event.orderUuid,
        lastOrderNumber: order.orderNumber,
        items: cartItems,
         // Load discount/customer if stored in OrderTable
         discountFixed: order.discountTotal, 
         // Note: We handled fixed discount in total but retrieving percent might be lost if we only stored total.
         // Assuming fixed for now.
      );
      
      emit(_calculateTotals(cartItems, newState).copyWith(isLoading: false));
      
    } catch (e) {
      emit(state.copyWith(isLoading: false, error: 'Retrieve Failed: $e'));
    }
  }

  Future<void> _onCheckoutSplit(CheckoutSplit event, Emitter<CartState> emit) async {
    // Logic: Create child order, update parent order items (paidQty)
    // 1. Validate we have an active order
    if (state.activeOrderUuid == null) {
      emit(state.copyWith(error: 'No active order to split'));
      return;
    }
    
    // Get items from current state by UUIDs
    final splitItems = state.items.where((i) => event.itemUuids.contains(i.uuid)).toList();
    if (splitItems.isEmpty) {
      emit(state.copyWith(error: 'No items selected for split'));
      return;
    }
    
    emit(state.copyWith(isLoading: true));
    
    try {
      await db.transaction(() async {
        final now = DateTime.now();
        final childOrderUuid = _uuid.v4();
        final childOrderNumber = 'SPLIT-${now.millisecondsSinceEpoch}';
        
        // Calculate totals for split items
        double subtotal = 0;
        for (var item in splitItems) {
          subtotal += item.total;
        }
        final tax = subtotal * 0.10;
        final total = subtotal + tax; // ignoring discount logic for split for simplicity MVP
        
        // 1. Create Child Order (Paid)
        await db.into(db.orderTable).insert(OrderTableCompanion.insert(
          uuid: childOrderUuid,
          orderNumber: childOrderNumber,
          tenantId: const Value('default-tenant'),
          status: const Value('COMPLETED'),
          paymentStatus: const Value('PAID'), // Immediate Pay
          subtotal: subtotal,
          taxTotal: tax,
          discountTotal: 0.0, // Fixed Value -> double
          grandTotal: total,
          customerUuid: Value(state.customer?.uuid),
          paymentMethod: Value(event.paymentMethod),
          tenderedAmount: Value(total),
          changeAmount: const Value(0.0), // Fixed int -> double
          transactionDate: now,
          isSynced: const Value(false),
        ));
        
        // 2. Create Order Items for Child Order
        for (var item in splitItems) {
           await db.into(db.orderItemTable).insert(OrderItemTableCompanion.insert(
             // uuid: _uuid.v4(), // Removed
             orderUuid: childOrderUuid,
             productUuid: item.product.uuid,
             name: item.product.name,
             price: item.product.price,
             quantity: item.quantity.toDouble(),
             total: item.total,
             updatedAt: Value(now),
           ));
        }

        // 3. Update Parent Order Items (Increment paidQty)
        // We need to match items by Product UUID or existing Item UUID?
        // CartItem doesn't store ItemUUID (it should, but we map from rows).
        // Let's assume Product UUID uniqueness within order or re-fetch.
        // For MVP, we iterate parent items and update.
        for (var splitItem in splitItems) {
           // Find matching item in DB for activeOrderUuid
           final parentItem = await (db.select(db.orderItemTable)
             ..where((t) => t.orderUuid.equals(state.activeOrderUuid!) & t.productUuid.equals(splitItem.product.uuid)))
             .getSingle();
           
           await (db.update(db.orderItemTable)..where((t) => t.id.equals(parentItem.id))).write(
             OrderItemTableCompanion(
               paidQty: Value(parentItem.paidQty + splitItem.quantity),
             ),
           );
        }
        
        // 4. Check if Parent Order is Fully Paid
        // Fetch all items
        final allItems = await (db.select(db.orderItemTable)..where((t) => t.orderUuid.equals(state.activeOrderUuid!))).get();
        bool allPaid = true;
        for (var item in allItems) {
          if (item.paidQty < item.quantity) {
             allPaid = false;
             break;
          }
        }
        
        if (allPaid) {
          // Close Parent, Release Table
          await (db.update(db.orderTable)..where((t) => t.uuid.equals(state.activeOrderUuid!))).write(
            const OrderTableCompanion(
              status: Value('COMPLETED'),
              paymentStatus: Value('PAID'),
            ),
          );
          
          if (state.activeTableUuid != null) {
            await (db.update(db.restaurantTable)..where((t) => t.uuid.equals(state.activeTableUuid!))).write(
              const RestaurantTableCompanion(
                isOccupied: Value(false),
                currentOrderUuid: Value(null),
              ),
            );
          }
          
          // Clear Cart
          emit(CartState.initial().copyWith(isSuccess: true, lastOrderNumber: childOrderNumber)); // Done
        } else {
          // Partially Paid - Keep Cart Open but refresh items to show remaining?
          // Or just clear Split selection?
          // For now, allow continuing.
           emit(state.copyWith(isLoading: false, isSuccess: true, lastOrderNumber: childOrderNumber));
           // Actually we should reload the cart to reflect 'PaidQty' visually if we tracked it in UI?
           // UI doesn't track paidQty yet.
           // MVP: Just Emit Success.
        }
      });
    } catch (e) {
      emit(state.copyWith(isLoading: false, error: 'Split Failed: $e'));
    }
  }

  // Refactored to accept state context or just use current state properties? 
  // Better to pass the "target" state properties if we are modifying them before calculation.
  // Or just modify the "items" and use state.discountPercent.
  CartState _calculateTotals(List<CartItem> items, [CartState? currentState]) {
    final s = currentState ?? state;
    
    // 1. Calculate Base Item Totals (Price * Qty + Modifiers)
    List<CartItem> calculatedItems = items.map((item) {
       final unitPrice = item.product.price + item.modifiers.fold(0.0, (sum, m) => sum + m.priceDelta);
       final baseTotal = unitPrice * item.quantity;
       return item.copyWith(
         total: baseTotal,
         discountedTotal: baseTotal, // Default to base, promo will reduce this
         appliedPromoCode: null,
       );
    }).toList();

    // 2. Calculate Promotions (Modifies calculatedItems and returns discount info)
    final promoResult = _calculatePromotions(calculatedItems, s.activePromotions);
    calculatedItems = promoResult.items;
    
    // Sums
    double subtotal = 0.0; // Original Price
    double discountedSubtotal = 0.0; // Price AFTER Item Promos
    
    for (var item in calculatedItems) {
      subtotal += item.total;
      discountedSubtotal += item.discountedTotal;
    }

    // 3. Apply Manual/Cart-Level Discounts
    double manualDiscountVal = 0.0;
    
    if (s.discountPercent > 0) {
      manualDiscountVal += discountedSubtotal * (s.discountPercent / 100);
    } 
    manualDiscountVal += s.discountFixed;
    
    // Cap manual discount
    if (manualDiscountVal > discountedSubtotal) manualDiscountVal = discountedSubtotal;

    final taxableAmount = discountedSubtotal - manualDiscountVal;
    
    // Total Discount = (Original - DiscountedSubtotal) + ManualDiscount
    final totalPromoDiscount = subtotal - discountedSubtotal;
    final totalDiscount = totalPromoDiscount + manualDiscountVal;

    const taxRate = 0.10;
    final tax = taxableAmount * taxRate;
    final total = taxableAmount + tax;

    final newState = s.copyWith(
      items: calculatedItems,
      subtotal: subtotal, 
      discount: totalDiscount,
      tax: tax,
      total: total,
      error: null,
      isSuccess: false, 
    );
    
    // CDS BROADCAST
    if (newState.items.isNotEmpty) {
      _broadcastCartUpdate(newState);
    } else {
      _socketService.emit('CDS_IDLE', {});
    }
    
    return newState;
  }

  void _broadcastCartUpdate(CartState s) {
    // Basic debounce logic could be added here in real impl
    _socketService.emit('CDS_UPDATE_CART', {
      'items': s.items.map((i) => {
        'name': i.product.name,
        'qty': i.quantity,
        'price': i.total,
        'modifier': i.modifiers.map((m) => m.name).join(', ')
      }).toList(),
      'total': s.total,
      'tax': s.tax
    });
  }

  ({List<CartItem> items}) _calculatePromotions(List<CartItem> items, List<Promotion> promotions) {
    if (promotions.isEmpty) return (items: items);

    List<CartItem> tempItems = List.from(items);

    // Sort promos by priority if needed? For now, insertion order.
    for (var promo in promotions) {
      if (!promo.isValidNow()) continue;

      tempItems = promo.map(
        percentage: (p) => _applyPercentage(tempItems, p),
        fixedAmount: (p) => tempItems, // Fixed Amount usually Cart Level. Skipping item distribution for MVP.
        buyXGetY: (p) => _applyBuyXGetY(tempItems, p),
      );
    }
    return (items: tempItems);
  }

  List<CartItem> _applyPercentage(List<CartItem> items, PercentageDiscount promo) {
    return items.map((item) {
      // Check if product is applicable
      if (promo.constraints.applicableProductIds == null || 
          promo.constraints.applicableProductIds!.isEmpty ||
          promo.constraints.applicableProductIds!.contains(item.product.uuid)) {
            
        // Apply % off current discounted total (Stacking?)
        final currentPrice = item.discountedTotal;
        final discountAmount = currentPrice * (promo.percentage / 100);
        
        return item.copyWith(
          discountedTotal: currentPrice - discountAmount,
          appliedPromoCode: promo.code,
        );
      }
      return item;
    }).toList();
  }

  List<CartItem> _applyBuyXGetY(List<CartItem> items, BuyXGetYPromotion promo) {
    // MVP Assumption: Same Product (BOGO) and promo.buyProductId == 'ANY' or match.
    return items.map((item) {
      bool isMatch = false;
      if (promo.buyProductId == 'ANY') {
        isMatch = true;
      } else if (promo.buyProductId == item.product.uuid) {
        isMatch = true;
      }
      
      if (isMatch) {
        // sets = quantity / (buy + get)
        final totalSetSize = promo.buyQty + promo.getQty;
        // Integer division
        if (totalSetSize == 0) return item; // Safety
        
        final sets = (item.quantity / totalSetSize).floor();
        
        if (sets > 0) {
           final freeQty = sets * promo.getQty;
           
           // Calculate deduction based on average unit price of this item line
           final unitPrice = item.total / item.quantity; 
           final deduction = unitPrice * freeQty;
           
           return item.copyWith(
             discountedTotal: item.discountedTotal - deduction,
             appliedPromoCode: promo.code,
           );
        }
      }
      return item;
    }).toList();
  }
}
