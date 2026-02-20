import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:intl/intl.dart';
import 'package:savvy_pos/core/di/injection.dart';
import 'package:savvy_pos/features/inventory/domain/entities/inventory_entities.dart';
import 'package:savvy_pos/features/inventory/domain/entities/recipe_entities.dart'; // For Ingredient
import 'package:savvy_pos/features/inventory/domain/entities/product.dart';
import 'package:savvy_pos/features/inventory/domain/repositories/i_inventory_repository.dart';
import 'package:savvy_pos/features/inventory/domain/repositories/i_product_repository.dart';
import 'package:savvy_pos/features/inventory/domain/repositories/i_recipe_repository.dart';
import 'package:uuid/uuid.dart';
import 'package:gap/gap.dart';

class PurchaseOrderListPage extends StatefulWidget {
  const PurchaseOrderListPage({super.key});

  @override
  State<PurchaseOrderListPage> createState() => _PurchaseOrderListPageState();
}

class _PurchaseOrderListPageState extends State<PurchaseOrderListPage> with SingleTickerProviderStateMixin {
  late TabController _tabCtrl;
  final _repo = getIt<IInventoryRepository>();
  
  // Cache
  List<PurchaseOrder> _allPos = [];

  @override
  void initState() {
    super.initState();
    _tabCtrl = TabController(length: 4, vsync: this);
    _refresh();
  }
  
  Future<void> _refresh() async {
    final pos = await _repo.getPurchaseOrders();
    if (mounted) {
      setState(() {
        _allPos = pos;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Purchase Orders'),
        bottom: TabBar(
          controller: _tabCtrl,
          tabs: const [
             Tab(text: 'Draft'),
             Tab(text: 'Sent'),
             Tab(text: 'Partial'),
             Tab(text: 'Completed'),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () async {
              await Navigator.of(context).push(MaterialPageRoute(builder: (_) => const PurchaseOrderEditorPage()));
              _refresh();
            },
          )
        ],
      ),
      body: TabBarView(
        controller: _tabCtrl,
        children: [
          _buildList(PoStatus.pending),
          _buildList(PoStatus.sent),
          _buildList(PoStatus.partiallyReceived),
          _buildList(PoStatus.completed),
        ],
      ),
    );
  }

  Widget _buildList(PoStatus status) {
    final filtered = _allPos.where((p) => p.status == status).toList();
    // Sort by date desc
    filtered.sort((a, b) => (b.createdAt ?? DateTime.now()).compareTo(a.createdAt ?? DateTime.now()));

    if (filtered.isEmpty) {
      return const Center(child: Text('No Orders', style: TextStyle(color: Colors.grey)));
    }

    return ListView.builder(
      itemCount: filtered.length,
      padding: const EdgeInsets.all(16),
      itemBuilder: (context, index) {
        final po = filtered[index];
        return Card(
          margin: const EdgeInsets.only(bottom: 12),
          child: ListTile(
            title: Text(po.referenceNumber ?? 'PO #${po.uuid.substring(0,6)}', style: const TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Text('${DateFormat.yMMMd().format(po.createdAt!)} • \$${po.totalCost.toStringAsFixed(2)}'),
            trailing: Chip(
              label: Text(status.name.toUpperCase(), style: const TextStyle(fontSize: 10)),
              backgroundColor: _getColorRaw(status).withAlpha((255 * 0.2).round()),
            ),
            onTap: () async {
              await Navigator.of(context).push(MaterialPageRoute(builder: (_) => PurchaseOrderEditorPage(poUuid: po.uuid)));
              _refresh();
            },
          ),
        ).animate().fadeIn().slideX();
      },
    );
  }
  
  Color _getColorRaw(PoStatus s) {
    switch(s) {
      case PoStatus.pending: return Colors.orange;
      case PoStatus.sent: return Colors.blue;
      case PoStatus.partiallyReceived: return Colors.purple;
      case PoStatus.completed: return Colors.green;
      case PoStatus.cancelled: return Colors.red;
    }
  }
}

class PurchaseOrderEditorPage extends StatefulWidget {
  final String? poUuid;
  const PurchaseOrderEditorPage({super.key, this.poUuid});

  @override
  State<PurchaseOrderEditorPage> createState() => _PurchaseOrderEditorPageState();
}

class _PurchaseOrderEditorPageState extends State<PurchaseOrderEditorPage> {
  final _repo = getIt<IInventoryRepository>();
  final _productRepo = getIt<IProductRepository>();
  final _recipeRepo = getIt<IRecipeRepository>();
  
  bool _isLoading = true;
  
  // Data
  List<Supplier> _suppliers = [];
  List<Product> _products = [];
  List<Ingredient> _ingredients = [];
  
  // Form
  Supplier? _selectedSupplier;
  String _refNumber = '';
  String _notes = '';
  PoStatus _status = PoStatus.pending;
  
  // Items
  List<_EditablePoItem> _items = [];

  @override
  void initState() {
    super.initState();
    _loadData();
  }
  
  Future<void> _loadData() async {
    _suppliers = await _repo.getSuppliers();
    
    // Fetch Products (Stream -> First)
    final productStream = _productRepo.watchAllProducts();
    _products = await productStream.first; 
    
    // Fetch Ingredients
    _ingredients = await _recipeRepo.getIngredients();
    
    if (widget.poUuid != null) {
      final po = await _repo.getPurchaseOrder(widget.poUuid!);
      if (po != null) {
        _selectedSupplier = _suppliers.where((s) => s.uuid == po.supplierUuid).firstOrNull;
        _refNumber = po.referenceNumber ?? '';
        _notes = po.notes ?? '';
        _status = po.status;
        
        _items = po.items.map((i) {
           return _EditablePoItem(
             productUuid: i.productUuid,
             ingredientUuid: i.ingredientUuid,
             quantity: i.quantityOrdered,
             received: i.quantityReceived,
             cost: i.unitCost,
             name: i.productName ?? 'Unknown',
             isIngredient: i.ingredientUuid != null,
           );
        }).toList();
      }
    } else {
      _refNumber = 'PO-${DateTime.now().millisecondsSinceEpoch}';
    }

    setState(() => _isLoading = false);
  }
  
  Future<void> _save(PoStatus newStatus) async {
    if (_selectedSupplier == null) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Select Supplier')));
      return;
    }
    if (_items.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Add Items')));
      return;
    }

    final total = _items.fold(0.0, (sum, i) => sum + (i.quantity * i.cost));

    final po = PurchaseOrder(
      uuid: widget.poUuid ?? const Uuid().v4(),
      supplierUuid: _selectedSupplier!.uuid,
      targetWarehouseUuid: 'MAIN_WH',
      status: newStatus,
      referenceNumber: _refNumber,
      notes: _notes,
      totalCost: total,
      createdAt: DateTime.now(), // Should preserve distinct created at if edit? Repo handles it.
      items: _items.map((i) => PurchaseOrderItem(
        poUuid: widget.poUuid ?? 'temp', // Repo will fix
        productUuid: i.isIngredient ? null : i.productUuid,
        ingredientUuid: i.isIngredient ? i.ingredientUuid : null,
        quantityOrdered: i.quantity,
        quantityReceived: i.received,
        unitCost: i.cost,
      )).toList(),
    );
    
    await _repo.savePurchaseOrder(po);
    if (mounted) Navigator.of(context).pop();
  }
  
  void _addItem() {
    showDialog(context: context, builder: (_) => _AddItemDialog(
      products: _products, 
      ingredients: _ingredients,
      onAdd: (item) {
        setState(() => _items.add(item));
      },
    ));
  }
  
  void _openReceiveDialog() {
    showDialog(context: context, builder: (_) => _ReceiveDialog(
       items: _items,
       onConfirm: (quantities) async {
         await _repo.receivePurchaseOrder(widget.poUuid!, quantities);
         Navigator.pop(context); // Close dialog
         _loadData(); // Reload page
       },
    ));
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) return const Scaffold(body: Center(child: CircularProgressIndicator()));
    
    final isReadOnly = _status == PoStatus.completed || _status == PoStatus.cancelled;
    
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.poUuid == null ? 'New PO' : 'Ref: $_refNumber'),
        actions: [
          if (!isReadOnly)
             TextButton(
               onPressed: () => _save(PoStatus.pending),
               child: const Text('SAVE DRAFT'),
             ),
          if (!isReadOnly && _status != PoStatus.sent)
             ElevatedButton(
               onPressed: () => _save(PoStatus.sent),
               style: ElevatedButton.styleFrom(backgroundColor: Colors.blue, foregroundColor: Colors.white),
               child: const Text('SEND PO'),
             ),
          if (_status == PoStatus.sent || _status == PoStatus.partiallyReceived)
             ElevatedButton(
               onPressed: _openReceiveDialog,
               style: ElevatedButton.styleFrom(backgroundColor: Colors.green, foregroundColor: Colors.white),
               child: const Text('RECEIVE'),
             ),
             
          const Gap(8),
        ],
      ),
      body: Column(
        children: [
          // Header
          Padding(
            padding: const EdgeInsets.all(16),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    DropdownButtonFormField<Supplier>(
                      decoration: const InputDecoration(labelText: 'Supplier'),
                      initialValue: _selectedSupplier,
                      items: _suppliers.map((s) => DropdownMenuItem(value: s, child: Text(s.name))).toList(),
                      onChanged: isReadOnly ? null : (v) => setState(() => _selectedSupplier = v),
                    ),
                    const Gap(12),
                    TextFormField(
                       initialValue: _notes,
                       decoration: const InputDecoration(labelText: 'Notes'),
                       onChanged: (v) => _notes = v,
                       enabled: !isReadOnly,
                    ),
                  ],
                ),
              ),
            ),
          ),
          
          Expanded(
            child: ListView.separated(
              itemCount: _items.length,
              separatorBuilder: (_,__) => const Divider(height: 1),
              itemBuilder: (context, index) {
                final item = _items[index];
                return ListTile(
                  leading: Icon(item.isIngredient ? Icons.grass : Icons.inventory_2, color: Colors.indigo),
                  title: Text(item.name),
                  subtitle: Text('${item.quantity} x \$${item.cost} = \$${(item.quantity * item.cost).toStringAsFixed(2)}'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                       if (item.received > 0)
                          Chip(label: Text('Rcv: ${item.received}', style: const TextStyle(fontSize: 10)), backgroundColor: Colors.green.shade100),
                       if (!isReadOnly)
                         IconButton(icon: const Icon(Icons.delete, color: Colors.red), onPressed: () => setState(() => _items.removeAt(index))),
                    ],
                  ),
                );
              },
            ),
          ),
          
          if (!isReadOnly)
          Padding(
            padding: const EdgeInsets.all(16),
            child: SizedBox(
              width: double.infinity,
              height: 50,
              child: OutlinedButton.icon(
                icon: const Icon(Icons.add),
                label: const Text('ADD ITEM'),
                onPressed: _addItem,
              ),
            ),
          ),
          
          // Total Footer
          Container(
            padding: const EdgeInsets.all(24),
            color: Colors.grey.shade100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('TOTAL EST.', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                Text(
                  '\$${_items.fold(0.0, (sum, i) => sum + (i.quantity * i.cost)).toStringAsFixed(2)}',
                  style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 24, color: Colors.green),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _EditablePoItem {
  final String? productUuid;
  final String? ingredientUuid;
  final String name;
  final double quantity;
  final double received;
  final double cost;
  final bool isIngredient;

  _EditablePoItem({
    this.productUuid,
    this.ingredientUuid,
    required this.name,
    required this.quantity,
    required this.received,
    required this.cost,
    required this.isIngredient, 
  });
}

class _AddItemDialog extends StatefulWidget {
  final List<Product> products;
  final List<Ingredient> ingredients;
  final Function(_EditablePoItem) onAdd;

  const _AddItemDialog({required this.products, required this.ingredients, required this.onAdd});

  @override
  State<_AddItemDialog> createState() => _AddItemDialogState();
}

class _AddItemDialogState extends State<_AddItemDialog> {
  bool _isIngredient = false;
  Product? _selectedProduct;
  Ingredient? _selectedIngredient;
  final _qtyCtrl = TextEditingController(text: '1.0');
  final _costCtrl = TextEditingController(text: '0.0');

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Add Item'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              const Text('Type: '),
              ToggleButtons(
                isSelected: [_isIngredient == false, _isIngredient == true],
                onPressed: (idx) {
                   setState(() {
                     _isIngredient = idx == 1;
                     _selectedProduct = null;
                     _selectedIngredient = null;
                     _costCtrl.text = '0.0';
                   });
                },
                children: const [Padding(padding: EdgeInsets.all(8.0), child: Text('Product')), Padding(padding: EdgeInsets.all(8.0), child: Text('Ingredient'))],
              ),
            ],
          ),
          const Gap(16),
          if (!_isIngredient)
             DropdownButtonFormField<Product>(
               isExpanded: true,
               hint: const Text('Select Product'),
               initialValue: _selectedProduct,
               items: widget.products.map((p) => DropdownMenuItem(value: p, child: Text(p.name))).toList(),
               onChanged: (v) => setState(() {
                  _selectedProduct = v;
                  _costCtrl.text = v?.price.toString() ?? '0.0'; // Cost probably different from price but useful default
               }),
             )
          else
             DropdownButtonFormField<Ingredient>(
               isExpanded: true,
               hint: const Text('Select Ingredient'),
               initialValue: _selectedIngredient,
               items: widget.ingredients.map((i) => DropdownMenuItem(value: i, child: Text(i.name))).toList(),
               onChanged: (v) => setState(() {
                  _selectedIngredient = v;
                  _costCtrl.text = v?.costPerUnit.toString() ?? '0.0';
               }),
             ),
          
          const Gap(16),
          Row(
            children: [
              Expanded(child: TextFormField(controller: _qtyCtrl, decoration: const InputDecoration(labelText: 'Quantity'), keyboardType: TextInputType.number)),
              const Gap(12),
              Expanded(child: TextFormField(controller: _costCtrl, decoration: const InputDecoration(labelText: 'Unit Cost'), keyboardType: TextInputType.number)),
            ],
          )
        ],
      ),
      actions: [
        TextButton(onPressed: () => Navigator.pop(context), child: const Text('Cancel')),
        ElevatedButton(
          onPressed: () {
             final qty = double.tryParse(_qtyCtrl.text) ?? 1;
             final cost = double.tryParse(_costCtrl.text) ?? 0;
             
             if (!_isIngredient && _selectedProduct != null) {
               widget.onAdd(_EditablePoItem(
                 productUuid: _selectedProduct!.uuid,
                 name: _selectedProduct!.name,
                 quantity: qty,
                 received: 0,
                 cost: cost,
                 isIngredient: false,
               ));
             } else if (_isIngredient && _selectedIngredient != null) {
               widget.onAdd(_EditablePoItem(
                 ingredientUuid: _selectedIngredient!.uuid,
                 name: _selectedIngredient!.name,
                 quantity: qty,
                 received: 0,
                 cost: cost,
                 isIngredient: true,
               ));
             }
             Navigator.pop(context);
          },
          child: const Text('Add'),
        ),
      ],
    );
  }
}

class _ReceiveDialog extends StatefulWidget {
  final List<_EditablePoItem> items;
  final Function(Map<String, double>) onConfirm;

  const _ReceiveDialog({required this.items, required this.onConfirm});

  @override
  State<_ReceiveDialog> createState() => _ReceiveDialogState();
}

class _ReceiveDialogState extends State<_ReceiveDialog> {
  final Map<String, TextEditingController> _ctrls = {};
  
  @override
  void initState() {
    super.initState();
    for (var item in widget.items) {
       final remaining = item.quantity - item.received;
       final key = item.productUuid ?? item.ingredientUuid!;
       _ctrls[key] = TextEditingController(text: remaining > 0 ? remaining.toString() : '0');
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Receive Items'),
      content: SizedBox(
        width: 400,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: widget.items.map((item) {
               final key = item.productUuid ?? item.ingredientUuid!;
               return Padding(
                 padding: const EdgeInsets.only(bottom: 12),
                 child: Row(
                   children: [
                     Expanded(flex: 2, child: Text(item.name)),
                     Expanded(flex: 1, child: Text('Ordered: ${item.quantity - item.received}')),
                     const Gap(8),
                     SizedBox(width: 80, child: TextFormField(
                       controller: _ctrls[key],
                       decoration: const InputDecoration(border: OutlineInputBorder(), contentPadding: EdgeInsets.all(8)),
                       keyboardType: TextInputType.number,
                     )),
                   ],
                 ),
               );
            }).toList(),
          ),
        ),
      ),
      actions: [
        TextButton(onPressed: () => Navigator.pop(context), child: const Text('Cancel')),
        ElevatedButton(
          onPressed: () {
            final result = <String, double>{};
            _ctrls.forEach((k, v) {
               final val = double.tryParse(v.text) ?? 0;
               if (val > 0) result[k] = val;
            });
            widget.onConfirm(result);
          },
          child: const Text('Confirm Receive'),
        )
      ],
    );
  }
}
