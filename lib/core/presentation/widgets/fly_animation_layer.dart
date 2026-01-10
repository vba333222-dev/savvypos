import 'dart:async';
import 'package:flutter/material.dart';
import 'package:savvy_pos/core/presentation/animations/flight_animation_controller.dart';

class FlyAnimationLayer extends StatefulWidget {
  final Widget child;

  const FlyAnimationLayer({super.key, required this.child});

  static FlyAnimationLayerState? of(BuildContext context) {
    return context.findAncestorStateOfType<FlyAnimationLayerState>();
  }

  @override
  State<FlyAnimationLayer> createState() => FlyAnimationLayerState();
}

class FlyAnimationLayerState extends State<FlyAnimationLayer> with TickerProviderStateMixin<FlyAnimationLayer>, FlightAnimationController<FlyAnimationLayer> {
  GlobalKey? _targetKey;
  final StreamController<void> _hitController = StreamController<void>.broadcast();

  Stream<void> get onTargetHit => _hitController.stream;

  void registerTarget(GlobalKey key) {
    _targetKey = key;
  }

  void trigger({
    required GlobalKey sourceKey,
    required Widget child,
  }) {
    if (_targetKey == null) {
      debugPrint("FlyAnimationLayer: No target registered. Call registerTarget first.");
      return;
    }

    flyToTarget(
      sourceKey: sourceKey,
      child: child,
      targetKey: _targetKey,
      onTargetHit: () {
        _hitController.add(null);
      },
    );
  }

  @override
  void dispose() {
    _hitController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
