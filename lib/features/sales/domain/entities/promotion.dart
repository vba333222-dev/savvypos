import 'package:freezed_annotation/freezed_annotation.dart';

part 'promotion.freezed.dart';


@freezed
class Promotion with _$Promotion {
  const Promotion._();

  const factory Promotion.percentage({
    required String id,
    required String name,
    required String code,
    required double percentage,
    @Default(PromotionConstraints()) PromotionConstraints constraints,
  }) = PercentageDiscount;

  const factory Promotion.fixedAmount({
    required String id,
    required String name,
    required String code,
    required double amount,
    @Default(PromotionConstraints()) PromotionConstraints constraints,
  }) = FixedAmountDiscount;

  const factory Promotion.buyXGetY({
    required String id,
    required String name,
    required String code,
    required int buyQty,
    required int getQty,
    required String buyProductId, // 'ANY' or specific UUID
     @Default(PromotionConstraints()) PromotionConstraints constraints,
  }) = BuyXGetYPromotion;



  bool isValidNow() {
    final now = DateTime.now();
    return constraints.isValid(now);
  }

  bool meetsMinPurchase(double subtotal) {
    if (constraints.minPurchaseAmount == null) return true;
    return subtotal >= constraints.minPurchaseAmount!;
  }
}

@freezed
class PromotionConstraints with _$PromotionConstraints {
  const PromotionConstraints._();

  const factory PromotionConstraints({
    double? minPurchaseAmount,
    DateTime? startDate,
    DateTime? endDate,
    List<String>? applicableProductIds,
    HappyHourTimeRange? happyHourTimeRange,
  }) = _PromotionConstraints;



  bool isValid(DateTime date) {
    if (startDate != null && date.isBefore(startDate!)) return false;
    if (endDate != null && date.isAfter(endDate!)) return false;
    
    if (happyHourTimeRange != null) {
      if (!happyHourTimeRange!.isActive(date)) return false;
    }
    
    return true;
  }
}

@freezed
class HappyHourTimeRange with _$HappyHourTimeRange {
  const HappyHourTimeRange._();

  const factory HappyHourTimeRange({
    required int startHour,
    required int startMinute,
    required int endHour,
    required int endMinute,
  }) = _HappyHourTimeRange;



  bool isActive(DateTime date) {
    final currentMinutes = date.hour * 60 + date.minute;
    final startMinutes = startHour * 60 + startMinute;
    final endMinutes = endHour * 60 + endMinute;
    
    return currentMinutes >= startMinutes && currentMinutes <= endMinutes;
  }
}
