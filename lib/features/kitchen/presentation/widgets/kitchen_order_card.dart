import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:savvy_pos/core/config/theme/savvy_theme.dart';
import 'package:savvy_pos/features/kitchen/domain/entities/kitchen_order.dart';

class KitchenOrderCard extends StatefulWidget {
  final KitchenOrder order;
  final VoidCallback onBump;
  final VoidCallback? onVoid;

  const KitchenOrderCard({
    super.key, 
    required this.order, 
    required this.onBump,
    this.onVoid,
  });

  @override
  State<KitchenOrderCard> createState() => _KitchenOrderCardState();
}

class _KitchenOrderCardState extends State<KitchenOrderCard> with SingleTickerProviderStateMixin {
  late Timer _timer;
  late Duration _elapsed;
  late final AnimationController _urgencyController;

  @override
  void initState() {
    super.initState();
    _updateElapsed();
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (mounted) {
        setState(() => _updateElapsed());
      }
    });

    _urgencyController = AnimationController(vsync: this, duration: 1.seconds);
  }

  void _updateElapsed() {
    _elapsed = DateTime.now().difference(widget.order.orderTime);
    
    // Trigger Pulse if Red Zone (> 15m)
    if (_elapsed.inMinutes >= 15 && !_urgencyController.isAnimating) {
       _urgencyController.repeat(reverse: true);
    }
  }

  @override
  void dispose() {
    _timer.cancel();
    _urgencyController.dispose();
    super.dispose();
  }

  Color _getUrgencyColor(SavvyTheme theme) {
    if (_elapsed.inMinutes < 5) return theme.colors.stateSuccess; // Fresh
    if (_elapsed.inMinutes < 15) return theme.colors.stateWarning; // Warning
    return theme.colors.stateError; // Critical
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.savvy;
    final urgencyColor = _getUrgencyColor(theme);
    final isCritical = _elapsed.inMinutes >= 15;
    
    // Calculate display time MM:SS
    final minutes = _elapsed.inMinutes;
    final seconds = (_elapsed.inSeconds % 60).toString().padLeft(2, '0');
    final timeDisplay = '$minutes:$seconds';

    return Dismissible(
      key: ValueKey(widget.order.uuid),
      direction: DismissDirection.vertical,
      onDismissed: (direction) {
        HapticFeedback.mediumImpact();
        if (direction == DismissDirection.up) {
          widget.onBump();
        } else {
          widget.onVoid?.call();
        }
      },
      background: Container(
        color: theme.colors.stateSuccess,
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.check_circle, color: Colors.white, size: 48),
            Text('BUMP', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))
          ],
        ),
      ),
      secondaryBackground: Container(
        color: theme.colors.stateError,
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.delete_forever, color: Colors.white, size: 48),
            Text('VOID', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))
          ],
        ),
      ),
      child: AnimatedBuilder(
        animation: _urgencyController,
        builder: (context, child) {
          // Pulse Opacity/Shadow if critical
          final pulse = isCritical ? _urgencyController.value * 0.5 : 0.0;
          
          return Container(
            width: 300, // Fixed width for rail
            decoration: BoxDecoration(
              color: theme.colors.bgElevated,
              borderRadius: BorderRadius.circular(theme.shapes.radiusMd),
              border: Border.all(
                color: Color.lerp(theme.colors.borderDefault, urgencyColor, 0.5 + pulse)!,
                width: isCritical ? 2 : 1,
              ),
              boxShadow: isCritical 
                 ? [BoxShadow(color: urgencyColor.withAlpha(102), blurRadius: 10 + (pulse * 10), spreadRadius: pulse * 2)]
                 : theme.elevations.sm,
            ),
            child: child,
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // HEADER (Heatmap)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: urgencyColor.withOpacity(0.15),
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
                    padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                    decoration: BoxDecoration(
                      color: urgencyColor,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      timeDisplay,
                      style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 14),
                    ),
                  ),
                ],
              ),
            ),
            
            // DETAILS
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   Row(
                     children: [
                       Icon(Icons.table_restaurant, size: 16, color: theme.colors.textSecondary),
                       SizedBox(width: 4),
                       Text(
                         widget.order.type == KitchenOrderType.takeaway ? 'TAKEAWAY' : 'Table ${widget.order.tableNumber ?? "-"}',
                         style: TextStyle(fontWeight: FontWeight.w600, color: theme.colors.textSecondary),
                       ),
                     ],
                   ),
                   Divider(height: 16),
                   
                   // ITEMS
                   ...widget.order.items.map((item) => Padding(
                     padding: const EdgeInsets.only(bottom: 8.0),
                     child: _KitchenItemRow(item: item, theme: theme),
                   )),
                ],
              ),
            ),
            
            Spacer(),
            
            // FOOTER HELP TEXT
             Center(
               child: Padding(
                 padding: const EdgeInsets.only(bottom: 8.0),
                 child: Text('Swipe UP to Bump', style: TextStyle(fontSize: 10, color: theme.colors.textMuted)),
               ),
             ),
          ],
        ),
      ),
    );
  }
}

class _KitchenItemRow extends StatelessWidget {
  final KitchenOrderItem item;
  final SavvyTheme theme;

  const _KitchenItemRow({required this.item, required this.theme});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('${item.quantity}x', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: theme.colors.textPrimary)),
            SizedBox(width: 8),
            Expanded(
              child: Text(item.productName, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: theme.colors.textPrimary)),
            ),
          ],
        ),
        if (item.modifiers.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(left: 28),
            child: Text(
              item.modifiers.join(', '), // Assuming simpler list of strings or toString is okay
              style: TextStyle(color: theme.colors.textSecondary, fontSize: 12, fontStyle: FontStyle.italic),
            ),
          ),
        if (item.note != null && item.note!.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(left: 28),
            child: Text(
              'NOTE: ${item.note}',
              style: TextStyle(color: theme.colors.stateError, fontWeight: FontWeight.bold, fontSize: 12),
            ),
          ),
      ],
    );
  }
}
