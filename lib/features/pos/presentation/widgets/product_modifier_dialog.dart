import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:savvy_pos/core/config/theme_config.dart';
import 'package:savvy_pos/features/inventory/domain/entities/modifier.dart';
import 'package:savvy_pos/features/inventory/domain/entities/product.dart';
import 'package:savvy_pos/features/inventory/domain/repositories/i_product_repository.dart';

class ProductModifierDialog extends StatefulWidget {
  final Product product;

  const ProductModifierDialog({Key? key, required this.product}) : super(key: key);

  @override
  State<ProductModifierDialog> createState() => _ProductModifierDialogState();
}

class _ProductModifierDialogState extends State<ProductModifierDialog> {
  bool _isLoading = true;
  List<ModifierGroup> _linkGroups = [];
  
  // Selection State: GroupUUID -> Set<ModifierItemUUID>
  final Map<String, Set<String>> _selections = {};

  @override
  void initState() {
    super.initState();
    _loadModifiers();
  }

  Future<void> _loadModifiers() async {
    try {
      final groups = await GetIt.I<IProductRepository>().getModifiersForProduct(widget.product.uuid);
      setState(() {
        _linkGroups = groups;
        _isLoading = false;
        
        // Auto-select defaults? Or just empty.
        // If minSelection > 0, maybe select first? 
        // For now, empty.
        for (var g in groups) {
          _selections[g.uuid] = {};
        }
      });
    } catch (e) {
      setState(() => _isLoading = false);
      // Handle error
    }
  }

  bool _validate() {
    for (var group in _linkGroups) {
      final selectedCount = _selections[group.uuid]?.length ?? 0;
      if (selectedCount < group.minSelection) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('${group.name} requires at least ${group.minSelection} selection(s)'),
          backgroundColor: Colors.red,
        ));
        return false;
      }
    }
    return true;
  }

  List<ModifierItem> _getSelectedItems() {
    final List<ModifierItem> result = [];
    for (var group in _linkGroups) {
      final selectedUuids = _selections[group.uuid] ?? {};
      for (var item in group.items) {
        if (selectedUuids.contains(item.uuid)) {
          result.add(item);
        }
      }
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const AlertDialog(content: SizedBox(height: 100, child: Center(child: CircularProgressIndicator())));
    }

    if (_linkGroups.isEmpty) {
      // Should not happen if we checked before opening, but safe fallback
      return AlertDialog(
        title: const Text('No Options'),
        content: const Text('This product has no modifiers.'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('Close')),
          ElevatedButton(onPressed: () => Navigator.pop(context, <ModifierItem>[]), child: const Text('Add to Cart')),
        ],
      );
    }

    final colors = context.savvy.colors;

    return AlertDialog(
      title: Text('${widget.product.name} Options'),
      content: SizedBox(
        width: 400,
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: _linkGroups.length,
          itemBuilder: (context, index) {
            final group = _linkGroups[index];
            final selection = _selections[group.uuid] ?? {};

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    '${group.name} ${group.minSelection > 0 ? "*" : ""}',
                    style: TextStyle(fontWeight: FontWeight.bold, color: colors.textPrimary),
                  ),
                ),
                ...group.items.map((item) {
                  final isSelected = selection.contains(item.uuid);
                  return CheckboxListTile(
                    title: Text('${item.name} ${item.priceDelta != 0 ? "(+\$${item.priceDelta})" : ""}'),
                    value: isSelected,
                    controlAffinity: ListTileControlAffinity.leading,
                    onChanged: (val) {
                      setState(() {
                         if (group.allowMultiSelect) {
                           if (val == true) {
                             // Check Max
                             if (group.maxSelection != null && selection.length >= group.maxSelection!) {
                               // Max reached
                               return; 
                             }
                             selection.add(item.uuid);
                           } else {
                             selection.remove(item.uuid);
                           }
                         } else {
                           // Single Select (Radio behavior)
                           selection.clear();
                           if (val == true) selection.add(item.uuid);
                         }
                         _selections[group.uuid] = selection;
                      });
                    },
                  );
                }).toList(),
                const Divider(),
              ],
            );
          },
        ),
      ),
      actions: [
        TextButton(onPressed: () => Navigator.pop(context), child: const Text('Cancel')),
        ElevatedButton(
          onPressed: () {
            if (_validate()) {
              Navigator.pop(context, _getSelectedItems());
            }
          },
          child: const Text('Add to Cart'),
        ),
      ],
    );
  }
}
