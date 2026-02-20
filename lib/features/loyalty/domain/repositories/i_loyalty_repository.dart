import 'package:savvy_pos/features/loyalty/domain/entities/loyalty_entities.dart';

abstract class ILoyaltyRepository {
  /// Get loyalty configuration
  Future<LoyaltyConfig> getConfig();

  /// Update loyalty configuration
  Future<void> updateConfig(LoyaltyConfig config);

  /// Enroll a customer in the loyalty program
  Future<LoyaltyMember> enrollCustomer(String customerUuid, String customerName, String phoneNumber, {DateTime? birthday});

  /// Get loyalty member by customer UUID
  Future<LoyaltyMember?> getMember(String customerUuid);

  /// Get loyalty member by phone number (for quick lookup at POS)
  Future<LoyaltyMember?> getMemberByPhone(String phoneNumber);

  /// Get all loyalty members
  Future<List<LoyaltyMember>> getAllMembers();

  /// Earn points from a purchase
  Future<LoyaltyMember> earnPoints(String customerUuid, double orderTotal, {String? orderUuid});

  /// Redeem points for a reward
  Future<LoyaltyMember> redeemPoints(String customerUuid, int points, String reason, {String? orderUuid});

  /// Get transaction history for a member
  Future<List<LoyaltyTransaction>> getTransactionHistory(String customerUuid, {int limit = 50});

  /// Get available rewards
  Future<List<LoyaltyReward>> getAvailableRewards();

  /// Check if today is member's birthday (for bonus)
  Future<bool> checkBirthdayBonus(String customerUuid);
}
