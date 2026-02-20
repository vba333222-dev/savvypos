import 'package:freezed_annotation/freezed_annotation.dart';

part 'promotion.freezed.dart';

@freezed
class Promotion with _$Promotion {
  const Promotion._();

  const factory Promotion.percentage({
    required String id,
    required String code,
    required String name,
    required double percentage,
    DateTime? startDate,
    DateTime? endDate,
    double? minPurchaseAmount,
    List<String>? applicableProductIds,
  }) = PercentageDiscount;

  const factory Promotion.fixedAmount({
    required String id,
    required String code,
    required String name,
    required double amount,
    DateTime? startDate,
    DateTime? endDate,
    double? minPurchaseAmount,
    List<String>? applicableProductIds,
  }) = FixedAmountDiscount;

  const factory Promotion.buyXGetY({
    required String id,
    required String code,
    required String name,
    required int buyQty,
    required int getQty,
    required String buyProductId,
    String? getProductId,
    DateTime? startDate,
    DateTime? endDate,
    double? minPurchaseAmount, // Added for consistency
  }) = BuyXGetYPromotion;

  // Validation using map to access properties safely
  bool isValidNow() {
    final now = DateTime.now();
    return map(
      percentage: (p) {
        if (p.startDate != null && now.isBefore(p.startDate!)) return false;
        if (p.endDate != null && now.isAfter(p.endDate!)) return false;
        return true;
      },
      fixedAmount: (p) {
        if (p.startDate != null && now.isBefore(p.startDate!)) return false;
        if (p.endDate != null && now.isAfter(p.endDate!)) return false;
        return true;
      },
      buyXGetY: (p) {
        if (p.startDate != null && now.isBefore(p.startDate!)) return false;
        if (p.endDate != null && now.isAfter(p.endDate!)) return false;
        return true;
      },
    );
  }

  bool meetsMinPurchase(double subtotal) {
    return map(
      percentage: (p) => p.minPurchaseAmount == null || subtotal >= p.minPurchaseAmount!,
      fixedAmount: (p) => p.minPurchaseAmount == null || subtotal >= p.minPurchaseAmount!,
      buyXGetY: (p) => p.minPurchaseAmount == null || subtotal >= p.minPurchaseAmount!,
    );
  }
}
