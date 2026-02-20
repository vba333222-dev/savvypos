import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:gap/gap.dart';
import 'package:get_it/get_it.dart';
import 'package:savvy_pos/features/loyalty/domain/entities/loyalty_entities.dart';
import 'package:savvy_pos/features/loyalty/domain/repositories/i_loyalty_repository.dart';

class LoyaltyDashboardPage extends StatefulWidget {
  const LoyaltyDashboardPage({super.key});

  @override
  State<LoyaltyDashboardPage> createState() => _LoyaltyDashboardPageState();
}

class _LoyaltyDashboardPageState extends State<LoyaltyDashboardPage> with SingleTickerProviderStateMixin {
  final _repo = GetIt.I<ILoyaltyRepository>();
  late TabController _tabController;
  
  List<LoyaltyMember> _members = [];
  List<LoyaltyReward> _rewards = [];
  LoyaltyConfig _config = const LoyaltyConfig();
  bool _isLoading = true;
  final _phoneController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _loadData();
  }

  @override
  void dispose() {
    _tabController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  Future<void> _loadData() async {
    setState(() => _isLoading = true);
    try {
      final config = await _repo.getConfig();
      final members = await _repo.getAllMembers();
      final rewards = await _repo.getAvailableRewards();
      
      if (mounted) {
        setState(() {
          _config = config;
          _members = members;
          _rewards = rewards;
          _isLoading = false;
        });
      }
    } catch (e) {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  Color _tierColor(LoyaltyTier tier) {
    switch (tier) {
      case LoyaltyTier.bronze: return Colors.brown;
      case LoyaltyTier.silver: return Colors.grey;
      case LoyaltyTier.gold: return Colors.amber;
      case LoyaltyTier.platinum: return Colors.blueGrey;
    }
  }

  String _tierIcon(LoyaltyTier tier) {
    switch (tier) {
      case LoyaltyTier.bronze: return '🥉';
      case LoyaltyTier.silver: return '🥈';
      case LoyaltyTier.gold: return '🥇';
      case LoyaltyTier.platinum: return '💎';
    }
  }

  Future<void> _lookupMember() async {
    final phone = _phoneController.text.trim();
    if (phone.isEmpty) return;

    final member = await _repo.getMemberByPhone(phone);
    if (member != null && mounted) {
      _showMemberCard(member);
    } else if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Member not found'), backgroundColor: Colors.orange),
      );
    }
  }

  void _showMemberCard(LoyaltyMember member) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (_) => _MemberDetailSheet(member: member, config: _config, rewards: _rewards, repo: _repo),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) return const Center(child: CircularProgressIndicator());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Loyalty Program'),
        actions: [
          IconButton(onPressed: _loadData, icon: const Icon(Icons.refresh)),
        ],
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Members'),
            Tab(text: 'Rewards'),
            Tab(text: 'Settings'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _MembersTab(members: _members, tierColor: _tierColor, tierIcon: _tierIcon, onMemberTap: _showMemberCard),
          _RewardsTab(rewards: _rewards),
          _SettingsTab(config: _config, onSave: (c) async {
            await _repo.updateConfig(c);
            _loadData();
          }),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _showLookupDialog(),
        icon: const Icon(Icons.search),
        label: const Text('Lookup'),
      ),
    );
  }

  void _showLookupDialog() {
    _phoneController.clear();
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Lookup Member'),
        content: TextField(
          controller: _phoneController,
          keyboardType: TextInputType.phone,
          decoration: const InputDecoration(
            labelText: 'Phone Number',
            prefixIcon: Icon(Icons.phone),
            border: OutlineInputBorder(),
          ),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('Cancel')),
          ElevatedButton(onPressed: () { Navigator.pop(context); _lookupMember(); }, child: const Text('Search')),
        ],
      ),
    );
  }
}

class _MembersTab extends StatelessWidget {
  final List<LoyaltyMember> members;
  final Color Function(LoyaltyTier) tierColor;
  final String Function(LoyaltyTier) tierIcon;
  final void Function(LoyaltyMember) onMemberTap;

  const _MembersTab({required this.members, required this.tierColor, required this.tierIcon, required this.onMemberTap});

  @override
  Widget build(BuildContext context) {
    if (members.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.people_outline, size: 64, color: Colors.grey),
            const Gap(16),
            const Text('No loyalty members yet', style: TextStyle(color: Colors.grey)),
          ],
        ).animate().fadeIn(),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: members.length,
      itemBuilder: (context, index) {
        final m = members[index];
        return Card(
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: tierColor(m.tier).withValues(alpha: 0.2),
              child: Text(tierIcon(m.tier), style: const TextStyle(fontSize: 20)),
            ),
            title: Text(m.customerName),
            subtitle: Text('${m.phoneNumber} • ${m.currentPoints} pts'),
            trailing: Chip(
              label: Text(m.tier.name.toUpperCase(), style: const TextStyle(fontSize: 10)),
              backgroundColor: tierColor(m.tier).withValues(alpha: 0.2),
            ),
            onTap: () => onMemberTap(m),
          ),
        ).animate().fadeIn(delay: (index * 50).ms);
      },
    );
  }
}

class _RewardsTab extends StatelessWidget {
  final List<LoyaltyReward> rewards;

  const _RewardsTab({required this.rewards});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: rewards.length,
      itemBuilder: (context, index) {
        final r = rewards[index];
        return Card(
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.green.withValues(alpha: 0.2),
              child: const Icon(Icons.card_giftcard, color: Colors.green),
            ),
            title: Text(r.name),
            subtitle: Text('${r.pointsCost} points'),
            trailing: const Icon(Icons.chevron_right),
          ),
        ).animate().slideX(begin: 0.1).fadeIn(delay: (index * 100).ms);
      },
    );
  }
}

class _SettingsTab extends StatefulWidget {
  final LoyaltyConfig config;
  final Future<void> Function(LoyaltyConfig) onSave;

  const _SettingsTab({required this.config, required this.onSave});

  @override
  State<_SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<_SettingsTab> {
  late TextEditingController _pointsPerDollar;
  late TextEditingController _signupBonus;
  late TextEditingController _birthdayBonus;

  @override
  void initState() {
    super.initState();
    _pointsPerDollar = TextEditingController(text: widget.config.pointsPerDollar.toString());
    _signupBonus = TextEditingController(text: widget.config.signupBonus.toString());
    _birthdayBonus = TextEditingController(text: widget.config.birthdayBonus.toString());
  }

  @override
  void dispose() {
    _pointsPerDollar.dispose();
    _signupBonus.dispose();
    _birthdayBonus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const Text('Earn Settings', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        const Gap(12),
        TextField(controller: _pointsPerDollar, decoration: const InputDecoration(labelText: 'Points per \$1 spent', border: OutlineInputBorder()), keyboardType: TextInputType.number),
        const Gap(12),
        TextField(controller: _signupBonus, decoration: const InputDecoration(labelText: 'Signup Bonus Points', border: OutlineInputBorder()), keyboardType: TextInputType.number),
        const Gap(12),
        TextField(controller: _birthdayBonus, decoration: const InputDecoration(labelText: 'Birthday Bonus Points', border: OutlineInputBorder()), keyboardType: TextInputType.number),
        const Gap(24),
        ElevatedButton.icon(
          onPressed: () async {
            final newConfig = widget.config.copyWith(
              pointsPerDollar: double.tryParse(_pointsPerDollar.text) ?? 1.0,
              signupBonus: int.tryParse(_signupBonus.text) ?? 50,
              birthdayBonus: int.tryParse(_birthdayBonus.text) ?? 100,
            );
            await widget.onSave(newConfig);
            if (context.mounted) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Settings saved'), backgroundColor: Colors.green),
              );
            }
          },
          icon: const Icon(Icons.save),
          label: const Text('Save Settings'),
        ),
      ],
    );
  }
}

class _MemberDetailSheet extends StatelessWidget {
  final LoyaltyMember member;
  final LoyaltyConfig config;
  final List<LoyaltyReward> rewards;
  final ILoyaltyRepository repo;

  const _MemberDetailSheet({required this.member, required this.config, required this.rewards, required this.repo});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Header
          Row(
            children: [
              CircleAvatar(
                radius: 32,
                backgroundColor: Colors.amber.withValues(alpha: 0.2),
                child: Text(member.tier.name[0].toUpperCase(), style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
              ),
              const Gap(16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(member.customerName, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                    Text(member.phoneNumber, style: const TextStyle(color: Colors.grey)),
                    Text('${member.tier.name.toUpperCase()} Member', style: TextStyle(color: Colors.amber[700], fontWeight: FontWeight.w600)),
                  ],
                ),
              ),
            ],
          ),
          const Gap(24),
          
          // Points Card
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.purple.shade400, Colors.blue.shade400],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              children: [
                Text('${member.currentPoints}', style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold, color: Colors.white)),
                const Text('Available Points', style: TextStyle(color: Colors.white70)),
                const Gap(8),
                Text('Lifetime: ${member.lifetimePoints} pts', style: const TextStyle(color: Colors.white54, fontSize: 12)),
              ],
            ),
          ).animate().scale(duration: 300.ms),
          
          const Gap(24),
          
          // Quick Actions
          Row(
            children: [
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.add),
                  label: const Text('Earn Points'),
                ),
              ),
              const Gap(12),
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: member.canRedeem(config) ? () {} : null,
                  icon: const Icon(Icons.redeem),
                  label: const Text('Redeem'),
                ),
              ),
            ],
          ),
          
          const Gap(16),
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('Close')),
        ],
      ),
    );
  }
}
