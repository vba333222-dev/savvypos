import 'package:savvy_pos/features/promotions/domain/entities/discount_entities.dart';

/// Repository interface for Discount management
abstract class IDiscountRepository {
  // ===================================
  // DISCOUNT CRUD
  // ===================================
  
  /// Get all discounts
  Future<List<Discount>> getDiscounts({
    DiscountStatus? status,
    DiscountType? type,
    DiscountScope? scope,
    bool? activeOnly,
  });
  
  /// Get discount by UUID
  Future<Discount?> getDiscount(String uuid);
  
  /// Get discount by code
  Future<Discount?> getDiscountByCode(String code);
  
  /// Create discount
  Future<Discount> createDiscount(Discount discount);
  
  /// Update discount
  Future<void> updateDiscount(Discount discount);
  
  /// Delete discount
  Future<void> deleteDiscount(String uuid);
  
  // ===================================
  // VALIDATION
  // ===================================
  
  /// Validate discount code
  Future<DiscountValidationResult> validateDiscountCode({
    required String code,
    required double orderTotal,
    required List<String> orderItemUuids,
    String? customerUuid,
  });
  
  /// Check if discount is applicable to item
  bool isApplicableToItem(Discount discount, String productUuid, String categoryUuid);
  
  /// Check if discount is valid for time/date
  bool isValidForDateTime(Discount discount, DateTime dateTime);
  
  // ===================================
  // APPLICATION
  // ===================================
  
  /// Apply discount to order
  Future<AppliedDiscount> applyDiscount({
    required String orderUuid,
    required String discountUuid,
    required double discountAmount,
    String? appliedToItemUuid,
    String? appliedToItemName,
    String? appliedByUuid,
  });
  
  /// Calculate discount amount
  double calculateDiscountAmount({
    required Discount discount,
    required double orderTotal,
    required List<OrderItemForDiscount> orderItems,
  });
  
  /// Remove applied discount
  Future<void> removeAppliedDiscount(String appliedDiscountUuid);
  
  /// Get applied discounts for order
  Future<List<AppliedDiscount>> getAppliedDiscounts(String orderUuid);
  
  // ===================================
  // STACKING
  // ===================================
  
  /// Get stackable discounts
  Future<List<Discount>> getStackableDiscounts(List<String> discountUuids);
  
  /// Sort discounts by stack priority
  List<Discount> sortByStackPriority(List<Discount> discounts);
  
  // ===================================
  // QUICK DISCOUNTS
  // ===================================
  
  /// Get quick discount presets
  List<QuickDiscount> getQuickDiscounts();
  
  /// Apply quick percentage discount
  Future<AppliedDiscount> applyQuickDiscount({
    required String orderUuid,
    required double percentage,
    required String label,
    String? appliedByUuid,
  });
  
  // ===================================
  // USAGE TRACKING
  // ===================================
  
  /// Increment usage count
  Future<void> incrementUsageCount(String discountUuid);
  
  /// Get usage statistics
  Future<DiscountUsageStats> getUsageStats(String discountUuid);
}

/// Validation result
class DiscountValidationResult {
  final bool isValid;
  final String? errorMessage;
  final Discount? discount;
  final double? calculatedAmount;
  
  const DiscountValidationResult({
    required this.isValid,
    this.errorMessage,
    this.discount,
    this.calculatedAmount,
  });
}

/// Order item data for discount calculation
class OrderItemForDiscount {
  final String uuid;
  final String productUuid;
  final String categoryUuid;
  final double price;
  final int quantity;
  
  const OrderItemForDiscount({
    required this.uuid,
    required this.productUuid,
    required this.categoryUuid,
    required this.price,
    required this.quantity,
  });
}

/// Usage statistics
class DiscountUsageStats {
  final int totalUses;
  final double totalDiscounted;
  final double avgDiscountAmount;
  final Map<String, int> usesByDay;
  
  const DiscountUsageStats({
    required this.totalUses,
    required this.totalDiscounted,
    required this.avgDiscountAmount,
    required this.usesByDay,
  });
}
