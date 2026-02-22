import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:savvy_pos/core/config/theme/savvy_theme.dart';
import 'package:savvy_pos/features/inventory/domain/entities/product.dart';
import 'package:savvy_pos/features/inventory/presentation/bloc/menu_management_bloc.dart';

class ProductEditorPage extends StatelessWidget {
  final Product? product; // Null = New

  const ProductEditorPage({super.key, this.product});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final bloc = GetIt.I<MenuManagementBloc>();
        bloc.add(const MenuManagementEvent.loadAllModifiers());
        if (product != null) {
          bloc.add(MenuManagementEvent.loadProductDetails(product!.uuid));
        }
        return bloc;
      },
      child: _ProductEditorView(product: product),
    );
  }
}

class _ProductEditorView extends StatefulWidget {
  final Product? product;
  const _ProductEditorView({this.product});

  @override
  State<_ProductEditorView> createState() => _ProductEditorViewState();
}

class _ProductEditorViewState extends State<_ProductEditorView> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameCtrl;
  late TextEditingController _priceCtrl;
  late TextEditingController _skuCtrl;
  String? _selectedCategory; // Just store ID
  String _printerCategory = 'FOOD'; // FOOD, BEVERAGE, OTHER

  final Set<String> _selectedModifierGroups = {};

  @override
  void initState() {
    super.initState();
    _nameCtrl = TextEditingController(text: widget.product?.name ?? '');
    _priceCtrl =
        TextEditingController(text: widget.product?.price.toString() ?? '');
    _skuCtrl = TextEditingController(text: widget.product?.sku ?? '');
    _selectedCategory = widget.product?.categoryId;
    _printerCategory = widget.product?.printerCategory ?? 'FOOD';

    // Note: Modifier Groups are loaded async. We listen to state to populate initial selection if editing.
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.savvy;

    return BlocConsumer<MenuManagementBloc, MenuManagementState>(
      listener: (context, state) {
        if (state.isSuccess == true) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text('Product Saved!'), backgroundColor: Colors.green));
          Navigator.pop(context);
        }

        // Initial load of editing modifiers
        if (widget.product != null &&
            state.editingProductModifierIds.isNotEmpty &&
            _selectedModifierGroups.isEmpty) {
          setState(() {
            _selectedModifierGroups.addAll(state.editingProductModifierIds);
          });
        }
      },
      builder: (context, state) {
        if (state.isLoading && state.allModifierGroups.isEmpty) {
          return const Scaffold(
              body: Center(child: CircularProgressIndicator()));
        }

        return Scaffold(
          backgroundColor: theme.colors.bgPrimary,
          appBar: AppBar(
            title:
                Text(widget.product == null ? 'New Product' : 'Edit Product'),
            actions: [
              TextButton.icon(
                onPressed: _save,
                icon: const Icon(Icons.save),
                label: const Text('SAVE'),
                style: TextButton.styleFrom(foregroundColor: Colors.white),
              )
            ],
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Basic Info Section
                  Text('Basic Details',
                      style: Theme.of(context).textTheme.titleLarge),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _nameCtrl,
                    decoration: const InputDecoration(
                        labelText: 'Product Name',
                        border: OutlineInputBorder()),
                    validator: (v) => v!.isEmpty ? 'Required' : null,
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: _priceCtrl,
                          decoration: const InputDecoration(
                              labelText: 'Price',
                              prefixText: '\$',
                              border: OutlineInputBorder()),
                          keyboardType: TextInputType.number,
                          validator: (v) => v!.isEmpty ? 'Required' : null,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: TextFormField(
                          controller: _skuCtrl,
                          decoration: const InputDecoration(
                              labelText: 'SKU / Barcode',
                              border: OutlineInputBorder()),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),

                  // Category & Printer
                  Row(
                    children: [
                      Expanded(
                        child: DropdownButtonFormField<String>(
                          initialValue: _selectedCategory ??
                              'main', // Default or handle null
                          decoration: const InputDecoration(
                              labelText: 'Category',
                              border: OutlineInputBorder()),
                          items: const [
                            DropdownMenuItem(
                                value: 'main', child: Text('Main Menu')),
                            DropdownMenuItem(
                                value: 'drinks', child: Text('Drinks')),
                            DropdownMenuItem(
                                value: 'sides', child: Text('Sides')),
                          ],
                          onChanged: (v) =>
                              setState(() => _selectedCategory = v),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: DropdownButtonFormField<String>(
                          initialValue: _printerCategory,
                          decoration: const InputDecoration(
                              labelText: 'Printer Routing',
                              border: OutlineInputBorder()),
                          items: const [
                            DropdownMenuItem(
                                value: 'FOOD', child: Text('Food (Kitchen)')),
                            DropdownMenuItem(
                                value: 'BEVERAGE',
                                child: Text('Beverage (Bar)')),
                            DropdownMenuItem(
                                value: 'OTHER', child: Text('Other')),
                          ],
                          onChanged: (v) =>
                              setState(() => _printerCategory = v!),
                        ),
                      ),
                    ],
                  ),

                  const Divider(height: 48),

                  // Modifiers Section
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Modifier Groups',
                          style: Theme.of(context).textTheme.titleLarge),
                      TextButton(
                        onPressed: () {
                          // Navigate to Manager?
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                              content: Text(
                                  'Go to "Modifier Groups" page to create new ones.')));
                        },
                        child: const Text('Manage Groups'),
                      )
                    ],
                  ),
                  const Text(
                      'Select which modifier options are available for this product.'),
                  const SizedBox(height: 16),

                  if (state.allModifierGroups.isEmpty)
                    const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Text(
                          'No modifier groups available. Create some first!'),
                    )
                  else
                    ...state.allModifierGroups.map((group) {
                      final isSelected =
                          _selectedModifierGroups.contains(group.uuid);
                      return CheckboxListTile(
                        title: Text(group.name),
                        subtitle: Text('${group.items.length} options'),
                        value: isSelected,
                        onChanged: (v) {
                          setState(() {
                            if (v!) {
                              _selectedModifierGroups.add(group.uuid);
                            } else {
                              _selectedModifierGroups.remove(group.uuid);
                            }
                          });
                        },
                      );
                    }),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void _save() {
    if (_formKey.currentState!.validate()) {
      context.read<MenuManagementBloc>().add(MenuManagementEvent.saveProduct(
            uuid: widget.product?.uuid,
            name: _nameCtrl.text,
            price: double.parse(_priceCtrl.text),
            categoryId: _selectedCategory ?? 'main',
            sku: _skuCtrl.text,
            printerCategory: _printerCategory,
            modifierGroupUuids: _selectedModifierGroups.toList(),
          ));
    }
  }
}
