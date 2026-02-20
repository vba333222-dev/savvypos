import 'package:flutter/material.dart';
import 'package:savvy_pos/core/config/theme/savvy_theme.dart';
import 'package:savvy_pos/core/presentation/widgets/savvy_ticker.dart';

class InsightCard extends StatelessWidget {
  final String label;
  final double value;
  final String prefix;
  final IconData icon;
  final Color? color;

  const InsightCard({
    super.key,
    required this.label,
    required this.value,
    this.prefix = '',
    required this.icon,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.savvy;
    final activeColor = color ?? theme.colors.brandPrimary;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: theme.colors.bgElevated,
        borderRadius: BorderRadius.circular(theme.shapes.radiusLg),
        border: Border.all(color: theme.colors.borderDefault),
        boxShadow: theme.elevations.sm,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: activeColor.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(theme.shapes.radiusMd),
                ),
                child: Icon(icon, size: 18, color: activeColor),
              ),
              const SizedBox(width: 8),
              Text(label, style: TextStyle(color: theme.colors.textSecondary, fontWeight: FontWeight.w600)),
            ],
          ),
          const Spacer(),
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              if (prefix.isNotEmpty)
                Text(prefix, style: TextStyle(color: theme.colors.textPrimary, fontSize: 20, fontWeight: FontWeight.bold)),
              SavvyTicker(
                value: value,
                style: TextStyle(
                  fontSize: 28, 
                  fontWeight: FontWeight.w900, 
                  color: theme.colors.textPrimary,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
