import 'package:flutter/material.dart';
import 'package:savvy_pos/core/presentation/animations/flight_animation_controller.dart';
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

class FlyLayerController extends State<FlyAnimationLayer> with TickerProviderStateMixin, FlightAnimationController {
  GlobalKey? _defaultTargetKey;

  void registerTarget(GlobalKey key) {
    _defaultTargetKey = key;
  }

  void trigger({
    required GlobalKey sourceKey,
    required Widget child, 
    GlobalKey? overrideTarget,
  }) {
    final target = overrideTarget ?? _defaultTargetKey;
    
    // Delegate to Mixin
    flyToTarget(
      startKey: sourceKey,
      endKey: target,
      child: child,
      onComplete: () {
        HapticHelper.onLand();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
