import 'package:flutter/material.dart';
import 'package:savvy_pos/core/config/theme/savvy_theme.dart';
import 'package:savvy_pos/core/presentation/widgets/savvy_text.dart';
import 'package:savvy_pos/features/inventory/domain/entities/modifier.dart';
import 'package:savvy_pos/features/inventory/domain/entities/product.dart';
import 'package:get_it/get_it.dart';
import 'package:savvy_pos/features/inventory/domain/repositories/i_product_repository.dart';

class ProductModifierDialog extends StatefulWidget {
  final Product product;

  const ProductModifierDialog({super.key, required this.product});

  @override
  State<ProductModifierDialog> createState() => _ProductModifierDialogState();
}

class _ProductModifierDialogState extends State<ProductModifierDialog> {
  bool _isLoading = true;
  List<ModifierGroup> _linkGroups = [];

  // Selection State: GroupUUID -> Set<ModifierItemUUID>
  final Map<String, Set<String>> _selections = {};

  // Real-time price delta
  double _currentPriceDelta = 0.0;

  @override
  void initState() {
    super.initState();
    _loadModifiers();
  }

  Future<void> _loadModifiers() async {
    try {
      // Use Mock Repository if needed or GetIt
      // Use GetIt dependency
      final result = await GetIt.I<IProductRepository>()
          .getModifierGroups(widget.product.uuid);

      result.fold((failure) {
        // Handle failure
        if (mounted) setState(() => _isLoading = false);
      }, (groups) {
        if (!mounted) return;
        setState(() {
          _linkGroups = groups;
          _isLoading = false;
          for (var g in groups) {
            _selections[g.uuid] = {};
          }
        });
      });
      return; // Handled

      /* 
      // Old
      final groups = await MockProductRepository().getModifiersForProduct(widget.product.uuid);
      */

      /* Handled in fold */
    } catch (e) {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  void _updatePriceDelta() {
    double total = 0.0;
    for (var group in _linkGroups) {
      final selectedUuids = _selections[group.uuid] ?? {};
      for (var item in group.items) {
        if (selectedUuids.contains(item.uuid)) {
          total += item.priceDelta;
        }
      }
    }
    setState(() {
      _currentPriceDelta = total;
    });
  }

  bool _validate() {
    for (var group in _linkGroups) {
      final selectedCount = _selections[group.uuid]?.length ?? 0;
      if (selectedCount < group.minSelection) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
              '${group.name} requires at least ${group.minSelection} selection(s)'),
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
    final theme = context.savvy;

    // Loading State
    if (_isLoading) {
      return Dialog(
        backgroundColor: theme.colors.bgElevated,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(theme.shapes.radiusLg)),
        child: const SizedBox(
            height: 100, child: Center(child: CircularProgressIndicator())),
      );
    }

    // No Options State
    if (_linkGroups.isEmpty) {
      return Dialog(
        backgroundColor: theme.colors.bgElevated,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(theme.shapes.radiusLg)),
        child: Padding(
          padding: EdgeInsets.all(theme.shapes.spacingMd),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SavvyText('No Options',
                  style: SavvyTextStyle.h3, color: theme.colors.textPrimary),
              SizedBox(height: theme.shapes.spacingMd),
              SavvyText('This product has no modifiers available.',
                  style: SavvyTextStyle.bodyMedium,
                  color: theme.colors.textSecondary),
              SizedBox(height: theme.shapes.spacingLg),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('Close')),
                  SizedBox(width: theme.shapes.spacingSm),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: theme.colors.brandPrimary),
                    onPressed: () => Navigator.pop(context, <ModifierItem>[]),
                    child: Text('Add to Order',
                        style: TextStyle(color: theme.colors.textInverse)),
                  ),
                ],
              )
            ],
          ),
        ),
      );
    }

    // Main Content
    return Dialog(
      backgroundColor: theme.colors.bgElevated,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(theme.shapes.radiusLg)),
      insetPadding: EdgeInsets.all(theme.shapes.spacingMd),
      child: Container(
        width: 450, // "Command Center" width
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height * 0.8,
        ),
        child: Column(
          children: [
            // HEADER
            Container(
              padding: EdgeInsets.all(theme.shapes.spacingMd),
              decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(color: theme.colors.borderDefault)),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SavvyText(widget.product.name,
                            style: SavvyTextStyle.h3,
                            color: theme.colors.textPrimary),
                        SavvyText('Customize your item',
                            style: SavvyTextStyle.bodySmall,
                            color: theme.colors.textSecondary),
                      ],
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.close, color: theme.colors.textMuted),
                    onPressed: () => Navigator.pop(context),
                  )
                ],
              ),
            ),

            // BODY SCROLL
            Expanded(
              child: ListView.separated(
                padding: EdgeInsets.all(theme.shapes.spacingMd),
                itemCount: _linkGroups.length,
                separatorBuilder: (ctx, i) =>
                    SizedBox(height: theme.shapes.spacingLg),
                itemBuilder: (context, index) {
                  final group = _linkGroups[index];
                  final selection = _selections[group.uuid] ?? {};

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Group Header
                      Row(
                        children: [
                          SavvyText(group.name.toUpperCase(),
                              style: SavvyTextStyle.label,
                              color: theme.colors.textMuted),
                          const Spacer(),
                          if (group.minSelection > 0)
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 6, vertical: 2),
                              decoration: BoxDecoration(
                                color: theme.colors.bgPrimary,
                                borderRadius: BorderRadius.circular(4),
                                border: Border.all(
                                    color: theme.colors.stateWarning
                                        .withValues(alpha: 0.5)),
                              ),
                              child: Text('Required',
                                  style: TextStyle(
                                      fontSize: 10,
                                      color: theme.colors.stateWarning,
                                      fontWeight: FontWeight.bold)),
                            ),
                        ],
                      ),
                      SizedBox(height: theme.shapes.spacingSm),

                      // Options Grid/List
                      ...group.items.map((item) {
                        final isSelected = selection.contains(item.uuid);
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                if (group.allowMultiSelect) {
                                  if (!isSelected) {
                                    // Check Max
                                    if (group.maxSelection != null &&
                                        selection.length >= group.maxSelection!)
                                      return;
                                    selection.add(item.uuid);
                                  } else {
                                    selection.remove(item.uuid);
                                  }
                                } else {
                                  // Single Select
                                  selection.clear();
                                  if (!isSelected) selection.add(item.uuid);
                                }
                                _selections[group.uuid] = selection;
                                _updatePriceDelta();
                              });
                            },
                            borderRadius:
                                BorderRadius.circular(theme.shapes.radiusSm),
                            child: Container(
                              padding: EdgeInsets.all(theme.shapes.spacingSm),
                              decoration: BoxDecoration(
                                color: isSelected
                                    ? theme.colors.brandPrimary
                                        .withValues(alpha: 0.1)
                                    : theme.colors.bgPrimary,
                                border: Border.all(
                                  color: isSelected
                                      ? theme.colors.brandPrimary
                                      : theme.colors.borderDefault,
                                ),
                                borderRadius: BorderRadius.circular(
                                    theme.shapes.radiusSm),
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      item.name,
                                      style: TextStyle(
                                        color: isSelected
                                            ? theme.colors.brandPrimary
                                            : theme.colors.textPrimary,
                                        fontWeight: isSelected
                                            ? FontWeight.bold
                                            : FontWeight.normal,
                                      ),
                                    ),
                                  ),
                                  if (item.priceDelta != 0)
                                    Text(
                                      '+ \$${item.priceDelta.toStringAsFixed(2)}',
                                      style: TextStyle(
                                        color: isSelected
                                            ? theme.colors.brandPrimary
                                            : theme.colors.textSecondary,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  SizedBox(width: theme.shapes.spacingSm),
                                  Icon(
                                    group.allowMultiSelect
                                        ? (isSelected
                                            ? Icons.check_box
                                            : Icons.check_box_outline_blank)
                                        : (isSelected
                                            ? Icons.radio_button_checked
                                            : Icons.radio_button_off),
                                    color: isSelected
                                        ? theme.colors.brandPrimary
                                        : theme.colors.textMuted,
                                    size: 20,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                    ],
                  );
                },
              ),
            ),

            // FOOTER (Action)
            Container(
              padding: EdgeInsets.all(theme.shapes.spacingMd),
              decoration: BoxDecoration(
                border:
                    Border(top: BorderSide(color: theme.colors.borderDefault)),
                color: theme.colors.bgSecondary, // Contrast footer
                borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(theme.shapes.radiusLg)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Total Price',
                          style: TextStyle(
                              color: theme.colors.textSecondary, fontSize: 12)),
                      Text(
                        '\$${(widget.product.price + _currentPriceDelta).toStringAsFixed(2)}',
                        style: TextStyle(
                            color: theme.colors.textPrimary,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                    ],
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: theme.colors.brandPrimary,
                      padding: EdgeInsets.symmetric(
                          horizontal: theme.shapes.spacingLg,
                          vertical: theme.shapes.spacingMd),
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(theme.shapes.radiusMd)),
                    ),
                    onPressed: () {
                      if (_validate()) {
                        Navigator.pop(context, _getSelectedItems());
                      }
                    },
                    child: Text(
                      'Add to Order',
                      style: TextStyle(
                          color: theme.colors.textInverse,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
