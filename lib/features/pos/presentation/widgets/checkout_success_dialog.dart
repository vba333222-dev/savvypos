import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:savvy_pos/core/presentation/widgets/digital_receipt_widget.dart';
import 'package:savvy_pos/features/pos/presentation/bloc/cart/cart_state.dart';

class CheckoutSuccessDialog extends StatefulWidget {
  final dynamic order; 
  final List<CartItem> items;
  final VoidCallback onNewOrder;

  const CheckoutSuccessDialog({
    super.key, 
    this.order, 
    required this.items, 
    required this.onNewOrder
  });

  @override
  State<CheckoutSuccessDialog> createState() => _CheckoutSuccessDialogState();
}

class _CheckoutSuccessDialogState extends State<CheckoutSuccessDialog> with TickerProviderStateMixin {
  // State for Physics
  Offset _dragOffset = Offset.zero;
  double _rotation = 0.0;

  bool _isTearing = false;
  
  // Animation Controller for "Printing" Entrance
  late AnimationController _printController;
  late Animation<double> _printAnimation; // Translation Y: -Height -> 0

  @override
  void initState() {
    super.initState();
    
    // Setup Print Animation
    _printController = AnimationController(vsync: this, duration: const Duration(milliseconds: 800));
    _printAnimation = Tween<double>(begin: -600, end: 0).animate(CurvedAnimation(
      parent: _printController, 
      curve: Curves.easeOutQuart
    ));

    // Start Printing after frame
    WidgetsBinding.instance.addPostFrameCallback((_) {
       _printController.forward();
       _playPrintingHaptics();
    });
  }

  @override
  void dispose() {
    _printController.dispose();
    super.dispose();
  }

  void _playPrintingHaptics() async {
    // Simulate "Chug chug chug" of printer
    for (int i = 0; i < 6; i++) {
       if (!mounted) break;
       await Future.delayed(80.ms);
       HapticFeedback.selectionClick();
    }
    // Final "Cut" click
    if (mounted) HapticFeedback.mediumImpact();
  }

  void _onPanUpdate(DragUpdateDetails details) {
    if (_isTearing) return;
    
    setState(() {

      _dragOffset += details.delta;
      
      // Swing Logic: Rotate based on X drag relative to top center anchor
      // Simple approximation: X / 1000 radians
      _rotation = (_dragOffset.dx / 600).clamp(-0.4, 0.4); 
    });
  }

  void _onPanEnd(DragEndDetails details) {
    if (_isTearing) return;

    // Check Threshold for Tear (Downwards)
    if (_dragOffset.dy > 150) {
       _tearOff();
    } else {
       // Snap Back
       setState(() {
         _dragOffset = Offset.zero;
         _rotation = 0.0;
       });
    }
  }

  void _tearOff() {
    setState(() => _isTearing = true);
    HapticFeedback.heavyImpact(); // Rrrrrip!
    
    // Complete the dismissal
    Future.delayed(300.ms, () {
      widget.onNewOrder();
    });
  }

  @override
  Widget build(BuildContext context) {
    // Calculate totals for receipt display (Dummy values if not provided in Order object)
    final double total = widget.items.fold(0, (sum, item) => sum + item.total);
    final double subtotal = total / 1.1; // Approx
    final double tax = total - subtotal;
    
    return Scaffold(
      backgroundColor: Colors.black54,
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          // 1. RECEIPT SLOT (Visual Shadow/Hole)
           Positioned(
             top: -20,
             left: 0, right: 0,
             height: 40,
             child: Container(
               decoration: BoxDecoration(
                 boxShadow: [BoxShadow(color: Colors.black87, blurRadius: 30, spreadRadius: 5)],
               ),
             ),
           ),

           // 2. THE RECEIPT (Interactive)
           AnimatedBuilder(
             animation: _printController,
             builder: (context, child) {
               // Combine Print Animation (Y Translation) + Drag Physics (Offset + Rotation)
               double yPos = _printAnimation.value;
               
               // If tearing, accelerate down
               if (_isTearing) {
                  yPos += 800; // Drop off screen
               } else {
                  yPos += _dragOffset.dy;
               }

               return Transform.translate(
                 offset: Offset(_dragOffset.dx, yPos),
                 child: Transform.rotate(
                   angle: _rotation,
                   alignment: Alignment.topCenter,
                   child: GestureDetector(
                     onPanUpdate: _onPanUpdate,
                     onPanEnd: _onPanEnd,
                     child: AnimatedOpacity(
                       opacity: _isTearing ? 0.0 : 1.0,
                       duration: 300.ms,
                       child: Container(
                         margin: const EdgeInsets.only(top: 60), // Init position below slot
                         decoration: BoxDecoration(
                           boxShadow: [
                             BoxShadow(
                               color: Colors.black26, 
                               blurRadius: 15, 
                               offset: Offset(_dragOffset.dx * 0.1, 10 + _dragOffset.dy * 0.1)
                             )
                           ],
                         ),
                         child: DigitalReceiptWidget(
                           items: widget.items,
                           total: total,
                           subtotal: subtotal,
                           tax: tax,
                           discount: 0,
                           change: 12.50, // Mock
                           orderNumber: widget.order?.orderNumber ?? 'ORD-001',
                           date: widget.order?.createdAt ?? DateTime.now(),
                         ),
                       ),
                     ),
                   ),
                 ),
               );
             },
           ),

           // 3. ACTION BUTTONS (Appear after print)
           Positioned(
             bottom: 40,
             left: 20, right: 20,
             child: FadeTransition(
               opacity: _printController, // Fade in with print
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                    _ActionButton(
                      icon: Icons.print, 
                      label: 'Print', 
                      onTap: () {
                         HapticFeedback.selectionClick();
                         // Implementation for physical print
                      }
                    ),
                    SizedBox(width: 24),
                    _ActionButton(
                      icon: Icons.email_outlined, 
                      label: 'Email', 
                      onTap: () {
                         HapticFeedback.selectionClick();
                         // Implementation for email
                      }
                    ),
                    SizedBox(width: 24),
                    _ActionButton(
                      icon: Icons.close, 
                      label: 'Close', 
                      isPrimary: true,
                      onTap: () {
                         // Manual Close (if they don't tear)
                         widget.onNewOrder(); // Or just pop? Requirement says "New Order"
                      }
                    ),
                 ],
               ),
             ),
           ),
        ],
      ),
    );
  }
}

class _ActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final bool isPrimary;

  const _ActionButton({
    required this.icon, 
    required this.label, 
    required this.onTap,
    this.isPrimary = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(30),
          child: Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: isPrimary ? Colors.white : Colors.white24,
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: isPrimary ? Colors.black : Colors.white),
          ),
        ),
        SizedBox(height: 8),
        Text(label, style: TextStyle(color: Colors.white70, fontSize: 12)),
      ],
    );
  }
}
