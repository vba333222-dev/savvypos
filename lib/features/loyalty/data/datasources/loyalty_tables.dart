import 'package:drift/drift.dart';

@DataClassName('LoyaltyProgramData')
class LoyaltyProgramTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get uuid => text().unique()();
  // Config
  TextColumn get name =>
      text().withDefault(const Constant('Default Loyalty'))();
  RealColumn get pointsPerCurrency =>
      real().withDefault(const Constant(1.0))(); // e.g. 1 point per $1
  RealColumn get exchangeRate =>
      real().withDefault(const Constant(0.01))(); // e.g. 100 points = $1

  // Tiers (JSON or separate table? Simple JSON for MVP config)
  TextColumn get tiersJson =>
      text().nullable()(); // List of tiers: Bronze, Silver, Gold

  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
}

@DataClassName('LoyaltyMemberData')
class LoyaltyMemberTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get uuid => text().unique()();
  TextColumn get customerUuid => text().unique()(); // 1-to-1 with Customer

  RealColumn get pointsBalance => real().withDefault(const Constant(0.0))();
  RealColumn get lifetimePoints => real().withDefault(const Constant(0.0))();

  TextColumn get currentTier => text().withDefault(const Constant('Base'))();
  DateTimeColumn get joinedAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get lastTransactionAt => dateTime().nullable()();
}

@DataClassName('LoyaltyTransactionData')
class LoyaltyTransactionTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get uuid => text().unique()();
  TextColumn get memberUuid => text()();

  TextColumn get type => text()(); // EARN, REDEEM, ADJUSTMENT, BONUS
  RealColumn get pointsDelta => real()(); // +/- points

  TextColumn get orderUuid => text().nullable()(); // Linked order
  TextColumn get rewardUuid => text().nullable()(); // Linked reward if redeem
  TextColumn get reason => text().nullable()();

  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
}

@DataClassName('LoyaltyRewardData')
class LoyaltyRewardTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get uuid => text().unique()();

  TextColumn get name => text()();
  TextColumn get description => text().nullable()();
  RealColumn get pointsCost => real()();

  TextColumn get discountType => text()(); // PERCENTAGE, FIXED, FREE_ITEM
  RealColumn get discountValue => real()();

  TextColumn get applicableProductUuid =>
      text().nullable()(); // If free item/specific discount

  BoolColumn get isActive => boolean().withDefault(const Constant(true))();
}
