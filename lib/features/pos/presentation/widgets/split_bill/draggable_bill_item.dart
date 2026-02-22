import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:savvy_pos/core/config/theme/savvy_theme.dart';
import 'package:savvy_pos/features/pos/presentation/bloc/cart/cart_state.dart';

class DraggableBillItem extends StatelessWidget {
  final CartItem item;
  final bool
      isGhost; // If true, renders as a placeholder (when item is dragged out)

  const DraggableBillItem({
    super.key,
    required this.item,
    this.isGhost = false,
  });

  @override
  Widget build(BuildContext context) {
    if (isGhost) {
      return Opacity(opacity: 0.3, child: _BillCard(item: item));
    }

    return LongPressDraggable<CartItem>(
      data: item,
      feedback: _FeedbackCard(item: item),
      childWhenDragging: Opacity(opacity: 0.2, child: _BillCard(item: item)),
      onDragStarted: () => HapticFeedback.selectionClick(),
      child: _BillCard(item: item),
    );
  }
}

class _BillCard extends StatelessWidget {
  final CartItem item;

  const _BillCard({required this.item});

  @override
  Widget build(BuildContext context) {
    final theme = context.savvy;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: theme.colors.bgElevated,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: theme.colors.borderDefault),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 2)),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: theme.colors.bgPrimary,
              borderRadius: BorderRadius.circular(4),
            ),
            child: Text('${item.quantity}x',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: theme.colors.textPrimary)),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(item.product.name,
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: theme.colors.textPrimary)),
                Text('\$${item.total.toStringAsFixed(2)}',
                    style: TextStyle(
                        color: theme.colors.textSecondary, fontSize: 12)),
              ],
            ),
          ),
          Icon(Icons.drag_indicator, color: theme.colors.textMuted, size: 20),
        ],
      ),
    );
  }
}

class _FeedbackCard extends StatelessWidget {
  final CartItem item;

  const _FeedbackCard({required this.item});

  @override
  Widget build(BuildContext context) {
    // Transform needs to be Material-agnostic but feedback needs Material for text
    return Material(
      color: Colors.transparent,
      child: Transform.rotate(
        angle: 0.1, // Slight tilt
        child: SizedBox(
          width: 300,
          child: _BillCard(item: item)
              .animate(onPlay: (c) => c.repeat(reverse: true))
              .scale(
                  begin: const Offset(1.05, 1.05),
                  end: const Offset(1.08, 1.08),
                  duration: 600.ms), // Breathing effect
        ),
      ),
    );
  }
}
