import 'package:flutter/material.dart';
import 'package:savvy_pos/core/config/theme/savvy_theme.dart';

class SavvySlideCounter extends StatelessWidget {
  final int value;
  final TextStyle? style;
  final Duration duration;

  const SavvySlideCounter({
    super.key,
    required this.value,
    this.style,
    this.duration = const Duration(milliseconds: 300),
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.savvy;
    final effectiveStyle = style ?? SavvyTextStyle.bodyMedium.copyWith(color: theme.colors.textPrimary);

    return AnimatedSwitcher(
      duration: duration,
      transitionBuilder: (Widget child, Animation<double> animation) {
        final inAnimation = Tween<Offset>(
          begin: const Offset(0.0, 1.0), // From bottom
          end: Offset.zero,
        ).animate(animation);
        
        final outAnimation = Tween<Offset>(
          begin: const Offset(0.0, -1.0), // To top
          end: Offset.zero,
        ).animate(animation);

        if (child.key == ValueKey(value)) {
           return SlideTransition(position: inAnimation, child: child);
        } else {
           return SlideTransition(position: outAnimation, child: child);
        }
      },
      layoutBuilder: (currentChild, previousChildren) {
        return Stack(
          alignment: Alignment.center,
          children: <Widget>[
            ...previousChildren,
            if (currentChild != null) currentChild,
          ],
        );
      },
      child: Text(
        '$value',
        key: ValueKey(value),
        style: effectiveStyle,
      ),
    );
  }
}
