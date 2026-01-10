import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:savvy_pos/core/config/theme/savvy_theme.dart';
import 'package:savvy_pos/features/kitchen/domain/entities/kitchen_order.dart';

class KitchenOrderCard extends StatefulWidget {
  final KitchenOrder order;
  final VoidCallback onBump;

  const KitchenOrderCard({
    super.key, 
    required this.order, 
    required this.onBump,
  });

  @override
  State<KitchenOrderCard> createState() => _KitchenOrderCardState();
}

class _KitchenOrderCardState extends State<KitchenOrderCard> with TickerProviderStateMixin {
  late Timer _timer;
  late Duration _elapsed;
  late AnimationController _urgencyController;
  late AnimationController _exitController;

  @override
  void initState() {
    super.initState();
    _updateElapsed();
    
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (mounted) setState(() => _updateElapsed());
    });

    _urgencyController = AnimationController(vsync: this, duration: const Duration(seconds: 1));
    _exitController = AnimationController(vsync: this, duration: const Duration(milliseconds: 300));
  }

  void _updateElapsed() {
    _elapsed = DateTime.now().difference(widget.order.orderTime);
    // Pulse if critical (> 15m)
    if (_elapsed.inMinutes >= 15 && !_urgencyController.isAnimating) {
       _urgencyController.repeat(reverse: true);
    }
  }

  @override
  void dispose() {
    _timer.cancel();
    _urgencyController.dispose();
    _exitController.dispose();
    super.dispose();
  }

  Future<void> _handleBump() async {
    HapticFeedback.heavyImpact();
    await _exitController.forward();
    widget.onBump();
  }

  Color _getUrgencyColor(SavvyTheme theme) {
    if (_elapsed.inMinutes < 5) return theme.colors.stateSuccess; 
    if (_elapsed.inMinutes < 15) return theme.colors.stateWarning;
    return theme.colors.stateError;
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.savvy;
    final urgencyColor = _getUrgencyColor(theme);
    final isCritical = _elapsed.inMinutes >= 15;
    
    return ScaleTransition(
      scale: Tween<double>(begin: 1.0, end: 0.0).animate(CurvedAnimation(parent: _exitController, curve: Curves.easeInBack)),
      child: AnimatedBuilder(
        animation: _urgencyController,
        builder: (context, child) {
          final pulse = isCritical ? _urgencyController.value * 4 : 0.0;
          
          return Container(
            decoration: BoxDecoration(
              color: theme.colors.bgElevated,
              borderRadius: BorderRadius.circular(theme.shapes.radiusMd),
              border: Border.all(
                color: isCritical 
                    ? urgencyColor.withValues(alpha: 0.5 + (_urgencyController.value * 0.5)) 
                    : theme.colors.borderDefault,
                width: isCritical ? 2 : 1,
              ),
              boxShadow: isCritical 
                 ? [BoxShadow(color: urgencyColor.withValues(alpha: 0.3), blurRadius: 10 + pulse, spreadRadius: pulse)]
                 : [BoxShadow(color: Colors.black26, blurRadius: 4, offset: Offset(0, 2))],
            ),
            child: child,
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // HEADER (Tap to Bump)
            InkWell(
              onDoubleTap: _handleBump,
              onLongPress: _handleBump,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  color: urgencyColor.withValues(alpha: isCritical ? 0.3 : 0.15),
                  borderRadius: BorderRadius.vertical(top: Radius.circular(theme.shapes.radiusMd)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '#${widget.order.displayId}',
                      style: TextStyle(fontWeight: FontWeight.w900, color: theme.colors.textPrimary, fontSize: 18),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                      decoration: BoxDecoration(
                        color: urgencyColor,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        '${_elapsed.inMinutes}:${(_elapsed.inSeconds % 60).toString().padLeft(2, '0')}',
                        style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 14, fontFeatures: [FontFeature.tabularFigures()]),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            
            // BODY
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   Row(
                     children: [
                       Icon(Icons.table_restaurant, size: 16, color: theme.colors.textSecondary),
                       const SizedBox(width: 4),
                       Text(
                         widget.order.type == KitchenOrderType.takeaway ? 'TAKEAWAY' : 'Table ${widget.order.tableNumber ?? "-"}',
                         style: TextStyle(fontWeight: FontWeight.w600, color: theme.colors.textSecondary),
                       ),
                     ],
                   ),
                   const Divider(height: 16, thickness: 0.5),
                   
                   // ITEMS
                   ...widget.order.items.map((item) => _KitchenItemRow(item: item, theme: theme)),
                ],
              ),
            ),
            
            const Spacer(),
            
            // FOOTER
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Center(
                child: Text('Double-Tap Header to Bump', style: TextStyle(fontSize: 10, color: theme.colors.textMuted)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _KitchenItemRow extends StatefulWidget {
  final KitchenOrderItem item;
  final SavvyTheme theme;

  const _KitchenItemRow({required this.item, required this.theme});

  @override
  State<_KitchenItemRow> createState() => _KitchenItemRowState();
}

class _KitchenItemRowState extends State<_KitchenItemRow> {
  bool _isDone = false;

  @override
  Widget build(BuildContext context) {
    // Dim if done
    final color = _isDone ? widget.theme.colors.textMuted : widget.theme.colors.textPrimary;
    
    return InkWell(
      onTap: () {
        HapticFeedback.lightImpact();
        setState(() => _isDone = !_isDone);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${widget.item.quantity}x', 
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: color, decoration: _isDone ? TextDecoration.lineThrough : null)
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    widget.item.productName, 
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: color, decoration: _isDone ? TextDecoration.lineThrough : null)
                  ),
                ),
              ],
            ),
            if (widget.item.modifiers.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(left: 28),
                child: Text(
                  widget.item.modifiers.join(', '), 
                  style: TextStyle(color: widget.theme.colors.textSecondary.withValues(alpha: _isDone ? 0.5 : 1.0), fontSize: 12, fontStyle: FontStyle.italic),
                ),
              ),
            if (widget.item.note != null && widget.item.note!.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(left: 28),
                child: Text(
                  'NOTE: ${widget.item.note}',
                  style: TextStyle(color: widget.theme.colors.stateError.withValues(alpha: _isDone ? 0.5 : 1.0), fontWeight: FontWeight.bold, fontSize: 12),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
