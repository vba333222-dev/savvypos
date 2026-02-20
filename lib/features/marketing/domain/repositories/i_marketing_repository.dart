import 'package:savvy_pos/features/marketing/domain/entities/marketing_campaign.dart';

abstract class IMarketingRepository {
  /// Create or Update a campaign
  Future<void> saveCampaign(MarketingCampaign campaign);

  /// Get all configured campaigns
  Future<List<MarketingCampaign>> getCampaigns();

  /// Trigger automation check for all active campaigns.
  /// Returns the number of messages sent.
  Future<int> runAutomations();
  
  /// Delete a campaign
  Future<void> deleteCampaign(String id);
}
