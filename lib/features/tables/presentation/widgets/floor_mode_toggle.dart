import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:savvy_pos/core/config/theme/savvy_theme.dart';

enum FloorMode { service, layout }

class FloorModeToggle extends StatelessWidget {
  final FloorMode mode;
  final VoidCallback onToggle;

  const FloorModeToggle({
    super.key,
    required this.mode,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.savvy;
    final isLayout = mode == FloorMode.layout;

    return FloatingActionButton.extended(
      onPressed: onToggle,
      backgroundColor:
          isLayout ? theme.colors.brandAccent : theme.colors.brandPrimary,
      foregroundColor: Colors.white,
      label: AnimatedSwitcher(
        duration: 300.ms,
        child: Text(
          isLayout ? 'Done' : 'Edit Layout',
          key: ValueKey(isLayout),
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      icon: AnimatedSwitcher(
        duration: 300.ms,
        transitionBuilder: (child, anim) =>
            RotationTransition(turns: anim, child: child),
        child: Icon(
          isLayout ? Icons.check : Icons.grid_view_rounded,
          key: ValueKey(isLayout),
        ),
      ),
    );
  }
}
