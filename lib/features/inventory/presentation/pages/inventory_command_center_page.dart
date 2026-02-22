import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:savvy_pos/core/config/theme/savvy_theme.dart';
import 'package:savvy_pos/core/presentation/widgets/savvy_text.dart';
import 'package:savvy_pos/features/inventory/domain/entities/advanced_inventory_entities.dart';
import 'package:savvy_pos/features/inventory/presentation/bloc/advanced_inventory_bloc.dart';
import 'package:savvy_pos/features/inventory/presentation/pages/stock_levels_page.dart';
import 'package:savvy_pos/features/inventory/presentation/pages/stock_movement_page.dart';
import 'package:savvy_pos/features/inventory/presentation/pages/batch_management_page.dart';
import 'package:savvy_pos/features/inventory/presentation/pages/inventory_alerts_page.dart';
import 'package:savvy_pos/features/inventory/presentation/pages/stock_transfers_page.dart';

class InventoryCommandCenterPage extends StatelessWidget {
  const InventoryCommandCenterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => GetIt.I<AdvancedInventoryBloc>()
        ..add(const AdvancedInventoryEvent.loadDashboard()),
      child: const _CommandCenterContent(),
    );
  }
}

class _CommandCenterContent extends StatelessWidget {
  const _CommandCenterContent();

  @override
  Widget build(BuildContext context) {
    final theme = context.savvy;

    return Scaffold(
      backgroundColor: theme.colors.bgCanvas,
      body: RefreshIndicator(
        onRefresh: () async {
          HapticFeedback.mediumImpact();
          context
              .read<AdvancedInventoryBloc>()
              .add(const AdvancedInventoryEvent.refreshDashboard());
        },
        child: CustomScrollView(
          slivers: [
            // App Bar
            SliverAppBar(
              expandedHeight: 140,
              floating: true,
              pinned: true,
              backgroundColor: theme.colors.bgSurface,
              flexibleSpace: FlexibleSpaceBar(
                title: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.inventory_2,
                        color: theme.colors.brandPrimary, size: 24),
                    const SizedBox(width: 8),
                    const Text('Inventory Command Center',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600)),
                  ],
                ),
                centerTitle: false,
                titlePadding: const EdgeInsets.only(left: 16, bottom: 16),
              ),
              actions: [
                // Warehouse Selector
                BlocBuilder<AdvancedInventoryBloc, AdvancedInventoryState>(
                  builder: (context, state) {
                    return PopupMenuButton<String>(
                      icon: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.warehouse,
                              color: theme.colors.textSecondary),
                          const SizedBox(width: 4),
                          Text(
                            state.warehouses
                                .firstWhere(
                                  (w) => w.uuid == state.selectedWarehouseUuid,
                                  orElse: () => const Warehouse(
                                      uuid: '',
                                      name: 'All Locations',
                                      code: 'ALL'),
                                )
                                .name,
                            style: TextStyle(
                                color: theme.colors.textPrimary, fontSize: 14),
                          ),
                          Icon(Icons.arrow_drop_down,
                              color: theme.colors.textSecondary),
                        ],
                      ),
                      onSelected: (uuid) {
                        context.read<AdvancedInventoryBloc>().add(
                            AdvancedInventoryEvent.selectWarehouse(
                                uuid.isEmpty ? null : uuid));
                      },
                      itemBuilder: (context) => [
                        const PopupMenuItem(
                            value: '', child: Text('All Locations')),
                        ...state.warehouses.map((w) =>
                            PopupMenuItem(value: w.uuid, child: Text(w.name))),
                      ],
                    );
                  },
                ),
                const SizedBox(width: 8),
                // Alerts Badge
                BlocBuilder<AdvancedInventoryBloc, AdvancedInventoryState>(
                  builder: (context, state) {
                    return IconButton(
                      icon: Badge(
                        isLabelVisible: state.unacknowledgedAlertCount > 0,
                        label: Text('${state.unacknowledgedAlertCount}'),
                        child: Icon(Icons.notifications_outlined,
                            color: theme.colors.textSecondary),
                      ),
                      onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const InventoryAlertsPage())),
                    );
                  },
                ),
                const SizedBox(width: 16),
              ],
            ),

            // Content
            BlocBuilder<AdvancedInventoryBloc, AdvancedInventoryState>(
              builder: (context, state) {
                if (state.isLoading) {
                  return const SliverFillRemaining(
                    child: Center(child: CircularProgressIndicator()),
                  );
                }

                if (state.error != null) {
                  return SliverFillRemaining(
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.error_outline,
                              size: 64, color: theme.colors.stateError),
                          const SizedBox(height: 16),
                          Text(state.error!,
                              style: TextStyle(color: theme.colors.stateError)),
                          const SizedBox(height: 16),
                          ElevatedButton.icon(
                            onPressed: () => context
                                .read<AdvancedInventoryBloc>()
                                .add(const AdvancedInventoryEvent
                                    .loadDashboard()),
                            icon: const Icon(Icons.refresh),
                            label: const Text('Retry'),
                          ),
                        ],
                      ),
                    ),
                  );
                }

                final stats =
                    state.dashboardStats ?? const InventoryDashboardStats();

                return SliverPadding(
                  padding: const EdgeInsets.all(16),
                  sliver: SliverList(
                    delegate: SliverChildListDelegate([
                      // KPI Cards Row
                      _KpiCardsRow(stats: stats)
                          .animate()
                          .fadeIn(duration: 300.ms)
                          .slideY(begin: 0.1, end: 0),
                      const SizedBox(height: 24),

                      // Quick Actions Grid
                      _QuickActionsGrid()
                          .animate()
                          .fadeIn(duration: 300.ms, delay: 100.ms)
                          .slideY(begin: 0.1, end: 0),
                      const SizedBox(height: 24),

                      // Stock Health Overview
                      _StockHealthCard(stats: stats)
                          .animate()
                          .fadeIn(duration: 300.ms, delay: 200.ms)
                          .slideY(begin: 0.1, end: 0),
                      const SizedBox(height: 24),

                      // Recent Alerts
                      if (state.alerts.isNotEmpty) ...[
                        _RecentAlertsCard(alerts: state.alerts.take(5).toList())
                            .animate()
                            .fadeIn(duration: 300.ms, delay: 300.ms)
                            .slideY(begin: 0.1, end: 0),
                        const SizedBox(height: 24),
                      ],

                      // AI Insights
                      if (state.insights.isNotEmpty) ...[
                        _InsightsCard(insights: state.insights)
                            .animate()
                            .fadeIn(duration: 300.ms, delay: 400.ms)
                            .slideY(begin: 0.1, end: 0),
                        const SizedBox(height: 24),
                      ],

                      const SizedBox(height: 80), // Bottom padding
                    ]),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

// ==============================================================================
// KPI CARDS
// ==============================================================================

class _KpiCardsRow extends StatelessWidget {
  final InventoryDashboardStats stats;

  const _KpiCardsRow({required this.stats});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          _GlassmorphicKpiCard(
            icon: Icons.inventory_2,
            label: 'Total Products',
            value: '${stats.totalProducts}',
            color: Colors.blue,
          ),
          const SizedBox(width: 12),
          _GlassmorphicKpiCard(
            icon: Icons.attach_money,
            label: 'Stock Value',
            value: '\$${stats.totalStockValue.toStringAsFixed(0)}',
            color: Colors.green,
          ),
          const SizedBox(width: 12),
          _GlassmorphicKpiCard(
            icon: Icons.warning_amber,
            label: 'Low Stock',
            value: '${stats.lowStockCount}',
            color: Colors.orange,
            isWarning: stats.lowStockCount > 0,
          ),
          const SizedBox(width: 12),
          _GlassmorphicKpiCard(
            icon: Icons.remove_shopping_cart,
            label: 'Out of Stock',
            value: '${stats.outOfStockCount}',
            color: Colors.red,
            isWarning: stats.outOfStockCount > 0,
          ),
          const SizedBox(width: 12),
          _GlassmorphicKpiCard(
            icon: Icons.timer,
            label: 'Expiring Soon',
            value: '${stats.expiringCount}',
            color: Colors.purple,
            isWarning: stats.expiringCount > 0,
          ),
        ],
      ),
    );
  }
}

class _GlassmorphicKpiCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final Color color;
  final bool isWarning;

  const _GlassmorphicKpiCard({
    required this.icon,
    required this.label,
    required this.value,
    required this.color,
    this.isWarning = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.savvy;

    return Container(
      width: 160,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            color.withValues(alpha: 0.15),
            color.withValues(alpha: 0.05),
          ],
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isWarning ? color.withValues(alpha: 0.5) : theme.colors.border,
          width: isWarning ? 2 : 1,
        ),
        boxShadow: [
          BoxShadow(
            color: color.withValues(alpha: 0.1),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, color: color, size: 20),
          ),
          const SizedBox(height: 12),
          Text(
            value,
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: theme.colors.textPrimary,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: theme.colors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }
}

// ==============================================================================
// QUICK ACTIONS
// ==============================================================================

class _QuickActionsGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = context.savvy;

    final actions = [
      _QuickAction(
        icon: Icons.list_alt,
        label: 'Stock Levels',
        color: theme.colors.brandPrimary,
        onTap: () => Navigator.push(context,
            MaterialPageRoute(builder: (_) => const StockLevelsPage())),
      ),
      _QuickAction(
        icon: Icons.swap_horiz,
        label: 'Transfers',
        color: Colors.teal,
        onTap: () => Navigator.push(context,
            MaterialPageRoute(builder: (_) => const StockTransfersPage())),
      ),
      _QuickAction(
        icon: Icons.history,
        label: 'Movements',
        color: Colors.indigo,
        onTap: () => Navigator.push(context,
            MaterialPageRoute(builder: (_) => const StockMovementPage())),
      ),
      _QuickAction(
        icon: Icons.qr_code_scanner,
        label: 'Batches',
        color: Colors.deepPurple,
        onTap: () => Navigator.push(context,
            MaterialPageRoute(builder: (_) => const BatchManagementPage())),
      ),
      _QuickAction(
        icon: Icons.calculate,
        label: 'Count',
        color: Colors.amber.shade700,
        onTap: () {
          HapticFeedback.mediumImpact();
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Physical Count - Coming Soon')),
          );
        },
      ),
      _QuickAction(
        icon: Icons.assessment,
        label: 'Variance',
        color: Colors.pink,
        onTap: () {
          HapticFeedback.mediumImpact();
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Variance Report - Coming Soon')),
          );
        },
      ),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SavvyText.label('QUICK ACTIONS'),
        const SizedBox(height: 12),
        GridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: 3,
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
          childAspectRatio: 1.2,
          children: actions
              .map((action) => _QuickActionTile(action: action))
              .toList(),
        ),
      ],
    );
  }
}

class _QuickAction {
  final IconData icon;
  final String label;
  final Color color;
  final VoidCallback onTap;

  const _QuickAction({
    required this.icon,
    required this.label,
    required this.color,
    required this.onTap,
  });
}

class _QuickActionTile extends StatelessWidget {
  final _QuickAction action;

  const _QuickActionTile({required this.action});

  @override
  Widget build(BuildContext context) {
    final theme = context.savvy;

    return Material(
      color: theme.colors.bgSurface,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        onTap: () {
          HapticFeedback.lightImpact();
          action.onTap();
        },
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: theme.colors.border),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: action.color.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(action.icon, color: action.color, size: 24),
              ),
              const SizedBox(height: 8),
              Text(
                action.label,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: theme.colors.textPrimary,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ==============================================================================
// STOCK HEALTH CARD
// ==============================================================================

class _StockHealthCard extends StatelessWidget {
  final InventoryDashboardStats stats;

  const _StockHealthCard({required this.stats});

  @override
  Widget build(BuildContext context) {
    final theme = context.savvy;
    final total = stats.totalProducts > 0 ? stats.totalProducts : 1;
    final healthyPercent =
        ((total - stats.lowStockCount - stats.outOfStockCount) / total * 100)
            .clamp(0, 100)
            .toDouble();

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: theme.colors.bgSurface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: theme.colors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.health_and_safety, color: theme.colors.stateSuccess),
              const SizedBox(width: 8),
              const SavvyText.h4('Stock Health'),
              const Spacer(),
              Text(
                '${healthyPercent.toStringAsFixed(0)}%',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: _getHealthColor(healthyPercent),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: LinearProgressIndicator(
              value: healthyPercent / 100,
              minHeight: 8,
              backgroundColor: theme.colors.border,
              valueColor:
                  AlwaysStoppedAnimation(_getHealthColor(healthyPercent)),
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _HealthIndicator(
                label: 'Healthy',
                count: total - stats.lowStockCount - stats.outOfStockCount,
                color: Colors.green,
              ),
              _HealthIndicator(
                label: 'Low',
                count: stats.lowStockCount,
                color: Colors.orange,
              ),
              _HealthIndicator(
                label: 'Out',
                count: stats.outOfStockCount,
                color: Colors.red,
              ),
              _HealthIndicator(
                label: 'Expiring',
                count: stats.expiringCount,
                color: Colors.purple,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Color _getHealthColor(double percent) {
    if (percent >= 80) return Colors.green;
    if (percent >= 60) return Colors.orange;
    return Colors.red;
  }
}

class _HealthIndicator extends StatelessWidget {
  final String label;
  final int count;
  final Color color;

  const _HealthIndicator({
    required this.label,
    required this.count,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.savvy;

    return Column(
      children: [
        Container(
          width: 8,
          height: 8,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          '$count',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: theme.colors.textPrimary,
          ),
        ),
        Text(
          label,
          style: TextStyle(
            fontSize: 11,
            color: theme.colors.textSecondary,
          ),
        ),
      ],
    );
  }
}

// ==============================================================================
// RECENT ALERTS CARD
// ==============================================================================

class _RecentAlertsCard extends StatelessWidget {
  final List<StockAlert> alerts;

  const _RecentAlertsCard({required this.alerts});

  @override
  Widget build(BuildContext context) {
    final theme = context.savvy;

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: theme.colors.bgSurface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: theme.colors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.warning_amber, color: Colors.orange),
              const SizedBox(width: 8),
              const SavvyText.h4('Recent Alerts'),
              const Spacer(),
              TextButton(
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => const InventoryAlertsPage())),
                child: const Text('View All'),
              ),
            ],
          ),
          const SizedBox(height: 12),
          ...alerts.map((alert) => _AlertTile(alert: alert)),
        ],
      ),
    );
  }
}

class _AlertTile extends StatelessWidget {
  final StockAlert alert;

  const _AlertTile({required this.alert});

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
      case AlertType.expired:
        alertColor = Colors.purple;
        alertIcon = Icons.timer_off;
        break;
      default:
        alertColor = Colors.blue;
        alertIcon = Icons.info;
    }

    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: alertColor.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: alertColor.withValues(alpha: 0.3)),
      ),
      child: Row(
        children: [
          Icon(alertIcon, color: alertColor, size: 20),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  alert.productName,
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: theme.colors.textPrimary),
                ),
                Text(
                  alert.message,
                  style: TextStyle(
                      fontSize: 12, color: theme.colors.textSecondary),
                ),
              ],
            ),
          ),
          if (!alert.isAcknowledged)
            Container(
              width: 8,
              height: 8,
              decoration: BoxDecoration(
                color: alertColor,
                shape: BoxShape.circle,
              ),
            ),
        ],
      ),
    );
  }
}

// ==============================================================================
// INSIGHTS CARD
// ==============================================================================

class _InsightsCard extends StatelessWidget {
  final List<InventoryInsight> insights;

  const _InsightsCard({required this.insights});

  @override
  Widget build(BuildContext context) {
    final theme = context.savvy;

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            theme.colors.brandPrimary.withValues(alpha: 0.15),
            theme.colors.brandSecondary.withValues(alpha: 0.1),
          ],
        ),
        borderRadius: BorderRadius.circular(16),
        border:
            Border.all(color: theme.colors.brandPrimary.withValues(alpha: 0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: theme.colors.brandPrimary.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(Icons.lightbulb, color: theme.colors.brandPrimary),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SavvyText.h4('AI Insights'),
                  Text(
                    '${insights.length} recommendations',
                    style: TextStyle(
                        fontSize: 12, color: theme.colors.textSecondary),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),
          ...insights.take(3).map((insight) => _InsightTile(insight: insight)),
        ],
      ),
    );
  }
}

class _InsightTile extends StatelessWidget {
  final InventoryInsight insight;

  const _InsightTile({required this.insight});

  @override
  Widget build(BuildContext context) {
    final theme = context.savvy;

    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: theme.colors.bgCanvas,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  insight.title,
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: theme.colors.textPrimary),
                ),
                const SizedBox(height: 2),
                Text(
                  insight.description,
                  style: TextStyle(
                      fontSize: 12, color: theme.colors.textSecondary),
                ),
              ],
            ),
          ),
          if (insight.actionLabel != null)
            TextButton(
              onPressed: () {},
              child: Text(insight.actionLabel!),
            ),
        ],
      ),
    );
  }
}
