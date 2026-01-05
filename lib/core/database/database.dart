import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:injectable/injectable.dart';
import 'package:savvy_pos/core/database/tables.dart';

part 'database.g.dart';

@lazySingleton
@DriftDatabase(tables: [
  TenantConfigTable,
  TenantConfigTable,
  ProductTable,
  CustomerTable,
  OrderTable,
  OrderItemTable,
  InventoryLedgerTable,
  InventoryCacheTable,
  ShiftSessionTable,
  SyncQueue,
])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 2;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (Migrator m) async {
       await m.createAll();
    },
    onUpgrade: (Migrator m, int from, int to) async {
      if (from < 2) {
        await m.createTable(customerTable);
        await m.addColumn(orderTable, orderTable.customerUuid);
      }
    },
  );
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'savvy_pos.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}
