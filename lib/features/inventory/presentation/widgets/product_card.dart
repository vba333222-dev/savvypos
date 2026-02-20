import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Added for HapticFeedback
import 'package:flutter_animate/flutter_animate.dart';
import 'package:savvy_pos/core/config/theme/savvy_theme.dart';
import 'package:savvy_pos/core/presentation/widgets/savvy_box.dart';
import 'package:savvy_pos/core/presentation/widgets/savvy_text.dart';
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
                    ? CachedNetworkImage(
                        imageUrl: widget.product.imageUrl!, fit: BoxFit.cover)
                    : Container(
                        color: theme.colors.brandPrimary,
                        alignment: Alignment.center,
                        child: SavvyText(
                            widget.product.name.characters.first.toUpperCase(),
                            style: SavvyTextStyle.h1,
                            color: theme.colors.textInverse),
                      ),
              ),
            ),
          ),
        ),
      ),
      childWhenDragging: Opacity(
        opacity: 0.3,
        child: SavvyBox(
          color: theme.colors.bgSecondary,
          child: Center(
              child: Icon(Icons.drag_indicator, color: theme.colors.textMuted)),
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
              borderRadius:
                  BorderRadius.circular(theme.shapes.radiusMd), // Tokenized
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
                      child: SavvyText(
                          widget.product.name.characters.first.toUpperCase(),
                          color: theme.colors.textInverse),
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
        // KINETIC: Squishy Card Interaction
        // Scales down slightly on press, springs back on release.
        child: AnimatedScale(
          scale: _isPressed ? 0.97 : 1.0,
          // Press: 50ms snap (feels instant, no lag)
          // Release: 160ms elastic spring (premium bounce-back)
          duration: _isPressed
              ? const Duration(milliseconds: 50)
              : const Duration(milliseconds: 160),
          curve: _isPressed ? Curves.easeIn : Curves.elasticOut,
          child: SavvyBox(
            padding: EdgeInsets.zero,
            color: theme.colors.bgElevated,
            borderRadius: BorderRadius.circular(theme.shapes.radiusMd),
            shadow: _isPressed
                ? theme.elevations.sm
                : theme.elevations.md, // Shadow dips on press
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
                                ? Color(int.parse(widget.product.colorHex!
                                    .replaceAll('#', '0xFF')))
                                : theme.colors.bgPrimary,
                            borderRadius: BorderRadius.vertical(
                                top: Radius.circular(theme.shapes.radiusMd)),
                          ),
                          child: widget.product.imageUrl != null
                              ? ClipRRect(
                                  borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(
                                          theme.shapes.radiusMd)),
                                  child: CachedNetworkImage(
                                    imageUrl: widget.product.imageUrl!,
                                    fit: BoxFit.cover,
                                    // ── Zero-Lag RAM: cap decoded image size to 200×200px.
                                    // Flutter's image cache stores the DECODED pixels,
                                    // so without this a 4K image costs ~60MB per card.
                                    memCacheWidth: 200,
                                    memCacheHeight: 200,
                                    placeholder: (context, url) => Container(
                                      color: theme.colors.bgSecondary,
                                    )
                                        .animate(onPlay: (c) => c.repeat())
                                        .shimmer(
                                            duration: 1200.ms,
                                            color: theme.colors.bgPrimary),
                                    errorWidget: (context, url, error) => Icon(
                                        Icons.broken_image,
                                        color: theme.colors.textMuted),
                                  ),
                                )
                              : Center(
                                  child: SavvyText(
                                    widget.product.name.characters.first
                                        .toUpperCase(),
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

                // 3. OUT OF STOCK OVERLAY - REMOVED (Pending Inventory Ledger Integration)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
