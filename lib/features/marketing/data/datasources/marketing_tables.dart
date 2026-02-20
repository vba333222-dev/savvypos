import 'package:drift/drift.dart';

// ==============================================================================
// MARKETING CAMPAIGN TABLES
// ==============================================================================

class MarketingCampaignTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get uuid => text().unique()();
  TextColumn get name => text()();
  TextColumn get channel => text()(); // EMAIL, SMS, PUSH
  TextColumn get triggerType => text()(); // SIGNUP, PURCHASE, BIRTHDAY, INACTIVITY
  TextColumn get triggerValue => text().nullable()(); // e.g., "30" for 30 days of inactivity
  TextColumn get content => text()(); // The message template
  BoolColumn get isActive => boolean().withDefault(const Constant(true))();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime().nullable()();
}

class CampaignRunHistoryTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get uuid => text().unique()();
  TextColumn get campaignUuid => text()();
  TextColumn get customerUuid => text()();
  TextColumn get status => text()(); // SENT, FAILED, PENDING
  DateTimeColumn get sentAt => dateTime()();
  TextColumn get errorMessage => text().nullable()();
}
