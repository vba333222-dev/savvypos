import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:savvy_pos/core/config/theme_config.dart';
import 'package:savvy_pos/core/presentation/widgets/savvy_box.dart';
import 'package:savvy_pos/core/presentation/widgets/savvy_text.dart';
import 'package:savvy_pos/features/pos/presentation/bloc/cart/cart_bloc.dart';
import 'package:savvy_pos/features/pos/presentation/bloc/cart/cart_event.dart';
import 'package:savvy_pos/features/pos/presentation/bloc/cart/cart_state.dart';

class CartItemTile extends StatelessWidget {
  final CartItem item;

  const CartItemTile({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final theme = context.savvy;

    return Slidable(
      key: ValueKey(item.uuid),
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: (_) {
              context.read<CartBloc>().add(CartEvent.removeFromCart(item.uuid));
            },
            backgroundColor: theme.colors.stateError,
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'Delete',
          ),
        ],
      ),
      child: SavvyBox(
        margin: EdgeInsets.only(bottom: theme.shapes.spacingSm),
        padding: EdgeInsets.all(theme.shapes.spacingSm),
        color: theme.colors.bgElevated,
        border: Border(bottom: BorderSide(color: theme.colors.borderDefault, width: 0.5)),
        shadow: theme.elevations.none, // Flat list style or minimal shadow
        child: Row(
          children: [
            // Qty Control
            Column(
              children: [
                _QtyButton(
                  icon: Icons.add,
                  onTap: () => context.read<CartBloc>().add(CartEvent.updateQuantity(item.uuid, item.quantity + 1)),
                ),
                SavvyText(
                  '${item.quantity}',
                  style: SavvyTextStyle.bodyMedium,
                  color: theme.colors.textPrimary,
                ),
                _QtyButton(
                  icon: Icons.remove,
                  onTap: () => context.read<CartBloc>().add(CartEvent.updateQuantity(item.uuid, item.quantity - 1)),
                ),
              ],
            ),
            SizedBox(width: theme.shapes.spacingSm),
            
            // Product Info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SavvyText(
                    item.product.name,
                    style: SavvyTextStyle.bodyMedium,
                    color: theme.colors.textPrimary,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  if (item.modifiers.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.only(top: 2),
                      child: SavvyText(
                        item.modifiers.map((e) => e.name).join(', '),
                        style: SavvyTextStyle.bodySmall,
                        color: theme.colors.textMuted,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  if (item.note != null && item.note!.isNotEmpty)
                     Padding(
                      padding: const EdgeInsets.only(top: 2),
                      child: SavvyText(
                        "Note: ${item.note}",
                        style: SavvyTextStyle.bodySmall,
                        color: theme.colors.brandAccent,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                ],
              ),
            ),
            
            // Price
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SavvyText(
                  "\$${item.total.toStringAsFixed(2)}",
                  style: SavvyTextStyle.bodyMedium,
                  color: theme.colors.textPrimary,
                ),
                 // Unit price if logic needed?
              ],
            )
          ],
        ),
      ),
    );
  }
}

class _QtyButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _QtyButton({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
     final theme = context.savvy;
     return InkWell(
       onTap: onTap,
       borderRadius: BorderRadius.circular(theme.shapes.radiusSm),
       child: Padding(
         padding: const EdgeInsets.all(4.0),
         child: Icon(icon, size: 16, color: theme.colors.brandPrimary),
       ),
     );
  }
}
