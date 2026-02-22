import 'package:drift/drift.dart';

/// Gift Card Table
class GiftCardTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get uuid => text().unique()();
  TextColumn get cardNumber => text().unique()(); // 16-digit
  TextColumn get barcode => text().nullable()();

  // Values
  RealColumn get initialValue => real()();
  RealColumn get currentBalance => real().withDefault(const Constant(0))();

  // Customer (optional)
  TextColumn get customerUuid => text().nullable()();
  TextColumn get customerName => text().nullable()();
  TextColumn get customerEmail => text().nullable()();
  TextColumn get customerPhone => text().nullable()();

  // Status
  TextColumn get status => text().withDefault(const Constant('active'))();
  DateTimeColumn get activatedAt => dateTime()();
  DateTimeColumn get expiresAt => dateTime().nullable()();
  DateTimeColumn get lastUsedAt => dateTime().nullable()();

  // Security
  TextColumn get pin => text().nullable()();

  // Tracking
  TextColumn get activatedByEmployeeUuid => text().nullable()();
  TextColumn get activatedByEmployeeName => text().nullable()();
  TextColumn get notes => text().nullable()();

  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
}

/// Gift Card Transaction Table
class GiftCardTransactionTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get uuid => text().unique()();
  TextColumn get giftCardUuid => text()();
  TextColumn get transactionType =>
      text()(); // activation, reload, redemption, refund, adjustment, expiry

  RealColumn get amount => real()();
  RealColumn get balanceAfter => real()();

  // Order link (for redemptions)
  TextColumn get orderUuid => text().nullable()();
  TextColumn get orderNumber => text().nullable()();

  // Performer
  TextColumn get performedByUuid => text()();
  TextColumn get performedByName => text()();

  TextColumn get notes => text().nullable()();
  DateTimeColumn get timestamp => dateTime()();
}
