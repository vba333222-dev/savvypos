import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:savvy_pos/features/dashboard/presentation/bloc/dashboard_bloc.dart';

class WebDashboardPage extends StatelessWidget {
  const WebDashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetIt.I<DashboardBloc>()..add(const LoadDashboardData()),
      child: BlocBuilder<DashboardBloc, DashboardState>(
        builder: (context, state) {
          if (state is DashboardLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is DashboardError) {
            return Center(child: Text("Error: ${state.message}"));
          }
          if (state is DashboardLoaded) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildStatCards(state),
                const SizedBox(height: 24),
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(flex: 2, child: _buildSalesChart(state)),
                      const SizedBox(width: 24),
                      Expanded(flex: 1, child: _buildTopProducts(state)),
                    ],
                  ),
                ),
              ],
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }

  Widget _buildStatCards(DashboardLoaded state) {
    return Row(
      children: [
        _StatCard(title: "Today's Sales", value: "\$${state.todaySales.toStringAsFixed(2)}", icon: Icons.attach_money, color: Colors.green),
        const SizedBox(width: 16),
        _StatCard(title: "Pending Sync", value: "${state.pendingSyncCount}", icon: Icons.sync_problem, color: Colors.orange), // In web this context means offline devices roughly
      ],
    );
  }

  Widget _buildSalesChart(DashboardLoaded state) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Last 30 Days Sales", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            Expanded(
              child: LineChart(
                LineChartData(
                  gridData: const FlGridData(show: true),
                  titlesData: FlTitlesData(
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (value, meta) {
                          final index = value.toInt();
                          if (index >= 0 && index < state.last7DaysSales.length) { // Variable name still last7DaysSales in State/Repo but content is 30 days
                            // Show every 5th day to avoid clutter
                            if (index % 5 == 0) {
                              final date = state.last7DaysSales[index].date;
                              return Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Text("${date.day}/${date.month}", style: const TextStyle(fontSize: 10)),
                              );
                            }
                          }
                          return const SizedBox.shrink();
                        },
                        interval: 1,
                      ),
                    ),
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 40,
                        getTitlesWidget: (value, meta) {
                          return Text(meta.formattedValue, style: const TextStyle(fontSize: 10));
                        },
                      ),
                    ),
                    topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  ),
                  borderData: FlBorderData(show: true, border: Border.all(color: Colors.grey.withOpacity(0.2))),
                  lineBarsData: [
                    LineChartBarData(
                      spots: state.last7DaysSales.asMap().entries.map((e) {
                        return FlSpot(e.key.toDouble(), e.value.total);
                      }).toList(),
                      isCurved: true,
                      color: Colors.blue,
                      barWidth: 3,
                      isStrokeCapRound: true,
                      dotData: const FlDotData(show: false),
                      belowBarData: BarAreaData(show: true, color: Colors.blue.withOpacity(0.1)),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTopProducts(DashboardLoaded state) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text("Top Products", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: state.topProducts.length,
                itemBuilder: (context, index) {
                  final item = state.topProducts[index];
                  return ListTile(
                    title: Text(item.name),
                    trailing: Text("${item.quantity}", style: const TextStyle(fontWeight: FontWeight.bold)),
                  );
                },
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

  const _StatCard({required this.title, required this.value, required this.icon, required this.color});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        child: ListTile(
          leading: CircleAvatar(backgroundColor: color.withOpacity(0.1), child: Icon(icon, color: color)),
          title: Text(title, style: const TextStyle(color: Colors.grey, fontSize: 14)),
          subtitle: Text(value, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }
}
