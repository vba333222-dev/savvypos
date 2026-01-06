import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:savvy_pos/core/config/theme/savvy_theme.dart';
import 'package:savvy_pos/core/presentation/widgets/savvy_text.dart';
import 'package:savvy_pos/features/pos/presentation/bloc/cart/cart_bloc.dart';

class CheckoutSuccessDialog extends StatelessWidget {
  final dynamic order; // Can be Order entity
  final List<CartItem> items;
  final VoidCallback onNewOrder;

  const CheckoutSuccessDialog({
    super.key, 
    this.order, 
    required this.items, 
    required this.onNewOrder
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.savvy;

    // Hardcoded change logic visualization for now (since we don't pass tender info in mock flow yet)
    // In real app, order entity would have 'tender' and 'change'.
    final double change = 15.50; // Mock

    return Dialog(
      backgroundColor: Colors.transparent, // Custom shape via container
      elevation: 0,
      child: Container(
        width: 400,
        padding: EdgeInsets.all(theme.shapes.spacingXl),
        decoration: BoxDecoration(
          color: theme.colors.bgElevated,
          borderRadius: BorderRadius.circular(theme.shapes.radiusXl),
          boxShadow: theme.elevations.floating,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // checkmark
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: theme.colors.stateSuccess.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.check_rounded, size: 64, color: theme.colors.stateSuccess)
                  .animate()
                  .scale(duration: 600.ms, curve: Curves.elasticOut),
            ),
            
            SizedBox(height: theme.shapes.spacingLg),
            
            SavvyText('Payment Successful!', style: SavvyTextStyle.h2, color: theme.colors.textPrimary),
            SizedBox(height: theme.shapes.spacingSm),
            SavvyText('Transaction #${DateTime.now().millisecondsSinceEpoch.toString().substring(8)}', style: SavvyTextStyle.bodySmall, color: theme.colors.textSecondary),

            Divider(height: theme.shapes.spacingXl, color: theme.colors.borderDefault),
            
            if (change > 0)
            Column(
              children: [
                SavvyText('CHANGE DUE', style: SavvyTextStyle.labelMedium, color: theme.colors.textMuted),
                SavvyText('\$${change.toStringAsFixed(2)}', style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold, color: theme.colors.textPrimary)),
                SizedBox(height: theme.shapes.spacingLg),
              ],
            ),

            // Actions
            Row(
              children: [
                Expanded(
                   child: OutlinedButton.icon(
                     onPressed: () {
                       // Mock Print
                       ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Printing receipt...')));
                     },
                     icon: Icon(Icons.print, color: theme.colors.textPrimary),
                     label: Text('Print Receipt', style: TextStyle(color: theme.colors.textPrimary)),
                     style: OutlinedButton.styleFrom(
                       padding: EdgeInsets.symmetric(vertical: 16),
                       side: BorderSide(color: theme.colors.borderDefault),
                       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(theme.shapes.radiusMd)),
                     ),
                   ),
                ),
                SizedBox(width: theme.shapes.spacingMd),
                Expanded(
                   child: ElevatedButton.icon(
                     onPressed: onNewOrder,
                     icon: Icon(Icons.add_shopping_cart, color: theme.colors.textInverse),
                     label: Text('New Order', style: TextStyle(color: theme.colors.textInverse)),
                     style: ElevatedButton.styleFrom(
                       backgroundColor: theme.colors.brandPrimary,
                       padding: EdgeInsets.symmetric(vertical: 16),
                       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(theme.shapes.radiusMd)),
                     ),
                   ),
                ),
              ],
            )
          ],
        ),
      ).animate().moveY(begin: 50, end: 0, duration: 400.ms, curve: Curves.easeOutBack).fadeIn(),
    );
  }
}
