import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:savvy_pos/core/config/theme/savvy_theme.dart';

class SavvyTicker extends StatelessWidget {
  final double value;
  final TextStyle? style; // Uses default from context if null
  final NumberFormat? format;
  final Duration duration;
  final Curve curve;
  final String prefix;

  const SavvyTicker({
    super.key,
    required this.value,
    this.style,
    this.format,
    this.duration = const Duration(milliseconds: 800),
    this.curve = Curves.easeOutExpo,
    this.prefix = '',
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.savvy;
    final effectiveStyle = style ?? SavvyTextStyle.bodyMedium.copyWith(color: theme.colors.textPrimary);
    final formatter = format ?? NumberFormat.currency(symbol: '\$', decimalDigits: 2);

    return TweenAnimationBuilder<double>(
      tween: Tween(end: value),
      duration: duration,
      curve: curve,
      builder: (context, val, child) {
        return Text(
          '$prefix${formatter.format(val)}',
          style: effectiveStyle,
        );
      },
    );
  }
}
