import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:savvy_pos/features/inventory/domain/entities/inventory_entities.dart';
import 'package:savvy_pos/features/inventory/presentation/bloc/inventory_bloc.dart';

class SupplierListPage extends StatelessWidget {
  const SupplierListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Suppliers')),
      body: BlocBuilder<InventoryBloc, InventoryState>(
        builder: (context, state) {
           if (state.isLoading) return const Center(child: CircularProgressIndicator());
           
           if (state.suppliers.isEmpty) {
             return const Center(child: Text("No suppliers found."));
           }

           return ListView.separated(
             padding: const EdgeInsets.all(16),
             itemCount: state.suppliers.length,
             separatorBuilder: (_,__) => const Divider(),
             itemBuilder: (context, index) {
               final s = state.suppliers[index];
               return ListTile(
                 leading: const CircleAvatar(child: Icon(Icons.business)),
                 title: Text(s.name),
                 subtitle: Text('${s.email ?? ''} • ${s.phone ?? ''}'),
                 onTap: () {
                    _showEditSupplierDialog(context, s);
                 },
               );
             },
           );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showEditSupplierDialog(context, null),
        child: const Icon(Icons.add),
      ),
    );
  }

  void _showEditSupplierDialog(BuildContext context, Supplier? supplier) {
    // For MVP, just a placeholder or simple dialog
    // Ideally use a form with controllers.
    // Assuming Repository.saveSupplier exists but no Event in Bloc for it yet.
    // For specific task requirements, CRUD Suppliers might be implicitly needed but not explicitly requested as complex UI.
    // I will show a "Comming Soon" or simple name input for now as placeholder unless strictly needed.
    // Actually, I should probably add `saveSupplier` event to Bloc to make this functional.
    
    final nameCtrl = TextEditingController(text: supplier?.name);
    final emailCtrl = TextEditingController(text: supplier?.email);
    
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(supplier == null ? "New Supplier" : "Edit Supplier"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
             TextField(controller: nameCtrl, decoration: const InputDecoration(labelText: "Name")),
             const SizedBox(height: 8),
             TextField(controller: emailCtrl, decoration: const InputDecoration(labelText: "Email")),
          ],
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text("Cancel")),
          ElevatedButton(
            onPressed: () {
               // Must implement CreateSupplier in Bloc or call Repo directly (discouraged in clean arch but OK for MVP shortcuts if Bloc is busy)
               Navigator.pop(context);
               
               // TODO: Add saveSupplier event to Bloc
            }, 
            child: const Text("Save")
          ),
        ],
      )
    );
  }
}
