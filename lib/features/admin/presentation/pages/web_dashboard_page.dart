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
            const Text("Last 7 Days Sales", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            Expanded(
              child: BarChart(
                BarChartData(
                  barGroups: state.last7DaysSales.asMap().entries.map((e) {
                      return BarChartGroupData(
                          x: e.key,
                          barRods: [BarChartRodData(toY: e.value.total, color: Colors.blue)]
                      );
                  }).toList(),
                  titlesData: FlTitlesData(
                      bottomTitles: AxisTitles(
                          sideTitles: SideTitles(
                              showTitles: true,
                              getTitlesWidget: (value, meta) {
                                  if (value.toInt() >= 0 && value.toInt() < state.last7DaysSales.length) {
                                      final date = state.last7DaysSales[value.toInt()].date;
                                      return Text("${date.day}/${date.month}");
                                  }
                                  return const Text("");
                              }
                          )
                      )
                  )
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
