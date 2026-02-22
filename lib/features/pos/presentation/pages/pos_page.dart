import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:savvy_pos/core/config/theme_config.dart';
import 'package:savvy_pos/features/pos/presentation/bloc/cart/cart_bloc.dart';
import 'package:savvy_pos/features/pos/presentation/bloc/cart/cart_state.dart';
import 'package:savvy_pos/features/pos/presentation/bloc/cart/cart_event.dart';
import 'package:savvy_pos/features/inventory/presentation/bloc/product_bloc.dart';
import 'package:savvy_pos/features/pos/presentation/pages/product_grid_page.dart';
import 'package:savvy_pos/features/customers/presentation/bloc/customer_bloc.dart';
import 'package:savvy_pos/features/loyalty/presentation/bloc/loyalty_bloc.dart';
import 'package:savvy_pos/features/delivery/presentation/widgets/delivery_notification_overlay.dart';
import 'package:savvy_pos/features/delivery/domain/entities/delivery_order.dart';
import 'package:savvy_pos/features/delivery/presentation/bloc/delivery_management_bloc.dart';
import 'package:savvy_pos/features/delivery/presentation/bloc/delivery_management_state.dart';
import 'package:savvy_pos/core/presentation/widgets/fly_animation_layer.dart';
import 'package:savvy_pos/features/shifts/presentation/bloc/shift_bloc.dart';
import 'package:savvy_pos/features/shifts/presentation/pages/open_shift_page.dart';
import 'package:savvy_pos/features/shifts/presentation/widgets/close_shift_dialog.dart';
import 'package:savvy_pos/features/shifts/presentation/widgets/cash_management_dialog.dart';
import 'package:savvy_pos/features/kitchen/presentation/pages/kitchen_monitor_page.dart';
import 'package:savvy_pos/core/utils/global_search_delegate.dart';
import 'package:savvy_pos/core/presentation/widgets/savvy_text.dart';
import 'package:savvy_pos/features/pos/presentation/widgets/cart_view.dart';
import 'package:savvy_pos/features/pos/presentation/widgets/liquid_receipt_overlay.dart';
import 'package:savvy_pos/features/pos/presentation/notifications/add_to_cart_notification.dart';
import 'package:savvy_pos/features/inventory/domain/entities/modifier.dart';
import 'package:savvy_pos/features/pos/presentation/widgets/product_modifier_dialog.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';
import 'package:savvy_pos/features/inventory/domain/repositories/i_product_repository.dart';

// ─────────────────────────────────────────────────────────────────────────────
// PosPage: Tablet-First, Split-Screen POS Shell.
//
// Layout:
//   ┌──────────────── 65% ─────────────────┬──── 35% ────┐
//   │  Search bar + Category bar           │             │
//   │  Virtualized Product Grid (SliverGrid│  CartView   │
//   │  + CachedNetworkImage memCache)      │  (Persistent│
//   │                                      │   Panel)    │
//   └──────────────────────────────────────┴─────────────┘
//
//   On narrow screens (<900px): Stack layout with Cart as bottom-sheet FAB.
// ─────────────────────────────────────────────────────────────────────────────
class PosPage extends StatelessWidget {
  final String? heroTag;
  const PosPage({super.key, this.heroTag});

  @override
  Widget build(BuildContext context) {
    Widget content = MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (_) =>
                GetIt.I<ProductBloc>()..add(const ProductEvent.load())),
        BlocProvider(create: (_) => GetIt.I<CustomerBloc>()),
        BlocProvider(create: (_) => GetIt.I<LoyaltyBloc>()),
        BlocProvider(create: (_) => GetIt.I<DeliveryManagementBloc>()),
      ],
      child: const _PosShell(),
    );

    if (heroTag != null) {
      return Hero(
        tag: heroTag!,
        child: Material(type: MaterialType.transparency, child: content),
      );
    }

    return content;
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// _PosShell: Stateful shell managing the AppBar, Drawer, and layout logic.
// ─────────────────────────────────────────────────────────────────────────────
class _PosShell extends StatefulWidget {
  const _PosShell();

  @override
  State<_PosShell> createState() => _PosShellState();
}

class _PosShellState extends State<_PosShell> {
  // Target key for the FlyAnimationLayer's cart landing zone (desktop).
  final GlobalKey _cartTargetKey = GlobalKey();

  // ── Add-to-Cart Handler ──────────────────────────────────────────────────
  // Intercepts AddToCartNotification from the ProductCard widget tree,
  // triggers the parabolic flight animation, then checks for modifiers.
  void _handleAddToCart(
      BuildContext context, AddToCartNotification notification) async {
    // 1. Trigger parabolic-flight animation toward cart target
    FlyAnimationLayer.of(context)?.trigger(
      sourceKey: notification.sourceKey,
      child: Material(
        elevation: 8,
        borderRadius: BorderRadius.circular(context.savvy.shapes.radiusMd),
        clipBehavior: Clip.antiAlias,
        child: notification.product.imageUrl != null
            ? CachedNetworkImage(
                imageUrl: notification.product.imageUrl!,
                fit: BoxFit.cover,
                memCacheWidth: 100,
                memCacheHeight: 100,
              )
            : Container(
                color: context.savvy.colors.brandPrimary,
                alignment: Alignment.center,
                child: SavvyText(
                  notification.product.name.characters.first.toUpperCase(),
                  style: SavvyTextStyle.h3,
                  color: context.savvy.colors.textInverse,
                ),
              ),
      ),
    );

    // 2. Check modifiers before adding to cart
    final product = notification.product;
    final repo = GetIt.I<IProductRepository>();
    final result = await repo.getModifierGroups(product.uuid);

    result.fold(
      (failure) {
        if (mounted) {
          context.read<CartBloc>().add(CartEvent.addProduct(product));
        }
      },
      (modifiers) async {
        if (modifiers.isNotEmpty) {
          if (!mounted) return;
          final selection = await showDialog<List<ModifierItem>>(
            context: context,
            builder: (_) => ProductModifierDialog(product: product),
          );
          if (selection != null && mounted) {
            // ignore: use_build_context_synchronously
            context
                .read<CartBloc>()
                .add(CartEvent.addProduct(product, modifiers: selection));
          }
        } else {
          if (mounted)
            context.read<CartBloc>().add(CartEvent.addProduct(product));
        }
      },
    );
  }

  void _showDeliveryPopup(BuildContext context, DeliveryOrder order) {
    OverlayState? overlayState = Overlay.of(context);
    late OverlayEntry overlayEntry;

    overlayEntry = OverlayEntry(
      builder: (context) {
        return Positioned(
          top: 60,
          left: 0,
          right: 0,
          child: Align(
            alignment: Alignment.topCenter,
            child: DeliveryNotificationOverlay(
              order: order,
              onView: () {
                if (overlayEntry.mounted) overlayEntry.remove();
                // Navigate or open deliveries dialog
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Membuka detail pesanan...')));
              },
              onDismiss: () {
                if (overlayEntry.mounted) overlayEntry.remove();
              },
            ),
          ),
        );
      },
    );

    overlayState.insert(overlayEntry);
    Future.delayed(const Duration(seconds: 15), () {
      if (overlayEntry.mounted) overlayEntry.remove();
    });
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.savvy.colors;

    return Scaffold(
      backgroundColor: colors.bgPrimary,
      appBar: AppBar(
        backgroundColor: colors.bgSecondary,
        elevation: 0,
        title: const Text('Savvy POS',
            style: TextStyle(fontWeight: FontWeight.w700)),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            tooltip: 'Search Products',
            onPressed: () {
              showSearch(
                  context: context, delegate: GlobalSearchDelegate(context));
            },
          ),
          const SizedBox(width: 8),
        ],
      ),
      drawer: _PosDrawer(cartTargetKey: _cartTargetKey),
      body: FlyAnimationLayer(
        child: Builder(
          builder: (innerContext) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              FlyAnimationLayer.of(innerContext)
                  ?.registerTarget(_cartTargetKey);
            });

            return NotificationListener<AddToCartNotification>(
              onNotification: (notification) {
                _handleAddToCart(context, notification);
                return true;
              },
              child:
                  BlocListener<DeliveryManagementBloc, DeliveryManagementState>(
                listenWhen: (prev, curr) =>
                    prev.lastReceivedOrder != curr.lastReceivedOrder &&
                    curr.lastReceivedOrder != null,
                listener: (context, state) {
                  _showDeliveryPopup(context, state.lastReceivedOrder!);
                },
                child: BlocListener<CartBloc, CartState>(
                  listener: (context, state) {
                    if (state.isSuccess) {
                      Navigator.of(context).popUntil((route) => route.isFirst);
                      showGeneralDialog(
                        context: context,
                        barrierDismissible: false,
                        barrierLabel: 'Receipt',
                        barrierColor: Colors.transparent,
                        pageBuilder: (_, __, ___) => LiquidReceiptOverlay(
                          items: state.items,
                          onDismiss: () {
                            context
                                .read<CartBloc>()
                                .add(const CartEvent.clearCart());
                            Navigator.of(context).pop();
                          },
                          onPrint: () => HapticFeedback.mediumImpact(),
                          onEmail: () => HapticFeedback.lightImpact(),
                        ),
                        transitionDuration: Duration.zero,
                      );
                    } else if (state.error != null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(state.error ?? 'Checkout Failed'),
                          backgroundColor: context.savvy.colors.stateError,
                        ),
                      );
                    }
                  },
                  // ── Shift Gate ─────────────────────────────────────────────────
                  child: BlocConsumer<ShiftBloc, ShiftState>(
                    listener: (context, state) {},
                    builder: (context, shiftState) {
                      return shiftState.maybeWhen(
                        loading: () =>
                            const Center(child: CircularProgressIndicator()),
                        orElse: () => const OpenShiftPage(),
                        open: (shift, payIn, payOut, safeDrop, sales) =>
                            _TabletSplitLayout(cartTargetKey: _cartTargetKey),
                      );
                    },
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// _TabletSplitLayout: The core 65/35 split layout.
//   - ≥900px wide: Side-by-side (Left=ProductGrid, Right=CartView)
//   - <900px:     Stack with floating cart button at bottom-right
// ─────────────────────────────────────────────────────────────────────────────
class _TabletSplitLayout extends StatelessWidget {
  final GlobalKey cartTargetKey;
  const _TabletSplitLayout({required this.cartTargetKey});

  @override
  Widget build(BuildContext context) {
    final colors = context.savvy.colors;

    return LayoutBuilder(
      builder: (context, constraints) {
        final isTablet = constraints.maxWidth >= 900;

        if (isTablet) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // ── LEFT 65%: Product Browser ──────────────────────────────
              const Expanded(
                flex: 65,
                child: ProductGridPage(),
              ),
              // Hairline divider
              Container(width: 1, color: colors.borderDefault),
              // ── RIGHT 35%: Persistent Cart Panel ──────────────────────
              Expanded(
                flex: 35,
                child: CartView(cartTargetKey: cartTargetKey),
              ),
            ],
          );
        }

        // ── Mobile: Single-column with FAB cart button ─────────────────
        return Stack(
          children: [
            const ProductGridPage(),
            Positioned(
              bottom: 20,
              right: 20,
              child: _MobileCartFab(key: cartTargetKey),
            ),
          ],
        );
      },
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// _PosDrawer: Operations side-drawer (Shift, Cash, KDS).
// ─────────────────────────────────────────────────────────────────────────────
class _PosDrawer extends StatelessWidget {
  final GlobalKey cartTargetKey;
  const _PosDrawer({required this.cartTargetKey});

  @override
  Widget build(BuildContext context) {
    final colors = context.savvy.colors;
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: colors.brandPrimary),
            child: Text(
              'Operations',
              style: TextStyle(
                  color: colors.textInverse,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
          ),
          ListTile(
            leading: Icon(Icons.add_circle_outline, color: colors.stateSuccess),
            title: const Text('Pay In (Cash Drop)'),
            onTap: () {
              Navigator.pop(context);
              showDialog(
                  context: context,
                  builder: (_) => const CashManagementDialog(type: 'PAY_IN'));
            },
          ),
          ListTile(
            leading:
                Icon(Icons.remove_circle_outline, color: colors.stateError),
            title: const Text('Pay Out (Expenses)'),
            onTap: () {
              Navigator.pop(context);
              showDialog(
                  context: context,
                  builder: (_) => const CashManagementDialog(type: 'PAY_OUT'));
            },
          ),
          const Divider(),
          ListTile(
            leading: Icon(Icons.kitchen, color: colors.brandPrimary),
            title: const Text('Kitchen Monitor (KDS)'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => const KitchenMonitorPage()));
            },
          ),
          const Divider(),
          ListTile(
            leading: Icon(Icons.logout, color: colors.stateError),
            title: const Text('Close Shift'),
            onTap: () {
              Navigator.pop(context);
              final state = context.read<ShiftBloc>().state;
              state.mapOrNull(
                open: (openState) => showDialog(
                  context: context,
                  builder: (_) => CloseShiftDialog(
                    currentShift: openState.shift,
                    totalPayIn: openState.totalPayIn,
                    totalPayOut: openState.totalPayOut,
                    totalSafeDrops: openState.totalSafeDrops,
                    totalSales: openState.totalSales,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// _MobileCartFab: Floating cart button for narrow (phone) screens.
// Bounces on item landing, shows item count + total.
// ─────────────────────────────────────────────────────────────────────────────
class _MobileCartFab extends StatefulWidget {
  const _MobileCartFab({super.key});

  @override
  State<_MobileCartFab> createState() => _MobileCartFabState();
}

class _MobileCartFabState extends State<_MobileCartFab> {
  bool _isPressed = false;
  int _impactTrigger = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      FlyAnimationLayer.of(context)?.onTargetHit.listen((_) {
        if (mounted) setState(() => _impactTrigger++);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        final itemCount =
            state.items.fold(0, (sum, item) => sum + item.quantity);
        final totalStr = state.total.toStringAsFixed(2);
        final theme = context.savvy;

        return GestureDetector(
          onTapDown: (_) => setState(() => _isPressed = true),
          onTapUp: (_) => setState(() => _isPressed = false),
          onTapCancel: () => setState(() => _isPressed = false),
          child: AnimatedScale(
            scale: _isPressed ? 0.9 : 1.0,
            duration: _isPressed
                ? const Duration(milliseconds: 80)
                : const Duration(milliseconds: 200),
            curve: _isPressed ? Curves.easeIn : Curves.elasticOut,
            child: FloatingActionButton.extended(
              onPressed: () {
                WoltModalSheet.show(
                  context: context,
                  minPageHeight: 0.5,
                  maxPageHeight: 0.9,
                  transitionDuration: theme.motion.durationMedium,
                  pageListBuilder: (context) => [
                    WoltModalSheetPage(
                      backgroundColor: theme.colors.bgElevated,
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height * 0.8,
                        child: BlocProvider.value(
                          value: context.read<CartBloc>(),
                          child: const CartView(),
                        ),
                      ),
                    ),
                  ],
                );
              },
              backgroundColor: theme.colors.brandPrimary,
              icon: Icon(Icons.shopping_cart, color: theme.colors.textInverse)
                  .animate(
                    target: _impactTrigger > 0 ? 1 : 0,
                    onPlay: (c) => c.forward(from: 0),
                  )
                  .scale(
                    begin: const Offset(1, 1),
                    end: const Offset(1.4, 1.4),
                    duration: 100.ms,
                    curve: Curves.easeOut,
                  )
                  .then()
                  .scale(
                    begin: const Offset(1.4, 1.4),
                    end: const Offset(1, 1),
                    duration: 300.ms,
                    curve: Curves.elasticOut,
                  ),
              label: Text(
                '$itemCount items · \$$totalStr',
                style: TextStyle(
                  color: theme.colors.textInverse,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
                .animate(
                  target: _impactTrigger > 0 ? 1 : 0,
                  onPlay: (c) => c.forward(from: 0),
                )
                .scaleXY(end: 0.9, duration: 50.ms, curve: Curves.easeIn)
                .then()
                .scaleXY(end: 1.05, duration: 100.ms, curve: Curves.easeOut)
                .then()
                .scaleXY(end: 1.0, duration: 300.ms, curve: Curves.elasticOut),
          ),
        );
      },
    );
  }
}
