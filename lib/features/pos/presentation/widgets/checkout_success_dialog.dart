import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:savvy_pos/core/config/theme_config.dart';

class CheckoutSuccessDialog extends StatelessWidget {
  final double changeAmount;
  final VoidCallback onNewOrder;

  const CheckoutSuccessDialog({
    Key? key,
    required this.changeAmount,
    required this.onNewOrder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colors = context.savvy.colors;
    final typography = Theme.of(context).textTheme;
    final shapes = context.savvy.shapes;

    return AlertDialog(
      backgroundColor: colors.bgElevated,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(shapes.radiusLg)),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
           Icon(Icons.check_circle, color: colors.stateSuccess, size: 64)
             .animate()
             .scale(duration: 400.ms, curve: Curves.elasticOut),
           SizedBox(height: shapes.spacingMd),
           Text(
             'Transaction Saved!',
             style: typography.headlineSmall?.copyWith(
               color: colors.textPrimary,
               fontWeight: FontWeight.bold,
             ),
           ),
           SizedBox(height: shapes.spacingSm),
           if (changeAmount > 0)
             Text(
               'Change: \$${changeAmount.toStringAsFixed(2)}',
               style: typography.titleMedium?.copyWith(
                 color: colors.textSecondary,
               ),
             ),
        ],
      ),
      actions: [
        OutlinedButton.icon(
          onPressed: () {
            // Receipt Generation
            // For now we just print/share dummy or fetch from DB if we had ID.
            // But we don't have ID here easily unless passed.
            // Assuming printed for now or prompt user.
          },
          icon: const Icon(Icons.print),
          label: const Text('Print / Share'),
          style: OutlinedButton.styleFrom(foregroundColor: colors.brandPrimary),
        ),
        SizedBox(width: shapes.spacingMd),
        ElevatedButton(
          onPressed: onNewOrder,
          style: ElevatedButton.styleFrom(
             backgroundColor: colors.brandPrimary,
             foregroundColor: colors.textInverse,
          ),
          child: const Text('New Order'),
        ),
      ],
    );
  }
}
