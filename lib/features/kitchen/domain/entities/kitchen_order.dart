import 'package:savvy_pos/core/database/database.dart';

enum KitchenOrderType {
  dineIn,
  takeaway,
  delivery
}

class KitchenOrder {
  final OrderTableData order;
  final List<KitchenOrderItem> items;
  final String? tableNumber; // Optional, might be fetched separately or joined

  const KitchenOrder({
    required this.order,
    required this.items,
    this.tableNumber,
  });

  // Getters for easy access
  String get uuid => order.uuid;
  String get displayId => order.orderNumber.split('-').last; // e.g. ORD-1234 -> 1234
  DateTime get orderTime => order.transactionDate;

  KitchenOrderType get type {
    // Simple logic: If tableNumber is present -> DineIn. Else Takeaway.
    if (tableNumber != null && tableNumber!.isNotEmpty) {
      return KitchenOrderType.dineIn;
    }
    return KitchenOrderType.takeaway;
  }
}

class KitchenOrderItem {
  final OrderItemTableData item;
  final String productName;
  final List<String> modifiers;

  const KitchenOrderItem({
    required this.item,
    required this.productName,
    this.modifiers = const [],
  });

  double get quantity => item.quantity;
  String? get note => item.note;
}
