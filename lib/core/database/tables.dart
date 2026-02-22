import 'package:drift/drift.dart';

// ==============================================================================
// 1. TENANT & CONFIGURATION
// ==============================================================================
class ZoneTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get uuid => text().unique()();
  TextColumn get name => text()();
  RealColumn get width => real().withDefault(const Constant(1000))();
  RealColumn get height => real().withDefault(const Constant(1000))();

  DateTimeColumn get updatedAt => dateTime()();
  BoolColumn get isDeleted => boolean().withDefault(const Constant(false))();
}

class TenantConfigTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get tenantId => text().unique()(); // UUID from Backend
  TextColumn get outletName => text()();
  TextColumn get address => text()();
  TextColumn get currencySymbol => text()();

  // Monetization (Stored as int index or custom type)
  IntColumn get tier => integer()(); // 0: Free, 1: Pro, 2: Enterprise
  DateTimeColumn get subscriptionExpiry => dateTime().nullable()();
  BoolColumn get isAdsEnabled => boolean()();

  // Security
  TextColumn get managerPinHash => text().nullable()();

  DateTimeColumn get updatedAt => dateTime()();
}

// ==============================================================================
// 1.2. RESTAURANT TABLES (DINE-IN)
// ==============================================================================
class RestaurantTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get uuid => text().unique()();
  TextColumn get name => text()(); // "Table 1"
  IntColumn get capacity => integer().withDefault(const Constant(4))();

  // Coordinates (Visual Editor)
  RealColumn get x => real().withDefault(const Constant(0))();
  RealColumn get y => real().withDefault(const Constant(0))();
  RealColumn get width => real().withDefault(const Constant(100))();
  RealColumn get height => real().withDefault(const Constant(100))();
  RealColumn get rotation => real().withDefault(const Constant(0))(); // Radians
  TextColumn get shape =>
      text().withDefault(const Constant('rectangle'))(); // 'rectangle', 'round'

  // Grouping
  TextColumn get zoneUuid => text().nullable().references(ZoneTable, #uuid)();

  // State
  BoolColumn get isOccupied => boolean().withDefault(const Constant(false))();
  TextColumn get currentOrderUuid => text().nullable()(); // Linked Open Order

  // BYOD - Dynamic QR Session Tracking
  TextColumn get currentSessionToken => text().nullable()();
  TextColumn get qrCodeUrl => text().nullable()();
  TextColumn get sessionStatus =>
      text().withDefault(const Constant('LOCKED'))();

  DateTimeColumn get updatedAt => dateTime()();
  BoolColumn get isDeleted => boolean().withDefault(const Constant(false))();
}

// ==============================================================================
// 1.3. RESERVATIONS
// ==============================================================================
class ReservationTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get uuid => text().unique()();
  TextColumn get customerName => text()();
  TextColumn get phone => text().nullable()();
  IntColumn get pax => integer()();
  DateTimeColumn get reservationTime => dateTime()();
  TextColumn get tableUuid => text().nullable()(); // Assigned Table
  TextColumn get status => text()
      .withDefault(const Constant('PENDING'))(); // PENDING, SEATED, CANCELLED
  TextColumn get note => text().nullable()();

  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
}

// ==============================================================================
// 1.1. EMPLOYEE & SECURITY (RBAC)
// ==============================================================================
class EmployeeTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get uuid => text().unique()();
  TextColumn get name => text()();
  TextColumn get pin => text()(); // MVP: Plain or simple hash
  TextColumn get role => text()(); // 'OWNER', 'MANAGER', 'CASHIER'

  BoolColumn get isActive => boolean().withDefault(const Constant(true))();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime().nullable()();
}

// ==============================================================================
// 2. PRODUCT CATALOG
// ==============================================================================
class CategoryTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get uuid => text().unique()();
  TextColumn get name => text()();
  TextColumn get colorHex => text().nullable()();

  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
  BoolColumn get isDeleted => boolean().withDefault(const Constant(false))();
}

class ProductTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get uuid => text().unique()();
  TextColumn get name => text()();
  TextColumn get sku => text().nullable()();
  TextColumn get barcode => text().nullable()();
  RealColumn get price => real()();
  RealColumn get costPrice => real().nullable()();
  TextColumn get categoryId => text()(); // Manual relation
  BoolColumn get trackStock => boolean()();
  BoolColumn get isService => boolean()();

  // Marketing & Analytics (Toast Benchmarked)
  RealColumn get totalSpent => real().withDefault(const Constant(0))();
  DateTimeColumn get lastVisitAt => dateTime().nullable()();

  // UI
  TextColumn get colorHex => text().nullable()();
  TextColumn get imageUrl => text().nullable()();

  // Printer Routing
  TextColumn get printerCategory => text()
      .withDefault(const Constant('OTHER'))(); // 'FOOD', 'BEVERAGE', 'OTHER'

  // Sync
  DateTimeColumn get updatedAt => dateTime()();
  BoolColumn get isSynced => boolean().withDefault(const Constant(false))();
  IntColumn get version => integer().withDefault(const Constant(1))();
  BoolColumn get isDeleted => boolean().withDefault(const Constant(false))();
  TextColumn get outletId =>
      text().nullable()(); // Added for Multi-Store filtering

  // Back of House (BoH)
  BoolColumn get isComposite => boolean()
      .withDefault(const Constant(false))(); // True if made of ingredients

  @override
  List<Set<Column>> get uniqueKeys => [
        {uuid}
      ];
}

// ==============================================================================
// 2.1. MODIFIERS
// ==============================================================================
class ModifierGroupTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get uuid => text().unique()();
  TextColumn get name => text()(); // "Sugar Level", "Toppings"
  BoolColumn get allowMultiSelect =>
      boolean().withDefault(const Constant(false))(); // Radio vs Checkbox
  IntColumn get minSelection =>
      integer().withDefault(const Constant(0))(); // 0 = Optional, 1 = Required
  IntColumn get maxSelection => integer().nullable()(); // Null = Unlimited

  DateTimeColumn get updatedAt => dateTime()();
  BoolColumn get isDeleted => boolean().withDefault(const Constant(false))();
}

class ModifierItemTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get uuid => text().unique()();
  TextColumn get groupUuid => text()
      .references(ModifierGroupTable, #uuid, onDelete: KeyAction.cascade)();
  TextColumn get name => text()(); // "Less Sugar", "Boba"
  RealColumn get priceDelta =>
      real().withDefault(const Constant(0))(); // +$0.50, can be 0 or negative

  DateTimeColumn get updatedAt => dateTime()();
  BoolColumn get isDeleted => boolean().withDefault(const Constant(false))();
}

class ProductModifierLinkTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get productUuid =>
      text().references(ProductTable, #uuid, onDelete: KeyAction.cascade)();
  TextColumn get modifierGroupUuid => text()
      .references(ModifierGroupTable, #uuid, onDelete: KeyAction.cascade)();
  IntColumn get sortOrder => integer().withDefault(const Constant(0))();
}

// ==============================================================================
// 2.2. RECIPES & INGREDIENTS
// ==============================================================================
class IngredientTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get uuid => text().unique()();
  TextColumn get name => text()();
  TextColumn get unit => text()(); // "g", "ml", "pcs"
  RealColumn get currentStock => real().withDefault(const Constant(0))();
  RealColumn get costPerUnit => real().withDefault(const Constant(0))();

  DateTimeColumn get updatedAt => dateTime()();
  BoolColumn get isDeleted => boolean().withDefault(const Constant(false))();
}

class RecipeTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get productUuid =>
      text().references(ProductTable, #uuid, onDelete: KeyAction.cascade)();
  TextColumn get ingredientUuid =>
      text().references(IngredientTable, #uuid, onDelete: KeyAction.cascade)();
  RealColumn get quantityRequired => real()();
}

// ==============================================================================
// 3. CUSTOMER (CRM)
// ==============================================================================
class CustomerTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get uuid => text().unique()();
  TextColumn get name => text()();
  TextColumn get phone => text().nullable()();
  TextColumn get email => text().nullable()();

  // Loyalty
  RealColumn get totalPoints => real().withDefault(const Constant(0))();
  DateTimeColumn get lastVisitAt => dateTime().nullable()();

  // Sync
  DateTimeColumn get updatedAt => dateTime()();
  BoolColumn get isSynced => boolean().withDefault(const Constant(false))();
  IntColumn get version => integer().withDefault(const Constant(1))();
  BoolColumn get isDeleted => boolean().withDefault(const Constant(false))();
}

// ==============================================================================
// 4. ORDER & TRANSACTION
// ==============================================================================
class OrderTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get uuid => text().unique()();
  TextColumn get orderNumber => text()();
  TextColumn get shiftUuid => text().nullable()();
  TextColumn get customerUuid => text().nullable()();
  TextColumn get tenantId => text().nullable()(); // Added missing
  TextColumn get outletId => text().nullable()(); // Added for Multi-Store
  TextColumn get status =>
      text().withDefault(const Constant('COMPLETED'))(); // Added missing
  TextColumn get paymentStatus =>
      text().withDefault(const Constant('PAID'))(); // Added missing
  DateTimeColumn get transactionDate => dateTime()();

  // Financials
  RealColumn get subtotal => real()();
  RealColumn get discountTotal => real()();
  RealColumn get taxTotal => real()();
  RealColumn get grandTotal => real()();

  // Payment (Modified for Multi-Tender)
  // Deprecated: paymentMethod, tenderedAmount, changeAmount (Use PaymentTransactionTable)
  // Kept for backward compatibility or simple orders
  TextColumn get paymentMethod => text().nullable()(); // Made nullable
  RealColumn get tenderedAmount => real().nullable()();
  RealColumn get changeAmount => real().nullable()();

  // Sync
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
  BoolColumn get isSynced => boolean().withDefault(const Constant(false))();
  IntColumn get version => integer().withDefault(const Constant(1))();
  IntColumn get syncAttempts => integer().withDefault(const Constant(0))();

  // Kitchen
  BoolColumn get isFulfilled => boolean().withDefault(const Constant(false))();
}

class PaymentTransactionTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get uuid => text().unique()();
  TextColumn get orderUuid =>
      text().references(OrderTable, #uuid, onDelete: KeyAction.cascade)();

  TextColumn get method => text()(); // 'CASH', 'CARD', 'QRIS', 'CUSTOM'
  RealColumn get amount => real()(); // The amount paid
  RealColumn get tendered =>
      real().nullable()(); // For Cash: Amount handed over
  RealColumn get change => real().nullable()(); // For Cash: Change returned

  TextColumn get status =>
      text().withDefault(const Constant('PAID'))(); // PAID, VOID, REFUNDED
  TextColumn get referenceId => text().nullable()(); // External Trans ID
  TextColumn get note => text().nullable()();

  DateTimeColumn get createdAt => dateTime()();
  TextColumn get createdBy => text().nullable()(); // Staff UUID

  BoolColumn get isSynced => boolean().withDefault(const Constant(false))();
}

class OrderItemTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get orderUuid =>
      text().references(OrderTable, #uuid, onDelete: KeyAction.cascade)();
  TextColumn get productUuid => text()(); // Relation to Product

  TextColumn get name => text()();
  RealColumn get price => real()();
  RealColumn get quantity => real()();
  RealColumn get paidQty =>
      real().withDefault(const Constant(0))(); // For Split Bill
  TextColumn get note => text().nullable()();
  TextColumn get modifiersJson =>
      text().nullable()(); // Added for storing snapshot of modifiers
  RealColumn get total => real()(); // price * quantity - discount

  // Sync
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
}

// Inventory Ledger Table moved to features/inventory

// Inventory Tables moved to features/inventory

// ==============================================================================
// 5. SHIFT & CASH MANAGEMENT
// ==============================================================================
class ShiftSessionTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get uuid => text().unique()();
  TextColumn get staffId => text()();
  TextColumn get staffName => text()();
  TextColumn get outletId => text().nullable()(); // Added for Multi-Store

  DateTimeColumn get startShift => dateTime()();
  DateTimeColumn get endShift => dateTime().nullable()();

  RealColumn get startCash => real()();
  RealColumn get expectedCash => real()();
  RealColumn get actualCash => real()();
  RealColumn get difference => real()();
  TextColumn get varianceReason => text().nullable()();

  BoolColumn get isClosed => boolean().withDefault(const Constant(false))();
  BoolColumn get isSynced => boolean().withDefault(const Constant(false))();
}

// ==============================================================================
// 6. SYNC QUEUE
// ==============================================================================
class SyncQueue extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get actionType => text()(); // e.g., 'CREATE_ORDER', 'ADJUST_STOCK'
  TextColumn get payloadJson => text()();
  TextColumn get idempotencyKey => text().unique()(); // UUID
  DateTimeColumn get createdAt => dateTime()();
  TextColumn get status =>
      text().withDefault(const Constant('PENDING'))(); // PENDING, RETRY, FAILED
  IntColumn get retryCount => integer().withDefault(const Constant(0))();
  DateTimeColumn get nextRetryAt =>
      dateTime().nullable()(); // For exponential backoff
}

// ==============================================================================
// 7. CASH TRANSACTIONS (v10)
// ==============================================================================
class CashTransactionTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get uuid => text().unique()();
  TextColumn get shiftUuid => text().nullable()();
  TextColumn get type => text()(); // 'PAY_IN', 'PAY_OUT'
  RealColumn get amount => real()();
  TextColumn get reason => text().nullable()();

  DateTimeColumn get createdAt => dateTime()();
  BoolColumn get isSynced => boolean().withDefault(const Constant(false))();
}

// Waste Table moved to features/inventory

// ==============================================================================
// Marketing Campaign Tables Moved to features/loyalty/data/datasources/loyalty_tables.dart

// ==============================================================================
// 10. DELIVERY AGGREGATOR
// ==============================================================================
class DeliveryChannelTable extends Table {
  TextColumn get id => text()(); // 'uber_eats', 'grab_food'
  TextColumn get provider => text()(); // Limit to enum names
  BoolColumn get isActive => boolean().withDefault(const Constant(true))();
  BoolColumn get autoAcceptOrders =>
      boolean().withDefault(const Constant(true))();
  RealColumn get surchargePercent => real().withDefault(const Constant(0.0))();
  DateTimeColumn get lastSyncedAt => dateTime().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

class DeliveryOrderMetadataTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get orderUuid =>
      text().references(OrderTable, #uuid, onDelete: KeyAction.cascade)();
  TextColumn get provider => text()(); // 'uberEats', etc
  TextColumn get externalOrderId => text()();
  TextColumn get driverName => text().nullable()();
  TextColumn get driverPhone => text().nullable()();
  TextColumn get driverPlate => text().nullable()();
  DateTimeColumn get pickupTime => dateTime().nullable()();
  TextColumn get deliveryStatus => text().withDefault(const Constant('NEW'))();

  @override
  List<Set<Column>> get uniqueKeys => [
        {provider, externalOrderId}
      ];
}

// ==============================================================================
// Loyalty Tables Moved to features/loyalty/data/datasources/loyalty_tables.dart

// ==============================================================================
// 12. CASH DRAWER MANAGEMENT
// ==============================================================================
class CashDrawerTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get uuid => text().unique()();
  TextColumn get shiftUuid => text()(); // References ShiftSessionTable.uuid
  TextColumn get employeeUuid => text()();
  TextColumn get employeeName => text()();
  RealColumn get startingBalance => real()();
  RealColumn get currentBalance => real()();
  RealColumn get expectedBalance => real()();
  TextColumn get state =>
      text().withDefault(const Constant('open'))(); // open, closed
  DateTimeColumn get openedAt => dateTime()();
  DateTimeColumn get closedAt => dateTime().nullable()();
  RealColumn get closingBalance => real().nullable()();
  RealColumn get variance => real().nullable()();
}

class CashEventTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get uuid => text().unique()();
  TextColumn get drawerUuid => text()();
  TextColumn get type =>
      text()(); // cashIn, cashOut, cashDrop, noSale, sale, refund
  RealColumn get amount => real()();
  TextColumn get reason => text()();
  TextColumn get comment => text().nullable()();
  TextColumn get performedBy => text().nullable()();
  TextColumn get orderUuid => text().nullable()();
  DateTimeColumn get timestamp => dateTime()();
}

// ==============================================================================
// 13. CUSTOMER CRM
// ==============================================================================
class CustomerNoteTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get uuid => text().unique()();
  TextColumn get customerUuid => text()();
  TextColumn get content => text()();
  TextColumn get createdBy => text()();
  DateTimeColumn get createdAt => dateTime()();
  BoolColumn get isCritical => boolean().withDefault(const Constant(false))();
}

class CustomerTagTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get customerUuid => text()();
  TextColumn get tag => text()();

  @override
  List<Set<Column>> get uniqueKeys => [
        {customerUuid, tag}
      ];
}

// ==============================================================================
// 14. HARDWARE & PERIPHERALS
// ==============================================================================
class PrintJobTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get uuid => text().unique()();
  TextColumn get targetPrinterAddress => text()(); // The address (IP/Mac)
  TextColumn get targetPrinterType => text()(); // NETWORK, BLUETOOTH, USB
  BlobColumn get bytes => blob()(); // ESC/POS raw bytes
  TextColumn get status => text()
      .withDefault(const Constant('PENDING'))(); // PENDING, PRINTING, COMPLETED
  DateTimeColumn get createdAt => dateTime()();
  IntColumn get retryCount => integer().withDefault(const Constant(0))();
}
