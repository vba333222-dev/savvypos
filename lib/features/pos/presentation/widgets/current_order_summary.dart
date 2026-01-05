import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:savvy_pos/core/config/theme_config.dart';
import 'package:savvy_pos/features/pos/presentation/bloc/cart/cart_bloc.dart';
import 'package:savvy_pos/features/pos/presentation/bloc/cart/cart_state.dart';

class CurrentOrderSummary extends StatelessWidget {
  const CurrentOrderSummary({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colors = context.savvy.colors;
    final shapes = context.savvy.shapes;
    final typography = Theme.of(context).textTheme;

    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        if (state.items.isEmpty) {
          return const SizedBox.shrink(); // Hide if empty
        }

        return Container(
          padding: EdgeInsets.all(shapes.spacingMd),
          decoration: BoxDecoration(
            color: colors.bgElevated,
            border: Border(
              top: BorderSide(color: colors.borderDefault),
            ),
            boxShadow: context.savvy.elevations.lg, // Use strict elevation token
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Totals
              _SummaryRow(label: 'Subtotal', value: '\$${state.subtotal.toStringAsFixed(2)}'),
              SizedBox(height: shapes.spacingXs),
              _SummaryRow(label: 'Tax (10%)', value: '\$${state.tax.toStringAsFixed(2)}'),
              SizedBox(height: shapes.spacingMd),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total',
                    style: typography.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: colors.textPrimary,
                    ),
                  ),
                  Text(
                    '\$${state.total.toStringAsFixed(2)}',
                    style: typography.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: colors.brandPrimary,
                    ),
                  ),
                ],
              ),
              SizedBox(height: shapes.spacingMd),

              // Checkout Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // Start Checkout Flow
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: colors.brandPrimary,
                    foregroundColor: colors.textInverse,
                    padding: EdgeInsets.symmetric(vertical: shapes.spacingMd),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(shapes.radiusMd),
                    ),
                    elevation: 0, 
                  ),
                  child: Text(
                    'Checkout',
                    style: typography.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: colors.textInverse,
                    ),
                  ),
                ),
              ).animate()
               .scale(duration: context.savvy.motion.durationFast, curve: context.savvy.motion.curveBounce), // Antigravity Bounce
            ],
          ),
        );
      },
    );
  }
}

class _SummaryRow extends StatelessWidget {
  final String label;
  final String value;
  
  const _SummaryRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    final colors = context.savvy.colors;
    final typography = Theme.of(context).textTheme;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label, 
          style: typography.bodyMedium?.copyWith(color: colors.textSecondary),
        ),
        Text(
          value,
          style: typography.bodyMedium?.copyWith(
            color: colors.textPrimary,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
