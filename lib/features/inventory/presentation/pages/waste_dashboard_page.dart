import 'package:savvy_pos/core/utils/time_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:gap/gap.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:savvy_pos/features/inventory/domain/entities/waste_record.dart';
import 'package:savvy_pos/features/inventory/domain/repositories/i_inventory_repository.dart';
import 'package:savvy_pos/features/inventory/presentation/dialogs/report_waste_dialog.dart';

class WasteDashboardPage extends StatefulWidget {
  const WasteDashboardPage({super.key});

  @override
  State<WasteDashboardPage> createState() => _WasteDashboardPageState();
}

class _WasteDashboardPageState extends State<WasteDashboardPage> {
  final _repo = GetIt.I<IInventoryRepository>();
  List<WasteRecord>? _records;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    setState(() => _isLoading = true);
    try {
      // Fetch last 30 days by default
      final start = TimeHelper.now().subtract(const Duration(days: 30));
      final records = await _repo.getWasteReports(from: start);
      // Sort by date desc
      records.sort((a, b) => b.recordedAt.compareTo(a.recordedAt));

      if (mounted) {
        setState(() {
          _records = records;
          _isLoading = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _isLoading = false;
          _records = [];
        });
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Error loading waste data: $e')));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final totalLoss =
        _records?.fold<double>(0, (sum, item) => sum + item.costLoss) ?? 0;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Food Waste Tracking'),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          final result = await showDialog(
            context: context,
            builder: (ctx) => const ReportWasteDialog(),
          );
          if (result == true) {
            _loadData();
          }
        },
        label: const Text('Report Waste'),
        icon: const Icon(Icons.delete_outline),
        backgroundColor: Colors.red.shade100,
        foregroundColor: Colors.red.shade900,
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : RefreshIndicator(
              onRefresh: _loadData,
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: _SummaryCard(
                          totalLoss: totalLoss,
                          recordCount: _records?.length ?? 0),
                    ),
                  ),
                  if (_records != null && _records!.isEmpty)
                    SliverFillRemaining(
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.eco_outlined,
                                    size: 80, color: Colors.grey[300])
                                .animate()
                                .fade(duration: 500.ms)
                                .scale(),
                            const Gap(16),
                            Text(
                              'No Waste Recorded',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge
                                  ?.copyWith(color: Colors.grey),
                            ),
                            const Text('Great job keeping waste low!',
                                style: TextStyle(color: Colors.grey)),
                          ],
                        ),
                      ),
                    )
                  else
                    SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          final record = _records![index];
                          return Card(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 4),
                            elevation: 0,
                            color: Theme.of(context)
                                .colorScheme
                                .surfaceContainerLow,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12)),
                            child: ListTile(
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 8),
                              leading: Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: Colors.red.withValues(alpha: 0.1),
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(Icons.delete_outline,
                                    color: Colors.red[700]),
                              ),
                              title: Text(record.itemName ?? 'Unknown Item',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w600)),
                              subtitle: Padding(
                                padding: const EdgeInsets.only(top: 4),
                                child: Row(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 6, vertical: 2),
                                      decoration: BoxDecoration(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .surfaceContainerHighest,
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                      child: Text(record.reason.label,
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .onSurfaceVariant)),
                                    ),
                                    const Gap(8),
                                    Text('${record.quantity} ${record.unit}'),
                                  ],
                                ),
                              ),
                              trailing: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    DateFormat.MMMEd()
                                        .format(record.recordedAt),
                                    style:
                                        Theme.of(context).textTheme.bodySmall,
                                  ),
                                  const Gap(4),
                                  Text(
                                    NumberFormat.currency(symbol: '\$')
                                        .format(record.costLoss),
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .error),
                                  ),
                                ],
                              ),
                            ),
                          ).animate().fadeIn(delay: (50 * index).ms).slideX();
                        },
                        childCount: _records?.length ?? 0,
                      ),
                    ),
                ],
              ),
            ),
    );
  }
}

class _SummaryCard extends StatelessWidget {
  final double totalLoss;
  final int recordCount;

  const _SummaryCard({required this.totalLoss, required this.recordCount});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.red.shade900, Colors.red.shade700],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.red.withValues(alpha: 0.3),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Total Loss (30 Days)',
                  style: TextStyle(color: Colors.red.shade100)),
              const Gap(8),
              Text(
                NumberFormat.currency(symbol: '\$').format(totalLoss),
                style: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.white.withValues(alpha: 0.2)),
            ),
            child: Column(
              children: [
                Text('$recordCount',
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
                const Text('Incidents',
                    style: TextStyle(fontSize: 12, color: Colors.white70)),
              ],
            ),
          ),
        ],
      ),
    ).animate().scale(duration: 400.ms, curve: Curves.easeOutBack);
  }
}
