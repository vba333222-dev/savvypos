import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';
import 'package:savvy_pos/core/database/database.dart';
import 'package:savvy_pos/features/tables/domain/entities/table_with_status.dart';
import 'package:savvy_pos/features/tables/domain/repositories/i_table_repository.dart';
import 'package:uuid/uuid.dart';

@LazySingleton(as: ITableRepository)
class TableRepositoryImpl implements ITableRepository {
  final AppDatabase _db;
  final Uuid _uuid = const Uuid();

  TableRepositoryImpl(this._db);

  @override
  Stream<List<TableWithStatus>> watchTables() {
    final query = _db.select(_db.restaurantTable).join([
      leftOuterJoin(_db.orderTable, _db.orderTable.uuid.equalsExp(_db.restaurantTable.currentOrderUuid)),
    ]);

    return query.watch().map((rows) {
      return rows.map((row) {
        final table = row.readTable(_db.restaurantTable);
        final order = row.readTableOrNull(_db.orderTable);
        
        String status = 'NONE';
        int pax = 0; // Not stored in OrderTable currently? 
        // OrderTable doesn't have Pax. It's in ReservationTable?
        // Or we assume Order has context. 
        // For now, if order exists, it's ACTIVE.
        
        if (order != null) {
          if (order.paymentStatus == 'PAID') {
            status = 'PAID'; // Should check if table not cleared
          } else if (order.status == 'PROCESSING') {
             // Bill printed logic? Usually a separate flag or status.
             // We'll infer: ACTIVE.
             status = 'ACTIVE';
          } else {
             status = 'ACTIVE';
          }
          // If bill printed is needed, we need a flag on Order.
        } else if (table.isOccupied) {
          status = 'ACTIVE'; // Fallback if order link missing
        }

        return TableWithStatus(table: table, orderStatus: status);
      }).toList();
    });
  }

  @override
  Future<void> addTable(String name, double x, double y) async {
    await _db.into(_db.restaurantTable).insert(RestaurantTableCompanion.insert(
      uuid: _uuid.v4(),
      name: name,
      x: x,
      y: y,
      updatedAt: DateTime.now(),
    ));
  }

  @override
  Future<void> updateTable(RestaurantTableData table) async {
    await _db.update(_db.restaurantTable).replace(table);
  }

  @override
  Future<void> deleteTable(String uuid) async {
    await (_db.delete(_db.restaurantTable)..where((t) => t.uuid.equals(uuid))).go();
  }

  @override
  Future<void> setTableOccupied(String tableUuid, bool isOccupied, {String? orderUuid}) async {
    await (_db.update(_db.restaurantTable)..where((t) => t.uuid.equals(tableUuid))).write(
      RestaurantTableCompanion(
        isOccupied: Value(isOccupied),
        currentOrderUuid: Value(orderUuid),
        updatedAt: Value(DateTime.now()),
      ),
    );
  }

  @override
  Future<void> mergeTables(String sourceTableUuid, String targetTableUuid) async {
    await _db.transaction(() async {
      // 1. Get Source and Target Tables
      final sourceTable = await (_db.select(_db.restaurantTable)..where((t) => t.uuid.equals(sourceTableUuid))).getSingle();
      final targetTable = await (_db.select(_db.restaurantTable)..where((t) => t.uuid.equals(targetTableUuid))).getSingle();

      final sourceOrderUuid = sourceTable.currentOrderUuid;
      if (sourceOrderUuid == null) return; // Nothing to merge

      if (!targetTable.isOccupied || targetTable.currentOrderUuid == null) {
        // CASE A: Target is Empty -> Move Order
        
        // 1. Update Order's table reference (if your OrderTable has a tableUuid column, update it here. 
        // Based on schema, Order might not have tableUuid directly if Table points to Order. 
        // But usually Order has table_id. Let's assume Order has table_uuid or we just link Table->Order)
        // Checking schema via context... Assuming we just move the link.
        
        // Update Target Table to point to Source's Order
        await (_db.update(_db.restaurantTable)..where((t) => t.uuid.equals(targetTableUuid))).write(
          RestaurantTableCompanion(
            isOccupied: const Value(true),
            currentOrderUuid: Value(sourceOrderUuid),
            updatedAt: Value(DateTime.now()),
          ),
        );
      } else {
        // CASE B: Target is Occupied -> Merge Items
        final targetOrderUuid = targetTable.currentOrderUuid!;

        // 1. Move all OrderItems from Source Order to Target Order
        // update order_items set order_uuid = targetOrderUuid where order_uuid = sourceOrderUuid
        await (_db.update(_db.orderItemTable)..where((t) => t.orderUuid.equals(sourceOrderUuid))).write(
          OrderItemTableCompanion(
            orderUuid: Value(targetOrderUuid),
          ),
        );

        // 2. Delete Source Order (it's now empty)
        await (_db.delete(_db.orderTable)..where((t) => t.uuid.equals(sourceOrderUuid))).go();
      }

      // 3. Clear Source Table
      await (_db.update(_db.restaurantTable)..where((t) => t.uuid.equals(sourceTableUuid))).write(
        RestaurantTableCompanion(
          isOccupied: const Value(false),
          currentOrderUuid: const Value(null),
          updatedAt: Value(DateTime.now()),
        ),
      );
    });
  }
}
