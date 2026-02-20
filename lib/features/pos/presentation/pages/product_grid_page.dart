import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:savvy_pos/core/config/theme_config.dart';
import 'package:savvy_pos/core/presentation/widgets/savvy_text.dart';
import 'package:savvy_pos/core/presentation/widgets/savvy_empty_state.dart';
import 'package:savvy_pos/core/presentation/widgets/savvy_shimmer.dart';
import 'package:savvy_pos/features/inventory/presentation/bloc/product_bloc.dart';
import 'package:savvy_pos/features/inventory/presentation/widgets/product_card.dart';
import 'package:savvy_pos/features/pos/presentation/bloc/cart/cart_bloc.dart';
import 'package:savvy_pos/features/pos/presentation/bloc/cart/cart_event.dart';
import 'package:savvy_pos/features/pos/presentation/notifications/add_to_cart_notification.dart';
import 'package:savvy_pos/features/pos/presentation/widgets/scanner_listener_widget.dart';
import 'package:savvy_pos/core/utils/sound_helper.dart';
import 'package:get_it/get_it.dart';

// ─────────────────────────────────────────────────────────────────────────────
// ProductGridPage: Pure left-panel for the POS tablet layout.
// The parent (PosPage) owns the 65/35 split; this widget is ONLY the left side.
// ─────────────────────────────────────────────────────────────────────────────
class ProductGridPage extends StatefulWidget {
  const ProductGridPage({super.key});

  @override
  State<ProductGridPage> createState() => _ProductGridPageState();
}

class _ProductGridPageState extends State<ProductGridPage> {
  String _selectedCategory = 'All';
  String _lastSelectedCategory = 'All';
  List<String> _categories = ['All'];
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.savvy;

    return ScannerListenerWidget(
      onScanned: (barcode) {
        context.read<CartBloc>().add(CartEvent.scanItem(barcode));
      },
      child: NotificationListener<AddToCartNotification>(
        onNotification: (notification) {
          context
              .read<CartBloc>()
              .add(CartEvent.addProduct(notification.product));
          return true;
        },
        child: BlocBuilder<ProductBloc, ProductState>(
          builder: (context, state) {
            return state.maybeWhen(
              loading: () => _buildLoadingGrid(theme),
              error: (msg) => Center(
                child: SavvyText('Error: $msg', color: theme.colors.stateError),
              ),
              loaded: (products) {
                // Determine if we are currently searching
                final isSearching = _searchController.text.isNotEmpty;

                if (!isSearching) {
                  // Extract unique categories from product list dynamically
                  // ONLY when not searching, so search results don't destroy category list
                  final categorySet = <String>{'All'};
                  for (final p in products) {
                    if (p.categoryId.isNotEmpty) {
                      categorySet.add(
                        p.categoryId[0].toUpperCase() +
                            p.categoryId.substring(1).toLowerCase(),
                      );
                    }
                  }
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    final newList = categorySet.toList();
                    if (mounted &&
                        newList.toString() != _categories.toString()) {
                      setState(() => _categories = newList);
                    }
                  });
                }

                // Apply category filter (if searching, show ALL search results regardless of category)
                final applyCategory = isSearching ? 'All' : _selectedCategory;
                final filtered = applyCategory == 'All'
                    ? products
                    : products
                        .where(
                          (p) =>
                              p.categoryId.toLowerCase() ==
                              applyCategory.toLowerCase(),
                        )
                        .toList();

                return Column(
                  children: [
                    // Inline Search Bar for POS Transaction Screen (Zero Latency)
                    Padding(
                      padding: EdgeInsets.fromLTRB(theme.shapes.spacingMd,
                          theme.shapes.spacingMd, theme.shapes.spacingMd, 0),
                      child: TextField(
                        controller: _searchController,
                        decoration: InputDecoration(
                          hintText: 'Cari Produk (SKU / Nama)...',
                          hintStyle: TextStyle(color: theme.colors.textMuted),
                          prefixIcon: Icon(Icons.search,
                              color: theme.colors.textSecondary),
                          suffixIcon: isSearching
                              ? IconButton(
                                  icon: const Icon(Icons.clear),
                                  onPressed: () {
                                    _searchController.clear();
                                    context
                                        .read<ProductBloc>()
                                        .add(const ProductEvent.load());
                                    setState(() {
                                      _selectedCategory = _lastSelectedCategory;
                                    });
                                  },
                                )
                              : null,
                          filled: true,
                          fillColor: theme.colors.bgSecondary,
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.circular(theme.shapes.radiusMd),
                            borderSide: BorderSide.none,
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 12),
                        ),
                        onChanged: (val) {
                          if (val.isEmpty) {
                            context
                                .read<ProductBloc>()
                                .add(const ProductEvent.load());
                            setState(() {
                              _selectedCategory = _lastSelectedCategory;
                            });
                          } else {
                            if (!isSearching) {
                              // Just started searching, backup category
                              _lastSelectedCategory = _selectedCategory;
                            }
                            context
                                .read<ProductBloc>()
                                .add(ProductEvent.search(val));
                            setState(
                                () {}); // trigger rebuild to show clear button
                          }
                        },
                      ),
                    ),
                    _CategoryBar(
                      categories: _categories,
                      // Visually select 'All' while searching, otherwise selected
                      selectedCategory: isSearching ? 'All' : _selectedCategory,
                      onCategorySelected: (cat) {
                        HapticFeedback.lightImpact();
                        if (isSearching) {
                          // Clear search when clicking a category directly
                          _searchController.clear();
                          context
                              .read<ProductBloc>()
                              .add(const ProductEvent.load());
                        }
                        setState(() {
                          _lastSelectedCategory = cat;
                          _selectedCategory = cat;
                        });
                      },
                    ),
                    Expanded(
                      child: filtered.isEmpty
                          ? _buildEmptyState(theme)
                          : _VirtualizedProductGrid(
                              key: ValueKey(
                                  _selectedCategory), // Resets animation on category switch
                              filteredProducts: filtered,
                            ),
                    ),
                  ],
                );
              },
              orElse: () => const SizedBox.shrink(),
            );
          },
        ),
      ),
    );
  }

  Widget _buildLoadingGrid(dynamic theme) {
    return Column(
      children: [
        // Skeleton category bar
        Container(
          height: 60,
          color: theme.colors.bgSecondary,
        ),
        Expanded(
          child: GridView.builder(
            padding: EdgeInsets.all(theme.shapes.spacingMd),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: _defaultCrossAxisCount(context),
              childAspectRatio: 0.75,
              crossAxisSpacing: theme.shapes.spacingMd,
              mainAxisSpacing: theme.shapes.spacingMd,
            ),
            itemCount: 12,
            itemBuilder: (_, __) => const ProductCardShimmer(),
          ),
        ),
      ],
    );
  }

  Widget _buildEmptyState(dynamic theme) {
    GetIt.I<SoundHelper>().playEmpty();
    return SavvyEmptyState(
      icon: Icons.search_off,
      title: 'No Results Found',
      message:
          'No items found in "$_selectedCategory".\nTry a different category.',
      actionLabel: 'Clear Filter',
      onAction: () => setState(() => _selectedCategory = 'All'),
    );
  }

  int _defaultCrossAxisCount(BuildContext context) {
    final w = MediaQuery.of(context).size.width * 0.65; // 65% of screen
    if (w > 1000) return 5;
    if (w > 780) return 4;
    if (w > 560) return 3;
    return 2;
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Horizontal Category Tab Bar
// ─────────────────────────────────────────────────────────────────────────────
class _CategoryBar extends StatelessWidget {
  final List<String> categories;
  final String selectedCategory;
  final ValueChanged<String> onCategorySelected;

  const _CategoryBar({
    required this.categories,
    required this.selectedCategory,
    required this.onCategorySelected,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.savvy;
    return Container(
      height: 56,
      color: theme.colors.bgSecondary,
      child: ListView.separated(
        padding: EdgeInsets.symmetric(
          horizontal: theme.shapes.spacingMd,
          vertical: 8,
        ),
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        separatorBuilder: (_, __) => SizedBox(width: theme.shapes.spacingSm),
        itemBuilder: (context, index) {
          final cat = categories[index];
          final isSelected = selectedCategory == cat;

          return GestureDetector(
            onTap: () => onCategorySelected(cat),
            child: AnimatedContainer(
              duration: theme.motion.durationFast,
              curve: Curves.easeOutCubic,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
              decoration: BoxDecoration(
                color: isSelected
                    ? theme.colors.brandPrimary
                    : theme.colors.bgElevated,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: isSelected
                      ? theme.colors.brandPrimary
                      : theme.colors.borderDefault,
                ),
                boxShadow: isSelected ? theme.elevations.sm : [],
              ),
              alignment: Alignment.center,
              child: Text(
                cat,
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                  color: isSelected
                      ? theme.colors.textInverse
                      : theme.colors.textSecondary,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Virtualized Product Grid — NEVER renders all items at once.
// Uses SliverChildBuilderDelegate: Flutter only builds visible cells.
// ─────────────────────────────────────────────────────────────────────────────
class _VirtualizedProductGrid extends StatelessWidget {
  final List filteredProducts;

  const _VirtualizedProductGrid({super.key, required this.filteredProducts});

  int _crossAxisCount(BuildContext context) {
    final w = MediaQuery.of(context).size.width * 0.65;
    if (w > 1000) return 5;
    if (w > 780) return 4;
    if (w > 560) return 3;
    return 2;
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.savvy;
    final crossAxisCount = _crossAxisCount(context);

    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverPadding(
          padding: EdgeInsets.all(theme.shapes.spacingMd),
          sliver: SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              childAspectRatio: 0.72,
              crossAxisSpacing: theme.shapes.spacingMd,
              mainAxisSpacing: theme.shapes.spacingMd,
            ),
            // SliverChildBuilderDelegate = ZERO out-of-view renders (virtualization)
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final product = filteredProducts[index];
                return ProductCard(product: product).animate().fadeIn(
                      duration: const Duration(milliseconds: 50),
                      curve: Curves.easeOut,
                    );
              },
              childCount: filteredProducts.length,
              // Hint to Flutter's rendering engine for better reuse
              addRepaintBoundaries: true,
              addAutomaticKeepAlives: false,
            ),
          ),
        ),
        const SliverToBoxAdapter(child: SizedBox(height: 80)),
      ],
    );
  }
}
