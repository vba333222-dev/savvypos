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
  ProductTable,
  CustomerTable,
  OrderTable,
  OrderItemTable,
  InventoryLedgerTable,
  InventoryCacheTable,
  ShiftSessionTable,
  SyncQueue,
  EmployeeTable,
  RestaurantTable,
  ReservationTable,
  // v9 BoH
  ModifierGroupTable,
  ModifierItemTable,
  ProductModifierLinkTable,
  IngredientTable,
  RecipeTable,
  // v10 Ops
  CashTransactionTable,
  // v13 Enterprise
  // v13 Enterprise
  LocalStocksTable,
  SupplierTable,
  ProductSupplierTable,
])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 14;

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
         await m.createTable(employeeTable);
         // Redundant block removed in cleanup or similar check
      }
       if (from < 6) {
         await m.createTable(restaurantTable);
         // Seed Default Tables
         final tables = [
           (name: 'T1', x: 0.1, y: 0.1),
           (name: 'T2', x: 0.4, y: 0.1),
           (name: 'T3', x: 0.7, y: 0.1),
           (name: 'T4', x: 0.1, y: 0.4),
           (name: 'T5', x: 0.4, y: 0.4),
           (name: 'T6', x: 0.7, y: 0.4),
         ];
         for (var t in tables) {
           await into(restaurantTable).insert(RestaurantTableCompanion.insert(
             uuid: 'table-${t.name}',
             name: t.name,
             x: t.x, 
             y: t.y,
             updatedAt: DateTime.now(),
           ));
         }
       }
       if (from < 7) {
         await m.addColumn(productTable, productTable.printerCategory);
         await m.addColumn(orderItemTable, orderItemTable.paidQty);
       }
       if (from < 8) {
         await m.createTable(reservationTable);
       }
       if (from < 9) {
         // BoH Migration
         await m.addColumn(productTable, productTable.isComposite);
         await m.createTable(modifierGroupTable);
         await m.createTable(modifierItemTable);
         await m.createTable(productModifierLinkTable);
         await m.createTable(ingredientTable);
         await m.createTable(recipeTable);
       }
       if (from < 10) {
         await m.createTable(cashTransactionTable);
       }
       if (from < 11) {
         await m.addColumn(orderTable, orderTable.isFulfilled);
       }
       if (from < 12) {
         await m.addColumn(orderItemTable, orderItemTable.modifiersJson);
       }
       if (from < 13) {
         await m.createTable(localStocksTable);
         await m.createTable(supplierTable);
       }
       if (from < 14) {
         await m.createTable(productSupplierTable);
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
