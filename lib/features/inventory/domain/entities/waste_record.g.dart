// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'waste_record.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WasteRecordImpl _$$WasteRecordImplFromJson(Map<String, dynamic> json) =>
    _$WasteRecordImpl(
      id: json['id'] as String,
      itemId: json['itemId'] as String,
      itemType: $enumDecode(_$WasteItemTypeEnumMap, json['itemType']),
      quantity: (json['quantity'] as num).toDouble(),
      reason: $enumDecode(_$WasteReasonEnumMap, json['reason']),
      recordedAt: DateTime.parse(json['recordedAt'] as String),
      staffId: json['staffId'] as String,
      warehouseId: json['warehouseId'] as String,
      costLoss: (json['costLoss'] as num).toDouble(),
      note: json['note'] as String?,
      itemName: json['itemName'] as String?,
      unit: json['unit'] as String?,
    );

Map<String, dynamic> _$$WasteRecordImplToJson(_$WasteRecordImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'itemId': instance.itemId,
      'itemType': _$WasteItemTypeEnumMap[instance.itemType]!,
      'quantity': instance.quantity,
      'reason': _$WasteReasonEnumMap[instance.reason]!,
      'recordedAt': instance.recordedAt.toIso8601String(),
      'staffId': instance.staffId,
      'warehouseId': instance.warehouseId,
      'costLoss': instance.costLoss,
      'note': instance.note,
      'itemName': instance.itemName,
      'unit': instance.unit,
    };

const _$WasteItemTypeEnumMap = {
  WasteItemType.ingredient: 'ingredient',
  WasteItemType.product: 'product',
};

const _$WasteReasonEnumMap = {
  WasteReason.expired: 'expired',
  WasteReason.damaged: 'damaged',
  WasteReason.spoilage: 'spoilage',
  WasteReason.theft: 'theft',
  WasteReason.mistake: 'mistake',
  WasteReason.other: 'other',
};
