import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import 'package:savvy_pos/core/config/theme_config.dart';

/// Interactive Sales Heatmap Chart showing hourly sales patterns
class SalesHeatmapChart extends StatefulWidget {
  final List<HourlySalesData> data;
  final String title;
  final VoidCallback? onTap;

  const SalesHeatmapChart({
    super.key,
    required this.data,
    this.title = 'Sales by Hour',
    this.onTap,
  });

  @override
  State<SalesHeatmapChart> createState() => _SalesHeatmapChartState();
}

class _SalesHeatmapChartState extends State<SalesHeatmapChart> {
  int? _selectedHour;

  double get _maxSales => widget.data.isEmpty
      ? 0
      : widget.data.map((e) => e.sales).reduce((a, b) => a > b ? a : b);

  @override
  Widget build(BuildContext context) {
    final colors = context.savvy.colors;
    final shapes = context.savvy.shapes;

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: colors.bgElevated,
        borderRadius: BorderRadius.circular(shapes.radiusLg),
        border: Border.all(color: colors.borderDefault.withValues(alpha: 0.2)),
        boxShadow: [
          BoxShadow(
            color: colors.bgPrimary.withValues(alpha: 0.5),
            blurRadius: 20,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(Icons.schedule, color: colors.brandPrimary, size: 20),
                  const SizedBox(width: 10),
                  Text(
                    widget.title,
                    style: TextStyle(
                      color: colors.textPrimary,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              if (_selectedHour != null) _buildSelectedHourInfo(colors),
            ],
          ),

          const SizedBox(height: 24),

          // Heatmap grid
          SizedBox(
            height: 80,
            child: Row(
              children: List.generate(24, (hour) {
                final hourData = widget.data.firstWhere(
                  (d) => d.hour == hour,
                  orElse: () =>
                      HourlySalesData(hour: hour, sales: 0, transactions: 0),
                );
                final intensity =
                    _maxSales > 0 ? hourData.sales / _maxSales : 0.0;

                return Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedHour = _selectedHour == hour ? null : hour;
                      });
                    },
                    child: AnimatedContainer(
                      duration: 200.ms,
                      margin: const EdgeInsets.symmetric(horizontal: 1),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [
                            _getHeatColor(intensity, colors),
                            _getHeatColor(intensity, colors)
                                .withValues(alpha: 0.6),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(4),
                        border: _selectedHour == hour
                            ? Border.all(color: colors.textPrimary, width: 2)
                            : null,
                      ),
                    ),
                  ),
                ).animate().scaleY(
                    begin: 0,
                    end: 1,
                    duration: 400.ms,
                    delay: (hour * 20).ms,
                    curve: Curves.easeOutQuad);
              }),
            ),
          ),

          const SizedBox(height: 8),

          // Hour labels
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('12AM',
                  style: TextStyle(color: colors.textSecondary, fontSize: 10)),
              Text('6AM',
                  style: TextStyle(color: colors.textSecondary, fontSize: 10)),
              Text('12PM',
                  style: TextStyle(color: colors.textSecondary, fontSize: 10)),
              Text('6PM',
                  style: TextStyle(color: colors.textSecondary, fontSize: 10)),
              Text('11PM',
                  style: TextStyle(color: colors.textSecondary, fontSize: 10)),
            ],
          ),

          const SizedBox(height: 16),

          // Legend
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildLegendItem(
                  'Low', colors.textSecondary.withValues(alpha: 0.3), colors),
              const SizedBox(width: 16),
              _buildLegendItem('Medium', colors.stateWarning, colors),
              const SizedBox(width: 16),
              _buildLegendItem('Peak', colors.stateError, colors),
            ],
          ),
        ],
      ),
    ).animate().fadeIn(duration: 400.ms).slideY(
        begin: 0.1, end: 0, duration: 400.ms, curve: Curves.easeOutQuad);
  }

  Widget _buildSelectedHourInfo(SavvyColors colors) {
    final hourData = widget.data.firstWhere(
      (d) => d.hour == _selectedHour,
      orElse: () =>
          HourlySalesData(hour: _selectedHour!, sales: 0, transactions: 0),
    );

    final hourStr = _selectedHour! == 0
        ? '12AM'
        : _selectedHour! < 12
            ? '${_selectedHour!}AM'
            : _selectedHour! == 12
                ? '12PM'
                : '${_selectedHour! - 12}PM';

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: colors.brandPrimary.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            hourStr,
            style: TextStyle(
              color: colors.brandPrimary,
              fontWeight: FontWeight.w600,
              fontSize: 12,
            ),
          ),
          const SizedBox(width: 8),
          Text(
            '\$${hourData.sales.toStringAsFixed(0)}',
            style: TextStyle(
              color: colors.textPrimary,
              fontWeight: FontWeight.w700,
              fontSize: 12,
            ),
          ),
          const SizedBox(width: 4),
          Text(
            '(${hourData.transactions})',
            style: TextStyle(
              color: colors.textSecondary,
              fontSize: 11,
            ),
          ),
        ],
      ),
    ).animate().fadeIn(duration: 200.ms).scale(begin: const Offset(0.9, 0.9));
  }

  Widget _buildLegendItem(String label, Color color, SavvyColors colors) {
    return Row(
      children: [
        Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(3),
          ),
        ),
        const SizedBox(width: 6),
        Text(
          label,
          style: TextStyle(
            color: colors.textSecondary,
            fontSize: 11,
          ),
        ),
      ],
    );
  }

  Color _getHeatColor(double intensity, SavvyColors colors) {
    if (intensity < 0.3)
      return colors.textSecondary.withValues(alpha: 0.2 + intensity);
    if (intensity < 0.6)
      return colors.stateWarning.withValues(alpha: 0.5 + intensity * 0.5);
    return colors.stateError.withValues(alpha: 0.6 + intensity * 0.4);
  }
}

/// Data class for hourly sales
class HourlySalesData {
  final int hour; // 0-23
  final double sales;
  final int transactions;

  const HourlySalesData({
    required this.hour,
    required this.sales,
    required this.transactions,
  });
}
