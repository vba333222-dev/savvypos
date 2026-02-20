// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inventory_entities.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SupplierImpl _$$SupplierImplFromJson(Map<String, dynamic> json) =>
    _$SupplierImpl(
      uuid: json['uuid'] as String,
      name: json['name'] as String,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      address: json['address'] as String?,
      leadTimeDays: (json['leadTimeDays'] as num).toInt(),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$SupplierImplToJson(_$SupplierImpl instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'name': instance.name,
      'email': instance.email,
      'phone': instance.phone,
      'address': instance.address,
      'leadTimeDays': instance.leadTimeDays,
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };

_$PurchaseOrderImpl _$$PurchaseOrderImplFromJson(Map<String, dynamic> json) =>
    _$PurchaseOrderImpl(
      uuid: json['uuid'] as String,
      supplierUuid: json['supplierUuid'] as String,
      targetWarehouseUuid: json['targetWarehouseUuid'] as String,
      status: $enumDecode(_$PoStatusEnumMap, json['status']),
      referenceNumber: json['referenceNumber'] as String?,
      notes: json['notes'] as String?,
      totalCost: (json['totalCost'] as num).toDouble(),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      items: (json['items'] as List<dynamic>?)
              ?.map(
                  (e) => PurchaseOrderItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$PurchaseOrderImplToJson(_$PurchaseOrderImpl instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'supplierUuid': instance.supplierUuid,
      'targetWarehouseUuid': instance.targetWarehouseUuid,
      'status': _$PoStatusEnumMap[instance.status]!,
      'referenceNumber': instance.referenceNumber,
      'notes': instance.notes,
      'totalCost': instance.totalCost,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'items': instance.items,
    };

const _$PoStatusEnumMap = {
  PoStatus.pending: 'pending',
  PoStatus.sent: 'sent',
  PoStatus.partiallyReceived: 'partiallyReceived',
  PoStatus.completed: 'completed',
  PoStatus.cancelled: 'cancelled',
};

_$PurchaseOrderItemImpl _$$PurchaseOrderItemImplFromJson(
        Map<String, dynamic> json) =>
    _$PurchaseOrderItemImpl(
      poUuid: json['poUuid'] as String,
      productUuid: json['productUuid'] as String?,
      ingredientUuid: json['ingredientUuid'] as String?,
      quantityOrdered: (json['quantityOrdered'] as num).toDouble(),
      quantityReceived: (json['quantityReceived'] as num).toDouble(),
      unitCost: (json['unitCost'] as num).toDouble(),
      productName: json['productName'] as String?,
    );

Map<String, dynamic> _$$PurchaseOrderItemImplToJson(
        _$PurchaseOrderItemImpl instance) =>
    <String, dynamic>{
      'poUuid': instance.poUuid,
      'productUuid': instance.productUuid,
      'ingredientUuid': instance.ingredientUuid,
      'quantityOrdered': instance.quantityOrdered,
      'quantityReceived': instance.quantityReceived,
      'unitCost': instance.unitCost,
      'productName': instance.productName,
    };

_$StockCountImpl _$$StockCountImplFromJson(Map<String, dynamic> json) =>
    _$StockCountImpl(
      uuid: json['uuid'] as String,
      warehouseUuid: json['warehouseUuid'] as String,
      status: json['status'] as String,
      startedAt: DateTime.parse(json['startedAt'] as String),
      completedAt: json['completedAt'] == null
          ? null
          : DateTime.parse(json['completedAt'] as String),
      conductedBy: json['conductedBy'] as String,
      items: (json['items'] as List<dynamic>?)
              ?.map((e) => StockCountItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$StockCountImplToJson(_$StockCountImpl instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'warehouseUuid': instance.warehouseUuid,
      'status': instance.status,
      'startedAt': instance.startedAt.toIso8601String(),
      'completedAt': instance.completedAt?.toIso8601String(),
      'conductedBy': instance.conductedBy,
      'items': instance.items,
    };

_$StockCountItemImpl _$$StockCountItemImplFromJson(Map<String, dynamic> json) =>
    _$StockCountItemImpl(
      countUuid: json['countUuid'] as String,
      productUuid: json['productUuid'] as String,
      expectedQty: (json['expectedQty'] as num).toDouble(),
      countedQty: (json['countedQty'] as num).toDouble(),
      variance: (json['variance'] as num).toDouble(),
      productName: json['productName'] as String?,
    );

Map<String, dynamic> _$$StockCountItemImplToJson(
        _$StockCountItemImpl instance) =>
    <String, dynamic>{
      'countUuid': instance.countUuid,
      'productUuid': instance.productUuid,
      'expectedQty': instance.expectedQty,
      'countedQty': instance.countedQty,
      'variance': instance.variance,
      'productName': instance.productName,
    };

_$InventoryLedgerImpl _$$InventoryLedgerImplFromJson(
        Map<String, dynamic> json) =>
    _$InventoryLedgerImpl(
      productUuid: json['productUuid'] as String,
      quantityChange: (json['quantityChange'] as num).toDouble(),
      referenceId: json['referenceId'] as String,
      type: json['type'] as String,
      timestamp: DateTime.parse(json['timestamp'] as String),
    );

Map<String, dynamic> _$$InventoryLedgerImplToJson(
        _$InventoryLedgerImpl instance) =>
    <String, dynamic>{
      'productUuid': instance.productUuid,
      'quantityChange': instance.quantityChange,
      'referenceId': instance.referenceId,
      'type': instance.type,
      'timestamp': instance.timestamp.toIso8601String(),
    };

_$StockTransferItemImpl _$$StockTransferItemImplFromJson(
        Map<String, dynamic> json) =>
    _$StockTransferItemImpl(
      productUuid: json['productUuid'] as String,
      quantity: (json['quantity'] as num).toDouble(),
      productName: json['productName'] as String?,
    );

Map<String, dynamic> _$$StockTransferItemImplToJson(
        _$StockTransferItemImpl instance) =>
    <String, dynamic>{
      'productUuid': instance.productUuid,
      'quantity': instance.quantity,
      'productName': instance.productName,
    };

_$StockTransferImpl _$$StockTransferImplFromJson(Map<String, dynamic> json) =>
    _$StockTransferImpl(
      uuid: json['uuid'] as String,
      sourceWarehouseUuid: json['sourceWarehouseUuid'] as String,
      targetWarehouseUuid: json['targetWarehouseUuid'] as String,
      status: json['status'] as String,
      createdBy: json['createdBy'] as String,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      completedAt: json['completedAt'] == null
          ? null
          : DateTime.parse(json['completedAt'] as String),
      items: (json['items'] as List<dynamic>?)
              ?.map(
                  (e) => StockTransferItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$StockTransferImplToJson(_$StockTransferImpl instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'sourceWarehouseUuid': instance.sourceWarehouseUuid,
      'targetWarehouseUuid': instance.targetWarehouseUuid,
      'status': instance.status,
      'createdBy': instance.createdBy,
      'createdAt': instance.createdAt?.toIso8601String(),
      'completedAt': instance.completedAt?.toIso8601String(),
      'items': instance.items,
    };
