import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:savvy_pos/core/config/theme/savvy_theme.dart';
import 'package:savvy_pos/core/presentation/widgets/savvy_text.dart';
import 'package:savvy_pos/features/inventory/domain/entities/advanced_inventory_entities.dart';
import 'package:savvy_pos/features/inventory/presentation/bloc/advanced_inventory_bloc.dart';

class BatchManagementPage extends StatelessWidget {
  const BatchManagementPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => GetIt.I<AdvancedInventoryBloc>()..add(const AdvancedInventoryEvent.loadBatches()),
      child: const _BatchManagementContent(),
    );
  }
}

class _BatchManagementContent extends StatefulWidget {
  const _BatchManagementContent();

  @override
  State<_BatchManagementContent> createState() => _BatchManagementContentState();
}

class _BatchManagementContentState extends State<_BatchManagementContent> {
  bool _showExpiringOnly = false;

  @override
  Widget build(BuildContext context) {
    final theme = context.savvy;

    return Scaffold(
      backgroundColor: theme.colors.bgCanvas,
      appBar: AppBar(
        backgroundColor: theme.colors.bgSurface,
        title: Row(
          children: [
            Icon(Icons.qr_code_scanner, color: theme.colors.brandPrimary),
            const SizedBox(width: 8),
            const Text('Batch Management'),
          ],
        ),
        actions: [
          // Expiring Only Toggle
          IconButton(
            icon: Icon(
              Icons.timer,
              color: _showExpiringOnly ? Colors.orange : theme.colors.textSecondary,
            ),
            tooltip: 'Show expiring only',
            onPressed: () {
              HapticFeedback.selectionClick();
              setState(() => _showExpiringOnly = !_showExpiringOnly);
              context.read<AdvancedInventoryBloc>().add(
                AdvancedInventoryEvent.loadBatches(expiringOnly: _showExpiringOnly),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              HapticFeedback.mediumImpact();
              context.read<AdvancedInventoryBloc>().add(
                AdvancedInventoryEvent.loadBatches(expiringOnly: _showExpiringOnly),
              );
            },
          ),
        ],
      ),
      body: BlocBuilder<AdvancedInventoryBloc, AdvancedInventoryState>(
        builder: (context, state) {
          if (state.isLoadingBatches) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state.batches.isEmpty) {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.layers, size: 64, color: theme.colors.textSecondary),
                  const SizedBox(height: 16),
                  Text('No batches found', style: TextStyle(color: theme.colors.textSecondary)),
                  const SizedBox(height: 8),
                  Text(
                    _showExpiringOnly ? 'No items expiring soon' : 'Batches will appear here when goods are received',
                    style: TextStyle(fontSize: 12, color: theme.colors.textSecondary),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            );
          }

          // Group by expiry status
          final expiringSoon = <Batch>[];
          final expired = <Batch>[];
          final active = <Batch>[];

          for (final batch in state.batches) {
            if (batch.status == BatchStatus.expired || 
                (batch.expiryDate != null && batch.expiryDate!.isBefore(DateTime.now()))) {
              expired.add(batch);
            } else if (batch.expiryDate != null && 
                       batch.expiryDate!.difference(DateTime.now()).inDays <= 7) {
              expiringSoon.add(batch);
            } else {
              active.add(batch);
            }
          }

          return CustomScrollView(
            slivers: [
              // Expiry Summary Cards
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: [
                      Expanded(
                        child: _ExpirySummaryCard(
                          icon: Icons.warning_amber,
                          label: 'Expiring Soon',
                          count: expiringSoon.length,
                          color: Colors.orange,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: _ExpirySummaryCard(
                          icon: Icons.error,
                          label: 'Expired',
                          count: expired.length,
                          color: Colors.red,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: _ExpirySummaryCard(
                          icon: Icons.check_circle,
                          label: 'Active',
                          count: active.length,
                          color: Colors.green,
                        ),
                      ),
                    ],
                  ).animate().fadeIn(duration: 300.ms).slideY(begin: 0.1, end: 0),
                ),
              ),

              // Expired Section
              if (expired.isNotEmpty) ...[
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                    child: Row(
                      children: [
                        Icon(Icons.error, color: Colors.red, size: 20),
                        const SizedBox(width: 8),
                        const SavvyText.label('EXPIRED'),
                      ],
                    ),
                  ),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                      child: _BatchCard(batch: expired[index])
                          .animate()
                          .fadeIn(duration: 200.ms, delay: (index * 30).ms),
                    ),
                    childCount: expired.length,
                  ),
                ),
              ],

              // Expiring Soon Section
              if (expiringSoon.isNotEmpty) ...[
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                    child: Row(
                      children: [
                        Icon(Icons.timer, color: Colors.orange, size: 20),
                        const SizedBox(width: 8),
                        const SavvyText.label('EXPIRING SOON'),
                      ],
                    ),
                  ),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                      child: _BatchCard(batch: expiringSoon[index])
                          .animate()
                          .fadeIn(duration: 200.ms, delay: (index * 30).ms),
                    ),
                    childCount: expiringSoon.length,
                  ),
                ),
              ],

              // Active Batches Section
              if (active.isNotEmpty && !_showExpiringOnly) ...[
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                    child: Row(
                      children: [
                        Icon(Icons.check_circle, color: Colors.green, size: 20),
                        const SizedBox(width: 8),
                        const SavvyText.label('ACTIVE BATCHES'),
                      ],
                    ),
                  ),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                      child: _BatchCard(batch: active[index])
                          .animate()
                          .fadeIn(duration: 200.ms, delay: (index * 30).ms),
                    ),
                    childCount: active.length,
                  ),
                ),
              ],

              const SliverToBoxAdapter(child: SizedBox(height: 80)),
            ],
          );
        },
      ),
    );
  }
}

class _ExpirySummaryCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final int count;
  final Color color;

  const _ExpirySummaryCard({
    required this.icon,
    required this.label,
    required this.count,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.savvy;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withValues(alpha: 0.3)),
      ),
      child: Column(
        children: [
          Icon(icon, color: color, size: 24),
          const SizedBox(height: 8),
          Text(
            '$count',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: theme.colors.textPrimary,
            ),
          ),
          Text(
            label,
            style: TextStyle(fontSize: 11, color: theme.colors.textSecondary),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class _BatchCard extends StatelessWidget {
  final Batch batch;

  const _BatchCard({required this.batch});

  @override
  Widget build(BuildContext context) {
    final theme = context.savvy;
    
    // Calculate days until expiry
    int? daysUntilExpiry;
    Color expiryColor = Colors.green;
    String expiryText = 'No expiry';
    
    if (batch.expiryDate != null) {
      daysUntilExpiry = batch.expiryDate!.difference(DateTime.now()).inDays;
      if (daysUntilExpiry < 0) {
        expiryColor = Colors.red;
        expiryText = 'Expired ${-daysUntilExpiry}d ago';
      } else if (daysUntilExpiry == 0) {
        expiryColor = Colors.red;
        expiryText = 'Expires today';
      } else if (daysUntilExpiry <= 3) {
        expiryColor = Colors.red;
        expiryText = 'Expires in $daysUntilExpiry days';
      } else if (daysUntilExpiry <= 7) {
        expiryColor = Colors.orange;
        expiryText = 'Expires in $daysUntilExpiry days';
      } else if (daysUntilExpiry <= 14) {
        expiryColor = Colors.amber;
        expiryText = 'Expires in $daysUntilExpiry days';
      } else {
        expiryText = 'Expires ${DateFormat('MMM d').format(batch.expiryDate!)}';
      }
    }

    final usagePercent = batch.initialQuantity > 0 
        ? ((batch.initialQuantity - batch.currentQuantity) / batch.initialQuantity * 100)
        : 0.0;

    return Container(
      decoration: BoxDecoration(
        color: theme.colors.bgSurface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: theme.colors.border),
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(12),
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () => _showBatchDetail(context),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    // Batch Icon
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: expiryColor.withValues(alpha: 0.15),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Icon(Icons.layers, color: expiryColor, size: 24),
                    ),
                    const SizedBox(width: 12),
                    
                    // Batch Info
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            batch.productName ?? 'Unknown Product',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                              color: theme.colors.textPrimary,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Row(
                            children: [
                              Text(
                                'Batch: ${batch.batchNumber}',
                                style: TextStyle(fontSize: 12, color: theme.colors.textSecondary),
                              ),
                              const SizedBox(width: 8),
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                                decoration: BoxDecoration(
                                  color: expiryColor.withValues(alpha: 0.15),
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: Text(
                                  expiryText,
                                  style: TextStyle(fontSize: 10, color: expiryColor, fontWeight: FontWeight.w600),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    
                    // Quantity
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          batch.currentQuantity.toStringAsFixed(0),
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: theme.colors.textPrimary,
                          ),
                        ),
                        Text(
                          'of ${batch.initialQuantity.toStringAsFixed(0)}',
                          style: TextStyle(fontSize: 11, color: theme.colors.textSecondary),
                        ),
                      ],
                    ),
                  ],
                ),

                const SizedBox(height: 12),

                // Usage Progress Bar
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${usagePercent.toStringAsFixed(0)}% used',
                          style: TextStyle(fontSize: 11, color: theme.colors.textSecondary),
                        ),
                        Text(
                          'Received ${DateFormat('MMM d').format(batch.receivedAt)}',
                          style: TextStyle(fontSize: 11, color: theme.colors.textSecondary),
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(4),
                      child: LinearProgressIndicator(
                        value: usagePercent / 100,
                        minHeight: 6,
                        backgroundColor: theme.colors.border,
                        valueColor: AlwaysStoppedAnimation(
                          usagePercent > 80 ? Colors.green 
                              : usagePercent > 50 ? Colors.blue 
                              : Colors.orange,
                        ),
                      ),
                    ),
                  ],
                ),

                // Actions
                const SizedBox(height: 12),
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton.icon(
                        onPressed: () {
                          HapticFeedback.mediumImpact();
                          // Mark as used/depleted
                        },
                        icon: const Icon(Icons.check, size: 18),
                        label: const Text('Mark Used'),
                        style: OutlinedButton.styleFrom(
                          foregroundColor: theme.colors.brandPrimary,
                          side: BorderSide(color: theme.colors.brandPrimary.withValues(alpha: 0.5)),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: OutlinedButton.icon(
                        onPressed: () {
                          HapticFeedback.mediumImpact();
                          // Report waste
                        },
                        icon: Icon(Icons.delete_outline, size: 18, color: Colors.red),
                        label: Text('Report Waste', style: TextStyle(color: Colors.red)),
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(color: Colors.red.withValues(alpha: 0.5)),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showBatchDetail(BuildContext context) {
    HapticFeedback.lightImpact();
    // Show batch detail modal
  }
}
