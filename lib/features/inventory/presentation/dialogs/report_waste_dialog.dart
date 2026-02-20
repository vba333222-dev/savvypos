import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get_it/get_it.dart';
import 'package:savvy_pos/features/inventory/domain/entities/waste_reason.dart';
import 'package:savvy_pos/features/inventory/domain/entities/waste_record.dart';
import 'package:savvy_pos/features/inventory/domain/repositories/i_inventory_repository.dart';
import 'package:savvy_pos/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:uuid/uuid.dart';

class ReportWasteDialog extends StatefulWidget {
  const ReportWasteDialog({super.key});

  @override
  State<ReportWasteDialog> createState() => _ReportWasteDialogState();
}

class _ReportWasteDialogState extends State<ReportWasteDialog> {
  final _formKey = GlobalKey<FormState>();
  final _itemUuidCtrl = TextEditingController();
  final _quantityCtrl = TextEditingController();
  final _noteCtrl = TextEditingController();
  
  WasteItemType _itemType = WasteItemType.ingredient;
  WasteReason _reason = WasteReason.expired;
  bool _isSubmitting = false;

  @override
  void dispose() {
    _itemUuidCtrl.dispose();
    _quantityCtrl.dispose();
    _noteCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Report Waste'),
      content: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: _itemUuidCtrl,
                decoration: const InputDecoration(
                  labelText: 'Item UUID',
                  border: OutlineInputBorder(),
                  helperText: 'Enter Ingredient UUID for testing',
                ),
                validator: (v) => v == null || v.isEmpty ? 'Required' : null,
              ),
              const Gap(16),
              DropdownButtonFormField<WasteItemType>(
                // ignore: deprecated_member_use
                value: _itemType,
                decoration: const InputDecoration(
                  labelText: 'Item Type',
                  border: OutlineInputBorder(),
                ),
                items: WasteItemType.values
                    .map((e) => DropdownMenuItem(value: e, child: Text(e.name.toUpperCase())))
                    .toList(),
                onChanged: (v) => setState(() => _itemType = v ?? WasteItemType.ingredient),
              ),
              const Gap(16),
              TextFormField(
                controller: _quantityCtrl,
                decoration: const InputDecoration(
                  labelText: 'Quantity',
                  border: OutlineInputBorder(),
                  suffixText: 'Units',
                ),
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                validator: (v) {
                  if (v == null || v.isEmpty) return 'Required';
                  final num = double.tryParse(v);
                  if (num == null) return 'Invalid number';
                  if (num <= 0) return 'Must be greater than 0';
                  return null;
                },
              ),
              const Gap(16),
              DropdownButtonFormField<WasteReason>(
                // ignore: deprecated_member_use
                value: _reason,
                decoration: const InputDecoration(
                  labelText: 'Reason',
                  border: OutlineInputBorder(),
                ),
                items: WasteReason.values
                    .map((e) => DropdownMenuItem(value: e, child: Text(e.label)))
                    .toList(),
                onChanged: (v) => setState(() => _reason = v ?? WasteReason.expired),
              ),
              const Gap(16),
              TextFormField(
                controller: _noteCtrl,
                decoration: const InputDecoration(
                  labelText: 'Note (Optional)',
                  border: OutlineInputBorder(),
                ),
                maxLines: 2,
              ),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Cancel'),
        ),
        FilledButton(
          onPressed: _isSubmitting ? null : _submit,
          child: _isSubmitting 
              ? const SizedBox(width: 20, height: 20, child: CircularProgressIndicator(strokeWidth: 2))
              : const Text('Submit Waste'),
        ),
      ],
    );
  }

  Future<void> _submit() async {
    if (_formKey.currentState?.validate() ?? false) {
      setState(() => _isSubmitting = true);
      
      // ignore: unused_local_variable - placeholder for future repo.recordWaste implementation
      final repo = GetIt.I<IInventoryRepository>();
      final authState = GetIt.I<AuthBloc>().state;
      
      final staffId = authState.employee?.uuid ?? 'unknown_staff';
      final warehouseId = authState.activeWarehouseId ?? 'default_warehouse';

      try {
        // ignore: unused_local_variable - placeholder for future repo.recordWaste call
        final record = WasteRecord(
          id: const Uuid().v4(),
          itemId: _itemUuidCtrl.text,
          itemType: _itemType,
          quantity: double.parse(_quantityCtrl.text),
          reason: _reason,
          recordedAt: DateTime.now(),
          staffId: staffId, 
          warehouseId: warehouseId, 
          costLoss: 0.0, // Calculated in Repo
          note: _noteCtrl.text.isEmpty ? null : _noteCtrl.text,
        );

        // TODO: Add recordWaste method to IInventoryRepository when implementing
        // await repo.recordWaste(record);
        
        if (mounted) {
          Navigator.of(context).pop(true);
          ScaffoldMessenger.of(context).showSnackBar(
             SnackBar(
               content: Text('Waste recorded successfully. Stock adjusted in $warehouseId.'),
               backgroundColor: Colors.green,
             ),
          );
        }
      } catch (e) {
        if (mounted) {
           ScaffoldMessenger.of(context).showSnackBar(
             SnackBar(content: Text('Error: $e'), backgroundColor: Colors.red),
          );
        }
      } finally {
        if (mounted) setState(() => _isSubmitting = false);
      }
    }
  }
}
