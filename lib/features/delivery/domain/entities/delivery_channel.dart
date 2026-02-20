import 'package:freezed_annotation/freezed_annotation.dart';

part 'delivery_channel.freezed.dart';
part 'delivery_channel.g.dart';

enum DeliveryProvider {
  uberEats,
  grabFood,
  goFood,
  doorDash,
  manual, // For phone orders
}

@freezed
class DeliveryChannelConfig with _$DeliveryChannelConfig {
  const factory DeliveryChannelConfig({
    required String id, // e.g., 'uber-eats-001'
    required DeliveryProvider provider,
    @Default(true) bool isActive,
    @Default(true) bool autoAcceptOrders,
    @Default(0.0) double surchargePercent, // e.g., 20.0 for 20% markup
    DateTime? lastSyncedAt,
  }) = _DeliveryChannelConfig;

  factory DeliveryChannelConfig.fromJson(Map<String, dynamic> json) => _$DeliveryChannelConfigFromJson(json);
}
