import 'package:savvy_pos/features/inventory/domain/entities/advanced_inventory_entities.dart';

/// Advanced Inventory Management Repository Interface
/// Provides comprehensive inventory operations including multi-warehouse,
/// batch tracking, alerts, transfers, and analytics.
abstract class IAdvancedInventoryRepository {
  // ===========================================================================
  // WAREHOUSE MANAGEMENT
  // ===========================================================================
  
  /// Get all warehouses/locations
  Future<List<Warehouse>> getWarehouses({bool activeOnly = true});
  
  /// Get a single warehouse by UUID
  Future<Warehouse?> getWarehouse(String uuid);
  
  /// Create a new warehouse
  Future<Warehouse> createWarehouse(Warehouse warehouse);
  
  /// Update an existing warehouse
  Future<void> updateWarehouse(Warehouse warehouse);
  
  /// Soft delete a warehouse
  Future<void> deleteWarehouse(String uuid);

  // ===========================================================================
  // STOCK LEVELS
  // ===========================================================================
  
  /// Get stock levels with filters and search
  Future<List<StockLevel>> getStockLevels({
    String? warehouseUuid,
    String? categoryUuid,
    String? searchQuery,
    bool lowStockOnly = false,
    bool outOfStockOnly = false,
    int? limit,
    int? offset,
  });
  
  /// Get stock level for a specific product in a warehouse
  Future<StockLevel?> getStockLevel(String productUuid, String warehouseUuid);
  
  /// Get total stock across all warehouses for a product
  Future<double> getTotalStock(String productUuid);
  
  /// Update stock level (used internally by movements)
  Future<void> updateStockLevel(String productUuid, String warehouseUuid, double newQuantity);

  // ===========================================================================
  // STOCK MOVEMENTS
  // ===========================================================================
  
  /// Record a stock movement (adjustment, sale, purchase, etc.)
  Future<StockMovement> recordMovement({
    required String productUuid,
    required String warehouseUuid,
    required MovementType movementType,
    required double quantityChange,
    required String performedBy,
    required String performedByName,
    String? batchUuid,
    double? unitCost,
    String? referenceType,
    String? referenceUuid,
    String? referenceNumber,
    String? reasonCode,
    String? notes,
  });
  
  /// Get movement history with filters
  Future<List<StockMovement>> getMovementHistory({
    String? productUuid,
    String? warehouseUuid,
    MovementType? movementType,
    DateTime? startDate,
    DateTime? endDate,
    int limit = 100,
    int offset = 0,
  });

  // ===========================================================================
  // BATCH MANAGEMENT
  // ===========================================================================
  
  /// Get all batches for a product
  Future<List<Batch>> getBatches({
    String? productUuid,
    String? warehouseUuid,
    BatchStatus? status,
    bool expiringWithinDays = false,
    int? days,
  });
  
  /// Get a single batch
  Future<Batch?> getBatch(String uuid);
  
  /// Create a new batch (usually when receiving goods)
  Future<Batch> createBatch(Batch batch);
  
  /// Update batch quantity (after sales, adjustments)
  Future<void> updateBatchQuantity(String uuid, double newQuantity);
  
  /// Mark batch as depleted/expired/quarantine
  Future<void> updateBatchStatus(String uuid, BatchStatus status);

  // ===========================================================================
  // ALERTS
  // ===========================================================================
  
  /// Get active alerts (unresolved)
  Future<List<StockAlert>> getActiveAlerts({
    AlertType? type,
    AlertSeverity? severity,
    String? warehouseUuid,
    int limit = 50,
  });
  
  /// Generate alerts based on current stock levels
  Future<List<StockAlert>> checkAndGenerateAlerts();
  
  /// Acknowledge an alert
  Future<void> acknowledgeAlert(String uuid, String acknowledgedBy);
  
  /// Resolve an alert
  Future<void> resolveAlert(String uuid, String actionTaken);
  
  /// Get alert configuration for a product
  Future<StockAlertConfig?> getAlertConfig(String productUuid, String? warehouseUuid);
  
  /// Save alert configuration
  Future<void> saveAlertConfig(StockAlertConfig config);

  // ===========================================================================
  // TRANSFERS
  // ===========================================================================
  
  /// Get transfers with filters
  Future<List<AdvancedStockTransfer>> getTransfers({
    String? sourceWarehouseUuid,
    String? targetWarehouseUuid,
    TransferStatus? status,
    DateTime? startDate,
    DateTime? endDate,
    int limit = 50,
  });
  
  /// Get a single transfer with items
  Future<AdvancedStockTransfer?> getTransfer(String uuid);
  
  /// Create a new transfer
  Future<AdvancedStockTransfer> createTransfer(AdvancedStockTransfer transfer);
  
  /// Update transfer status
  Future<void> updateTransferStatus(String uuid, TransferStatus status, {
    String? approvedBy,
  });
  
  /// Ship transfer (update quantities shipped)
  Future<void> shipTransfer(String uuid, List<AdvancedStockTransferItem> items);
  
  /// Receive transfer (update quantities received, adjust stock)
  Future<void> receiveTransfer(String uuid, List<AdvancedStockTransferItem> items, String receivedBy);

  // ===========================================================================
  // ANALYTICS & INSIGHTS
  // ===========================================================================
  
  /// Get dashboard statistics
  Future<InventoryDashboardStats> getDashboardStats({String? warehouseUuid});
  
  /// Generate AI-powered insights
  Future<List<InventoryInsight>> generateInsights({String? warehouseUuid});
  
  /// Get variance report (actual vs theoretical)
  Future<List<VarianceReport>> getVarianceReport({
    String? warehouseUuid,
    DateTime? startDate,
    DateTime? endDate,
  });
  
  /// Get inventory valuation
  Future<double> getInventoryValuation({String? warehouseUuid});
  
  /// Get stock turnover rate
  Future<Map<String, double>> getStockTurnover({
    String? warehouseUuid,
    DateTime? startDate,
    DateTime? endDate,
  });

  // ===========================================================================
  // PHYSICAL COUNT
  // ===========================================================================
  
  /// Start a new physical count session
  Future<String> startPhysicalCount({
    required String warehouseUuid,
    required String initiatedBy,
    required String initiatedByName,
    String? auditType, // FULL, CYCLE, SPOT_CHECK
  });
  
  /// Record a count for a product
  Future<void> recordCount({
    required String countSessionUuid,
    required String productUuid,
    required double countedQty,
    String? countedBy,
    String? batchUuid,
  });
  
  /// Complete a physical count session (apply variances)
  Future<void> completePhysicalCount(String uuid, String completedBy);
  
  /// Get count session details
  Future<Map<String, dynamic>?> getCountSession(String uuid);
}
