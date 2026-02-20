import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:savvy_pos/core/config/theme/savvy_theme.dart';

enum SavvyMotionEffect {
  fade,
  scale,
  slideUp,
  slideRight,
  flip,
  shake, // For errors
}

class SavvyMotion<T> extends StatelessWidget {
  final Widget child;
  final SavvyMotionEffect effect;
  final Duration? duration;
  final Curve? curve;
  final T? valueKey; // Triggers animation when changed

  const SavvyMotion({
    super.key,
    required this.child,
    this.effect = SavvyMotionEffect.scale,
    this.duration,
    this.curve,
    this.valueKey,
  });

  @override
  Widget build(BuildContext context) {
    final motion = context.savvy.motion;
    final d = duration ?? motion.durationFast;
    final c = curve ?? motion.curveBounce;

    var animate = child.animate(
      key: valueKey != null ? ValueKey(valueKey) : null,
    );

    switch (effect) {
      case SavvyMotionEffect.fade:
        return animate.fade(duration: d, curve: c);
        
      case SavvyMotionEffect.scale:
         // Scale from 95% to 100% for subtle spring
        return animate.scale(
          begin: const Offset(0.95, 0.95), 
          end: const Offset(1, 1), 
          duration: d, 
          curve: c,
        ).fade(duration: d); // Combined fade
        
      case SavvyMotionEffect.slideUp:
        return animate.moveY(
          begin: 10, 
          end: 0, 
          duration: d, 
          curve: c,
        ).fade(duration: d);

      case SavvyMotionEffect.slideRight:
        return animate.moveX(
          begin: -10, 
          end: 0, 
          duration: d, 
          curve: c,
        ).fade(duration: d);
      
      case SavvyMotionEffect.shake:
        return animate.shake(
          duration: motion.durationMedium,
          hz: 4,
          curve: Curves.easeInOut,
        );

      case SavvyMotionEffect.flip:
        return animate.flip(
          duration: d,
          curve: c,
        );
    }
  }
}
