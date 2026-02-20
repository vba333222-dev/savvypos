import 'dart:math';
import 'package:flutter/material.dart';
import 'package:savvy_pos/core/config/theme/savvy_theme.dart';
import 'package:savvy_pos/features/reports/presentation/widgets/date_scrubber_widget.dart';
import 'package:savvy_pos/features/reports/presentation/widgets/insight_card.dart';
import 'package:savvy_pos/features/reports/presentation/widgets/interactive_sales_chart.dart';

class ReportsHubPage extends StatefulWidget {
  const ReportsHubPage({super.key});

  @override
  State<ReportsHubPage> createState() => _ReportsHubPageState();
}

class _ReportsHubPageState extends State<ReportsHubPage> {
  DateTime _selectedDate = DateTime.now();
  List<ChartDataPoint> _chartData = [];
  double _grossSales = 0;
  double _txnCheck = 0;
  double _maxY = 0;

  @override
  void initState() {
    super.initState();
    _updateData(_selectedDate);
  }

  void _updateData(DateTime date) {
    setState(() {
      _selectedDate = date;
      // Mock Data Generation based on date seed
      final seed = date.day * date.month;
      final rnd = Random(seed);
      
      _chartData = List.generate(24, (i) {
        // Peaks at lunch (12-14) and dinner (19-21)
        double base = 100.0 + rnd.nextInt(200);
        if (i >= 11 && i <= 14) base *= 2.5; 
        if (i >= 18 && i <= 21) base *= 3.0;
        if (i < 8) base *= 0.1; // Early morning
        return ChartDataPoint(i, '$i:00', base);
      });

      _maxY = _chartData.map((e) => e.value).reduce(max);
      _grossSales = _chartData.fold(0, (sum, item) => sum + item.value);
      _txnCheck = _grossSales / (40 + rnd.nextInt(20)); // Avg check
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.savvy;
    final isGoodDay = _grossSales > 5000;

    return Scaffold(
      backgroundColor: theme.colors.bgPrimary,
      appBar: AppBar(
        title: Row(
          children: [
            Icon(Icons.hub, color: theme.colors.brandPrimary),
            const SizedBox(width: 8),
            Text('NEURAL HUB', style: TextStyle(letterSpacing: 2, fontSize: 16)),
          ],
        ),
        centerTitle: true,
        backgroundColor: theme.colors.bgPrimary,
        elevation: 0,
        foregroundColor: theme.colors.textPrimary,
      ),
      body: Column(
        children: [
          // 1. Time-Travel Scrubber
          Container(
            color: theme.colors.bgSurface,
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: DateScrubberWidget(
              selectedDate: _selectedDate,
              onDateSelected: _updateData,
            ),
          ),
          
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                // 2. Smart Advice Chip
                Center(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(colors: isGoodDay 
                        ? [Colors.orange.shade900, Colors.deepOrange]
                        : [Colors.blueGrey.shade800, Colors.blueGrey.shade600]
                      ),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                         BoxShadow(color: (isGoodDay ? Colors.orange : Colors.blueGrey).withValues(alpha: 0.4), blurRadius: 10, offset: Offset(0, 4))
                      ]
                    ),
                    child: Text(
                      isGoodDay ? "🔥 ON FIRE: +12% vs Yesterday" : "❄️ QUIET DAY: -5% vs Avg",
                      style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                
                const SizedBox(height: 24),
                
                // 3. Sonar Chart
                Container(
                  padding: const EdgeInsets.all(16),
                  height: 300,
                  decoration: BoxDecoration(
                    color: theme.colors.bgElevated,
                    borderRadius: BorderRadius.circular(theme.shapes.radiusLg),
                    border: Border.all(color: theme.colors.borderDefault),
                  ),
                  child: Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       Text("HOURLY VELOCITY", style: TextStyle(fontSize: 10, color: theme.colors.textSecondary, letterSpacing: 1.5)),
                       const SizedBox(height: 16),
                       Expanded(
                         child: InteractiveSalesChart(data: _chartData, maxY: _maxY),
                       ),
                     ],
                  ),
                ),
                
                const SizedBox(height: 24),
                
                // 4. Insight Deck
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      SizedBox(
                        width: 160,
                        height: 140,
                        child: InsightCard(
                          label: 'Gross Sales',
                          value: _grossSales,
                          prefix: '\$',
                          icon: Icons.attach_money,
                        ),
                      ),
                      const SizedBox(width: 16),
                      SizedBox(
                        width: 160,
                        height: 140,
                        child: InsightCard(
                          label: 'Avg Check',
                          value: _txnCheck,
                          prefix: '\$',
                          icon: Icons.receipt_long,
                          color: Colors.blueAccent,
                        ),
                      ),
                      const SizedBox(width: 16),
                       SizedBox(
                        width: 160,
                        height: 140,
                        child: InsightCard(
                          label: 'Tx Count',
                          value: (_grossSales / _txnCheck).floorToDouble(),
                          icon: Icons.tag,
                          color: Colors.purpleAccent,
                        ),
                      ),
                    ],
                  ),
                ),
                
                const SizedBox(height: 32),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
