import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:savvy_pos/core/config/theme_config.dart';
import 'package:savvy_pos/core/presentation/widgets/savvy_widgets.dart';

class CheckoutSuccessDialog extends StatefulWidget {
  final double changeAmount;
  final VoidCallback onNewOrder;

  const CheckoutSuccessDialog({
    Key? key,
    required this.changeAmount,
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
              if (widget.changeAmount > 0) ...[
                SavvyBox(
                   margin: EdgeInsets.symmetric(vertical: theme.shapes.spacingMd),
                   padding: EdgeInsets.all(theme.shapes.spacingMd),
                   color: theme.colors.stateSuccess.withOpacity(0.1),
                   borderRadius: BorderRadius.circular(theme.shapes.radiusMd),
                   child: Column(
                     children: [
                       SavvyText("CHANGE DUE", style: SavvyTextStyle.label, color: theme.colors.stateSuccess),
                       SavvyText(
                         "\$${widget.changeAmount.toStringAsFixed(2)}", 
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
                onPressed: () {},
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
