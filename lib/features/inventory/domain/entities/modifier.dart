import 'package:freezed_annotation/freezed_annotation.dart';

part 'modifier.freezed.dart';

@freezed
class ModifierGroup with _$ModifierGroup {
  const factory ModifierGroup({
    required String uuid,
    required String name,
    required bool allowMultiSelect,
    required int minSelection,
    int? maxSelection,
    @Default([]) List<ModifierItem> items,
  }) = _ModifierGroup;
}

@freezed
class ModifierItem with _$ModifierItem {
  const factory ModifierItem({
    required String uuid,
    required String name,
    required double priceDelta,
  }) = _ModifierItem;
}
