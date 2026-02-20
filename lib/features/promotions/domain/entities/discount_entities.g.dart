// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'discount_entities.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DiscountImpl _$$DiscountImplFromJson(Map<String, dynamic> json) =>
    _$DiscountImpl(
      uuid: json['uuid'] as String,
      name: json['name'] as String,
      code: json['code'] as String,
      description: json['description'] as String?,
      type: $enumDecode(_$DiscountTypeEnumMap, json['type']),
      scope: $enumDecode(_$DiscountScopeEnumMap, json['scope']),
      status: $enumDecodeNullable(_$DiscountStatusEnumMap, json['status']) ??
          DiscountStatus.active,
      percentageOff: (json['percentageOff'] as num?)?.toDouble(),
      fixedAmountOff: (json['fixedAmountOff'] as num?)?.toDouble(),
      buyQuantity: (json['buyQuantity'] as num?)?.toInt(),
      getQuantity: (json['getQuantity'] as num?)?.toInt(),
      getDiscountPercent: (json['getDiscountPercent'] as num?)?.toDouble(),
      tiers: (json['tiers'] as List<dynamic>?)
              ?.map((e) => DiscountTier.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      minOrderAmount: (json['minOrderAmount'] as num?)?.toDouble(),
      maxDiscountAmount: (json['maxDiscountAmount'] as num?)?.toDouble(),
      maxUsesTotal: (json['maxUsesTotal'] as num?)?.toInt(),
      maxUsesPerCustomer: (json['maxUsesPerCustomer'] as num?)?.toInt(),
      currentUsageCount: (json['currentUsageCount'] as num?)?.toInt(),
      applicableProductUuids: (json['applicableProductUuids'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      applicableCategoryUuids:
          (json['applicableCategoryUuids'] as List<dynamic>?)
                  ?.map((e) => e as String)
                  .toList() ??
              const [],
      applicableCustomerUuids:
          (json['applicableCustomerUuids'] as List<dynamic>?)
                  ?.map((e) => e as String)
                  .toList() ??
              const [],
      validFrom: json['validFrom'] == null
          ? null
          : DateTime.parse(json['validFrom'] as String),
      validUntil: json['validUntil'] == null
          ? null
          : DateTime.parse(json['validUntil'] as String),
      validDaysOfWeek: (json['validDaysOfWeek'] as List<dynamic>?)
              ?.map((e) => (e as num).toInt())
              .toList() ??
          const [],
      validTimeStart: json['validTimeStart'] as String?,
      validTimeEnd: json['validTimeEnd'] as String?,
      canStackWithOthers: json['canStackWithOthers'] as bool? ?? false,
      stackPriority: (json['stackPriority'] as num?)?.toInt() ?? 0,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$DiscountImplToJson(_$DiscountImpl instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'name': instance.name,
      'code': instance.code,
      'description': instance.description,
      'type': _$DiscountTypeEnumMap[instance.type]!,
      'scope': _$DiscountScopeEnumMap[instance.scope]!,
      'status': _$DiscountStatusEnumMap[instance.status]!,
      'percentageOff': instance.percentageOff,
      'fixedAmountOff': instance.fixedAmountOff,
      'buyQuantity': instance.buyQuantity,
      'getQuantity': instance.getQuantity,
      'getDiscountPercent': instance.getDiscountPercent,
      'tiers': instance.tiers,
      'minOrderAmount': instance.minOrderAmount,
      'maxDiscountAmount': instance.maxDiscountAmount,
      'maxUsesTotal': instance.maxUsesTotal,
      'maxUsesPerCustomer': instance.maxUsesPerCustomer,
      'currentUsageCount': instance.currentUsageCount,
      'applicableProductUuids': instance.applicableProductUuids,
      'applicableCategoryUuids': instance.applicableCategoryUuids,
      'applicableCustomerUuids': instance.applicableCustomerUuids,
      'validFrom': instance.validFrom?.toIso8601String(),
      'validUntil': instance.validUntil?.toIso8601String(),
      'validDaysOfWeek': instance.validDaysOfWeek,
      'validTimeStart': instance.validTimeStart,
      'validTimeEnd': instance.validTimeEnd,
      'canStackWithOthers': instance.canStackWithOthers,
      'stackPriority': instance.stackPriority,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };

const _$DiscountTypeEnumMap = {
  DiscountType.percentage: 'percentage',
  DiscountType.fixed: 'fixed',
  DiscountType.bogo: 'bogo',
  DiscountType.buyXGetY: 'buyXGetY',
  DiscountType.tiered: 'tiered',
  DiscountType.freeItem: 'freeItem',
  DiscountType.bundle: 'bundle',
};

const _$DiscountScopeEnumMap = {
  DiscountScope.order: 'order',
  DiscountScope.item: 'item',
  DiscountScope.category: 'category',
  DiscountScope.customer: 'customer',
};

const _$DiscountStatusEnumMap = {
  DiscountStatus.active: 'active',
  DiscountStatus.scheduled: 'scheduled',
  DiscountStatus.expired: 'expired',
  DiscountStatus.disabled: 'disabled',
};

_$DiscountTierImpl _$$DiscountTierImplFromJson(Map<String, dynamic> json) =>
    _$DiscountTierImpl(
      minAmount: (json['minAmount'] as num).toDouble(),
      discountPercent: (json['discountPercent'] as num).toDouble(),
    );

Map<String, dynamic> _$$DiscountTierImplToJson(_$DiscountTierImpl instance) =>
    <String, dynamic>{
      'minAmount': instance.minAmount,
      'discountPercent': instance.discountPercent,
    };

_$AppliedDiscountImpl _$$AppliedDiscountImplFromJson(
        Map<String, dynamic> json) =>
    _$AppliedDiscountImpl(
      uuid: json['uuid'] as String,
      orderUuid: json['orderUuid'] as String,
      discountUuid: json['discountUuid'] as String,
      discountName: json['discountName'] as String,
      discountCode: json['discountCode'] as String,
      type: $enumDecode(_$DiscountTypeEnumMap, json['type']),
      discountAmount: (json['discountAmount'] as num).toDouble(),
      appliedToItemUuid: json['appliedToItemUuid'] as String?,
      appliedToItemName: json['appliedToItemName'] as String?,
      appliedAt: DateTime.parse(json['appliedAt'] as String),
      appliedByUuid: json['appliedByUuid'] as String?,
    );

Map<String, dynamic> _$$AppliedDiscountImplToJson(
        _$AppliedDiscountImpl instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'orderUuid': instance.orderUuid,
      'discountUuid': instance.discountUuid,
      'discountName': instance.discountName,
      'discountCode': instance.discountCode,
      'type': _$DiscountTypeEnumMap[instance.type]!,
      'discountAmount': instance.discountAmount,
      'appliedToItemUuid': instance.appliedToItemUuid,
      'appliedToItemName': instance.appliedToItemName,
      'appliedAt': instance.appliedAt.toIso8601String(),
      'appliedByUuid': instance.appliedByUuid,
    };

_$QuickDiscountImpl _$$QuickDiscountImplFromJson(Map<String, dynamic> json) =>
    _$QuickDiscountImpl(
      label: json['label'] as String,
      percentage: (json['percentage'] as num).toDouble(),
      iconType: $enumDecode(_$IconTypeEnumMap, json['iconType']),
    );

Map<String, dynamic> _$$QuickDiscountImplToJson(_$QuickDiscountImpl instance) =>
    <String, dynamic>{
      'label': instance.label,
      'percentage': instance.percentage,
      'iconType': _$IconTypeEnumMap[instance.iconType]!,
    };

const _$IconTypeEnumMap = {
  IconType.star: 'star',
  IconType.percent: 'percent',
  IconType.loyalty: 'loyalty',
  IconType.special: 'special',
  IconType.employee: 'employee',
};
