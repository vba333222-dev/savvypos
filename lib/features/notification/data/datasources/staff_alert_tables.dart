import 'package:drift/drift.dart';

/// Staff Alert Table
class StaffAlertTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get uuid => text().unique()();
  TextColumn get type => text()(); // tableReady, orderReady, lowStock, etc.
  TextColumn get priority => text()(); // low, medium, high, critical
  TextColumn get title => text()();
  TextColumn get message => text()();
  TextColumn get status => text().withDefault(const Constant('active'))();
  
  // Targeting
  TextColumn get targetRolesJson => text().withDefault(const Constant('[]'))();
  TextColumn get targetUserUuidsJson => text().withDefault(const Constant('[]'))();
  BoolColumn get broadcastToAll => boolean().withDefault(const Constant(true))();
  
  // Context
  TextColumn get relatedOrderUuid => text().nullable()();
  TextColumn get relatedTableUuid => text().nullable()();
  TextColumn get relatedCustomerUuid => text().nullable()();
  
  // Action
  TextColumn get actionLabel => text().nullable()();
  TextColumn get actionRoute => text().nullable()();
  
  // Timing
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get expiresAt => dateTime().nullable()();
  DateTimeColumn get acknowledgedAt => dateTime().nullable()();
  TextColumn get acknowledgedByUuid => text().nullable()();
  DateTimeColumn get resolvedAt => dateTime().nullable()();
  TextColumn get resolvedByUuid => text().nullable()();
  
  // Sound/Vibration
  BoolColumn get playSound => boolean().withDefault(const Constant(true))();
  BoolColumn get vibrate => boolean().withDefault(const Constant(true))();
}
