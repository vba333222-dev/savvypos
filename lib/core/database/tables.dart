import 'package:drift/drift.dart';

// ==============================================================================
// 1. TENANT & CONFIGURATION
// ==============================================================================
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
  DateTimeColumn get updatedAt => dateTime()();
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
  
  // Coordinates (Percentage 0.0 - 1.0)
  RealColumn get x => real()();
  RealColumn get y => real()();
  
  // State
  BoolColumn get isOccupied => boolean().withDefault(const Constant(false))();
  TextColumn get currentOrderUuid => text().nullable()(); // Linked Open Order
  
  DateTimeColumn get updatedAt => dateTime()();
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
  TextColumn get status => text().withDefault(const Constant('PENDING'))(); // PENDING, SEATED, CANCELLED
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
  
  // UI
  TextColumn get colorHex => text().nullable()();
  TextColumn get imageUrl => text().nullable()();
  
  // Printer Routing
  TextColumn get printerCategory => text().withDefault(const Constant('OTHER'))(); // 'FOOD', 'BEVERAGE', 'OTHER'
  
  // Sync
  DateTimeColumn get updatedAt => dateTime()();
  BoolColumn get isSynced => boolean().withDefault(const Constant(false))();
  BoolColumn get isDeleted => boolean().withDefault(const Constant(false))();
  
  // Back of House (BoH)
  BoolColumn get isComposite => boolean().withDefault(const Constant(false))(); // True if made of ingredients
  
  @override
  List<Set<Column>> get uniqueKeys => [{uuid}];
}

// ==============================================================================
// 2.1. MODIFIERS
// ==============================================================================
class ModifierGroupTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get uuid => text().unique()();
  TextColumn get name => text()(); // "Sugar Level", "Toppings"
  BoolColumn get allowMultiSelect => boolean().withDefault(const Constant(false))(); // Radio vs Checkbox
  IntColumn get minSelection => integer().withDefault(const Constant(0))(); // 0 = Optional, 1 = Required
  IntColumn get maxSelection => integer().nullable()(); // Null = Unlimited
  
  DateTimeColumn get updatedAt => dateTime()();
  BoolColumn get isDeleted => boolean().withDefault(const Constant(false))();
}

class ModifierItemTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get uuid => text().unique()();
  TextColumn get groupUuid => text().references(ModifierGroupTable, #uuid, onDelete: KeyAction.cascade)();
  TextColumn get name => text()(); // "Less Sugar", "Boba"
  RealColumn get priceDelta => real().withDefault(const Constant(0))(); // +$0.50, can be 0 or negative
  
  DateTimeColumn get updatedAt => dateTime()();
  BoolColumn get isDeleted => boolean().withDefault(const Constant(false))();
}

class ProductModifierLinkTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get productUuid => text().references(ProductTable, #uuid, onDelete: KeyAction.cascade)();
  TextColumn get modifierGroupUuid => text().references(ModifierGroupTable, #uuid, onDelete: KeyAction.cascade)();
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
  TextColumn get productUuid => text().references(ProductTable, #uuid, onDelete: KeyAction.cascade)();
  TextColumn get ingredientUuid => text().references(IngredientTable, #uuid, onDelete: KeyAction.cascade)();
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
  TextColumn get status => text().withDefault(const Constant('COMPLETED'))(); // Added missing
  TextColumn get paymentStatus => text().withDefault(const Constant('PAID'))(); // Added missing
  DateTimeColumn get transactionDate => dateTime()();
  
  // Financials
  RealColumn get subtotal => real()();
  RealColumn get discountTotal => real()();
  RealColumn get taxTotal => real()();
  RealColumn get grandTotal => real()();
  
  // Payment
  TextColumn get paymentMethod => text()(); // 'CASH', 'QRIS', 'CARD'
  RealColumn get tenderedAmount => real().nullable()(); // Renamed & Nullable
  RealColumn get changeAmount => real().nullable()(); // Nullable
  
  // Sync
  BoolColumn get isSynced => boolean().withDefault(const Constant(false))();
  IntColumn get syncAttempts => integer().withDefault(const Constant(0))();
  
  // Kitchen
  BoolColumn get isFulfilled => boolean().withDefault(const Constant(false))();
}

class OrderItemTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get orderUuid => text().references(OrderTable, #uuid, onDelete: KeyAction.cascade)();
  TextColumn get productUuid => text()(); // Relation to Product
  
  TextColumn get name => text()();
  RealColumn get price => real()();
  RealColumn get quantity => real()();
  RealColumn get paidQty => real().withDefault(const Constant(0))(); // For Split Bill
  TextColumn get note => text().nullable()();
  TextColumn get modifiersJson => text().nullable()(); // Added for storing snapshot of modifiers
  RealColumn get total => real()(); // price * quantity - discount
}

// ==============================================================================
// 4. INVENTORY LEDGER
// ==============================================================================
class InventoryLedgerTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get productUuid => text()();
  RealColumn get quantityChange => real()(); // -1, +10, etc.
  TextColumn get referenceId => text()(); // Order UUID or PO UUID
  TextColumn get type => text()(); // 'sale', 'restock'
  DateTimeColumn get timestamp => dateTime()();
  
  BoolColumn get isSynced => boolean().withDefault(const Constant(false))();
}

class InventoryCacheTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get productUuid => text().unique()();
  RealColumn get serverQuantity => real()();
  DateTimeColumn get lastSyncedAt => dateTime()();
}

class LocalStocksTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get productUuid => text().references(ProductTable, #uuid, onDelete: KeyAction.cascade)();
  TextColumn get warehouseUuid => text()();
  RealColumn get quantity => real().withDefault(const Constant(0))();
  DateTimeColumn get updatedAt => dateTime()();
  
  @override
  List<Set<Column>> get uniqueKeys => [{productUuid, warehouseUuid}];
}

class SupplierTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get uuid => text().unique()();
  TextColumn get name => text()();
  TextColumn get email => text().nullable()();
  TextColumn get phone => text().nullable()();
  TextColumn get address => text().nullable()();
  DateTimeColumn get updatedAt => dateTime()();
}

class ProductSupplierTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get productUuid => text().references(ProductTable, #uuid, onDelete: KeyAction.cascade)();
  TextColumn get supplierUuid => text().references(SupplierTable, #uuid, onDelete: KeyAction.cascade)();
  RealColumn get costPrice => real().withDefault(const Constant(0))();
  IntColumn get leadTimeDays => integer().withDefault(const Constant(0))();
  RealColumn get minOrderQty => real().withDefault(const Constant(0))();
  
  @override
  List<Set<Column>> get uniqueKeys => [{productUuid, supplierUuid}];
}

// ==============================================================================
// 5. SHIFT & CASH MANAGEMENT
// ==============================================================================
class ShiftSessionTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get uuid => text().unique()();
  TextColumn get staffId => text()();
  TextColumn get staffName => text()();
  
  DateTimeColumn get startShift => dateTime()();
  DateTimeColumn get endShift => dateTime().nullable()();
  
  RealColumn get startCash => real()();
  RealColumn get expectedCash => real()();
  RealColumn get actualCash => real()();
  RealColumn get difference => real()();
  
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
  IntColumn get retryCount => integer().withDefault(const Constant(0))();
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
