import 'package:freezed_annotation/freezed_annotation.dart';
import 'delivery_channel.dart';

part 'delivery_order_metadata.freezed.dart';
part 'delivery_order_metadata.g.dart';

@freezed
class DeliveryOrderMetadata with _$DeliveryOrderMetadata {
  const factory DeliveryOrderMetadata({
    required String orderUuid, // Link to core Order
    required DeliveryProvider provider,
    required String externalOrderId, // e.g., "#8839" from Uber
    String? driverName,
    String? driverPhone,
    String? driverPlate,
    DateTime? pickupTime,
    @Default('NEW') String deliveryStatus, // NEW, PREPARING, READY, PICKED_UP, DELIVERED, CANCELLED
  }) = _DeliveryOrderMetadata;

  factory DeliveryOrderMetadata.fromJson(Map<String, dynamic> json) => _$DeliveryOrderMetadataFromJson(json);
}
