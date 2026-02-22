import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:savvy_pos/core/config/theme/savvy_theme.dart';

/// A performant shimmer effect using `flutter_animate`.
class SavvyShimmer extends StatelessWidget {
  final double width;
  final double height;
  final double borderRadius;
  final BoxShape shape;

  const SavvyShimmer({
    super.key,
    required this.width,
    required this.height,
    this.borderRadius = 8,
    this.shape = BoxShape.rectangle,
  });

  const SavvyShimmer.circle({
    super.key,
    required double size,
  })  : width = size,
        height = size,
        borderRadius = size / 2,
        shape = BoxShape.circle;

  @override
  Widget build(BuildContext context) {
    final theme = context.savvy;
    // Base color slightly lighter than background surface for visibility
    final baseColor = theme.colors.bgElevated;
    final highlightColor = theme.colors.bgInverse.withValues(alpha: 0.05);

    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: baseColor,
        shape: shape,
        borderRadius: shape == BoxShape.rectangle
            ? BorderRadius.circular(borderRadius)
            : null,
      ),
    ).animate(onPlay: (controller) => controller.repeat()).shimmer(
          duration: 1500.ms,
          color: highlightColor,
          angle: 0.8, // Diagonal shine
        );
  }
}

/// Helper for Product Card Shimmer
class ProductCardShimmer extends StatelessWidget {
  const ProductCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.savvy.colors.bgSurface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: context.savvy.colors.borderDefault),
      ),
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SavvyShimmer(
              width: double.infinity, height: 100, borderRadius: 12),
          const Spacer(),
          const SavvyShimmer(width: 80, height: 16),
          const SizedBox(height: 8),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SavvyShimmer(width: 40, height: 20),
              SavvyShimmer.circle(size: 32),
            ],
          )
        ],
      ),
    );
  }
}
