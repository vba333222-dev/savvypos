import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:savvy_pos/core/config/theme_config.dart';
import 'package:savvy_pos/core/presentation/widgets/savvy_box.dart';
import 'package:savvy_pos/core/presentation/widgets/savvy_text.dart';
import 'package:savvy_pos/features/inventory/domain/entities/product.dart';

class ProductCard extends StatefulWidget {
  final Product product;
  final VoidCallback? onTap;

  const ProductCard({
    super.key,
    required this.product,
    this.onTap,
  });

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    final theme = context.savvy;
    
    return SavvyBox(
      padding: EdgeInsets.zero,
      color: theme.colors.bgElevated,
      onTap: () async {
        if (widget.onTap == null) return;
        
        setState(() => _isPressed = true);
        await Future.delayed(const Duration(milliseconds: 100)); // Short press duration
        if (mounted) setState(() => _isPressed = false);
        
        widget.onTap!();
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // 1. IMAGE AREA
          Expanded(
            flex: 3,
            child: Container(
              color: widget.product.colorHex != null 
                ? Color(int.parse(widget.product.colorHex!.replaceAll('#', '0xFF'))) 
                : theme.colors.bgPrimary,
              child: widget.product.imageUrl != null
                  ? CachedNetworkImage(
                      imageUrl: widget.product.imageUrl!,
                      fit: BoxFit.cover,
                      placeholder: (context, url) => Center(
                        child: CircularProgressIndicator(strokeWidth: 2, color: theme.colors.brandPrimary),
                      ),
                      errorWidget: (context, url, error) => Icon(
                        Icons.broken_image, 
                        color: theme.colors.textMuted
                      ),
                    )
                  : Center(
                      child: SavvyText(
                        widget.product.name.characters.first.toUpperCase(),
                        style: SavvyTextStyle.h2,
                        color: theme.colors.textSecondary,
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
                  SavvyText(
                    widget.product.name,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: SavvyTextStyle.bodyMedium,
                    color: theme.colors.textPrimary, // Explicit content color
                  ),
                  SavvyText(
                    // Simple currency formatting (can use NumberFormat later)
                    "\$${widget.product.price.toStringAsFixed(2)}", 
                    style: SavvyTextStyle.h3,
                    color: theme.colors.brandPrimary,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    )
    .animate(target: _isPressed ? 1 : 0)
    .scaleXY(
      end: 0.95, 
      duration: 100.ms, 
      curve: Curves.easeInOut,
    )
    .animate() // Entry Animation
    .fadeIn(duration: theme.motion.durationFast)
    .scale(
       duration: theme.motion.durationFast, 
       curve: theme.motion.curveDefault,
    );
  }
}
