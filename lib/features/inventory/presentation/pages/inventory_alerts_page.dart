import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:savvy_pos/core/config/theme/savvy_theme.dart';
import 'package:savvy_pos/core/presentation/widgets/savvy_text.dart';
import 'package:savvy_pos/features/inventory/domain/entities/advanced_inventory_entities.dart';
import 'package:savvy_pos/features/inventory/domain/entities/inventory_entities.dart';
import 'package:savvy_pos/features/inventory/presentation/bloc/advanced_inventory_bloc.dart';
import 'package:savvy_pos/features/inventory/presentation/bloc/inventory_management_bloc.dart';

class InventoryAlertsPage extends StatelessWidget {
  const InventoryAlertsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (_) => GetIt.I<AdvancedInventoryBloc>()
              ..add(const AdvancedInventoryEvent.loadAlerts())),
        BlocProvider(
            create: (_) => GetIt.I<InventoryManagementBloc>()
              ..add(const InventoryManagementEvent.fetchIncomingTransfers())),
      ],
      child: const _AlertsContent(),
    );
  }
}

class _AlertsContent extends StatelessWidget {
  const _AlertsContent();

  @override
  Widget build(BuildContext context) {
    final theme = context.savvy;

    return Scaffold(
      backgroundColor: theme.colors.bgCanvas,
      appBar: AppBar(
        backgroundColor: theme.colors.bgSurface,
        title: Row(
          children: [
            Icon(Icons.notifications, color: theme.colors.brandPrimary),
            const SizedBox(width: 8),
            const Text('Stock Alerts'),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            tooltip: 'Refresh & Generate Alerts',
            onPressed: () {
              HapticFeedback.mediumImpact();
              context
                  .read<AdvancedInventoryBloc>()
                  .add(const AdvancedInventoryEvent.generateAlerts());
            },
          ),
        ],
      ),
      body: BlocBuilder<InventoryManagementBloc, InventoryManagementState>(
        builder: (context, invState) {
          final incomingTransfers = invState.maybeWhen(
            incomingTransfersLoaded: (transfers) => transfers,
            orElse: () => <StockTransfer>[],
          );

          return BlocBuilder<AdvancedInventoryBloc, AdvancedInventoryState>(
            builder: (context, state) {
              if (state.isLoading) {
                return const Center(child: CircularProgressIndicator());
              }

              final unacknowledged =
                  state.alerts.where((a) => !a.isAcknowledged).toList();
              final acknowledged = state.alerts
                  .where((a) => a.isAcknowledged && !a.isResolved)
                  .toList();

              if (state.alerts.isEmpty && incomingTransfers.isEmpty) {
                return Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(24),
                        decoration: BoxDecoration(
                          color: Colors.green.withValues(alpha: 0.1),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(Icons.check_circle,
                            size: 64, color: Colors.green),
                      ),
                      const SizedBox(height: 24),
                      Text(
                        'All Clear!',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: theme.colors.textPrimary,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'No active stock alerts at this time',
                        style: TextStyle(color: theme.colors.textSecondary),
                      ),
                    ],
                  ).animate().scale(duration: 300.ms, curve: Curves.elasticOut),
                );
              }

              return CustomScrollView(
                slivers: [
                  // Summary Header
                  SliverToBoxAdapter(
                    child: Container(
                      margin: const EdgeInsets.all(16),
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Colors.orange.withValues(alpha: 0.15),
                            Colors.red.withValues(alpha: 0.1),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                            color: Colors.orange.withValues(alpha: 0.3)),
                      ),
                      child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: Colors.orange.withValues(alpha: 0.2),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Icon(Icons.warning_amber,
                                color: Colors.orange, size: 28),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${state.alerts.length} Active Alerts',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: theme.colors.textPrimary,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  '${unacknowledged.length} require attention',
                                  style: TextStyle(
                                      fontSize: 13,
                                      color: theme.colors.textSecondary),
                                ),
                              ],
                            ),
                          ),
                          if (unacknowledged.isNotEmpty)
                            FilledButton(
                              onPressed: () {
                                // Acknowledge all
                                for (final alert in unacknowledged) {
                                  context.read<AdvancedInventoryBloc>().add(
                                        AdvancedInventoryEvent.acknowledgeAlert(
                                            alert.uuid),
                                      );
                                }
                              },
                              child: const Text('Ack All'),
                            ),
                        ],
                      ),
                    )
                        .animate()
                        .fadeIn(duration: 300.ms)
                        .slideY(begin: 0.1, end: 0),
                  ),

                  // Incoming Transfers Section
                  if (incomingTransfers.isNotEmpty) ...[
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                        child: Row(
                          children: [
                            Container(
                              width: 10,
                              height: 10,
                              decoration: const BoxDecoration(
                                  color: Colors.blue, shape: BoxShape.circle),
                            ),
                            const SizedBox(width: 8),
                            const SavvyText.label('INCOMING TRANSFERS'),
                          ],
                        ),
                      ),
                    ),
                    SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          final transfer = incomingTransfers[index];
                          return Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 6),
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: theme.colors.bgSurface,
                              borderRadius: BorderRadius.circular(12),
                              border: Border(
                                  left: const BorderSide(
                                      color: Colors.blue, width: 4),
                                  top: BorderSide(color: theme.colors.border),
                                  right: BorderSide(color: theme.colors.border),
                                  bottom:
                                      BorderSide(color: theme.colors.border)),
                            ),
                            child: Row(
                              children: [
                                Icon(Icons.local_shipping,
                                    color: theme.colors.brandPrimary, size: 36),
                                const SizedBox(width: 16),
                                Expanded(
                                    child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                        'From: ${transfer.sourceWarehouseUuid}',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: theme.colors.textPrimary)),
                                    Text(
                                        '${transfer.items.length} Items En-Route',
                                        style: TextStyle(
                                            color: theme.colors.textSecondary)),
                                  ],
                                )),
                                FilledButton.icon(
                                  onPressed: () {
                                    context.read<InventoryManagementBloc>().add(
                                        InventoryManagementEvent
                                            .receiveStockTransfer(
                                                transfer.uuid));
                                  },
                                  icon: const Icon(Icons.download_done),
                                  label: const Text('Terima Barang'),
                                ),
                              ],
                            ),
                          );
                        },
                        childCount: incomingTransfers.length,
                      ),
                    ),
                  ],

                  // Unacknowledged Section
                  if (unacknowledged.isNotEmpty) ...[
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                        child: Row(
                          children: [
                            Container(
                              width: 10,
                              height: 10,
                              decoration: const BoxDecoration(
                                color: Colors.red,
                                shape: BoxShape.circle,
                              ),
                            ),
                            const SizedBox(width: 8),
                            const SavvyText.label('NEEDS ATTENTION'),
                          ],
                        ),
                      ),
                    ),
                    SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) => _AlertCard(
                          alert: unacknowledged[index],
                        )
                            .animate()
                            .fadeIn(duration: 200.ms, delay: (index * 50).ms),
                        childCount: unacknowledged.length,
                      ),
                    ),
                  ],

                  // Acknowledged Section
                  if (acknowledged.isNotEmpty) ...[
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                        child: Row(
                          children: [
                            Container(
                              width: 10,
                              height: 10,
                              decoration: BoxDecoration(
                                color: Colors.orange.withValues(alpha: 0.5),
                                shape: BoxShape.circle,
                              ),
                            ),
                            const SizedBox(width: 8),
                            const SavvyText.label('ACKNOWLEDGED'),
                          ],
                        ),
                      ),
                    ),
                    SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) => _AlertCard(
                          alert: acknowledged[index],
                        )
                            .animate()
                            .fadeIn(duration: 200.ms, delay: (index * 50).ms),
                        childCount: acknowledged.length,
                      ),
                    ),
                  ],

                  const SliverToBoxAdapter(child: SizedBox(height: 80)),
                ],
              );
            },
          );
        },
      ),
    );
  }
}

class _AlertCard extends StatelessWidget {
  final StockAlert alert;

  const _AlertCard({required this.alert});

  @override
  Widget build(BuildContext context) {
    final theme = context.savvy;

    Color alertColor;
    IconData alertIcon;

    switch (alert.alertType) {
      case AlertType.outOfStock:
        alertColor = Colors.red;
        alertIcon = Icons.remove_shopping_cart;
        break;
      case AlertType.lowStock:
        alertColor = Colors.orange;
        alertIcon = Icons.inventory;
        break;
      case AlertType.expiringSoon:
        alertColor = Colors.purple;
        alertIcon = Icons.timer;
        break;
      case AlertType.expired:
        alertColor = Colors.red.shade900;
        alertIcon = Icons.timer_off;
        break;
      case AlertType.overstock:
        alertColor = Colors.blue;
        alertIcon = Icons.inventory_2;
        break;
    }

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      decoration: BoxDecoration(
        color: theme.colors.bgSurface,
        borderRadius: BorderRadius.circular(12),
        border: Border(
          left: BorderSide(color: alertColor, width: 4),
          top: BorderSide(color: theme.colors.border),
          right: BorderSide(color: theme.colors.border),
          bottom: BorderSide(color: theme.colors.border),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: alertColor.withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(alertIcon, color: alertColor, size: 20),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        alert.productName,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                          color: theme.colors.textPrimary,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        alert.message,
                        style: TextStyle(
                            fontSize: 13, color: theme.colors.textSecondary),
                      ),
                    ],
                  ),
                ),
                // Severity Badge
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: _getSeverityColor(alert.severity)
                        .withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    alert.severity.name.toUpperCase(),
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: _getSeverityColor(alert.severity),
                    ),
                  ),
                ),
              ],
            ),

            // Stock info
            if (alert.currentValue != null || alert.thresholdValue != null) ...[
              const SizedBox(height: 12),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: theme.colors.bgCanvas,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    if (alert.currentValue != null)
                      _InfoItem(
                        label: 'Current Stock',
                        value: alert.currentValue!.toStringAsFixed(0),
                        color: alertColor,
                      ),
                    if (alert.thresholdValue != null)
                      _InfoItem(
                        label: 'Threshold',
                        value: alert.thresholdValue!.toStringAsFixed(0),
                        color: theme.colors.textSecondary,
                      ),
                    if (alert.daysBeforeExpiry != null)
                      _InfoItem(
                        label: 'Days Left',
                        value: '${alert.daysBeforeExpiry}',
                        color: alertColor,
                      ),
                  ],
                ),
              ),
            ],

            // Actions
            const SizedBox(height: 12),
            Row(
              children: [
                if (!alert.isAcknowledged) ...[
                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: () {
                        HapticFeedback.mediumImpact();
                        context.read<AdvancedInventoryBloc>().add(
                              AdvancedInventoryEvent.acknowledgeAlert(
                                  alert.uuid),
                            );
                      },
                      icon: const Icon(Icons.check, size: 18),
                      label: const Text('Acknowledge'),
                    ),
                  ),
                  const SizedBox(width: 8),
                ],
                Expanded(
                  child: FilledButton.icon(
                    onPressed: () {
                      HapticFeedback.mediumImpact();
                      _showResolveDialog(context);
                    },
                    icon: const Icon(Icons.done_all, size: 18),
                    label: const Text('Resolve'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Color _getSeverityColor(AlertSeverity severity) {
    switch (severity) {
      case AlertSeverity.info:
        return Colors.blue;
      case AlertSeverity.warning:
        return Colors.orange;
      case AlertSeverity.critical:
        return Colors.red;
    }
  }

  void _showResolveDialog(BuildContext context) {
    final theme = context.savvy;
    final actionController = TextEditingController();

    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        backgroundColor: theme.colors.bgSurface,
        title: const Text('Resolve Alert'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'What action did you take?',
              style: TextStyle(color: theme.colors.textSecondary),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: actionController,
              decoration: const InputDecoration(
                hintText: 'e.g., Reordered 50 units',
                border: OutlineInputBorder(),
              ),
              maxLines: 2,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () {
              Navigator.pop(dialogContext);
              context.read<AdvancedInventoryBloc>().add(
                    AdvancedInventoryEvent.resolveAlert(
                      alert.uuid,
                      actionController.text.isEmpty
                          ? 'Resolved'
                          : actionController.text,
                    ),
                  );
            },
            child: const Text('Resolve'),
          ),
        ],
      ),
    );
  }
}

class _InfoItem extends StatelessWidget {
  final String label;
  final String value;
  final Color color;

  const _InfoItem({
    required this.label,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.savvy;

    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
        Text(
          label,
          style: TextStyle(fontSize: 11, color: theme.colors.textSecondary),
        ),
      ],
    );
  }
}
