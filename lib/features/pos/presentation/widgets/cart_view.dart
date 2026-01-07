import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:savvy_pos/core/config/theme/savvy_theme.dart';
import 'package:savvy_pos/core/presentation/widgets/savvy_text.dart';
import 'package:savvy_pos/features/pos/presentation/bloc/cart/cart_bloc.dart';
import 'package:savvy_pos/features/pos/presentation/bloc/cart/cart_state.dart';
import 'package:savvy_pos/features/pos/presentation/widgets/cart_item_tile.dart';
import 'package:savvy_pos/features/pos/presentation/widgets/cart_item_tile.dart';
import 'package:savvy_pos/features/pos/presentation/widgets/payment_methods_sheet.dart';
import 'package:savvy_pos/features/pos/presentation/widgets/promo_code_input.dart';

class CartView extends StatefulWidget {
  final GlobalKey? cartTargetKey;
  const CartView({Key? key, this.cartTargetKey}) : super(key: key);

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
              Icon(Icons.shopping_cart_outlined, key: widget.cartTargetKey, color: theme.colors.brandPrimary),
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
            // Assuming state.total is GRAND TOTAL (After Tax & Discount).
            
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
                  // PROMO INPUT
                  const PromoCodeInput(),

                  SizedBox(height: theme.shapes.spacingMd),

                  _SummaryRow(label: 'Subtotal', value: state.subtotal, isMuted: true),
                  if (state.discount > 0)
                    _SummaryRow(
                      label: 'Discount', 
                      value: -state.discount, 
                      isMuted: false, 
                      color: theme.colors.stateSuccess
                    ),

                  _SummaryRow(label: 'Tax (10%)', value: state.tax, isMuted: true), 
                  Divider(height: theme.shapes.spacingLg, color: theme.colors.borderDefault),
                  Divider(height: theme.shapes.spacingLg, color: theme.colors.borderDefault),
                  _SummaryRow(label: 'Total', value: state.total, isLarge: true),

                  SizedBox(height: theme.shapes.spacingMd),
                  
                  // CHARGE BUTTON
                  GestureDetector(
                    onTapDown: (_) => setState(() => _isChargePressed = true),
                    onTapUp: (_) => setState(() => _isChargePressed = false),
                    onTapCancel: () => setState(() => _isChargePressed = false),
                    onTap: state.items.isEmpty 
                      ? null 
                      : () {
                          showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            barrierColor: Colors.black54,
                            builder: (_) => PaymentMethodsSheet(totalAmount: state.total),
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
                          'Charge \$${(state.total).toStringAsFixed(2)}',
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

}



class _SummaryRow extends StatelessWidget {
  final String label;
  final double value;
  final bool isLarge;
  final bool isMuted;
  final Color? color;

  const _SummaryRow({required this.label, required this.value, this.isLarge = false, this.isMuted = false, this.color});

  @override
  Widget build(BuildContext context) {
    final theme = context.savvy;
    final finalColor = color ?? (isMuted ? theme.colors.textSecondary : theme.colors.textPrimary);
    
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SavvyText(
            label, 
            style: isLarge ? SavvyTextStyle.h3 : SavvyTextStyle.bodyMedium,
            color: finalColor,
          ),
          SavvyText(
            '\$${value.toStringAsFixed(2)}', 
            style: isLarge ? SavvyTextStyle.h3 : SavvyTextStyle.bodyMedium,
            color: isLarge ? theme.colors.brandPrimary : finalColor,
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
