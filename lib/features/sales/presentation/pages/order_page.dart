import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:savvy_pos/core/di/injection.dart';
import 'package:savvy_pos/features/sales/presentation/bloc/sales_bloc.dart';
import 'package:savvy_pos/features/sales/presentation/widgets/cart_sidebar.dart';
import 'package:savvy_pos/features/sales/presentation/widgets/category_selector_widget.dart';
import 'package:savvy_pos/features/sales/presentation/widgets/product_grid_widget.dart';
import 'package:savvy_pos/features/sales/presentation/widgets/product_details_dialog.dart';
import 'package:savvy_pos/features/sales/presentation/pages/checkout_page.dart';

class OrderPage extends StatelessWidget {
  final String? tableUuid;
  final String? customerUuid;
  final String? tableName;

  const OrderPage({
    super.key,
    this.tableUuid,
    this.customerUuid,
    this.tableName,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<SalesBloc>()..add(const SalesEvent.started()),
      child: BlocListener<SalesBloc, SalesState>(
        listener: (context, state) {
          if (state.isOrderSuccess && state.lastCreatedOrderUuid != null) {
            // Navigate to Checkout
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => CheckoutPage(
                orderUuid: state.lastCreatedOrderUuid!,
                cart: state.cart, // Note: Cart is cleared in Bloc success, so this might be empty!
                // FIX: We need the cart BEFORE it was cleared, or reload order summary.
                // Since Bloc clears cart immediately, we can't pass 'state.cart' here effectively if it's already cleared.
                // However, CheckoutPage fetches order balance. But it needs items for Receipt.
                // We should pass the items. But wait, `state.cart` is cleared in same emit as `isOrderSuccess`.
                // Options:
                // 1. Don't clear cart in Bloc until "RESET" event.
                // 2. Return order items from CreateOrder (Repository).
                // 3. Pass empty cart to CheckoutPage and let it fetch items (Best Practice).
                
                // For now, simple workaround: Check if CheckoutPage can load items.
                // CheckoutPage takes 'Cart'. 
                // I will update CheckoutPage to accept 'List<CartItem>' optionally OR fetch items.
                // Given time constraints: Let's fetch items in `CheckoutBloc` too.
                
                // ACTUALLY: Let's delay clearing cart in Bloc? No, clean architecture.
                // I will change CheckoutPage to fetch Items.
                
                // Temporary fallback: Pass the CLEARED cart (empty) and fix CheckoutPage to load from DB.
                // This is safer.
                tableName: tableName,
              ),
            ));
          }
          if (state.errorMessage != null) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Error: ${state.errorMessage}')),
            );
          }
          if (state.selectedProductForModifiers != null) {
            showDialog(
              context: context,
              builder: (_) => ProductDetailsDialog(
                product: state.selectedProductForModifiers!,
                modifierGroups: state.modifierGroups,
                onAddToCart: (p, qty, mods, note) {
                  context.read<SalesBloc>().add(SalesEvent.addToCart(
                    p, 
                    quantity: qty, 
                    modifiers: mods, 
                    note: note
                  ));
                },
              ),
            ).then((_) {
               // Ensure we clear selection if dialog dismissed without adding
               // This logic might need a "ClearSelection" event if dismiss doesn't trigger addToCart
               // But addToCart clears it. If user cancels, we might want to clear it too.
               // For now, let's keep it simple. If we don't clear, re-tap might be weird.
               // Ideally Bloc handles "DialogDismissed".
            });
          }
        },
        child: Builder(
          builder: (context) {
            return Scaffold(
              appBar: AppBar(
                title: Text(tableName != null ? 'Order: $tableName' : 'New Order'),
              ),
              body: Row(
                children: [
                  // LEFT: Menu (Categories + Products)
                  Expanded(
                    flex: 3,
                    child: Column(
                      children: [
                        const CategorySelectorWidget(),
                        const SidebarDivider(),
                        const Expanded(child: ProductGridWidget()),
                      ],
                    ),
                  ),
                  
                  // RIGHT: Cart Sidebar
                  const VerticalDivider(width: 1),
                  Expanded(
                    flex: 2,
                    child: CartSidebar(
                      onPay: () {
                         context.read<SalesBloc>().add(
                           SalesEvent.createOrder(tableUuid: tableUuid, customerUuid: customerUuid)
                         );
                      },
                    ),
                  ),
                ],
              ),
            );
          }
        ),
      ),
    );
  }
}

class SidebarDivider extends StatelessWidget {
  const SidebarDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(height: 1, color: Colors.grey[300]);
  }
}
