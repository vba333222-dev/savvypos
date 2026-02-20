import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:savvy_pos/features/inventory/domain/entities/ingredient.dart';
import 'package:savvy_pos/features/inventory/domain/entities/product.dart';
import 'package:savvy_pos/features/inventory/domain/entities/recipe.dart';
import 'package:savvy_pos/features/inventory/domain/repositories/i_product_repository.dart';

class RecipeSetupPage extends StatefulWidget {
  final Product product;

  const RecipeSetupPage({super.key, required this.product});

  @override
  State<RecipeSetupPage> createState() => _RecipeSetupPageState();
}

class _RecipeSetupPageState extends State<RecipeSetupPage> {
  final IProductRepository _repo = GetIt.I<IProductRepository>();
  bool _isLoading = true;
  
  List<Ingredient> _allIngredients = [];
  Map<String, double> _recipe = {}; // Ingredient UUID -> Quantity

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    final ingredientsResult = await _repo.getAllIngredients();
    final ingredients = ingredientsResult.fold((l) => <Ingredient>[], (r) => r);

    final recipeResult = await _repo.getRecipeForProduct(widget.product.uuid);
    final recipe = recipeResult.fold((l) => null, (r) => r);
    
    // Map<String, double>
    final currentRecipe = <String, double>{};
    if (recipe != null) {
      for (var item in recipe.items) {
        currentRecipe[item.ingredient.uuid] = item.quantity;
      }
    }

    if (mounted) {
      setState(() {
        _allIngredients = ingredients;
        _recipe = currentRecipe;
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Recipe: ${widget.product.name}')),
      floatingActionButton: FloatingActionButton(
        onPressed: _addIngredientToRecipe,
        child: const Icon(Icons.add),
      ),
      body: _isLoading 
        ? const Center(child: CircularProgressIndicator()) 
        : Column(
            children: [
               Expanded(
                 child: ListView.builder(
                   itemCount: _recipe.length,
                   itemBuilder: (context, index) {
                     final entry = _recipe.entries.elementAt(index);
                     final ingredient = _allIngredients.firstWhere((i) => i.uuid == entry.key, orElse: () => Ingredient(uuid: '', name: 'Unknown', unit: '', currentStock: 0, costPerUnit: 0));
                     
                     return ListTile(
                       title: Text(ingredient.name),
                       subtitle: Text('${entry.value} ${ingredient.unit}'),
                       trailing: IconButton(
                         icon: const Icon(Icons.delete),
                         onPressed: () => setState(() => _recipe.remove(entry.key)),
                       ),
                       onTap: () => _editQuantity(entry.key, entry.value),
                     );
                   },
                 ),
               ),
               Padding(
                 padding: const EdgeInsets.all(16.0),
                 child: ElevatedButton(
                   style: ElevatedButton.styleFrom(minimumSize: const Size.fromHeight(50)),
                   onPressed: _saveRecipe,
                   child: const Text('Save Recipe'),
                 ),
               ),
            ],
          ),
    );
  }

  Future<void> _saveRecipe() async {
    setState(() => _isLoading = true);
    
    final items = _recipe.entries.map((entry) {
       final ingredient = _allIngredients.firstWhere((i) => i.uuid == entry.key);
       return RecipeItem(ingredient: ingredient, quantity: entry.value);
    }).toList();

    final recipe = Recipe(
      productUuid: widget.product.uuid, 
      items: items
    );

    await _repo.updateRecipe(recipe);
    if (mounted) {
      Navigator.pop(context);
    }
  }

  Future<void> _addIngredientToRecipe() async {
    // Show list of ingredients not in recipe
    final available = _allIngredients.where((i) => !_recipe.containsKey(i.uuid)).toList();
    
    if (available.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('No more ingredients available')));
      return;
    }

    await showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Add Ingredient'),
        content: SizedBox(
          width: 300,
          height: 400,
          child: ListView.builder(
            itemCount: available.length,
            itemBuilder: (ctx, index) {
               final item = available[index];
               return ListTile(
                 title: Text(item.name),
                 subtitle: Text(item.unit),
                 onTap: () {
                   Navigator.pop(ctx);
                   _editQuantity(item.uuid, 1.0); // Default 1.0
                 },
               );
            },
          ),
        ),
      ),
    );
  }

  Future<void> _editQuantity(String ingredientUuid, double currentQty) async {
    final ctrl = TextEditingController(text: currentQty.toString());
    final ingredient = _allIngredients.firstWhere((i) => i.uuid == ingredientUuid);

    await showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('Quantity (${ingredient.unit})'),
        content: TextField(
          controller: ctrl,
          keyboardType: TextInputType.number,
          autofocus: true,
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('Cancel')),
          ElevatedButton(
            onPressed: () {
               final val = double.tryParse(ctrl.text);
               if (val != null && val > 0) {
                 setState(() {
                   _recipe[ingredientUuid] = val;
                 });
                 Navigator.pop(ctx);
               }
            },
            child: const Text('Set'),
          ),
        ],
      ),
    );
  }
}
