import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // For HapticFeedback
import 'package:flutter_animate/flutter_animate.dart';
import 'package:savvy_pos/core/config/theme/savvy_theme.dart';
import 'package:savvy_pos/core/presentation/widgets/savvy_text.dart';
import 'package:savvy_pos/core/presentation/widgets/receipt_clipper.dart'; // Use Clipper
import 'package:savvy_pos/core/utils/haptic_helper.dart'; 
import 'package:savvy_pos/features/pos/presentation/bloc/cart/cart_bloc.dart';

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

class _CheckoutSuccessDialogState extends State<CheckoutSuccessDialog> with SingleTickerProviderStateMixin {
  bool _isPrinted = false;

  @override
  void initState() {
    super.initState();
    // Use animation listener or simple delay to trigger completion haptic
    Future.delayed(600.ms, () {
      if (mounted) {
        HapticFeedback.mediumImpact(); // Medium on Print Complete
        setState(() => _isPrinted = true);
      }
    });

    // Simulated "Dot Matrix" noise (Haptics)
    _playPrintingHaptics();
  }

  void _playPrintingHaptics() async {
    for (int i = 0; i < 6; i++) { // 6 ticks over 600ms
      if (!mounted) break;
      await Future.delayed(60.ms);
      HapticFeedback.selectionClick();
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.savvy;
    // Calculate totals for receipt display
    final double total = widget.items.fold(0, (sum, item) => sum + item.total);
    // Change Logic Mock
    final double change = 15.50; 

    return Scaffold(
      backgroundColor: Colors.black54, // Dimmed background
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          // 1. PAPER EXIT SLOT SHADOW (Visual sugar)
          Positioned(
             top: -10,
             left: 0, right: 0,
             height: 20,
             child: Container(
               decoration: BoxDecoration(
                 boxShadow: [BoxShadow(color: Colors.black45, blurRadius: 20, spreadRadius: 5)],
               ),
             ),
          ),
          
          // 2. THE RECEIPT
          Center(
            child: Dismissible(
              key: const ValueKey('receipt'),
              direction: DismissDirection.down, // Explicitly down
              onDismissed: (_) {
                // "Tear Off" Action
                HapticFeedback.heavyImpact(); // Heavy on Dismiss
                widget.onNewOrder();
              },
              // Allow swiping down or up to "tear"
              background: Container(color: Colors.transparent),
              child: Padding(
                padding: const EdgeInsets.only(top: 60), // Space from top status bar
                child: ClipPath(
                  clipper: ReceiptZigZagClipper(sawToothDepth: 12, density: 20),
                  child: Container(
                    width: 380, // Receipt Width
                    color: theme.colors.bgElevated, // Paper Color
                    padding: const EdgeInsets.fromLTRB(24, 32, 24, 40), 
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // LOGO / BRAND
                        Icon(Icons.receipt_long, size: 48, color: theme.colors.textSecondary),
                        SizedBox(height: theme.shapes.spacingSm),
                        SavvyText('SAVVY POS', style: SavvyTextStyle.h3, color: theme.colors.textPrimary),
                        SizedBox(height: theme.shapes.spacingXs),
                        SavvyText('Kinetic Receipt', style: SavvyTextStyle.labelSmall, color: theme.colors.textSecondary),
                        
                        Divider(height: 32, color: theme.colors.borderDefault),
                        
                        // GRAND TOTAL
                        SavvyText('TOTAL', style: SavvyTextStyle.labelMedium, color: theme.colors.textSecondary),
                        SavvyText('\$${total.toStringAsFixed(2)}', style: TextStyle(fontSize: 48, fontWeight: FontWeight.w900, color: theme.colors.textPrimary)),
                        
                        SizedBox(height: 24),

                        // CHANGE PROMINENT
                        if (change > 0)
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: theme.colors.stateSuccess.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: theme.colors.stateSuccess.withOpacity(0.3)),
                          ),
                          child: Column(
                            children: [
                              SavvyText('CHANGE DUE', style: TextStyle(color: theme.colors.stateSuccess, fontWeight: FontWeight.bold, letterSpacing: 1.5)),
                              Text('\$${change.toStringAsFixed(2)}', style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: theme.colors.stateSuccess)),
                            ],
                          ),
                        ),
                        
                        SizedBox(height: 32),

                         Divider(height: 1, color: theme.colors.borderDefault),
                         SizedBox(height: 16),

                         // LIST (Simplified)
                         ConstrainedBox(
                           constraints: BoxConstraints(maxHeight: 150),
                           child: ListView.builder(
                             shrinkWrap: true,
                             itemCount: widget.items.length,
                             itemBuilder: (context, index) {
                               final item = widget.items[index];
                               return Padding(
                                 padding: const EdgeInsets.symmetric(vertical: 4),
                                 child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(child: Text('${item.quantity}x ${item.product.name}', overflow: TextOverflow.ellipsis, style: TextStyle(color: theme.colors.textSecondary))),
                                      Text('\$${item.total.toStringAsFixed(2)}', style: TextStyle(fontWeight: FontWeight.bold)),
                                    ],
                                 ),
                               );
                             },
                           ),
                         ),
                         
                         SizedBox(height: 24),
                         
                         // ACTIONS (Inside Receipt)
                         Row(
                           children: [
                             Expanded(
                               child: OutlinedButton(
                                 onPressed: () {}, 
                                 child: const Text("Print"),
                               ),
                             ),
                             SizedBox(width: 16),
                             Expanded(
                               child: ElevatedButton(
                                 style: ElevatedButton.styleFrom(
                                   backgroundColor: theme.colors.brandPrimary,
                                   foregroundColor: theme.colors.textInverse,
                                 ),
                                 onPressed: () {
                                   HapticFeedback.heavyImpact();
                                   widget.onNewOrder();
                                 }, 
                                 child: const Text("New Order"),
                               ),
                             ),
                           ],
                         ),
                      ],
                    ),
                  ),
                ),
              ),
            )
            .animate()
            .moveY(begin: -600, end: 0, duration: 600.ms, curve: Curves.easeOutQuart) // Printing Slide
            .then()
            // Swing effect after print (Physics)
            .rotate(begin: 0, end: 0.02, duration: 400.ms, curve: Curves.easeInOut)
            .then()
            .rotate(begin: 0.02, end: -0.01, duration: 400.ms, curve: Curves.easeInOut)
            .then()
            .rotate(begin: -0.01, end: 0, duration: 300.ms, curve: Curves.easeOut),
          ),
        ],
      ),
    );
  }
}

extension DividerDashed on Divider {
  // Helper for dashed if needed, standard Divider is solid. Using thickness check usually.
  // Actually standard Flutter Text default doesn't support 'dashed' nicely in Divider.
  // We'll ignore boolean 'dashed' for now unless we implementation CustomPainter for it.
  // We'll stick to standard Divider.
}
