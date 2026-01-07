import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:savvy_pos/core/config/theme/savvy_theme.dart';
import 'package:savvy_pos/core/presentation/widgets/savvy_box.dart';
import 'package:savvy_pos/core/presentation/widgets/savvy_text.dart';
import 'package:savvy_pos/core/presentation/widgets/savvy_slide_counter.dart';
import 'package:savvy_pos/features/inventory/domain/entities/product.dart';

import 'package:savvy_pos/core/utils/haptic_helper.dart';
import 'package:savvy_pos/core/presentation/widgets/fly_animation_layer.dart';
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
    
    return LongPressDraggable<Product>(
      data: widget.product,
      onDragStarted: () {
        HapticFeedback.selectionClick();
      },
      feedback: Transform.rotate(
        angle: 0.08, // approx 5 degrees
        child: Material(
          elevation: 12,
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(theme.shapes.radiusMd),
          child: SizedBox(
            width: 140, // Fixed width for feedback or use constraints
            height: 140,
            child: Opacity(
              opacity: 0.9,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(theme.shapes.radiusMd),
                child: widget.product.imageUrl != null
                   ? CachedNetworkImage(imageUrl: widget.product.imageUrl!, fit: BoxFit.cover)
                   : Container(
                       color: theme.colors.brandPrimary,
                       alignment: Alignment.center,
                       child: SavvyText(widget.product.name.characters.first.toUpperCase(), style: SavvyTextStyle.h1, color: theme.colors.textInverse),
                     ),
              ),
            ),
          ),
        ),
      ),
      childWhenDragging: Opacity(
        opacity: 0.5,
        child: SavvyBox(
           color: theme.colors.bgSecondary,
           child: Center(child: Icon(Icons.drag_indicator, color: theme.colors.textMuted)),
        ),
      ),
      child: GestureDetector(
        onTapDown: (_) {
          setState(() => _isPressed = true);
          HapticFeedback.lightImpact();
        },
        onTapUp: (_) => setState(() => _isPressed = false),
        onTapCancel: () => setState(() => _isPressed = false),
        onTap: () {
          HapticHelper.onTap(); 

          // Trigger Flight
          FlyAnimationLayer.of(context)?.trigger(
            sourceKey: _imageKey,
            child: Material(
              elevation: 8,
              borderRadius: BorderRadius.circular(8),
              clipBehavior: Clip.antiAlias,
              child: widget.product.imageUrl != null 
                ? CachedNetworkImage(
                    imageUrl: widget.product.imageUrl!, 
                    fit: BoxFit.cover,
                    memCacheWidth: 100, 
                  )
                : Container(
                    color: theme.colors.brandPrimary,
                    alignment: Alignment.center,
                    child: SavvyText(widget.product.name.characters.first.toUpperCase(), color: theme.colors.textInverse),
                  ),
            ),
          );

          // Notify Logic
          AddToCartNotification(
            product: widget.product,
            modifiers: [], 
            sourceKey: _imageKey,
          ).dispatch(context);
          
          widget.onTap?.call(); 
        },
        child: AnimatedScale(
          scale: _isPressed ? 0.95 : 1.0,
          duration: _isPressed ? 100.ms : 500.ms,
          curve: _isPressed ? Curves.easeOut : Curves.elasticOut,
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
                          key: _imageKey,
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
                                    placeholder: (context, url) => Container(
                                      color: theme.colors.bgSecondary,
                                    ).animate(onPlay: (c) => c.repeat()).shimmer(duration: 1200.ms, color: theme.colors.bgPrimary),
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
      ),
    );
  }
}
