import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:savvy_pos/features/delivery/domain/entities/delivery_channel.dart';

part 'product_mapping.freezed.dart';
part 'product_mapping.g.dart';

@freezed
class ProductMapping with _$ProductMapping {
  const factory ProductMapping({
    required String externalItemRef,
    required String internalProductId,
    required DeliveryChannel channel,
  }) = _ProductMapping;

  factory ProductMapping.fromJson(Map<String, dynamic> json) =>
      _$ProductMappingFromJson(json);
}
