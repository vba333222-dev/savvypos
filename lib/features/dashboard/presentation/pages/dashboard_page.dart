import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:savvy_pos/core/config/theme_config.dart';
import 'package:savvy_pos/core/presentation/widgets/savvy_widgets.dart';
import 'package:savvy_pos/features/dashboard/presentation/bloc/dashboard_bloc.dart';
import 'package:savvy_pos/features/auth/presentation/widgets/access_control_widget.dart';
import 'package:intl/intl.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          GetIt.I<DashboardBloc>()..add(const DashboardEvent.loadData()),
      child: AccessControlWidget(
        permission: 'VIEW_REPORTS',
        fallback: const Center(child: Text('Access Restricted: Managers Only')),
        child: const _DashboardView(),
      ),
    );
  }
}

class _DashboardView extends StatelessWidget {
  const _DashboardView();

  @override
  Widget build(BuildContext context) {
    final theme = context.savvy;
    final isDesktop = MediaQuery.of(context).size.width >= 900;

    return Scaffold(
      backgroundColor: theme.colors.bgPrimary,
      appBar: AppBar(
        title: SavvyText('Dashboard',
            style: SavvyTextStyle.h3, color: theme.colors.textPrimary),
        backgroundColor: theme.colors.bgSecondary,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.refresh, color: theme.colors.textPrimary),
            onPressed: () => context
                .read<DashboardBloc>()
                .add(const DashboardEvent.refresh()),
          ),
        ],
      ),
      body: BlocBuilder<DashboardBloc, DashboardState>(
        builder: (context, state) {
          return state.when(
            initial: () => const Center(child: CircularProgressIndicator()),
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (msg) => Center(
                child: Text('Error: $msg',
                    style: TextStyle(color: theme.colors.stateError))),
            loaded: (stats, hourly, topProducts, date, last7DaysSales,
                pendingSyncCount) {
              return SingleChildScrollView(
                padding: EdgeInsets.all(theme.shapes.spacingLg),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Date Header
                    SavvyText(
                      DateFormat('EEEE, MMMM d, y').format(date),
                      style: SavvyTextStyle.bodyLg,
                      color: theme.colors.textSecondary,
                    ),
                    const SizedBox(height: 16),

                    // Stats Cards
                    LayoutBuilder(builder: (context, constraints) {
                      final width = constraints.maxWidth;
                      final cardWidth = isDesktop ? (width - 32) / 3 : width;

                      return Wrap(
                        spacing: 16,
                        runSpacing: 16,
                        children: [
                          _StatCard(
                            label: 'Total Sales',
                            value: NumberFormat.simpleCurrency()
                                .format(stats.totalSales),
                            icon: Icons.attach_money,
                            color: theme.colors.stateSuccess,
                            width: cardWidth,
                          ).animate().fadeIn().moveY(begin: 10, end: 0),
                          _StatCard(
                            label: 'Transactions',
                            value: stats.transactionCount.toString(),
                            icon: Icons.receipt_long,
                            color: theme.colors.brandPrimary,
                            width: cardWidth,
                          )
                              .animate()
                              .fadeIn(delay: 100.ms)
                              .moveY(begin: 10, end: 0),
                          _StatCard(
                            label: 'Avg Basket',
                            value: NumberFormat.simpleCurrency()
                                .format(stats.avgBasketSize),
                            icon: Icons.shopping_basket,
                            color: theme.colors.stateWarning,
                            width: cardWidth,
                          )
                              .animate()
                              .fadeIn(delay: 200.ms)
                              .moveY(begin: 10, end: 0),
                        ],
                      );
                    }),

                    const SizedBox(height: 32),

                    // Charts & Top Products
                    if (isDesktop)
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 2,
                            child: _HourlySalesChart(hourlyData: hourly),
                          ),
                          const SizedBox(width: 24),
                          Expanded(
                            flex: 1,
                            child: _TopProductsList(products: topProducts),
                          ),
                        ],
                      )
                    else
                      Column(
                        children: [
                          _HourlySalesChart(hourlyData: hourly),
                          const SizedBox(height: 24),
                          _TopProductsList(products: topProducts),
                        ],
                      ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final String label;
  final String value;
  final IconData icon;
  final Color color;
  final double width;

  const _StatCard({
    required this.label,
    required this.value,
    required this.icon,
    required this.color,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.savvy;
    return SavvyBox(
      width: width,
      padding: EdgeInsets.all(theme.shapes.spacingLg),
      color: theme.colors.bgElevated,
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: color, size: 28),
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SavvyText(label,
                  style: SavvyTextStyle.bodySm,
                  color: theme.colors.textSecondary),
              SavvyText(value,
                  style: SavvyTextStyle.h3, color: theme.colors.textPrimary),
            ],
          ),
        ],
      ),
    );
  }
}

class _HourlySalesChart extends StatelessWidget {
  final List<dynamic> hourlyData; // HourlySalesData

  const _HourlySalesChart({required this.hourlyData});

  @override
  Widget build(BuildContext context) {
    final theme = context.savvy;
    // Prepare spots
    // We expect 0-23 hours. Fill missing with 0.
    final spots = List.generate(24, (index) {
      final data =
          hourlyData.firstWhere((e) => e.hour == index, orElse: () => null);
      return FlSpot(index.toDouble(), data?.total ?? 0.0);
    });

    final maxY = spots.map((e) => e.y).reduce((a, b) => a > b ? a : b);

    return SavvyBox(
      padding: const EdgeInsets.all(24),
      color: theme.colors.bgElevated,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SavvyText('Hourly Sales', style: SavvyTextStyle.h4),
          const SizedBox(height: 24),
          AspectRatio(
            aspectRatio: 2,
            child: LineChart(
              LineChartData(
                gridData: FlGridData(
                    show: true,
                    drawVerticalLine: false,
                    getDrawingHorizontalLine: (value) {
                      return FlLine(
                          color: theme.colors.borderDefault, strokeWidth: 1);
                    }),
                titlesData: FlTitlesData(
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 40,
                        getTitlesWidget: (value, meta) {
                          if (value == 0) return const SizedBox.shrink();
                          return Text(
                            NumberFormat.compactSimpleCurrency().format(value),
                            style: TextStyle(
                                color: theme.colors.textMuted, fontSize: 10),
                          );
                        }),
                  ),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                        showTitles: true,
                        interval: 4,
                        getTitlesWidget: (value, meta) {
                          final hour = value.toInt();
                          return Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text(
                              '$hour:00',
                              style: TextStyle(
                                  color: theme.colors.textMuted, fontSize: 10),
                            ),
                          );
                        }),
                  ),
                  topTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false)),
                  rightTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false)),
                ),
                borderData: FlBorderData(show: false),
                lineBarsData: [
                  LineChartBarData(
                    spots: spots,
                    isCurved: true,
                    color: theme.colors.brandPrimary,
                    barWidth: 3,
                    isStrokeCapRound: true,
                    dotData: const FlDotData(show: false),
                    belowBarData: BarAreaData(
                      show: true,
                      color: theme.colors.brandPrimary.withValues(alpha: 0.1),
                    ),
                  ),
                ],
                maxY: maxY * 1.2, // Padding top
              ),
            ),
          ),
        ],
      ),
    ).animate().fadeIn(duration: 500.ms);
  }
}

class _TopProductsList extends StatelessWidget {
  final List<dynamic> products; // TopProductData

  const _TopProductsList({required this.products});

  @override
  Widget build(BuildContext context) {
    final theme = context.savvy;

    return SavvyBox(
      padding: const EdgeInsets.all(24),
      color: theme.colors.bgElevated,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SavvyText('Top Products', style: SavvyTextStyle.h4),
          const SizedBox(height: 16),
          if (products.isEmpty)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 32),
              child: Center(
                  child: Text("No items sold yet",
                      style: TextStyle(color: theme.colors.textMuted))),
            )
          else
            ...products.asMap().entries.map((entry) {
              final index = entry.key;
              final p = entry.value;
              return Container(
                margin: const EdgeInsets.only(bottom: 12),
                child: Row(
                  children: [
                    Container(
                      width: 24,
                      height: 24,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: index < 3
                            ? theme.colors.brandSecondary
                            : theme.colors.bgSecondary,
                        shape: BoxShape.circle,
                      ),
                      child: Text('${index + 1}',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 12)),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(p.productName,
                              style: TextStyle(
                                  color: theme.colors.textPrimary,
                                  fontWeight: FontWeight.w600)),
                          Text('${p.quantity} sold',
                              style: TextStyle(
                                  color: theme.colors.textSecondary,
                                  fontSize: 12)),
                        ],
                      ),
                    ),
                    Text(
                      NumberFormat.simpleCurrency().format(p.totalSales),
                      style: TextStyle(
                          color: theme.colors.textPrimary,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ).animate().fadeIn(delay: (index * 100).ms).slideX();
            }),
        ],
      ),
    );
  }
}
