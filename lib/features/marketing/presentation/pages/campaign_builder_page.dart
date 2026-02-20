import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get_it/get_it.dart';
import 'package:savvy_pos/features/marketing/domain/entities/campaign_trigger.dart';
import 'package:savvy_pos/features/marketing/domain/entities/marketing_campaign.dart';
import 'package:savvy_pos/features/marketing/domain/repositories/i_marketing_repository.dart';
import 'package:savvy_pos/features/loyalty/domain/usecases/loyalty_usecases.dart'; // Import
import 'package:uuid/uuid.dart';

class CampaignBuilderPage extends StatefulWidget {
  const CampaignBuilderPage({super.key});

  @override
  State<CampaignBuilderPage> createState() => _CampaignBuilderPageState();
}

class _CampaignBuilderPageState extends State<CampaignBuilderPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameCtrl = TextEditingController();
  final _contentCtrl = TextEditingController();
  final _triggerValueCtrl = TextEditingController();
  
  CampaignChannel _channel = CampaignChannel.sms;
  CampaignTriggerType _trigger = CampaignTriggerType.inactive30Days;
  bool _isSaving = false;
  int? _audienceSize;
  bool _calculatingAudience = false;

  @override
  void initState() {
    super.initState();
    _recalcAudience();
  }

  void _recalcAudience() async {
    setState(() => _calculatingAudience = true);
    try {
      final members = await GetIt.I<GetSegmentedMembersUseCase>().call(
        _trigger, 
        value: _triggerValueCtrl.text.isEmpty ? null : _triggerValueCtrl.text
      );
      if (mounted) setState(() => _audienceSize = members.length);
    } catch (_) {
    } finally {
      if (mounted) setState(() => _calculatingAudience = false);
    }
  }

  @override
  void dispose() {
    _nameCtrl.dispose();
    _contentCtrl.dispose();
    _triggerValueCtrl.dispose();
    super.dispose();
  }

  void _onSave() async {
    if (!_formKey.currentState!.validate()) return;
    
    setState(() => _isSaving = true);
    try {
      final campaign = MarketingCampaign(
        id: const Uuid().v4(),
        name: _nameCtrl.text,
        channel: _channel,
        triggerType: _trigger,
        triggerValue: _triggerValueCtrl.text.isEmpty ? null : _triggerValueCtrl.text,
        content: _contentCtrl.text,
        isActive: true,
      );

      await GetIt.I<IMarketingRepository>().saveCampaign(campaign);
      
      if (mounted) {
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Campaign Saved')));
      }
    } catch (e) {
      if (mounted) {
         ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error: $e')));
         setState(() => _isSaving = false);
      }
    }
  }

  void _generateAIContent() {
    // Mock AI generation
    String content = '';
    if (_trigger == CampaignTriggerType.inactive30Days) {
       content = "We miss you! 🥺 Come back to Savvy POS and get 10% off your next order. Show this text!";
    } else if (_trigger == CampaignTriggerType.bigSpender) {
       content = "You're a VIP! 🌟 Thanks for being a top customer. Enjoy a free dessert on us next time.";
    } else if (_trigger == CampaignTriggerType.birthday) {
       content = "Happy Birthday! 🎂 Treat yourself to a free meal today!";
    }
    _contentCtrl.text = content;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('New Campaign')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Campaign Details', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const Gap(16),
              
              TextFormField(
                controller: _nameCtrl,
                decoration: const InputDecoration(labelText: 'Campaign Name', border: OutlineInputBorder()),
                validator: (v) => v == null || v.isEmpty ? 'Required' : null,
              ),
              const Gap(16),
              
              const Text('Target Audience & Trigger', style: TextStyle(fontWeight: FontWeight.w600)),
              const Gap(8),
              DropdownButtonFormField<CampaignTriggerType>(
                // ignore: deprecated_member_use
                value: _trigger,
                decoration: const InputDecoration(border: OutlineInputBorder()),
                items: CampaignTriggerType.values.map((t) => DropdownMenuItem(value: t, child: Text(t.label))).toList(),
                onChanged: (v) {
                   setState(() => _trigger = v!);
                   _recalcAudience();
                },
              ),
              const Gap(8),
              if (_calculatingAudience) 
                 const Text("Calculating audience...", style: TextStyle(color: Colors.grey))
              else if (_audienceSize != null)
                 Text("Est. Audience: $_audienceSize customers", style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.blue)),
              
              if (_trigger == CampaignTriggerType.bigSpender) ...[
                 const Gap(8),
                 TextFormField(
                    controller: _triggerValueCtrl,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(labelText: 'Minimum Spend (\$)'),
                    onChanged: (_) => _recalcAudience(), // Debounce ideally
                 ),
              ],
              
              const Gap(24),
              const Text('Communication Channel', style: TextStyle(fontWeight: FontWeight.w600)),
              const Gap(8),
              SegmentedButton<CampaignChannel>(
                segments: const [
                  ButtonSegment(value: CampaignChannel.sms, label: Text('SMS'), icon: Icon(Icons.sms)),
                  ButtonSegment(value: CampaignChannel.email, label: Text('Email'), icon: Icon(Icons.email)),
                ], 
                selected: {_channel},
                onSelectionChanged: (Set<CampaignChannel> newSelection) {
                  setState(() => _channel = newSelection.first);
                },
              ),
              
              const Gap(24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                   const Text('Message Content', style: TextStyle(fontWeight: FontWeight.w600)),
                   TextButton.icon(
                     onPressed: _generateAIContent, 
                     icon: const Icon(Icons.auto_awesome), 
                     label: const Text('AI Write')
                   )
                ],
              ),
              const Gap(8),
              TextFormField(
                controller: _contentCtrl,
                maxLines: 4,
                decoration: const InputDecoration(
                  labelText: 'Message Body', 
                  border: OutlineInputBorder(),
                  helperText: 'Use {name} to insert customer name'
                ),
                validator: (v) => v == null || v.isEmpty ? 'Required' : null,
              ),
              
              const Gap(32),
              SizedBox(
                width: double.infinity,
                child: FilledButton(
                  onPressed: _isSaving ? null : _onSave,
                  child: _isSaving 
                    ? const SizedBox(width: 20, height: 20, child: CircularProgressIndicator(strokeWidth: 2)) 
                    : const Text('Launch Campaign'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
