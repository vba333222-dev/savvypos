import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:savvy_pos/core/config/theme/savvy_theme.dart';
import 'package:savvy_pos/core/presentation/widgets/savvy_text.dart';
import 'package:flutter_animate/flutter_animate.dart';

class FloorStatBadge extends StatelessWidget {
  final int freeCount;
  final int occupiedCount;
  final int reservationCount;
  final bool isCondensed;

  const FloorStatBadge({
    super.key,
    required this.freeCount,
    required this.occupiedCount,
    required this.reservationCount,
    this.isCondensed = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.savvy;

    return AnimatedContainer(
      duration: 300.ms,
      curve: Curves.easeOut,
      padding: EdgeInsets.symmetric(
          horizontal:
              isCondensed ? theme.shapes.spacingMd : theme.shapes.spacingLg,
          vertical: theme.shapes.spacingSm),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(theme.shapes.radiusPill),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            padding: EdgeInsets.symmetric(
                horizontal: isCondensed
                    ? theme.shapes.spacingMd
                    : theme.shapes.spacingLg,
                vertical: theme.shapes.spacingSm),
            decoration: BoxDecoration(
              color: theme.colors.bgElevated.withValues(alpha: 0.7),
              borderRadius: BorderRadius.circular(theme.shapes.radiusPill),
              border: Border.all(
                  color: theme.colors.borderDefault.withValues(alpha: 0.5)),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                _StatItem(
                    label: 'Free',
                    count: freeCount,
                    color: theme.colors.stateSuccess,
                    isCondensed: isCondensed),
                Container(
                    height: 16,
                    width: 1,
                    color: theme.colors.borderDefault,
                    margin: EdgeInsets.symmetric(
                        horizontal: theme.shapes.spacingMd)),
                _StatItem(
                    label: 'Occupied',
                    count: occupiedCount,
                    color: theme.colors.stateError,
                    isCondensed: isCondensed),
                Container(
                    height: 16,
                    width: 1,
                    color: theme.colors.borderDefault,
                    margin: EdgeInsets.symmetric(
                        horizontal: theme.shapes.spacingMd)),
                _StatItem(
                    label: 'Reserved',
                    count: reservationCount,
                    color: theme.colors.brandSecondary,
                    isCondensed: isCondensed),
              ],
            ),
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
  final bool isCondensed;

  const _StatItem(
      {required this.label,
      required this.count,
      required this.color,
      required this.isCondensed});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 8,
          height: 8,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
        const SizedBox(width: 8),
        AnimatedSize(
          duration: 200.ms,
          alignment: Alignment.centerLeft,
          child: SavvyText(isCondensed ? '$count' : '$count $label',
              style: SavvyTextStyle.labelMedium),
        ),
      ],
    );
  }
}
