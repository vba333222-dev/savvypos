import 'package:flutter/material.dart';
import 'package:savvy_pos/core/config/theme/savvy_theme.dart';

class StockLevelIndicator extends StatelessWidget {
  final int stock;
  final int lowStockThreshold;

  const StockLevelIndicator({super.key, required this.stock, this.lowStockThreshold = 10});

  @override
  Widget build(BuildContext context) {
    final theme = context.savvy;
    Color color;
    double widthFactor;

    if (stock <= 0) {
      color = theme.colors.stateError;
      widthFactor = 1.0; // Full red bar
    } else if (stock < lowStockThreshold) {
      color = theme.colors.stateWarning;
      widthFactor = 0.5;
    } else {
      color = theme.colors.stateSuccess;
      widthFactor = (stock / 100).clamp(0.2, 1.0); // Simple visual scaling
    }

    return Container(
      height: 24,
      width: 80,
      decoration: BoxDecoration(
        color: theme.colors.bgInverse.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Stack(
        children: [
          FractionallySizedBox(
            widthFactor: widthFactor,
            child: Container(
              decoration: BoxDecoration(
                color: color.withValues(alpha: 0.3),
                borderRadius: BorderRadius.circular(4),
                border: Border.all(color: color.withValues(alpha: 0.5)),
              ),
            ),
          ),
          Center(
            child: Text(
              stock <= 0 ? 'OUT' : '$stock', 
              style: TextStyle(
                fontWeight: FontWeight.bold, 
                color: stock <= 0 ? color : theme.colors.textPrimary,
                fontSize: 12
              )
            ),
          ),
        ],
      ),
    );
  }
}
