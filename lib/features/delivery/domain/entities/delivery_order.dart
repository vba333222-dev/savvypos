// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:savvy_pos/features/delivery/domain/entities/delivery_channel.dart';
import 'package:savvy_pos/features/delivery/domain/entities/delivery_status.dart';
import 'package:savvy_pos/features/delivery/domain/entities/driver_details.dart';
import 'package:savvy_pos/core/database/database.dart' show OrderTableData;

part 'delivery_order.freezed.dart';
part 'delivery_order.g.dart';

@freezed
class DeliveryOrder with _$DeliveryOrder {
  const factory DeliveryOrder({
    required String
        deliveryUuid, // Unique ID within Savvy for this delivery request
    required String externalOrderId, // The ID from Gojek/Grab
    required DeliveryChannel channel,
    @Default(DeliveryStatus.newUnaccepted) DeliveryStatus status,
    @Default(0.0) double deliveryFee,
    @Default(0.0) double packagingFee,
    DriverDetails? driverDetails,

    // Internal Order Reference
    // Since Savvy relies heavily on OrderTableData internally, we store the UUID
    // that connects this delivery request to a real, fulfilled transaction.
    String? internalOrderUuid,

    // Instead of directly wrapping the whole SQL row in a Freezed class,
    // we use @JsonKey(includeFromJson: false, includeToJson: false) to keep the object in memory when queried.
    @JsonKey(includeFromJson: false, includeToJson: false)
    OrderTableData? internalOrder,
  }) = _DeliveryOrder;

  factory DeliveryOrder.fromJson(Map<String, dynamic> json) =>
      _$DeliveryOrderFromJson(json);
}
