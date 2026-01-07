import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:savvy_pos/core/config/theme_config.dart';
import 'package:savvy_pos/core/database/database.dart';
import 'package:savvy_pos/core/presentation/widgets/savvy_widgets.dart'; 
import 'package:savvy_pos/features/inventory/data/repositories/product_repository_impl.dart';
import 'package:savvy_pos/features/inventory/domain/entities/modifier.dart';
import 'package:savvy_pos/features/inventory/domain/entities/product.dart';
import 'package:savvy_pos/features/pos/data/repositories/mock_product_repository.dart';
import 'package:savvy_pos/features/inventory/domain/usecases/get_products.dart';
import 'package:savvy_pos/features/pos/presentation/bloc/cart/cart_bloc.dart';
import 'package:savvy_pos/features/pos/presentation/bloc/cart/cart_event.dart';
import 'package:savvy_pos/features/pos/presentation/bloc/cart/cart_state.dart';
import 'package:savvy_pos/features/pos/presentation/bloc/product/product_bloc.dart';
import 'package:savvy_pos/features/pos/presentation/widgets/cart_view.dart';
import 'package:savvy_pos/features/pos/presentation/widgets/product_card.dart';
import 'package:savvy_pos/features/pos/presentation/widgets/product_modifier_dialog.dart';
import 'package:savvy_pos/features/pos/presentation/widgets/scanner_listener_widget.dart';
import 'package:badges/badges.dart' as badges;

class ProductGridPage extends StatelessWidget {
  const ProductGridPage({super.key});

  @override
  Widget build(BuildContext context) {
    final repo = MockProductRepository(); 
    final useCase = GetProductsUseCase(repo);

    return BlocProvider(
      create: (context) => ProductBloc(useCase)..add(LoadProducts()),
      child: const ProductGridView(),
    );
  }
}

class ProductGridView extends StatefulWidget {
  const ProductGridView({super.key});

  @override
  State<ProductGridView> createState() => _ProductGridViewState();
}

class _ProductGridViewState extends State<ProductGridView> {
  String _selectedCategory = 'All';
  final List<String> _categories = ['All', 'Coffee', 'Drinks', 'Food', 'Merch'];

  @override
  Widget build(BuildContext context) {
    final theme = context.savvy;
    final isDesktop = MediaQuery.of(context).size.width >= 900;

    return Scaffold(
      backgroundColor: theme.colors.bgPrimary,
      body: ScannerListenerWidget(
        onScanned: (barcode) {
           context.read<CartBloc>().add(CartEvent.scanItem(barcode));
        },
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // PRODUCT GRID
            Expanded(
              flex: 7,
              child: NestedScrollView(
                headerSliverBuilder: (context, innerBoxIsScrolled) => [
                  SliverAppBar(
                    title: SavvyText(
                      "Savvy POS", 
                      style: SavvyTextStyle.h3,
                      color: theme.colors.textPrimary,
                    ),
                    backgroundColor: theme.colors.bgSecondary,
                    elevation: 0,
                    pinned: true,
                    floating: true,
                    iconTheme: IconThemeData(color: theme.colors.textPrimary),
                    actions: [
                      IconButton(
                        icon: Icon(Icons.search, color: theme.colors.textPrimary),
                        onPressed: () {},
                      ),
                      if (!isDesktop)
                        Padding(
                          padding: const EdgeInsets.only(right: 16),
                          child: BlocBuilder<CartBloc, CartState>(
                            builder: (context, state) {
                              return badges.Badge(
                                position: badges.BadgePosition.topEnd(top: 0, end: 3),
                                showBadge: state.items.isNotEmpty,
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
                ],
                body: Column(
                  children: [
                    // CATEGORY SELECTOR
                    Container(
                      height: 60,
                      color: theme.colors.bgSecondary,
                      child: ListView.separated(
                        padding: EdgeInsets.symmetric(horizontal: theme.shapes.spacingMd, vertical: 10),
                        scrollDirection: Axis.horizontal,
                        itemCount: _categories.length,
                        separatorBuilder: (_, __) => SizedBox(width: theme.shapes.spacingSm),
                        itemBuilder: (context, index) {
                          final category = _categories[index];
                          final isSelected = _selectedCategory == category;
                          
                          return GestureDetector(
                            onTap: () => setState(() => _selectedCategory = category),
                            child: AnimatedContainer(
                              duration: 300.ms,
                              curve: Curves.easeOutCubic,
                              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                              decoration: BoxDecoration(
                                color: isSelected ? theme.colors.brandPrimary : theme.colors.bgElevated,
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  color: isSelected ? theme.colors.brandPrimary : theme.colors.borderDefault,
                                ),
                                boxShadow: isSelected ? theme.elevations.sm : [],
                              ),
                              alignment: Alignment.center,
                              child: SavvyText(
                                category,
                                style: SavvyTextStyle.labelMedium,
                                color: isSelected ? theme.colors.textInverse : theme.colors.textSecondary,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    
                    // GRID CONTENT
                    Expanded(
                      child: BlocBuilder<ProductBloc, ProductState>(
                        builder: (context, state) {
                          if (state is ProductLoading) {
                            return Center(child: CircularProgressIndicator(color: theme.colors.brandPrimary));
                          } else if (state is ProductError) {
                            return Center(child: SavvyText("Error: ${state.message}", color: theme.colors.stateError));
                          } else if (state is ProductLoaded) {
                            // Filter Logic
                            final filteredProducts = _selectedCategory == 'All' 
                                ? state.products 
                                : state.products.where((p) => 
                                    (p.categoryId?.toLowerCase() ?? '') == _selectedCategory.toLowerCase()
                                  ).toList();

                            if (filteredProducts.isEmpty) {
                              return Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.category_outlined, size: 48, color: theme.colors.textMuted),
                                    SizedBox(height: 16),
                                    SavvyText(
                                      "No items in $_selectedCategory",
                                      color: theme.colors.textMuted,
                                      style: SavvyTextStyle.bodyLarge,
                                    ),
                                  ],
                                ).animate().fadeIn().moveY(begin: 10, end: 0),
                              );
                            }

                            return CustomScrollView(
                              physics: const BouncingScrollPhysics(), // Elastic Scroll
                              slivers: [
                                SliverPadding(
                                  key: ValueKey(_selectedCategory), // Triggers animation reset!
                                  padding: EdgeInsets.all(theme.shapes.spacingMd),
                                  sliver: SliverGrid(
                                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: _getCrossAxisCount(context, isDesktop),
                                      childAspectRatio: 0.75,
                                      crossAxisSpacing: theme.shapes.spacingMd,
                                      mainAxisSpacing: theme.shapes.spacingMd,
                                    ),
                                    delegate: SliverChildBuilderDelegate(
                                      (context, index) {
                                        final product = filteredProducts[index];
                                        return ProductCard(product: product)
                                          .animate(delay: (40 * index).ms) // Staggered Waterfall
                                          .fadeIn(duration: 400.ms, curve: Curves.easeOut)
                                          .moveY(begin: 40, end: 0, duration: 400.ms, curve: Curves.easeOutCubic)
                                          .scale(begin: const Offset(0.9, 0.9), end: const Offset(1, 1));
                                      },
                                      childCount: filteredProducts.length,
                                    ),
                                  ),
                                ),
                                // Bottom padding for scroll
                                SliverToBoxAdapter(child: SizedBox(height: 100)),
                              ],
                            );
                          }
                          return const SizedBox.shrink();
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            
            // DESKTOP CART
            if (isDesktop)
              const Expanded(
                flex: 3,
                child: CartView(),
              ),
          ],
        ),
      ),
      // Use standard FAB for manual adding (Debug/Seed)
      floatingActionButton: FloatingActionButton(
        backgroundColor: theme.colors.brandPrimary,
        child: const Icon(Icons.add),
        onPressed: () {}, // Removed full repo storage logic for brevity, focus on UI
      ),
    );
  }

  int _getCrossAxisCount(BuildContext context, bool isDesktop) {
    double width = MediaQuery.of(context).size.width;
    double availableWidth = isDesktop ? width * 0.7 : width; 
    
    if (availableWidth > 1100) return 5;
    if (availableWidth > 850) return 4;
    if (availableWidth > 600) return 3;
    return 2;
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
          child: const CartView(),
        ),
      ),
    );
  }
}
