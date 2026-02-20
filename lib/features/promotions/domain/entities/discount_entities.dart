import 'package:freezed_annotation/freezed_annotation.dart';

part 'discount_entities.freezed.dart';
part 'discount_entities.g.dart';

/// Discount type enumeration
enum DiscountType {
  percentage,   // X% off
  fixed,        // $X off
  bogo,         // Buy one get one
  buyXGetY,     // Buy X get Y free/discounted
  tiered,       // Spend $X get Y% off
  freeItem,     // Free item
  bundle,       // Bundle pricing
}

/// Discount application scope
enum DiscountScope {
  order,        // Applies to entire order
  item,         // Applies to specific items
  category,     // Applies to category
  customer,     // Customer-specific
}

/// Discount status
enum DiscountStatus {
  active,
  scheduled,
  expired,
  disabled,
}

/// Main Discount entity
@freezed
class Discount with _$Discount {
  const factory Discount({
    required String uuid,
    required String name,
    required String code,              // Promo code
    String? description,
    
    required DiscountType type,
    required DiscountScope scope,
    @Default(DiscountStatus.active) DiscountStatus status,
    
    // Value based on type
    double? percentageOff,             // For percentage type
    double? fixedAmountOff,            // For fixed type
    int? buyQuantity,                  // For BOGO/buyXGetY
    int? getQuantity,                  // For BOGO/buyXGetY
    double? getDiscountPercent,        // Discount on the "get" items
    
    // Tier thresholds (for tiered discounts)
    @Default([]) List<DiscountTier> tiers,
    
    // Restrictions
    double? minOrderAmount,
    double? maxDiscountAmount,
    int? maxUsesTotal,
    int? maxUsesPerCustomer,
    int? currentUsageCount,
    
    // Scope restrictions
    @Default([]) List<String> applicableProductUuids,
    @Default([]) List<String> applicableCategoryUuids,
    @Default([]) List<String> applicableCustomerUuids,
    
    // Scheduling
    DateTime? validFrom,
    DateTime? validUntil,
    @Default([]) List<int> validDaysOfWeek,  // 1-7 (Mon-Sun)
    String? validTimeStart,            // "11:00"
    String? validTimeEnd,              // "14:00"
    
    // Stacking rules
    @Default(false) bool canStackWithOthers,
    @Default(0) int stackPriority,     // Lower = applies first
    
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _Discount;
  
  factory Discount.fromJson(Map<String, dynamic> json) => _$DiscountFromJson(json);
  
  const Discount._();
  
  /// Check if discount is currently valid
  bool get isValid {
    final now = DateTime.now();
    if (status != DiscountStatus.active) return false;
    if (validFrom != null && now.isBefore(validFrom!)) return false;
    if (validUntil != null && now.isAfter(validUntil!)) return false;
    if (maxUsesTotal != null && (currentUsageCount ?? 0) >= maxUsesTotal!) return false;
    return true;
  }
}

/// Tier for tiered discounts
@freezed
class DiscountTier with _$DiscountTier {
  const factory DiscountTier({
    required double minAmount,
    required double discountPercent,
  }) = _DiscountTier;
  
  factory DiscountTier.fromJson(Map<String, dynamic> json) => _$DiscountTierFromJson(json);
}

/// Applied discount record
@freezed
class AppliedDiscount with _$AppliedDiscount {
  const factory AppliedDiscount({
    required String uuid,
    required String orderUuid,
    required String discountUuid,
    required String discountName,
    required String discountCode,
    required DiscountType type,
    required double discountAmount,
    
    // Item-specific details
    String? appliedToItemUuid,
    String? appliedToItemName,
    
    required DateTime appliedAt,
    String? appliedByUuid,
  }) = _AppliedDiscount;
  
  factory AppliedDiscount.fromJson(Map<String, dynamic> json) => _$AppliedDiscountFromJson(json);
}

/// Quick discount for UI (commonly used)
@freezed
class QuickDiscount with _$QuickDiscount {
  const factory QuickDiscount({
    required String label,
    required double percentage,
    required IconType iconType,
  }) = _QuickDiscount;
  
  factory QuickDiscount.fromJson(Map<String, dynamic> json) => _$QuickDiscountFromJson(json);
}

/// Icon type for quick discounts
enum IconType {
  star,
  percent,
  loyalty,
  special,
  employee,
}
