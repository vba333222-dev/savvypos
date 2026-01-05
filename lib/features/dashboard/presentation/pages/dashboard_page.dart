import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:savvy_pos/core/config/theme_config.dart';
import 'package:savvy_pos/features/dashboard/presentation/bloc/dashboard_bloc.dart';
import 'package:savvy_pos/features/shift/presentation/bloc/shift_bloc.dart';
import 'package:savvy_pos/features/reports/presentation/pages/reports_hub_page.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => GetIt.I<DashboardBloc>()..add(const DashboardEvent.loadData()),
      child: const _DashboardView(),
    );
  }
}

class _DashboardView extends StatelessWidget {
  const _DashboardView();

  @override
  Widget build(BuildContext context) {
    final colors = context.savvy.colors;
    final shapes = context.savvy.shapes;
    final typography = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: colors.bgPrimary,
      body: BlocBuilder<DashboardBloc, DashboardState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state.error != null) {
            return Center(child: Text('Error: ${state.error}'));
          }

          return SingleChildScrollView(
            padding: EdgeInsets.all(shapes.spacingLg),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Business Insights',
                      style: typography.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    ElevatedButton.icon(
                      onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const ReportsHubPage())),
                      icon: const Icon(Icons.bar_chart),
                      label: const Text('Reports Hub'),
                    ),
                  ],
                ),
                SizedBox(height: shapes.spacingLg),
                
                // Summary Cards
                Wrap(
                  spacing: shapes.spacingMd,
                  runSpacing: shapes.spacingMd,
                  children: [
                    _SummaryCard(
                      title: 'Today\'s Sales', 
                      value: '\$${state.todaySales.toStringAsFixed(2)}', 
                      icon: Icons.attach_money,
                      color: colors.stateSuccess,
                    ),
                    BlocBuilder<ShiftBloc, ShiftState>(
                      builder: (context, shiftState) {
                        final cash = shiftState.maybeWhen(
                          open: (s) => s.expectedCash, 
                          orElse: () => 0.0
                        );
                        return _SummaryCard(
                          title: 'Active Shift Cash', 
                          value: '\$${cash.toStringAsFixed(2)}', 
                          icon: Icons.point_of_sale,
                          color: colors.brandPrimary,
                        );
                      }
                    ),
                    _SummaryCard(
                      title: 'Pending Sync', 
                      value: '${state.pendingSyncCount}', 
                      icon: Icons.cloud_upload,
                      color: state.pendingSyncCount > 0 ? colors.stateWarning : colors.textMuted,
                    ),
                  ],
                ),

                SizedBox(height: shapes.spacingXl),

                // Chart Section
                Container(
                  height: 300,
                  padding: EdgeInsets.all(shapes.spacingLg),
                  decoration: BoxDecoration(
                    color: colors.bgElevated,
                    borderRadius: BorderRadius.circular(shapes.radiusLg),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Sales Last 7 Days', style: typography.titleMedium),
                      const SizedBox(height: 16),
                      Expanded(
                        child:  BarChart(
                          BarChartData(
                            alignment: BarChartAlignment.spaceAround,
                            maxY: state.recentSales.fold(0.0, (m, e) => e.total > m ? e.total : m) * 1.2, // Add buffer
                            titlesData: FlTitlesData(
                              show: true,
                              bottomTitles: AxisTitles(
                                sideTitles: SideTitles(
                                  showTitles: true,
                                  getTitlesWidget: (val, meta) {
                                    final index = val.toInt();
                                    if (index >= 0 && index < state.recentSales.length) {
                                      return Padding(
                                        padding: const EdgeInsets.only(top: 8.0),
                                        child: Text(
                                          DateFormat('E').format(state.recentSales[index].date),
                                          style: TextStyle(fontSize: 10, color: colors.textSecondary),
                                        ),
                                      );
                                    }
                                    return const SizedBox.shrink();
                                  },
                                ),
                              ),
                              leftTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                              topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                              rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                            ),
                            gridData: const FlGridData(show: false),
                            borderData: FlBorderData(show: false),
                            barGroups: state.recentSales.asMap().entries.map((e) {
                              return BarChartGroupData(
                                x: e.key,
                                barRods: [
                                  BarChartRodData(
                                    toY: e.value.total,
                                    color: colors.brandPrimary,
                                    width: 16,
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                ],
                              );
                            }).toList(),
                          ),
                        ).animate().scaleY(duration: 600.ms, curve: Curves.easeOut),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _SummaryCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color color;

  const _SummaryCard({
    required this.title,
    required this.value,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.savvy.colors;
    final typography = Theme.of(context).textTheme;
    final shapes = context.savvy.shapes;
    
    return Container(
      width: 250, // Fixed width for nice grid
      padding: EdgeInsets.all(shapes.spacingLg),
      decoration: BoxDecoration(
        color: colors.bgElevated,
        borderRadius: BorderRadius.circular(shapes.radiusLg),
        border: Border.all(color: colors.borderDefault),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(shapes.radiusMd),
            ),
            child: Icon(icon, color: color, size: 28),
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               Text(title, style: typography.bodySmall?.copyWith(color: colors.textSecondary)),
               Text(value, style: typography.headlineSmall?.copyWith(fontWeight: FontWeight.bold)),
            ],
          ),
        ],
      ),
    );
  }
}
