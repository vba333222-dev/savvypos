import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:savvy_pos/core/config/theme/savvy_theme.dart';

class SavvySliderButton extends StatefulWidget {
  final String label;
  final VoidCallback onConfirmed;
  final Color? color;
  final IconData icon;
  final double height;
  final bool enabled;

  const SavvySliderButton({
    super.key,
    required this.label,
    required this.onConfirmed,
    this.color,
    this.icon = Icons.arrow_forward,
    this.height = 56,
    this.enabled = true,
  });

  @override
  State<SavvySliderButton> createState() => _SavvySliderButtonState();
}

class _SavvySliderButtonState extends State<SavvySliderButton> {
  double _dragValue = 0.0;
  bool _confirmed = false;

  @override
  Widget build(BuildContext context) {
    final theme = context.savvy;
    final primaryColor = widget.color ?? theme.colors.brandPrimary;

    return LayoutBuilder(
      builder: (context, constraints) {
        final maxWidth = constraints.maxWidth;
        final sliderWidth = widget.height; // Square slider
        final travelDistance = maxWidth - sliderWidth;

        return Container(
          height: widget.height,
          decoration: BoxDecoration(
            color: widget.enabled
                ? theme.colors.bgElevated
                : theme.colors.bgSurface,
            borderRadius: BorderRadius.circular(theme.shapes.radiusPill),
            border: Border.all(color: theme.colors.borderDefault),
            boxShadow: theme.elevations.sm,
          ),
          child: Stack(
            children: [
              // Label (Background)
              Center(
                child: Opacity(
                  opacity: (1 - (_dragValue / travelDistance)).clamp(0.0, 1.0),
                  child: Text(
                    widget.label,
                    style: TextStyle(
                      color: widget.enabled
                          ? theme.colors.textSecondary
                          : theme.colors.textMuted,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.0,
                    ),
                  ),
                ),
              ),

              // Progress Fill
              Container(
                width: sliderWidth + _dragValue,
                height: widget.height,
                decoration: BoxDecoration(
                  color: primaryColor.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(theme.shapes.radiusPill),
                ),
              ),

              // Slider Knob
              Positioned(
                left: _dragValue,
                child: GestureDetector(
                  onHorizontalDragUpdate: (details) {
                    if (!widget.enabled || _confirmed) return;
                    setState(() {
                      _dragValue = (_dragValue + details.delta.dx)
                          .clamp(0.0, travelDistance);
                    });
                  },
                  onHorizontalDragEnd: (details) {
                    if (_confirmed) return;
                    if (_dragValue >= travelDistance * 0.9) {
                      // Confirmed
                      setState(() {
                        _dragValue = travelDistance;
                        _confirmed = true;
                      });
                      HapticFeedback.heavyImpact();
                      widget.onConfirmed();
                    } else {
                      // Reset
                      setState(() {
                        _dragValue = 0.0;
                      });
                    }
                  },
                  child: Container(
                    width: sliderWidth,
                    height: widget.height,
                    decoration: BoxDecoration(
                      color: widget.enabled
                          ? primaryColor
                          : theme.colors.textMuted,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 4,
                          offset: Offset(0, 2),
                        )
                      ],
                    ),
                    child: Icon(
                      _confirmed ? Icons.check : widget.icon,
                      color: theme.colors.textInverse,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
