import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:savvy_pos/core/config/theme/savvy_theme.dart';
import 'package:savvy_pos/core/presentation/widgets/savvy_text.dart';

/// A widget that handles the "Odometer" style rolling animation for numbers.
class SavvyTicker extends StatelessWidget {
  final double value;
  final TextStyle? style;
  final NumberFormat? format;
  final Duration duration;
  final Curve curve;
  final String prefix;

  const SavvyTicker({
    super.key,
    required this.value,
    this.style,
    this.format,
    this.duration = const Duration(milliseconds: 500),
    this.curve = Curves.easeOutQuad,
    this.prefix = '',
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.savvy;
    final formatStyle = style ?? SavvyTextStyle.bodyMedium.copyWith(color: theme.colors.textPrimary);
    final formatter = format ?? NumberFormat.currency(symbol: '\$', decimalDigits: 2);
    final formattedValue = formatter.format(value);
    
    // Split into characters to animate digits individually
    List<Widget> children = [];
    
    if (prefix.isNotEmpty) {
      children.add(Text(prefix, style: formatStyle));
    }

    for (int i = 0; i < formattedValue.length; i++) {
        final char = formattedValue[i];
        if (RegExp(r'[0-9]').hasMatch(char)) {
           // Provide a Key based on position to ensure state preservation? 
           // Actually, standard Row flow is enough if length is stable. 
           // If length changes ($9.00 -> $10.00), position 0 becomes '1'.
           children.add(_RollingDigit(
             digit: int.parse(char), 
             style: formatStyle,
             duration: duration,
             curve: curve,
           ));
        } else {
           children.add(Text(char, style: formatStyle));
        }
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.baseline,
      textBaseline: TextBaseline.alphabetic,
      children: children,
    );
  }
}

class _RollingDigit extends StatelessWidget {
  final int digit;
  final TextStyle style;
  final Duration duration;
  final Curve curve;

  const _RollingDigit({
    required this.digit,
    required this.style,
    required this.duration,
    required this.curve,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: duration,
      switchInCurve: curve,
      switchOutCurve: curve,
      transitionBuilder: (child, animation) {
        // "Odometer" effect: New number comes from Bottom (Offset 0,1) -> (0,0)
        // Old number goes to Top (Offset 0,0) -> (0,-1)
        
        // Incoming
        final inOffset = Tween<Offset>(begin: const Offset(0.0, 1.0), end: Offset.zero).animate(animation);
        // Outgoing: The animation runs 1.0 -> 0.0 for the exiting child? 
        // No, standard AnimatedSwitcher runs the same animation object.
        // For the exiting child, it runs in reverse (if we use the same builder). 
        // Reverse of (0,1->0,0) is (0,0->0,1). This would make it go back down.
        // We want it to go UP.
        
        // To achieve "Continuous Flow Up", exit must go UP.
        
        final outOffset = Tween<Offset>(begin: const Offset(0.0, -1.0), end: Offset.zero).animate(animation);
        
        if (child.key == ValueKey(digit)) {
          // Entering Child
          return SlideTransition(
             position: inOffset, 
             child: FadeTransition(opacity: animation, child: child)
          );
        } else {
          // Exiting Child
          // We apply the 'outOffset' but checking the animation direction?
          // Actually, just apply the transform.
          // Since animation for exit runs 1->0:
          // We want (0,0) at 1.0 and (0,-1) at 0.0.
          // Tween(begin: (0,-1), end: (0,0)).
          return SlideTransition(
            position: outOffset,
            child: FadeTransition(opacity: animation, child: child)
          );
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
        digit.toString(),
        key: ValueKey(digit),
        style: style,
      ),
    );
  }
}
