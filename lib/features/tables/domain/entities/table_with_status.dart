import 'package:savvy_pos/core/database/database.dart';

class TableWithStatus {
  final RestaurantTableData table;
  final String orderStatus; // 'NONE', 'ACTIVE', 'BILL_PRINTED'
  final int pax;

  TableWithStatus({
    required this.table,
    this.orderStatus = 'NONE',
    this.pax = 0,
  });
}
