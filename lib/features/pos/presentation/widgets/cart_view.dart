import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:savvy_pos/core/config/theme/savvy_theme.dart';
import 'package:savvy_pos/core/presentation/widgets/savvy_text.dart';
import 'package:savvy_pos/core/presentation/widgets/savvy_ticker.dart';
import 'package:savvy_pos/features/inventory/domain/entities/product.dart';
import 'package:savvy_pos/features/pos/presentation/bloc/cart/cart_bloc.dart';
import 'package:savvy_pos/features/pos/presentation/bloc/cart/cart_event.dart';
import 'package:savvy_pos/features/pos/presentation/bloc/cart/cart_state.dart';
import 'package:savvy_pos/features/pos/presentation/widgets/cart_item_tile.dart';
import 'package:savvy_pos/features/pos/presentation/widgets/payment/payment_sheet.dart';
import 'package:savvy_pos/features/pos/presentation/widgets/promo_code_input.dart';
import 'package:savvy_pos/features/customers/presentation/bloc/customer_bloc.dart';
import 'package:savvy_pos/features/customers/presentation/bloc/customer_state.dart';
import 'package:savvy_pos/features/loyalty/presentation/bloc/loyalty_bloc.dart';
import 'package:savvy_pos/features/loyalty/presentation/bloc/loyalty_event.dart';
import 'package:savvy_pos/features/customers/presentation/pages/customer_dashboard_page.dart';
import 'package:intl/intl.dart';

class CartView extends StatefulWidget {
  final GlobalKey? cartTargetKey;
  const CartView({super.key, this.cartTargetKey});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  final List<CartItem> _displayedItems = [];
  final Set<String> _swipedItems = {}; // Track items removed via swipe

  bool _isChargePressed = false;
  int _bumpTrigger = 0;

  @override
  Widget build(BuildContext context) {
    final theme = context.savvy;

    return BlocListener<CartBloc, CartState>(
      listener: (context, state) {
        _updateList(state.items);
      },
      child: Column(
        children: [
          // CART HEADER
          Container(
            padding: EdgeInsets.all(theme.shapes.spacingMd),
            decoration: BoxDecoration(
              border:
                  Border(bottom: BorderSide(color: theme.colors.borderDefault)),
            ),
            child: Row(
              children: [
                Icon(Icons.shopping_cart_outlined,
                        key: widget.cartTargetKey,
                        color: theme.colors.brandPrimary)
                    .animate(target: _bumpTrigger.toDouble())
                    .scale(
                        begin: const Offset(1, 1),
                        end: const Offset(1.2, 1.2),
                        duration: 100.ms,
                        curve: Curves.easeOut)
                    .then()
                    .scale(
                        begin: const Offset(1.2, 1.2),
                        end: const Offset(1, 1),
                        duration: 300.ms,
                        curve: Curves.elasticOut),
                SizedBox(width: theme.shapes.spacingSm),
                SavvyText('Current Order',
                    style: SavvyTextStyle.h3, color: theme.colors.textPrimary),
                const Spacer(),
                _CustomerInfoButton(),
              ],
            ),
          ),

          // CART LIST
          Expanded(
            child: DragTarget<Product>(
              onWillAcceptWithDetails: (details) => true,
              onAcceptWithDetails: (details) {
                HapticFeedback.mediumImpact();
                context
                    .read<CartBloc>()
                    .add(CartEvent.addProduct(details.data));
                setState(() => _bumpTrigger++);
              },
              builder: (context, candidateData, rejectedData) {
                final isHovering = candidateData.isNotEmpty;

                return Container(
                  decoration: isHovering
                      ? BoxDecoration(
                          color:
                              theme.colors.brandPrimary.withValues(alpha: 0.05),
                          border: Border.all(
                              color: theme.colors.brandPrimary, width: 2),
                          borderRadius:
                              BorderRadius.circular(theme.shapes.radiusMd),
                        )
                      : null,
                  child: BlocBuilder<CartBloc, CartState>(
                    builder: (context, state) {
                      if (state.items.isEmpty && _displayedItems.isEmpty) {
                        return _EmptyCartState();
                      }

                      return AnimatedList(
                        key: _listKey,
                        padding: EdgeInsets.all(theme.shapes.spacingMd),
                        initialItemCount: _displayedItems.length,
                        itemBuilder: (context, index, animation) {
                          if (index >= _displayedItems.length)
                            return const SizedBox.shrink();
                          final item = _displayedItems[index];

                          // Dismissible wraps the Tile here
                          return SlideTransition(
                            position: Tween<Offset>(
                              begin: const Offset(1, 0),
                              end: Offset.zero,
                            ).animate(CurvedAnimation(
                                parent: animation, curve: Curves.easeOutQuart)),
                            child: FadeTransition(
                              opacity: animation,
                              child: Dismissible(
                                key: ValueKey(item.uuid),
                                direction: DismissDirection.endToStart,
                                dismissThresholds: const {
                                  DismissDirection.endToStart: 0.4
                                },
                                onDismissed: (_) {
                                  HapticFeedback.heavyImpact();
                                  _swipedItems.add(item.uuid); // Mark as swiped
                                  context
                                      .read<CartBloc>()
                                      .add(CartEvent.removeFromCart(item.uuid));
                                },
                                background: _DismissBackground(theme: theme),
                                child: CartItemTile(item: item),
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                );
              },
            ),
          ),

          // STICKY FOOTER
          BlocBuilder<CartBloc, CartState>(
            builder: (context, state) {
              return _CartFooter(
                state: state,
                onChargePressed: (pressed) =>
                    setState(() => _isChargePressed = pressed),
                onChargeTap: () {
                  if (state.items.isEmpty) return;
                  HapticFeedback.mediumImpact();
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                    barrierColor: Colors.black54,
                    builder: (_) => PaymentSheet(totalAmount: state.total),
                  );
                },
                isChargePressed: _isChargePressed,
              );
            },
          ),
        ],
      ),
    );
  }

  void _updateList(List<CartItem> newItems) {
    final oldIds = _displayedItems.map((e) => e.uuid).toSet();
    final newIds = newItems.map((e) => e.uuid).toSet();

    // REMOVALS
    for (int i = _displayedItems.length - 1; i >= 0; i--) {
      final item = _displayedItems[i];
      if (!newIds.contains(item.uuid)) {
        final removedItem = item;
        final wasSwiped = _swipedItems.contains(removedItem.uuid);

        _listKey.currentState?.removeItem(
          i,
          (context, animation) {
            if (wasSwiped) {
              // Already visually gone, just shrinking gap
              // If Dismissible removed it, it height might be 0?
              // Animating Size of empty box collapses it.
              return SizeTransition(
                  sizeFactor: animation,
                  child: const SizedBox(width: double.infinity, height: 0));
            } else {
              // Triggered by button (e.g. qty 0), animate fully
              return SizeTransition(
                sizeFactor: animation,
                child: FadeTransition(
                  opacity: animation,
                  child: CartItemTile(item: removedItem),
                ),
              );
            }
          },
          duration: const Duration(milliseconds: 300),
        );
        _displayedItems.removeAt(i);
        if (wasSwiped) _swipedItems.remove(removedItem.uuid); // Clean up
      }
    }

    // ADDITIONS & UPDATES
    for (int i = 0; i < newItems.length; i++) {
      final item = newItems[i];
      if (!oldIds.contains(item.uuid)) {
        // New
        if (i <= _displayedItems.length) {
          _displayedItems.insert(i, item);
          _listKey.currentState
              ?.insertItem(i, duration: const Duration(milliseconds: 300));
          setState(() => _bumpTrigger++);
        }
      } else {
        // Update
        final existingIndex =
            _displayedItems.indexWhere((e) => e.uuid == item.uuid);
        if (existingIndex != -1) {
          _displayedItems[existingIndex] = item;
        }
      }
    }

    setState(() {});
  }
}

class _DismissBackground extends StatelessWidget {
  final SavvyTheme theme;
  const _DismissBackground({required this.theme});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      padding: EdgeInsets.only(right: theme.shapes.spacingLg),
      margin: EdgeInsets.only(bottom: theme.shapes.spacingSm),
      decoration: BoxDecoration(
        color: theme.colors.stateError,
        borderRadius: BorderRadius.circular(theme.shapes.radiusMd),
      ),
      child:
          Icon(Icons.delete_forever, color: theme.colors.textInverse, size: 32)
              .animate(onPlay: (c) => c.repeat(reverse: true))
              .scale(
                  begin: const Offset(1, 1),
                  end: const Offset(1.2, 1.2),
                  duration: 500.ms),
    );
  }
}

class _CartFooter extends StatelessWidget {
  final CartState state;
  final Function(bool) onChargePressed;
  final VoidCallback onChargeTap;
  final bool isChargePressed;

  const _CartFooter({
    required this.state,
    required this.onChargePressed,
    required this.onChargeTap,
    required this.isChargePressed,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.savvy;
    return Container(
      padding: EdgeInsets.all(theme.shapes.spacingMd),
      decoration: BoxDecoration(
        color: theme.colors.bgSecondary,
        border: Border(top: BorderSide(color: theme.colors.borderDefault)),
        boxShadow: theme.elevations.lg,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
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
                color: theme.colors.stateSuccess),

          _SummaryRow(label: 'Tax (10%)', value: state.tax, isMuted: true),
          Divider(
              height: theme.shapes.spacingLg,
              color: theme.colors.borderDefault),
          _SummaryRow(label: 'Total', value: state.total, isLarge: true),

          SizedBox(height: theme.shapes.spacingMd),

          // CHARGE BUTTON
          GestureDetector(
            onTapDown: (_) => onChargePressed(true),
            onTapUp: (_) => onChargePressed(false),
            onTapCancel: () => onChargePressed(false),
            onTap: state.items.isEmpty ? null : onChargeTap,
            child: AnimatedScale(
              scale: isChargePressed ? 0.95 : 1.0,
              duration: theme.motion.durationFast,
              curve: theme.motion.curveBounce,
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: theme.shapes.spacingMd),
                decoration: BoxDecoration(
                  color: state.items.isEmpty
                      ? theme.colors.textMuted
                      : theme.colors.brandPrimary,
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
  }
}

class _SummaryRow extends StatelessWidget {
  final String label;
  final double value;
  final bool isLarge;
  final bool isMuted;
  final Color? color;

  const _SummaryRow(
      {required this.label,
      required this.value,
      this.isLarge = false,
      this.isMuted = false,
      this.color});

  @override
  Widget build(BuildContext context) {
    final theme = context.savvy;
    final finalColor = color ??
        (isMuted ? theme.colors.textSecondary : theme.colors.textPrimary);

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
          // Living Number
          SavvyTicker(
            value: value,
            style: isLarge
                ? SavvyTextStyle.h3.style
                    .copyWith(fontSize: 24, fontWeight: FontWeight.bold)
                : SavvyTextStyle.bodyMedium.style,
            format: NumberFormat.currency(symbol: '\$'),
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
    // We assume CustomerBloc is provided by parent (PosPage)
    // If not, we should probably handle it safely or local provider if it was isolated (it's not).

    return BlocConsumer<CustomerBloc, CustomerState>(
      listener: (context, state) {
        if (state.selectedCustomer != null) {
          // If customer selected, check loyalty
          context
              .read<LoyaltyBloc>()
              .add(LoyaltyEvent.loadMember(state.selectedCustomer!.uuid));
        }
      },
      builder: (context, state) {
        final customer = state.selectedCustomer;
        final name = customer?.name ?? 'Walk-In';

        return GestureDetector(
          onTap: () {
            // Open Dashboard or Simple Search Dialog
            // For MVP, navigate to DashboardPage (in modal or push)
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              builder: (_) => FractionallySizedBox(
                heightFactor: 0.9,
                child: customer == null
                    ? const CustomerDashboardPage() // If null, default to dashboard which has list
                    : const CustomerDashboardPage(), // In real app, might pass selected uuid
              ),
            );
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: customer != null
                  ? theme.colors.brandPrimary.withValues(alpha: 0.1)
                  : theme.colors.bgElevated,
              border: Border.all(
                  color: customer != null
                      ? theme.colors.brandPrimary
                      : theme.colors.borderDefault),
              borderRadius: BorderRadius.circular(theme.shapes.radiusPill),
            ),
            child: Row(
              children: [
                Icon(customer != null ? Icons.person : Icons.person_outline,
                    size: 16,
                    color: customer != null
                        ? theme.colors.brandPrimary
                        : theme.colors.textSecondary),
                const SizedBox(width: 8),
                SavvyText(name,
                    style: SavvyTextStyle.labelMedium,
                    color: customer != null
                        ? theme.colors.brandPrimary
                        : theme.colors.textPrimary),
                if (customer != null) ...[
                  const SizedBox(width: 4),
                  const Icon(Icons.star,
                      size: 12,
                      color: Colors.amber), // VIP indicator placeholder
                ]
              ],
            ),
          ),
        );
      },
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
          Icon(Icons.shopping_bag_outlined,
                  size: 64,
                  color: theme.colors.textMuted.withValues(alpha: 0.5))
              .animate()
              .scale(duration: 600.ms, curve: Curves.elasticOut),
          SizedBox(height: theme.shapes.spacingMd),
          SavvyText('Cart is empty',
              style: SavvyTextStyle.bodyLarge, color: theme.colors.textMuted),
          SavvyText('Add items to start order',
              style: SavvyTextStyle.bodySmall, color: theme.colors.textMuted),
        ],
      ),
    );
  }
}
