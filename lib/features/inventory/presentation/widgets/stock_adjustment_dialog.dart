import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:savvy_pos/core/config/theme/savvy_theme.dart';
import 'package:savvy_pos/features/inventory/presentation/bloc/advanced_inventory_bloc.dart';

class StockAdjustmentDialog extends StatefulWidget {
  final String productUuid;
  final String productName;
  final String warehouseUuid;
  final double currentQuantity;

  const StockAdjustmentDialog({
    super.key,
    required this.productUuid,
    required this.productName,
    required this.warehouseUuid,
    required this.currentQuantity,
  });

  @override
  State<StockAdjustmentDialog> createState() => _StockAdjustmentDialogState();
}

class _StockAdjustmentDialogState extends State<StockAdjustmentDialog> {
  final _quantityController = TextEditingController();
  final _notesController = TextEditingController();
  String _adjustmentType = 'add'; // add, remove, set
  String _reason = 'correction';
  double _newQuantity = 0;

  final _reasons = [
    ('correction', 'Correction', Icons.edit),
    ('damage', 'Damage', Icons.broken_image),
    ('theft', 'Theft', Icons.warning),
    ('received', 'Received', Icons.add_shopping_cart),
    ('sold', 'Sold (Manual)', Icons.shopping_cart),
    ('other', 'Other', Icons.more_horiz),
  ];

  @override
  void initState() {
    super.initState();
    _newQuantity = widget.currentQuantity;
    _quantityController.addListener(_calculateNewQuantity);
  }

  @override
  void dispose() {
    _quantityController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  void _calculateNewQuantity() {
    final input = double.tryParse(_quantityController.text) ?? 0;
    setState(() {
      switch (_adjustmentType) {
        case 'add':
          _newQuantity = widget.currentQuantity + input;
          break;
        case 'remove':
          _newQuantity = widget.currentQuantity - input;
          break;
        case 'set':
          _newQuantity = input;
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.savvy;

    return Dialog(
      backgroundColor: theme.colors.bgSurface,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Container(
        width: 400,
        padding: const EdgeInsets.all(24),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: theme.colors.brandPrimary.withValues(alpha: 0.15),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(Icons.tune, color: theme.colors.brandPrimary),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Adjust Stock',
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          widget.productName,
                          style: TextStyle(fontSize: 13, color: theme.colors.textSecondary),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),

              const SizedBox(height: 24),

              // Current Stock Display
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: theme.colors.bgCanvas,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Current Stock',
                          style: TextStyle(fontSize: 12, color: theme.colors.textSecondary),
                        ),
                        Text(
                          widget.currentQuantity.toStringAsFixed(0),
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: theme.colors.textPrimary,
                          ),
                        ),
                      ],
                    ),
                    Icon(Icons.arrow_forward, color: theme.colors.textSecondary),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'New Stock',
                          style: TextStyle(fontSize: 12, color: theme.colors.textSecondary),
                        ),
                        Text(
                          _newQuantity.toStringAsFixed(0),
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: _newQuantity >= 0 ? Colors.green : Colors.red,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // Adjustment Type
              Text('Adjustment Type', style: TextStyle(fontSize: 13, color: theme.colors.textSecondary)),
              const SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    child: _TypeButton(
                      icon: Icons.add,
                      label: 'Add',
                      isSelected: _adjustmentType == 'add',
                      color: Colors.green,
                      onTap: () {
                        HapticFeedback.selectionClick();
                        setState(() => _adjustmentType = 'add');
                        _calculateNewQuantity();
                      },
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: _TypeButton(
                      icon: Icons.remove,
                      label: 'Remove',
                      isSelected: _adjustmentType == 'remove',
                      color: Colors.red,
                      onTap: () {
                        HapticFeedback.selectionClick();
                        setState(() => _adjustmentType = 'remove');
                        _calculateNewQuantity();
                      },
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: _TypeButton(
                      icon: Icons.edit,
                      label: 'Set To',
                      isSelected: _adjustmentType == 'set',
                      color: Colors.blue,
                      onTap: () {
                        HapticFeedback.selectionClick();
                        setState(() => _adjustmentType = 'set');
                        _calculateNewQuantity();
                      },
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // Quantity Input
              Text('Quantity', style: TextStyle(fontSize: 13, color: theme.colors.textSecondary)),
              const SizedBox(height: 8),
              TextField(
                controller: _quantityController,
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: _adjustmentType == 'set' ? 'New quantity' : 'Quantity to $_adjustmentType',
                  prefixIcon: Icon(
                    _adjustmentType == 'add' ? Icons.add : _adjustmentType == 'remove' ? Icons.remove : Icons.edit,
                    color: _adjustmentType == 'add' ? Colors.green : _adjustmentType == 'remove' ? Colors.red : Colors.blue,
                  ),
                ),
                autofocus: true,
              ),

              const SizedBox(height: 20),

              // Reason Selector
              Text('Reason', style: TextStyle(fontSize: 13, color: theme.colors.textSecondary)),
              const SizedBox(height: 8),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: _reasons.map((r) {
                  final isSelected = _reason == r.$1;
                  return GestureDetector(
                    onTap: () {
                      HapticFeedback.selectionClick();
                      setState(() => _reason = r.$1);
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                      decoration: BoxDecoration(
                        color: isSelected ? theme.colors.brandPrimary : Colors.transparent,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: isSelected ? theme.colors.brandPrimary : theme.colors.border,
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(r.$3, size: 16, color: isSelected ? Colors.white : theme.colors.textSecondary),
                          const SizedBox(width: 6),
                          Text(
                            r.$2,
                            style: TextStyle(
                              fontSize: 13,
                              color: isSelected ? Colors.white : theme.colors.textPrimary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),

              const SizedBox(height: 20),

              // Notes
              Text('Notes (Optional)', style: TextStyle(fontSize: 13, color: theme.colors.textSecondary)),
              const SizedBox(height: 8),
              TextField(
                controller: _notesController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Add notes about this adjustment',
                ),
                maxLines: 2,
              ),

              const SizedBox(height: 24),

              // Actions
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('Cancel'),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    flex: 2,
                    child: FilledButton(
                      onPressed: _quantityController.text.isNotEmpty
                          ? () {
                              HapticFeedback.mediumImpact();
                              
                              double change = double.tryParse(_quantityController.text) ?? 0;
                              if (_adjustmentType == 'remove') change = -change;
                              if (_adjustmentType == 'set') change = change - widget.currentQuantity;
                              
                              context.read<AdvancedInventoryBloc>().add(
                                AdvancedInventoryEvent.adjustStock(
                                  productUuid: widget.productUuid,
                                  warehouseUuid: widget.warehouseUuid,
                                  quantityChange: change,
                                  reason: _reason,
                                  notes: _notesController.text.isEmpty ? null : _notesController.text,
                                ),
                              );
                              
                              Navigator.pop(context);
                              
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('Stock adjusted: ${change >= 0 ? '+' : ''}${change.toStringAsFixed(0)}'),
                                  backgroundColor: Colors.green,
                                ),
                              );
                            }
                          : null,
                      child: const Text('Confirm Adjustment'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _TypeButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isSelected;
  final Color color;
  final VoidCallback onTap;

  const _TypeButton({
    required this.icon,
    required this.label,
    required this.isSelected,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.savvy;

    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: isSelected ? color.withValues(alpha: 0.15) : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: isSelected ? color : theme.colors.border,
            width: isSelected ? 2 : 1,
          ),
        ),
        child: Column(
          children: [
            Icon(icon, color: isSelected ? color : theme.colors.textSecondary),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                fontSize: 12,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                color: isSelected ? color : theme.colors.textSecondary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
