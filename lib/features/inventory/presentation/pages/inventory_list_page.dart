import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get_it/get_it.dart';
import 'package:savvy_pos/core/config/theme/savvy_theme.dart';
import 'package:savvy_pos/features/inventory/domain/repositories/i_product_repository.dart';
import 'package:savvy_pos/features/inventory/presentation/bloc/inventory_management_bloc.dart';
import 'package:savvy_pos/features/inventory/presentation/pages/product_form_page.dart';
import 'package:savvy_pos/features/inventory/presentation/widgets/tactile_inventory_card.dart';
import 'package:savvy_pos/features/inventory/presentation/pages/waste_dashboard_page.dart';

class InventoryListPage extends StatefulWidget {
  const InventoryListPage({super.key});

  @override
  State<InventoryListPage> createState() => _InventoryListPageState();
}

class _InventoryListPageState extends State<InventoryListPage> {
  final TextEditingController _searchCtrl = TextEditingController();
  // ignore: unused_field - Reserved for future product search enhancement
  final IProductRepository _repo = GetIt.I<IProductRepository>();
  String _query = '';

  @override
  Widget build(BuildContext context) {
    final theme = context.savvy;

    return BlocProvider(
      create: (_) => GetIt.I<InventoryManagementBloc>(),
      child: Scaffold(
        backgroundColor: theme.colors.bgPrimary,
        floatingActionButton: FloatingActionButton(
          backgroundColor: theme.colors.brandPrimary,
          onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const ProductFormPage())),
          elevation: 4,
          child: const Icon(Icons.add, color: Colors.white),
        ),
        body: BlocBuilder<InventoryManagementBloc, InventoryManagementState>(
          builder: (context, state) {
            
            // Map state to products list
            final List<ProductStock> allItems = state.maybeWhen(
              loaded: (items) => items,
              orElse: () => [],
            );
            
            final isLoading = state.maybeWhen(loading: () => true, orElse: () => false);

            final filtered = _query.isEmpty 
               ? allItems 
               : allItems.where((item) => 
                   item.product.name.toLowerCase().contains(_query.toLowerCase()) || 
                   (item.product.sku?.contains(_query) ?? false)
                 ).toList();

            return CustomScrollView(
              slivers: [
                // 1. App Bar
                SliverAppBar(
                  title: Text('INVENTORY', style: TextStyle(color: theme.colors.textPrimary, fontWeight: FontWeight.bold, letterSpacing: 1.2)),
                  centerTitle: true,
                  pinned: true,
                  floating: false,
                  backgroundColor: theme.colors.bgPrimary,
                  elevation: 0,
                  actions: [
                     IconButton(
                       icon: Icon(Icons.delete_outline, color: theme.colors.textSecondary),
                       tooltip: 'Waste & Loss',
                       onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const WasteDashboardPage())),
                     ),
                     IconButton(icon: Icon(Icons.filter_list, color: theme.colors.textSecondary), onPressed: (){}),
                  ],
                ),

                // 2. Dynamic Island Search Header
                SliverPersistentHeader(
                  delegate: _DynamicSearchHeader(
                    minExtent: 80,
                    maxExtent: 80,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      child: TextField(
                        controller: _searchCtrl,
                        onChanged: (val) => setState(() => _query = val),
                        style: TextStyle(color: theme.colors.textPrimary),
                        decoration: InputDecoration(
                          hintText: 'Search stock...',
                          hintStyle: TextStyle(color: theme.colors.textMuted),
                          prefixIcon: Icon(Icons.search, color: theme.colors.textMuted),
                          filled: true,
                          fillColor: theme.colors.bgElevated,
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: BorderSide.none),
                          contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                        ),
                      ),
                    ),
                  ),
                  pinned: true,
                ),

                // 3. Product List
                if (isLoading && allItems.isEmpty) 
                   const SliverFillRemaining(child: Center(child: CircularProgressIndicator()))
                else if (filtered.isEmpty)
                   SliverFillRemaining(child: Center(child: Text('No items found', style: TextStyle(color: theme.colors.textMuted))))
                else
                  SliverPadding(
                    padding: const EdgeInsets.all(16),
                    sliver: SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          final item = filtered[index];
                          final product = item.product;
                          final stock = item.quantity.toInt();

                          return Padding(
                            padding: const EdgeInsets.only(bottom: 12),
                            child: TactileInventoryCard(
                              key: ValueKey(product.uuid), 
                              product: product,
                              currentStock: stock,
                              onStockUpdate: (delta) {
                                context.read<InventoryManagementBloc>().add(InventoryManagementEvent.updateStock(product.uuid, delta));
                              },
                              onEdit: () => Navigator.push(context, MaterialPageRoute(builder: (_) => ProductFormPage(product: product))),
                            ).animate().fadeIn(duration: 300.ms).slideY(begin: 0.1, end: 0, curve: Curves.easeOutQuint),
                          );
                        },
                        childCount: filtered.length,
                      ),
                    ),
                  ),
                
                const SliverToBoxAdapter(child: SizedBox(height: 100)),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _DynamicSearchHeader extends SliverPersistentHeaderDelegate {
  final double _minExtent;
  final double _maxExtent;
  final Widget child;

  _DynamicSearchHeader({required double minExtent, required double maxExtent, required this.child}) : _minExtent = minExtent, _maxExtent = maxExtent;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    // "Dynamic Island" Effect
    final double progress = shrinkOffset / _maxExtent;
    final double scale = 1.0 - (progress * 0.05); // 1.0 -> 0.95
    final double elevation = progress * 4;

    return Container(
      color: Theme.of(context).scaffoldBackgroundColor, 
      child: Center(
        child: Transform.scale(
          scale: scale.clamp(0.95, 1.0),
          child: Material(
            elevation: elevation,
            borderRadius: BorderRadius.circular(16),
            color: Colors.transparent,
            child: child,
          ),
        ),
      ),
    );
  }

  @override
  bool shouldRebuild(covariant _DynamicSearchHeader oldDelegate) => false;
  
  @override
  double get minExtent => _minExtent;
  
  @override
  double get maxExtent => _maxExtent;
}
