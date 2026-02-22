import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:savvy_pos/features/inventory/domain/entities/inventory_entities.dart';
import 'package:savvy_pos/features/inventory/presentation/bloc/inventory_bloc.dart';

class NewPurchaseOrderDialog extends StatefulWidget {
  const NewPurchaseOrderDialog({super.key});

  @override
  State<NewPurchaseOrderDialog> createState() => _NewPurchaseOrderDialogState();
}

class _NewPurchaseOrderDialogState extends State<NewPurchaseOrderDialog> {
  String? _selectedSupplierUuid;
  final List<PurchaseOrderItem> _items = [];
  final _notesCtrl = TextEditingController();

  // Mock product search for now. Ideally use a ProductSearchDelegate or Bloc.
  final TextEditingController _productSearchCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InventoryBloc, InventoryState>(
      builder: (context, state) {
        return Dialog(
          child: SizedBox(
            width: 600,
            height: 700,
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("New Purchase Order",
                      style: Theme.of(context).textTheme.headlineSmall),
                  const SizedBox(height: 24),
                  DropdownButtonFormField<String>(
                    decoration: const InputDecoration(
                        labelText: "Supplier", border: OutlineInputBorder()),
                    initialValue: _selectedSupplierUuid,
                    items: state.suppliers
                        .map((s) => DropdownMenuItem(
                            value: s.uuid, child: Text(s.name)))
                        .toList(),
                    onChanged: (v) => setState(() => _selectedSupplierUuid = v),
                  ),
                  const SizedBox(height: 16),
                  const Text("Items",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _productSearchCtrl,
                          decoration: const InputDecoration(
                              hintText: "Product UUID (Mock)"),
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.add),
                        onPressed: () {
                          if (_productSearchCtrl.text.isNotEmpty) {
                            setState(() {
                              _items.add(PurchaseOrderItem(
                                  poUuid: '',
                                  productUuid: _productSearchCtrl.text,
                                  productName:
                                      "Product ${_productSearchCtrl.text}",
                                  quantityOrdered: 1,
                                  quantityReceived: 0,
                                  unitCost: 10.0 // Mock cost
                                  ));
                            });
                          }
                        },
                      )
                    ],
                  ),
                  const SizedBox(height: 8),
                  Expanded(
                    child: ListView.separated(
                      itemCount: _items.length,
                      separatorBuilder: (_, __) => const Divider(),
                      itemBuilder: (context, index) {
                        final item = _items[index];
                        return ListTile(
                          title: Text(item.productName ??
                              item.productUuid ??
                              'Unknown Item'),
                          subtitle: Text('\$${item.unitCost} ea'),
                          trailing: SizedBox(
                            width: 150,
                            child: Row(
                              children: [
                                Expanded(
                                  child: TextField(
                                    keyboardType: TextInputType.number,
                                    decoration:
                                        const InputDecoration(labelText: "Qty"),
                                    onChanged: (v) {
                                      // Update quantity
                                      final val = double.tryParse(v) ?? 1;
                                      _items[index] =
                                          item.copyWith(quantityOrdered: val);
                                    },
                                  ),
                                ),
                                IconButton(
                                  icon: const Icon(Icons.delete,
                                      color: Colors.red),
                                  onPressed: () =>
                                      setState(() => _items.removeAt(index)),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                      controller: _notesCtrl,
                      decoration: const InputDecoration(labelText: "Notes")),
                  const SizedBox(height: 24),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                        onPressed:
                            _selectedSupplierUuid == null || _items.isEmpty
                                ? null
                                : () {
                                    context
                                        .read<InventoryBloc>()
                                        .add(InventoryEvent.createPo(
                                          supplierUuid: _selectedSupplierUuid!,
                                          targetWarehouseUuid: 'MAIN_WH',
                                          items: _items,
                                          notes: _notesCtrl.text,
                                        ));
                                    Navigator.pop(context);
                                  },
                        child: const Text("Create Order")),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
