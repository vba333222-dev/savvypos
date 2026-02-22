import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:savvy_pos/core/di/injection.dart';
import 'package:savvy_pos/features/inventory/presentation/bloc/inventory_bloc.dart';
import 'package:savvy_pos/features/inventory/presentation/pages/product_list_page.dart';
import 'package:savvy_pos/features/inventory/presentation/pages/purchase_order_pages.dart'; // Corrected import
import 'package:savvy_pos/features/inventory/presentation/pages/supplier_list_page.dart'; // Added
import 'package:savvy_pos/features/inventory/presentation/pages/modifier_manage_page.dart'; // Abded
import 'package:savvy_pos/features/giftcards/presentation/pages/gift_card_dashboard_page.dart'; // Added

class InventoryDashboardPage extends StatelessWidget {
  const InventoryDashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          getIt<InventoryBloc>()..add(const InventoryEvent.started()),
      child: Scaffold(
        appBar: AppBar(title: const Text('Inventory Management')),
        body: BlocBuilder<InventoryBloc, InventoryState>(
          builder: (context, state) {
            if (state.isLoading)
              return const Center(child: CircularProgressIndicator());

            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // LEFT: Dashboard
                Expanded(
                  flex: 3,
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // KPI Cards
                        Row(
                          children: [
                            _KpiCard(
                              title: 'Stock Value',
                              value:
                                  '\$${state.totalStockValue.toStringAsFixed(2)}',
                              icon: Icons.attach_money,
                              color: Colors.green,
                            ),
                            const SizedBox(width: 16),
                            _KpiCard(
                              title: 'Low Stock Items',
                              value: '${state.lowStockProductUuids.length}',
                              icon: Icons.warning_amber,
                              color: Colors.orange,
                            ),
                            const SizedBox(width: 16),
                            _KpiCard(
                              title: 'Active POs',
                              value: '${state.activePurchaseOrders.length}',
                              icon: Icons.local_shipping,
                              color: Colors.blue,
                            ),
                          ],
                        ),
                        const SizedBox(height: 32),

                        // Active Purchase Orders
                        const Text('Active Purchase Orders',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 16),
                        Card(
                          child: ListView.separated(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: state.activePurchaseOrders.length,
                            separatorBuilder: (_, __) => const Divider(),
                            itemBuilder: (context, index) {
                              final po = state.activePurchaseOrders[index];
                              return ListTile(
                                leading: const CircleAvatar(
                                    child: Icon(Icons.description)),
                                title: Text(po.referenceNumber ??
                                    'PO #${po.uuid.substring(0, 6)}'),
                                subtitle: Text(
                                    'Total: \$${po.totalCost.toStringAsFixed(2)} - ${po.status.name}'),
                                trailing: ElevatedButton(
                                    onPressed: () {
                                      // Navigate to Receive Page (Todo)
                                    },
                                    child: const Text('Receive')),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // RIGHT: Actions Sidebar
                Expanded(
                  flex: 1,
                  child: Container(
                    color: Colors.grey[50],
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      children: [
                        SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: FilledButton.icon(
                              onPressed: () {
                                // Create PO Dialog (Todo)
                              },
                              icon: const Icon(Icons.add),
                              label: const Text('New Purchase Order')),
                        ),
                        const SizedBox(height: 16),
                        SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: OutlinedButton.icon(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) =>
                                            const ProductListPage()));
                              },
                              icon: const Icon(Icons.inventory),
                              label: const Text('Products')),
                        ),
                        const SizedBox(height: 16),
                        SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: OutlinedButton.icon(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) =>
                                            const SupplierListPage()));
                              },
                              icon: const Icon(Icons.people),
                              label: const Text('Suppliers')),
                        ),
                        const SizedBox(height: 16),
                        SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: OutlinedButton.icon(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) =>
                                            const ModifierManagePage()));
                              },
                              icon: const Icon(Icons.list_alt),
                              label: const Text('Menu Modifiers')),
                        ),
                        const SizedBox(height: 16),
                        SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: OutlinedButton.icon(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) =>
                                            const PurchaseOrderListPage()));
                              },
                              icon: const Icon(Icons.description),
                              label: const Text('Purchase Orders')),
                        ),
                        const SizedBox(height: 16),
                        SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: OutlinedButton.icon(
                              onPressed: () {
                                // Navigate to Gift Cards
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) =>
                                            const GiftCardDashboardPage()));
                              },
                              icon: const Icon(Icons.card_giftcard),
                              label: const Text('Gift Cards')),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _KpiCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color color;

  const _KpiCard(
      {required this.title,
      required this.value,
      required this.icon,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(icon, color: color, size: 32),
              const SizedBox(height: 16),
              Text(value,
                  style: const TextStyle(
                      fontSize: 28, fontWeight: FontWeight.bold)),
              const SizedBox(height: 4),
              Text(title, style: TextStyle(color: Colors.grey[600])),
            ],
          ),
        ),
      ),
    );
  }
}
