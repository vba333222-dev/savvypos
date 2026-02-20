// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kiosk_entities.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$KioskSessionImpl _$$KioskSessionImplFromJson(Map<String, dynamic> json) =>
    _$KioskSessionImpl(
      uuid: json['uuid'] as String,
      startedAt: DateTime.parse(json['startedAt'] as String),
      lastInteractionAt: json['lastInteractionAt'] == null
          ? null
          : DateTime.parse(json['lastInteractionAt'] as String),
      languageCode: json['languageCode'] as String? ?? 'en',
      isDineIn: json['isDineIn'] as bool? ?? false,
      cartItems: (json['cartItems'] as List<dynamic>?)
              ?.map((e) => KioskCartItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      currentStep:
          $enumDecodeNullable(_$KioskFlowStepEnumMap, json['currentStep']) ??
              KioskFlowStep.welcome,
    );

Map<String, dynamic> _$$KioskSessionImplToJson(_$KioskSessionImpl instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'startedAt': instance.startedAt.toIso8601String(),
      'lastInteractionAt': instance.lastInteractionAt?.toIso8601String(),
      'languageCode': instance.languageCode,
      'isDineIn': instance.isDineIn,
      'cartItems': instance.cartItems,
      'currentStep': _$KioskFlowStepEnumMap[instance.currentStep]!,
    };

const _$KioskFlowStepEnumMap = {
  KioskFlowStep.welcome: 'welcome',
  KioskFlowStep.diningOption: 'diningOption',
  KioskFlowStep.menu: 'menu',
  KioskFlowStep.cart: 'cart',
  KioskFlowStep.payment: 'payment',
  KioskFlowStep.success: 'success',
};

_$KioskCartItemImpl _$$KioskCartItemImplFromJson(Map<String, dynamic> json) =>
    _$KioskCartItemImpl(
      uuid: json['uuid'] as String,
      productUuid: json['productUuid'] as String,
      name: json['name'] as String,
      unitPrice: (json['unitPrice'] as num).toDouble(),
      quantity: (json['quantity'] as num).toInt(),
      imageUrl: json['imageUrl'] as String?,
      modifiers: (json['modifiers'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      note: json['note'] as String?,
    );

Map<String, dynamic> _$$KioskCartItemImplToJson(_$KioskCartItemImpl instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'productUuid': instance.productUuid,
      'name': instance.name,
      'unitPrice': instance.unitPrice,
      'quantity': instance.quantity,
      'imageUrl': instance.imageUrl,
      'modifiers': instance.modifiers,
      'note': instance.note,
    };
