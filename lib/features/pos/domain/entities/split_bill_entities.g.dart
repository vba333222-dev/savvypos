// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'split_bill_entities.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SplitBillImpl _$$SplitBillImplFromJson(Map<String, dynamic> json) =>
    _$SplitBillImpl(
      uuid: json['uuid'] as String,
      orderUuid: json['orderUuid'] as String,
      orderNumber: json['orderNumber'] as String,
      originalTotal: (json['originalTotal'] as num).toDouble(),
      guestCount: (json['guestCount'] as num).toInt(),
      mode: $enumDecode(_$SplitModeEnumMap, json['mode']),
      status: $enumDecodeNullable(_$SplitBillStatusEnumMap, json['status']) ??
          SplitBillStatus.active,
      guestBills: (json['guestBills'] as List<dynamic>?)
              ?.map((e) => GuestBill.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      createdByUuid: json['createdByUuid'] as String,
      createdByName: json['createdByName'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      completedAt: json['completedAt'] == null
          ? null
          : DateTime.parse(json['completedAt'] as String),
    );

Map<String, dynamic> _$$SplitBillImplToJson(_$SplitBillImpl instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'orderUuid': instance.orderUuid,
      'orderNumber': instance.orderNumber,
      'originalTotal': instance.originalTotal,
      'guestCount': instance.guestCount,
      'mode': _$SplitModeEnumMap[instance.mode]!,
      'status': _$SplitBillStatusEnumMap[instance.status]!,
      'guestBills': instance.guestBills,
      'createdByUuid': instance.createdByUuid,
      'createdByName': instance.createdByName,
      'createdAt': instance.createdAt.toIso8601String(),
      'completedAt': instance.completedAt?.toIso8601String(),
    };

const _$SplitModeEnumMap = {
  SplitMode.equal: 'equal',
  SplitMode.byItem: 'byItem',
  SplitMode.custom: 'custom',
  SplitMode.byGuest: 'byGuest',
};

const _$SplitBillStatusEnumMap = {
  SplitBillStatus.active: 'active',
  SplitBillStatus.partial: 'partial',
  SplitBillStatus.completed: 'completed',
  SplitBillStatus.cancelled: 'cancelled',
};

_$GuestBillImpl _$$GuestBillImplFromJson(Map<String, dynamic> json) =>
    _$GuestBillImpl(
      uuid: json['uuid'] as String,
      splitBillUuid: json['splitBillUuid'] as String,
      guestNumber: (json['guestNumber'] as num).toInt(),
      guestName: json['guestName'] as String?,
      items: (json['items'] as List<dynamic>?)
              ?.map((e) => SplitBillItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      totalAmount: (json['totalAmount'] as num).toDouble(),
      tipAmount: (json['tipAmount'] as num?)?.toDouble(),
      isPaid: json['isPaid'] as bool? ?? false,
      paymentMethod: json['paymentMethod'] as String?,
      paymentTransactionUuid: json['paymentTransactionUuid'] as String?,
      paidAt: json['paidAt'] == null
          ? null
          : DateTime.parse(json['paidAt'] as String),
    );

Map<String, dynamic> _$$GuestBillImplToJson(_$GuestBillImpl instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'splitBillUuid': instance.splitBillUuid,
      'guestNumber': instance.guestNumber,
      'guestName': instance.guestName,
      'items': instance.items,
      'totalAmount': instance.totalAmount,
      'tipAmount': instance.tipAmount,
      'isPaid': instance.isPaid,
      'paymentMethod': instance.paymentMethod,
      'paymentTransactionUuid': instance.paymentTransactionUuid,
      'paidAt': instance.paidAt?.toIso8601String(),
    };

_$SplitBillItemImpl _$$SplitBillItemImplFromJson(Map<String, dynamic> json) =>
    _$SplitBillItemImpl(
      uuid: json['uuid'] as String,
      orderItemUuid: json['orderItemUuid'] as String,
      productName: json['productName'] as String,
      price: (json['price'] as num).toDouble(),
      quantity: (json['quantity'] as num).toInt(),
      shareCount: (json['shareCount'] as num?)?.toInt() ?? 1,
      shareIndex: (json['shareIndex'] as num?)?.toInt() ?? 1,
    );

Map<String, dynamic> _$$SplitBillItemImplToJson(_$SplitBillItemImpl instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'orderItemUuid': instance.orderItemUuid,
      'productName': instance.productName,
      'price': instance.price,
      'quantity': instance.quantity,
      'shareCount': instance.shareCount,
      'shareIndex': instance.shareIndex,
    };

_$SplitPresetImpl _$$SplitPresetImplFromJson(Map<String, dynamic> json) =>
    _$SplitPresetImpl(
      label: json['label'] as String,
      guestCount: (json['guestCount'] as num).toInt(),
      mode: $enumDecode(_$SplitModeEnumMap, json['mode']),
    );

Map<String, dynamic> _$$SplitPresetImplToJson(_$SplitPresetImpl instance) =>
    <String, dynamic>{
      'label': instance.label,
      'guestCount': instance.guestCount,
      'mode': _$SplitModeEnumMap[instance.mode]!,
    };
