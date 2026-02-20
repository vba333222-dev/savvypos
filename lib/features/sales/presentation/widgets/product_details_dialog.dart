import 'package:flutter/material.dart';
import 'package:savvy_pos/features/inventory/domain/entities/product.dart';
import 'package:savvy_pos/features/sales/domain/usecases/get_modifiers_usecase.dart';

class ProductDetailsDialog extends StatefulWidget {
  final Product product;
  final List<ModifierGroupWithItems> modifierGroups;
  final Function(Product p, int qty, List<String> mods, String? note) onAddToCart;

  const ProductDetailsDialog({
    super.key,
    required this.product,
    required this.modifierGroups,
    required this.onAddToCart,
  });

  @override
  State<ProductDetailsDialog> createState() => _ProductDetailsDialogState();
}

class _ProductDetailsDialogState extends State<ProductDetailsDialog> {
  int _quantity = 1;
  final Map<String, List<String>> _selectedModifiers = {}; // GroupId -> List<ItemId>
  final TextEditingController _noteController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Initialize required modifiers?
    // For now, assume all open for selection.
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Container(
        width: 500, // Tablet friendly width
        constraints: const BoxConstraints(maxHeight: 700),
        child: Column(
          children: [
            // Header
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
              ),
              child: Row(
                children: [
                   Expanded(
                     child: Text(
                       widget.product.name, 
                       style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)
                     )
                   ),
                   IconButton(
                     icon: const Icon(Icons.close, color: Colors.white),
                     onPressed: () => Navigator.of(context).pop(),
                   )
                ],
              ),
            ),

            // Content
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     // Note
                    TextField(
                      controller: _noteController,
                      decoration: const InputDecoration(
                        labelText: 'Special Instructions / Notes',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.note),
                      ),
                      maxLines: 2,
                    ),
                    const SizedBox(height: 16),
                    
                    // Modifiers
                    ...widget.modifierGroups.map((group) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(group.group.name, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                          Text(
                            'Select up to ${group.group.maxSelection} options', 
                            style: TextStyle(color: Colors.grey[600], fontSize: 12)
                          ),
                          const SizedBox(height: 8),
                          Wrap(
                            spacing: 8,
                            runSpacing: 8,
                            children: group.items.map((item) {
                              final isSelected = _selectedModifiers[group.group.uuid]?.contains(item.uuid) ?? false;
                              return FilterChip(
                                label: Text('${item.name} (+${item.priceDelta.toStringAsFixed(2)})'),
                                selected: isSelected,
                                onSelected: (selected) {
                                  setState(() {
                                    final current = _selectedModifiers[group.group.uuid] ?? [];
                                    if (selected) {
                                      // Check max selection
                                      if ((group.group.maxSelection ?? 0) > 0 && current.length >= (group.group.maxSelection ?? 0)) {
                                         // Show hint?
                                         return;
                                      }
                                      current.add(item.uuid);
                                    } else {
                                      current.remove(item.uuid);
                                    }
                                    _selectedModifiers[group.group.uuid] = current;
                                  });
                                },
                              );
                            }).toList(),
                          ),
                          const Divider(height: 24),
                        ],
                      );
                    }),
                  ],
                ),
              ),
            ),
            
            // Footer
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border(top: BorderSide(color: Colors.grey[300]!)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                   // Quantity
                   Row(
                     children: [
                       IconButton(
                         icon: const Icon(Icons.remove_circle_outline),
                         onPressed: _quantity > 1 ? () => setState(() => _quantity--) : null,
                       ),
                       Text('$_quantity', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                       IconButton(
                         icon: const Icon(Icons.add_circle_outline),
                         onPressed: () => setState(() => _quantity++),
                       ),
                     ],
                   ),
                   
                   // Add Button
                   ElevatedButton.icon(
                     style: ElevatedButton.styleFrom(
                       padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                       backgroundColor: Theme.of(context).primaryColor,
                       foregroundColor: Colors.white,
                     ),
                     onPressed: () {
                        // Flatten modifiers
                        // Ideally we should calculate price here too for visual feedback, 
                        // but `CartItem` recalculates based on Product price. 
                        // Wait, Modifier price needs to be added to CartItem logic.
                        // I will pass just IDs for now as per CartItem design.
                        final allMods = _selectedModifiers.values.expand((element) => element).toList();
                        widget.onAddToCart(
                          widget.product, 
                          _quantity, 
                          allMods, // In MVP CartItem only stores string IDs, we need to handle prices later.
                          _noteController.text
                        );
                        Navigator.of(context).pop();
                     },
                     icon: const Icon(Icons.add_shopping_cart),
                     label: const Text('Add to Order'),
                   )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
