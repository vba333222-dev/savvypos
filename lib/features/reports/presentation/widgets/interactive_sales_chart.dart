import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:savvy_pos/core/config/theme/savvy_theme.dart';

class ChartDataPoint {
  final String label;
  final double value;
  final int index;
  ChartDataPoint(this.index, this.label, this.value);
}

class InteractiveSalesChart extends StatefulWidget {
  final List<ChartDataPoint> data;
  final double maxY;

  const InteractiveSalesChart({
    super.key,
    required this.data,
    required this.maxY,
  });

  @override
  State<InteractiveSalesChart> createState() => _InteractiveSalesChartState();
}

class _InteractiveSalesChartState extends State<InteractiveSalesChart> {
  int? _touchedIndex;

  @override
  Widget build(BuildContext context) {
    final theme = context.savvy;

    return BarChart(
      BarChartData(
        alignment: BarChartAlignment.spaceAround,
        maxY: widget.maxY * 1.2, // Headroom
        barTouchData: BarTouchData(
          touchCallback: (FlTouchEvent event, barTouchResponse) {
            if (!event.isInterestedForInteractions ||
                barTouchResponse == null ||
                barTouchResponse.spot == null) {
              setState(() => _touchedIndex = null);
              return;
            }
            
            final newIndex = barTouchResponse.spot!.touchedBarGroupIndex;
            if (newIndex != _touchedIndex) {
              HapticFeedback.selectionClick(); // Scrub tick
              setState(() => _touchedIndex = newIndex);
            }
          },
          touchTooltipData: BarTouchTooltipData(
            tooltipPadding: const EdgeInsets.all(8),
            tooltipMargin: 8,
            getTooltipColor: (_) => theme.colors.bgElevated,
            getTooltipItem: (group, groupIndex, rod, rodIndex) {
              final dp = widget.data[groupIndex];
              return BarTooltipItem(
                '${dp.label}\n',
                TextStyle(color: theme.colors.textSecondary, fontSize: 10),
                children: [
                  TextSpan(
                    text: '\$${rod.toY.toStringAsFixed(0)}',
                    style: TextStyle(color: theme.colors.brandPrimary, fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                ],
              );
            },
          ),
        ),
        gridData: FlGridData(show: false),
        titlesData: FlTitlesData(
          show: true,
          bottomTitles: AxisTitles(
             sideTitles: SideTitles(
               showTitles: true,
               getTitlesWidget: (val, meta) {
                 if (val.toInt() >= 0 && val.toInt() < widget.data.length) {
                   // Only show every 2nd label if many points
                   if (widget.data.length > 7 && val.toInt() % 2 != 0) return const SizedBox.shrink();
                   return Padding(
                     padding: const EdgeInsets.only(top: 8.0),
                     child: Text(
                       widget.data[val.toInt()].label.substring(0, 3), // Abbrev
                       style: TextStyle(color: theme.colors.textMuted, fontSize: 10),
                     ),
                   );
                 }
                 return const SizedBox.shrink();
               },
             ),
          ),
          leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
        ),
        borderData: FlBorderData(show: false),
        barGroups: widget.data.map((dp) {
          final isTouched = _touchedIndex == dp.index;
          return BarChartGroupData(
            x: dp.index,
            barRods: [
              BarChartRodData(
                toY: dp.value,
                gradient: LinearGradient(
                  colors: isTouched 
                     ? [theme.colors.brandAccent, theme.colors.brandAccent] // Highlight
                     : [theme.colors.brandPrimary, theme.colors.brandPrimary.withValues(alpha: 0.6)],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
                width: isTouched ? 22 : 16, // Zoom effect
                borderRadius: const BorderRadius.vertical(top: Radius.circular(6)),
                backDrawRodData: BackgroundBarChartRodData(
                  show: true,
                  toY: widget.maxY * 1.2,
                  color: theme.colors.bgElevated.withValues(alpha: 0.2),
                ),
              ),
            ],
          );
        }).toList(),
      ),
      duration: const Duration(milliseconds: 300), // Morph animation
      curve: Curves.easeOut,
    ).animate().fadeIn(duration: 400.ms).slideY(begin: 0.1, end: 0, curve: Curves.easeOut);
  }
}
