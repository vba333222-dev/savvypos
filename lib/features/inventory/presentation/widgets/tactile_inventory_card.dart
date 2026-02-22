import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:savvy_pos/core/config/theme/savvy_theme.dart';
import 'package:savvy_pos/features/inventory/domain/entities/product.dart';

class TactileInventoryCard extends StatefulWidget {
  final Product product;
  final Function(int delta) onStockUpdate;
  final VoidCallback onEdit;
  final int currentStock;

  const TactileInventoryCard({
    super.key,
    required this.product,
    required this.onStockUpdate,
    required this.onEdit,
    required this.currentStock,
  });

  @override
  State<TactileInventoryCard> createState() => _TactileInventoryCardState();
}

class _TactileInventoryCardState extends State<TactileInventoryCard> {
  // We use Dismissible to reveal actions but prevent actual dismissal
  // by returning false in confirmDismiss.

  // Track previous stock to determine animation direction
  int _prevStock = 0;

  @override
  void initState() {
    super.initState();
    _prevStock = widget.currentStock;
  }

  @override
  void didUpdateWidget(covariant TactileInventoryCard oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.currentStock != oldWidget.currentStock) {
      _prevStock = oldWidget.currentStock;
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.savvy;
    final isLowStock = widget.currentStock <= 5;

    Widget content = Container(
      height: 88,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: theme.colors.bgElevated,
        borderRadius: BorderRadius.circular(theme.shapes.radiusMd),
        border: Border.all(
          color: isLowStock
              ? theme.colors.stateError.withValues(alpha: 0.59)
              : theme.colors.borderDefault,
          width: 1,
        ),
      ),
      child: Row(
        children: [
          // Hero Image
          Hero(
            tag: 'product_${widget.product.uuid}',
            child: Container(
              width: 64,
              height: 64,
              decoration: BoxDecoration(
                  color: theme.colors.bgPrimary,
                  borderRadius: BorderRadius.circular(8),
                  image: widget.product.imageUrl != null
                      ? DecorationImage(
                          image: FileImage(File(widget.product.imageUrl!)),
                          fit: BoxFit.cover)
                      : null),
              child: widget.product.imageUrl == null
                  ? Icon(Icons.inventory_2, color: theme.colors.textMuted)
                  : null,
            ),
          ),
          const SizedBox(width: 16),

          // Info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.product.name,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text('SKU: ${widget.product.sku ?? '-'}',
                    style: TextStyle(
                        color: theme.colors.textSecondary, fontSize: 12)),
              ],
            ),
          ),

          // Stock Badge with AnimatedSwitcher
          if (widget.product.trackStock)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: isLowStock
                    ? theme.colors.stateError.withValues(alpha: 0.1)
                    : theme.colors.stateSuccess.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                    color: isLowStock
                        ? theme.colors.stateError
                        : theme.colors.stateSuccess.withValues(alpha: 0.39)),
              ),
              child: AnimatedSwitcher(
                duration: 200.ms,
                transitionBuilder: (child, animation) {
                  // final offset = (widget.currentStock > _prevStock)
                  //    ? const Offset(0, -0.5) // New value comes from bottom
                  //    : const Offset(0, 0.5); // New value comes from top

                  // Actually standard SlideTransition:
                  // If Increasing: Old goes Up, New comes form Down
                  // If Decreasing: Old goes Down, New comes from Up

                  final inOffset = (widget.currentStock > _prevStock)
                      ? const Offset(0, 1)
                      : const Offset(0, -1);

                  // Simplified slide
                  return SlideTransition(
                    position: Tween<Offset>(begin: inOffset, end: Offset.zero)
                        .animate(animation),
                    child: FadeTransition(opacity: animation, child: child),
                  );
                },
                child: Text(
                  '${widget.currentStock}',
                  key: ValueKey(widget.currentStock),
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: isLowStock
                          ? theme.colors.stateError
                          : theme.colors.stateSuccess,
                      fontSize: 16),
                ),
              ),
            ),
        ],
      ),
    );

    // Pulse Animation for Low Stock
    if (isLowStock) {
      content = content.animate(onPlay: (c) => c.repeat(reverse: true)).tint(
          color: theme.colors.stateError.withValues(alpha: 0.12),
          duration: 1.seconds);
    }

    return Dismissible(
      key: ValueKey(widget.product.uuid),
      confirmDismiss: (direction) async {
        if (direction == DismissDirection.startToEnd) {
          // Swipe Right -> Quick Stock (Reveal Green)
          return false;
        } else {
          // Swipe Left -> Edit (Reveal Yellow)
          widget.onEdit();
          return false;
        }
      },
      onUpdate: (details) {
        if (details.reached && !details.previousReached) {
          HapticFeedback.lightImpact(); // Feedback when action is "caught"
        }
      },
      background: Container(
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.only(left: 24),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(theme.shapes.radiusMd),
          gradient: LinearGradient(colors: [
            theme.colors.stateSuccess,
            theme.colors.stateSuccess.withValues(alpha: 0.78)
          ]),
        ),
        child: Row(
          children: [
            _StockActionButton(
                icon: Icons.remove, onTap: () => widget.onStockUpdate(-1)),
            const SizedBox(width: 24),
            _StockActionButton(
                icon: Icons.add,
                onTap: () => widget.onStockUpdate(1),
                isMajor: true),
          ],
        ),
      ),
      secondaryBackground: Container(
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 24),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(theme.shapes.radiusMd),
          color: theme.colors.brandAccent,
        ),
        child: const Icon(Icons.edit, color: Colors.white, size: 32),
      ),
      child: content,
    );
  }
}

class _StockActionButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  final bool isMajor;

  const _StockActionButton(
      {required this.icon, required this.onTap, this.isMajor = false});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (isMajor) {
          HapticFeedback.heavyImpact();
        } else {
          HapticFeedback.mediumImpact();
        }
        onTap();
      },
      child: Container(
        width: 56,
        height: 56,
        decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(color: Colors.black12, blurRadius: 4, spreadRadius: 1)
            ]),
        child: Icon(icon, color: Colors.green[800], size: 32),
      ).animate(target: 1).scale(
          duration: 150.ms,
          curve: Curves.easeOutBack,
          begin: const Offset(0.8, 0.8)),
    );
  }
}
