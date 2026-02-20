import 'package:drift/drift.dart';

/// Split Bill Table
class SplitBillTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get uuid => text().unique()();
  TextColumn get orderUuid => text()();
  TextColumn get orderNumber => text()();
  RealColumn get originalTotal => real()();
  IntColumn get guestCount => integer()();
  TextColumn get splitMode => text()(); // equal, byItem, custom, byGuest
  TextColumn get status => text().withDefault(const Constant('active'))();
  
  TextColumn get createdByUuid => text()();
  TextColumn get createdByName => text()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get completedAt => dateTime().nullable()();
}

/// Guest Bill Table
class GuestBillTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get uuid => text().unique()();
  TextColumn get splitBillUuid => text()();
  IntColumn get guestNumber => integer()();
  TextColumn get guestName => text().nullable()();
  
  RealColumn get totalAmount => real()();
  RealColumn get tipAmount => real().nullable()();
  
  BoolColumn get isPaid => boolean().withDefault(const Constant(false))();
  TextColumn get paymentMethod => text().nullable()();
  TextColumn get paymentTransactionUuid => text().nullable()();
  DateTimeColumn get paidAt => dateTime().nullable()();
}

/// Split Bill Item Table (for item-by-item splitting)
class SplitBillItemTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get uuid => text().unique()();
  TextColumn get guestBillUuid => text()();
  TextColumn get orderItemUuid => text()();
  TextColumn get productName => text()();
  RealColumn get price => real()();
  IntColumn get quantity => integer()();
  IntColumn get shareCount => integer().withDefault(const Constant(1))();
  IntColumn get shareIndex => integer().withDefault(const Constant(1))();
}
