import 'package:flutter/material.dart';
import 'package:savvy_pos/core/config/theme/savvy_theme.dart';
import 'package:savvy_pos/core/presentation/widgets/savvy_box.dart';
import 'package:savvy_pos/core/presentation/widgets/savvy_text.dart';
import 'package:savvy_pos/features/inventory/domain/usecases/recommend_supplier.dart';

class SupplierComparisonTable extends StatelessWidget {
  final List<SupplierRecommendation> suppliers;
  final String? selectedSupplierUuid;
  final Function(String) onSelect;

  const SupplierComparisonTable({
    super.key,
    required this.suppliers,
    required this.selectedSupplierUuid,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    if (suppliers.isEmpty) {
      return Center(
        child: SavvyText.body('No suppliers linked to this product.'),
      );
    }

    return Column(
      children: [
        // Header
        Row(
          children: [
            Expanded(
                flex: 2,
                child: SavvyText.label('SUPPLIER',
                    color: context.savvy.colors.textSecondary)),
            Expanded(
                flex: 1,
                child: SavvyText.label('COST/UNIT',
                    color: context.savvy.colors.textSecondary,
                    align: TextAlign.right)),
            Expanded(
                flex: 1,
                child: SavvyText.label('LEAD TIME',
                    color: context.savvy.colors.textSecondary,
                    align: TextAlign.right)),
            Expanded(
                flex: 1,
                child: SavvyText.label('TOTAL',
                    color: context.savvy.colors.textSecondary,
                    align: TextAlign.right)),
            const SizedBox(width: 48), // Action space
          ],
        ),
        const SizedBox(height: 8),

        // List
        ...suppliers.map((s) {
          final isBest = s == suppliers.first; // Assumes sorted list passed in
          final isSelected = s.supplierUuid == selectedSupplierUuid;

          return Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: SavvyBox(
              color: isSelected
                  ? context.savvy.colors.surface
                  : null, // Highlight if selected
              border: isSelected
                  ? Border.all(color: context.savvy.colors.accent, width: 2)
                  : null,
              padding: const EdgeInsets.all(12),
              borderRadius: BorderRadius.circular(8),
              child: Row(
                children: [
                  Expanded(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SavvyText.body(s.supplierName,
                              textStyle:
                                  const TextStyle(fontWeight: FontWeight.w600)),
                          if (isBest)
                            Padding(
                              padding: const EdgeInsets.only(top: 4),
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 6, vertical: 2),
                                decoration: BoxDecoration(
                                  color: context.savvy.colors.success
                                      .withValues(alpha: 0.2),
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: SavvyText.small('BEST CHOICE',
                                    color: context.savvy.colors.success),
                              ),
                            )
                        ],
                      )),
                  Expanded(
                      flex: 1,
                      child: SavvyText.body('\$${s.cost.toStringAsFixed(2)}',
                          align: TextAlign.right)),
                  Expanded(
                      flex: 1,
                      child: SavvyText.body('${s.leadTime} days',
                          align: TextAlign.right)),
                  Expanded(
                      flex: 1,
                      child: SavvyText.h4('\$${s.totalCost.toStringAsFixed(2)}',
                          align: TextAlign.right)),
                  const SizedBox(width: 16),
                  isSelected
                      ? FilledButton(
                          onPressed: () => onSelect(s.supplierUuid),
                          child: const Text('SELECTED'),
                        )
                      : OutlinedButton(
                          onPressed: () => onSelect(s.supplierUuid),
                          child: const Text('SELECT'),
                        ),
                ],
              ),
            ),
          );
        }),
      ],
    );
  }
}
