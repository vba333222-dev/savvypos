import 'package:flutter/material.dart';

// Constrained Box that forces usage of tokens
class SavvyBox extends StatelessWidget {
  final Widget? child;
  final Color?
      color; // Must come from context.savvy.colors... ideally, but we accept Color for flexibility if needed, or we can restrict it.
  final double?
      width; // Still allow explicit dims if absolutely needed, but prefer layout.
  final double? height;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final BorderRadiusGeometry? borderRadius;
  final BoxBorder? border;
  final List<BoxShadow>? shadow;
  final Gradient? gradient;

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
    this.gradient,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: padding,
      margin: margin,
      decoration: BoxDecoration(
        color: color,
        borderRadius: borderRadius,
        border: border,
        boxShadow: shadow,
        gradient: gradient,
      ),
      child: child,
    );
  }
}

// Helpers for specific token usage if we want to be more strict:
// class SavvySurface extends StatelessWidget { ... uses context.savvy.colors.bgSurface ... }
