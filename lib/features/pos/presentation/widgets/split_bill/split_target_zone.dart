import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:intl/intl.dart';
import 'package:savvy_pos/core/config/theme/savvy_theme.dart';
import 'package:savvy_pos/features/pos/presentation/bloc/cart/cart_state.dart';

class SplitTargetZone extends StatefulWidget {
  final int index;
  final List<CartItem> items;
  final VoidCallback onPay;
  final Function(CartItem) onAccept;
  final Function(CartItem) onRemove;

  const SplitTargetZone({
    super.key,
    required this.index,
    required this.items,
    required this.onPay,
    required this.onAccept,
    required this.onRemove,
  });

  @override
  State<SplitTargetZone> createState() => _SplitTargetZoneState();
}

class _SplitTargetZoneState extends State<SplitTargetZone> {
  bool _isHovering = false;

  @override
  Widget build(BuildContext context) {
    final theme = context.savvy;
    final total = widget.items.fold(0.0, (sum, item) => sum + item.total);
    final currency = NumberFormat.currency(symbol: '\$');

    return DragTarget<CartItem>(
      onWillAcceptWithDetails: (details) {
        if (!widget.items.contains(details.data)) {
          HapticFeedback.selectionClick();
          setState(() => _isHovering = true);
          return true;
        }
        return false;
      },
      onLeave: (_) => setState(() => _isHovering = false),
      onAcceptWithDetails: (details) {
        setState(() => _isHovering = false);
        HapticFeedback.mediumImpact();
        widget.onAccept(details.data);
      },
      builder: (context, candidateData, rejectedData) {
        return AnimatedContainer(
          duration: 200.ms,
          curve: Curves.easeOut,
          width: 280,
          margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          decoration: BoxDecoration(
            color: _isHovering
                ? theme.colors.brandPrimary.withValues(alpha: 0.05)
                : theme.colors.bgElevated,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: _isHovering
                  ? theme.colors.brandPrimary
                  : theme.colors.borderDefault,
              width: _isHovering ? 2 : 1,
            ),
            boxShadow: _isHovering
                ? [
                    BoxShadow(
                        color: theme.colors.brandPrimary.withValues(alpha: 0.2),
                        blurRadius: 12,
                        spreadRadius: 2)
                  ]
                : [
                    BoxShadow(
                        color: Colors.black12,
                        blurRadius: 4,
                        offset: Offset(0, 2))
                  ],
          ),
          child: Column(
            children: [
              // Header
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: theme.colors.bgPrimary,
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(11)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Bill #${widget.index + 1}',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: theme.colors.textPrimary)),
                    if (total > 0)
                      Text(currency.format(total),
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: theme.colors.brandPrimary)),
                  ],
                ),
              ),

              // Item List
              Expanded(
                child: widget.items.isEmpty
                    ? Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.add_circle_outline,
                                color: theme.colors.textMuted, size: 32),
                            SizedBox(height: 8),
                            Text('Drop items here',
                                style: TextStyle(color: theme.colors.textMuted))
                          ],
                        ).animate(target: _isHovering ? 1 : 0).scale(
                            begin: const Offset(1, 1),
                            end: const Offset(1.1, 1.1)),
                      )
                    : ListView.builder(
                        padding: EdgeInsets.all(8),
                        itemCount: widget.items.length,
                        itemBuilder: (context, i) {
                          final item = widget.items[i];
                          return LongPressDraggable<CartItem>(
                            data: item,
                            feedback: Material(
                                color: Colors.transparent,
                                child: Transform.rotate(
                                    angle: 0.1,
                                    child: SizedBox(
                                        width: 260,
                                        child: Opacity(
                                            opacity: 0.9,
                                            child:
                                                _MiniBillItem(item: item))))),
                            childWhenDragging: Opacity(
                                opacity: 0.3, child: _MiniBillItem(item: item)),
                            onDragCompleted: () {
                              // Handled by acceptor
                            },
                            child: _MiniBillItem(item: item)
                                .animate()
                                .slideY(
                                    begin: 0.5,
                                    end: 0,
                                    duration: 300.ms,
                                    curve: Curves.easeOutBack) // Entry anim
                                .fadeIn(),
                          );
                        },
                      ),
              ),

              // Footer Action
              if (widget.items.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: ElevatedButton(
                    onPressed: widget.onPay,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: theme.colors.stateSuccess,
                      foregroundColor: Colors.white,
                      minimumSize: Size(double.infinity, 44),
                    ),
                    child: Text('Pay ${currency.format(total)}'),
                  ),
                ),
            ],
          ),
        )
            .animate(target: _isHovering ? 1 : 0)
            .scale(begin: const Offset(1, 1), end: const Offset(1.02, 1.02));
      },
    );
  }
}

class _MiniBillItem extends StatelessWidget {
  final CartItem item;
  const _MiniBillItem({required this.item});

  @override
  Widget build(BuildContext context) {
    final theme = context.savvy;
    final currency = NumberFormat.currency(symbol: '\$');

    return Container(
      margin: EdgeInsets.only(bottom: 8),
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: theme.colors.bgElevated,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: theme.colors.borderDefault),
      ),
      child: Row(
        children: [
          Text('${item.quantity}',
              style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(width: 8),
          Expanded(
              child: Text(item.product.name, overflow: TextOverflow.ellipsis)),
          Text(currency.format(item.total), style: TextStyle(fontSize: 12)),
        ],
      ),
    );
  }
}
