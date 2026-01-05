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
  StaffTable,
])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 4;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (Migrator m) async {
       await m.createAll();
       // Seed Admin on Creation
       await into(staffTable).insert(StaffTableCompanion.insert(
         uuid: 'admin-001',
         name: 'Adim',
         pin: '1234',
         role: 'ADMIN',
         createdAt: DateTime.now(),
       ));
    },
    onUpgrade: (Migrator m, int from, int to) async {
      if (from < 2) {
        await m.createTable(customerTable);
        await m.addColumn(orderTable, orderTable.customerUuid);
      }
      if (from < 3) {
        // ... (Previous v3 logic)
        await m.addColumn(orderTable, orderTable.tenantId);
        await m.addColumn(orderTable, orderTable.status);
        await m.addColumn(orderTable, orderTable.paymentStatus);
        await m.addColumn(orderTable, orderTable.tenderedAmount);
        // changeAmount nullable transition handled gracefully
      }
      if (from < 4) {
        await m.createTable(staffTable);
        // Seed Admin on Upgrade
        await into(staffTable).insert(StaffTableCompanion.insert(
         uuid: 'admin-001',
         name: 'Adim',
         pin: '1234',
         role: 'ADMIN',
         createdAt: DateTime.now(),
       ));
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
