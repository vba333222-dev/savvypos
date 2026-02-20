import 'package:drift/drift.dart';

// ─────────────────────────────────────────────────────────────────────────────
// AuditLogTable: Immutable local audit trail for sensitive POS actions.
//
// Design principle — WRITE-ONLY:
//   This table has no DELETE or UPDATE paths in any repository.
//   Client-side code only ever INSERT rows. This enforces an append-only
//   paper trail that survives app restarts and cannot be cleared by the
//   cashier or even the manager through the UI.
//
// Actions tracked (AuditAction enum):
//   voidItem          – Voided a line item from an active ticket
//   voidOrder         – Voided an entire order
//   openCashDrawer    – Manual cash drawer release
//   applyDiscount     – Applied a discount > threshold (usually 10%)
//   priceOverride     – Changed unit price on a line item
//   refund            – Issued a refund
//   supervisorLogin   – Supervisor unlocked a session
// ─────────────────────────────────────────────────────────────────────────────

enum AuditAction {
  voidItem,
  voidOrder,
  openCashDrawer,
  applyDiscount,
  priceOverride,
  refund,
  supervisorLogin,
}

class AuditLogTable extends Table {
  // Auto-increment primary key
  IntColumn get id => integer().autoIncrement()();

  // Timestamp — stored as ISO-8601 string for readability in SQLite
  DateTimeColumn get timestamp => dateTime()();

  // Who requested the action (cashier logged in)
  TextColumn get cashierId => text()();
  TextColumn get cashierName => text()();

  // Who approved the action (supervisor who entered PIN)
  TextColumn get supervisorId => text()();
  TextColumn get supervisorName => text()();
  TextColumn get supervisorRole => text()();

  // What was done
  TextColumn get action => text()();          // AuditAction.name
  TextColumn? get orderUuid => text().nullable()();
  TextColumn? get orderItemUuid => text().nullable()();

  // Human-readable detail (e.g. "Discount 15% on order #123", "Item: Burger x2")
  TextColumn get detail => text()();

  // Device / shift context
  TextColumn? get shiftSessionUuid => text().nullable()();
  TextColumn? get stationId => text().nullable()();

  // Sync status — for eventual cloud upload
  BoolColumn get isSynced => boolean().withDefault(const Constant(false))();

  @override
  String get tableName => 'audit_logs';
}
