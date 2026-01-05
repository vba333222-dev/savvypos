import 'package:savvy_pos/core/database/database.dart';

abstract class ITableRepository {
  Stream<List<RestaurantTableData>> watchTables();
  Future<void> addTable(String name, double x, double y);
  Future<void> updateTable(RestaurantTableData table);
  Future<void> deleteTable(String uuid);
  Future<void> setTableOccupied(String tableUuid, bool isOccupied, {String? orderUuid});
}
