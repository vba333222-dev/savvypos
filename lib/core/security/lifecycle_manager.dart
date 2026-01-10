import 'package:flutter/material.dart';

class LifecycleManager extends StatefulWidget {
  final Widget child;
  final VoidCallback onLockRequest;

  const LifecycleManager({
    super.key,
    required this.child,
    required this.onLockRequest,
  });

  @override
  State<LifecycleManager> createState() => _LifecycleManagerState();
}

class _LifecycleManagerState extends State<LifecycleManager> with WidgetsBindingObserver {
  DateTime? _backgroundTime;
  static const Duration _lockTimeout = Duration(minutes: 5);

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    
    if (state == AppLifecycleState.paused) {
      // App went to background
      _backgroundTime = DateTime.now();
    } else if (state == AppLifecycleState.resumed) {
      // App came back to foreground
      if (_backgroundTime != null) {
        final duration = DateTime.now().difference(_backgroundTime!);
        if (duration > _lockTimeout) {
          // Trigger security lock
          widget.onLockRequest();
        }
      }
      _backgroundTime = null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
