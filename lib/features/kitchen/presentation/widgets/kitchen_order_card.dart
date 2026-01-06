import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:savvy_pos/core/config/theme/savvy_theme.dart';
import 'package:savvy_pos/core/presentation/widgets/savvy_text.dart';
import 'package:savvy_pos/features/kitchen/domain/entities/kitchen_order.dart';

class KitchenOrderCard extends StatefulWidget {
  final KitchenOrder order;
  final VoidCallback onBump;

  const KitchenOrderCard({super.key, required this.order, required this.onBump});

  @override
  State<KitchenOrderCard> createState() => _KitchenOrderCardState();
}

class _KitchenOrderCardState extends State<KitchenOrderCard> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    // Animation for "Late" orders
    _controller = AnimationController(vsync: this, duration: 1.seconds)..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Assuming KitchenOrder has timestamp. 
    // Logic: if now - timestamp > 15 mins -> Late
    final now = DateTime.now();
    final elapsed = now.difference(widget.order.orderTime);
    final isLate = elapsed.inMinutes > 15;
    
    final theme = context.savvy;
    // Mocking order type as it might be on the entity or inferred
    final isTakeaway = widget.order.type == KitchenOrderType.takeaway; 

    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        Color borderColor = theme.colors.borderDefault;
        if (isLate) {
          // Pulse red if late
          borderColor = Color.lerp(theme.colors.stateError, theme.colors.stateError.withOpacity(0.3), _controller.value)!;
        }

        return Container(
          decoration: BoxDecoration(
            color: Colors.white, // Physical ticket look
            border: Border.all(color: borderColor, width: isLate ? 2 : 1),
            borderRadius: BorderRadius.circular(theme.shapes.radiusSm),
            boxShadow: theme.elevations.xs,
          ),
          child: child,
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // HEADER
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: isTakeaway ? const Color(0xFFFFF9C4) : const Color(0xFFBBDEFB), // Pastel Yellow (Takeaway) vs Blue (DineIn)
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(theme.shapes.radiusSm),
                topRight: Radius.circular(theme.shapes.radiusSm),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '#${widget.order.displayId}',
                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black87),
                ),
                Text(
                  '${widget.order.orderTime.hour}:${widget.order.orderTime.minute.toString().padLeft(2, '0')}',
                  style: TextStyle(fontWeight: FontWeight.w500, color: Colors.black87),
                ),
              ],
            ),
          ),
          
          // INFO SUB-HEADER
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            color: Colors.grey.shade50,
            child: Text(
              isTakeaway ? 'TAKEAWAY' : 'TBL ${widget.order.tableNumber ?? "-"}',
              style: TextStyle(
                fontSize: 10, 
                fontWeight: FontWeight.bold, 
                color: isTakeaway ? Colors.orange.shade800 : Colors.blue.shade800,
                letterSpacing: 1.0,
              ),
            ),
          ),
          Divider(height: 1, color: theme.colors.borderDivider.withOpacity(0.1)),

          // ITEMS LIST
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: widget.order.items.map((item) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('${item.quantity}x', style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(item.productName, style: const TextStyle(color: Colors.black87, fontSize: 16)),
                          ),
                        ],
                      ),
                      if (item.modifiers.isNotEmpty)
                        Padding(
                          padding: const EdgeInsets.only(left: 24, top: 2),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: item.modifiers.map((mod) => Text(
                              '+ $mod', 
                              style: TextStyle(color: Colors.grey.shade600, fontSize: 12, fontStyle: FontStyle.italic)
                            )).toList(),
                          ),
                        ),
                      if (item.note != null && item.note!.isNotEmpty)
                         Padding(
                           padding: const EdgeInsets.only(left: 24, top: 2),
                           child: Text(
                             'Note: ${item.note}',
                             style: TextStyle(color: theme.colors.stateError, fontWeight: FontWeight.bold, fontSize: 12),
                           ),
                         ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
          
          const Spacer(), // Push bumping to bottom if card has height constraints

          // FOOTER ACTION
          Padding(
            padding: const EdgeInsets.all(12),
            child: SizedBox(
              height: 44,
              child: ElevatedButton(
                onPressed: widget.onBump,
                style: ElevatedButton.styleFrom(
                  backgroundColor: theme.colors.brandSecondary, // Bump usually neutral or specific action color
                  elevation: 0,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                ),
                child: const Text('BUMP', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
