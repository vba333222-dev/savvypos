// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cash_drawer_entities.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CashDrawerImpl _$$CashDrawerImplFromJson(Map<String, dynamic> json) =>
    _$CashDrawerImpl(
      id: json['id'] as String,
      shiftUuid: json['shiftUuid'] as String,
      employeeUuid: json['employeeUuid'] as String,
      employeeName: json['employeeName'] as String,
      startingBalance: (json['startingBalance'] as num).toDouble(),
      currentBalance: (json['currentBalance'] as num).toDouble(),
      expectedBalance: (json['expectedBalance'] as num).toDouble(),
      state: $enumDecode(_$DrawerStateEnumMap, json['state']),
      openedAt: DateTime.parse(json['openedAt'] as String),
      closedAt: json['closedAt'] == null
          ? null
          : DateTime.parse(json['closedAt'] as String),
      closingBalance: (json['closingBalance'] as num?)?.toDouble(),
      variance: (json['variance'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$CashDrawerImplToJson(_$CashDrawerImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'shiftUuid': instance.shiftUuid,
      'employeeUuid': instance.employeeUuid,
      'employeeName': instance.employeeName,
      'startingBalance': instance.startingBalance,
      'currentBalance': instance.currentBalance,
      'expectedBalance': instance.expectedBalance,
      'state': _$DrawerStateEnumMap[instance.state]!,
      'openedAt': instance.openedAt.toIso8601String(),
      'closedAt': instance.closedAt?.toIso8601String(),
      'closingBalance': instance.closingBalance,
      'variance': instance.variance,
    };

const _$DrawerStateEnumMap = {
  DrawerState.open: 'open',
  DrawerState.closed: 'closed',
};

_$CashEventImpl _$$CashEventImplFromJson(Map<String, dynamic> json) =>
    _$CashEventImpl(
      id: json['id'] as String,
      drawerUuid: json['drawerUuid'] as String,
      type: $enumDecode(_$CashEventTypeEnumMap, json['type']),
      amount: (json['amount'] as num).toDouble(),
      reason: json['reason'] as String,
      comment: json['comment'] as String?,
      performedBy: json['performedBy'] as String?,
      orderUuid: json['orderUuid'] as String?,
      timestamp: DateTime.parse(json['timestamp'] as String),
    );

Map<String, dynamic> _$$CashEventImplToJson(_$CashEventImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'drawerUuid': instance.drawerUuid,
      'type': _$CashEventTypeEnumMap[instance.type]!,
      'amount': instance.amount,
      'reason': instance.reason,
      'comment': instance.comment,
      'performedBy': instance.performedBy,
      'orderUuid': instance.orderUuid,
      'timestamp': instance.timestamp.toIso8601String(),
    };

const _$CashEventTypeEnumMap = {
  CashEventType.cashIn: 'cashIn',
  CashEventType.cashOut: 'cashOut',
  CashEventType.cashDrop: 'cashDrop',
  CashEventType.noSale: 'noSale',
  CashEventType.sale: 'sale',
  CashEventType.refund: 'refund',
};

_$CashDrawerSummaryImpl _$$CashDrawerSummaryImplFromJson(
        Map<String, dynamic> json) =>
    _$CashDrawerSummaryImpl(
      totalCashIn: (json['totalCashIn'] as num).toDouble(),
      totalCashOut: (json['totalCashOut'] as num).toDouble(),
      totalSales: (json['totalSales'] as num).toDouble(),
      totalRefunds: (json['totalRefunds'] as num).toDouble(),
      totalDrops: (json['totalDrops'] as num).toDouble(),
      noSaleCount: (json['noSaleCount'] as num).toInt(),
      netCash: (json['netCash'] as num).toDouble(),
    );

Map<String, dynamic> _$$CashDrawerSummaryImplToJson(
        _$CashDrawerSummaryImpl instance) =>
    <String, dynamic>{
      'totalCashIn': instance.totalCashIn,
      'totalCashOut': instance.totalCashOut,
      'totalSales': instance.totalSales,
      'totalRefunds': instance.totalRefunds,
      'totalDrops': instance.totalDrops,
      'noSaleCount': instance.noSaleCount,
      'netCash': instance.netCash,
    };
