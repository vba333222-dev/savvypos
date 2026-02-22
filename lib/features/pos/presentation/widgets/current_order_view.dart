import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:savvy_pos/core/config/theme_config.dart';
import 'package:savvy_pos/features/pos/presentation/bloc/cart/cart_bloc.dart';
import 'package:savvy_pos/features/pos/presentation/bloc/cart/cart_event.dart';
import 'package:savvy_pos/features/pos/presentation/bloc/cart/cart_state.dart';
import 'package:savvy_pos/features/pos/presentation/widgets/cart_item_tile.dart';
import 'package:savvy_pos/features/pos/presentation/widgets/checkout_success_dialog.dart';
import 'package:savvy_pos/features/customers/domain/entities/customer.dart';
import 'package:savvy_pos/features/customers/presentation/widgets/customer_selection_dialog.dart';
import 'package:savvy_pos/features/pos/presentation/widgets/current_order_summary.dart';

class CurrentOrderView extends StatefulWidget {
  const CurrentOrderView({super.key});

  @override
  State<CurrentOrderView> createState() => _CurrentOrderViewState();
}

class _CurrentOrderViewState extends State<CurrentOrderView> {
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
                // Customer Selector
                BlocBuilder<CartBloc, CartState>(
                  builder: (ctx, state) {
                    final customer = state.customer;
                    return InkWell(
                      onTap: () async {
                        final selected = await showDialog<Customer>(
                          context: ctx, // using builder context for dialog
                          builder: (_) =>
                              const Dialog(child: CustomerSelectionDialog()),
                        );
                        if (selected != null && mounted) {
                          // ignore: use_build_context_synchronously
                          context
                              .read<CartBloc>()
                              .add(CartEvent.selectCustomer(selected));
                        }
                      },
                      borderRadius: BorderRadius.circular(shapes.radiusSm),
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: colors.bgElevated,
                          border: Border.all(color: colors.borderDefault),
                          borderRadius: BorderRadius.circular(shapes.radiusSm),
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.person_outline,
                                size: 16, color: colors.textSecondary),
                            const SizedBox(width: 8),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  customer?.name ?? 'Walk-In',
                                  style: typography.bodyMedium?.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: colors.textPrimary),
                                ),
                                if (customer != null)
                                  Text(
                                    '${customer.totalPoints.toInt()} pts',
                                    style: typography.bodySmall?.copyWith(
                                        fontSize: 10,
                                        color: colors.brandPrimary),
                                  ),
                              ],
                            ),
                            const SizedBox(width: 4),
                            Icon(Icons.arrow_drop_down,
                                color: colors.textSecondary),
                          ],
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(width: 8),
                // Clear Button
                IconButton(
                  icon: Icon(Icons.delete_outline, color: colors.stateError),
                  onPressed: () {
                    context.read<CartBloc>().add(const CartEvent.clearCart());
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
                  size: 64, color: colors.textMuted.withValues(alpha: 0.5))
              .animate()
              .scale(duration: 600.ms, curve: Curves.elasticOut),
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
