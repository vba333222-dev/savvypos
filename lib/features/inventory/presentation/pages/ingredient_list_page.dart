import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:savvy_pos/features/inventory/domain/entities/ingredient.dart';
import 'package:savvy_pos/features/inventory/domain/repositories/i_product_repository.dart';
import 'package:uuid/uuid.dart';

class IngredientListPage extends StatefulWidget {
  const IngredientListPage({super.key});

  @override
  State<IngredientListPage> createState() => _IngredientListPageState();
}

class _IngredientListPageState extends State<IngredientListPage> {
  bool _isLoading = true;
  List<Ingredient> _ingredients = [];
  final IProductRepository _repo = GetIt.I<IProductRepository>();

  @override
  void initState() {
    super.initState();
    _loadIngredients();
  }

  Future<void> _loadIngredients() async {
    final result = await _repo.getAllIngredients();
    result.fold(
        (l) => ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(l.message))), (list) {
      if (!mounted) return;
      setState(() {
        _ingredients = list;
        _isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Ingredients')),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showDialog(),
        child: const Icon(Icons.add),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _ingredients.isEmpty
              ? const Center(child: Text('No Ingredients'))
              : ListView.builder(
                  itemCount: _ingredients.length,
                  itemBuilder: (context, index) {
                    final item = _ingredients[index];
                    return ListTile(
                      title: Text(item.name),
                      subtitle: Text(
                          '${item.currentStock} ${item.unit} | Cost: \$${item.costPerUnit}/${item.unit}'),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () async {
                          await _repo.deleteIngredient(item.uuid);
                          _loadIngredients();
                        },
                      ),
                      onTap: () => _showDialog(ingredient: item),
                    );
                  },
                ),
    );
  }

  Future<void> _showDialog({Ingredient? ingredient}) async {
    final nameCtrl = TextEditingController(text: ingredient?.name ?? '');
    final unitCtrl = TextEditingController(text: ingredient?.unit ?? 'units');
    final stockCtrl =
        TextEditingController(text: ingredient?.currentStock.toString() ?? '0');
    final costCtrl = TextEditingController(
        text: ingredient?.costPerUnit.toString() ?? '0.0');

    await showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(ingredient == null ? 'New Ingredient' : 'Edit Ingredient'),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                  controller: nameCtrl,
                  decoration: const InputDecoration(labelText: 'Name')),
              TextField(
                  controller: unitCtrl,
                  decoration: const InputDecoration(
                      labelText: 'Unit (e.g. g, ml, pcs)')),
              TextField(
                  controller: stockCtrl,
                  decoration: const InputDecoration(labelText: 'Current Stock'),
                  keyboardType: TextInputType.number),
              TextField(
                  controller: costCtrl,
                  decoration: const InputDecoration(labelText: 'Cost Per Unit'),
                  keyboardType: TextInputType.number),
            ],
          ),
        ),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(ctx), child: const Text('Cancel')),
          ElevatedButton(
            onPressed: () async {
              if (nameCtrl.text.isNotEmpty) {
                final newIg = Ingredient(
                  uuid: ingredient?.uuid ?? const Uuid().v4(),
                  name: nameCtrl.text,
                  unit: unitCtrl.text,
                  currentStock: double.tryParse(stockCtrl.text) ?? 0,
                  costPerUnit: double.tryParse(costCtrl.text) ?? 0,
                );
                await _repo.saveIngredient(newIg);
                if (mounted) {
                  Navigator.of(context).pop();
                  _loadIngredients();
                }
              }
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }
}
