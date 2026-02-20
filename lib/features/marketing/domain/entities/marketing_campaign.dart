import 'package:freezed_annotation/freezed_annotation.dart';
import 'campaign_trigger.dart';

part 'marketing_campaign.freezed.dart';
part 'marketing_campaign.g.dart';

@freezed
class MarketingCampaign with _$MarketingCampaign {
  const factory MarketingCampaign({
    required String id,
    required String name,
    required CampaignChannel channel,
    required CampaignTriggerType triggerType,
    String? triggerValue, // e.g., spending threshold amount
    required String content,
    @Default(true) bool isActive,
    @Default(0.0) double attributedSales,
    @Default(0) int sentCount,
    DateTime? lastRunAt,
  }) = _MarketingCampaign;

  factory MarketingCampaign.fromJson(Map<String, dynamic> json) => _$MarketingCampaignFromJson(json);
}
