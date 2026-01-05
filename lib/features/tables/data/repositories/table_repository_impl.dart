import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';
import 'package:savvy_pos/core/database/database.dart';
import 'package:savvy_pos/features/tables/domain/repositories/i_table_repository.dart';
import 'package:uuid/uuid.dart';

@LazySingleton(as: ITableRepository)
class TableRepositoryImpl implements ITableRepository {
  final AppDatabase _db;
  final Uuid _uuid = const Uuid();

  TableRepositoryImpl(this._db);

  @override
  Stream<List<RestaurantTableData>> watchTables() {
    return _db.select(_db.restaurantTable).watch();
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
