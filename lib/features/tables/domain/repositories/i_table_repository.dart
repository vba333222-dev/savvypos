import 'package:savvy_pos/features/tables/domain/entities/table.dart';
import 'package:savvy_pos/features/tables/domain/entities/zone.dart';

abstract class ITableRepository {
  Stream<List<SavvyTable>> watchTables();
  Stream<List<Zone>> watchZones();

  Future<void> saveZone(Zone zone);
  Future<void> deleteZone(String uuid);

  Future<void> saveTable(SavvyTable table);
  Future<void> deleteTable(String uuid);

  Future<void> setTableOccupied(String tableUuid, bool isOccupied,
      {String? orderUuid});
  Future<void> addTable(String name, double x, double y);
  Future<void> updateTable(SavvyTable table);
  Future<void> transferTable(String sourceUuid, String targetUuid);
  Future<void> mergeTables(String sourceUuid, String targetUuid);

  // BYOD QR Session methods
  Future<void> updateSessionInfo(
      String tableUuid, String? token, String? url, TableSessionStatus status);
}
