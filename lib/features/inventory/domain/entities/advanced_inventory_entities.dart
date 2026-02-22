import 'package:freezed_annotation/freezed_annotation.dart';

part 'advanced_inventory_entities.freezed.dart';
part 'advanced_inventory_entities.g.dart';

// ==============================================================================
// ENUMS
// ==============================================================================

enum WarehouseType { warehouse, store, kitchen }

enum BatchStatus { active, depleted, expired, quarantine, recalled }

enum AlertType { lowStock, outOfStock, overstock, expiringSoon, expired }

enum AlertSeverity { info, warning, critical }

enum TransferStatus {
  draft,
  pendingApproval,
  approved,
  inTransit,
  partiallyReceived,
  completed,
  cancelled
}

enum MovementType {
  sale,
  purchase,
  adjustment,
  transferIn,
  transferOut,
  waste,
  countVariance,
  returnStock,
}

enum MovementReason {
  damage,
  expired,
  theft,
  correction,
  shrinkage,
  other,
}

// ==============================================================================
// ENTITIES
// ==============================================================================

@freezed
class Warehouse with _$Warehouse {
  const factory Warehouse({
    required String uuid,
    required String name,
    required String code,
    @Default(WarehouseType.warehouse) WarehouseType type,
    String? address,
    String? contactPhone,
    @Default(false) bool isPrimary,
    @Default(true) bool isActive,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _Warehouse;

  factory Warehouse.fromJson(Map<String, dynamic> json) =>
      _$WarehouseFromJson(json);
}

@freezed
class StockLevel with _$StockLevel {
  const factory StockLevel({
    required String productUuid,
    required String warehouseUuid,
    @Default(0) double quantity,
    @Default(0) double reservedQuantity,
    @Default(0) double availableQuantity,
    double? reorderPoint,
    double? reorderQuantity,
    double? maxStockLevel,
    @Default(0) double averageCost,
    @Default(0) double averageDailySales,
    int? daysOfStock,
    DateTime? lastCountedAt,
    DateTime? lastMovementAt,
    // UI helpers
    String? productName,
    String? productSku,
    String? warehouseName,
    String? categoryName,
  }) = _StockLevel;

  factory StockLevel.fromJson(Map<String, dynamic> json) =>
      _$StockLevelFromJson(json);
}

@freezed
class Batch with _$Batch {
  const factory Batch({
    required String uuid,
    required String productUuid,
    required String warehouseUuid,
    required String batchNumber,
    String? supplierUuid,
    String? poUuid,
    required double initialQuantity,
    required double currentQuantity,
    required double unitCost,
    DateTime? manufacturedAt,
    DateTime? expiryDate,
    required DateTime receivedAt,
    @Default(BatchStatus.active) BatchStatus status,
    String? notes,
    // UI helpers
    String? productName,
    String? supplierName,
    int? daysUntilExpiry,
  }) = _Batch;

  factory Batch.fromJson(Map<String, dynamic> json) => _$BatchFromJson(json);
}

@freezed
class StockAlert with _$StockAlert {
  const factory StockAlert({
    required String uuid,
    required String productUuid,
    required String productName,
    String? warehouseUuid,
    String? warehouseName,
    required AlertType alertType,
    @Default(AlertSeverity.warning) AlertSeverity severity,
    double? currentValue,
    double? thresholdValue,
    int? daysBeforeExpiry,
    required String message,
    @Default(false) bool isAcknowledged,
    String? acknowledgedBy,
    DateTime? acknowledgedAt,
    String? actionTaken,
    @Default(false) bool isResolved,
    DateTime? resolvedAt,
    DateTime? createdAt,
  }) = _StockAlert;

  factory StockAlert.fromJson(Map<String, dynamic> json) =>
      _$StockAlertFromJson(json);
}

@freezed
class StockAlertConfig with _$StockAlertConfig {
  const factory StockAlertConfig({
    required String uuid,
    required String productUuid,
    String? warehouseUuid,
    double? lowStockThreshold,
    double? criticalStockThreshold,
    double? overstockThreshold,
    @Default(7) int expiryWarningDays,
    @Default(true) bool lowStockEmailEnabled,
    @Default(true) bool outOfStockEmailEnabled,
    @Default(true) bool expiryEmailEnabled,
  }) = _StockAlertConfig;

  factory StockAlertConfig.fromJson(Map<String, dynamic> json) =>
      _$StockAlertConfigFromJson(json);
}

@freezed
class AdvancedStockTransfer with _$AdvancedStockTransfer {
  const factory AdvancedStockTransfer({
    required String uuid,
    required String transferNumber,
    required String sourceWarehouseUuid,
    required String sourceWarehouseName,
    required String targetWarehouseUuid,
    required String targetWarehouseName,
    @Default(TransferStatus.draft) TransferStatus status,
    required String createdBy,
    required String createdByName,
    String? approvedBy,
    DateTime? approvedAt,
    String? notes,
    @Default(0) double totalValue,
    @Default(0) int totalItems,
    DateTime? expectedDeliveryAt,
    DateTime? shippedAt,
    DateTime? receivedAt,
    DateTime? createdAt,
    @Default([]) List<AdvancedStockTransferItem> items,
  }) = _AdvancedStockTransfer;

  factory AdvancedStockTransfer.fromJson(Map<String, dynamic> json) =>
      _$AdvancedStockTransferFromJson(json);
}

@freezed
class AdvancedStockTransferItem with _$AdvancedStockTransferItem {
  const factory AdvancedStockTransferItem({
    required String transferUuid,
    required String productUuid,
    required String productName,
    String? batchUuid,
    required double quantityRequested,
    @Default(0) double quantityShipped,
    @Default(0) double quantityReceived,
    required double unitCost,
    String? notes,
  }) = _AdvancedStockTransferItem;

  factory AdvancedStockTransferItem.fromJson(Map<String, dynamic> json) =>
      _$AdvancedStockTransferItemFromJson(json);
}

@freezed
class StockMovement with _$StockMovement {
  const factory StockMovement({
    required String uuid,
    required String productUuid,
    required String productName,
    required String warehouseUuid,
    String? warehouseName,
    String? batchUuid,
    required MovementType movementType,
    required double quantityChange,
    double? unitCost,
    double? totalCost,
    String? referenceType,
    String? referenceUuid,
    String? referenceNumber,
    String? reasonCode,
    String? notes,
    required String performedBy,
    required String performedByName,
    required double balanceBefore,
    required double balanceAfter,
    required DateTime timestamp,
  }) = _StockMovement;

  factory StockMovement.fromJson(Map<String, dynamic> json) =>
      _$StockMovementFromJson(json);
}

@freezed
class InventoryInsight with _$InventoryInsight {
  const factory InventoryInsight({
    required String id,
    required String title,
    required String description,
    required String
        insightType, // RESTOCK, OVERSTOCK, EXPIRING, SLOW_MOVING, POPULAR
    required String severity, // INFO, WARNING, CRITICAL
    String? productUuid,
    String? productName,
    String? warehouseUuid,
    double? currentValue,
    double? recommendedValue,
    String? actionLabel,
    DateTime? createdAt,
  }) = _InventoryInsight;

  factory InventoryInsight.fromJson(Map<String, dynamic> json) =>
      _$InventoryInsightFromJson(json);
}

@freezed
class InventoryDashboardStats with _$InventoryDashboardStats {
  const factory InventoryDashboardStats({
    @Default(0) int totalProducts,
    @Default(0) int totalWarehouses,
    @Default(0) double totalStockValue,
    @Default(0) int lowStockCount,
    @Default(0) int outOfStockCount,
    @Default(0) int expiringCount,
    @Default(0) int alertsCount,
    @Default(0) int pendingTransfers,
    @Default(0) int pendingPurchaseOrders,
    @Default(0.0) double averageTurnoverRate,
    @Default([]) List<StockAlert> recentAlerts,
    @Default([]) List<InventoryInsight> insights,
  }) = _InventoryDashboardStats;

  factory InventoryDashboardStats.fromJson(Map<String, dynamic> json) =>
      _$InventoryDashboardStatsFromJson(json);
}

@freezed
class VarianceReport with _$VarianceReport {
  const factory VarianceReport({
    required String productUuid,
    required String productName,
    required String warehouseUuid,
    required String warehouseName,
    required double theoreticalStock, // Based on transactions
    required double actualStock, // From physical count
    required double variance, // actual - theoretical
    required double variancePercentage,
    required double varianceCost,
    String? possibleReason,
    DateTime? countDate,
  }) = _VarianceReport;

  factory VarianceReport.fromJson(Map<String, dynamic> json) =>
      _$VarianceReportFromJson(json);
}
