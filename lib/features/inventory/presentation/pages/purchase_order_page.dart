import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:savvy_pos/core/config/theme/savvy_theme.dart';
import 'package:savvy_pos/core/presentation/widgets/savvy_box.dart';
import 'package:savvy_pos/core/presentation/widgets/savvy_text.dart';
import 'package:savvy_pos/core/presentation/widgets/savvy_widgets.dart'; // Contains SavvyButton, SavvyTextField (assumed)
import 'package:savvy_pos/features/inventory/domain/usecases/recommend_supplier.dart';
import 'package:savvy_pos/features/inventory/presentation\widgets/supplier_comparison_table.dart';

// MOCKING BLOC for brevity since full implementation requires defining events/states in separate files
// In a real scenario, this would import the actual PurchaseOrderBloc
class PurchaseOrderPage extends StatefulWidget {
  const PurchaseOrderPage({super.key});

  @override
  State<PurchaseOrderPage> createState() => _PurchaseOrderPageState();
}

class _PurchaseOrderPageState extends State<PurchaseOrderPage> {
  // Local State for MVP demo
  String? selectedProductUuid;
  double quantityNeeded = 100;
  ReplenishmentStrategy strategy = ReplenishmentStrategy.LOWEST_COST;
  String? selectedSupplierUuid;
  
  // Mock Data
  final mockSuppliers = [
    {'supplierUuid': 's1', 'name': 'Alpha Supplies', 'cost': 10.50, 'leadTime': 5},
    {'supplierUuid': 's2', 'name': 'Beta Logistics', 'cost': 12.00, 'leadTime': 2},
    {'supplierUuid': 's3', 'name': 'Gamma Traders', 'cost': 9.80, 'leadTime': 10},
  ];

  @override
  Widget build(BuildContext context) {
    // Determine recommendations
    final recommender = RecommendSupplier();
    final recommendations = recommender.execute(
      linkedSuppliers: mockSuppliers, 
      quantityNeeded: quantityNeeded, 
      strategy: strategy
    );

    return Scaffold(
      backgroundColor: context.savvy.colors.bgCanvas,
      appBar: AppBar(
        title: SavvyText.h3('Create Purchase Order'),
        backgroundColor: context.savvy.colors.bgSurface,
        elevation: 0,
        iconTheme: IconThemeData(color: context.savvy.colors.textPrimary),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             // 1. Configuration Panel
             SavvyBox(
               color: context.savvy.colors.bgSurface,
               padding: const EdgeInsets.all(24),
               borderRadius: BorderRadius.circular(12),
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   SavvyText.h4('Replenishment Settings'),
                   const SizedBox(height: 16),
                   Row(
                     children: [
                       Expanded(
                         child: Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                             SavvyText.label('PRODUCT'),
                             const SizedBox(height: 8),
                             // Placeholder for Product Dropdown
                             Container(
                               height: 48,
                               padding: const EdgeInsets.symmetric(horizontal: 12),
                               decoration: BoxDecoration(
                                 border: Border.all(color: context.savvy.colors.border),
                                 borderRadius: BorderRadius.circular(8),
                               ),
                               alignment: Alignment.centerLeft,
                               child: SavvyText.body('Premium Coffee Beans (1kg)'),
                             ),
                           ],
                         )
                       ),
                       const SizedBox(width: 24),
                       Expanded(
                         child: Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                             SavvyText.label('QUANTITY NEEDED'),
                             const SizedBox(height: 8),
                             // Placeholder for Quantity Input
                             Container(
                               height: 48,
                               alignment: Alignment.centerLeft,
                               child: Row(
                                 children: [
                                   IconButton(onPressed: () => setState(() => quantityNeeded -= 10), icon: const Icon(Icons.remove)),
                                   Container(
                                      width: 80, 
                                      alignment: Alignment.center,
                                      child: SavvyText.h4(quantityNeeded.toStringAsFixed(0))
                                   ),
                                   IconButton(onPressed: () => setState(() => quantityNeeded += 10), icon: const Icon(Icons.add)),
                                 ],
                               ),
                             ),
                           ],
                         )
                       ),
                     ],
                   ),
                   const SizedBox(height: 24),
                   SavvyText.label('STRATEGY'),
                   const SizedBox(height: 8),
                   Row(
                     children: [
                       _StrategyChip(
                         label: 'Lowest Cost', 
                         isSelected: strategy == ReplenishmentStrategy.LOWEST_COST,
                         onTap: () => setState(() => strategy = ReplenishmentStrategy.LOWEST_COST),
                       ),
                       const SizedBox(width: 12),
                       _StrategyChip(
                         label: 'Fastest Delivery', 
                         isSelected: strategy == ReplenishmentStrategy.FASTEST_DELIVERY,
                         onTap: () => setState(() => strategy = ReplenishmentStrategy.FASTEST_DELIVERY),
                       ),
                     ],
                   )
                 ],
               ),
             ),
             
             const SizedBox(height: 24),
             
             // 2. Comparison Table
             SavvyText.h4('Supplier Recommendations'),
             const SizedBox(height: 16),
             SupplierComparisonTable(
               suppliers: recommendations, 
               selectedSupplierUuid: selectedSupplierUuid,
               onSelect: (uuid) => setState(() => selectedSupplierUuid = uuid),
             ),
             
             const SizedBox(height: 32),
             
             // 3. Action
             Align(
               alignment: Alignment.centerRight,
               child: SavvyButton(
                 text: 'GENERATE PURCHASE ORDER',
                 style: SavvyButtonStyle.primary,
                 width: 280,
                 icon: Icons.assignment_turned_in_outlined,
                 onPressed: selectedSupplierUuid == null ? null : () {
                   // Dispatch CreatePO Event
                   ScaffoldMessenger.of(context).showSnackBar(
                     SnackBar(content: Text('PO Generated for Supplier: $selectedSupplierUuid'))
                   );
                 },
               ),
             )
          ],
        ),
      ),
    );
  }
}

class _StrategyChip extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _StrategyChip({required this.label, required this.isSelected, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? context.savvy.colors.primary : context.savvy.colors.bgSurface,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected ? context.savvy.colors.primary : context.savvy.colors.border,
          )
        ),
        child: SavvyText.body(
          label, 
          color: isSelected ? Colors.white : context.savvy.colors.textPrimary
        ),
      ),
    );
  }
}
