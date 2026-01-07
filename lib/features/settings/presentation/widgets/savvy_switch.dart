import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:savvy_pos/core/config/theme/savvy_theme.dart';

class SavvySwitch extends StatefulWidget {
  final bool value;
  final ValueChanged<bool> onChanged;

  const SavvySwitch({super.key, required this.value, required this.onChanged});

  @override
  State<SavvySwitch> createState() => _SavvySwitchState();
}

class _SavvySwitchState extends State<SavvySwitch> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  late Animation<Alignment> _alignment;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));
    
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOutBack);
    
    _alignment = AlignmentTween(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
    ).animate(_controller);

    if (widget.value) {
      _controller.value = 1.0;
    }
  }

  @override
  void didUpdateWidget(covariant SavvySwitch oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.value != oldWidget.value) {
      if (widget.value) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onTap() {
    if (_controller.isAnimating) return;
    HapticFeedback.lightImpact();
    widget.onChanged(!widget.value);
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.savvy;
    
    return GestureDetector(
      onTap: _onTap,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          final color = Color.lerp(
              theme.colors.bgSurface, theme.colors.brandPrimary, _animation.value)!;
          
          return Container(
            width: 52,
            height: 32,
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: widget.value ? color : theme.colors.borderDefault,
                width: 2,
              ),
            ),
            alignment: _alignment.value,
            child: Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                color: theme.colors.textInverse,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(color: Colors.black26, blurRadius: 4, offset: Offset(0, 2))
                ],
              ),
              // Morphing shape effect during transition could be added here
              // For now, let's keep it a circle but maybe add an icon inside?
              child: Transform.scale(
                scale: 0.8 + (_controller.value < 0.5 ? _controller.value : (1 - _controller.value)) * 0.4, // Slight bounce
                child: Icon(
                  widget.value ? Icons.check : Icons.close,
                  size: 16,
                  color: widget.value ? theme.colors.brandPrimary : theme.colors.textMuted,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
