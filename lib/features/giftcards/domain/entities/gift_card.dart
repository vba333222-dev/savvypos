import 'package:freezed_annotation/freezed_annotation.dart';

part 'gift_card.freezed.dart';
part 'gift_card.g.dart';

/// Gift Card status enum
enum GiftCardStatus {
  active,
  used,
  expired,
  cancelled,
  suspended;
  
  String get displayName {
    switch (this) {
      case GiftCardStatus.active: return 'Active';
      case GiftCardStatus.used: return 'Fully Redeemed';
      case GiftCardStatus.expired: return 'Expired';
      case GiftCardStatus.cancelled: return 'Cancelled';
      case GiftCardStatus.suspended: return 'Suspended';
    }
  }
}

/// Gift Card transaction type
enum GiftCardTransactionType {
  activation,   // Initial load
  reload,       // Additional funds added
  redemption,   // Purchase payment
  refund,       // Refund to card
  adjustment,   // Manual correction
  expiry,       // Funds expired
}

/// Gift Card entity with full lifecycle support
@freezed
class GiftCard with _$GiftCard {
  const factory GiftCard({
    required String uuid,
    required String cardNumber, // Unique 16-digit number
    String? barcode,            // QR/Barcode for scanning
    
    // Value tracking
    required double initialValue,
    required double currentBalance,
    
    // Owner info (optional - can be anonymous)
    String? customerUuid,
    String? customerName,
    String? customerEmail,
    String? customerPhone,
    
    // Status & dates
    @Default(GiftCardStatus.active) GiftCardStatus status,
    required DateTime activatedAt,
    DateTime? expiresAt,
    DateTime? lastUsedAt,
    
    // Security
    String? pin,  // Optional PIN for redemption
    
    // Tracking
    String? activatedByEmployeeUuid,
    String? activatedByEmployeeName,
    String? notes,
    
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _GiftCard;
  
  factory GiftCard.fromJson(Map<String, dynamic> json) => _$GiftCardFromJson(json);
  
  const GiftCard._();
  
  /// Check if card is usable
  bool get isUsable => 
    status == GiftCardStatus.active && 
    currentBalance > 0 &&
    (expiresAt == null || expiresAt!.isAfter(DateTime.now()));
  
  /// Check if card is expired
  bool get isExpired => 
    expiresAt != null && expiresAt!.isBefore(DateTime.now());
}

/// Gift Card transaction for transaction history
@freezed
class GiftCardTransaction with _$GiftCardTransaction {
  const factory GiftCardTransaction({
    required String uuid,
    required String giftCardUuid,
    required GiftCardTransactionType type,
    required double amount,        // Positive for loads, negative for redemptions
    required double balanceAfter,
    
    // If redemption, link to order
    String? orderUuid,
    String? orderNumber,
    
    // Performer info
    required String performedByUuid,
    required String performedByName,
    
    String? notes,
    required DateTime timestamp,
  }) = _GiftCardTransaction;
  
  factory GiftCardTransaction.fromJson(Map<String, dynamic> json) => _$GiftCardTransactionFromJson(json);
}

/// Gift Card summary for reporting
@freezed
class GiftCardSummary with _$GiftCardSummary {
  const factory GiftCardSummary({
    required int totalCardsIssued,
    required int activeCards,
    required double totalValueIssued,
    required double totalRedemptions,
    required double outstandingLiability, // Total unredeemed balance
    required double expiredValue,
    DateTime? periodStart,
    DateTime? periodEnd,
  }) = _GiftCardSummary;
  
  factory GiftCardSummary.fromJson(Map<String, dynamic> json) => _$GiftCardSummaryFromJson(json);
}
