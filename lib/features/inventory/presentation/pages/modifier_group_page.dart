import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:savvy_pos/features/inventory/domain/entities/modifier.dart';
import 'package:savvy_pos/features/inventory/domain/repositories/i_product_repository.dart';
import 'package:uuid/uuid.dart';

class ModifierGroupPage extends StatefulWidget {
  const ModifierGroupPage({super.key});

  @override
  State<ModifierGroupPage> createState() => _ModifierGroupPageState();
}

class _ModifierGroupPageState extends State<ModifierGroupPage> {
  bool _isLoading = true;
  List<ModifierGroup> _groups = [];
  final IProductRepository _repo = GetIt.I<IProductRepository>();

  @override
  void initState() {
    super.initState();
    _loadGroups();
  }

  Future<void> _loadGroups() async {
    final result = await _repo.getAllModifierGroups();
    final groups = result.fold((l) => <ModifierGroup>[], (r) => r);
    if (mounted) {
      setState(() {
        _groups = groups;
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Modifier Groups')),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showGroupDialog(),
        child: const Icon(Icons.add),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _groups.isEmpty
              ? const Center(child: Text('No Modifier Groups'))
              : ListView.builder(
                  itemCount: _groups.length,
                  itemBuilder: (context, index) {
                    final group = _groups[index];
                    return ListTile(
                      title: Text(group.name),
                      subtitle: Text('${group.items.length} options'),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () => _deleteGroup(group),
                      ),
                      onTap: () => _showGroupDialog(group: group),
                    );
                  },
                ),
    );
  }

  Future<void> _deleteGroup(ModifierGroup group) async {
    await _repo.deleteModifierGroup(group.uuid);
    _loadGroups();
  }

  Future<void> _showGroupDialog({ModifierGroup? group}) async {
    await showDialog(
      context: context,
      builder: (ctx) => _ModifierGroupDialog(
        group: group,
        onSave: (newGroup) async {
          await _repo.saveModifierGroup(newGroup);
          _loadGroups();
        },
      ),
    );
  }
}

class _ModifierGroupDialog extends StatefulWidget {
  final ModifierGroup? group;
  final Function(ModifierGroup) onSave;

  const _ModifierGroupDialog({this.group, required this.onSave});

  @override
  State<_ModifierGroupDialog> createState() => _ModifierGroupDialogState();
}

class _ModifierGroupDialogState extends State<_ModifierGroupDialog> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameCtrl;
  bool _allowMultiSelect = false;
  late TextEditingController _minSelectCtrl;
  late TextEditingController _maxSelectCtrl;

  List<ModifierItem> _items = [];

  @override
  void initState() {
    super.initState();
    _nameCtrl = TextEditingController(text: widget.group?.name ?? '');
    _allowMultiSelect = widget.group?.allowMultiSelect ?? false;
    _minSelectCtrl = TextEditingController(
        text: widget.group?.minSelection.toString() ?? '0');
    _maxSelectCtrl = TextEditingController(
        text: widget.group?.maxSelection?.toString() ?? '');
    _items = List.from(widget.group?.items ?? []);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.group == null ? 'New Group' : 'Edit Group'),
      content: SizedBox(
        width: 600,
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  controller: _nameCtrl,
                  decoration: const InputDecoration(labelText: 'Group Name'),
                  validator: (v) => v!.isEmpty ? 'Required' : null,
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Checkbox(
                        value: _allowMultiSelect,
                        onChanged: (v) =>
                            setState(() => _allowMultiSelect = v!)),
                    const Text('Allow Multi-Select'),
                    const SizedBox(width: 16),
                    Expanded(
                        child: TextFormField(
                      controller: _minSelectCtrl,
                      decoration:
                          const InputDecoration(labelText: 'Min Select'),
                      keyboardType: TextInputType.number,
                    )),
                    const SizedBox(width: 16),
                    Expanded(
                        child: TextFormField(
                      controller: _maxSelectCtrl,
                      decoration:
                          const InputDecoration(labelText: 'Max Select'),
                      keyboardType: TextInputType.number,
                    )),
                  ],
                ),
                const Divider(),
                const Text('Options',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                ..._items.asMap().entries.map((entry) {
                  final idx = entry.key;
                  final item = entry.value;
                  return Row(
                    children: [
                      Expanded(child: Text(item.name)),
                      Text('+\$${item.priceDelta.toStringAsFixed(2)}'),
                      IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () {
                            setState(() => _items.removeAt(idx));
                          }),
                    ],
                  );
                }),
                ElevatedButton(
                  onPressed: _addItem,
                  child: const Text('Add Option'),
                ),
              ],
            ),
          ),
        ),
      ),
      actions: [
        TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel')),
        ElevatedButton(
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              final newGroup = ModifierGroup(
                uuid: widget.group?.uuid ?? const Uuid().v4(),
                name: _nameCtrl.text,
                allowMultiSelect: _allowMultiSelect,
                minSelection: int.tryParse(_minSelectCtrl.text) ?? 0,
                maxSelection: int.tryParse(_maxSelectCtrl.text),
                items: _items,
              );
              widget.onSave(newGroup);
              Navigator.pop(context);
            }
          },
          child: const Text('Save'),
        ),
      ],
    );
  }

  Future<void> _addItem() async {
    final nameCtrl = TextEditingController();
    final priceCtrl = TextEditingController(text: '0.0');

    await showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Add Option'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
                controller: nameCtrl,
                decoration:
                    const InputDecoration(labelText: 'Name (e.g. Less Sugar)')),
            TextField(
                controller: priceCtrl,
                decoration:
                    const InputDecoration(labelText: 'Price Delta (+/-)')),
          ],
        ),
        actions: [
          ElevatedButton(
              onPressed: () {
                if (nameCtrl.text.isNotEmpty) {
                  setState(() {
                    _items.add(ModifierItem(
                      uuid: const Uuid().v4(),
                      name: nameCtrl.text,
                      priceDelta: double.tryParse(priceCtrl.text) ?? 0.0,
                    ));
                  });
                  Navigator.pop(ctx);
                }
              },
              child: const Text('Add')),
        ],
      ),
    );
  }
}
