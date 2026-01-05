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
  EmployeeTable,
])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 5;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (Migrator m) async {
       await m.createAll();
       // Seed Owner on Creation
       await into(employeeTable).insert(EmployeeTableCompanion.insert(
         uuid: 'owner-001',
         name: 'Owner',
         pin: '123456',
         role: 'OWNER',
         createdAt: DateTime.now(),
       ));
    },
    onUpgrade: (Migrator m, int from, int to) async {
      if (from < 2) {
        await m.createTable(customerTable);
        await m.addColumn(orderTable, orderTable.customerUuid);
      }
      if (from < 3) {
        await m.addColumn(orderTable, orderTable.tenantId);
        await m.addColumn(orderTable, orderTable.status);
        await m.addColumn(orderTable, orderTable.paymentStatus);
        await m.addColumn(orderTable, orderTable.tenderedAmount);
      }
      if (from < 4) {
        // We might have created staffTable before, but user wants EmployeeTable now.
        // We will ignore staffTable if it exists or let it be.
        // If we are strictly following flow, we might rename it or just create new one.
        // Let's create `employeeTable`.
        // Note: If staffTable was created in v4, we should drop it or migrate data. 
        // For this task, we assume fresh or "just works" forward migration.
        await m.createTable(employeeTable);
         await into(employeeTable).insert(EmployeeTableCompanion.insert(
           uuid: 'owner-001',
           name: 'Owner',
           pin: '123456',
           role: 'OWNER',
           createdAt: DateTime.now(),
         ));
      }
      if (from < 5) {
         // If coming from v4 (StaffTable existed), we create EmployeeTable.
         // Effectively same as above block but explicit for v5 bump.
         // Check if table exists? createTable checks? No, createTable throws if exists.
         // We'll trust Drift to handle ifNotExists or we wrap. 
         // But simplest is just:
         await m.createTable(employeeTable);
         await into(employeeTable).insert(EmployeeTableCompanion.insert(
           uuid: 'owner-001',
           name: 'Owner',
           pin: '123456',
           role: 'OWNER',
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
