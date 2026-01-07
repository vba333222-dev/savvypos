import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';

/// Mixin to handle Parabolic Flight Animations using OverlayEntries.
/// Requires TickerProviderStateMixin to manage AnimationControllers.
mixin FlightAnimationController<T extends StatefulWidget> on TickerProviderStateMixin<T> {
  
  final _flightImpactController = StreamController<void>.broadcast();
  Stream<void> get onTargetHit => _flightImpactController.stream;

  /// Trigger a flight animation from startKey to endKey (or overrideTarget).
  /// [child] should be a lightweight widget (e.g. CachedNetworkImage with memCache).
  void flyToTarget({
    required GlobalKey startKey,
    required Widget child,
    GlobalKey? endKey,
    VoidCallback? onComplete,
  }) {
    // 1. Validation
    if (startKey.currentContext == null) {
      debugPrint("FlightAnimation: Source context is null.");
      return;
    }
    
    // If endKey is null, we can't fly.
    if (endKey == null || endKey.currentContext == null) {
      debugPrint("FlightAnimation: Target context is null.");
      return;
    }

    final sourceContext = startKey.currentContext!;
    final targetContext = endKey.currentContext!;

    // 2. Geometry Calculation
    final sourceBox = sourceContext.findRenderObject() as RenderBox;
    final targetBox = targetContext.findRenderObject() as RenderBox;

    final sourcePos = sourceBox.localToGlobal(Offset.zero);
    final targetPos = targetBox.localToGlobal(Offset.zero);
    final sourceSize = sourceBox.size;
    
    // 3. Dynamic Duration based on Distance
    final distance = (targetPos - sourcePos).distance;
    // Speed: 1.2px/ms -> clamped between 400ms and 750ms
    final durationMs = (distance / 1.2).clamp(400.0, 750.0).round();
    final duration = Duration(milliseconds: durationMs);

    // 4. Spawn Animation
    _spawnFlightOverlay(
      start: sourcePos,
      end: targetPos,
      startSize: sourceSize,
      child: child,
      duration: duration,
      onComplete: onComplete,
    );
  }

  void _spawnFlightOverlay({
    required Offset start,
    required Offset end,
    required Size startSize,
    required Widget child,
    required Duration duration,
    VoidCallback? onComplete,
  }) {
    late OverlayEntry entry;
    late AnimationController controller;

    // Create unique controller for this particle (Concurrent Support)
    controller = AnimationController(vsync: this, duration: duration);
    
    // Parabolic easing for time progression? 
    // Actually, linear time is fine, we curved the PATH. 
    // But easing the MOTION looks better (slow start, fast end or vice versa).
    final curvedAnimation = CurvedAnimation(
      parent: controller, 
      curve: Curves.easeInOutCubicEmphasized, // Fluid start/stop
    );

    // Randomize rotation for Physics "Chaos"
    final random = Random();
    final double rotationTurns = 0.8 + (random.nextDouble() * 0.7); // 0.8 to 1.5 turns
    final double rotationDir = random.nextBool() ? 1.0 : -1.0;

    entry = OverlayEntry(
      builder: (context) {
        return AnimatedBuilder(
          animation: curvedAnimation,
          builder: (context, _) {
            final t = curvedAnimation.value;

            // --- BEZIER CURVE LOGIC ---
            // Quadratic Bezier: P(t) = (1-t)^2 * P0 + 2(1-t)t * P1 + t^2 * P2
            // P0 = start
            // P2 = end
            // P1 = Control Point (Vertex of parabola)
            
            // We create a Control Point P1 that is:
            // - X: Midpoint betwen start and end
            // - Y: Higher than both (negative offset) to create arc.
            
            // Simple Arc approach: Linear Lerp + Vertical Offset function
            // Vertical Offset = 4 * height * t * (1-t)  (Standard Parabola peaking at t=0.5)
            
            final double arcHeight = 150.0; // Peak height in pixels
            
            final linearPos = Offset.lerp(start, end, t)!;
            final verticalOffset = arcHeight * 4 * t * (1 - t);
            
            // Apply vertical offset (SUBTRACT Y to go UP in screen coords)
            final currentPos = Offset(linearPos.dx, linearPos.dy - verticalOffset);

            // --- TRANSFORMATIONS ---
            // Scale: 1.0 -> 0.4 (Zoom into cart)
            final currentSize = Size.lerp(startSize, startSize * 0.4, t)!;
            
            // Opacity: Fade out near end (last 15%)
            final double opacity = t > 0.85 ? (1.0 - ((t - 0.85) / 0.15)) : 1.0;

            return Positioned(
              left: currentPos.dx,
              top: currentPos.dy,
              width: currentSize.width,
              height: currentSize.height,
              child: Opacity(
                opacity: opacity.clamp(0.0, 1.0),
                child: Transform.rotate(
                  angle: t * pi * 2 * rotationTurns * rotationDir,
                  child: Container(
                     // Optional: Add Shadow for depth
                     decoration: BoxDecoration(
                       boxShadow: [
                         BoxShadow(
                           color: Colors.black.withOpacity(0.2 * (1-t)),
                           blurRadius: 8 * (1-t) + 2, // Sharpens as it lands
                           offset: Offset(0, 10 * (1-t) + 2),
                         )
                       ],
                     ),
                     child: child, // The image
                  ),
                ),
              ),
            );
          },
        );
      },
    );

    // Insert into Overlay
    Overlay.of(context).insert(entry);

    // Run Animation
    controller.forward().then((_) {
      // Cleanup
      entry.remove();
      controller.dispose();
      
      // Notify
      _flightImpactController.add(null); // Broadcast impact
      onComplete?.call();
    });
  }
  
  @override
  void dispose() {
    _flightImpactController.close();
    super.dispose();
  }
}
