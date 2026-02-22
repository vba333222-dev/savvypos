import 'package:freezed_annotation/freezed_annotation.dart';

part 'loyalty_entities.freezed.dart';
part 'loyalty_entities.g.dart';

enum LoyaltyTier {
  bronze, // 0-99 points
  silver, // 100-499 points
  gold, // 500-999 points
  platinum, // 1000+ points
}

@freezed
class LoyaltyConfig with _$LoyaltyConfig {
  const factory LoyaltyConfig({
    @Default(1.0) double pointsPerDollar, // How many points per $1 spent
    @Default(10) int pointsForVisit, // Bonus points per visit
    @Default(50) int signupBonus, // Points for new registration
    @Default(100) int birthdayBonus, // Birthday reward points
    @Default(100) int redeemThreshold, // Minimum points to redeem
    @Default(10.0)
    double
        redeemValue, // Dollar value when reaching threshold ($10 off for 100 pts)
  }) = _LoyaltyConfig;

  factory LoyaltyConfig.fromJson(Map<String, dynamic> json) =>
      _$LoyaltyConfigFromJson(json);
}

@freezed
class LoyaltyMember with _$LoyaltyMember {
  const factory LoyaltyMember({
    required String customerUuid,
    required String customerName,
    required String phoneNumber,
    required int currentPoints,
    required int lifetimePoints,
    required LoyaltyTier tier,
    DateTime? enrolledAt,
    DateTime? lastEarnedAt,
    DateTime? birthday,
  }) = _LoyaltyMember;

  factory LoyaltyMember.fromJson(Map<String, dynamic> json) =>
      _$LoyaltyMemberFromJson(json);
}

extension LoyaltyMemberX on LoyaltyMember {
  /// Check if member can redeem (>= threshold)
  bool canRedeem(LoyaltyConfig config) =>
      currentPoints >= config.redeemThreshold;

  /// Get redemption value in dollars
  double getRedeemValue(LoyaltyConfig config) {
    if (!canRedeem(config)) return 0;
    return config.redeemValue;
  }

  /// Points needed for next tier
  int get pointsToNextTier {
    switch (tier) {
      case LoyaltyTier.bronze:
        return 100 - lifetimePoints;
      case LoyaltyTier.silver:
        return 500 - lifetimePoints;
      case LoyaltyTier.gold:
        return 1000 - lifetimePoints;
      case LoyaltyTier.platinum:
        return 0; // Already max
    }
  }
}

@freezed
class LoyaltyTransaction with _$LoyaltyTransaction {
  const factory LoyaltyTransaction({
    required String id,
    required String customerUuid,
    required int pointsChange, // Positive = earned, Negative = redeemed
    required String reason, // 'purchase', 'redeem', 'signup_bonus', 'birthday'
    DateTime? transactionDate,
    String? orderUuid, // Link to order if purchase-related
  }) = _LoyaltyTransaction;

  factory LoyaltyTransaction.fromJson(Map<String, dynamic> json) =>
      _$LoyaltyTransactionFromJson(json);
}

@freezed
class LoyaltyReward with _$LoyaltyReward {
  const factory LoyaltyReward({
    required String id,
    required String name,
    required int pointsCost,
    required String type, // 'discount', 'freeItem'
    double? discountAmount, // For 'discount' type
    String? freeItemUuid, // For 'freeItem' type
    @Default(true) bool isActive,
  }) = _LoyaltyReward;

  factory LoyaltyReward.fromJson(Map<String, dynamic> json) =>
      _$LoyaltyRewardFromJson(json);
}
