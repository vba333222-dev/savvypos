import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:savvy_pos/core/config/theme/savvy_theme.dart';
import 'package:savvy_pos/core/presentation/widgets/savvy_text.dart';

class FloorStatBadge extends StatelessWidget {
  final int freeCount;
  final int occupiedCount;
  final int reservationCount;

  const FloorStatBadge({
    super.key,
    required this.freeCount,
    required this.occupiedCount,
    required this.reservationCount,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.savvy;

    return ClipRRect(
      borderRadius: BorderRadius.circular(theme.shapes.radiusPill),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: theme.shapes.spacingLg, vertical: theme.shapes.spacingSm),
          decoration: BoxDecoration(
            color: theme.colors.bgElevated.withOpacity(0.7),
            borderRadius: BorderRadius.circular(theme.shapes.radiusPill),
            border: Border.all(color: theme.colors.borderDefault.withOpacity(0.5)),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              _StatItem(label: 'Free', count: freeCount, color: theme.colors.stateSuccess),
              Container(height: 16, width: 1, color: theme.colors.borderDefault, margin: EdgeInsets.symmetric(horizontal: theme.shapes.spacingMd)),
              _StatItem(label: 'Occupied', count: occupiedCount, color: theme.colors.stateError),
              Container(height: 16, width: 1, color: theme.colors.borderDefault, margin: EdgeInsets.symmetric(horizontal: theme.shapes.spacingMd)),
              _StatItem(label: 'Reserved', count: reservationCount, color: theme.colors.brandSecondary), // Using secondary for reserved
            ],
          ),
        ),
      ),
    );
  }
}

class _StatItem extends StatelessWidget {
  final String label;
  final int count;
  final Color color;

  const _StatItem({required this.label, required this.count, required this.color});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 8, height: 8,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
        const SizedBox(width: 8),
        SavvyText('$count $label', style: SavvyTextStyle.labelMedium),
      ],
    );
  }
}
