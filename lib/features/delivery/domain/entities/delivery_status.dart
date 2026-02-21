import 'package:freezed_annotation/freezed_annotation.dart';

@JsonEnum()
enum DeliveryStatus {
  @JsonValue('new_unaccepted') newUnaccepted,
  @JsonValue('accepted') accepted,
  @JsonValue('preparing') preparing,
  @JsonValue('ready_for_pickup') readyForPickup,
  @JsonValue('picked_up') pickedUp,
  @JsonValue('cancelled') cancelled,
}
