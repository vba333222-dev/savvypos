import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:savvy_pos/core/database/database.dart';
import 'package:savvy_pos/core/hal/printer_router.dart';
import 'package:savvy_pos/features/delivery/domain/entities/delivery_order.dart';
import 'package:savvy_pos/features/delivery/domain/entities/delivery_status.dart';
import 'package:savvy_pos/features/delivery/presentation/bloc/delivery_management_bloc.dart';
import 'package:savvy_pos/features/delivery/presentation/bloc/delivery_management_state.dart';
import 'package:savvy_pos/features/inventory/domain/entities/product.dart';
import 'package:savvy_pos/features/pos/presentation/bloc/cart/cart_state.dart';
import 'package:uuid/uuid.dart';

@singleton
class DeliveryOrchestratorService {
  final DeliveryManagementBloc _deliveryBloc;
  final PrinterRouter _printerRouter;
  final AppDatabase _db;
  final Logger _logger = Logger();

  StreamSubscription? _subscription;
  // Keep track of what we've printed so we don't duplicate on state rebuilds
  final Set<String> _processedOrders = {};

  DeliveryOrchestratorService(
      this._deliveryBloc, this._printerRouter, this._db) {
    _init();
  }

  void _init() {
    _logger.i('DeliveryOrchestratorService: Starting Background Daemon...');
    _subscription = _deliveryBloc.stream.listen(_onDeliveryStateChanged);
  }

  Future<void> _onDeliveryStateChanged(DeliveryManagementState state) async {
    // Look for freshly accepted orders
    final newlyAccepted = state.activeOrders
        .where((order) =>
            order.status == DeliveryStatus.accepted &&
            !_processedOrders.contains(order.deliveryUuid))
        .toList();

    for (final order in newlyAccepted) {
      _processedOrders.add(order.deliveryUuid);
      _logger.i(
          'DeliveryOrchestratorService: Offloading print processing for ${order.externalOrderId} to background Isolate.');

      // Fire and forget so we don't stick the listener pipeline
      _offloadToIsolate(order).catchError((e) {
        _logger.e(
            'Delivery Orchestrator Isolate Crash on order ${order.externalOrderId}',
            error: e);
        _processedOrders
            .remove(order.deliveryUuid); // allow retry if failed maybe?
      });
    }
  }

  Future<void> _offloadToIsolate(DeliveryOrder order) async {
    // 1. We must fetch the actual generic Order Items from DB because `DeliveryOrder`
    // often just holds metadata or a raw JSON we don't want to parse heavily on Main thread.
    // Fetch items from DB (Main thread SQLite access is usually fast enough, or we can isolate it)
    final items = await (_db.select(_db.orderItemTable)
          ..where((t) => t.orderUuid.equals(order.deliveryUuid)))
        .get();

    // 2. Map to CartItems using `compute` to avoid blocking UI during heavy mapping
    // CartItem requires `Product`, so we need mock/dummy products if we only have DB names.
    final cartItems = await compute(_mapDbItemsToCartItems, items);

    if (cartItems.isEmpty) {
      _logger.w(
          'DeliveryOrchestratorService: Order ${order.externalOrderId} has no items to print.');
      return;
    }

    // 3. Dispatch Background Print
    await _printerRouter.routeAndPrint(
      order.externalOrderId,
      cartItems,
      table:
          'Takeaway - ${order.channel.name.toUpperCase()}', // Tells KDS/Printer it's a delivery
    );
    _logger.i(
        'DeliveryOrchestratorService: Background print dispatched for ${order.externalOrderId}.');
  }

  @disposeMethod
  void dispose() {
    _subscription?.cancel();
    _processedOrders.clear();
  }
}

// ── ISOLATE TOP-LEVEL HELPER ──
// This runs on a separate thread. Cannot access outer scope variables.
List<CartItem> _mapDbItemsToCartItems(List<OrderItemTableData> dbItems) {
  const uuidGen = Uuid();
  // Heavy object mapping simulation
  return dbItems.map((item) {
    return CartItem(
      uuid: uuidGen.v4(),
      product: Product(
        uuid: item.productUuid,
        name: item.name,
        price: item.price,
        categoryId: 'cat', // Dummy
        printerCategory: 'FOOD', // Force route to kitchen
        isService: false,
        trackStock: false,
      ),
      quantity: item.quantity.toInt(),
      note: item.note,
      total: item.total,
    );
  }).toList();
}
