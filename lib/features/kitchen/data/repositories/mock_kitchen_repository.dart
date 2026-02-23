import 'package:savvy_pos/core/utils/time_helper.dart';
import 'dart:async';
import 'dart:math';
import 'package:injectable/injectable.dart';
import 'package:uuid/uuid.dart';
import 'package:savvy_pos/core/database/database.dart';
import 'package:savvy_pos/features/kitchen/domain/entities/kitchen_order.dart';
import 'package:savvy_pos/features/kitchen/domain/repositories/i_kitchen_repository.dart';

@LazySingleton(as: IKitchenRepository, env: [Environment.dev])
class MockKitchenRepository implements IKitchenRepository {
  final _controller = StreamController<List<KitchenOrder>>.broadcast();
  final List<KitchenOrder> _currentOrders = [];

  final Uuid _uuid = const Uuid();
  final Random _rnd = Random();

  MockKitchenRepository() {
    _startSimulation();
  }

  void _startSimulation() {
    // Initial Load
    _addMockOrder(age: const Duration(minutes: 16)); // Critical
    _addMockOrder(age: const Duration(minutes: 8)); // Warning
    _addMockOrder(age: const Duration(minutes: 2)); // Fresh
    _emit();

    // Stream inputs every 30s
    Timer.periodic(const Duration(seconds: 30), (timer) {
      if (_currentOrders.length < 15) {
        // Cap at 15 to avoid chaos
        _addMockOrder();
        _emit();
      }
    });

    // Simulate "cooking" / removing old ones randomly? No, let user bump them.
  }

  void _emit() {
    _controller.add(List.from(
        _currentOrders.reversed)); // Newest first for list, or Oldest first?
    // Usually KDS sorts by Urgency (Oldest first).
    // If we want "Slide IN from Left" and "Push existing Right", then Newest should be at index 0?
    // Let's stick to: Index 0 is Newest (Leftmost). Oldest at end.
    // Wait, KDS usually prioritizes Oldest (Red ones).
    // If using Masonry, usually Top-Left is item 0.
    // If we want Newest to appear on "The Wall" (e.g. at the end or at the start).
    // Let's go with: Oldest First (Top Left). New tickets arrive at the end.
    // So "Slide In" might mean appending to list.
    // Let's sort by date ASC (Oldest first).
    _currentOrders.sort((a, b) => a.orderTime.compareTo(b.orderTime));
    _controller.add(_currentOrders);
  }

  void _addMockOrder({Duration age = Duration.zero}) {
    final id = _uuid.v4();
    final now = TimeHelper.now().subtract(age);
    final isDineIn = _rnd.nextBool();

    final order = OrderTableData(
      id: 0,
      uuid: id,
      orderNumber: 'ORD-${_rnd.nextInt(9999)}',
      grandTotal: 0.0,
      subtotal: 0.0,
      taxTotal: 0.0,
      discountTotal: 0.0,
      status: 'CONFIRMED',
      paymentStatus: 'PAID',
      paymentMethod: 'CASH',
      isFulfilled: false,
      isSynced: false,
      syncAttempts: 0,
      transactionDate: now,
      version: 1,
      updatedAt: now,
    );

    final itemNames = [
      'Burger',
      'Fries',
      'Cola',
      'Pizza',
      'Salad',
      'Coffee',
      'Cake'
    ];
    final items = List.generate(_rnd.nextInt(4) + 1, (i) {
      return KitchenOrderItem(
        item: OrderItemTableData(
          id: 0,
          orderUuid: id,
          productUuid: 'prod-mock',
          name: itemNames[_rnd.nextInt(itemNames.length)],
          quantity: (_rnd.nextInt(2) + 1).toDouble(),
          price: 10.0,
          paidQty: 0.0,
          total: 10.0,
          note: _rnd.nextBool() ? 'No onions' : null,
          updatedAt: now,
        ),
        productName: itemNames[_rnd.nextInt(itemNames.length)],
        modifiers: _rnd.nextBool() ? ['Extra cheese', 'Spicy'] : [],
      );
    });

    _currentOrders.add(KitchenOrder(
      order: order,
      items: items,
      tableNumber: isDineIn ? '${_rnd.nextInt(20) + 1}' : null,
    ));
  }

  @override
  Stream<List<KitchenOrder>> getActiveKitchenOrders() {
    return _controller.stream;
  }

  @override
  Future<void> markOrderFulfilled(String orderUuid) async {
    _currentOrders.removeWhere((o) => o.uuid == orderUuid);
    _emit();
  }

  @override
  Future<void> markItemFulfilled(String itemUuid) async {
    // Mock: no-op (item-level tracking not modeled in mock orders)
  }

  @override
  Future<void> markOrderStarted(String orderUuid) async {
    // Mock: no-op (order starts immediately in sim)
  }
}
