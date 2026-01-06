import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:savvy_pos/core/config/theme_config.dart';
import 'package:savvy_pos/core/presentation/widgets/savvy_box.dart';
import 'package:savvy_pos/core/presentation/widgets/savvy_text.dart';
import 'package:savvy_pos/features/pos/presentation/bloc/cart/cart_bloc.dart';
import 'package:savvy_pos/features/pos/presentation/bloc/cart/cart_state.dart';
import 'package:savvy_pos/features/pos/presentation/widgets/cart_item_tile.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.savvy;

    return Container(
      color: theme.colors.bgSecondary,
      child: Column(
        children: [
          // Header
          Padding(
            padding: EdgeInsets.all(theme.shapes.spacingMd),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SavvyText("Current Order", style: SavvyTextStyle.h3, color: theme.colors.textPrimary),
                Icon(Icons.shopping_cart, color: theme.colors.brandPrimary),
              ],
            ),
          ),
          Divider(height: 1, color: theme.colors.borderDefault),

          // Items List
          Expanded(
            child: BlocBuilder<CartBloc, CartState>(
              buildWhen: (previous, current) => previous.items != current.items,
              builder: (context, state) {
                if (state.items.isEmpty) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.shopping_bag_outlined, size: 64, color: theme.colors.textMuted),
                        SizedBox(height: theme.shapes.spacingSm),
                        SavvyText("Cart is Empty", style: SavvyTextStyle.bodyLarge, color: theme.colors.textMuted),
                      ],
                    ),
                  );
                }
                
                return ListView.builder(
                  padding: EdgeInsets.all(theme.shapes.spacingSm),
                  itemCount: state.items.length,
                  itemBuilder: (context, index) {
                    final item = state.items[index];
                    // Reversed index for Key not ideal if reordering, but fine for simple stack
                    return KeyedSubtree(
                      key: ValueKey(item.uuid),
                      child: CartItemTile(item: item)
                          .animate(key: ValueKey(item.quantity)) // Animate on qty change slightly?
                          .custom(duration: 300.ms, builder: (context, value, child) => child) // Just placeholder for now
                          .animate() // Entry animation for new items
                          .slideX(begin: 1.0, end: 0, duration: theme.motion.durationFast, curve: theme.motion.curveBounce)
                          .fadeIn(),
                    );
                  },
                );
              },
            ),
          ),

          // Summary Section
          SavvyBox(
            shadow: theme.elevations.floating, // Top shadow effect
            borderRadius: BorderRadius.only(topLeft: Radius.circular(theme.shapes.radiusLg), topRight: Radius.circular(theme.shapes.radiusLg)),
            color: theme.colors.bgElevated,
            child: BlocBuilder<CartBloc, CartState>(
              builder: (context, state) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _SummaryRow("Subtotal", state.subtotal),
                    _SummaryRow("Discount", -state.discount, isDiscount: true),
                    _SummaryRow("Tax", state.tax),
                    Divider(color: theme.colors.borderDefault),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: theme.shapes.spacingSm),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SavvyText("Total", style: SavvyTextStyle.h2, color: theme.colors.textPrimary),
                          SavvyText(
                            "\$${state.total.toStringAsFixed(2)}", 
                            style: SavvyTextStyle.h1, 
                            color: theme.colors.brandPrimary
                          ),
                        ],
                      ),
                    ),
                    
                    // Buttons
                    Row(
                      children: [
                        Expanded(child: _ActionButton(
                          label: "Split", 
                          icon: Icons.call_split,
                          color: theme.colors.brandSecondary,
                          onTap: () {
                             // Trigger Split Dialog
                          },
                        )),
                        SizedBox(width: theme.shapes.spacingSm),
                        Expanded(child: _ActionButton(
                          label: "Park", 
                          icon: Icons.pause_circle_filled,
                          color: theme.colors.brandAccent,
                          onTap: () {
                             // Trigger Park/Hold
                          },
                        )),
                      ],
                    ),
                    SizedBox(height: theme.shapes.spacingSm),
                    SizedBox(
                      width: double.infinity,
                      height: 56,
                      child: ElevatedButton(
                         style: ElevatedButton.styleFrom(
                           backgroundColor: theme.colors.brandPrimary,
                           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(theme.shapes.radiusMd)),
                           elevation: 4,
                         ),
                         onPressed: state.items.isEmpty ? null : () {
                           // Trigger Checkout
                         },
                         child: SavvyText("CHARGE \$${state.total.toStringAsFixed(2)}", color: theme.colors.textInverse, style: SavvyTextStyle.h3),
                      ),
                    )
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _SummaryRow extends StatelessWidget {
  final String label;
  final double amount;
  final bool isDiscount;

  const _SummaryRow(this.label, this.amount, {this.isDiscount = false});

  @override
  Widget build(BuildContext context) {
    final theme = context.savvy;
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SavvyText(label, color: theme.colors.textSecondary),
          SavvyText(
            "\$${amount.abs().toStringAsFixed(2)}", 
            color: isDiscount ? theme.colors.stateSuccess : theme.colors.textPrimary
          ),
        ],
      ),
    );
  }
}

class _ActionButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final Color color;
  final VoidCallback onTap;

  const _ActionButton({required this.label, required this.icon, required this.color, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        backgroundColor: color.withOpacity(0.1),
        foregroundColor: color,
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      onPressed: onTap,
      icon: Icon(icon, size: 18), 
      label: Text(label), // Can use SavvyText but ElevatedButton needs widget
    );
  }
}
