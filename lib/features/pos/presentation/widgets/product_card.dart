import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:savvy_pos/core/config/theme/savvy_theme.dart';
import 'package:savvy_pos/core/presentation/widgets/savvy_box.dart';
import 'package:savvy_pos/core/presentation/widgets/savvy_text.dart';
import 'package:savvy_pos/features/inventory/domain/entities/product.dart';

import 'package:savvy_pos/features/pos/presentation/notifications/add_to_cart_notification.dart';

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
  final GlobalKey _imageKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final theme = context.savvy;
    
    return GestureDetector(
      onTapDown: (_) => setState(() => _isPressed = true),
      onTapUp: (_) => setState(() => _isPressed = false),
      onTapCancel: () => setState(() => _isPressed = false),
      onTap: () {
        // Dispatch Notification to Parent (PosPage)
        AddToCartNotification(
          product: widget.product,
          modifiers: [], // Empty for now, logic handled in POS Page
          sourceKey: _imageKey,
        ).dispatch(context);
        
        // Optional: Keep existing callback if needed for other things, but primary logic is now notification
        widget.onTap?.call(); 
      },
      child: AnimatedScale(
        scale: _isPressed ? 0.92 : 1.0,
        duration: theme.motion.durationFast,
        curve: theme.motion.curveBounce,
        child: SavvyBox(
          padding: EdgeInsets.zero,
          color: theme.colors.bgElevated,
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // 1. IMAGE AREA
                  Expanded(
                    flex: 3,
                    child: Hero(
                      tag: 'product_${widget.product.uuid}',
                      child: Container(
                        key: _imageKey, // Key for Flight Animation Source
                        decoration: BoxDecoration(
                          color: widget.product.colorHex != null 
                            ? Color(int.parse(widget.product.colorHex!.replaceAll('#', '0xFF'))) 
                            : theme.colors.bgPrimary,
                          borderRadius: BorderRadius.vertical(top: Radius.circular(theme.shapes.radiusMd)),
                        ),
                        child: widget.product.imageUrl != null
                            ? ClipRRect(
                                borderRadius: BorderRadius.vertical(top: Radius.circular(theme.shapes.radiusMd)),
                                child: CachedNetworkImage(
                                  imageUrl: widget.product.imageUrl!,
                                  fit: BoxFit.cover,
                                  placeholder: (context, url) => Center(
                                    child: CircularProgressIndicator(strokeWidth: 2, color: theme.colors.brandPrimary),
                                  ),
                                  errorWidget: (context, url, error) => Icon(
                                    Icons.broken_image, 
                                    color: theme.colors.textMuted
                                  ),
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
                            color: theme.colors.textPrimary,
                          ),
                          SavvyText(
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
              
              // 3. OUT OF STOCK OVERLAY
              if (widget.product.trackStock && widget.product.stockQuantity == 0)
                Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(
                      color: theme.colors.bgPrimary.withOpacity(0.7),
                      borderRadius: BorderRadius.circular(theme.shapes.radiusMd),
                    ),
                    child: Center(
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: theme.shapes.spacingSm, vertical: 4),
                        decoration: BoxDecoration(
                          color: theme.colors.stateError,
                          borderRadius: BorderRadius.circular(theme.shapes.radiusSm),
                        ),
                        child: SavvyText(
                          'Out of Stock',
                          style: SavvyTextStyle.labelSmall,
                          color: theme.colors.textInverse,
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
