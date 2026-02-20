import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'dart:io';
import 'package:injectable/injectable.dart';

import 'package:savvy_pos/core/database/tables.dart';
import 'package:savvy_pos/features/loyalty/data/datasources/loyalty_tables.dart';
import 'package:savvy_pos/features/inventory/data/datasources/inventory_tables.dart';
import 'package:savvy_pos/features/employees/data/datasources/employee_tables.dart';
import 'package:savvy_pos/features/giftcards/data/datasources/gift_card_tables.dart';
import 'package:savvy_pos/features/tips/data/datasources/tip_tables.dart';
import 'package:savvy_pos/features/pos/data/datasources/split_bill_tables.dart';
import 'package:savvy_pos/features/promotions/data/datasources/discount_tables.dart';
import 'package:savvy_pos/features/reservations/data/datasources/waitlist_tables.dart';
import 'package:savvy_pos/features/notification/data/datasources/staff_alert_tables.dart';
import 'package:savvy_pos/features/kitchen/data/datasources/kds_tables.dart';
import 'package:savvy_pos/features/feedback/data/datasources/feedback_tables.dart';
import 'package:savvy_pos/features/marketing/data/datasources/marketing_tables.dart';
import 'package:savvy_pos/features/auth/data/datasources/audit_log_table.dart';

part 'database.g.dart';

@DriftDatabase(tables: [
  ZoneTable,
  TenantConfigTable,
  RestaurantTable,
  ReservationTable,
  EmployeeTable,
  CategoryTable,
  ProductTable,
  ModifierGroupTable,
  ModifierItemTable,
  ProductModifierLinkTable,
  IngredientTable,
  RecipeTable,
  CustomerTable,
  OrderTable,
  OrderItemTable,
  InventoryLedgerTable,
  InventoryCacheTable,
  LocalStocksTable,
  SupplierTable,
  ProductSupplierTable,
  PurchaseOrderTable,
  PurchaseOrderItemTable,
  ShiftSessionTable,
  SyncQueue,
  CashTransactionTable,
  WasteTable,
  MarketingCampaignTable,
  CampaignRunHistoryTable,
  DeliveryChannelTable,
  DeliveryOrderMetadataTable,
  CashDrawerTable,
  CashEventTable,
  CustomerNoteTable,
  CustomerTagTable,
  PaymentTransactionTable,
  StockCountTable,
  StockCountItemTable,
  WarehouseTable,
  StockLevelTable,
  BatchTable,
  StockAlertTable,
  StockTransferTable,
  StockTransferItemTable,
  StockAlertConfigTable,
  StockMovementTable,
  // Employee Feature Tables
  TimeEntryTable,
  ScheduledShiftTable,
  EmployeeExtendedTable,
  // Gift Card Feature Tables
  GiftCardTable,
  GiftCardTransactionTable,
  // Loyalty Feature Tables
  LoyaltyProgramTable,
  LoyaltyMemberTable,
  LoyaltyTransactionTable,
  LoyaltyRewardTable,
  // Tip Management Feature Tables
  TipTable,
  TipPoolConfigTable,
  TipDistributionTable,
  // Split Bill Feature Tables
  SplitBillTable,
  GuestBillTable,
  SplitBillItemTable,
  // Discount Feature Tables
  DiscountTable,
  AppliedDiscountTable,
  // Waitlist Feature Tables
  WaitlistTable,
  // Staff Alert Feature Tables
  StaffAlertTable,
  // KDS Feature Tables
  KitchenTicketTable,
  KitchenItemTable,
  // Feedback Feature Tables
  CustomerFeedbackTable,
  // Anti-Fraud Audit Trail
  AuditLogTable,
  // Hardware Peripherals
  PrintJobTable,
])
@singleton
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 16; // +PrintJobTable for persistent print queue

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (Migrator m) async {
        await m.createAll();
      },
      onUpgrade: (Migrator m, int from, int to) async {
        // Run migration steps
        // NOTE: Complex migration temporarily disabled while regenerating database.g.dart
        // After successful generation, proper migrations can be restored.
        for (final step in m.database.allTables) {
          try {
            await m.createTable(step);
          } catch (_) {
            // Table already exists, ignore
          }
        }
      },
      beforeOpen: (details) async {
        await customStatement('PRAGMA foreign_keys = ON');
      },
    );
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'savvy_pos.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}
