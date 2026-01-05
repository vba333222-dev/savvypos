import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:savvy_pos/core/config/theme_config.dart';
import 'package:savvy_pos/features/pos/presentation/bloc/cart/cart_bloc.dart';
import 'package:savvy_pos/features/pos/presentation/bloc/cart/cart_event.dart';
import 'package:savvy_pos/features/pos/presentation/bloc/cart/cart_state.dart';

class CartItemTile extends StatelessWidget {
  final CartItem item;

  const CartItemTile({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // We use context.savvy to access tokens strictly via the Theme Extension
    final colors = context.savvy.colors;
    final shapes = context.savvy.shapes;
    final motion = context.savvy.motion;
    final typography = Theme.of(context).textTheme;

    return Container(
      margin: EdgeInsets.only(bottom: shapes.spacingSm),
      padding: EdgeInsets.symmetric(
        horizontal: shapes.spacingMd,
        vertical: shapes.spacingSm,
      ),
      decoration: BoxDecoration(
        color: colors.bgElevated, // Mapped to 'surface/elevated'
        borderRadius: BorderRadius.circular(shapes.radiusMd),
        border: Border.all(color: colors.borderDefault),
      ),
      child: Row(
        children: [
          // Product Info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.product.name,
                  style: typography.bodyMedium?.copyWith(
                    color: colors.textPrimary,
                    fontWeight: FontWeight.w600,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: shapes.spacingXs),
                Text(
                  // Simple formatting, can strictly use NumberFormat if Intl is imported globally
                  '\$${item.product.price.toStringAsFixed(2)}', 
                  style: typography.bodySmall?.copyWith(
                    color: colors.textSecondary,
                  ),
                ),
              ],
            ),
          ),

          // Qty Controls
          Container(
            decoration: BoxDecoration(
              color: colors.bgPrimary,
              borderRadius: BorderRadius.circular(shapes.radiusPill),
            ),
            padding: EdgeInsets.symmetric(
              horizontal: shapes.spacingXs, 
              vertical: 2, // Slight vertical padding override for alignment
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                _QtyButton(
                  icon: Icons.remove,
                  onTap: () {
                    context.read<CartBloc>().add(
                      CartEvent.updateQuantity(item.product.uuid, item.quantity - 1),
                    );
                  },
                ),
                SizedBox(width: shapes.spacingSm),
                Text(
                  '${item.quantity}',
                  style: typography.bodyMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: shapes.spacingSm),
                _QtyButton(
                  icon: Icons.add,
                  onTap: () {
                    context.read<CartBloc>().add(
                      CartEvent.updateQuantity(item.product.uuid, item.quantity + 1),
                    );
                  },
                ),
              ],
            ),
          ),

          SizedBox(width: shapes.spacingMd),

          // Total
          SizedBox(
            width: 60, // Fixed width for alignment consistency
            child: Text(
              '\$${item.total.toStringAsFixed(2)}',
              style: typography.bodyMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: colors.textPrimary,
              ),
              textAlign: TextAlign.right,
            ),
          ),
        ],
      ),
    ).animate().fadeIn(duration: motion.durationFast).slideX(begin: 0.1, duration: motion.durationFast, curve: motion.curveDefault);
  }
}

class _QtyButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _QtyButton({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final colors = context.savvy.colors;
    
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(context.savvy.shapes.radiusPill),
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Icon(
          icon,
          size: 16,
          color: colors.textSecondary,
        ),
      ),
    );
  }
}
