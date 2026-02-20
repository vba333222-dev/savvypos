import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:gap/gap.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:savvy_pos/features/delivery/domain/entities/delivery_channel.dart';
import 'package:savvy_pos/features/delivery/domain/repositories/i_delivery_repository.dart';

class DeliveryDashboardPage extends StatefulWidget {
  const DeliveryDashboardPage({super.key});

  @override
  State<DeliveryDashboardPage> createState() => _DeliveryDashboardPageState();
}

class _DeliveryDashboardPageState extends State<DeliveryDashboardPage> {
  final _repo = GetIt.I<IDeliveryRepository>();
  List<DeliveryChannelConfig>? _configs;
  bool _isLoading = true;
  String? _lastSimulatedOrderUuid;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    setState(() => _isLoading = true);
    try {
      final configs = await _repo.getConfigs();
      if (mounted) {
        setState(() {
          _configs = configs;
          _isLoading = false;
        });
      }
    } catch (e) {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  Future<void> _toggleChannel(DeliveryChannelConfig config) async {
    final newConfig = config.copyWith(isActive: !config.isActive);
    await _repo.updateConfig(newConfig);
    _loadData(); // Refresh UI
  }
  
  Future<void> _syncMenu(DeliveryProvider provider) async {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Syncing Menu...')));
    await _repo.syncMenuToChannel(provider);
    if (mounted) {
       ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Menu Synced Successfully!'), backgroundColor: Colors.green));
       _loadData();
    }
  }

  Future<void> _simulateOrder(DeliveryProvider provider) async {
     try {
       final orderUuid = await _repo.simulateIncomingOrder(provider, {
         'id': '#${Random().nextInt(9999)}',
         'display_id': 'EXT-${Random().nextInt(9999)}',
         'driver_name': 'Driver ${['John', 'Budi', 'Siti', 'Ahmad'][Random().nextInt(4)]}',
         'driver_plate': 'B 123${Random().nextInt(9)} XYZ',
       });
       
       if (mounted) {
          setState(() => _lastSimulatedOrderUuid = orderUuid);
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('New ${provider.name} Order Received!'),
            backgroundColor: Colors.blueAccent,
            action: SnackBarAction(label: 'View', onPressed: () {}),
          ));
       }
     } catch (e) {
        if (mounted) ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error: $e')));
     }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) return const Center(child: CircularProgressIndicator());

    return Scaffold(
      appBar: AppBar(title: const Text('Delivery Integrations')),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Left: Channel Management
          Expanded(
            flex: 2,
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                const Text('Active Channels', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                const Gap(8),
                if (_configs != null)
                  ..._configs!.map((c) => _ChannelCard(
                    config: c, 
                    onToggle: () => _toggleChannel(c),
                    onSync: () => _syncMenu(c.provider),
                  )),
                  
                const Gap(24),
                const Text('Developer Simulator (Webhooks)', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.orange)),
                const Gap(8),
                _SimulatorPanel(onSimulate: _simulateOrder),
              ],
            ),
          ),
          
          const VerticalDivider(width: 1),
          
          // Right: Activity Log (Placeholder for demo)
          Expanded(
            flex: 1,
            child: Container(
              color: Theme.of(context).colorScheme.surfaceContainerLowest,
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Integration Activity', style: TextStyle(fontWeight: FontWeight.bold)),
                  const Gap(16),
                  if (_lastSimulatedOrderUuid != null)
                     ListTile(
                       leading: const Icon(Icons.notifications_active, color: Colors.green),
                       title: const Text('New Order Webhook'),
                       subtitle: Text('Order UUID: ...${_lastSimulatedOrderUuid!.substring(_lastSimulatedOrderUuid!.length - 6)}\nPayload processed successfully.'),
                       isThreeLine: true,
                     ).animate().fadeIn().slideX(),
                     
                  const Divider(),
                  const Center(child: Text('Waiting for events...', style: TextStyle(color: Colors.grey, fontSize: 12))),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _ChannelCard extends StatelessWidget {
  final DeliveryChannelConfig config;
  final VoidCallback onToggle;
  final VoidCallback onSync;

  const _ChannelCard({required this.config, required this.onToggle, required this.onSync});

  @override
  Widget build(BuildContext context) {
    final isUber = config.provider == DeliveryProvider.uberEats;
    final color = isUber ? Colors.green[800]! : Colors.green;
    
    return Card(
      elevation: 0,
       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12), side: BorderSide(color: Colors.grey.withValues(alpha: 0.2))),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(color: color.withValues(alpha: 0.1), borderRadius: BorderRadius.circular(8)),
                  child: Icon(Icons.delivery_dining, color: color),
                ),
                const Gap(16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(isUber ? 'Uber Eats' : 'GrabFood', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                      Text(config.isActive ? 'Accepting Orders' : 'Paused (Busy Mode)', 
                        style: TextStyle(color: config.isActive ? Colors.green : Colors.red, fontSize: 12)
                      ),
                    ],
                  ),
                ),
                Switch(value: config.isActive, onChanged: (_) => onToggle()),
              ],
            ),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton.icon(
                  onPressed: onSync,
                  icon: const Icon(Icons.sync, size: 16),
                  label: Text('Sync Menu (Last: ${config.lastSyncedAt != null ? DateFormat('HH:mm').format(config.lastSyncedAt!) : 'Never'})'),
                ),
                if (config.autoAcceptOrders)
                   const Chip(label: Text('Auto-Accept Only', style: TextStyle(fontSize: 10)), visualDensity: VisualDensity.compact)
              ],
            )
          ],
        ),
      ),
    );
  }
}

class _SimulatorPanel extends StatelessWidget {
  final Function(DeliveryProvider) onSimulate;
  const _SimulatorPanel({required this.onSimulate});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.orange[50],
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Trigger Incoming Webhook', style: TextStyle(fontWeight: FontWeight.bold)),
            const Gap(12),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.black, foregroundColor: Colors.white),
                    icon: const Icon(Icons.add_shopping_cart),
                    label: const Text('Uber Eats Order'),
                    onPressed: () => onSimulate(DeliveryProvider.uberEats),
                  ),
                ),
                const Gap(8),
                Expanded(
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.green, foregroundColor: Colors.white),
                    icon: const Icon(Icons.add_shopping_cart),
                    label: const Text('GrabFood Order'),
                    onPressed: () => onSimulate(DeliveryProvider.grabFood),
                  ),
                ),
              ],
            ),
             const Gap(8),
             const Text('Simulates receiving a JSON payload from the provider API.', style: TextStyle(fontSize: 10, color: Colors.grey)),
          ],
        ),
      ),
    );
  }
}
