import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:savvy_pos/core/config/theme_config.dart';
import 'package:savvy_pos/features/inventory/domain/entities/product.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final VoidCallback? onTap;

  const ProductCard({
    super.key,
    required this.product,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.savvy;
    
    return Container(
      decoration: BoxDecoration(
        color: theme.colors.bgElevated,
        borderRadius: BorderRadius.circular(theme.shapes.radiusMd),
        boxShadow: theme.elevations.sm,
        border: Border.all(color: theme.colors.borderDefault),
      ),
      clipBehavior: Clip.antiAlias,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // 1. IMAGE AREA
              Expanded(
                flex: 3,
                child: Container(
                  color: product.colorHex != null 
                    ? Color(int.parse(product.colorHex!.replaceAll('#', '0xFF'))) 
                    : theme.colors.bgPrimary,
                  child: product.imageUrl != null
                      ? CachedNetworkImage(
                          imageUrl: product.imageUrl!,
                          fit: BoxFit.cover,
                          placeholder: (context, url) => Center(
                            child: CircularProgressIndicator(strokeWidth: 2),
                          ),
                          errorWidget: (context, url, error) => Icon(
                            Icons.broken_image, 
                            color: theme.colors.textMuted
                          ),
                        )
                      : Center(
                          child: Text(
                            product.name.characters.first.toUpperCase(),
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: theme.colors.textSecondary,
                            ),
                          ),
                        ),
                ),
              ),
              
              // 2. INFO AREA
              Expanded(
                flex: 2,
                child: Padding(
                  padding: EdgeInsets.all(theme.shapes.spacingSm),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        product.name,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: theme.colors.textPrimary,
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        // Simple currency formatting (can use NumberFormat later)
                        "\$${product.price.toStringAsFixed(2)}", 
                        style: TextStyle(
                          color: theme.colors.brandPrimary,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ).animate()
      .fadeIn(duration: theme.motion.durationFast)
      .scale(
         duration: theme.motion.durationFast, 
         curve: theme.motion.curveDefault,
      );
  }
}
