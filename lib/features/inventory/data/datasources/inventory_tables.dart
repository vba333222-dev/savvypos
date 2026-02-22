import 'package:drift/drift.dart';
import 'package:savvy_pos/core/database/tables.dart';

// ==============================================================================
// INVENTORY & SUPPLY CHAIN
// ==============================================================================

class InventoryLedgerTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get productUuid => text()();
  RealColumn get quantityChange => real()(); // -1, +10, etc.
  TextColumn get referenceId => text()(); // Order UUID or PO UUID
  TextColumn get type => text()(); // 'sale', 'restock', 'waste', 'audit'
  DateTimeColumn get timestamp => dateTime()();

  BoolColumn get isSynced => boolean().withDefault(const Constant(false))();
}

class InventoryCacheTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get productUuid => text().unique()();
  RealColumn get serverQuantity => real()(); // What backend says we have
  DateTimeColumn get lastSyncedAt => dateTime()();
}

class LocalStocksTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get productUuid =>
      text().references(ProductTable, #uuid, onDelete: KeyAction.cascade)();
  TextColumn get warehouseUuid => text()();
  RealColumn get quantity => real().withDefault(const Constant(0))();
  DateTimeColumn get updatedAt => dateTime()();
  IntColumn get version => integer().withDefault(const Constant(1))();

  @override
  List<Set<Column>> get uniqueKeys => [
        {productUuid, warehouseUuid}
      ];
}

class SupplierTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get uuid => text().unique()();
  TextColumn get name => text()();
  TextColumn get email => text().nullable()();
  TextColumn get phone => text().nullable()();
  TextColumn get address => text().nullable()();
  IntColumn get leadTimeDays => integer().withDefault(const Constant(0))();
  DateTimeColumn get updatedAt => dateTime()();
}

class ProductSupplierTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get productUuid =>
      text().references(ProductTable, #uuid, onDelete: KeyAction.cascade)();
  TextColumn get supplierUuid =>
      text().references(SupplierTable, #uuid, onDelete: KeyAction.cascade)();
  RealColumn get costPrice => real().withDefault(const Constant(0))();
  IntColumn get leadTimeDays => integer().withDefault(const Constant(0))();
  RealColumn get minOrderQty => real().withDefault(const Constant(0))();

  @override
  List<Set<Column>> get uniqueKeys => [
        {productUuid, supplierUuid}
      ];
}

class PurchaseOrderTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get uuid => text().unique()();
  TextColumn get supplierUuid =>
      text().references(SupplierTable, #uuid, onDelete: KeyAction.cascade)();
  TextColumn get targetWarehouseUuid => text()(); // Destination for goods
  TextColumn get status => text().withDefault(const Constant(
      'PENDING'))(); // PENDING, SENT, PARTIALLY_RECEIVED, COMPLETED, CANCELLED
  TextColumn get referenceNumber => text().nullable()(); // E.g., PO-2024-001
  TextColumn get notes => text().nullable()();
  RealColumn get totalCost => real().withDefault(const Constant(0))();

  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
  BoolColumn get isSynced => boolean().withDefault(const Constant(false))();
}

class PurchaseOrderItemTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get poUuid => text()
      .references(PurchaseOrderTable, #uuid, onDelete: KeyAction.cascade)();
  TextColumn get productUuid => text()
      .nullable()
      .references(ProductTable, #uuid, onDelete: KeyAction.cascade)();
  TextColumn get ingredientUuid => text()
      .nullable()
      .references(IngredientTable, #uuid, onDelete: KeyAction.cascade)();
  RealColumn get quantityOrdered => real()();
  RealColumn get quantityReceived => real().withDefault(const Constant(0))();
  RealColumn get unitCost => real()(); // Snapshot cost at time of order
}

class WasteTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get uuid => text().unique()();
  TextColumn get itemUuid => text()(); // Ingredient or Product UUID
  TextColumn get itemType => text()(); // 'INGREDIENT' or 'PRODUCT'
  RealColumn get quantity => real()();
  TextColumn get reason => text()(); // 'EXPIRED', 'DAMAGED', etc.
  TextColumn get note => text().nullable()();
  RealColumn get costLoss => real()(); // Calculated cost
  TextColumn get staffUuid => text()();
  TextColumn get warehouseUuid => text()();

  DateTimeColumn get recordedAt => dateTime()();
  BoolColumn get isSynced => boolean().withDefault(const Constant(false))();
}

class StockCountTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get uuid => text().unique()();
  TextColumn get warehouseUuid => text()();
  TextColumn get status => text()
      .withDefault(const Constant('IN_PROGRESS'))(); // IN_PROGRESS, COMPLETED
  DateTimeColumn get startedAt => dateTime()();
  DateTimeColumn get completedAt => dateTime().nullable()();
  TextColumn get conductedBy => text()();
}

class StockCountItemTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get countUuid =>
      text().references(StockCountTable, #uuid, onDelete: KeyAction.cascade)();
  TextColumn get productUuid => text()();
  RealColumn get expectedQty => real()();
  RealColumn get countedQty => real()();
  RealColumn get variance => real()();
}

// ==============================================================================
// ADVANCED INVENTORY MANAGEMENT TABLES
// ==============================================================================

/// Warehouse/Location table for multi-location inventory management
class WarehouseTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get uuid => text().unique()();
  TextColumn get name => text()();
  TextColumn get code => text().unique()(); // Short code like 'WH-001'
  TextColumn get type => text()
      .withDefault(const Constant('WAREHOUSE'))(); // WAREHOUSE, STORE, KITCHEN
  TextColumn get address => text().nullable()();
  TextColumn get contactPhone => text().nullable()();
  BoolColumn get isPrimary => boolean().withDefault(const Constant(false))();
  BoolColumn get isActive => boolean().withDefault(const Constant(true))();

  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
  BoolColumn get isDeleted => boolean().withDefault(const Constant(false))();
}

/// Enhanced stock levels with reorder points and analytics
class StockLevelTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get productUuid => text()();
  TextColumn get warehouseUuid => text()();
  RealColumn get quantity => real().withDefault(const Constant(0))();
  RealColumn get reservedQuantity => real().withDefault(const Constant(0))();
  RealColumn get availableQuantity => real().withDefault(const Constant(0))();
  RealColumn get reorderPoint => real().nullable()();
  RealColumn get reorderQuantity => real().nullable()();
  RealColumn get maxStockLevel => real().nullable()();
  RealColumn get averageCost => real().withDefault(const Constant(0))();
  RealColumn get averageDailySales => real().withDefault(const Constant(0))();
  IntColumn get daysOfStock => integer().nullable()(); // Calculated field

  DateTimeColumn get lastCountedAt => dateTime().nullable()();
  DateTimeColumn get lastMovementAt => dateTime().nullable()();
  DateTimeColumn get updatedAt => dateTime()();

  @override
  List<Set<Column>> get uniqueKeys => [
        {productUuid, warehouseUuid}
      ];
}

/// Batch/Lot tracking with expiry dates for perishables
class BatchTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get uuid => text().unique()();
  TextColumn get productUuid => text()();
  TextColumn get warehouseUuid => text()();
  TextColumn get batchNumber => text()();
  TextColumn get supplierUuid => text().nullable()();
  TextColumn get poUuid => text().nullable()(); // Link to purchase order

  RealColumn get initialQuantity => real()();
  RealColumn get currentQuantity => real()();
  RealColumn get unitCost => real()();

  DateTimeColumn get manufacturedAt => dateTime().nullable()();
  DateTimeColumn get expiryDate => dateTime().nullable()();
  DateTimeColumn get receivedAt => dateTime()();

  // Status: ACTIVE, DEPLETED, EXPIRED, QUARANTINE, RECALLED
  TextColumn get status => text().withDefault(const Constant('ACTIVE'))();
  TextColumn get notes => text().nullable()();

  DateTimeColumn get updatedAt => dateTime()();
  BoolColumn get isDeleted => boolean().withDefault(const Constant(false))();

  @override
  List<Set<Column>> get uniqueKeys => [
        {productUuid, warehouseUuid, batchNumber}
      ];
}

/// Stock alert configurations and active alerts
class StockAlertTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get uuid => text().unique()();
  TextColumn get productUuid => text()();
  TextColumn get productName => text()(); // Cached for display
  TextColumn get warehouseUuid => text().nullable()();

  // Alert type: LOW_STOCK, OUT_OF_STOCK, OVERSTOCK, EXPIRING_SOON, EXPIRED
  TextColumn get alertType => text()();
  TextColumn get severity => text()
      .withDefault(const Constant('WARNING'))(); // INFO, WARNING, CRITICAL

  RealColumn get currentValue => real().nullable()(); // Current stock level
  RealColumn get thresholdValue => real().nullable()(); // For low stock
  IntColumn get daysBeforeExpiry => integer().nullable()();

  TextColumn get message => text()();
  BoolColumn get isAcknowledged =>
      boolean().withDefault(const Constant(false))();
  TextColumn get acknowledgedBy => text().nullable()();
  DateTimeColumn get acknowledgedAt => dateTime().nullable()();

  TextColumn get actionTaken => text().nullable()();
  BoolColumn get isResolved => boolean().withDefault(const Constant(false))();
  DateTimeColumn get resolvedAt => dateTime().nullable()();

  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
}

/// Stock transfer between warehouses
class StockTransferTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get uuid => text().unique()();
  TextColumn get transferNumber => text().unique()();

  TextColumn get sourceWarehouseUuid => text()();
  TextColumn get sourceWarehouseName => text()(); // Cached
  TextColumn get targetWarehouseUuid => text()();
  TextColumn get targetWarehouseName => text()(); // Cached

  // Status: DRAFT, PENDING_APPROVAL, APPROVED, IN_TRANSIT, PARTIALLY_RECEIVED, COMPLETED, CANCELLED
  TextColumn get status => text().withDefault(const Constant('DRAFT'))();

  TextColumn get createdBy => text()();
  TextColumn get createdByName => text()();
  TextColumn get approvedBy => text().nullable()();
  DateTimeColumn get approvedAt => dateTime().nullable()();

  TextColumn get notes => text().nullable()();
  RealColumn get totalValue => real().withDefault(const Constant(0))();
  IntColumn get totalItems => integer().withDefault(const Constant(0))();

  DateTimeColumn get expectedDeliveryAt => dateTime().nullable()();
  DateTimeColumn get shippedAt => dateTime().nullable()();
  DateTimeColumn get receivedAt => dateTime().nullable()();

  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
}

/// Transfer line items
class StockTransferItemTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get transferUuid => text()();
  TextColumn get productUuid => text()();
  TextColumn get productName => text()(); // Cached
  TextColumn get batchUuid => text().nullable()();

  RealColumn get quantityRequested => real()();
  RealColumn get quantityShipped => real().withDefault(const Constant(0))();
  RealColumn get quantityReceived => real().withDefault(const Constant(0))();
  RealColumn get unitCost => real()();

  TextColumn get notes => text().nullable()();

  @override
  List<Set<Column>> get uniqueKeys => [
        {transferUuid, productUuid, batchUuid}
      ];
}

/// Alert threshold configuration (separate from active alerts)
class StockAlertConfigTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get uuid => text().unique()();
  TextColumn get productUuid => text()();
  TextColumn get warehouseUuid => text().nullable()();

  RealColumn get lowStockThreshold => real().nullable()();
  RealColumn get criticalStockThreshold => real().nullable()();
  RealColumn get overstockThreshold => real().nullable()();
  IntColumn get expiryWarningDays => integer().withDefault(const Constant(7))();

  BoolColumn get lowStockEmailEnabled =>
      boolean().withDefault(const Constant(true))();
  BoolColumn get outOfStockEmailEnabled =>
      boolean().withDefault(const Constant(true))();
  BoolColumn get expiryEmailEnabled =>
      boolean().withDefault(const Constant(true))();

  DateTimeColumn get updatedAt => dateTime()();

  @override
  List<Set<Column>> get uniqueKeys => [
        {productUuid, warehouseUuid}
      ];
}

/// Stock movement detailed log (enhanced InventoryLedger)
class StockMovementTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get uuid => text().unique()();
  TextColumn get productUuid => text()();
  TextColumn get productName => text()(); // Cached
  TextColumn get warehouseUuid => text()();
  TextColumn get batchUuid => text().nullable()();

  // SALE, PURCHASE, ADJUSTMENT, TRANSFER_IN, TRANSFER_OUT, WASTE, COUNT_VARIANCE, RETURN
  TextColumn get movementType => text()();
  RealColumn get quantityChange => real()();
  RealColumn get unitCost => real().nullable()();
  RealColumn get totalCost => real().nullable()();

  TextColumn get referenceType =>
      text().nullable()(); // ORDER, PO, TRANSFER, ADJUSTMENT
  TextColumn get referenceUuid => text().nullable()();
  TextColumn get referenceNumber => text().nullable()(); // Human-readable ref

  TextColumn get reasonCode => text().nullable()();
  TextColumn get notes => text().nullable()();
  TextColumn get performedBy => text()();
  TextColumn get performedByName => text()();

  RealColumn get balanceBefore => real()();
  RealColumn get balanceAfter => real()();
  DateTimeColumn get timestamp => dateTime()();
}
