import 'package:freezed_annotation/freezed_annotation.dart';

part 'ingredient.freezed.dart';

@freezed
class Ingredient with _$Ingredient {
  const factory Ingredient({
    required String uuid,
    required String name,
    required String unit,
    required double currentStock,
    required double costPerUnit,
  }) = _Ingredient;
}
