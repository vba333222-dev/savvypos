import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:savvy_pos/core/config/theme_config.dart';
import 'package:savvy_pos/core/presentation/widgets/savvy_widgets.dart';
import 'package:savvy_pos/core/hal/printer_interface.dart';
import 'package:get_it/get_it.dart';
import 'package:savvy_pos/core/database/database.dart';
import 'package:savvy_pos/features/pos/presentation/bloc/cart/cart_state.dart';

class CheckoutSuccessDialog extends StatefulWidget {
  final OrderTableData? order;
  final List<CartItem> items;
  final VoidCallback onNewOrder;

  const CheckoutSuccessDialog({
    Key? key,
    this.order,
    this.items = const [],
    required this.onNewOrder,
  }) : super(key: key);

  @override
  State<CheckoutSuccessDialog> createState() => _CheckoutSuccessDialogState();
}

class _CheckoutSuccessDialogState extends State<CheckoutSuccessDialog> {
  int _secondsRemaining = 5;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (!mounted) return;
      setState(() {
        if (_secondsRemaining > 0) {
          _secondsRemaining--;
        } else {
          _timer?.cancel();
          widget.onNewOrder(); // Auto-close
        }
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.savvy;

    return PopScope(
      canPop: false, // Prevent accidental close
      child: Center(
        child: SavvyBox(
          width: 400,
          padding: EdgeInsets.all(theme.shapes.spacingXl),
          color: theme.colors.bgElevated,
          borderRadius: BorderRadius.circular(theme.shapes.radiusXl),
          shadow: theme.elevations.floating, // Floating effect
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // 1. Success Icon Animation
              Container(
                width: 100, 
                height: 100,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: theme.colors.stateSuccess.withOpacity(0.2),
                ),
                child: Center(
                  child: Icon(Icons.check_rounded, color: theme.colors.stateSuccess, size: 60)
                     .animate()
                     .scale(duration: 600.ms, curve: Curves.elasticOut)
                     .shimmer(delay: 400.ms, color: Colors.white.withOpacity(0.5)),
                ),
              )
              .animate()
              .scale(duration: 400.ms, curve: theme.motion.curveBounce), // Dialog Element Entry
              
              SizedBox(height: theme.shapes.spacingLg),
              
              // 2. Text
              SavvyText("Payment Successful!", style: SavvyTextStyle.h2, color: theme.colors.textPrimary)
                  .animate()
                  .fadeIn(delay: 200.ms)
                  .slideY(begin: 0.2, end: 0),
                  
              SizedBox(height: theme.shapes.spacingSm),
              
              // 3. Change Display
              if (widget.order != null && widget.order!.changeAmount > 0) ...[
                SavvyBox(
                   margin: EdgeInsets.symmetric(vertical: theme.shapes.spacingMd),
                   padding: EdgeInsets.all(theme.shapes.spacingMd),
                   color: theme.colors.stateSuccess.withOpacity(0.1),
                   borderRadius: BorderRadius.circular(theme.shapes.radiusMd),
                   child: Column(
                     children: [
                       SavvyText("CHANGE DUE", style: SavvyTextStyle.label, color: theme.colors.stateSuccess),
                       SavvyText(
                         "\$${widget.order!.changeAmount.toStringAsFixed(2)}", 
                         style: SavvyTextStyle.h1, 
                         color: theme.colors.stateSuccess
                       ),
                     ],
                   ),
                ).animate().fadeIn(delay: 400.ms).slideY(begin: 0.5, end: 0, curve: Curves.easeOutBack),
              ],

              SizedBox(height: theme.shapes.spacingLg),

              // 4. Actions
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: widget.onNewOrder,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: theme.colors.brandPrimary,
                    foregroundColor: theme.colors.textInverse,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(theme.shapes.radiusMd)),
                  ),
                  child: Text("New Order ($_secondsRemaining)"), // Using Timer
                ),
              ).animate().fadeIn(delay: 800.ms),
              
              SizedBox(height: theme.shapes.spacingSm),
              
              TextButton.icon(
                onPressed: () async {
                   try {
                     // For MVP we can print a dummy last order re-constructed or passed in.
                     // Ideally we pass order object. For now let's just toast/log as success.
                     // Or fetch last order from Bloc?? Bloc clears it. Needs persistence logic.
                     // Assuming 'onPrint' callback or similar.
                     // The user requested binding to current success dialog. 
                     // We can construct a receipt with available info: Change and explicit zeroed items if not passed.
                     // Wait, we need Order Object to print *Receipt*.
                     // Let's assume we can fetch the *Last Order* from DB if we had ID or just print a 'Test Receipt' for this step?
                     // Better: Passed 'lastOrderNumber' is in BlocState but we are invalidating it on Clear.
                     // Actually, Bloc emit success THEN clears. So we might have access to it in the parent?
                     // Let's use a dummy receipt for the visual "Wire Success" demonstration.
                     final printer = GetIt.I<IPrinterService>();
                     if (widget.order != null) {
                        final itemsMap = widget.items.map((e) => {
                          'name': e.product.name,
                          'qty': e.quantity,
                          'total': e.total,
                        }).toList();
                        
                        await printer.printReceipt(widget.order!, items: itemsMap);
                     } else {
                        await printer.printText("Savvy POS\nPayment Verified\n(Order Data Missing)\n\n", isBold: true, isLarge: true);
                     }
                   } catch (e) {
                     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Print Error: $e')));
                   }
                },
                icon: const Icon(Icons.print),
                label: const Text("Print Receipt"),
              ).animate().fadeIn(delay: 1000.ms),
            ],
          ),
        ),
      ).animate().scale(duration: 300.ms, curve: theme.motion.curveDefault), // Whole Dialog Entry
    );
  }
}
