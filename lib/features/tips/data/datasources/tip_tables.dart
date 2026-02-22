import 'package:drift/drift.dart';

/// Tip Table - Individual tip records
class TipTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get uuid => text().unique()();
  TextColumn get orderUuid => text()();
  TextColumn get orderNumber => text()();
  TextColumn get tipType => text()(); // cash, card, split
  RealColumn get amount => real()();

  TextColumn get processedByUuid => text()();
  TextColumn get processedByName => text()();

  BoolColumn get isPooled => boolean().withDefault(const Constant(false))();
  TextColumn get poolUuid => text().nullable()();

  TextColumn get notes => text().nullable()();
  DateTimeColumn get createdAt => dateTime()();
}

/// Tip Pool Configuration Table
class TipPoolConfigTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get uuid => text().unique()();
  TextColumn get name => text()();
  TextColumn get method => text().withDefault(
      const Constant('equal'))(); // equal, hoursWorked, points, percentage
  BoolColumn get isActive => boolean().withDefault(const Constant(true))();

  // JSON stored configurations
  TextColumn get rolePercentagesJson =>
      text().withDefault(const Constant('{}'))();
  TextColumn get rolePointsJson => text().withDefault(const Constant('{}'))();
  TextColumn get excludedRolesJson =>
      text().withDefault(const Constant('[]'))();

  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
}

/// Tip Distribution Table - Per-employee distribution records
class TipDistributionTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get uuid => text().unique()();
  TextColumn get tipUuid => text()();
  TextColumn get employeeUuid => text()();
  TextColumn get employeeName => text()();
  TextColumn get employeeRole => text()();
  RealColumn get amount => real()();

  RealColumn get percentage => real()();
  RealColumn get hoursWorked => real().nullable()();
  RealColumn get pointsEarned => real().nullable()();

  BoolColumn get isPaidOut => boolean().withDefault(const Constant(false))();
  DateTimeColumn get paidOutAt => dateTime().nullable()();
  TextColumn get paidOutByUuid => text().nullable()();

  DateTimeColumn get distributedAt => dateTime()();
}
