import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';
import 'package:savvy_pos/core/config/theme_config.dart';
import 'package:savvy_pos/features/inventory/domain/entities/product.dart';
import 'package:savvy_pos/features/inventory/presentation/bloc/inventory_management_bloc.dart';
import 'package:uuid/uuid.dart';
import 'package:savvy_pos/features/inventory/presentation/pages/recipe_setup_page.dart';
import 'package:savvy_pos/features/inventory/domain/entities/modifier.dart';
import 'package:savvy_pos/features/inventory/domain/repositories/i_product_repository.dart';

class ProductFormPage extends StatefulWidget {
  final Product? product;

  const ProductFormPage({super.key, this.product});

  @override
  State<ProductFormPage> createState() => _ProductFormPageState();
}

class _ProductFormPageState extends State<ProductFormPage> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameCtrl;
  late TextEditingController _skuCtrl;
  late TextEditingController _priceCtrl;
  // late TextEditingController _costCtrl; // Skipped
  
  bool _trackStock = true;
  bool _isService = false;
  bool _isComposite = false; // BoH
  String _printerCategory = 'OTHER';
  String _category = 'OTHER';
  File? _imageFile;
  
  // BoH State
  String _productUuid = '';
  List<ModifierGroup> _allModifierGroups = [];
  Set<String> _selectedModifierGroupUuids = {};
  bool _isLoadingModifiers = true;
  
  @override
  void initState() {
    super.initState();
    final p = widget.product;
    _productUuid = p?.uuid ?? const Uuid().v4();
    
    _nameCtrl = TextEditingController(text: p?.name);
    _skuCtrl = TextEditingController(text: p?.sku);
    _priceCtrl = TextEditingController(text: p?.price.toString());
    
    _trackStock = p?.trackStock ?? true;
    _isService = p?.isService ?? false;
    _isService = p?.isService ?? false;
    _isComposite = p?.isComposite ?? false;
    _printerCategory = p?.printerCategory ?? 'OTHER';
    _category = p?.categoryId ?? 'OTHER';
    if (p?.imageUrl != null) {
      _imageFile = File(p!.imageUrl!);
    }
    
    _loadBoHData();
  }

  Future<void> _loadBoHData() async {
    try {
      final repo = GetIt.I<IProductRepository>();
      final allGroupsResult = await repo.getAllModifierGroups();
      
      List<ModifierGroup> allGroups = [];
      allGroupsResult.fold((l) {}, (r) => allGroups = r);

      // If editing, get linked groups
      List<ModifierGroup> linkedGroups = [];
      if (widget.product != null) {
         final linkedResult = await repo.getModifierGroups(widget.product!.uuid);
         linkedResult.fold((l) {}, (r) => linkedGroups = r);
      }
      
      if (mounted) {
        setState(() {
          _allModifierGroups = allGroups;
          _selectedModifierGroupUuids = linkedGroups.map((g) => g.uuid).toSet();
          _isLoadingModifiers = false;
        });
      }
    } catch (e) {
      // Handle error
    }
  }

  Future<void> _pickImage() async {
    try {
      final picker = ImagePicker();
      final picked = await picker.pickImage(source: ImageSource.gallery);
      if (picked != null) {
        setState(() => _imageFile = File(picked.path));
      }
    } catch (e) {
      if (mounted) ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Failed to pick image')));
    }
  }

  void _generateSku() {
    setState(() {
      _skuCtrl.text = const Uuid().v4().substring(0, 8).toUpperCase();
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => GetIt.I<InventoryManagementBloc>(),
      child: BlocConsumer<InventoryManagementBloc, InventoryManagementState>(
        listener: (context, state) {
          state.maybeWhen(
            success: () => Navigator.pop(context),
            error: (msg) => ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg))),
            orElse: () {},
          );
        },
        builder: (context, state) {
          final colors = context.savvy.colors;
          final shapes = context.savvy.shapes;
          final isLoading = state == const InventoryManagementState.loading();

          return Scaffold(
            backgroundColor: colors.bgPrimary,
            appBar: AppBar(
              title: Text(widget.product == null ? 'New Product' : 'Edit Product'),
              backgroundColor: colors.bgPrimary,
              actions: [
                if (widget.product != null)
                  IconButton(
                    icon: const Icon(Icons.delete),
                    color: colors.stateError,
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (_) => AlertDialog(
                          title: const Text('Delete Product?'),
                          content: const Text('This will soft delete the product.'),
                          actions: [
                            TextButton(onPressed: () => Navigator.pop(context), child: const Text('Cancel')),
                            TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                  context.read<InventoryManagementBloc>().add(
                                    InventoryManagementEvent.deleteProduct(widget.product!.uuid)
                                  );
                                }, 
                                child: Text('Delete', style: TextStyle(color: colors.stateError))
                            ),
                          ],
                        ),
                      );
                    },
                  ),
              ],
            ),
            body: SingleChildScrollView(
              padding: EdgeInsets.all(shapes.spacingLg),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Image Picker
                    Center(
                      child: GestureDetector(
                        onTap: _pickImage,
                        child: Container(
                          width: 120, height: 120,
                          decoration: BoxDecoration(
                            color: colors.bgElevated,
                            borderRadius: BorderRadius.circular(shapes.radiusMd),
                            border: Border.all(color: colors.borderDefault),
                            image: _imageFile != null 
                              ? DecorationImage(image: FileImage(_imageFile!), fit: BoxFit.cover)
                              : null,
                          ),
                          child: _imageFile == null 
                            ? Icon(Icons.add_a_photo, size: 40, color: colors.textSecondary)
                            : null,
                        ),
                      ),
                    ),
                    SizedBox(height: shapes.spacingLg),
                    
                    TextFormField(
                      controller: _nameCtrl,
                      decoration: const InputDecoration(labelText: 'Product Name', border: OutlineInputBorder()),
                      validator: (v) => v?.isEmpty == true ? 'Required' : null,
                    ),
                    SizedBox(height: shapes.spacingMd),
                    
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: _skuCtrl,
                            decoration: const InputDecoration(labelText: 'SKU', border: OutlineInputBorder()),
                            // validator: (v) => v?.isEmpty == true ? 'Required' : null, // SKU optional?
                          ),
                        ),
                        const SizedBox(width: 8),
                        IconButton(icon: const Icon(Icons.refresh), onPressed: _generateSku),
                      ],
                    ),
                    SizedBox(height: shapes.spacingMd),
                    
                    TextFormField(
                      controller: _priceCtrl,
                      decoration: const InputDecoration(labelText: 'Selling Price', border: OutlineInputBorder(), prefixText: '\$'),
                      keyboardType: const TextInputType.numberWithOptions(decimal: true),
                      inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}'))],
                      validator: (v) {
                        if (v == null || v.isEmpty) return 'Required';
                        if (double.tryParse(v) == null) return 'Invalid';
                        return null;
                      },
                    ),
                    
                    SizedBox(height: shapes.spacingLg),
                    SwitchListTile(
                      title: const Text('Track Stock'),
                      value: _trackStock,
                      onChanged: (v) => setState(() => _trackStock = v),
                    ),
                     SwitchListTile(
                      title: const Text('Is Service'),
                      value: _isService,
                      onChanged: (v) => setState(() => _isService = v),
                    ),
                    
                    // BoH Fields
                    const Divider(),
                    SwitchListTile(
                      title: const Text('Composite Product (Made of Ingredients)'),
                      subtitle: const Text('Stocks deducted from recipe ingredients'),
                      value: _isComposite,
                      onChanged: (v) => setState(() => _isComposite = v),
                    ),
                    
                    if (_isComposite)
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0, bottom: 16.0),
                        child: OutlinedButton.icon(
                          onPressed: () {
                             // Must save product first logic? 
                             // Or just pass dummy product object to page, but page needs repo queries.
                             // Best: Pass Product with Current UUID.
                             // If product not saved in DB, linking recipe might fail FK constraints (Recipe Table -> Product).
                             // So user MUST save product first.
                             if (widget.product == null) {
                               ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Please save product first to manage recipe.')));
                               return;
                             }
                             Navigator.push(context, MaterialPageRoute(
                               builder: (_) => RecipeSetupPage(product: widget.product!)
                             ));
                          }, 
                          icon: const Icon(Icons.restaurant_menu),
                          label: const Text('Manage Recipe'),
                        ),
                      ),

                    const SizedBox(height: 16),
                    Text('Modifiers', style: TextStyle(fontWeight: FontWeight.bold, color: colors.textPrimary)),
                    if (_isLoadingModifiers) const LinearProgressIndicator(),
                    ..._allModifierGroups.map((group) {
                       final isSelected = _selectedModifierGroupUuids.contains(group.uuid);
                       return CheckboxListTile(
                         title: Text(group.name),
                         subtitle: Text('${group.items.length} items'),
                         value: isSelected,
                         onChanged: (val) {
                           setState(() {
                             if (val == true) {
                               _selectedModifierGroupUuids.add(group.uuid);
                             } else {
                               _selectedModifierGroupUuids.remove(group.uuid);
                             }
                           });
                         },
                       );
                    }),

                    SizedBox(height: shapes.spacingMd),
                    DropdownButtonFormField<String>(
                      initialValue: _category,
                      decoration: const InputDecoration(labelText: 'Category', border: OutlineInputBorder()),
                      items: const [
                        DropdownMenuItem(value: 'STARTER', child: Text('Starter')),
                        DropdownMenuItem(value: 'MAIN', child: Text('Main Course')),
                        DropdownMenuItem(value: 'DESSERT', child: Text('Dessert')),
                        DropdownMenuItem(value: 'BEVERAGE', child: Text('Beverage')),
                        DropdownMenuItem(value: 'ALCOHOL', child: Text('Alcohol')),
                        DropdownMenuItem(value: 'MERCH', child: Text('Merchandise')),
                        DropdownMenuItem(value: 'SERVICE', child: Text('Service')),
                        DropdownMenuItem(value: 'OTHER', child: Text('Other')),
                      ],
                      onChanged: (v) => setState(() => _category = v!),
                    ),
                    SizedBox(height: shapes.spacingMd),

                    DropdownButtonFormField<String>(
                      initialValue: _printerCategory,
                      decoration: const InputDecoration(labelText: 'Printer Category', border: OutlineInputBorder()),
                      items: const [
                        DropdownMenuItem(value: 'OTHER', child: Text('Other (Main)')),
                        DropdownMenuItem(value: 'FOOD', child: Text('Food (Kitchen)')),
                        DropdownMenuItem(value: 'BEVERAGE', child: Text('Beverage (Bar)')),
                      ],
                      onChanged: (v) => setState(() => _printerCategory = v!),
                    ),
                    
                    SizedBox(height: shapes.spacingXl),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: isLoading ? null : () {
                          if (_formKey.currentState!.validate()) {
                            final product = Product(
                              uuid: _productUuid, // Use pre-generated or existing
                              name: _nameCtrl.text,
                              sku: _skuCtrl.text,
                              price: double.parse(_priceCtrl.text),
                              imageUrl: widget.product?.imageUrl, 
                              colorHex: null,
                              categoryId: _category, // Updated
                              trackStock: _trackStock,
                              isService: _isService,
                              isComposite: _isComposite,
                              printerCategory: _printerCategory,
                            );
                            
                            if (widget.product == null) {
                               context.read<InventoryManagementBloc>().add(
                                 InventoryManagementEvent.addProduct(
                                    product, 
                                    _imageFile, 
                                    modifierGroupUuids: _selectedModifierGroupUuids.toList()
                                 )
                               );
                            } else {
                               context.read<InventoryManagementBloc>().add(
                                 InventoryManagementEvent.updateProduct(
                                    product, 
                                    _imageFile,
                                    modifierGroupUuids: _selectedModifierGroupUuids.toList()
                                 )
                               );
                            }
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: colors.brandPrimary,
                          foregroundColor: colors.textInverse,
                        ),
                        child: isLoading 
                           ? const CircularProgressIndicator(color: Colors.white)
                           : const Text('Save Product'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
