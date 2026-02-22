import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';
import 'package:savvy_pos/core/database/database.dart';
import 'package:savvy_pos/features/tables/domain/entities/table.dart';
import 'package:savvy_pos/features/tables/domain/entities/zone.dart';
import 'package:savvy_pos/features/tables/domain/repositories/i_table_repository.dart';
import 'package:uuid/uuid.dart';

@LazySingleton(as: ITableRepository)
class TableRepositoryImpl implements ITableRepository {
  final AppDatabase _db;
  final Uuid _uuid = const Uuid();

  TableRepositoryImpl(this._db);

  @override
  Stream<List<Zone>> watchZones() {
    return (_db.select(_db.zoneTable)..where((t) => t.isDeleted.equals(false)))
        .watch()
        .map((rows) {
      return rows.map((row) {
        return Zone(
          id: row.uuid,
          name: row.name,
          width: row.width,
          height: row.height,
        );
      }).toList();
    });
  }

  @override
  Stream<List<SavvyTable>> watchTables() {
    return (_db.select(_db.restaurantTable)
          ..where((t) => t.isDeleted.equals(false)))
        .watch()
        .map((rows) {
      return rows.map((row) {
        return SavvyTable(
          id: row.uuid,
          name: row.name,
          zoneId: row.zoneUuid,
          x: row.x,
          y: row.y,
          width: row.width,
          height: row.height,
          rotation: row.rotation,
          shape: row.shape == 'round' ? TableShape.round : TableShape.rectangle,
          capacity: row.capacity,
          isOccupied: row.isOccupied,
          currentOrderUuid: row.currentOrderUuid,
          currentSessionToken: row.currentSessionToken,
          qrCodeUrl: row.qrCodeUrl,
          sessionStatus: TableSessionStatus.values.firstWhere(
            (e) => e.name == row.sessionStatus,
            orElse: () => TableSessionStatus.locked,
          ),
        );
      }).toList();
    });
  }

  @override
  Future<void> saveZone(Zone zone) async {
    // Check if exists
    final exists = await (_db.select(_db.zoneTable)
          ..where((t) => t.uuid.equals(zone.id)))
        .getSingleOrNull();

    if (exists != null) {
      await (_db.update(_db.zoneTable)..where((t) => t.uuid.equals(zone.id)))
          .write(
        ZoneTableCompanion(
          name: Value(zone.name),
          width: Value(zone.width),
          height: Value(zone.height),
          updatedAt: Value(DateTime.now()),
        ),
      );
    } else {
      await _db.into(_db.zoneTable).insert(
            ZoneTableCompanion.insert(
              uuid: zone.id.isEmpty ? _uuid.v4() : zone.id,
              name: zone.name,
              width: Value(zone.width),
              height: Value(zone.height),
              updatedAt: DateTime.now(),
            ),
          );
    }
  }

  @override
  Future<void> deleteZone(String uuid) async {
    await (_db.update(_db.zoneTable)..where((t) => t.uuid.equals(uuid))).write(
      ZoneTableCompanion(
        isDeleted: const Value(true),
        updatedAt: Value(DateTime.now()),
      ),
    );
  }

  @override
  Future<void> saveTable(SavvyTable table) async {
    final exists = await (_db.select(_db.restaurantTable)
          ..where((t) => t.uuid.equals(table.id)))
        .getSingleOrNull();

    if (exists != null) {
      await (_db.update(_db.restaurantTable)
            ..where((t) => t.uuid.equals(table.id)))
          .write(
        RestaurantTableCompanion(
          name: Value(table.name),
          zoneUuid: Value(table.zoneId),
          x: Value(table.x),
          y: Value(table.y),
          width: Value(table.width),
          height: Value(table.height),
          rotation: Value(table.rotation),
          shape: Value(table.shape == TableShape.round ? 'round' : 'rectangle'),
          capacity: Value(table.capacity),
          updatedAt: Value(DateTime.now()),
        ),
      );
    } else {
      await _db.into(_db.restaurantTable).insert(
            RestaurantTableCompanion.insert(
              uuid: table.id.isEmpty ? _uuid.v4() : table.id,
              name: table.name,
              zoneUuid: Value(table.zoneId),
              x: Value(table.x),
              y: Value(table.y),
              width: Value(table.width),
              height: Value(table.height),
              rotation: Value(table.rotation),
              shape: Value(
                  table.shape == TableShape.round ? 'round' : 'rectangle'),
              capacity: Value(table.capacity),
              updatedAt: DateTime.now(),
            ),
          );
    }
  }

  @override
  Future<void> deleteTable(String uuid) async {
    await (_db.update(_db.restaurantTable)..where((t) => t.uuid.equals(uuid)))
        .write(
      RestaurantTableCompanion(
        isDeleted: const Value(true),
        updatedAt: Value(DateTime.now()),
      ),
    );
  }

  @override
  Future<void> setTableOccupied(String tableUuid, bool isOccupied,
      {String? orderUuid}) async {
    await (_db.update(_db.restaurantTable)
          ..where((t) => t.uuid.equals(tableUuid)))
        .write(
      RestaurantTableCompanion(
        isOccupied: Value(isOccupied),
        currentOrderUuid: Value(orderUuid),
        updatedAt: Value(DateTime.now()),
      ),
    );
  }

  @override
  Future<void> addTable(String name, double x, double y) async {
    await saveTable(SavvyTable(
      id: _uuid.v4(),
      name: name,
      x: x,
      y: y,
      width: 100,
      height: 100,
      shape: TableShape.rectangle,
      capacity: 4,
      isOccupied: false,
    ));
  }

  @override
  Future<void> updateTable(SavvyTable table) async {
    await saveTable(table);
  }

  @override
  Future<void> transferTable(String sourceUuid, String targetUuid) async {
    return _db.transaction(() async {
      final sourceTable = await (_db.select(_db.restaurantTable)
            ..where((t) => t.uuid.equals(sourceUuid)))
          .getSingleOrNull();
      final targetTable = await (_db.select(_db.restaurantTable)
            ..where((t) => t.uuid.equals(targetUuid)))
          .getSingleOrNull();

      // Ensure source has order, target is empty
      if (sourceTable?.currentOrderUuid == null ||
          targetTable == null ||
          targetTable.isOccupied) return;

      final sourceOrderUuid = sourceTable!.currentOrderUuid!;

      // Transfer Order to Target Table
      await (_db.update(_db.restaurantTable)
            ..where((t) => t.uuid.equals(targetUuid)))
          .write(RestaurantTableCompanion(
              currentOrderUuid: Value(sourceOrderUuid),
              isOccupied: const Value(true)));

      // Release Source Table
      await (_db.update(_db.restaurantTable)
            ..where((t) => t.uuid.equals(sourceUuid)))
          .write(const RestaurantTableCompanion(
              currentOrderUuid: Value(null), isOccupied: Value(false)));
    });
  }

  @override
  Future<void> mergeTables(String sourceUuid, String targetUuid) async {
    return _db.transaction(() async {
      final sourceTable = await (_db.select(_db.restaurantTable)
            ..where((t) => t.uuid.equals(sourceUuid)))
          .getSingleOrNull();
      final targetTable = await (_db.select(_db.restaurantTable)
            ..where((t) => t.uuid.equals(targetUuid)))
          .getSingleOrNull();

      if (sourceTable?.currentOrderUuid == null || targetTable == null) return;

      final sourceOrderUuid = sourceTable!.currentOrderUuid!;
      final targetOrderUuid = targetTable.currentOrderUuid;

      if (targetOrderUuid != null) {
        // MERGE ORDER ITEMS
        await (_db.update(_db.orderItemTable)
              ..where((t) => t.orderUuid.equals(sourceOrderUuid)))
            .write(OrderItemTableCompanion(orderUuid: Value(targetOrderUuid)));
        // Close Source Order
        await (_db.update(_db.orderTable)
              ..where((t) => t.uuid.equals(sourceOrderUuid)))
            .write(const OrderTableCompanion(
                    status: Value('MERGED')) // Or CANCELLED
                );
      } else {
        // If target is empty, we just fall back to transfer logic internally
        await (_db.update(_db.restaurantTable)
              ..where((t) => t.uuid.equals(targetUuid)))
            .write(RestaurantTableCompanion(
                currentOrderUuid: Value(sourceOrderUuid),
                isOccupied: const Value(true)));
      }

      // Release Source Table
      await (_db.update(_db.restaurantTable)
            ..where((t) => t.uuid.equals(sourceUuid)))
          .write(const RestaurantTableCompanion(
              currentOrderUuid: Value(null), isOccupied: Value(false)));
    });
  }

  @override
  Future<void> updateSessionInfo(String tableUuid, String? token, String? url,
      TableSessionStatus status) async {
    await (_db.update(_db.restaurantTable)
          ..where((t) => t.uuid.equals(tableUuid)))
        .write(
      RestaurantTableCompanion(
        currentSessionToken: Value(token),
        qrCodeUrl: Value(url),
        sessionStatus: Value(status.name),
        updatedAt: Value(DateTime.now()),
      ),
    );
  }
}
