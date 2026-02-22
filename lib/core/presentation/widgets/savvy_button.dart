import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:savvy_pos/core/config/theme/savvy_theme.dart';
import 'package:savvy_pos/core/presentation/widgets/savvy_text.dart';

enum SavvyButtonStyle {
  primary,
  secondary,
  outline,
  ghost,
  destructive,
}

// ─────────────────────────────────────────────────────────────────────────────
// SavvyButton — Premium POS-Grade button with micro-interactions.
//
// Micro-interaction spec:
//   • onTapDown  → scale to 0.96 in 50ms  + HapticFeedback.lightImpact()
//   • onTapUp    → spring back to 1.0 in 120ms (Curves.easeOutBack)
//   • onTapCancel → restore scale immediately
//
// This fires haptic on DOWN (thumb still pressing), not on UP — so the
// physical "click" sensation matches the screen visual response exactly.
// ─────────────────────────────────────────────────────────────────────────────

class SavvyButton extends StatefulWidget {
  final String text;
  final VoidCallback? onPressed;
  final SavvyButtonStyle style;
  final IconData? icon;
  final bool isLoading;
  final bool isFullWidth;
  final double? width;
  final Color? backgroundColor;
  final Color? foregroundColor;

  const SavvyButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.style = SavvyButtonStyle.primary,
    this.icon,
    this.isLoading = false,
    this.isFullWidth = false,
    this.width,
    this.backgroundColor,
    this.foregroundColor,
  });

  @override
  State<SavvyButton> createState() => _SavvyButtonState();
}

class _SavvyButtonState extends State<SavvyButton> {
  bool _isPressed = false;
  bool _isThrottled = false;

  void _handleTapDown(TapDownDetails _) {
    if (widget.onPressed == null || widget.isLoading || _isThrottled) return;
    // Haptic fires on finger-down — matches the physical press sensation
    HapticFeedback.lightImpact();
    setState(() => _isPressed = true);
  }

  void _handleTapUp(TapUpDetails _) {
    setState(() => _isPressed = false);
    if (!widget.isLoading && !_isThrottled && widget.onPressed != null) {
      setState(() => _isThrottled = true);
      widget.onPressed!();
      
      Timer(const Duration(milliseconds: 1500), () {
        if (mounted) setState(() => _isThrottled = false);
      });
    }
  }

  void _handleTapCancel() {
    setState(() => _isPressed = false);
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.savvy;

    Color bgColor;
    Color fgColor;
    BorderSide? borderSide;
    double elevation = 0;

    switch (widget.style) {
      case SavvyButtonStyle.primary:
        bgColor = theme.colors.brandPrimary;
        fgColor = theme.colors.textInverse;
        elevation = 2;
        break;
      case SavvyButtonStyle.secondary:
        bgColor = theme.colors.bgSecondary;
        fgColor = theme.colors.textPrimary;
        break;
      case SavvyButtonStyle.outline:
        bgColor = Colors.transparent;
        fgColor = theme.colors.brandPrimary;
        borderSide = BorderSide(color: theme.colors.brandPrimary);
        break;
      case SavvyButtonStyle.ghost:
        bgColor = Colors.transparent;
        fgColor = theme.colors.textSecondary;
        break;
      case SavvyButtonStyle.destructive:
        bgColor = theme.colors.stateError;
        fgColor = Colors.white;
        break;
    }

    // Parameter overrides
    if (widget.backgroundColor != null) bgColor = widget.backgroundColor!;
    if (widget.foregroundColor != null) fgColor = widget.foregroundColor!;

    // Disabled state
    final isEnabled = widget.onPressed != null && !widget.isLoading && !_isThrottled;
    if (!isEnabled) {
      bgColor = theme.colors.bgDisabled;
      fgColor = theme.colors.textDisabled;
      elevation = 0;
      borderSide = null;
    }

    final buttonStyle = ElevatedButton.styleFrom(
      backgroundColor: bgColor,
      foregroundColor: fgColor,
      elevation: elevation,
      padding: EdgeInsets.symmetric(
        vertical: theme.shapes.spacingMd,
        horizontal: theme.shapes.spacingLg,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(theme.shapes.radiusMd),
        side: borderSide ?? BorderSide.none,
      ),
      splashFactory: NoSplash.splashFactory,
    );

    Widget content = Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (widget.isLoading || _isThrottled)
          SizedBox(
            width: 16,
            height: 16,
            child: CircularProgressIndicator(strokeWidth: 2, color: fgColor),
          )
        else if (widget.icon != null) ...[
          Icon(widget.icon, size: 18),
          SizedBox(width: theme.shapes.spacingSm),
        ],
        if (!widget.isLoading && !_isThrottled)
          SavvyText(
            widget.text,
            style: SavvyTextStyle.labelMedium,
            color: fgColor,
          ),
      ],
    );

    // ── Scale micro-interaction wrapper ────────────────────────────────────
    Widget button = GestureDetector(
      onTapDown: _handleTapDown,
      onTapUp: _handleTapUp,
      onTapCancel: _handleTapCancel,
      child: AnimatedScale(
        scale: _isPressed ? 0.97 : 1.0,
        // Fast press-down, spring-back release
        duration: Duration(milliseconds: _isPressed ? 50 : 120),
        curve: _isPressed ? Curves.easeOut : Curves.easeOutBack,
        child: ElevatedButton(
          onPressed:
              isEnabled ? () {} : null, // Action delegated to GestureDetector
          style: buttonStyle,
          child: content,
        ),
      ),
    );

    if (widget.isFullWidth)
      return SizedBox(width: double.infinity, child: button);
    if (widget.width != null)
      return SizedBox(width: widget.width, child: button);
    return button;
  }
}
