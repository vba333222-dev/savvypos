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
  
  // Sync
  DateTimeColumn get updatedAt => dateTime()();
  BoolColumn get isSynced => boolean().withDefault(const Constant(false))();
  BoolColumn get isDeleted => boolean().withDefault(const Constant(false))();
  
  @override
  List<Set<Column>> get uniqueKeys => [{uuid}];
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
}

class OrderItemTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get orderUuid => text().references(OrderTable, #uuid, onDelete: KeyAction.cascade)();
  TextColumn get productUuid => text()(); // Relation to Product
  
  TextColumn get name => text()();
  RealColumn get price => real()();
  RealColumn get quantity => real()();
  TextColumn get note => text().nullable()();
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
