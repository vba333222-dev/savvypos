import 'package:drift/drift.dart';

/// Discount Table
class DiscountTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get uuid => text().unique()();
  TextColumn get name => text()();
  TextColumn get code => text().unique()();
  TextColumn get description => text().nullable()();
  
  TextColumn get type => text()(); // percentage, fixed, bogo, etc.
  TextColumn get scope => text()(); // order, item, category, customer
  TextColumn get status => text().withDefault(const Constant('active'))();
  
  // Values
  RealColumn get percentageOff => real().nullable()();
  RealColumn get fixedAmountOff => real().nullable()();
  IntColumn get buyQuantity => integer().nullable()();
  IntColumn get getQuantity => integer().nullable()();
  RealColumn get getDiscountPercent => real().nullable()();
  
  // JSON stored lists
  TextColumn get tiersJson => text().withDefault(const Constant('[]'))();
  TextColumn get applicableProductUuidsJson => text().withDefault(const Constant('[]'))();
  TextColumn get applicableCategoryUuidsJson => text().withDefault(const Constant('[]'))();
  TextColumn get applicableCustomerUuidsJson => text().withDefault(const Constant('[]'))();
  
  // Restrictions
  RealColumn get minOrderAmount => real().nullable()();
  RealColumn get maxDiscountAmount => real().nullable()();
  IntColumn get maxUsesTotal => integer().nullable()();
  IntColumn get maxUsesPerCustomer => integer().nullable()();
  IntColumn get currentUsageCount => integer().withDefault(const Constant(0))();
  
  // Scheduling
  DateTimeColumn get validFrom => dateTime().nullable()();
  DateTimeColumn get validUntil => dateTime().nullable()();
  TextColumn get validDaysOfWeekJson => text().withDefault(const Constant('[]'))();
  TextColumn get validTimeStart => text().nullable()();
  TextColumn get validTimeEnd => text().nullable()();
  
  // Stacking
  BoolColumn get canStackWithOthers => boolean().withDefault(const Constant(false))();
  IntColumn get stackPriority => integer().withDefault(const Constant(0))();
  
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime().nullable()();
}

/// Applied Discount Table (Linking discounts to orders)
class AppliedDiscountTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get uuid => text().unique()();
  TextColumn get orderUuid => text()();
  TextColumn get discountUuid => text()();
  TextColumn get discountName => text()();
  TextColumn get discountCode => text()();
  TextColumn get type => text()();
  RealColumn get discountAmount => real()();
  
  // Item specific
  TextColumn get appliedToItemUuid => text().nullable()();
  TextColumn get appliedToItemName => text().nullable()();
  
  DateTimeColumn get appliedAt => dateTime()();
  TextColumn get appliedByUuid => text().nullable()();
}
