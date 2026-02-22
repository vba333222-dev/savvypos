import 'package:flutter/material.dart';
import 'package:savvy_pos/core/config/theme/savvy_theme.dart';
import 'package:savvy_pos/core/presentation/widgets/savvy_text.dart';

class SavvySlideCounter extends StatefulWidget {
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
  State<SavvySlideCounter> createState() => _SavvySlideCounterState();
}

class _SavvySlideCounterState extends State<SavvySlideCounter> {
  int? _oldValue;

  @override
  void didUpdateWidget(covariant SavvySlideCounter oldWidget) {
    super.didUpdateWidget(oldWidget);
    _oldValue = oldWidget.value;
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.savvy;
    final effectiveStyle = widget.style ??
        SavvyTextStyle.bodyMedium.copyWith(color: theme.colors.textPrimary);

    // Determine direction: Increment = Slide Up (New comes from bottom), Decrement = Slide Down (New comes from top)
    final bool isIncrement = (widget.value > (_oldValue ?? widget.value));

    return AnimatedSwitcher(
      duration: widget.duration,
      transitionBuilder: (Widget child, Animation<double> animation) {
        final inTween = Tween<Offset>(
          begin: Offset(0.0, isIncrement ? 1.0 : -1.0),
          end: Offset.zero,
        );

        final outTween = Tween<Offset>(
          begin: Offset(0.0, isIncrement ? -1.0 : 1.0),
          end: Offset.zero,
        );

        if (child.key == ValueKey(widget.value)) {
          return SlideTransition(
              position: inTween.animate(animation), child: child);
        } else {
          return SlideTransition(
              position: outTween.animate(animation), child: child);
        }
      },
      layoutBuilder: (currentChild, previousChildren) {
        return Stack(
          alignment: Alignment.center,
          clipBehavior: Clip.none,
          children: <Widget>[
            ...previousChildren,
            if (currentChild != null) currentChild,
          ],
        );
      },
      child: Text(
        '${widget.value}',
        key: ValueKey(widget.value),
        style: effectiveStyle,
      ),
    );
  }
}
