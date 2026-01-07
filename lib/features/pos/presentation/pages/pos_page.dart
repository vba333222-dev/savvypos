import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:savvy_pos/core/config/theme_config.dart';
import 'package:savvy_pos/features/pos/presentation/bloc/cart/cart_bloc.dart';
import 'package:savvy_pos/features/pos/presentation/bloc/cart/cart_state.dart';
import 'package:savvy_pos/features/pos/presentation/bloc/product/product_bloc.dart';
import 'package:savvy_pos/features/pos/presentation/pages/product_grid_page.dart';
import 'package:savvy_pos/features/history/presentation/pages/transaction_history_page.dart';
import 'package:savvy_pos/features/pos/presentation/notifications/add_to_cart_notification.dart';
import 'package:savvy_pos/features/pos/presentation/widgets/current_order_view.dart';
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
    final product = notification.product;
    final modifiers = await MockProductRepository().getModifiersForProduct(product.uuid); // Re-fetch or cache?
    // Note: MockProductRepository call here is sync/async depending on implementation. 
    // Ideally we shouldn't do repo calls in UI. But following existing pattern in grid page:
    
    if (modifiers.isNotEmpty) {
      if (!mounted) return;
      final result = await showDialog<List<ModifierItem>>(
        context: context,
        builder: (_) => ProductModifierDialog(product: product),
      );

      if (result != null && mounted) {
         // After dialog, fly then add
         _runFlightAnimation(product, notification.sourceKey, () {
            context.read<CartBloc>().add(CartEvent.addProduct(product, modifiers: result));
         });
      }
    } else {
      // No modifiers, fly immediate
      _runFlightAnimation(product, notification.sourceKey, () {
         context.read<CartBloc>().add(CartEvent.addProduct(product));
      });
    }
  }

  void _runFlightAnimation(Product product, GlobalKey sourceKey, VoidCallback onComplete) {
    // ... setup
    final targetContext = _cartKey.currentContext; // ... logic ...
    final sourceContext = sourceKey.currentContext;
    
    if (targetContext == null || sourceContext == null) {
      onComplete(); return;
    }

    final sourceBox = sourceContext.findRenderObject() as RenderBox;
    final targetBox = targetContext.findRenderObject() as RenderBox;

    final sourcePos = sourceBox.localToGlobal(Offset.zero);
    final targetPos = targetBox.localToGlobal(Offset.zero);

    // Create Overlay
    late OverlayEntry entry;
    final animationController = AnimationController(
        vsync: this, 
        duration: const Duration(milliseconds: 600) 
    );

    final curve = CurvedAnimation(parent: animationController, curve: Curves.easeInOutCubicEmphasized);

    entry = OverlayEntry(
      builder: (context) {
        return AnimatedBuilder(
          animation: curve,
          builder: (context, child) {
            final currentPos = Offset.lerp(sourcePos, targetPos, curve.value)!;
            final height = 100.0 * (1 - (2 * curve.value - 1).abs()); 
            final arcedPos = Offset(currentPos.dx, currentPos.dy - height);
            final currentSize = Size.lerp(sourceBox.size, const Size(20, 20), curve.value)!;

            return Positioned(
              left: arcedPos.dx,
              top: arcedPos.dy,
              width: currentSize.width,
              height: currentSize.height,
              child: Opacity(
                opacity: 1.0 - (curve.value * 0.5), 
                child: child,
              ),
            );
          },
          child: Material(
            elevation: 8,
            borderRadius: BorderRadius.circular(8),
            clipBehavior: Clip.antiAlias,
            // Try to use true image
            child: product.imageUrl != null 
              ? CachedNetworkImage(imageUrl: product.imageUrl!, fit: BoxFit.cover)
              : Container(
                  color: context.savvy.colors.brandPrimary,
                  alignment: Alignment.center,
                  child: SavvyText(product.name.characters.first.toUpperCase(), color: context.savvy.colors.textInverse),
                ),
          ),
        );
      },
    );
    
    // Better implementation of Child:
    // We should pass the image URL or Widget in notification to be perfect.
    // For now, let's just make a colored box matching brand to represent the item.
    // Or if we can access product, we can show it. Note: 'product' is not in this method scope strictly 
    // unless we pass it. But we just have keys.
    // Let's simplify and just use a Brand Circle.
    
    Overlay.of(context).insert(entry);
    animationController.forward().then((_) {
      entry.remove();
      animationController.dispose();
      onComplete();
    });
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.savvy.colors;
    
    return NotificationListener<AddToCartNotification>(
      onNotification: (notification) {
        _handleAddToCart(context, notification);
        return true; // Stop bubbling
      },
      child: Scaffold(
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
                Navigator.pop(context); // Close drawer
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
                  open: (openState) { // Freezed generates wrapper class or access callback?
                    // MapOrNull passes the state object _Open.
                    // Access fields: openState.shift
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
      body: BlocListener<CartBloc, CartState>(
        listener: (context, state) {
          if (state.status == CartStatus.success) {
            // Close any open dialogs (like payment dialog)
            Navigator.of(context).popUntil((route) => route.isFirst);
            
            // Show Success Dialog
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
             // Redirect if error or closed (though the builder handles closed view)
             if (state is! _Open && state is! _Loading && state is! _Initial) {
                // Can add specific navigation logic if needed
             }
          },
          builder: (context, state) {
            return state.maybeWhen(
              open: (shift, _, __) => LayoutBuilder(
                builder: (context, constraints) {
                  // Requirement: Tablet/Desktop > 900px
                  final isLargeScreen = constraints.maxWidth > 900;
  
                  if (isLargeScreen) {
                    return Row(
                      children: [
                        // Product Grid (Left 65%)
                        const Expanded(
                          flex: 65,
                          child: ProductGridPage(),
                        ),
                        
                        // Vertical Divider
                        Container(width: 1, color: colors.borderDefault),
  
                        // Cart (Right 35%)
                        Expanded(
                          flex: 35,
                          child: CartView(cartTargetKey: _cartKey),
                        ),
                      ],
                    );
                  } else {
                    // Mobile/Small Tablet Layout
                    return Stack(
                      children: [
                        const ProductGridPage(),
                        
                        // Floating Action Button via extended Widget
                        Positioned(
                          bottom: context.savvy.shapes.spacingMd,
                          right: context.savvy.shapes.spacingMd,
                          child: _MobileCartFab(key: _cartKey), // Key on widget itself
                        ),
                      ],
                    );
                  }
                },
              ),
              loading: () => const Center(child: CircularProgressIndicator()),
              orElse: () => const OpenShiftPage(), // Show OpenShiftPage if closed/initial
            );
          },
        ),
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
              icon: Icon(Icons.shopping_cart, color: theme.colors.textInverse),
              label: Text(
                'Items: $itemCount - Total: \$$totalFn',
                style: TextStyle(color: theme.colors.textInverse, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        );
      },
    );
  }
}
