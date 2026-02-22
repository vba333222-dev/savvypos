import 'package:drift/drift.dart';

/// Kitchen Ticket Table
class KitchenTicketTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get uuid => text().unique()();
  TextColumn get orderUuid => text()();
  TextColumn get orderNumber => text()();

  // Context
  TextColumn get tableUuid => text().nullable()();
  TextColumn get guestTableName => text().nullable()();
  TextColumn get serverName => text().nullable()();

  // Status
  TextColumn get status => text().withDefault(
      const Constant('fired'))(); // fired, prep, ready, served, voided
  DateTimeColumn get firedAt => dateTime()();
  DateTimeColumn get startedAt => dateTime().nullable()();
  DateTimeColumn get completedAt => dateTime().nullable()();
  DateTimeColumn get targetTime => dateTime().nullable()();

  // Metadata
  TextColumn get note => text().nullable()();
  BoolColumn get isRush => boolean().withDefault(const Constant(false))();
}

/// Kitchen/KDS Item Table
class KitchenItemTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get uuid => text().unique()();
  TextColumn get ticketUuid => text()
      .references(KitchenTicketTable, #uuid, onDelete: KeyAction.cascade)();
  TextColumn get orderItemUuid => text()();

  // Item Details
  TextColumn get name => text()();
  IntColumn get quantity => integer()();
  TextColumn get modifiersJson => text().withDefault(const Constant('[]'))();
  TextColumn get note => text().nullable()();

  // KDS Specifics
  TextColumn get course =>
      text().withDefault(const Constant('main'))(); // course enum
  TextColumn get status => text().withDefault(const Constant('fired'))();
}
