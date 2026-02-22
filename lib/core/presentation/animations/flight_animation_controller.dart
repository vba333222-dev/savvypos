import 'dart:math';
import 'package:flutter/material.dart';
import 'package:savvy_pos/core/utils/haptic_helper.dart';

/// Mixin to manage flying widget animations using Overlays.
/// Designed to be used on a StatefulWidget that provides a TickerProvider.
mixin FlightAnimationController<T extends StatefulWidget>
    on State<T>, TickerProviderStateMixin<T> {
  final List<_ActiveFlight> _activeFlights = [];

  @override
  void dispose() {
    for (var flight in _activeFlights) {
      flight.entry.remove();
      flight.controller.dispose();
    }
    _activeFlights.clear();
    super.dispose();
  }

  /// Triggers a flight animation from a source key to a target key (or registered target).
  /// [sourceKey] - GlobalKey of the widget starting the flight.
  /// [child] - The widget to fly (usually a snapshot/image).
  /// [targetKey] - Optional explicit target. If null, must have a default registered.
  void flyToTarget({
    required GlobalKey sourceKey,
    required Widget child,
    GlobalKey? targetKey,
    VoidCallback? onTargetHit,
  }) {
    // 1. Calculate Start Position
    final RenderBox? sourceBox =
        sourceKey.currentContext?.findRenderObject() as RenderBox?;
    if (sourceBox == null) return;
    final startPos = sourceBox.localToGlobal(Offset.zero);
    final size = sourceBox.size;

    // 2. Calculate End Position
    // We assume the target is provided or we might need a registry.
    // For this mixin to be generic, we expect the targetKey passed.
    if (targetKey == null) {
      debugPrint('FlightAnimationController: No target key provided.');
      return;
    }

    final RenderBox? targetBox =
        targetKey.currentContext?.findRenderObject() as RenderBox?;
    if (targetBox == null) return;
    final endPos = targetBox.localToGlobal(Offset.zero);

    // 3. Create Animation Controller
    // Distance based duration: base 500ms + extra for distance
    final distance = (endPos - startPos).distance;
    final durationMs =
        500 + (distance * 0.5).toInt().clamp(0, 400); // 500ms to 900ms range

    final controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: durationMs),
    );

    // 4. Create Overlay Entry
    late OverlayEntry entry;

    // Control Point for Bezier (Arc) via random offset for variety
    // Higher negative Y means higher arc.
    final random = Random();
    final arcHeight = 100.0 + random.nextInt(50);
    final midPointX = (startPos.dx + endPos.dx) / 2;
    final midPointY = min(startPos.dy, endPos.dy) - arcHeight;
    final controlPoint = Offset(midPointX, midPointY);

    entry = OverlayEntry(
      builder: (context) {
        return AnimatedBuilder(
          animation: controller,
          builder: (context, _) {
            final t = Curves.easeOutCubic.transform(controller.value);

            // Quadratic Bezier Calculation
            final p0 = startPos;
            final p1 = controlPoint;
            final p2 = endPos;

            final x = pow(1 - t, 2) * p0.dx +
                2 * (1 - t) * t * p1.dx +
                pow(t, 2) * p2.dx;
            final y = pow(1 - t, 2) * p0.dy +
                2 * (1 - t) * t * p1.dy +
                pow(t, 2) * p2.dy;

            // Scale and Fade logic
            // Shrink from 1.0 to 0.4
            final scale = 1.0 - (0.6 * t);
            // Rotate slightly for physics feel
            final rotation = t * 2 * pi;

            return Positioned(
              left: x,
              top: y,
              width: size.width,
              height: size.height,
              child: Transform.rotate(
                angle: rotation * 0.1, // reduced rotation speed
                child: Transform.scale(
                  scale: scale,
                  child: Opacity(
                    opacity: (1 - t)
                        .clamp(0.2, 1.0), // Fade out slightly at very end
                    child: child,
                  ),
                ),
              ),
            );
          },
        );
      },
    );

    // 5. Start flight
    Overlay.of(context).insert(entry);
    final activeFlight = _ActiveFlight(entry, controller);
    _activeFlights.add(activeFlight);

    controller.forward().then((_) {
      // Cleanup
      entry.remove();
      controller.dispose();
      _activeFlights.remove(activeFlight);

      // Impact logic
      HapticHelper.onLand(); // Custom heavy impact helper
      onTargetHit?.call();
    });
  }
}

class _ActiveFlight {
  final OverlayEntry entry;
  final AnimationController controller;
  _ActiveFlight(this.entry, this.controller);
}
