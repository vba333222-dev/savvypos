import 'package:freezed_annotation/freezed_annotation.dart';

part 'inventory_entities.freezed.dart';
part 'inventory_entities.g.dart';

@freezed
class Supplier with _$Supplier {
  const factory Supplier({
    required String uuid,
    required String name,
    String? email,
    String? phone,
    String? address,
    required int leadTimeDays,
    DateTime? updatedAt,
  }) = _Supplier;

  factory Supplier.fromJson(Map<String, dynamic> json) =>
      _$SupplierFromJson(json);
}

enum PoStatus { pending, sent, partiallyReceived, completed, cancelled }

@freezed
class PurchaseOrder with _$PurchaseOrder {
  const factory PurchaseOrder({
    required String uuid,
    required String supplierUuid,
    required String targetWarehouseUuid,
    required PoStatus status,
    String? referenceNumber,
    String? notes,
    required double totalCost,
    DateTime? createdAt,
    DateTime? updatedAt,
    @Default([]) List<PurchaseOrderItem> items,
  }) = _PurchaseOrder;

  factory PurchaseOrder.fromJson(Map<String, dynamic> json) =>
      _$PurchaseOrderFromJson(json);
}

@freezed
class PurchaseOrderItem with _$PurchaseOrderItem {
  const factory PurchaseOrderItem({
    required String poUuid,
    String? productUuid,
    String? ingredientUuid,
    required double quantityOrdered,
    required double quantityReceived,
    required double unitCost,
    String? productName, // Helper for UI
  }) = _PurchaseOrderItem;

  factory PurchaseOrderItem.fromJson(Map<String, dynamic> json) =>
      _$PurchaseOrderItemFromJson(json);
}

@freezed
class StockCount with _$StockCount {
  const factory StockCount({
    required String uuid,
    required String warehouseUuid,
    required String status, // IN_PROGRESS, COMPLETED
    required DateTime startedAt,
    DateTime? completedAt,
    required String conductedBy,
    @Default([]) List<StockCountItem> items,
  }) = _StockCount;

  factory StockCount.fromJson(Map<String, dynamic> json) =>
      _$StockCountFromJson(json);
}

@freezed
class StockCountItem with _$StockCountItem {
  const factory StockCountItem({
    required String countUuid,
    required String productUuid,
    required double expectedQty,
    required double countedQty,
    required double variance,
    String? productName,
  }) = _StockCountItem;

  factory StockCountItem.fromJson(Map<String, dynamic> json) =>
      _$StockCountItemFromJson(json);
}

@freezed
class InventoryLedger with _$InventoryLedger {
  const factory InventoryLedger({
    required String productUuid,
    required double quantityChange,
    required String referenceId,
    required String type, // sale, restock, waste, audit
    required DateTime timestamp,
  }) = _InventoryLedger;

  factory InventoryLedger.fromJson(Map<String, dynamic> json) =>
      _$InventoryLedgerFromJson(json);
}

@freezed
class StockTransferItem with _$StockTransferItem {
  const factory StockTransferItem({
    required String productUuid,
    required double quantity,
    String? productName,
  }) = _StockTransferItem;

  factory StockTransferItem.fromJson(Map<String, dynamic> json) =>
      _$StockTransferItemFromJson(json);
}

@freezed
class StockTransfer with _$StockTransfer {
  const factory StockTransfer({
    required String uuid,
    required String sourceWarehouseUuid,
    required String targetWarehouseUuid,
    required String status, // PENDING, IN_TRANSIT, COMPLETED
    required String createdBy,
    DateTime? createdAt,
    DateTime? completedAt,
    @Default([]) List<StockTransferItem> items,
  }) = _StockTransfer;

  factory StockTransfer.fromJson(Map<String, dynamic> json) =>
      _$StockTransferFromJson(json);
}
