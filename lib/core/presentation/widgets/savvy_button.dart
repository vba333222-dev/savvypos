import 'package:flutter/material.dart';
import 'package:savvy_pos/core/config/theme/savvy_theme.dart';
import 'package:savvy_pos/core/presentation/widgets/savvy_text.dart';

enum SavvyButtonStyle {
  primary,
  secondary,
  outline,
  ghost,
  destructive,
}

class SavvyButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final SavvyButtonStyle style;
  final IconData? icon;
  final bool isLoading;
  final bool isFullWidth;
  final double? width;

  const SavvyButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.style = SavvyButtonStyle.primary,
    this.icon,
    this.isLoading = false,
    this.isFullWidth = false,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.savvy;

    Color? backgroundColor;
    Color? foregroundColor;
    BorderSide? borderSide;
    double elevation = 0;

    switch (style) {
      case SavvyButtonStyle.primary:
        backgroundColor = theme.colors.brandPrimary;
        foregroundColor = theme.colors.textInverse;
        elevation = 2;
        break;
      case SavvyButtonStyle.secondary:
        backgroundColor = theme.colors.bgSecondary;
        foregroundColor = theme.colors.textPrimary;
        break;
      case SavvyButtonStyle.outline:
        backgroundColor = Colors.transparent;
        foregroundColor = theme.colors.brandPrimary;
        borderSide = BorderSide(color: theme.colors.brandPrimary);
        break;
      case SavvyButtonStyle.ghost:
        backgroundColor = Colors.transparent;
        foregroundColor = theme.colors.textSecondary;
        break;
      case SavvyButtonStyle.destructive:
        backgroundColor = theme.colors.stateError;
        foregroundColor = Colors.white;
        break;
    }

    if (onPressed == null) {
      backgroundColor = theme.colors.bgDisabled;
      foregroundColor = theme.colors.textDisabled;
      elevation = 0;
      borderSide = null;
    }

    final buttonStyle = ElevatedButton.styleFrom(
      backgroundColor: backgroundColor,
      foregroundColor: foregroundColor,
      elevation: elevation,
      padding: EdgeInsets.symmetric(
        vertical: theme.shapes.spacingMd,
        horizontal: theme.shapes.spacingLg,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(theme.shapes.radiusMd),
        side: borderSide ?? BorderSide.none,
      ),
    );

    Widget content = Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (isLoading)
          SizedBox(
            width: 16,
            height: 16,
            child: CircularProgressIndicator(
              strokeWidth: 2,
              color: foregroundColor,
            ),
          )
        else if (icon != null) ...[
          Icon(icon, size: 18),
          SizedBox(width: theme.shapes.spacingSm),
        ],
        if (!isLoading)
          SavvyText(
            text,
            style: SavvyTextStyle.labelMedium,
            color: foregroundColor,
          ),
      ],
    );

    Widget button = ElevatedButton(
      onPressed: isLoading ? null : onPressed,
      style: buttonStyle,
      child: content,
    );

    if (isFullWidth) {
      return SizedBox(width: double.infinity, child: button);
    }
    
    if (width != null) {
      return SizedBox(width: width, child: button);
    }

    return button;
  }
}
