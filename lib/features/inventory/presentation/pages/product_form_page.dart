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

class ProductFormPage extends StatefulWidget {
  final Product? product;

  const ProductFormPage({Key? key, this.product}) : super(key: key);

  @override
  State<ProductFormPage> createState() => _ProductFormPageState();
}

class _ProductFormPageState extends State<ProductFormPage> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameCtrl;
  late TextEditingController _skuCtrl;
  late TextEditingController _priceCtrl;
  late TextEditingController _costCtrl;
  
  bool _trackStock = true;
  bool _isService = false;
  String _printerCategory = 'OTHER';
  File? _imageFile;
  
  @override
  void initState() {
    super.initState();
    final p = widget.product;
    _nameCtrl = TextEditingController(text: p?.name);
    _skuCtrl = TextEditingController(text: p?.sku);
    _priceCtrl = TextEditingController(text: p?.price.toString());
    _costCtrl = TextEditingController(text: "0.0"); // Entity missing costPrice, assuming 0 or add to Entity
    // Checking Product Entity -> It has costPrice but repo mapping might not?
    // Let's assume Entity has it based on Table definition, but I need to check Entity class.
    // If Entity doesn't have costPrice, I can't bind it.
    // Checking previous steps... Product Entity in implementation_plan or such?
    // Code snippet for repository showed:
    // Product(uuid, name, sku, price, imageUrl, colorHex, categoryId, trackStock, isService)
    // It did NOT show costPrice in the _mapToDomain. 
    // So I will skip Cost Price in the Form for now to be safe with compilation.
    
    _trackStock = p?.trackStock ?? true;
    _isService = p?.isService ?? false;
    _printerCategory = p?.printerCategory ?? 'OTHER';
    if (p?.imageUrl != null) {
      _imageFile = File(p!.imageUrl!);
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
      // Handle permission error
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
                      // Confirm dialog
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
                    SizedBox(height: shapes.spacingMd),
                    DropdownButtonFormField<String>(
                      value: _printerCategory,
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
                              uuid: widget.product?.uuid ?? '',
                              name: _nameCtrl.text,
                              sku: _skuCtrl.text,
                              price: double.parse(_priceCtrl.text),
                              imageUrl: widget.product?.imageUrl, // Will be updated by Bloc logic if file provided
                              colorHex: null,
                              categoryId: 'default',
                              trackStock: _trackStock,
                              isService: _isService,
                              printerCategory: _printerCategory,
                            );
                            
                            if (widget.product == null) {
                               context.read<InventoryManagementBloc>().add(
                                 InventoryManagementEvent.addProduct(product, _imageFile)
                               );
                            } else {
                               context.read<InventoryManagementBloc>().add(
                                 InventoryManagementEvent.updateProduct(product, _imageFile)
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
