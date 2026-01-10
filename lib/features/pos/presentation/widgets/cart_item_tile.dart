import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:savvy_pos/core/config/theme/savvy_theme.dart';
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
    final isDiscounted = item.discountedTotal < (item.total - 0.01);

    return Container(
      margin: EdgeInsets.only(bottom: theme.shapes.spacingSm),
      padding: EdgeInsets.all(theme.shapes.spacingSm),
      decoration: BoxDecoration(
        color: theme.colors.bgElevated,
        border: Border.all(color: theme.colors.borderDefault),
        borderRadius: BorderRadius.circular(theme.shapes.radiusMd),
        boxShadow: theme.elevations.sm,
      ),
      child: Row(
        children: [
           // QTY CONTROLS
           Container(
             decoration: BoxDecoration(
               color: theme.colors.bgPrimary,
               borderRadius: BorderRadius.circular(theme.shapes.radiusPill),
             ),
             child: Column(
               mainAxisSize: MainAxisSize.min,
               children: [
                 _QtyButton(
                   icon: Icons.add,
                   onTap: () {
                     HapticFeedback.selectionClick();
                     context.read<CartBloc>().add(CartEvent.updateQuantity(item.uuid, item.quantity + 1));
                   },
                 ),
                 Padding(
                   padding: const EdgeInsets.symmetric(vertical: 2),
                   child: _AnimatedQuantity(
                     quantity: item.quantity, 
                     style: SavvyTextStyle.labelMedium.copyWith(color: theme.colors.textPrimary)
                   ),
                 ),
                 _QtyButton(
                   icon: Icons.remove,
                   onTap: () {
                      HapticFeedback.selectionClick();
                      context.read<CartBloc>().add(CartEvent.updateQuantity(item.uuid, item.quantity - 1));
                   },
                 ),
               ],
             ),
           ),
           
           SizedBox(width: theme.shapes.spacingMd),
           
           // INFO
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
                     padding: const EdgeInsets.only(top: 4),
                     child: Wrap(
                       spacing: 4,
                       runSpacing: 4,
                       children: item.modifiers.map((m) => Container(
                         padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                         decoration: BoxDecoration(
                           color: theme.colors.bgPrimary,
                           borderRadius: BorderRadius.circular(4),
                         ),
                         child: Text(
                           m.name,
                           style: TextStyle(fontSize: 10, color: theme.colors.textMuted),
                         ),
                       )).toList(),
                     ),
                   ),
                  if (item.appliedPromoCode != null)
                   Padding(
                     padding: const EdgeInsets.only(top: 4),
                     child: Container(
                       padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                       decoration: BoxDecoration(
                         color: theme.colors.stateSuccess.withValues(alpha: 0.1),
                         borderRadius: BorderRadius.circular(4),
                         border: Border.all(color: theme.colors.stateSuccess.withValues(alpha: 0.3)),
                       ),
                       child: Row(
                         mainAxisSize: MainAxisSize.min,
                         children: [
                           Icon(Icons.discount, size: 10, color: theme.colors.stateSuccess),
                           const SizedBox(width: 4),
                           Text(
                             item.appliedPromoCode!,
                             style: TextStyle(fontSize: 10, color: theme.colors.stateSuccess, fontWeight: FontWeight.bold),
                           ),
                         ],
                       ),
                     ),
                   ),
               ],
             ),
           ),
           
           // PRICE
           Column(
             crossAxisAlignment: CrossAxisAlignment.end,
             children: [
               if (isDiscounted)
                 Text(
                   "\$${item.total.toStringAsFixed(2)}",
                   style: TextStyle(
                     fontSize: 12,
                     decoration: TextDecoration.lineThrough,
                     color: theme.colors.textMuted,
                   ),
                 ),
               SavvyText(
                 "\$${(isDiscounted ? item.discountedTotal : item.total).toStringAsFixed(2)}",
                 style: SavvyTextStyle.labelLarge,
                 color: isDiscounted ? theme.colors.stateSuccess : theme.colors.brandPrimary,
               ).animate(key: ValueKey(item.total)) // Pulse price on change
                .scale(duration: 200.ms, curve: Curves.easeOut, begin: const Offset(1.1, 1.1), end: const Offset(1, 1)),
             ],
           ),
        ],
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
       borderRadius: BorderRadius.circular(theme.shapes.radiusPill),
       child: Padding(
         padding: const EdgeInsets.all(8.0),
         child: Icon(icon, size: 16, color: theme.colors.textSecondary),
       ),
     );
  }
}

class _AnimatedQuantity extends StatelessWidget {
  final int quantity;
  final TextStyle style;

  const _AnimatedQuantity({required this.quantity, required this.style});

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 250),
      transitionBuilder: (Widget child, Animation<double> animation) {
         final inTween = Tween<Offset>(begin: const Offset(0, 1), end: Offset.zero).animate(animation);
         final outTween = Tween<Offset>(begin: const Offset(0, -1), end: Offset.zero).animate(animation);

         if (child.key == ValueKey(quantity)) {
            return SlideTransition(
              position: inTween,
              child: FadeTransition(opacity: animation, child: child),
            );
         } else {
           return SlideTransition(
             position: outTween,
             child: FadeTransition(opacity: animation, child: child),
           );
         }
      },
      child: Text(
        '$quantity',
        key: ValueKey(quantity),
        style: style,
      ),
    );
  }
}
