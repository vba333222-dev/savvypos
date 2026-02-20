// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'advanced_inventory_entities.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WarehouseImpl _$$WarehouseImplFromJson(Map<String, dynamic> json) =>
    _$WarehouseImpl(
      uuid: json['uuid'] as String,
      name: json['name'] as String,
      code: json['code'] as String,
      type: $enumDecodeNullable(_$WarehouseTypeEnumMap, json['type']) ??
          WarehouseType.warehouse,
      address: json['address'] as String?,
      contactPhone: json['contactPhone'] as String?,
      isPrimary: json['isPrimary'] as bool? ?? false,
      isActive: json['isActive'] as bool? ?? true,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$WarehouseImplToJson(_$WarehouseImpl instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'name': instance.name,
      'code': instance.code,
      'type': _$WarehouseTypeEnumMap[instance.type]!,
      'address': instance.address,
      'contactPhone': instance.contactPhone,
      'isPrimary': instance.isPrimary,
      'isActive': instance.isActive,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };

const _$WarehouseTypeEnumMap = {
  WarehouseType.warehouse: 'warehouse',
  WarehouseType.store: 'store',
  WarehouseType.kitchen: 'kitchen',
};

_$StockLevelImpl _$$StockLevelImplFromJson(Map<String, dynamic> json) =>
    _$StockLevelImpl(
      productUuid: json['productUuid'] as String,
      warehouseUuid: json['warehouseUuid'] as String,
      quantity: (json['quantity'] as num?)?.toDouble() ?? 0,
      reservedQuantity: (json['reservedQuantity'] as num?)?.toDouble() ?? 0,
      availableQuantity: (json['availableQuantity'] as num?)?.toDouble() ?? 0,
      reorderPoint: (json['reorderPoint'] as num?)?.toDouble(),
      reorderQuantity: (json['reorderQuantity'] as num?)?.toDouble(),
      maxStockLevel: (json['maxStockLevel'] as num?)?.toDouble(),
      averageCost: (json['averageCost'] as num?)?.toDouble() ?? 0,
      averageDailySales: (json['averageDailySales'] as num?)?.toDouble() ?? 0,
      daysOfStock: (json['daysOfStock'] as num?)?.toInt(),
      lastCountedAt: json['lastCountedAt'] == null
          ? null
          : DateTime.parse(json['lastCountedAt'] as String),
      lastMovementAt: json['lastMovementAt'] == null
          ? null
          : DateTime.parse(json['lastMovementAt'] as String),
      productName: json['productName'] as String?,
      productSku: json['productSku'] as String?,
      warehouseName: json['warehouseName'] as String?,
      categoryName: json['categoryName'] as String?,
    );

Map<String, dynamic> _$$StockLevelImplToJson(_$StockLevelImpl instance) =>
    <String, dynamic>{
      'productUuid': instance.productUuid,
      'warehouseUuid': instance.warehouseUuid,
      'quantity': instance.quantity,
      'reservedQuantity': instance.reservedQuantity,
      'availableQuantity': instance.availableQuantity,
      'reorderPoint': instance.reorderPoint,
      'reorderQuantity': instance.reorderQuantity,
      'maxStockLevel': instance.maxStockLevel,
      'averageCost': instance.averageCost,
      'averageDailySales': instance.averageDailySales,
      'daysOfStock': instance.daysOfStock,
      'lastCountedAt': instance.lastCountedAt?.toIso8601String(),
      'lastMovementAt': instance.lastMovementAt?.toIso8601String(),
      'productName': instance.productName,
      'productSku': instance.productSku,
      'warehouseName': instance.warehouseName,
      'categoryName': instance.categoryName,
    };

_$BatchImpl _$$BatchImplFromJson(Map<String, dynamic> json) => _$BatchImpl(
      uuid: json['uuid'] as String,
      productUuid: json['productUuid'] as String,
      warehouseUuid: json['warehouseUuid'] as String,
      batchNumber: json['batchNumber'] as String,
      supplierUuid: json['supplierUuid'] as String?,
      poUuid: json['poUuid'] as String?,
      initialQuantity: (json['initialQuantity'] as num).toDouble(),
      currentQuantity: (json['currentQuantity'] as num).toDouble(),
      unitCost: (json['unitCost'] as num).toDouble(),
      manufacturedAt: json['manufacturedAt'] == null
          ? null
          : DateTime.parse(json['manufacturedAt'] as String),
      expiryDate: json['expiryDate'] == null
          ? null
          : DateTime.parse(json['expiryDate'] as String),
      receivedAt: DateTime.parse(json['receivedAt'] as String),
      status: $enumDecodeNullable(_$BatchStatusEnumMap, json['status']) ??
          BatchStatus.active,
      notes: json['notes'] as String?,
      productName: json['productName'] as String?,
      supplierName: json['supplierName'] as String?,
      daysUntilExpiry: (json['daysUntilExpiry'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$BatchImplToJson(_$BatchImpl instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'productUuid': instance.productUuid,
      'warehouseUuid': instance.warehouseUuid,
      'batchNumber': instance.batchNumber,
      'supplierUuid': instance.supplierUuid,
      'poUuid': instance.poUuid,
      'initialQuantity': instance.initialQuantity,
      'currentQuantity': instance.currentQuantity,
      'unitCost': instance.unitCost,
      'manufacturedAt': instance.manufacturedAt?.toIso8601String(),
      'expiryDate': instance.expiryDate?.toIso8601String(),
      'receivedAt': instance.receivedAt.toIso8601String(),
      'status': _$BatchStatusEnumMap[instance.status]!,
      'notes': instance.notes,
      'productName': instance.productName,
      'supplierName': instance.supplierName,
      'daysUntilExpiry': instance.daysUntilExpiry,
    };

const _$BatchStatusEnumMap = {
  BatchStatus.active: 'active',
  BatchStatus.depleted: 'depleted',
  BatchStatus.expired: 'expired',
  BatchStatus.quarantine: 'quarantine',
  BatchStatus.recalled: 'recalled',
};

_$StockAlertImpl _$$StockAlertImplFromJson(Map<String, dynamic> json) =>
    _$StockAlertImpl(
      uuid: json['uuid'] as String,
      productUuid: json['productUuid'] as String,
      productName: json['productName'] as String,
      warehouseUuid: json['warehouseUuid'] as String?,
      warehouseName: json['warehouseName'] as String?,
      alertType: $enumDecode(_$AlertTypeEnumMap, json['alertType']),
      severity: $enumDecodeNullable(_$AlertSeverityEnumMap, json['severity']) ??
          AlertSeverity.warning,
      currentValue: (json['currentValue'] as num?)?.toDouble(),
      thresholdValue: (json['thresholdValue'] as num?)?.toDouble(),
      daysBeforeExpiry: (json['daysBeforeExpiry'] as num?)?.toInt(),
      message: json['message'] as String,
      isAcknowledged: json['isAcknowledged'] as bool? ?? false,
      acknowledgedBy: json['acknowledgedBy'] as String?,
      acknowledgedAt: json['acknowledgedAt'] == null
          ? null
          : DateTime.parse(json['acknowledgedAt'] as String),
      actionTaken: json['actionTaken'] as String?,
      isResolved: json['isResolved'] as bool? ?? false,
      resolvedAt: json['resolvedAt'] == null
          ? null
          : DateTime.parse(json['resolvedAt'] as String),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$StockAlertImplToJson(_$StockAlertImpl instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'productUuid': instance.productUuid,
      'productName': instance.productName,
      'warehouseUuid': instance.warehouseUuid,
      'warehouseName': instance.warehouseName,
      'alertType': _$AlertTypeEnumMap[instance.alertType]!,
      'severity': _$AlertSeverityEnumMap[instance.severity]!,
      'currentValue': instance.currentValue,
      'thresholdValue': instance.thresholdValue,
      'daysBeforeExpiry': instance.daysBeforeExpiry,
      'message': instance.message,
      'isAcknowledged': instance.isAcknowledged,
      'acknowledgedBy': instance.acknowledgedBy,
      'acknowledgedAt': instance.acknowledgedAt?.toIso8601String(),
      'actionTaken': instance.actionTaken,
      'isResolved': instance.isResolved,
      'resolvedAt': instance.resolvedAt?.toIso8601String(),
      'createdAt': instance.createdAt?.toIso8601String(),
    };

const _$AlertTypeEnumMap = {
  AlertType.lowStock: 'lowStock',
  AlertType.outOfStock: 'outOfStock',
  AlertType.overstock: 'overstock',
  AlertType.expiringSoon: 'expiringSoon',
  AlertType.expired: 'expired',
};

const _$AlertSeverityEnumMap = {
  AlertSeverity.info: 'info',
  AlertSeverity.warning: 'warning',
  AlertSeverity.critical: 'critical',
};

_$StockAlertConfigImpl _$$StockAlertConfigImplFromJson(
        Map<String, dynamic> json) =>
    _$StockAlertConfigImpl(
      uuid: json['uuid'] as String,
      productUuid: json['productUuid'] as String,
      warehouseUuid: json['warehouseUuid'] as String?,
      lowStockThreshold: (json['lowStockThreshold'] as num?)?.toDouble(),
      criticalStockThreshold:
          (json['criticalStockThreshold'] as num?)?.toDouble(),
      overstockThreshold: (json['overstockThreshold'] as num?)?.toDouble(),
      expiryWarningDays: (json['expiryWarningDays'] as num?)?.toInt() ?? 7,
      lowStockEmailEnabled: json['lowStockEmailEnabled'] as bool? ?? true,
      outOfStockEmailEnabled: json['outOfStockEmailEnabled'] as bool? ?? true,
      expiryEmailEnabled: json['expiryEmailEnabled'] as bool? ?? true,
    );

Map<String, dynamic> _$$StockAlertConfigImplToJson(
        _$StockAlertConfigImpl instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'productUuid': instance.productUuid,
      'warehouseUuid': instance.warehouseUuid,
      'lowStockThreshold': instance.lowStockThreshold,
      'criticalStockThreshold': instance.criticalStockThreshold,
      'overstockThreshold': instance.overstockThreshold,
      'expiryWarningDays': instance.expiryWarningDays,
      'lowStockEmailEnabled': instance.lowStockEmailEnabled,
      'outOfStockEmailEnabled': instance.outOfStockEmailEnabled,
      'expiryEmailEnabled': instance.expiryEmailEnabled,
    };

_$AdvancedStockTransferImpl _$$AdvancedStockTransferImplFromJson(
        Map<String, dynamic> json) =>
    _$AdvancedStockTransferImpl(
      uuid: json['uuid'] as String,
      transferNumber: json['transferNumber'] as String,
      sourceWarehouseUuid: json['sourceWarehouseUuid'] as String,
      sourceWarehouseName: json['sourceWarehouseName'] as String,
      targetWarehouseUuid: json['targetWarehouseUuid'] as String,
      targetWarehouseName: json['targetWarehouseName'] as String,
      status: $enumDecodeNullable(_$TransferStatusEnumMap, json['status']) ??
          TransferStatus.draft,
      createdBy: json['createdBy'] as String,
      createdByName: json['createdByName'] as String,
      approvedBy: json['approvedBy'] as String?,
      approvedAt: json['approvedAt'] == null
          ? null
          : DateTime.parse(json['approvedAt'] as String),
      notes: json['notes'] as String?,
      totalValue: (json['totalValue'] as num?)?.toDouble() ?? 0,
      totalItems: (json['totalItems'] as num?)?.toInt() ?? 0,
      expectedDeliveryAt: json['expectedDeliveryAt'] == null
          ? null
          : DateTime.parse(json['expectedDeliveryAt'] as String),
      shippedAt: json['shippedAt'] == null
          ? null
          : DateTime.parse(json['shippedAt'] as String),
      receivedAt: json['receivedAt'] == null
          ? null
          : DateTime.parse(json['receivedAt'] as String),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      items: (json['items'] as List<dynamic>?)
              ?.map((e) =>
                  AdvancedStockTransferItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$AdvancedStockTransferImplToJson(
        _$AdvancedStockTransferImpl instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'transferNumber': instance.transferNumber,
      'sourceWarehouseUuid': instance.sourceWarehouseUuid,
      'sourceWarehouseName': instance.sourceWarehouseName,
      'targetWarehouseUuid': instance.targetWarehouseUuid,
      'targetWarehouseName': instance.targetWarehouseName,
      'status': _$TransferStatusEnumMap[instance.status]!,
      'createdBy': instance.createdBy,
      'createdByName': instance.createdByName,
      'approvedBy': instance.approvedBy,
      'approvedAt': instance.approvedAt?.toIso8601String(),
      'notes': instance.notes,
      'totalValue': instance.totalValue,
      'totalItems': instance.totalItems,
      'expectedDeliveryAt': instance.expectedDeliveryAt?.toIso8601String(),
      'shippedAt': instance.shippedAt?.toIso8601String(),
      'receivedAt': instance.receivedAt?.toIso8601String(),
      'createdAt': instance.createdAt?.toIso8601String(),
      'items': instance.items,
    };

const _$TransferStatusEnumMap = {
  TransferStatus.draft: 'draft',
  TransferStatus.pendingApproval: 'pendingApproval',
  TransferStatus.approved: 'approved',
  TransferStatus.inTransit: 'inTransit',
  TransferStatus.partiallyReceived: 'partiallyReceived',
  TransferStatus.completed: 'completed',
  TransferStatus.cancelled: 'cancelled',
};

_$AdvancedStockTransferItemImpl _$$AdvancedStockTransferItemImplFromJson(
        Map<String, dynamic> json) =>
    _$AdvancedStockTransferItemImpl(
      transferUuid: json['transferUuid'] as String,
      productUuid: json['productUuid'] as String,
      productName: json['productName'] as String,
      batchUuid: json['batchUuid'] as String?,
      quantityRequested: (json['quantityRequested'] as num).toDouble(),
      quantityShipped: (json['quantityShipped'] as num?)?.toDouble() ?? 0,
      quantityReceived: (json['quantityReceived'] as num?)?.toDouble() ?? 0,
      unitCost: (json['unitCost'] as num).toDouble(),
      notes: json['notes'] as String?,
    );

Map<String, dynamic> _$$AdvancedStockTransferItemImplToJson(
        _$AdvancedStockTransferItemImpl instance) =>
    <String, dynamic>{
      'transferUuid': instance.transferUuid,
      'productUuid': instance.productUuid,
      'productName': instance.productName,
      'batchUuid': instance.batchUuid,
      'quantityRequested': instance.quantityRequested,
      'quantityShipped': instance.quantityShipped,
      'quantityReceived': instance.quantityReceived,
      'unitCost': instance.unitCost,
      'notes': instance.notes,
    };

_$StockMovementImpl _$$StockMovementImplFromJson(Map<String, dynamic> json) =>
    _$StockMovementImpl(
      uuid: json['uuid'] as String,
      productUuid: json['productUuid'] as String,
      productName: json['productName'] as String,
      warehouseUuid: json['warehouseUuid'] as String,
      warehouseName: json['warehouseName'] as String?,
      batchUuid: json['batchUuid'] as String?,
      movementType: $enumDecode(_$MovementTypeEnumMap, json['movementType']),
      quantityChange: (json['quantityChange'] as num).toDouble(),
      unitCost: (json['unitCost'] as num?)?.toDouble(),
      totalCost: (json['totalCost'] as num?)?.toDouble(),
      referenceType: json['referenceType'] as String?,
      referenceUuid: json['referenceUuid'] as String?,
      referenceNumber: json['referenceNumber'] as String?,
      reasonCode: json['reasonCode'] as String?,
      notes: json['notes'] as String?,
      performedBy: json['performedBy'] as String,
      performedByName: json['performedByName'] as String,
      balanceBefore: (json['balanceBefore'] as num).toDouble(),
      balanceAfter: (json['balanceAfter'] as num).toDouble(),
      timestamp: DateTime.parse(json['timestamp'] as String),
    );

Map<String, dynamic> _$$StockMovementImplToJson(_$StockMovementImpl instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'productUuid': instance.productUuid,
      'productName': instance.productName,
      'warehouseUuid': instance.warehouseUuid,
      'warehouseName': instance.warehouseName,
      'batchUuid': instance.batchUuid,
      'movementType': _$MovementTypeEnumMap[instance.movementType]!,
      'quantityChange': instance.quantityChange,
      'unitCost': instance.unitCost,
      'totalCost': instance.totalCost,
      'referenceType': instance.referenceType,
      'referenceUuid': instance.referenceUuid,
      'referenceNumber': instance.referenceNumber,
      'reasonCode': instance.reasonCode,
      'notes': instance.notes,
      'performedBy': instance.performedBy,
      'performedByName': instance.performedByName,
      'balanceBefore': instance.balanceBefore,
      'balanceAfter': instance.balanceAfter,
      'timestamp': instance.timestamp.toIso8601String(),
    };

const _$MovementTypeEnumMap = {
  MovementType.sale: 'sale',
  MovementType.purchase: 'purchase',
  MovementType.adjustment: 'adjustment',
  MovementType.transferIn: 'transferIn',
  MovementType.transferOut: 'transferOut',
  MovementType.waste: 'waste',
  MovementType.countVariance: 'countVariance',
  MovementType.returnStock: 'returnStock',
};

_$InventoryInsightImpl _$$InventoryInsightImplFromJson(
        Map<String, dynamic> json) =>
    _$InventoryInsightImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      insightType: json['insightType'] as String,
      severity: json['severity'] as String,
      productUuid: json['productUuid'] as String?,
      productName: json['productName'] as String?,
      warehouseUuid: json['warehouseUuid'] as String?,
      currentValue: (json['currentValue'] as num?)?.toDouble(),
      recommendedValue: (json['recommendedValue'] as num?)?.toDouble(),
      actionLabel: json['actionLabel'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$InventoryInsightImplToJson(
        _$InventoryInsightImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'insightType': instance.insightType,
      'severity': instance.severity,
      'productUuid': instance.productUuid,
      'productName': instance.productName,
      'warehouseUuid': instance.warehouseUuid,
      'currentValue': instance.currentValue,
      'recommendedValue': instance.recommendedValue,
      'actionLabel': instance.actionLabel,
      'createdAt': instance.createdAt?.toIso8601String(),
    };

_$InventoryDashboardStatsImpl _$$InventoryDashboardStatsImplFromJson(
        Map<String, dynamic> json) =>
    _$InventoryDashboardStatsImpl(
      totalProducts: (json['totalProducts'] as num?)?.toInt() ?? 0,
      totalWarehouses: (json['totalWarehouses'] as num?)?.toInt() ?? 0,
      totalStockValue: (json['totalStockValue'] as num?)?.toDouble() ?? 0,
      lowStockCount: (json['lowStockCount'] as num?)?.toInt() ?? 0,
      outOfStockCount: (json['outOfStockCount'] as num?)?.toInt() ?? 0,
      expiringCount: (json['expiringCount'] as num?)?.toInt() ?? 0,
      alertsCount: (json['alertsCount'] as num?)?.toInt() ?? 0,
      pendingTransfers: (json['pendingTransfers'] as num?)?.toInt() ?? 0,
      pendingPurchaseOrders:
          (json['pendingPurchaseOrders'] as num?)?.toInt() ?? 0,
      averageTurnoverRate:
          (json['averageTurnoverRate'] as num?)?.toDouble() ?? 0.0,
      recentAlerts: (json['recentAlerts'] as List<dynamic>?)
              ?.map((e) => StockAlert.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      insights: (json['insights'] as List<dynamic>?)
              ?.map((e) => InventoryInsight.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$InventoryDashboardStatsImplToJson(
        _$InventoryDashboardStatsImpl instance) =>
    <String, dynamic>{
      'totalProducts': instance.totalProducts,
      'totalWarehouses': instance.totalWarehouses,
      'totalStockValue': instance.totalStockValue,
      'lowStockCount': instance.lowStockCount,
      'outOfStockCount': instance.outOfStockCount,
      'expiringCount': instance.expiringCount,
      'alertsCount': instance.alertsCount,
      'pendingTransfers': instance.pendingTransfers,
      'pendingPurchaseOrders': instance.pendingPurchaseOrders,
      'averageTurnoverRate': instance.averageTurnoverRate,
      'recentAlerts': instance.recentAlerts,
      'insights': instance.insights,
    };

_$VarianceReportImpl _$$VarianceReportImplFromJson(Map<String, dynamic> json) =>
    _$VarianceReportImpl(
      productUuid: json['productUuid'] as String,
      productName: json['productName'] as String,
      warehouseUuid: json['warehouseUuid'] as String,
      warehouseName: json['warehouseName'] as String,
      theoreticalStock: (json['theoreticalStock'] as num).toDouble(),
      actualStock: (json['actualStock'] as num).toDouble(),
      variance: (json['variance'] as num).toDouble(),
      variancePercentage: (json['variancePercentage'] as num).toDouble(),
      varianceCost: (json['varianceCost'] as num).toDouble(),
      possibleReason: json['possibleReason'] as String?,
      countDate: json['countDate'] == null
          ? null
          : DateTime.parse(json['countDate'] as String),
    );

Map<String, dynamic> _$$VarianceReportImplToJson(
        _$VarianceReportImpl instance) =>
    <String, dynamic>{
      'productUuid': instance.productUuid,
      'productName': instance.productName,
      'warehouseUuid': instance.warehouseUuid,
      'warehouseName': instance.warehouseName,
      'theoreticalStock': instance.theoreticalStock,
      'actualStock': instance.actualStock,
      'variance': instance.variance,
      'variancePercentage': instance.variancePercentage,
      'varianceCost': instance.varianceCost,
      'possibleReason': instance.possibleReason,
      'countDate': instance.countDate?.toIso8601String(),
    };
