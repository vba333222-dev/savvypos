import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:savvy_pos/core/config/theme/savvy_theme.dart';
import 'package:savvy_pos/features/inventory/domain/entities/modifier.dart';
import 'package:savvy_pos/features/inventory/presentation/bloc/menu_management_bloc.dart';
import 'package:uuid/uuid.dart';

class ModifierManagePage extends StatelessWidget {
  const ModifierManagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetIt.I<MenuManagementBloc>()
        ..add(const MenuManagementEvent.loadAllModifiers()),
      child: const _ModifierManageView(),
    );
  }
}

class _ModifierManageView extends StatelessWidget {
  const _ModifierManageView();

  @override
  Widget build(BuildContext context) {
    final theme = context.savvy;

    return Scaffold(
      backgroundColor: theme.colors.bgPrimary,
      appBar: AppBar(
        title: const Text('Modifier Groups'),
        backgroundColor: theme.colors.bgElevated,
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _showEditDialog(context, null),
        label: const Text('New Group'),
        icon: const Icon(Icons.add),
      ),
      body: BlocBuilder<MenuManagementBloc, MenuManagementState>(
        builder: (context, state) {
          if (state.isLoading)
            return const Center(child: CircularProgressIndicator());
          if (state.errorMessage != null)
            return Center(child: Text('Error: ${state.errorMessage}'));

          if (state.allModifierGroups.isEmpty) {
            return const Center(
                child: Text(
                    'No modifier groups found. Create one like "Steak Temp" or "Sides".'));
          }

          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: state.allModifierGroups.length,
            itemBuilder: (context, index) {
              final group = state.allModifierGroups[index];
              return Card(
                child: ListTile(
                  title: Text(group.name,
                      style: const TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: Text(
                      '${group.items.length} options | ${group.allowMultiSelect ? "Multi-select" : "Single-select"} | Min: ${group.minSelection}, Max: ${group.maxSelection ?? "∞"}'),
                  trailing: const Icon(Icons.edit),
                  onTap: () => _showEditDialog(context, group),
                ),
              );
            },
          );
        },
      ),
    );
  }

  void _showEditDialog(BuildContext context, ModifierGroup? group) {
    showDialog(
      context: context,
      builder: (_) => BlocProvider.value(
        value: context.read<MenuManagementBloc>(),
        child: _ModifierGroupDialog(group: group),
      ),
    ).then((_) {
      // Refresh handled by Bloc logic if needed or auto-refresh
    });
  }
}

class _ModifierGroupDialog extends StatefulWidget {
  final ModifierGroup? group;
  const _ModifierGroupDialog({this.group});

  @override
  State<_ModifierGroupDialog> createState() => _ModifierGroupDialogState();
}

class _ModifierGroupDialogState extends State<_ModifierGroupDialog> {
  late TextEditingController _nameCtrl;
  late TextEditingController _minCtrl;
  late TextEditingController _maxCtrl;
  bool _multiSelect = false;

  List<ModifierItem> _items = [];

  @override
  void initState() {
    super.initState();
    _nameCtrl = TextEditingController(text: widget.group?.name ?? '');
    _minCtrl = TextEditingController(
        text: widget.group?.minSelection.toString() ?? '0');
    _maxCtrl = TextEditingController(
        text: widget.group?.maxSelection?.toString() ?? '');
    _multiSelect = widget.group?.allowMultiSelect ?? false;

    if (widget.group != null) {
      _items = List.from(widget.group!.items);
    } else {
      // Start with one empty slot? No, list is fine.
    }
  }

  void _addItem() {
    setState(() {
      _items
          .add(ModifierItem(uuid: const Uuid().v4(), name: '', priceDelta: 0));
    });
  }

  void _updateItem(int index, String name, double price) {
    setState(() {
      _items[index] = _items[index].copyWith(name: name, priceDelta: price);
    });
  }

  void _removeItem(int index) {
    setState(() {
      _items.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.group == null ? 'New Modifier Group' : 'Edit Group'),
      content: SizedBox(
        width: 600,
        height: 600, // Fixed size for now
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Basic Info
              TextField(
                  controller: _nameCtrl,
                  decoration: const InputDecoration(
                      labelText: 'Group Name (e.g. Steak Temp)')),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                      child: CheckboxListTile(
                    title: const Text('Multi-select?'),
                    value: _multiSelect,
                    onChanged: (v) => setState(() => _multiSelect = v!),
                    controlAffinity: ListTileControlAffinity.leading,
                    contentPadding: EdgeInsets.zero,
                  )),
                  Expanded(
                      child: TextField(
                          controller: _minCtrl,
                          decoration:
                              const InputDecoration(labelText: 'Min Selection'),
                          keyboardType: TextInputType.number)),
                  const SizedBox(width: 16),
                  Expanded(
                      child: TextField(
                          controller: _maxCtrl,
                          decoration:
                              const InputDecoration(labelText: 'Max Selection'),
                          keyboardType: TextInputType.number)),
                ],
              ),
              const Divider(height: 32),

              // Items
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Options',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  TextButton.icon(
                      onPressed: _addItem,
                      icon: const Icon(Icons.add),
                      label: const Text('Add Option')),
                ],
              ),

              ..._items.asMap().entries.map((entry) {
                final i = entry.key;
                final item = entry.value;
                return Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: TextFormField(
                          initialValue: item.name,
                          decoration: const InputDecoration(
                              labelText: 'Name', isDense: true),
                          onChanged: (v) => _updateItem(i, v, item.priceDelta),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        flex: 1,
                        child: TextFormField(
                          initialValue: item.priceDelta.toString(),
                          decoration: const InputDecoration(
                              labelText: 'Price (+/-)',
                              isDense: true,
                              prefixText: '\$'),
                          keyboardType: TextInputType.number,
                          onChanged: (v) => _updateItem(
                              i, item.name, double.tryParse(v) ?? 0),
                        ),
                      ),
                      IconButton(
                          onPressed: () => _removeItem(i),
                          icon: const Icon(Icons.delete, color: Colors.grey)),
                    ],
                  ),
                );
              }),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel')),
        ElevatedButton(
          onPressed: () {
            context
                .read<MenuManagementBloc>()
                .add(MenuManagementEvent.saveModifierGroup(
                  _nameCtrl.text,
                  _multiSelect,
                  int.tryParse(_minCtrl.text) ?? 0,
                  int.tryParse(_maxCtrl.text),
                  _items,
                  uuid: widget.group?.uuid,
                ));
            Navigator.pop(context);
          },
          child: const Text('Save Group'),
        ),
      ],
    );
  }
}
