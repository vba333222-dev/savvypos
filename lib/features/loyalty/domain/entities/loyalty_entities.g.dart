// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'loyalty_entities.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LoyaltyConfigImpl _$$LoyaltyConfigImplFromJson(Map<String, dynamic> json) =>
    _$LoyaltyConfigImpl(
      pointsPerDollar: (json['pointsPerDollar'] as num?)?.toDouble() ?? 1.0,
      pointsForVisit: (json['pointsForVisit'] as num?)?.toInt() ?? 10,
      signupBonus: (json['signupBonus'] as num?)?.toInt() ?? 50,
      birthdayBonus: (json['birthdayBonus'] as num?)?.toInt() ?? 100,
      redeemThreshold: (json['redeemThreshold'] as num?)?.toInt() ?? 100,
      redeemValue: (json['redeemValue'] as num?)?.toDouble() ?? 10.0,
    );

Map<String, dynamic> _$$LoyaltyConfigImplToJson(_$LoyaltyConfigImpl instance) =>
    <String, dynamic>{
      'pointsPerDollar': instance.pointsPerDollar,
      'pointsForVisit': instance.pointsForVisit,
      'signupBonus': instance.signupBonus,
      'birthdayBonus': instance.birthdayBonus,
      'redeemThreshold': instance.redeemThreshold,
      'redeemValue': instance.redeemValue,
    };

_$LoyaltyMemberImpl _$$LoyaltyMemberImplFromJson(Map<String, dynamic> json) =>
    _$LoyaltyMemberImpl(
      customerUuid: json['customerUuid'] as String,
      customerName: json['customerName'] as String,
      phoneNumber: json['phoneNumber'] as String,
      currentPoints: (json['currentPoints'] as num).toInt(),
      lifetimePoints: (json['lifetimePoints'] as num).toInt(),
      tier: $enumDecode(_$LoyaltyTierEnumMap, json['tier']),
      enrolledAt: json['enrolledAt'] == null
          ? null
          : DateTime.parse(json['enrolledAt'] as String),
      lastEarnedAt: json['lastEarnedAt'] == null
          ? null
          : DateTime.parse(json['lastEarnedAt'] as String),
      birthday: json['birthday'] == null
          ? null
          : DateTime.parse(json['birthday'] as String),
    );

Map<String, dynamic> _$$LoyaltyMemberImplToJson(_$LoyaltyMemberImpl instance) =>
    <String, dynamic>{
      'customerUuid': instance.customerUuid,
      'customerName': instance.customerName,
      'phoneNumber': instance.phoneNumber,
      'currentPoints': instance.currentPoints,
      'lifetimePoints': instance.lifetimePoints,
      'tier': _$LoyaltyTierEnumMap[instance.tier]!,
      'enrolledAt': instance.enrolledAt?.toIso8601String(),
      'lastEarnedAt': instance.lastEarnedAt?.toIso8601String(),
      'birthday': instance.birthday?.toIso8601String(),
    };

const _$LoyaltyTierEnumMap = {
  LoyaltyTier.bronze: 'bronze',
  LoyaltyTier.silver: 'silver',
  LoyaltyTier.gold: 'gold',
  LoyaltyTier.platinum: 'platinum',
};

_$LoyaltyTransactionImpl _$$LoyaltyTransactionImplFromJson(
        Map<String, dynamic> json) =>
    _$LoyaltyTransactionImpl(
      id: json['id'] as String,
      customerUuid: json['customerUuid'] as String,
      pointsChange: (json['pointsChange'] as num).toInt(),
      reason: json['reason'] as String,
      transactionDate: json['transactionDate'] == null
          ? null
          : DateTime.parse(json['transactionDate'] as String),
      orderUuid: json['orderUuid'] as String?,
    );

Map<String, dynamic> _$$LoyaltyTransactionImplToJson(
        _$LoyaltyTransactionImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'customerUuid': instance.customerUuid,
      'pointsChange': instance.pointsChange,
      'reason': instance.reason,
      'transactionDate': instance.transactionDate?.toIso8601String(),
      'orderUuid': instance.orderUuid,
    };

_$LoyaltyRewardImpl _$$LoyaltyRewardImplFromJson(Map<String, dynamic> json) =>
    _$LoyaltyRewardImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      pointsCost: (json['pointsCost'] as num).toInt(),
      type: json['type'] as String,
      discountAmount: (json['discountAmount'] as num?)?.toDouble(),
      freeItemUuid: json['freeItemUuid'] as String?,
      isActive: json['isActive'] as bool? ?? true,
    );

Map<String, dynamic> _$$LoyaltyRewardImplToJson(_$LoyaltyRewardImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'pointsCost': instance.pointsCost,
      'type': instance.type,
      'discountAmount': instance.discountAmount,
      'freeItemUuid': instance.freeItemUuid,
      'isActive': instance.isActive,
    };
