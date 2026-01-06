import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:savvy_pos/core/config/theme_config.dart';
import 'package:savvy_pos/core/database/database.dart';
import 'package:savvy_pos/features/inventory/data/repositories/product_repository_impl.dart';
import 'package:savvy_pos/features/inventory/domain/entities/modifier.dart';
import 'package:savvy_pos/features/inventory/domain/entities/product.dart';
import 'package:savvy_pos/features/inventory/domain/repositories/i_product_repository.dart';
import 'package:savvy_pos/features/inventory/domain/usecases/get_products.dart';
import 'package:savvy_pos/features/pos/presentation/bloc/cart/cart_bloc.dart';
import 'package:savvy_pos/features/pos/presentation/bloc/cart/cart_event.dart';
import 'package:savvy_pos/features/pos/presentation/bloc/cart/cart_state.dart';
import 'package:savvy_pos/features/pos/presentation/bloc/product/product_bloc.dart';
import 'package:savvy_pos/features/pos/presentation/widgets/cart_sidebar.dart';
import 'package:savvy_pos/features/pos/presentation/widgets/product_card.dart';
import 'package:savvy_pos/features/pos/presentation/widgets/product_modifier_dialog.dart';
import 'package:savvy_pos/bootstrap.dart';
import 'package:get_it/get_it.dart';
import 'package:savvy_pos/core/presentation/widgets/savvy_text.dart';
import 'package:savvy_pos/core/presentation/widgets/savvy_box.dart';
import 'package:badges/badges.dart' as badges;

class ProductGridPage extends StatelessWidget {
  const ProductGridPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Dependency Injection
    final repo = ProductRepositoryImpl(db); 
    final useCase = GetProductsUseCase(repo);

    return BlocProvider(
      create: (context) => ProductBloc(useCase)..add(LoadProducts()),
      child: const ProductGridView(),
    );
  }
}

class ProductGridView extends StatelessWidget {
  const ProductGridView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.savvy;
    // Simple breakpoint check
    final isDesktop = MediaQuery.of(context).size.width >= 900;

    return Scaffold(
      backgroundColor: theme.colors.bgPrimary,
      appBar: AppBar(
        title: SavvyText(
          "Savvy POS", 
          style: SavvyTextStyle.h3,
          color: theme.colors.textPrimary,
        ),
        backgroundColor: theme.colors.bgSecondary,
        elevation: 0,
        iconTheme: IconThemeData(color: theme.colors.textPrimary),
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: theme.colors.textPrimary),
            onPressed: () {},
          ),
          // Mobile Cart Icon
          if (!isDesktop)
            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: BlocBuilder<CartBloc, CartState>(
                builder: (context, state) {
                  return badges.Badge(
                    position: badges.BadgePosition.topEnd(top: 0, end: 3),
                    showBadge: state.items.isNotEmpty,
                    ignorePointer: false,
                    onTap: () {
                      _showCartBottomSheet(context);
                    },
                    badgeContent: Text(
                      state.items.fold<int>(0, (sum, item) => sum + item.quantity).toString(),
                      style: const TextStyle(color: Colors.white, fontSize: 10),
                    ),
                    child: IconButton(
                      icon: Icon(Icons.shopping_cart, color: theme.colors.brandPrimary),
                      onPressed: () => _showCartBottomSheet(context),
                    ),
                  );
                },
              ),
            ),
        ],
      ),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // PRODUCT GRID
          Expanded(
            flex: 7,
            child: BlocBuilder<ProductBloc, ProductState>(
              builder: (context, state) {
                if (state is ProductLoading) {
                  return Center(child: CircularProgressIndicator(color: theme.colors.brandPrimary));
                } else if (state is ProductError) {
                  return Center(child: SavvyText("Error: ${state.message}", color: theme.colors.stateError));
                } else if (state is ProductLoaded) {
                  if (state.products.isEmpty) {
                    return Center(
                      child: SavvyText(
                        "No Products Found",
                        color: theme.colors.textMuted,
                        style: SavvyTextStyle.h3,
                      ),
                    );
                  }
                  return GridView.builder(
                    padding: EdgeInsets.all(theme.shapes.spacingMd),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: _getCrossAxisCount(context, isDesktop),
                      childAspectRatio: 0.75,
                      crossAxisSpacing: theme.shapes.spacingMd,
                      mainAxisSpacing: theme.shapes.spacingMd,
                    ),
                    itemCount: state.products.length,
                    itemBuilder: (context, index) {
                      final product = state.products[index];
                      return ProductCard(
                        product: product,
                        onTap: () => _onProductTapped(context, product),
                      );
                    },
                  );
                }
                return const SizedBox.shrink();
              },
            ),
          ),
          
          // CART SIDEBAR (Desktop/Tablet)
          if (isDesktop)
            const Expanded(
              flex: 3,
              child: CartSidebar(),
            ),
        ],
      ),
      // FAB for Mobile Seeding (Debug)
      floatingActionButton: FloatingActionButton(
        backgroundColor: theme.colors.brandPrimary,
        child: const Icon(Icons.add),
        onPressed: () async {
          final repo = ProductRepositoryImpl(db); 
          final uuid = DateTime.now().millisecondsSinceEpoch.toString();
          final product = Product(
            uuid: uuid,
            name: "Item ${uuid.substring(uuid.length - 4)}",
            price: (double.parse(uuid.substring(uuid.length - 2)) / 10) + 1,
            categoryId: "general",
            trackStock: true,
            colorHex: "#5B8DEF", 
          );
          await repo.saveProduct(product);
        },
      ),
    );
  }

  int _getCrossAxisCount(BuildContext context, bool isDesktop) {
    double width = MediaQuery.of(context).size.width;
    // Adjust logic based on Sidebar presence
    double availableWidth = isDesktop ? width * 0.7 : width; 
    
    if (availableWidth > 1000) return 5;
    if (availableWidth > 800) return 4;
    if (availableWidth > 600) return 3;
    return 2;
  }

  Future<void> _onProductTapped(BuildContext context, Product product) async {
     try {
        final modifiers = await GetIt.I<IProductRepository>().getModifiersForProduct(product.uuid);
        if (!context.mounted) return;

        if (modifiers.isEmpty) {
          context.read<CartBloc>().add(CartEvent.addProduct(product));
        } else {
          final result = await showDialog<List<ModifierItem>>(
            context: context,
            builder: (_) => ProductModifierDialog(product: product),
          );
          
          if (result != null && context.mounted) {
            context.read<CartBloc>().add(CartEvent.addProduct(product, modifiers: result));
          }
        }
     } catch (e) {
       ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error loading options: $e')));
     }
  }

  void _showCartBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => DraggableScrollableSheet(
        initialChildSize: 0.9,
        minChildSize: 0.5,
        maxChildSize: 0.95,
        builder: (_, controller) => ClipRRect(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
          child: const CartSidebar(), // Reusing Sidebar as BottomSheet content
        ),
      ),
    );
  }
}
