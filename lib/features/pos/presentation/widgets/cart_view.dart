import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:savvy_pos/core/config/theme/savvy_theme.dart';
import 'package:savvy_pos/core/presentation/widgets/savvy_text.dart';
import 'package:savvy_pos/features/pos/presentation/bloc/cart/cart_bloc.dart';
import 'package:savvy_pos/features/pos/presentation/bloc/cart/cart_state.dart';
import 'package:savvy_pos/features/pos/presentation/widgets/cart_item_tile.dart';
import 'package:savvy_pos/features/pos/presentation/widgets/payment_methods_dialog.dart';

class CartView extends StatefulWidget {
  const CartView({Key? key}) : super(key: key);

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  bool _isChargePressed = false;

  @override
  Widget build(BuildContext context) {
    final theme = context.savvy;

    return Column(
      children: [
        // CART HEADER
        Container(
          padding: EdgeInsets.all(theme.shapes.spacingMd),
          decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: theme.colors.borderDefault)),
          ),
          child: Row(
            children: [
              Icon(Icons.shopping_cart_outlined, color: theme.colors.brandPrimary),
              SizedBox(width: theme.shapes.spacingSm),
              SavvyText('Current Order', style: SavvyTextStyle.h3, color: theme.colors.textPrimary),
              const Spacer(),
              _CustomerInfoButton(), // Simplified extract or inline
            ],
          ),
        ),

        // CART LIST
        Expanded(
          child: BlocBuilder<CartBloc, CartState>(
            builder: (context, state) {
              if (state.items.isEmpty) {
                return _EmptyCartState();
              }
              return ListView.separated(
                padding: EdgeInsets.all(theme.shapes.spacingMd),
                itemCount: state.items.length,
                separatorBuilder: (_, __) => SizedBox(height: theme.shapes.spacingSm),
                itemBuilder: (context, index) {
                  return CartItemTile(item: state.items[index]);
                },
              );
            },
          ),
        ),

        // STICKY SUMMARY & FOOTER
        BlocBuilder<CartBloc, CartState>(
          builder: (context, state) {
            double tax = state.total * 0.1; // Dummy Tax Logic if not in items
            // Actual calculation usually in BLOC, but for UI display:
            // Assuming state.total is GRAND TOTAL.
            
            return Container(
              padding: EdgeInsets.all(theme.shapes.spacingMd),
              decoration: BoxDecoration(
                color: theme.colors.bgSecondary,
                border: Border(top: BorderSide(color: theme.colors.borderDefault)),
                boxShadow: theme.elevations.lg, // Elevation up
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min, // Sticky at bottom
                children: [
                  _SummaryRow(label: 'Subtotal', value: state.total, isMuted: true),
                  _SummaryRow(label: 'Tax (10%)', value: tax, isMuted: true), 
                  Divider(height: theme.shapes.spacingLg, color: theme.colors.borderDefault),
                  _SummaryRow(label: 'Total', value: state.total + tax, isLarge: true), // Example logic

                  SizedBox(height: theme.shapes.spacingMd),
                  
                  // CHARGE BUTTON
                  GestureDetector(
                    onTapDown: (_) => setState(() => _isChargePressed = true),
                    onTapUp: (_) => setState(() => _isChargePressed = false),
                    onTapCancel: () => setState(() => _isChargePressed = false),
                    onTap: state.items.isEmpty 
                      ? null 
                      : () {
                          showDialog(
                            context: context,
                            builder: (_) => PaymentMethodsDialog(totalAmount: state.total + tax),
                          );
                        },
                    child: AnimatedScale(
                      scale: _isChargePressed ? 0.95 : 1.0,
                      duration: theme.motion.durationFast,
                      curve: theme.motion.curveBounce,
                      child: Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(vertical: theme.shapes.spacingMd),
                        decoration: BoxDecoration(
                          color: state.items.isEmpty ? theme.colors.textMuted : theme.colors.brandPrimary,
                          borderRadius: BorderRadius.circular(theme.shapes.radiusMd),
                          boxShadow: state.items.isEmpty ? [] : theme.elevations.md,
                        ),
                        alignment: Alignment.center,
                        child: SavvyText(
                          'Charge \$${(state.total + tax).toStringAsFixed(2)}',
                          style: SavvyTextStyle.h3,
                          color: theme.colors.textInverse,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}

class _SummaryRow extends StatelessWidget {
  final String label;
  final double value;
  final bool isLarge;
  final bool isMuted;

  const _SummaryRow({required this.label, required this.value, this.isLarge = false, this.isMuted = false});

  @override
  Widget build(BuildContext context) {
    final theme = context.savvy;
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SavvyText(
            label, 
            style: isLarge ? SavvyTextStyle.h3 : SavvyTextStyle.bodyMedium,
            color: isMuted ? theme.colors.textSecondary : theme.colors.textPrimary,
          ),
          SavvyText(
            '\$${value.toStringAsFixed(2)}', 
            style: isLarge ? SavvyTextStyle.h3 : SavvyTextStyle.bodyMedium,
            color: isLarge ? theme.colors.brandPrimary : (isMuted ? theme.colors.textSecondary : theme.colors.textPrimary),
          ),
        ],
      ),
    );
  }
}

class _CustomerInfoButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = context.savvy;
    return Container(
       padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
       decoration: BoxDecoration(
         color: theme.colors.bgElevated,
         border: Border.all(color: theme.colors.borderDefault),
         borderRadius: BorderRadius.circular(theme.shapes.radiusPill),
       ),
       child: Row(
         children: [
           Icon(Icons.person_outline, size: 16, color: theme.colors.textSecondary),
           SizedBox(width: 8),
           SavvyText('Walk-In', style: SavvyTextStyle.labelMedium),
         ],
       ),
    );
  }
}

class _EmptyCartState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = context.savvy;
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.shopping_bag_outlined, size: 64, color: theme.colors.textMuted.withOpacity(0.5))
            .animate().scale(duration: 600.ms, curve: Curves.elasticOut),
          SizedBox(height: theme.shapes.spacingMd),
          SavvyText('Cart is empty', style: SavvyTextStyle.bodyLarge, color: theme.colors.textMuted),
          SavvyText('Add items to start order', style: SavvyTextStyle.bodySmall, color: theme.colors.textMuted),
        ],
      ),
    );
  }
}
