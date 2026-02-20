import 'package:flutter/material.dart';
import 'package:savvy_pos/features/tables/domain/entities/table.dart';

class TableEditDialog extends StatefulWidget {
  final SavvyTable table;

  const TableEditDialog({super.key, required this.table});

  @override
  State<TableEditDialog> createState() => _TableEditDialogState();
}

class _TableEditDialogState extends State<TableEditDialog> {
  late TextEditingController _nameController;
  late TextEditingController _capacityController;
  late TextEditingController _widthController;
  late TextEditingController _heightController;
  late TableShape _shape;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.table.name);
    _capacityController = TextEditingController(text: widget.table.capacity.toString());
    _widthController = TextEditingController(text: widget.table.width.toString());
    _heightController = TextEditingController(text: widget.table.height.toString());
    _shape = widget.table.shape;
  }

  @override
  void dispose() {
    _nameController.dispose();
    _capacityController.dispose();
    _widthController.dispose();
    _heightController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Edit Table'),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Table Name'),
            ),
            const SizedBox(height: 16),
            DropdownButtonFormField<TableShape>(
              initialValue: _shape,
              decoration: const InputDecoration(labelText: 'Shape'),
              items: TableShape.values.map((s) {
                return DropdownMenuItem(
                  value: s,
                  child: Text(s.name.toUpperCase()),
                );
              }).toList(),
              onChanged: (val) {
                if (val != null) setState(() => _shape = val);
              },
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _capacityController,
              decoration: const InputDecoration(labelText: 'Capacity (Pax)'),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _widthController,
                    decoration: const InputDecoration(labelText: 'Width'),
                    keyboardType: TextInputType.number,
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: TextField(
                    controller: _heightController,
                    decoration: const InputDecoration(labelText: 'Height'),
                    keyboardType: TextInputType.number,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () {
            final updatedTable = widget.table.copyWith(
              name: _nameController.text,
              shape: _shape,
              capacity: int.tryParse(_capacityController.text) ?? widget.table.capacity,
              width: double.tryParse(_widthController.text) ?? widget.table.width,
              height: double.tryParse(_heightController.text) ?? widget.table.height,
            );
            Navigator.of(context).pop(updatedTable);
          },
          child: const Text('Save'),
        ),
      ],
    );
  }
}
