import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';
import 'package:savvy_pos/core/database/database.dart';
import 'package:savvy_pos/features/marketing/domain/entities/campaign_trigger.dart';
import 'package:savvy_pos/features/marketing/domain/entities/marketing_campaign.dart';
import 'package:savvy_pos/features/marketing/domain/repositories/i_marketing_repository.dart';

@LazySingleton(as: IMarketingRepository)
class MarketingRepositoryImpl implements IMarketingRepository {
  final AppDatabase _db;

  MarketingRepositoryImpl(this._db);

  @override
  Future<void> saveCampaign(MarketingCampaign campaign) async {
    await _db.into(_db.marketingCampaignTable).insertOnConflictUpdate(
      MarketingCampaignTableCompanion(
        uuid: Value(campaign.id),
        name: Value(campaign.name),
        channel: Value(campaign.channel.name),
        triggerType: Value(campaign.triggerType.name),
        triggerValue: Value(campaign.triggerValue),
        content: Value(campaign.content),
        isActive: Value(campaign.isActive),
        createdAt: Value(DateTime.now()), // Should be preserved on update? MVP: reset is ok or separate update logic
      )
    );
  }

  @override
  Future<List<MarketingCampaign>> getCampaigns() async {
    final rows = await _db.select(_db.marketingCampaignTable).get();
    return rows.map((row) => MarketingCampaign(
      id: row.uuid,
      name: row.name,
      channel: CampaignChannel.values.firstWhere((e) => e.name == row.channel),
      triggerType: CampaignTriggerType.values.firstWhere((e) => e.name == row.triggerType),
      triggerValue: row.triggerValue,
      content: row.content,
      isActive: row.isActive,
    )).toList();
  }

  @override
  Future<void> deleteCampaign(String id) async {
    await (_db.delete(_db.marketingCampaignTable)..where((t) => t.uuid.equals(id))).go();
  }

  @override
  Future<int> runAutomations() async {
    // This requires access to Loyalty Members and Orders.
    // For proper Clean Architecture, this logic should be in a UseCase.
    // We will leave this as a stub or move logic to UseCase later.
    // This allows the UI to call it via Repo interface for now.
    return 0; 
  }
}
