import 'package:injectable/injectable.dart';
import 'package:savvy_pos/features/loyalty/domain/entities/loyalty_entities.dart';
import 'package:savvy_pos/features/loyalty/domain/repositories/i_loyalty_repository.dart';
import 'package:savvy_pos/features/marketing/domain/entities/campaign_trigger.dart';

@injectable
class EarnPointsUseCase {
  final ILoyaltyRepository _repository;

  EarnPointsUseCase(this._repository);

  Future<LoyaltyMember> call({
    required String customerUuid,
    required double orderTotal,
    String? orderUuid,
  }) async {
    // 1. Get Config
    // ignore: unused_local_variable - kept for documentation and future points calculation
    final config = await _repository.getConfig();

    // 2. Calculate Points (using config.pointsPerDollar when implemented)
    // final points = (orderTotal * config.pointsPerDollar).floor();

    // 3. Update Member
    final member = await _repository.earnPoints(customerUuid, orderTotal,
        orderUuid: orderUuid);

    // 4. Check for Tier Upgrade (Logic can be in Repo or Entity extension)
    // Here we just return the updated member.
    return member;
  }
}

@injectable
class GetSegmentedMembersUseCase {
  final ILoyaltyRepository _repository;

  GetSegmentedMembersUseCase(this._repository);

  Future<List<LoyaltyMember>> call(CampaignTriggerType trigger,
      {String? value}) async {
    final allMembers = await _repository.getAllMembers();

    switch (trigger) {
      case CampaignTriggerType.inactive30Days:
        final cutoff = DateTime.now().subtract(const Duration(days: 30));
        return allMembers.where((m) {
          // If lastEarnedAt is null, use enrolledAt
          final lastActivity = m.lastEarnedAt ?? m.enrolledAt;
          return lastActivity != null && lastActivity.isBefore(cutoff);
        }).toList();

      case CampaignTriggerType.bigSpender:
        final threshold = double.tryParse(value ?? '0') ?? 0;
        return allMembers.where((m) => m.lifetimePoints >= threshold).toList();

      case CampaignTriggerType.birthday:
        final now = DateTime.now();
        return allMembers
            .where((m) =>
                m.birthday != null &&
                m.birthday!.month == now.month &&
                m.birthday!.day == now.day)
            .toList();

      case CampaignTriggerType.manual:
        // Return all members for manual campaigns
        return allMembers;
    }
  }
}
