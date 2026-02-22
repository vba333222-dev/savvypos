import 'package:flutter/material.dart';
import 'package:savvy_pos/core/config/theme/savvy_theme.dart';

class SavvyBox extends StatelessWidget {
  final Widget? child;
  final Color? color;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final BorderRadiusGeometry? borderRadius;
  final BoxBorder? border;
  final List<BoxShadow>? shadow;
  final VoidCallback? onTap;

  const SavvyBox({
    super.key,
    this.child,
    this.color,
    this.width,
    this.height,
    this.padding,
    this.margin,
    this.borderRadius,
    this.border,
    this.shadow,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.savvy;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        margin: margin,
        padding: padding ?? EdgeInsets.all(theme.shapes.spacingMd),
        decoration: BoxDecoration(
          color: color ?? theme.colors.bgElevated,
          borderRadius:
              borderRadius ?? BorderRadius.circular(theme.shapes.radiusMd),
          border: border,
          boxShadow: shadow ?? theme.elevations.sm,
        ),
        child: child,
      ),
    );
  }
}
