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
// 3. ORDER & TRANSACTION
// ==============================================================================
class OrderTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get uuid => text().unique()();
  TextColumn get orderNumber => text()();
  TextColumn get shiftUuid => text().nullable()(); // Link to ShiftSession
  DateTimeColumn get transactionDate => dateTime()();
  
  // Financials
  RealColumn get subtotal => real()();
  RealColumn get discountTotal => real()();
  RealColumn get taxTotal => real()();
  RealColumn get grandTotal => real()();
  
  // Payment (Stored as String)
  TextColumn get paymentMethod => text()(); // 'cash', 'qris', etc.
  RealColumn get amountTendered => real()();
  RealColumn get changeAmount => real()();
  
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
