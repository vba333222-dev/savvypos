import 'package:freezed_annotation/freezed_annotation.dart';
import 'waste_reason.dart';

part 'waste_record.freezed.dart';
part 'waste_record.g.dart';

enum WasteItemType {
  ingredient,
  product,
}

@freezed
class WasteRecord with _$WasteRecord {
  const factory WasteRecord({
    required String id,
    required String itemId,
    required WasteItemType itemType,
    required double quantity,
    required WasteReason reason,
    required DateTime recordedAt,
    required String staffId,
    required String warehouseId, // Added for location tracking
    required double costLoss,
    String? note,
    String? itemName, // Denormalized for easier display
    String? unit, // Denormalized
  }) = _WasteRecord;

  factory WasteRecord.fromJson(Map<String, dynamic> json) =>
      _$WasteRecordFromJson(json);
}
