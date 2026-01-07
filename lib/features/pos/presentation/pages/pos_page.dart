import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:savvy_pos/core/config/theme_config.dart';
import 'package:savvy_pos/features/pos/presentation/bloc/cart/cart_bloc.dart';
import 'package:savvy_pos/features/pos/presentation/bloc/cart/cart_state.dart';
import 'package:savvy_pos/features/pos/presentation/bloc/product/product_bloc.dart';
import 'package:savvy_pos/features/pos/presentation/pages/product_grid_page.dart';
import 'package:savvy_pos/features/history/presentation/pages/transaction_history_page.dart';
import 'package:savvy_pos/features/pos/presentation/widgets/current_order_view.dart';
import 'package:savvy_pos/core/presentation/widgets/fly_animation_layer.dart';
import 'package:savvy_pos/features/settings/presentation/pages/settings_page.dart';
import 'package:savvy_pos/features/shift/presentation/bloc/shift_bloc.dart';
import 'package:savvy_pos/features/shift/presentation/pages/open_shift_page.dart';
import 'package:savvy_pos/features/shift/presentation/widgets/close_shift_dialog.dart';
import 'package:savvy_pos/features/shift/presentation/widgets/cash_management_dialog.dart';
import 'package:savvy_pos/features/kitchen/presentation/pages/kitchen_monitor_page.dart';
import 'package:savvy_pos/core/utils/global_search_delegate.dart';
import 'package:savvy_pos/core/presentation/widgets/savvy_text.dart';
import 'package:savvy_pos/features/pos/presentation/widgets/cart_view.dart';
import 'package:savvy_pos/features/pos/presentation/widgets/checkout_success_dialog.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';

class PosPage extends StatelessWidget {
  const PosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => GetIt.I<ProductBloc>()..add(const ProductEvent.loadProducts())),
      ],
      child: const _PosPageContent(),
    );
  }
}

class _PosPageContent extends StatefulWidget {
  const _PosPageContent();

  @override
  State<_PosPageContent> createState() => _PosPageContentState();
}

class _PosPageContentState extends State<_PosPageContent> with TickerProviderStateMixin {
  final GlobalKey _cartKey = GlobalKey();

  void _handleAddToCart(BuildContext context, AddToCartNotification notification) async {
    // 1. Trigger Antigravity Flight
    if (notification.sourceKey != null) {
      FlyAnimationLayer.of(context)?.trigger(
        sourceKey: notification.sourceKey!,
        child: Material(
          elevation: 8,
          borderRadius: BorderRadius.circular(context.savvy.shapes.radiusMd),
          clipBehavior: Clip.antiAlias,
          child: notification.product.imageUrl != null
              ? CachedNetworkImage(
                  imageUrl: notification.product.imageUrl!,
                  fit: BoxFit.cover,
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
    }

    // 2. Process Cart Logic
    final product = notification.product;
    final modifiers = await MockProductRepository().getModifiersForProduct(product.uuid); 
    
    if (modifiers.isNotEmpty) {
      if (!mounted) return;
      final result = await showDialog<List<ModifierItem>>(
        context: context,
        builder: (_) => ProductModifierDialog(product: product),
      );

      if (result != null && mounted) {
          context.read<CartBloc>().add(CartEvent.addProduct(product, modifiers: result));
      }
    } else {
       context.read<CartBloc>().add(CartEvent.addProduct(product));
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.savvy.colors;
    
    return Scaffold(
      backgroundColor: colors.bgPrimary,
      appBar: AppBar(
        title: const Text('Savvy POS'),
        backgroundColor: colors.bgPrimary,
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              showSearch(context: context, delegate: GlobalSearchDelegate(context));
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: colors.brandPrimary),
              child: Text('Operations', style: TextStyle(color: colors.textInverse, fontSize: 24)),
            ),
            ListTile(
              leading: Icon(Icons.add_circle_outline, color: colors.stateSuccess),
              title: const Text('Pay In (Cash Drop)'),
              onTap: () {
                Navigator.pop(context);
                showDialog(context: context, builder: (_) => const CashManagementDialog(type: 'PAY_IN'));
              },
            ),
            ListTile(
              leading: Icon(Icons.remove_circle_outline, color: colors.stateError),
              title: const Text('Pay Out (Expenses)'),
              onTap: () {
                Navigator.pop(context);
                showDialog(context: context, builder: (_) => const CashManagementDialog(type: 'PAY_OUT'));
              },
            ),
            const Divider(),
            ListTile(
              leading: Icon(Icons.kitchen, color: colors.brandPrimary),
              title: const Text('Kitchen Monitor (KDS)'),
              onTap: () {
                Navigator.pop(context); 
                Navigator.push(context, MaterialPageRoute(builder: (_) => const KitchenMonitorPage()));
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
                  open: (openState) {
                    showDialog(
                      context: context, 
                      builder: (_) => CloseShiftDialog(currentShift: openState.shift)
                    );
                  }
                );
              },
            ),
          ],
        ),
      ),
      body: FlyAnimationLayer(
        child: Builder(
          builder: (innerContext) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
               FlyAnimationLayer.of(innerContext)?.registerTarget(_cartKey);
            });

            return NotificationListener<AddToCartNotification>(
              onNotification: (notification) {
                _handleAddToCart(context, notification);
                return true;
              },
              child: BlocListener<CartBloc, CartState>(
                listener: (context, state) {
                  if (state.status == CartStatus.success) {
                    Navigator.of(context).popUntil((route) => route.isFirst);
                    
                    showGeneralDialog(
                      context: context,
                      barrierDismissible: true,
                      barrierLabel: 'Success',
                      barrierColor: Colors.black54,
                      pageBuilder: (_, __, ___) => CheckoutSuccessDialog(
                        items: state.items,
                        onNewOrder: () {
                           context.read<CartBloc>().add(const CartEvent.clearCart());
                           Navigator.of(context).pop();
                        },
                      ),
                      transitionBuilder: (ctx, anim1, anim2, child) {
                         return Transform.scale(
                           scale: Curves.elasticOut.transform(anim1.value),
                           child: child,
                         );
                      },
                      transitionDuration: const Duration(milliseconds: 600),
                    );
                  } else if (state.status == CartStatus.failure) {
                     ScaffoldMessenger.of(context).showSnackBar(
                       SnackBar(
                         content: Text(state.errorMessage ?? 'Checkout Failed'),
                         backgroundColor: context.savvy.colors.stateError,
                       )
                     );
                  }
                },
                child: BlocConsumer<ShiftBloc, ShiftState>(
                  listener: (context, state) {
                     if (state is! _Open && state is! _Loading && state is! _Initial) {
                        // Redirect logic if needed
                     }
                  },
                  builder: (context, state) {
                    return state.maybeWhen(
                      open: (shift, _, __) => LayoutBuilder(
                        builder: (context, constraints) {
                          final isLargeScreen = constraints.maxWidth > 900;
          
                          if (isLargeScreen) {
                            return Row(
                              children: [
                                const Expanded(
                                  flex: 65,
                                  child: ProductGridPage(),
                                ),
                                Container(width: 1, color: colors.borderDefault),
                                Expanded(
                                  flex: 35,
                                  child: CartView(cartTargetKey: _cartKey),
                                ),
                              ],
                            );
                          } else {
                            return Stack(
                              children: [
                                const ProductGridPage(),
                                Positioned(
                                  bottom: context.savvy.shapes.spacingMd,
                                  right: context.savvy.shapes.spacingMd,
                                  child: _MobileCartFab(key: _cartKey),
                                ),
                              ],
                            );
                          }
                        },
                      ),
                      loading: () => const Center(child: CircularProgressIndicator()),
                      orElse: () => const OpenShiftPage(),
                    );
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class _MobileCartFab extends StatefulWidget {
  const _MobileCartFab({super.key});

  @override
  State<_MobileCartFab> createState() => _MobileCartFabState();
}

class _MobileCartFabState extends State<_MobileCartFab> {
  bool _isPressed = false;
  int _impactTrigger = 0; // Increment to trigger animation

  @override
  void initState() {
    super.initState();
    // Use addPostFrameCallback to safely access context/ancestor
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
        final itemCount = state.items.fold(0, (sum, item) => sum + item.quantity);
        final totalFn = state.total.toStringAsFixed(2);
        final theme = context.savvy;

        return GestureDetector(
          onTapDown: (_) => setState(() => _isPressed = true),
          onTapUp: (_) => setState(() => _isPressed = false),
          onTapCancel: () => setState(() => _isPressed = false),
          child: AnimatedScale(
            scale: _isPressed ? 0.9 : 1.0,
            duration: theme.motion.durationFast,
            curve: theme.motion.curveBounce,
            child: FloatingActionButton.extended(
              onPressed: () {
                WoltModalSheet.show(
                  context: context,
                  minPageHeight: 0.5,
                  maxPageHeight: 0.9,
                  modalType: WoltModalType.bottomSheet,
                  transitionDuration: theme.motion.durationMedium,
                  pageListBuilder: (context) {
                    return [
                      WoltModalSheetPage(
                        backgroundColor: theme.colors.bgElevated,
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height * 0.8,
                          child: BlocProvider.value(
                            // Re-provide the existing CartBloc to the modal
                            value: context.read<CartBloc>(), 
                            child: const CartView(),
                          ),
                        ),
                      ),
                    ];
                  },
                );
              },
              backgroundColor: theme.colors.brandPrimary,
              icon: Icon(Icons.shopping_cart, color: theme.colors.textInverse)
                  .animate(target: _impactTrigger > 0 ? 1 : 0, onPlay: (c) => c.forward(from: 0))
                  .scale(begin: const Offset(1, 1), end: const Offset(1.4, 1.4), duration: 100.ms, curve: Curves.easeOut)
                  .then().scale(begin: const Offset(1.4, 1.4), end: const Offset(1, 1), duration: 300.ms, curve: Curves.elasticOut),
              label: Text(
                'Items: $itemCount - Total: \$$totalFn',
                style: TextStyle(color: theme.colors.textInverse, fontWeight: FontWeight.bold),
              ),
            )
            .animate(target: _impactTrigger > 0 ? 1 : 0, onPlay: (c) => c.forward(from: 0))
             // Squash effect on correct landing? Or Shake? User said "Squash (tekanan) or Shake (guncangan) ... scale 1.0 -> 1.2 -> 1.0"
             // I'll apply the scale to the FAB itself too or just icon. User said "Icon/FAB".
             // Let's do a subtle bounce on the FAB logic.
            .scaleXY(end: 0.9, duration: 50.ms, curve: Curves.easeIn) // Squash down
            .then().scaleXY(end: 1.05, duration: 100.ms, curve: Curves.easeOut) // Spring up
            .then().scaleXY(end: 1.0, duration: 300.ms, curve: Curves.elasticOut), // Settle
          ),
        );
      },
    );
  }
}
