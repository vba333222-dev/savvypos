import 'package:freezed_annotation/freezed_annotation.dart';

part 'delivery_channel.freezed.dart';
part 'delivery_channel.g.dart';

@JsonEnum()
enum DeliveryChannel {
  @JsonValue('grab')
  grab,
  @JsonValue('gojek')
  gojek,
  @JsonValue('shopee')
  shopee,
  @JsonValue('web')
  web,
  @JsonValue('unknown')
  unknown,
}

@freezed
class DeliveryChannelConfig with _$DeliveryChannelConfig {
  const factory DeliveryChannelConfig({
    required String id,
    required DeliveryChannel provider,
    @Default(true) bool isActive,
    @Default(true) bool autoAcceptOrders,
    @Default(0.0) double surchargePercent,
    DateTime? lastSyncedAt,
  }) = _DeliveryChannelConfig;

  factory DeliveryChannelConfig.fromJson(Map<String, dynamic> json) =>
      _$DeliveryChannelConfigFromJson(json);
}
