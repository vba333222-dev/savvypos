import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:savvy_pos/core/config/theme/savvy_theme.dart';
import 'package:savvy_pos/core/presentation/widgets/savvy_text.dart';
import 'package:savvy_pos/features/inventory/presentation/widgets/stock_level_indicator.dart';
import 'package:savvy_pos/features/dashboard/presentation/widgets/dashboard_grid.dart'; // Reusing BentoTile style or similar wrapper

class WebInventoryPage extends StatefulWidget {
  const WebInventoryPage({super.key});

  @override
  State<WebInventoryPage> createState() => _WebInventoryAppState();
}

class _WebInventoryAppState extends State<WebInventoryPage> {
  // Focus for "Ghost" Search
  final FocusNode _searchFocus = FocusNode();
  final TextEditingController _searchCtrl = TextEditingController();

  // Mock Data
  final List<_ProductRow> _products = List.generate(20, (index) => _ProductRow(
    id: 'P-$index',
    name: 'Product Item #$index',
    sku: 'SKU-${1000+index}',
    price: (index * 5.5) + 10,
    stock: index % 5 == 0 ? 0 : (index % 3 == 0 ? 5 : 50),
    category: index % 2 == 0 ? 'Coffee' : 'Pastry',
  ));

  @override
  void initState() {
    super.initState();
    // Auto-focus search or listen for '/'
    HardwareKeyboard.instance.addHandler(_handleKeyPress);
  }

  @override
  void dispose() {
    HardwareKeyboard.instance.removeHandler(_handleKeyPress);
    _searchFocus.dispose();
    super.dispose();
  }

  bool _handleKeyPress(KeyEvent event) {
    if (event is KeyDownEvent && event.logicalKey == LogicalKeyboardKey.slash) {
      // Focus search
      _searchFocus.requestFocus();
      return true; // handled
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.savvy;

    return Scaffold(
      backgroundColor: theme.colors.bgCanvas,
      body: Padding(
        padding: EdgeInsets.all(theme.shapes.spacingLg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header with Ghost Search
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SavvyText('Tactile Warehouse', style: SavvyTextStyle.h2),
                    SavvyText('Inventory Management', style: SavvyTextStyle.labelMedium, color: theme.colors.textSecondary),
                  ],
                ),
                Spacer(),
                // Ghost Search Bar
                Container(
                  width: 300,
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: theme.colors.bgElevated,
                    borderRadius: BorderRadius.circular(theme.shapes.radiusPill),
                    border: Border.all(color: _searchFocus.hasFocus ? theme.colors.brandPrimary : theme.colors.borderDefault),
                    boxShadow: [
                      if (_searchFocus.hasFocus) 
                        BoxShadow(color: theme.colors.brandPrimary.withValues(alpha: 0.2), blurRadius: 8)
                    ],
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.search, color: theme.colors.textSecondary),
                      SizedBox(width: 8),
                      Expanded(
                        child: TextField(
                          focusNode: _searchFocus,
                          controller: _searchCtrl,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Type / to search...',
                            hintStyle: TextStyle(color: theme.colors.textMuted),
                            isDense: true,
                          ),
                          onChanged: (val) => setState(() {}), // Trigger filter
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            
            SizedBox(height: theme.shapes.spacingLg),

            // DATA TABLE (App-Like)
            Expanded(
              child: BentoTile( // Reuse Bento wrapper for glass/shadow look
                child: Theme(
                  data: Theme.of(context).copyWith(
                    dividerColor: Colors.transparent, // Remove default dividers
                    dataTableTheme: DataTableThemeData(
                      headingRowColor: WidgetStateProperty.all(theme.colors.bgInverse.withValues(alpha: 0.05)),
                      dataRowColor: WidgetStateProperty.resolveWith((states) {
                         if (states.contains(WidgetState.hovered)) return theme.colors.brandPrimary.withValues(alpha: 0.05);
                         return Colors.transparent;
                      }),
                    ),
                  ),
                  child: SizedBox(
                    width: double.infinity,
                    child: SingleChildScrollView(
                      child: DataTable(
                        showCheckboxColumn: false,
                        headingRowHeight: 48,
                        dataRowMinHeight: 56,
                        dataRowMaxHeight: 56,
                        columns: [
                          DataColumn(label: SavvyText('SKU', style: SavvyTextStyle.labelMedium)),
                          DataColumn(label: SavvyText('PRODUCT', style: SavvyTextStyle.labelMedium)),
                          DataColumn(label: SavvyText('CATEGORY', style: SavvyTextStyle.labelMedium)),
                          DataColumn(label: SavvyText('PRICE', style: SavvyTextStyle.labelMedium)),
                          DataColumn(label: SavvyText('STOCK', style: SavvyTextStyle.labelMedium)),
                          DataColumn(label: SavvyText('ACTIONS', style: SavvyTextStyle.labelMedium)), // Quick Actions
                        ],
                        rows: _products.where((p) => p.name.toLowerCase().contains(_searchCtrl.text.toLowerCase())).map((product) {
                          return DataRow(
                            onSelectChanged: (_) {}, // Enable hover effect
                            cells: [
                              DataCell(Text(product.sku, style: TextStyle(fontFamily: 'Courier', fontSize: 12))),
                              DataCell(Text(product.name, style: TextStyle(fontWeight: FontWeight.w500))),
                              DataCell(Container(
                                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                decoration: BoxDecoration(color: Colors.blue.withValues(alpha: 0.1), borderRadius: BorderRadius.circular(4)),
                                child: Text(product.category, style: TextStyle(color: Colors.blue, fontSize: 11)),
                              )),
                              DataCell(Text('\$${product.price.toStringAsFixed(2)}')),
                              DataCell(StockLevelIndicator(stock: product.stock)),
                              DataCell(_ActionCell(product: product)), // Hover Actions
                            ],
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ProductRow {
  final String id;
  final String name;
  final String sku;
  final double price;
  final int stock;
  final String category;
  _ProductRow({required this.id, required this.name, required this.sku, required this.price, required this.stock, required this.category});
}

class _ActionCell extends StatefulWidget {
  final _ProductRow product;
  const _ActionCell({required this.product});

  @override
  State<_ActionCell> createState() => _ActionCellState();
}

class _ActionCellState extends State<_ActionCell> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      child: AnimatedOpacity(
        opacity: _hovering ? 1.0 : 0.0,
        duration: const Duration(milliseconds: 200),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
             IconButton(icon: Icon(Icons.edit, size: 18, color: Colors.grey), onPressed: () {}, tooltip: 'Edit'),
             IconButton(icon: Icon(Icons.print, size: 18, color: Colors.grey), onPressed: () {}, tooltip: 'Print Label'),
             IconButton(icon: Icon(Icons.add_box, size: 18, color: Colors.blue), onPressed: () {}, tooltip: 'Adjust Stock'),
          ],
        ),
      ),
    );
  }
}
