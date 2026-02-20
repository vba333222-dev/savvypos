import 'package:drift/drift.dart';

/// Time Entry Table for tracking work hours
class TimeEntryTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get uuid => text().unique()();
  TextColumn get employeeUuid => text()();
  
  DateTimeColumn get clockIn => dateTime()();
  DateTimeColumn get clockOut => dateTime().nullable()();
  DateTimeColumn get breakStart => dateTime().nullable()();
  DateTimeColumn get breakEnd => dateTime().nullable()();
  
  // Hours (calculated and stored for quick lookups)
  RealColumn get regularHours => real().withDefault(const Constant(0))();
  RealColumn get overtimeHours => real().withDefault(const Constant(0))();
  RealColumn get breakMinutes => real().withDefault(const Constant(0))();
  
  // Tips
  RealColumn get cashTips => real().withDefault(const Constant(0))();
  RealColumn get cardTips => real().withDefault(const Constant(0))();
  
  TextColumn get shiftUuid => text().nullable()();
  TextColumn get notes => text().nullable()();
  
  BoolColumn get isApproved => boolean().withDefault(const Constant(false))();
  TextColumn get approvedBy => text().nullable()();
  
  DateTimeColumn get createdAt => dateTime()();
}

/// Scheduled Shift Table for weekly scheduling
class ScheduledShiftTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get uuid => text().unique()();
  TextColumn get employeeUuid => text()();
  
  DateTimeColumn get date => dateTime()();
  DateTimeColumn get startTime => dateTime()();
  DateTimeColumn get endTime => dateTime()();
  
  TextColumn get position => text().nullable()();
  TextColumn get notes => text().nullable()();
  
  BoolColumn get isPublished => boolean().withDefault(const Constant(false))();
  BoolColumn get isAcknowledged => boolean().withDefault(const Constant(false))();
  
  // Shift swap
  TextColumn get swapRequestedWith => text().nullable()();
  BoolColumn get isSwapPending => boolean().withDefault(const Constant(false))();
  
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
}

/// Extended Employee Table (adds to existing EmployeeTable in core)
/// This adds time tracking and pay rate fields
class EmployeeExtendedTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get employeeUuid => text().unique()(); // References EmployeeTable.uuid
  
  RealColumn get hourlyRate => real().withDefault(const Constant(0))();
  RealColumn get salary => real().withDefault(const Constant(0))();
  TextColumn get payType => text().withDefault(const Constant('hourly'))(); // hourly, salary
  TextColumn get employmentStatus => text().withDefault(const Constant('active'))();
  
  TextColumn get phone => text().nullable()();
  TextColumn get email => text().nullable()();
  TextColumn get avatarUrl => text().nullable()();
  
  DateTimeColumn get hireDate => dateTime().nullable()();
  DateTimeColumn get terminationDate => dateTime().nullable()();
  
  // Permissions stored as JSON array
  TextColumn get permissionsJson => text().withDefault(const Constant('[]'))();
  
  DateTimeColumn get updatedAt => dateTime()();
}
