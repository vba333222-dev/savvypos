import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:gap/gap.dart';
import 'package:savvy_pos/core/di/injection.dart';
import 'package:savvy_pos/features/inventory/domain/entities/recipe_entities.dart';
import 'package:savvy_pos/features/inventory/domain/repositories/i_recipe_repository.dart';
import 'package:savvy_pos/core/database/database.dart'; // Need ProductTable access
import 'package:drift/drift.dart' as drift; // For queries if needed

class RecipeEditorPage extends StatefulWidget {
  const RecipeEditorPage({super.key});

  @override
  State<RecipeEditorPage> createState() => _RecipeEditorPageState();
}

class _RecipeEditorPageState extends State<RecipeEditorPage> {
  final _recipeRepo = getIt<IRecipeRepository>();
  final _db = getIt<AppDatabase>();
  
  ProductTableData? _selectedProduct;
  Recipe? _currentRecipe;
  List<ProductTableData> _searchResults = [];
  bool _isLoading = false;
  
  // Ingredients Cache
  List<Ingredient> _availableIngredients = [];

  @override
  void initState() {
    super.initState();
    _loadIngredients();
  }

  Future<void> _loadIngredients() async {
    _availableIngredients = await _recipeRepo.getIngredients();
    if (mounted) setState(() {});
  }

  Future<void> _searchProducts(String query) async {
    if (query.isEmpty) {
      setState(() => _searchResults = []);
      return;
    }

    // Direct DB query via AppDatabase (MVP)
    // Ideally this goes through ProductRepository
    final results = await (_db.select(_db.productTable)
      ..where((tbl) => tbl.name.like('%$query%'))
      ..limit(10))
      .get();
      
    setState(() => _searchResults = results);
  }

  Future<void> _selectProduct(ProductTableData product) async {
    setState(() {
      _selectedProduct = product;
      _isLoading = true;
      _searchResults = []; // clear search
    });
    
    final recipe = await _recipeRepo.getRecipeForProduct(product.uuid);
    
    if (mounted) {
      setState(() {
        _currentRecipe = recipe ?? Recipe(productUuid: product.uuid, items: []);
        _isLoading = false;
      });
    }
  }

  Future<void> _saveRecipe() async {
    if (_currentRecipe == null) return;
    setState(() => _isLoading = true);
    await _recipeRepo.saveRecipe(_currentRecipe!);
    if (mounted) {
      setState(() => _isLoading = false);
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Recipe Saved!')));
    }
  }
  
  void _addIngredient(Ingredient ingredient, double quantity) {
    if (_currentRecipe == null) return;
    
    final newItem = RecipeItem(
      ingredientUuid: ingredient.uuid,
      quantityRequired: quantity,
      ingredientName: ingredient.name,
      unit: ingredient.unit,
    );
    
    final updatedItems = List<RecipeItem>.from(_currentRecipe!.items)..add(newItem);
    setState(() {
      _currentRecipe = _currentRecipe!.copyWith(items: updatedItems);
    });
  }
  
  void _removeIngredient(int index) {
    if (_currentRecipe == null) return;
    final updatedItems = List<RecipeItem>.from(_currentRecipe!.items)..removeAt(index);
    setState(() {
      _currentRecipe = _currentRecipe!.copyWith(items: updatedItems);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Recipe Management')),
      body: Row(
        children: [
          // Left: Product Search
          Expanded(
            flex: 1,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextField(
                    decoration: const InputDecoration(
                      labelText: 'Search Product',
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (val) => _searchProducts(val),
                  ),
                ),
                Expanded(
                  child: ListView.separated(
                    itemCount: _searchResults.length,
                    separatorBuilder: (_, __) => const Divider(),
                    itemBuilder: (context, index) {
                      final product = _searchResults[index];
                      return ListTile(
                        title: Text(product.name),
                        subtitle: Text('\$${product.price}'),
                        onTap: () => _selectProduct(product),
                        selected: _selectedProduct?.uuid == product.uuid,
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          const VerticalDivider(width: 1),
          // Right: Editor
          Expanded(
            flex: 2,
            child: _selectedProduct == null 
              ? const Center(child: Text('Select a product to edit recipe')) 
              : _buildEditor(),
          ),
        ],
      ),
    );
  }
  
  Widget _buildEditor() {
    if (_isLoading) return const Center(child: CircularProgressIndicator());
    
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Recipe for: ${_selectedProduct!.name}', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  Text('${_currentRecipe?.items.length ?? 0} Ingredients', style: Colors.grey.asTextStyle),
                ],
              ),
              ElevatedButton.icon(
                onPressed: _saveRecipe,
                icon: const Icon(Icons.save),
                label: const Text('Save Changes'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                ),
              )
            ],
          ),
        ),
        const Divider(),
        Expanded(
          child: _currentRecipe!.items.isEmpty
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.kitchen, size: 64, color: Colors.grey[300]),
                    const Gap(16),
                    const Text('No ingredients linked yet'),
                  ],
                ),
              )
            : ListView.separated(
                padding: const EdgeInsets.all(16),
                itemCount: _currentRecipe!.items.length,
                separatorBuilder: (_, __) => const Divider(),
                itemBuilder: (context, index) {
                  final item = _currentRecipe!.items[index];
                  return ListTile(
                    leading: CircleAvatar(child: Text('${index + 1}')),
                    title: Text(item.ingredientName ?? 'Unknown Ingredient'),
                    subtitle: Text('${item.quantityRequired} ${item.unit}'),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () => _removeIngredient(index),
                    ),
                  ).animate().fadeIn();
                },
              ),
        ),
        Container(
          padding: const EdgeInsets.all(16),
          color: Colors.grey[50],
          child: ElevatedButton.icon(
            onPressed: () => _showAddIngredientDialog(),
            icon: const Icon(Icons.add),
            label: const Text('Add Ingredient'),
            style: ElevatedButton.styleFrom(
              minimumSize: const Size.fromHeight(50),
            ),
          ),
        ),
      ],
    );
  }

  Future<void> _showAddIngredientDialog() async {
    await showDialog(
      context: context,
      builder: (context) => _AddIngredientDialog(
        ingredients: _availableIngredients,
        onAdd: _addIngredient,
      ),
    );
  }
}
extension TextStyleX on Color {
  TextStyle get asTextStyle => TextStyle(color: this);
}

class _AddIngredientDialog extends StatefulWidget {
  final List<Ingredient> ingredients;
  final Function(Ingredient, double) onAdd;

  const _AddIngredientDialog({required this.ingredients, required this.onAdd});

  @override
  State<_AddIngredientDialog> createState() => _AddIngredientDialogState();
}

class _AddIngredientDialogState extends State<_AddIngredientDialog> {
  Ingredient? _selected;
  final _qtyCtrl = TextEditingController(text: '1.0');

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Add Ingredient'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          DropdownButtonFormField<Ingredient>(
            decoration: const InputDecoration(labelText: 'Select Ingredient'),
            items: widget.ingredients.map((ing) => DropdownMenuItem(
              value: ing,
              child: Text('${ing.name} (${ing.unit})'),
            )).toList(),
            onChanged: (val) => setState(() => _selected = val),
          ),
          const Gap(16),
          TextField(
            controller: _qtyCtrl,
            decoration: const InputDecoration(labelText: 'Quantity Required'),
            keyboardType: TextInputType.number,
          ),
        ],
      ),
      actions: [
        TextButton(onPressed: () => Navigator.pop(context), child: const Text('Cancel')),
        ElevatedButton(
          onPressed: _selected == null ? null : () {
            final qty = double.tryParse(_qtyCtrl.text) ?? 0;
            if (qty > 0) {
              widget.onAdd(_selected!, qty);
              Navigator.pop(context);
            }
          }, 
          child: const Text('Add'),
        ),
      ],
    );
  }
}
