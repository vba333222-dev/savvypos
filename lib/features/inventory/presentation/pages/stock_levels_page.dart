import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:savvy_pos/core/config/theme/savvy_theme.dart';
import 'package:savvy_pos/features/inventory/domain/entities/advanced_inventory_entities.dart';
import 'package:savvy_pos/features/inventory/presentation/bloc/advanced_inventory_bloc.dart';
import 'package:savvy_pos/features/inventory/presentation/widgets/stock_adjustment_dialog.dart';

class StockLevelsPage extends StatelessWidget {
  const StockLevelsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => GetIt.I<AdvancedInventoryBloc>()
        ..add(const AdvancedInventoryEvent.loadWarehouses())
        ..add(const AdvancedInventoryEvent.loadStockLevels()),
      child: const _StockLevelsContent(),
    );
  }
}

class _StockLevelsContent extends StatefulWidget {
  const _StockLevelsContent();

  @override
  State<_StockLevelsContent> createState() => _StockLevelsContentState();
}

class _StockLevelsContentState extends State<_StockLevelsContent> {
  final _searchController = TextEditingController();
  String _selectedFilter = 'all'; // all, low, out

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _applyFilters() {
    context
        .read<AdvancedInventoryBloc>()
        .add(AdvancedInventoryEvent.loadStockLevels(
          searchQuery:
              _searchController.text.isEmpty ? null : _searchController.text,
          lowStockOnly: _selectedFilter == 'low',
          outOfStockOnly: _selectedFilter == 'out',
        ));
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.savvy;

    return Scaffold(
      backgroundColor: theme.colors.bgCanvas,
      appBar: AppBar(
        backgroundColor: theme.colors.bgSurface,
        title: Row(
          children: [
            Icon(Icons.inventory, color: theme.colors.brandPrimary),
            const SizedBox(width: 8),
            const Text('Stock Levels'),
          ],
        ),
        actions: [
          // Warehouse Selector
          BlocBuilder<AdvancedInventoryBloc, AdvancedInventoryState>(
            builder: (context, state) {
              return PopupMenuButton<String>(
                tooltip: 'Select Warehouse',
                icon: Icon(Icons.warehouse, color: theme.colors.textSecondary),
                onSelected: (uuid) {
                  context.read<AdvancedInventoryBloc>().add(
                        AdvancedInventoryEvent.loadStockLevels(
                            warehouseUuid: uuid.isEmpty ? null : uuid),
                      );
                },
                itemBuilder: (context) => [
                  const PopupMenuItem(value: '', child: Text('All Warehouses')),
                  ...state.warehouses.map(
                      (w) => PopupMenuItem(value: w.uuid, child: Text(w.name))),
                ],
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              HapticFeedback.mediumImpact();
              _applyFilters();
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Search and Filter Bar
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: theme.colors.bgSurface,
              border: Border(bottom: BorderSide(color: theme.colors.border)),
            ),
            child: Column(
              children: [
                // Search
                TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    hintText: 'Search products...',
                    prefixIcon: const Icon(Icons.search),
                    suffixIcon: _searchController.text.isNotEmpty
                        ? IconButton(
                            icon: const Icon(Icons.clear),
                            onPressed: () {
                              _searchController.clear();
                              _applyFilters();
                            },
                          )
                        : null,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12)),
                    filled: true,
                    fillColor: theme.colors.bgCanvas,
                  ),
                  onSubmitted: (_) => _applyFilters(),
                ),
                const SizedBox(height: 12),
                // Filter Chips
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      _FilterChip(
                        label: 'All',
                        isSelected: _selectedFilter == 'all',
                        onTap: () {
                          setState(() => _selectedFilter = 'all');
                          _applyFilters();
                        },
                      ),
                      const SizedBox(width: 8),
                      _FilterChip(
                        label: 'Low Stock',
                        isSelected: _selectedFilter == 'low',
                        color: Colors.orange,
                        onTap: () {
                          setState(() => _selectedFilter = 'low');
                          _applyFilters();
                        },
                      ),
                      const SizedBox(width: 8),
                      _FilterChip(
                        label: 'Out of Stock',
                        isSelected: _selectedFilter == 'out',
                        color: Colors.red,
                        onTap: () {
                          setState(() => _selectedFilter = 'out');
                          _applyFilters();
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Stock List
          Expanded(
            child: BlocBuilder<AdvancedInventoryBloc, AdvancedInventoryState>(
              builder: (context, state) {
                if (state.isLoadingStock) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (state.stockLevels.isEmpty) {
                  return Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.inventory_2,
                            size: 64, color: theme.colors.textSecondary),
                        const SizedBox(height: 16),
                        Text('No stock data found',
                            style:
                                TextStyle(color: theme.colors.textSecondary)),
                      ],
                    ),
                  );
                }

                return ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: state.stockLevels.length,
                  itemBuilder: (context, index) {
                    final stock = state.stockLevels[index];
                    return _StockLevelTile(stock: stock)
                        .animate()
                        .fadeIn(duration: 200.ms, delay: (index * 30).ms)
                        .slideX(begin: 0.05, end: 0);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _FilterChip extends StatelessWidget {
  final String label;
  final bool isSelected;
  final Color? color;
  final VoidCallback onTap;

  const _FilterChip({
    required this.label,
    required this.isSelected,
    this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.savvy;
    final chipColor = color ?? theme.colors.brandPrimary;

    return GestureDetector(
      onTap: () {
        HapticFeedback.selectionClick();
        onTap();
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? chipColor : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
          border:
              Border.all(color: isSelected ? chipColor : theme.colors.border),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.white : theme.colors.textPrimary,
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
          ),
        ),
      ),
    );
  }
}

class _StockLevelTile extends StatelessWidget {
  final StockLevel stock;

  const _StockLevelTile({required this.stock});

  @override
  Widget build(BuildContext context) {
    final theme = context.savvy;

    // Determine stock status
    Color statusColor;
    String statusText;
    IconData statusIcon;

    if (stock.quantity <= 0) {
      statusColor = Colors.red;
      statusText = 'Out of Stock';
      statusIcon = Icons.remove_shopping_cart;
    } else if (stock.reorderPoint != null &&
        stock.quantity <= stock.reorderPoint!) {
      statusColor = Colors.orange;
      statusText = 'Low Stock';
      statusIcon = Icons.warning_amber;
    } else if (stock.maxStockLevel != null &&
        stock.quantity >= stock.maxStockLevel!) {
      statusColor = Colors.blue;
      statusText = 'Overstocked';
      statusIcon = Icons.inventory;
    } else {
      statusColor = Colors.green;
      statusText = 'Healthy';
      statusIcon = Icons.check_circle;
    }

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: theme.colors.bgSurface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: theme.colors.border),
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(12),
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () => _showStockDetail(context),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Row(
                  children: [
                    // Status Icon
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: statusColor.withValues(alpha: 0.15),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Icon(statusIcon, color: statusColor, size: 24),
                    ),
                    const SizedBox(width: 12),

                    // Product Info
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            stock.productName ?? 'Unknown Product',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              color: theme.colors.textPrimary,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Row(
                            children: [
                              if (stock.productSku != null) ...[
                                Text(
                                  stock.productSku!,
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: theme.colors.textSecondary),
                                ),
                                const SizedBox(width: 8),
                              ],
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 6, vertical: 2),
                                decoration: BoxDecoration(
                                  color: statusColor.withValues(alpha: 0.15),
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: Text(
                                  statusText,
                                  style: TextStyle(
                                      fontSize: 10,
                                      color: statusColor,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    // Quantity Display
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          stock.quantity.toStringAsFixed(
                              stock.quantity.truncateToDouble() ==
                                      stock.quantity
                                  ? 0
                                  : 1),
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: statusColor,
                          ),
                        ),
                        if (stock.warehouseName != null)
                          Text(
                            stock.warehouseName!,
                            style: TextStyle(
                                fontSize: 10,
                                color: theme.colors.textSecondary),
                          ),
                      ],
                    ),
                  ],
                ),

                // Additional Info Row
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _InfoPill(
                      icon: Icons.trending_down,
                      label: 'Reorder at',
                      value: stock.reorderPoint?.toStringAsFixed(0) ?? '-',
                    ),
                    _InfoPill(
                      icon: Icons.calendar_today,
                      label: 'Days of Stock',
                      value: stock.daysOfStock?.toString() ?? '-',
                    ),
                    _InfoPill(
                      icon: Icons.attach_money,
                      label: 'Avg Cost',
                      value: '\$${stock.averageCost.toStringAsFixed(2)}',
                    ),
                  ],
                ),

                // Action Buttons
                const SizedBox(height: 12),
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton.icon(
                        onPressed: () => _showAdjustmentDialog(context),
                        icon: const Icon(Icons.tune, size: 18),
                        label: const Text('Adjust'),
                        style: OutlinedButton.styleFrom(
                          foregroundColor: theme.colors.brandPrimary,
                          side: BorderSide(color: theme.colors.brandPrimary),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: FilledButton.icon(
                        onPressed: () {
                          HapticFeedback.mediumImpact();
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Quick Reorder - Coming Soon')),
                          );
                        },
                        icon: const Icon(Icons.add_shopping_cart, size: 18),
                        label: const Text('Reorder'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showStockDetail(BuildContext context) {
    HapticFeedback.lightImpact();
    // Navigate to stock detail page or show modal
  }

  void _showAdjustmentDialog(BuildContext context) {
    HapticFeedback.mediumImpact();
    showDialog(
      context: context,
      builder: (_) => StockAdjustmentDialog(
        productUuid: stock.productUuid,
        productName: stock.productName ?? 'Product',
        warehouseUuid: stock.warehouseUuid,
        currentQuantity: stock.quantity,
      ),
    );
  }
}

class _InfoPill extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _InfoPill({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.savvy;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: theme.colors.bgCanvas,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14, color: theme.colors.textSecondary),
          const SizedBox(width: 4),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(value,
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: theme.colors.textPrimary)),
              Text(label,
                  style: TextStyle(
                      fontSize: 9, color: theme.colors.textSecondary)),
            ],
          ),
        ],
      ),
    );
  }
}
