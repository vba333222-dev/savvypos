import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:gap/gap.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:savvy_pos/features/marketing/domain/entities/campaign_trigger.dart';
import 'package:savvy_pos/features/marketing/domain/entities/marketing_campaign.dart';
import 'package:savvy_pos/features/marketing/domain/repositories/i_marketing_repository.dart';
import 'package:savvy_pos/features/marketing/presentation/pages/campaign_builder_page.dart';

class MarketingDashboardPage extends StatefulWidget {
  const MarketingDashboardPage({super.key});

  @override
  State<MarketingDashboardPage> createState() => _MarketingDashboardPageState();
}

class _MarketingDashboardPageState extends State<MarketingDashboardPage> {
  final _repo = GetIt.I<IMarketingRepository>();
  List<MarketingCampaign>? _campaigns;
  bool _isLoading = true;
  bool _isRunningAutomation = false;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    setState(() => _isLoading = true);
    try {
      final campaigns = await _repo.getCampaigns();
      if (mounted) {
        setState(() {
          _campaigns = campaigns;
          _isLoading = false;
        });
      }
    } catch (e) {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  Future<void> _runAutomation() async {
    setState(() => _isRunningAutomation = true);
    try {
      final count = await _repo.runAutomations();
      if (mounted) {
         ScaffoldMessenger.of(context).showSnackBar(
           SnackBar(
             content: Text('Automation Complete. $count messages sent.'),
             backgroundColor: Colors.green,
           ),
         );
         _loadData(); // Refresh stats
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error: $e')));
      }
    } finally {
      if (mounted) setState(() => _isRunningAutomation = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    // Stats
    final activeCount = _campaigns?.where((c) => c.isActive).length ?? 0;
    final totalSent = _campaigns?.fold<int>(0, (sum, c) => sum + c.sentCount) ?? 0;
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Smart Marketing'),
        actions: [
          if (_isRunningAutomation)
            const Center(child: Padding(padding: EdgeInsets.only(right: 16), child: SizedBox(width: 20, height: 20, child: CircularProgressIndicator(strokeWidth: 2))))
          else
            IconButton(
              icon: const Icon(Icons.flash_on),
              tooltip: 'Run Automation Check',
              onPressed: _runAutomation,
            ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
           await Navigator.push(context, MaterialPageRoute(builder: (_) => const CampaignBuilderPage()));
           _loadData();
        },
        label: const Text('New Campaign'),
        icon: const Icon(Icons.add),
      ),
      body: _isLoading 
        ? const Center(child: CircularProgressIndicator())
        : RefreshIndicator(
            onRefresh: _loadData,
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      children: [
                        Expanded(child: _StatCard(title: 'Active Campaigns', value: '$activeCount', icon: Icons.campaign)),
                        const Gap(16),
                        Expanded(child: _StatCard(title: 'Messages Sent', value: '$totalSent', icon: Icons.send, color: Colors.blue)),
                      ],
                    ),
                  ),
                ),
                
                if (_campaigns != null && _campaigns!.isEmpty)
                   SliverFillRemaining(
                     child: Center(
                       child: Column(
                         mainAxisAlignment: MainAxisAlignment.center,
                         children: [
                           Icon(Icons.mark_email_unread_outlined, size: 64, color: Colors.grey[300]),
                           const Gap(16),
                           const Text('No Active Campaigns', style: TextStyle(color: Colors.grey, fontSize: 18)),
                           const Gap(8),
                           TextButton(onPressed: () {}, child: const Text('Create your first automation'))
                         ],
                       ),
                     ),
                   )
                else
                   SliverList(
                     delegate: SliverChildBuilderDelegate(
                       (context, index) {
                         final campaign = _campaigns![index];
                         return _CampaignCard(
                           campaign: campaign, 
                           onDelete: () async {
                              await _repo.deleteCampaign(campaign.id);
                              _loadData();
                           },
                         );
                       },
                       childCount: _campaigns?.length ?? 0
                     ),
                   ),
              ],
            ),
          ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color color;

  const _StatCard({required this.title, required this.value, required this.icon, this.color = Colors.orange});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainer,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Theme.of(context).colorScheme.outlineVariant.withValues(alpha: 0.5)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Icon(icon, color: color),
           const Gap(12),
           Text(value, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
           Text(title, style: TextStyle(color: Theme.of(context).textTheme.bodySmall?.color)),
        ],
      ),
    ).animate().scale(duration: 300.ms, curve: Curves.easeOut);
  }
}

class _CampaignCard extends StatelessWidget {
  final MarketingCampaign campaign;
  final VoidCallback onDelete;

  const _CampaignCard({required this.campaign, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      elevation: 0,
       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12), side: BorderSide(color: Colors.grey.withValues(alpha: 0.2))),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             Row(
               children: [
                 Container(
                   padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                   decoration: BoxDecoration(
                     color: campaign.isActive ? Colors.green.withValues(alpha: 0.1) : Colors.grey.withValues(alpha: 0.1),
                     borderRadius: BorderRadius.circular(8),
                   ),
                   child: Text(
                     campaign.isActive ? 'ACTIVE' : 'PAUSED',
                     style: TextStyle(
                       fontSize: 10, 
                       color: campaign.isActive ? Colors.green : Colors.grey, 
                       fontWeight: FontWeight.bold
                     ),
                   ),
                 ),
                 const Spacer(),
                 IconButton(icon: const Icon(Icons.delete_outline, size: 20), onPressed: onDelete),
               ],
             ),
             const Gap(8),
             Text(campaign.name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
             Row(
               children: [
                 Icon(campaign.channel == CampaignChannel.sms ? Icons.sms : Icons.email, size: 14, color: Colors.grey),
                 const Gap(4),
                 Text('${campaign.channel.name.toUpperCase()} • ${campaign.triggerType.label}', style: const TextStyle(fontSize: 12, color: Colors.grey)),
               ],
             ),
             const Divider(height: 24),
             Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 _Stat(label: 'Sent', value: '${campaign.sentCount}'),
                 _Stat(label: 'Last Run', value: campaign.lastRunAt != null ? DateFormat('MM/dd HH:mm').format(campaign.lastRunAt!) : '-'),
               ],
             )
          ],
        ),
      ),
    ).animate().fadeIn().slideY(begin: 0.1);
  }
}

class _Stat extends StatelessWidget {
  final String label;
  final String value;
  const _Stat({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(value, style: const TextStyle(fontWeight: FontWeight.w600)),
        Text(label, style: const TextStyle(fontSize: 10, color: Colors.grey)),
      ],
    );
  }
}
