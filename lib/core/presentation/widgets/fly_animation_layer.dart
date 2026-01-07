import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:savvy_pos/core/config/theme/savvy_theme.dart';
import 'package:savvy_pos/core/utils/haptic_helper.dart';

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
  final _impactController = StreamController<void>.broadcast();

  Stream<void> get onTargetHit => _impactController.stream;

  void registerTarget(GlobalKey key) {
    _targetKey = key;
  }

  void trigger({
    required GlobalKey sourceKey,
    required Widget child, 
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
    // Speed: pixels per ms. e.g. 1.2px/ms. 
    // Min 400ms, Max 700ms for slightly "heavier" feel with physics
    final durationMs = (distance / 1.2).clamp(400.0, 700.0).round();

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
    
    final curvedT = CurvedAnimation(parent: controller, curve: Curves.easeInOutCubicEmphasized);
    
    // Random rotation direction and slight offset
    final random = Random();
    final double rotationTurns = 1.0 + (random.nextDouble() * 0.5); // 1.0 to 1.5 turns
    final double rotationDirection = random.nextBool() ? 1.0 : -1.0; 

    entry = OverlayEntry(
      builder: (context) {
        return AnimatedBuilder(
          animation: curvedT,
          builder: (context, _) {
            final t = curvedT.value;
            
            // Quadratic Bézier Curve
            final double arcHeight = 150.0; 
            final linearPos = Offset.lerp(start, end, t)!;
            final verticalOffset = arcHeight * 4 * t * (1 - t); 
            
            final currentPos = Offset(linearPos.dx, linearPos.dy - verticalOffset);
            
            // Scale: Start 1.0, End 0.5 (Zoom into cart)
            final currentSize = Size.lerp(startSize, startSize * 0.5, t)!;
            
            // Opacity: Fade out in last 20%
            final opacity = t > 0.8 ? (1.0 - ((t - 0.8) * 5)) : 1.0;

            return Positioned(
              left: currentPos.dx,
              top: currentPos.dy,
              width: currentSize.width,
              height: currentSize.height,
              child: Opacity(
                opacity: opacity.clamp(0.0, 1.0),
                child: Transform.rotate(
                  angle: t * pi * 2 * rotationTurns * rotationDirection, 
                  child: Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2 * (1-t)), // Shadow fades as it lands
                          blurRadius: 10 + (20 * t), // Shadow blurs more as it flies? Or less? Usually shadow is related to height.
                          // Let's make shadow simulate height: More blur at peak (t=0.5), less at start/end.
                          // peak t=0.5. 
                          // blur = 5 + (20 * 4 * t * (1-t))
                          spreadRadius: 1,
                          offset: Offset(0, 10 + (20 * 4 * t * (1-t))),
                        )
                      ],
                    ),
                    child: child,
                  ), 
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
      _impactController.add(null);
      HapticHelper.onLand(); // Haptic on land
    });
  }

  @override
  void dispose() {
    _impactController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
