import 'package:flutter/material.dart';
import 'package:savvy_pos/core/config/theme/savvy_theme.dart';

enum SalesPeriod { today, week, month }

class PeriodSelector extends StatelessWidget {
  final SalesPeriod selected;
  final ValueChanged<SalesPeriod> onChanged;

  const PeriodSelector({
    super.key,
    required this.selected,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.savvy;
    const periods = SalesPeriod.values;

    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: theme.colors.bgElevated,
        borderRadius: BorderRadius.circular(theme.shapes.radiusLg),
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final width = constraints.maxWidth / periods.length;
          
          return Stack(
            children: [
              // Sliding Pill
              AnimatedPositioned(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeOutBack,
                left: width * periods.indexOf(selected),
                top: 0,
                bottom: 0,
                width: width,
                child: Container(
                  decoration: BoxDecoration(
                    color: theme.colors.brandPrimary,
                    borderRadius: BorderRadius.circular(theme.shapes.radiusMd), // Slightly smaller than container
                    boxShadow: theme.elevations.xs,
                  ),
                ),
              ),
              
              // Text Labels
              Row(
                children: periods.map((period) {
                  final isSelected = selected == period;
                  return Expanded(
                    child: GestureDetector(
                      onTap: () => onChanged(period),
                      behavior: HitTestBehavior.opaque,
                      child: Center(
                        child: AnimatedDefaultTextStyle(
                          duration: const Duration(milliseconds: 200),
                          style: TextStyle(
                            color: isSelected ? Colors.white : theme.colors.textSecondary,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                          child: Text(_label(period)),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ],
          );
        },
      ),
    );
  }

  String _label(SalesPeriod p) {
    switch (p) {
      case SalesPeriod.today: return 'Today';
      case SalesPeriod.week: return 'This Week';
      case SalesPeriod.month: return 'This Month';
    }
  }
}
