import 'package:savvy_pos/core/database/database.dart';
import 'package:savvy_pos/features/tables/domain/entities/table_with_status.dart';

abstract class ITableRepository {
  Stream<List<TableWithStatus>> watchTables();
  Future<void> addTable(String name, double x, double y);
  Future<void> updateTable(RestaurantTableData table);
  Future<void> deleteTable(String uuid);
  Future<void> setTableOccupied(String tableUuid, bool isOccupied, {String? orderUuid});
  Future<void> mergeTables(String sourceTableUuid, String targetTableUuid);
}
