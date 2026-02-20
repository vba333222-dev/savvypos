import 'package:flutter/material.dart';
import 'package:savvy_pos/core/config/theme/savvy_theme.dart';
import 'package:savvy_pos/core/presentation/widgets/savvy_box.dart';
import 'package:savvy_pos/core/presentation/widgets/savvy_text.dart';

class SupplierCard extends StatelessWidget {
  final String name;
  final double cost;
  final int leadTimeDays;
  final bool isSelected;
  final bool isBestPrice;
  final bool isFastest;
  final VoidCallback onTap;

  const SupplierCard({
    super.key,
    required this.name,
    required this.cost,
    required this.leadTimeDays,
    required this.isSelected,
    required this.onTap,
    this.isBestPrice = false,
    this.isFastest = false,
  });

  @override
  Widget build(BuildContext context) {
    // Visual Hierarchy: Selected cards are slightly larger/elevated
    final scale = isSelected ? 1.05 : 1.0;
    final borderColor = isSelected 
        ? context.savvy.colors.primary 
        : (isBestPrice ? context.savvy.colors.success.withValues(alpha: 0.5) : context.savvy.colors.border);

    return GestureDetector(
      onTap: onTap,
      child: Transform.scale(
        scale: scale,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            SavvyBox(
              width: 160,
              height: 140,
              color: isSelected ? context.savvy.colors.bgSurface : context.savvy.colors.bgCanvas,
              border: Border.all(color: borderColor, width: isSelected ? 2 : 1),
              borderRadius: BorderRadius.circular(12),
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SavvyText.h5(name, maxLines: 2),
                      const SizedBox(height: 4),
                      SavvyText.label('Lead Time: $leadTimeDays days', color: context.savvy.colors.textSecondary),
                    ],
                  ),
                  
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SavvyText.h4('\$${cost.toStringAsFixed(2)}'),
                      if (isSelected) 
                        Icon(Icons.check_circle, color: context.savvy.colors.primary, size: 20),
                    ],
                  ),
                ],
              ),
            ),
            
            // Badges
            if (isBestPrice)
              Positioned(
                top: -8,
                right: 8,
                child: _Badge(text: 'BEST PRICE', color: context.savvy.colors.success),
              ),
            
            if (isFastest && !isBestPrice) // Prefer Best Price badge if both apply or stack them
              Positioned(
                top: -8,
                right: 8,
                child: _Badge(text: 'FASTEST', color: context.savvy.colors.accent),
              ),
          ],
        ),
      ),
    );
  }
}

class _Badge extends StatelessWidget {
  final String text;
  final Color color;

  const _Badge({required this.text, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
      ),
      child: SavvyText.label(text, color: Colors.white),
    );
  }
}
