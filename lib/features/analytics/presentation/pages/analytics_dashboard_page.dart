import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:savvy_pos/features/analytics/domain/entities/analytics_entities.dart';
import 'package:savvy_pos/features/analytics/domain/repositories/i_analytics_repository.dart';
import 'package:savvy_pos/features/analytics/presentation/widgets/smart_insight_card.dart';

class AnalyticsDashboardPage extends StatefulWidget {
  const AnalyticsDashboardPage({super.key});

  @override
  State<AnalyticsDashboardPage> createState() => _AnalyticsDashboardPageState();
}

class _AnalyticsDashboardPageState extends State<AnalyticsDashboardPage>
    with SingleTickerProviderStateMixin {
  final _repo = GetIt.I<IAnalyticsRepository>();
  late TabController _tabController;

  DateTimeRange _dateRange = DateTimeRange(
    start: DateTime.now().subtract(const Duration(days: 7)),
    end: DateTime.now(),
  );

  SalesSummary? _salesSummary;
  LaborMetric? _laborMetric;
  List<MenuPerformance>? _pmix;
  List<HourlySales>? _hourlySales;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _loadData();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Future<void> _loadData() async {
    setState(() => _isLoading = true);
    try {
      final sales = await _repo.getSalesSummary(_dateRange);
      final labor = await _repo.getLaborMetrics(_dateRange);
      final pmix = await _repo.getProductMix(_dateRange);
      final hourly =
          await _repo.getHourlySales(DateTime.now()); // Demo: Today's hourly

      if (mounted) {
        setState(() {
          _salesSummary = sales;
          _laborMetric = labor;
          _pmix = pmix;
          _hourlySales = hourly;
          _isLoading = false;
        });
      }
    } catch (e) {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  Future<void> _selectDateRange() async {
    final picked = await showDateRangePicker(
      context: context,
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
      initialDateRange: _dateRange,
    );
    if (picked != null) {
      setState(() => _dateRange = picked);
      _loadData();
    }
  }

  String get _dateRangeLabel {
    final fmt = DateFormat('MMM d');
    return '${fmt.format(_dateRange.start)} - ${fmt.format(_dateRange.end)}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text('Business Insights'),
        backgroundColor: Colors.white,
        elevation: 1,
        titleTextStyle: const TextStyle(
            color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 20),
        iconTheme: const IconThemeData(color: Colors.black87),
        actions: [
          TextButton.icon(
            onPressed: _selectDateRange,
            icon: const Icon(Icons.calendar_today, size: 16),
            label: Text(_dateRangeLabel,
                style: const TextStyle(fontWeight: FontWeight.w600)),
            style: TextButton.styleFrom(foregroundColor: Colors.blue[700]),
          ),
          const SizedBox(width: 16),
        ],
        bottom: TabBar(
          controller: _tabController,
          labelColor: Colors.blue[700],
          unselectedLabelColor: Colors.grey[600],
          indicatorColor: Colors.blue[700],
          tabs: const [
            Tab(text: 'Overview'),
            Tab(text: 'Sales Trend'),
            Tab(text: 'Menu Analysis'),
          ],
        ),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : TabBarView(
              controller: _tabController,
              children: [
                _OverviewTab(
                    sales: _salesSummary!,
                    labor: _laborMetric!,
                    pmix: _pmix ?? []),
                _HourlySalesTab(hourly: _hourlySales ?? []),
                _MenuMixTab(pmix: _pmix ?? []),
              ],
            ),
    );
  }
}

class _OverviewTab extends StatelessWidget {
  final SalesSummary sales;
  final LaborMetric labor;
  final List<MenuPerformance> pmix;

  const _OverviewTab(
      {required this.sales, required this.labor, required this.pmix});

  @override
  Widget build(BuildContext context) {
    final currFmt = NumberFormat.currency(symbol: '\$', decimalDigits: 0);

    return ListView(
      padding: const EdgeInsets.all(24),
      children: [
        // High Level KPI Row
        LayoutBuilder(builder: (context, constraints) {
          final width = constraints.maxWidth;
          // Responsive grid logic
          return Wrap(
            spacing: 16,
            runSpacing: 16,
            children: [
              _DetailKPICard(
                  title: 'Net Sales',
                  value: currFmt.format(sales.netSales),
                  trend: '+12%',
                  isPositive: true,
                  width: (width / 2) - 10,
                  icon: Icons.attach_money,
                  color: Colors.green),
              _DetailKPICard(
                  title: 'Gross Profit',
                  value: currFmt.format(sales.grossProfit),
                  subtitle:
                      '${((sales.grossProfit / sales.netSales) * 100).toStringAsFixed(1)}% Margin',
                  width: (width / 2) - 10,
                  icon: Icons.trending_up,
                  color: Colors.blue),
            ],
          );
        }),
        const Gap(24),

        // AI Insight Section
        if (pmix.isNotEmpty) ...[
          const Text('Automated Insights',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87)),
          const Gap(12),
          SmartInsightCard(
              pmix:
                  pmix), // Keeping existing widget but ensure it looks premium
          const Gap(24),
        ],

        // Secondary Metrics Grid
        const Text('Operational Metrics',
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87)),
        const Gap(12),
        GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 2.0,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            _MiniMetric(
                label: 'Avg Ticket',
                value: currFmt.format(sales.avgTicketSize),
                icon: Icons.receipt),
            _MiniMetric(
                label: 'Total Orders',
                value: sales.transactionCount.toString(),
                icon: Icons.shopping_bag_outlined),
            _MiniMetric(
                label: 'Labor Cost',
                value: '${labor.laborPercentage.toStringAsFixed(1)}%',
                icon: Icons.group_work,
                isWarning: labor.laborPercentage > 30),
            _MiniMetric(
                label: 'SPLH',
                value: currFmt.format(labor.salesPerLaborHour),
                icon: Icons.speed),
          ],
        ),
      ],
    );
  }
}

class _DetailKPICard extends StatelessWidget {
  final String title;
  final String value;
  final String? trend;
  final String? subtitle;
  final bool isPositive;
  final double width;
  final IconData icon;
  final Color color;

  const _DetailKPICard({
    required this.title,
    required this.value,
    required this.width,
    required this.icon,
    required this.color,
    this.trend,
    this.subtitle,
    this.isPositive = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width.clamp(150, 600),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withValues(alpha: 0.04),
              blurRadius: 10,
              offset: const Offset(0, 4))
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title,
                  style: TextStyle(color: Colors.grey[600], fontSize: 14)),
              Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      color: color.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(8)),
                  child: Icon(icon, size: 20, color: color)),
            ],
          ),
          const Gap(12),
          Text(value,
              style: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87)),
          if (trend != null)
            Text(trend!,
                style: TextStyle(
                    color: isPositive ? Colors.green : Colors.red,
                    fontWeight: FontWeight.w600)),
          if (subtitle != null)
            Text(subtitle!,
                style: TextStyle(color: Colors.grey[500], fontSize: 12)),
        ],
      ),
    );
  }
}

class _MiniMetric extends StatelessWidget {
  final String label;
  final String value;
  final IconData icon;
  final bool isWarning;

  const _MiniMetric(
      {required this.label,
      required this.value,
      required this.icon,
      this.isWarning = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: isWarning
            ? Border.all(color: Colors.red.withValues(alpha: 0.5))
            : null,
        boxShadow: [
          BoxShadow(color: Colors.black.withValues(alpha: 0.02), blurRadius: 4)
        ],
      ),
      child: Row(
        children: [
          Icon(icon, color: isWarning ? Colors.red : Colors.grey[400]),
          const Gap(12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(value,
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: isWarning ? Colors.red : Colors.black87)),
              Text(label,
                  style: TextStyle(fontSize: 12, color: Colors.grey[500])),
            ],
          )
        ],
      ),
    );
  }
}

class _HourlySalesTab extends StatelessWidget {
  final List<HourlySales> hourly;
  const _HourlySalesTab({required this.hourly});

  @override
  Widget build(BuildContext context) {
    final maxSales = hourly.isNotEmpty
        ? hourly.map((h) => h.sales).reduce((a, b) => a > b ? a : b)
        : 100.0;

    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Hourly Sales Performance',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const Text('Sales volume by hour of day',
              style: TextStyle(color: Colors.grey)),
          const Gap(24),
          Expanded(
            child: BarChart(
              BarChartData(
                maxY: maxSales * 1.2,
                barTouchData: BarTouchData(
                  touchTooltipData: BarTouchTooltipData(
                    getTooltipColor: (_) => Colors.blueGrey,
                    getTooltipItem: (group, _, rod, __) => BarTooltipItem(
                      '\$${rod.toY.toStringAsFixed(0)}',
                      const TextStyle(
                          color: Colors.yellow, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                titlesData: FlTitlesData(
                  show: true,
                  topTitles:
                      AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  rightTitles:
                      AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (val, meta) {
                        if (val % 4 == 0)
                          return Text('${val.toInt()}:00',
                              style: const TextStyle(fontSize: 10));
                        return const SizedBox.shrink();
                      },
                    ),
                  ),
                ),
                gridData: FlGridData(show: false),
                borderData: FlBorderData(show: false),
                barGroups: hourly.map((h) {
                  return BarChartGroupData(x: h.hour, barRods: [
                    BarChartRodData(
                      toY: h.sales,
                      color: h.sales > (maxSales * 0.7)
                          ? Colors.blue.shade700
                          : Colors.blue.shade300,
                      width: 12,
                      borderRadius:
                          const BorderRadius.vertical(top: Radius.circular(4)),
                    )
                  ]);
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _MenuMixTab extends StatelessWidget {
  final List<MenuPerformance> pmix;
  const _MenuMixTab({required this.pmix});

  @override
  Widget build(BuildContext context) {
    // Top 5 Items Pie
    // List Logic

    return Row(
      children: [
        // Table
        Expanded(
          flex: 2,
          child: ListView.separated(
            padding: const EdgeInsets.all(24),
            itemCount: pmix.length,
            separatorBuilder: (_, __) => const Divider(height: 1),
            itemBuilder: (context, index) {
              final item = pmix[index];
              return ListTile(
                leading: CircleAvatar(
                  backgroundColor:
                      _getCategoryColor(item.category).withValues(alpha: 0.1),
                  child: Text('${index + 1}',
                      style: TextStyle(
                          color: _getCategoryColor(item.category),
                          fontWeight: FontWeight.bold)),
                ),
                title: Text(item.itemName,
                    style: const TextStyle(fontWeight: FontWeight.w600)),
                subtitle: Text(_getCategoryLabel(item.category),
                    style: TextStyle(
                        color: _getCategoryColor(item.category), fontSize: 12)),
                trailing: Text('\$${item.totalRevenue.toStringAsFixed(0)}',
                    style: const TextStyle(fontWeight: FontWeight.bold)),
              );
            },
          ),
        ),
        // Chart Sidebar
        Expanded(
          flex: 1,
          child: Container(
            color: Colors.white,
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                const Text('Category Mix',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                const Gap(24),
                SizedBox(
                  height: 200,
                  child: PieChart(
                    PieChartData(
                      sections: _generateSections(),
                      centerSpaceRadius: 40,
                      sectionsSpace: 2,
                    ),
                  ),
                ),
                const Gap(24),
                _LegendItem(
                    color: Colors.amber, label: 'Star (High Vol/High Mgn)'),
                _LegendItem(
                    color: Colors.purple, label: 'Puzzle (Low Vol/High Mgn)'),
                _LegendItem(
                    color: Colors.green, label: 'Plowhorse (High Vol/Low Mgn)'),
                _LegendItem(color: Colors.grey, label: 'Dog (Low Vol/Low Mgn)'),
              ],
            ),
          ),
        ),
      ],
    );
  }

  List<PieChartSectionData> _generateSections() {
    int stars = 0, plows = 0, puzzles = 0, dogs = 0;
    for (var i in pmix) {
      if (i.category == MenuItemCategory.star) stars++;
      if (i.category == MenuItemCategory.plowhorse) plows++;
      if (i.category == MenuItemCategory.puzzle) puzzles++;
      if (i.category == MenuItemCategory.dog) dogs++;
    }
    final total = pmix.length.toDouble();
    if (total == 0) return [];

    return [
      if (stars > 0)
        PieChartSectionData(
            color: Colors.amber,
            value: stars.toDouble(),
            title: '${((stars / total) * 100).toInt()}%',
            radius: 100,
            titleStyle: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold)),
      if (plows > 0)
        PieChartSectionData(
            color: Colors.green,
            value: plows.toDouble(),
            title: '${((plows / total) * 100).toInt()}%',
            radius: 100,
            titleStyle: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold)),
      if (puzzles > 0)
        PieChartSectionData(
            color: Colors.purple,
            value: puzzles.toDouble(),
            title: '${((puzzles / total) * 100).toInt()}%',
            radius: 100,
            titleStyle: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold)),
      if (dogs > 0)
        PieChartSectionData(
            color: Colors.grey,
            value: dogs.toDouble(),
            title: '${((dogs / total) * 100).toInt()}%',
            radius: 100,
            titleStyle: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold)),
    ];
  }

  Color _getCategoryColor(MenuItemCategory cat) {
    switch (cat) {
      case MenuItemCategory.star:
        return Colors.amber;
      case MenuItemCategory.plowhorse:
        return Colors.green;
      case MenuItemCategory.puzzle:
        return Colors.purple;
      case MenuItemCategory.dog:
        return Colors.grey;
    }
  }

  String _getCategoryLabel(MenuItemCategory cat) {
    switch (cat) {
      case MenuItemCategory.star:
        return 'Star';
      case MenuItemCategory.plowhorse:
        return 'Plowhorse';
      case MenuItemCategory.puzzle:
        return 'Puzzle';
      case MenuItemCategory.dog:
        return 'Dog';
    }
  }
}

class _LegendItem extends StatelessWidget {
  final Color color;
  final String label;
  const _LegendItem({required this.color, required this.label});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Container(
              width: 12,
              height: 12,
              decoration: BoxDecoration(color: color, shape: BoxShape.circle)),
          const Gap(8),
          Text(label, style: const TextStyle(fontSize: 12)),
        ],
      ),
    );
  }
}
