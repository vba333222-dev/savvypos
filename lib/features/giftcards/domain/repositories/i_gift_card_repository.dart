import 'package:savvy_pos/features/giftcards/domain/entities/gift_card.dart';

/// Repository interface for Gift Card management
abstract class IGiftCardRepository {
  // ===================================
  // GIFT CARD CRUD
  // ===================================
  
  /// Get all gift cards with optional filtering
  Future<List<GiftCard>> getGiftCards({
    GiftCardStatus? status,
    String? customerUuid,
    String? searchQuery,  // Search by card number
    bool? hasBalance,
  });
  
  /// Get a single gift card by UUID
  Future<GiftCard?> getGiftCard(String uuid);
  
  /// Get a gift card by card number (for POS lookup)
  Future<GiftCard?> getGiftCardByNumber(String cardNumber);
  
  /// Get a gift card by barcode
  Future<GiftCard?> getGiftCardByBarcode(String barcode);
  
  // ===================================
  // LIFECYCLE OPERATIONS
  // ===================================
  
  /// Activate a new gift card
  Future<GiftCard> activateGiftCard({
    required String cardNumber,
    required double initialValue,
    String? barcode,
    String? customerUuid,
    String? customerName,
    String? customerEmail,
    String? customerPhone,
    String? pin,
    DateTime? expiresAt,
    required String activatedByEmployeeUuid,
    required String activatedByEmployeeName,
    String? notes,
  });
  
  /// Reload/add funds to gift card
  Future<GiftCardTransaction> reloadGiftCard({
    required String giftCardUuid,
    required double amount,
    required String performedByUuid,
    required String performedByName,
    String? notes,
  });
  
  /// Redeem gift card for purchase
  Future<GiftCardTransaction> redeemGiftCard({
    required String giftCardUuid,
    required double amount,
    required String orderUuid,
    required String orderNumber,
    required String performedByUuid,
    required String performedByName,
    String? pin,  // Verify PIN if required
  });
  
  /// Refund to gift card
  Future<GiftCardTransaction> refundToGiftCard({
    required String giftCardUuid,
    required double amount,
    required String orderUuid,
    required String orderNumber,
    required String performedByUuid,
    required String performedByName,
    String? notes,
  });
  
  /// Check balance (for display)
  Future<double> checkBalance(String cardNumber);
  
  /// Suspend a gift card (for fraud/lost)
  Future<void> suspendGiftCard(String uuid, String reason);
  
  /// Cancel a gift card
  Future<void> cancelGiftCard(String uuid, String reason);
  
  // ===================================
  // TRANSACTION HISTORY
  // ===================================
  
  /// Get transactions for a gift card
  Future<List<GiftCardTransaction>> getTransactions({
    required String giftCardUuid,
    GiftCardTransactionType? type,
    DateTime? startDate,
    DateTime? endDate,
  });
  
  /// Get all transactions in a period (for reporting)
  Future<List<GiftCardTransaction>> getAllTransactions({
    DateTime? startDate,
    DateTime? endDate,
    GiftCardTransactionType? type,
    int? limit,
  });
  
  // ===================================
  // REPORTING
  // ===================================
  
  /// Get gift card summary/analytics
  Future<GiftCardSummary> getSummary({
    DateTime? startDate,
    DateTime? endDate,
  });
  
  /// Get outstanding liability (total unredeemed balance)
  Future<double> getOutstandingLiability();
  
  /// Process expirations (batch job)
  Future<int> processExpirations();
  
  // ===================================
  // UTILITIES
  // ===================================
  
  /// Generate a unique card number
  Future<String> generateCardNumber();
  
  /// Validate a card number format
  bool validateCardNumber(String cardNumber);
  
  /// Validate PIN for card
  Future<bool> validatePin(String giftCardUuid, String pin);
}
