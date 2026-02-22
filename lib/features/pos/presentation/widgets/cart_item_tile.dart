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
    final isDiscounted = item.discountedTotal < (item.total - 0.01);

    // ── Swipe-to-delete: LEFT swipe → void/remove the item ──────────────────
    // heavyImpact fires at the moment the swipe threshold is crossed,
    // giving a strong physical signal that a destructive action is confirmed.
    return Dismissible(
      key: ValueKey('cart_item_${item.uuid}'),
      direction: DismissDirection.horizontal,
      confirmDismiss: (direction) async {
        if (direction == DismissDirection.endToStart) {
          // ── LEFT swipe → VOID ──
          await HapticFeedback.heavyImpact();
          context.read<CartBloc>().add(CartEvent.removeFromCart(item.uuid));
        } else if (direction == DismissDirection.startToEnd) {
          // ── RIGHT swipe → HOLD / UNHOLD ──
          await HapticFeedback.mediumImpact();
          context.read<CartBloc>().add(CartEvent.toggleItemHold(item.uuid));
        }
        return false; // BLoC controls list rebuild, not Dismissible
      },
      background:
          _SwipeHoldBackground(isHeld: item.firingStatus == FiringStatus.hold),
      secondaryBackground: _SwipeDeleteBackground(),
      child: _CartItemBody(item: item, isDiscounted: isDiscounted),
    );
  }
}

// ── Swipe background: yellow/orange hold indicator ──────────────────────────
class _SwipeHoldBackground extends StatelessWidget {
  final bool isHeld;
  const _SwipeHoldBackground({required this.isHeld});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: context.savvy.shapes.spacingSm),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: context.savvy.colors.stateWarning,
        borderRadius: BorderRadius.circular(context.savvy.shapes.radiusMd),
      ),
      alignment: Alignment.centerLeft,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(isHeld ? Icons.play_arrow_rounded : Icons.pan_tool_rounded,
              color: Colors.white, size: 24),
          const SizedBox(height: 2),
          Text(
            isHeld ? 'FIRE' : 'HOLD',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 10,
              fontWeight: FontWeight.w900,
              letterSpacing: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}

// ── Swipe background: red trash indicator ────────────────────────────────────
class _SwipeDeleteBackground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: context.savvy.shapes.spacingSm),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: context.savvy.colors.stateError,
        borderRadius: BorderRadius.circular(context.savvy.shapes.radiusMd),
      ),
      alignment: Alignment.centerRight,
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.delete_sweep_rounded, color: Colors.white, size: 24),
          SizedBox(height: 2),
          Text(
            'VOID',
            style: TextStyle(
              color: Colors.white,
              fontSize: 10,
              fontWeight: FontWeight.w900,
              letterSpacing: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}

// ── Main tile body (unchanged layout, extracted for cleanliness) ─────────────
class _CartItemBody extends StatelessWidget {
  final CartItem item;
  final bool isDiscounted;

  const _CartItemBody({required this.item, required this.isDiscounted});

  @override
  Widget build(BuildContext context) {
    final theme = context.savvy;

    final isHeld = item.firingStatus == FiringStatus.hold;

    return Container(
      margin: EdgeInsets.only(bottom: theme.shapes.spacingSm),
      padding: EdgeInsets.all(theme.shapes.spacingSm),
      decoration: BoxDecoration(
        color: isHeld
            ? theme.colors.stateWarning.withValues(alpha: 0.05)
            : theme.colors.bgElevated,
        border: Border.all(
            color: isHeld
                ? theme.colors.stateWarning
                : theme.colors.borderDefault),
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
                    context.read<CartBloc>().add(
                        CartEvent.updateQuantity(item.uuid, item.quantity + 1));
                  },
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 2),
                  child: _AnimatedQuantity(
                    quantity: item.quantity,
                    style: SavvyTextStyle.labelMedium
                        .copyWith(color: theme.colors.textPrimary),
                  ),
                ),
                _QtyButton(
                  icon: Icons.remove,
                  onTap: () {
                    HapticFeedback.selectionClick();
                    context.read<CartBloc>().add(
                        CartEvent.updateQuantity(item.uuid, item.quantity - 1));
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
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (isHeld) ...[
                      Icon(Icons.pan_tool_rounded,
                          size: 14, color: theme.colors.stateWarning),
                      const SizedBox(width: 4),
                    ],
                    Expanded(
                      child: SavvyText(
                        item.product.name,
                        style: SavvyTextStyle.bodyMedium,
                        color: theme.colors.textPrimary,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                if (item.modifiers.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: Wrap(
                      spacing: 4,
                      runSpacing: 4,
                      children: item.modifiers
                          .map((m) => Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 6, vertical: 2),
                                decoration: BoxDecoration(
                                  color: theme.colors.bgPrimary,
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: Text(
                                  m.name,
                                  style: TextStyle(
                                      fontSize: 10,
                                      color: theme.colors.textMuted),
                                ),
                              ))
                          .toList(),
                    ),
                  ),
                if (item.appliedPromoCode != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 6, vertical: 2),
                      decoration: BoxDecoration(
                        color: theme.colors.stateSuccess.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(
                            color: theme.colors.stateSuccess
                                .withValues(alpha: 0.3)),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.discount,
                              size: 10, color: theme.colors.stateSuccess),
                          const SizedBox(width: 4),
                          Text(
                            item.appliedPromoCode!,
                            style: TextStyle(
                                fontSize: 10,
                                color: theme.colors.stateSuccess,
                                fontWeight: FontWeight.bold),
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
                  '\$${item.total.toStringAsFixed(2)}',
                  style: TextStyle(
                    fontSize: 12,
                    decoration: TextDecoration.lineThrough,
                    color: theme.colors.textMuted,
                  ),
                ),
              SavvyText(
                '\$${(isDiscounted ? item.discountedTotal : item.total).toStringAsFixed(2)}',
                style: SavvyTextStyle.labelLarge,
                color: isDiscounted
                    ? theme.colors.stateSuccess
                    : theme.colors.brandPrimary,
              ).animate(key: ValueKey(item.total)).scale(
                    duration: 150.ms, // was 200ms — snappier price update
                    curve: Curves.easeOut,
                    begin: const Offset(1.1, 1.1),
                    end: const Offset(1, 1),
                  ),
              // Swipe hint — subtle, fades in for 3s then disappears on first swipe
              Padding(
                padding: const EdgeInsets.only(top: 2),
                child: Row(
                  children: [
                    Icon(Icons.swipe_left,
                        size: 10,
                        color: theme.colors.textMuted.withValues(alpha: 0.5)),
                    const SizedBox(width: 2),
                    Text(
                      'void',
                      style: TextStyle(
                          fontSize: 9,
                          color: theme.colors.textMuted.withValues(alpha: 0.5)),
                    ),
                  ],
                ),
              ),
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
      duration: const Duration(milliseconds: 150), // was 250ms → snappier
      transitionBuilder: (Widget child, Animation<double> animation) {
        final inTween =
            Tween<Offset>(begin: const Offset(0, 1), end: Offset.zero)
                .animate(animation);
        final outTween =
            Tween<Offset>(begin: const Offset(0, -1), end: Offset.zero)
                .animate(animation);

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
