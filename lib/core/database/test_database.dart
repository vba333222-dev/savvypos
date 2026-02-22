// Test database to debug Drift table resolution
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:savvy_pos/core/database/tables.dart';
import 'package:savvy_pos/features/inventory/data/datasources/inventory_tables.dart';
import 'package:savvy_pos/features/employees/data/datasources/employee_tables.dart';
import 'package:savvy_pos/features/giftcards/data/datasources/gift_card_tables.dart';
import 'package:savvy_pos/features/loyalty/data/datasources/loyalty_tables.dart';
import 'package:savvy_pos/features/tips/data/datasources/tip_tables.dart';
import 'package:savvy_pos/features/pos/data/datasources/split_bill_tables.dart';
import 'package:savvy_pos/features/promotions/data/datasources/discount_tables.dart';
import 'package:savvy_pos/features/reservations/data/datasources/waitlist_tables.dart';
import 'package:savvy_pos/features/notification/data/datasources/staff_alert_tables.dart';
import 'package:savvy_pos/features/kitchen/data/datasources/kds_tables.dart';
import 'package:savvy_pos/features/feedback/data/datasources/feedback_tables.dart';

part 'test_database.g.dart';

@DriftDatabase(tables: [
  // Tables from tables.dart
  CategoryTable,
  // Tables from inventory_tables.dart
  InventoryLedgerTable,
  // Tables from employee_tables.dart
  TimeEntryTable,
  // Tables from gift_card_tables.dart
  GiftCardTable,
  // Tables from loyalty_tables.dart
  LoyaltyProgramTable,
  LoyaltyMemberTable,
  LoyaltyTransactionTable,
  LoyaltyRewardTable,
  // Tables from tip_tables.dart
  TipTable,
  // Tables from split_bill_tables.dart
  SplitBillTable,
  // Tables from discount_tables.dart
  DiscountTable,
  // Tables from waitlist_tables.dart
  WaitlistTable,
  // Tables from staff_alert_tables.dart
  StaffAlertTable,
  // Tables from kds_tables.dart
  KitchenTicketTable,
  // Tables from feedback_tables.dart
  CustomerFeedbackTable,
])
class TestDatabase extends _$TestDatabase {
  TestDatabase() : super(NativeDatabase.memory());

  @override
  int get schemaVersion => 1;
}
