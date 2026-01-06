import 'package:savvy_pos/core/database/database.dart';

class KitchenOrder {
  final OrderTableData order;
  final List<OrderItemTableData> items;

  const KitchenOrder({
    required this.order,
    required this.items,
  });
}
