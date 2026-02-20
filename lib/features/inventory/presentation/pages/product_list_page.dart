import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:savvy_pos/core/config/theme/savvy_theme.dart';
import 'package:savvy_pos/core/presentation/widgets/savvy_text.dart';
import 'package:savvy_pos/features/inventory/presentation/bloc/product_bloc.dart';
import 'package:savvy_pos/features/inventory/presentation/widgets/product_card.dart';
import 'package:savvy_pos/core/presentation/widgets/savvy_empty_state.dart';
import 'package:savvy_pos/features/inventory/presentation/pages/product_editor_page.dart'; // Added

class ProductListPage extends StatelessWidget {
  const ProductListPage({super.key});

  @override
  Widget build(BuildContext context) {
    // BlocProvider is likely already above (in MainShellPage or globally?), 
    // but the previous impl wrapped it. If MainShellPage adds it to _pages list, 
    // it expects the page to be self-contained or provided above.
    // In MainShellPage: routes are just widgets.
    // Best practice: The Page creates its provider if it's a "Page".
    // But since this is a tab view, keep the provider here.
    return BlocProvider(
      create: (context) => GetIt.I<ProductBloc>()..add(const ProductEvent.load()),
      child: const _ProductListView(),
    );
  }
}

class _ProductListView extends StatefulWidget {
  const _ProductListView();

  @override
  State<_ProductListView> createState() => _ProductListViewState();
}

class _ProductListViewState extends State<_ProductListView> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final savvy = context.savvy;
    
    return Scaffold(
      backgroundColor: savvy.colors.bgPrimary,
      appBar: AppBar(
        title: SavvyText('Product Catalog', style: SavvyTextStyle.h3, color: savvy.colors.textPrimary),
        backgroundColor: savvy.colors.bgElevated,
        iconTheme: IconThemeData(color: savvy.colors.textPrimary),
        elevation: 0,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(70),
          child: Padding(
            padding: EdgeInsets.fromLTRB(savvy.shapes.spacingMd, 0, savvy.shapes.spacingMd, savvy.shapes.spacingMd),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search products...',
                hintStyle: savvy.colors.textMuted.let((c) => TextStyle(color: c)),
                prefixIcon: Icon(Icons.search, color: savvy.colors.textSecondary),
                filled: true,
                fillColor: savvy.colors.bgSecondary,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(savvy.shapes.radiusMd),
                  borderSide: BorderSide.none,
                ),
                contentPadding: EdgeInsets.symmetric(horizontal: savvy.shapes.spacingMd, vertical: savvy.shapes.spacingSm),
              ),
              onChanged: (query) {
                if (query.isEmpty) {
                  context.read<ProductBloc>().add(const ProductEvent.load());
                } else {
                  context.read<ProductBloc>().add(ProductEvent.search(query));
                }
              },
            ),
          ),
        ),
      ),
      body: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          return state.maybeWhen(
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (msg) => Center(child: SavvyText(msg, color: savvy.colors.stateError)),
            loaded: (products) {
              if (products.isEmpty) {
                return const SavvyEmptyState(
                  icon: Icons.inventory_2_outlined,
                  title: 'No Products',
                  message: 'Try adjusting your search or add new products.',
                );
              }
              return GridView.builder(
                padding: EdgeInsets.all(savvy.shapes.spacingMd),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Simple responsive logic could apply here too
                  childAspectRatio: 0.75,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                itemCount: products.length,
                itemBuilder: (context, index) {
                  final product = products[index];
                  // Use Shared ProductCard
                  return ProductCard(
                    product: product,
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (_) => ProductEditorPage(product: product)))
                          .then((_) {
                            if (mounted) this.context.read<ProductBloc>().add(const ProductEvent.load());
                          });
                    },
                  ).animate(delay: (50 * index).ms).fadeIn().scale();
                },
              );
            },
            orElse: () => const SizedBox.shrink(),
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
           Navigator.push(context, MaterialPageRoute(builder: (_) => const ProductEditorPage()))
               .then((_) {
                 if (mounted) this.context.read<ProductBloc>().add(const ProductEvent.load());
               });
        },
        backgroundColor: savvy.colors.brandPrimary,
        label: const SavvyText.label('Add Product', color: Colors.white),
        icon: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}

// Extension for simple let usage
extension ScopeFunctions<T> on T {
  R let<R>(R Function(T) block) => block(this);
}
