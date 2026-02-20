// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gift_card.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GiftCardImpl _$$GiftCardImplFromJson(Map<String, dynamic> json) =>
    _$GiftCardImpl(
      uuid: json['uuid'] as String,
      cardNumber: json['cardNumber'] as String,
      barcode: json['barcode'] as String?,
      initialValue: (json['initialValue'] as num).toDouble(),
      currentBalance: (json['currentBalance'] as num).toDouble(),
      customerUuid: json['customerUuid'] as String?,
      customerName: json['customerName'] as String?,
      customerEmail: json['customerEmail'] as String?,
      customerPhone: json['customerPhone'] as String?,
      status: $enumDecodeNullable(_$GiftCardStatusEnumMap, json['status']) ??
          GiftCardStatus.active,
      activatedAt: DateTime.parse(json['activatedAt'] as String),
      expiresAt: json['expiresAt'] == null
          ? null
          : DateTime.parse(json['expiresAt'] as String),
      lastUsedAt: json['lastUsedAt'] == null
          ? null
          : DateTime.parse(json['lastUsedAt'] as String),
      pin: json['pin'] as String?,
      activatedByEmployeeUuid: json['activatedByEmployeeUuid'] as String?,
      activatedByEmployeeName: json['activatedByEmployeeName'] as String?,
      notes: json['notes'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$GiftCardImplToJson(_$GiftCardImpl instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'cardNumber': instance.cardNumber,
      'barcode': instance.barcode,
      'initialValue': instance.initialValue,
      'currentBalance': instance.currentBalance,
      'customerUuid': instance.customerUuid,
      'customerName': instance.customerName,
      'customerEmail': instance.customerEmail,
      'customerPhone': instance.customerPhone,
      'status': _$GiftCardStatusEnumMap[instance.status]!,
      'activatedAt': instance.activatedAt.toIso8601String(),
      'expiresAt': instance.expiresAt?.toIso8601String(),
      'lastUsedAt': instance.lastUsedAt?.toIso8601String(),
      'pin': instance.pin,
      'activatedByEmployeeUuid': instance.activatedByEmployeeUuid,
      'activatedByEmployeeName': instance.activatedByEmployeeName,
      'notes': instance.notes,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };

const _$GiftCardStatusEnumMap = {
  GiftCardStatus.active: 'active',
  GiftCardStatus.used: 'used',
  GiftCardStatus.expired: 'expired',
  GiftCardStatus.cancelled: 'cancelled',
  GiftCardStatus.suspended: 'suspended',
};

_$GiftCardTransactionImpl _$$GiftCardTransactionImplFromJson(
        Map<String, dynamic> json) =>
    _$GiftCardTransactionImpl(
      uuid: json['uuid'] as String,
      giftCardUuid: json['giftCardUuid'] as String,
      type: $enumDecode(_$GiftCardTransactionTypeEnumMap, json['type']),
      amount: (json['amount'] as num).toDouble(),
      balanceAfter: (json['balanceAfter'] as num).toDouble(),
      orderUuid: json['orderUuid'] as String?,
      orderNumber: json['orderNumber'] as String?,
      performedByUuid: json['performedByUuid'] as String,
      performedByName: json['performedByName'] as String,
      notes: json['notes'] as String?,
      timestamp: DateTime.parse(json['timestamp'] as String),
    );

Map<String, dynamic> _$$GiftCardTransactionImplToJson(
        _$GiftCardTransactionImpl instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'giftCardUuid': instance.giftCardUuid,
      'type': _$GiftCardTransactionTypeEnumMap[instance.type]!,
      'amount': instance.amount,
      'balanceAfter': instance.balanceAfter,
      'orderUuid': instance.orderUuid,
      'orderNumber': instance.orderNumber,
      'performedByUuid': instance.performedByUuid,
      'performedByName': instance.performedByName,
      'notes': instance.notes,
      'timestamp': instance.timestamp.toIso8601String(),
    };

const _$GiftCardTransactionTypeEnumMap = {
  GiftCardTransactionType.activation: 'activation',
  GiftCardTransactionType.reload: 'reload',
  GiftCardTransactionType.redemption: 'redemption',
  GiftCardTransactionType.refund: 'refund',
  GiftCardTransactionType.adjustment: 'adjustment',
  GiftCardTransactionType.expiry: 'expiry',
};

_$GiftCardSummaryImpl _$$GiftCardSummaryImplFromJson(
        Map<String, dynamic> json) =>
    _$GiftCardSummaryImpl(
      totalCardsIssued: (json['totalCardsIssued'] as num).toInt(),
      activeCards: (json['activeCards'] as num).toInt(),
      totalValueIssued: (json['totalValueIssued'] as num).toDouble(),
      totalRedemptions: (json['totalRedemptions'] as num).toDouble(),
      outstandingLiability: (json['outstandingLiability'] as num).toDouble(),
      expiredValue: (json['expiredValue'] as num).toDouble(),
      periodStart: json['periodStart'] == null
          ? null
          : DateTime.parse(json['periodStart'] as String),
      periodEnd: json['periodEnd'] == null
          ? null
          : DateTime.parse(json['periodEnd'] as String),
    );

Map<String, dynamic> _$$GiftCardSummaryImplToJson(
        _$GiftCardSummaryImpl instance) =>
    <String, dynamic>{
      'totalCardsIssued': instance.totalCardsIssued,
      'activeCards': instance.activeCards,
      'totalValueIssued': instance.totalValueIssued,
      'totalRedemptions': instance.totalRedemptions,
      'outstandingLiability': instance.outstandingLiability,
      'expiredValue': instance.expiredValue,
      'periodStart': instance.periodStart?.toIso8601String(),
      'periodEnd': instance.periodEnd?.toIso8601String(),
    };
