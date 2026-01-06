import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:savvy_pos/core/config/theme_config.dart';
import 'package:savvy_pos/features/pos/presentation/bloc/cart/cart_bloc.dart';
import 'package:savvy_pos/features/pos/presentation/bloc/cart/cart_state.dart';
import 'package:savvy_pos/features/pos/presentation/widgets/cart_item_tile.dart';
import 'package:savvy_pos/features/pos/presentation/widgets/checkout_success_dialog.dart';
import 'package:savvy_pos/features/pos/presentation/widgets/current_order_summary.dart';

class CurrentOrderView extends StatelessWidget {
  const CurrentOrderView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colors = context.savvy.colors;
    final shapes = context.savvy.shapes;
    final typography = Theme.of(context).textTheme;

    return BlocListener<CartBloc, CartState>(
      listener: (context, state) {
        if (state.isSuccess) {
          // Close Generic BottomSheet if open (Mobile)
          if (Navigator.canPop(context)) {
             Navigator.pop(context);
          }
          
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (_) => CheckoutSuccessDialog(
              order: state.lastCompletedOrder,
              items: state.items,
              onNewOrder: () {
                Navigator.pop(context); // Close Dialog
                // context.read<CartBloc>().add(const CartEvent.clearCart()); // Already cleared in Bloc
              },
            ),
          );
        }
        if (state.error != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.error!),
              backgroundColor: context.savvy.colors.stateError,
            ),
          );
        }
      },
      child: Column(
        children: [
        // Header
        Padding(
          padding: EdgeInsets.all(shapes.spacingMd),
          child: Row(
            children: [
              Icon(Icons.shopping_cart_outlined, color: colors.brandPrimary),
              SizedBox(width: shapes.spacingSm),
              Text(
                'Current Order',
                style: typography.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: colors.textPrimary,
                ),
              ),
              const Spacer(),
              // Clear Button
              IconButton(
                icon: Icon(Icons.delete_outline, color: colors.stateError),
                onPressed: () {
                   // Add confirmation dialog logic here usually
                   // direct clear for now
                   // context.read<CartBloc>().add(const CartEvent.clearCart());
                },
                tooltip: 'Clear Cart',
              ),
            ],
          ),
        ),
        Divider(height: 1, color: colors.borderDefault),

        // List
        Expanded(
          child: BlocBuilder<CartBloc, CartState>(
            builder: (context, state) {
              if (state.items.isEmpty) {
                return _EmptyState();
              }

              return ListView.builder(
                padding: EdgeInsets.all(shapes.spacingMd),
                itemCount: state.items.length,
                itemBuilder: (context, index) {
                  final item = state.items[index];
                  return CartItemTile(
                    key: ValueKey(item.product.uuid), 
                    item: item,
                  );
                },
              );
            },
          ),
        ),

        // Summary & Checkout
        const CurrentOrderSummary(),
        ],
      ),
    );
  }
}

class _EmptyState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final colors = context.savvy.colors;
    final typography = Theme.of(context).textTheme;

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.shopping_bag_outlined, 
            size: 64, 
            color: colors.textMuted.withOpacity(0.5)
          ).animate().scale(duration: 600.ms, curve: Curves.elasticOut),
          const SizedBox(height: 16),
          Text(
            'Cart is empty',
            style: typography.titleMedium?.copyWith(
              color: colors.textMuted,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            'Start adding items to the order',
            style: typography.bodySmall?.copyWith(
              color: colors.textMuted,
            ),
          ),
        ],
      ),
    );
  }
}
