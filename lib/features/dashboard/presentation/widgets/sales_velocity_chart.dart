import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:savvy_pos/core/config/theme/savvy_theme.dart';
import 'package:savvy_pos/core/presentation/widgets/savvy_text.dart';

class SalesVelocityChart extends StatefulWidget {
  final List<double> hourlyData; // e.g., 24 data points for hours
  const SalesVelocityChart({super.key, required this.hourlyData});

  @override
  State<SalesVelocityChart> createState() => _SalesVelocityChartState();
}

class _SalesVelocityChartState extends State<SalesVelocityChart> {
  // Mock data generation if empty
  List<double> get _data => widget.hourlyData.isEmpty
      ? List.generate(12, (index) => (index * 5.0) + (index % 3 * 10))
      : widget.hourlyData;

  int? _hoverIndex;

  @override
  Widget build(BuildContext context) {
    final theme = context.savvy;
    final primaryColor = theme.colors.brandPrimary;
    final secondaryColor = theme.colors.brandSecondary;

    // Gradient definitions
    final LineChartBarData lineChartBarData = LineChartBarData(
      spots: _data
          .asMap()
          .entries
          .map((e) => FlSpot(e.key.toDouble(), e.value))
          .toList(),
      isCurved: true,
      curveSmoothness: 0.35,
      gradient: LinearGradient(
        colors: [primaryColor, secondaryColor],
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
      ),
      barWidth: 4,
      isStrokeCapRound: true,
      dotData: FlDotData(show: false),
      belowBarData: BarAreaData(
        show: true,
        gradient: LinearGradient(
          colors: [
            primaryColor.withValues(alpha: 0.3),
            primaryColor.withValues(alpha: 0.0),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SavvyText('Sales Velocity',
                    style: SavvyTextStyle.labelMedium,
                    color: theme.colors.textSecondary),
                SavvyText(
                    _hoverIndex != null
                        ? '\$${_data[_hoverIndex!].toStringAsFixed(2)}'
                        : '\$${_data.last.toStringAsFixed(2)}',
                    style: SavvyTextStyle.h3,
                    color: theme.colors.textPrimary),
              ],
            ),
            if (_hoverIndex != null)
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: theme.colors.bgInverse,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  '${_hoverIndex!}:00',
                  style:
                      TextStyle(color: theme.colors.textInverse, fontSize: 12),
                ),
              ),
          ],
        ),
        SizedBox(height: 16),
        Expanded(
          child: LineChart(
            LineChartData(
              lineTouchData: LineTouchData(
                touchCallback:
                    (FlTouchEvent event, LineTouchResponse? touchResponse) {
                  setState(() {
                    if (event is FlPanEndEvent || event is FlTapUpEvent) {
                      _hoverIndex = null;
                    } else if (touchResponse != null &&
                        touchResponse.lineBarSpots != null) {
                      _hoverIndex = touchResponse.lineBarSpots!.first.spotIndex;
                    }
                  });
                },
                handleBuiltInTouches: true,
                getTouchLineStart: (data, index) => 0,
              ),
              gridData: FlGridData(show: false),
              titlesData: FlTitlesData(
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    getTitlesWidget: (value, meta) {
                      if (value % 4 == 0) {
                        // Labels every 4 hours
                        return Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text('${value.toInt()}:00',
                              style: TextStyle(
                                  color: theme.colors.textSecondary,
                                  fontSize: 10)),
                        );
                      }
                      return const SizedBox.shrink();
                    },
                  ),
                ),
                leftTitles:
                    AxisTitles(sideTitles: SideTitles(showTitles: false)),
                topTitles:
                    AxisTitles(sideTitles: SideTitles(showTitles: false)),
                rightTitles:
                    AxisTitles(sideTitles: SideTitles(showTitles: false)),
              ),
              borderData: FlBorderData(show: false),
              lineBarsData: [lineChartBarData],
              minX: 0,
              maxX: _data.length.toDouble() - 1,
              minY: 0,
            ),
            duration: const Duration(
                milliseconds: 300), // Subtle animation on updates
            curve: Curves.easeOut,
          ),
        ),
      ],
    );
  }
}
