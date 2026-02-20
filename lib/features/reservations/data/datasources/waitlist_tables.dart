import 'package:drift/drift.dart';

/// Waitlist Table
class WaitlistTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get uuid => text().unique()();
  TextColumn get guestName => text()();
  TextColumn get phoneNumber => text()();
  IntColumn get partySize => integer()();
  
  // Preferences
  TextColumn get specialRequests => text().nullable()();
  BoolColumn get highchairNeeded => boolean().withDefault(const Constant(false))();
  BoolColumn get wheelchairAccessible => boolean().withDefault(const Constant(false))();
  TextColumn get tablePreference => text().nullable()();
  
  // Status
  TextColumn get status => text().withDefault(const Constant('waiting'))();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get quotedWaitTime => dateTime().nullable()();
  DateTimeColumn get notifiedAt => dateTime().nullable()();
  DateTimeColumn get seatedAt => dateTime().nullable()();
  TextColumn get seatedTableUuid => text().nullable()();
  
  IntColumn get queuePosition => integer().nullable()();
}
