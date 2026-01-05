import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:savvy_pos/core/config/theme_config.dart';
import 'package:savvy_pos/features/pos/presentation/bloc/cart/cart_bloc.dart';
import 'package:savvy_pos/features/pos/presentation/bloc/cart/cart_state.dart';
import 'package:savvy_pos/features/pos/presentation/bloc/product/product_bloc.dart';
import 'package:savvy_pos/features/pos/presentation/pages/product_grid_page.dart';
import 'package:savvy_pos/features/pos/presentation/widgets/current_order_view.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';

class PosPage extends StatelessWidget {
  const PosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => GetIt.I<ProductBloc>()..add(const ProductEvent.loadProducts())),
        BlocProvider(create: (_) => GetIt.I<CartBloc>()),
      ],
      child: const _PosPageContent(),
    );
  }
}

class _PosPageContent extends StatelessWidget {
  const _PosPageContent();

  @override
  Widget build(BuildContext context) {
    final colors = context.savvy.colors;
    final shapes = context.savvy.shapes;

    return Scaffold(
      backgroundColor: colors.bgPrimary,
      body: LayoutBuilder(
        builder: (context, constraints) {
          final isTablet = constraints.maxWidth > 600;

          if (isTablet) {
            return Row(
              children: [
                // Product Grid (Left 60%)
                const Expanded(
                  flex: 6,
                  child: ProductGridPage(),
                ),
                
                // Vertical Divider
                Container(width: 1, color: colors.borderDefault),

                // Cart (Right 40%)
                const Expanded(
                  flex: 4,
                  child: CurrentOrderView(),
                ),
              ],
            );
          } else {
            // Mobile Layout
            return const Stack(
              children: [
                ProductGridPage(),
                
                // Floating Action Button for Cart
                Positioned(
                  bottom: 16,
                  right: 16,
                  child: _MobileCartFab(),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}

class _MobileCartFab extends StatelessWidget {
  const _MobileCartFab();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        final itemCount = state.items.fold(0, (sum, item) => sum + item.quantity);
        final colors = context.savvy.colors;

        return FloatingActionButton.extended(
          onPressed: () {
            WoltModalSheet.show(
              context: context,
              pageListBuilder: (context) {
                return [
                  WoltModalSheetPage(
                    backgroundColor: colors.bgElevated,
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.8,
                      child: BlocProvider.value(
                        // Re-provide the existing CartBloc to the modal
                        value: context.read<CartBloc>(), 
                        child: const CurrentOrderView(),
                      ),
                    ),
                  ),
                ];
              },
            );
          },
          backgroundColor: colors.brandPrimary,
          icon: Icon(Icons.shopping_cart, color: colors.textInverse),
          label: Text(
            '$itemCount Items',
            style: TextStyle(color: colors.textInverse, fontWeight: FontWeight.bold),
          ),
        );
      },
    );
  }
}
