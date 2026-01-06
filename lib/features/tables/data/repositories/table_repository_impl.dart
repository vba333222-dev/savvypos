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
}
