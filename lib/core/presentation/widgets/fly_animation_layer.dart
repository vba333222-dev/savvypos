import 'dart:math';
import 'package:flutter/material.dart';
import 'package:savvy_pos/core/config/theme/savvy_theme.dart';

class FlyAnimationLayer extends StatefulWidget {
  final Widget child;

  const FlyAnimationLayer({super.key, required this.child});

  static FlyLayerController? of(BuildContext context) {
    return context.findAncestorStateOfType<FlyLayerController>();
  }

  @override
  FlyLayerController createState() => FlyLayerController();
}

class FlyLayerController extends State<FlyAnimationLayer> with TickerProviderStateMixin {
  GlobalKey? _targetKey;

  void registerTarget(GlobalKey key) {
    _targetKey = key;
  }

  void trigger({
    required GlobalKey sourceKey,
    required Widget child, // Lightweight widget clone
    GlobalKey? overrideTarget,
  }) {
    final target = overrideTarget ?? _targetKey;
    if (target == null || target.currentContext == null || sourceKey.currentContext == null) {
      debugPrint("FlyAnimationLayer: Target or Source context is null.");
      return;
    }

    final sourceContext = sourceKey.currentContext!;
    final targetContext = target.currentContext!;

    final sourceBox = sourceContext.findRenderObject() as RenderBox;
    final targetBox = targetContext.findRenderObject() as RenderBox;

    final sourcePos = sourceBox.localToGlobal(Offset.zero);
    final targetPos = targetBox.localToGlobal(Offset.zero);
    final sourceSize = sourceBox.size;
    
    // Calculate distance for dynamic duration
    final distance = (targetPos - sourcePos).distance;
    // Speed: pixels per ms. e.g. 1.5px/ms. 
    // Min 350ms, Max 600ms.
    final durationMs = (distance / 1.5).clamp(350.0, 600.0).round();

    _spawnFlight(
      sourcePos,
      targetPos,
      sourceSize,
      child,
      Duration(milliseconds: durationMs),
    );
  }

  void _spawnFlight(
    Offset start,
    Offset end,
    Size startSize,
    Widget child,
    Duration duration,
  ) {
    late OverlayEntry entry;
    late AnimationController controller;

    controller = AnimationController(vsync: this, duration: duration);
    
    // Using a fluid curve as requested
    // Note: To get a strictly parabolic path (Bézier), we calculate positions manually based on 't' (controller value).
    // The easing curve applies to 't' itself (time progression).
    final curvedT = CurvedAnimation(parent: controller, curve: Curves.easeInOutCubicEmphasized);

    entry = OverlayEntry(
      builder: (context) {
        return AnimatedBuilder(
          animation: curvedT,
          builder: (context, _) {
            final t = curvedT.value;
            
            // Quadratic Bézier Curve
            // P0 = start
            // P2 = end
            // P1 = Control Point.
            // Let's make P1 be the midpoint X, but higher up Y to create specific arc height.
            // If dragging down, arc wraps around? Usually flight adds negative Y (goes up).
            
            final double arcHeight = 150.0; // Max height of arc above straight line
            // Simple approach: Linear interpolation for X/Y, plus a Y-offset based on Sine or Parabola of t.
            // Parabola: 4 * h * t * (1-t)
            
            final linearPos = Offset.lerp(start, end, t)!;
            final verticalOffset = arcHeight * 4 * t * (1 - t); // Peaks at t=0.5
            
            final currentPos = Offset(linearPos.dx, linearPos.dy - verticalOffset);
            
            // Shrink effect: Start full size, end small (e.g. 20px)
            final currentSize = Size.lerp(startSize, const Size(20, 20), t)!;
            
            // Opacity: Fade out slightly at the very end
            final opacity = t > 0.9 ? (1.0 - ((t - 0.9) * 10)) : 1.0;

            return Positioned(
              left: currentPos.dx,
              top: currentPos.dy,
              width: currentSize.width,
              height: currentSize.height,
              child: Opacity(
                opacity: opacity.clamp(0.0, 1.0),
                child: Transform.rotate(
                  angle: t * 2.0, // Rotate slightly during flight (approx 115 degrees)
                  child: child, 
                ),
              ),
            );
          },
        );
      },
    );

    Overlay.of(context).insert(entry);
    
    controller.forward().then((_) {
      entry.remove();
      controller.dispose();
    });
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
