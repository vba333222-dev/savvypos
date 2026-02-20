import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:savvy_pos/features/loyalty/domain/entities/loyalty_entities.dart';

part 'loyalty_event.freezed.dart';

@freezed
class LoyaltyEvent with _$LoyaltyEvent {
  const factory LoyaltyEvent.loadMember(String customerUuid) = LoadMember;
  const factory LoyaltyEvent.enroll(String customerUuid, String name, String phone) = EnrollMember;
  const factory LoyaltyEvent.earnPoints(String customerUuid, double amount, String orderUuid) = EarnPoints;
  const factory LoyaltyEvent.redeemReward(String customerUuid, LoyaltyReward reward, String orderUuid) = RedeemReward;
  const factory LoyaltyEvent.loadRewards() = LoadRewards;
}
