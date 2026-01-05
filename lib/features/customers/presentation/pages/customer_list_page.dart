import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:savvy_pos/core/config/theme_config.dart';
import 'package:savvy_pos/features/customers/domain/entities/customer.dart';
import 'package:savvy_pos/features/customers/presentation/bloc/customer_bloc.dart';

class CustomerListPage extends StatelessWidget {
  final bool isSelectionMode;
  
  const CustomerListPage({Key? key, this.isSelectionMode = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => GetIt.I<CustomerBloc>()..add(const CustomerEvent.search('')),
      child: _CustomerListView(isSelectionMode: isSelectionMode),
    );
  }
}

class _CustomerListView extends StatefulWidget {
  final bool isSelectionMode;
  const _CustomerListView({required this.isSelectionMode});

  @override
  State<_CustomerListView> createState() => _CustomerListViewState();
}

class _CustomerListViewState extends State<_CustomerListView> {
  final _searchController = TextEditingController();
  
  void _showAddDialog() {
    final nameCtrl = TextEditingController();
    final phoneCtrl = TextEditingController();
    final emailCtrl = TextEditingController();
    
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Add Customer'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(controller: nameCtrl, decoration: const InputDecoration(labelText: 'Name')),
            TextField(controller: phoneCtrl, decoration: const InputDecoration(labelText: 'Phone')),
            TextField(controller: emailCtrl, decoration: const InputDecoration(labelText: 'Email')),
          ],
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('Cancel')),
          ElevatedButton(
            onPressed: () {
               // We need to access the BLOC from outside the dialog but currently it's provided in Page.
               // Since ShowDialog is a new route, context needs to be right.
               // We can wrap AlertDialog in BlocProvider.value logic used in Settings, 
               // OR passing the function.
               // Simpler: Return data from dialog? No, we want to trigger Bloc.
               // Let's rely on parent context if using builder correctly, OR pass the Bloc.
               // But inside showDialog context is different.
            },
            child: const Text('Save'),
          )
        ],
      ),
    );
     // Since implementing Dialog Logic inside a method is annoying with context, 
     // I will use a separate small widget or just refactor.
     // For speed, let's just push a small Page or use a simple persistent bottom sheet logic if desired.
     // But Requirements say "modal/dialog".
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.savvy.colors;
    
    return Scaffold(
      backgroundColor: colors.bgPrimary,
      appBar: AppBar(
        title: const Text('Customers'),
        backgroundColor: colors.bgPrimary,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
           showDialog(
             context: context,
             builder: (_) => BlocProvider.value(
               value: context.read<CustomerBloc>(),
               child: const _AddCustomerDialog(),
             ),
           );
        },
        child: const Icon(Icons.add),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _searchController,
              decoration: const InputDecoration(
                labelText: 'Search by name or phone', 
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder()
              ),
              onChanged: (v) => context.read<CustomerBloc>().add(CustomerEvent.search(v)),
            ),
          ),
          Expanded(
            child: BlocBuilder<CustomerBloc, CustomerState>(
              builder: (context, state) {
                return state.maybeWhen(
                  loading: () => const Center(child: CircularProgressIndicator()),
                  loaded: (customers) {
                    if (customers.isEmpty) return const Center(child: Text('No customers found'));
                    return ListView.builder(
                      itemCount: customers.length,
                      itemBuilder: (context, index) {
                        final c = customers[index];
                        return ListTile(
                          leading: CircleAvatar(child: Text(c.name[0].toUpperCase())),
                          title: Text(c.name),
                          subtitle: Text(c.phone ?? c.email ?? 'No contact info'),
                          trailing: widget.isSelectionMode 
                             ? const Icon(Icons.check_circle_outline)
                             : null,
                          onTap: widget.isSelectionMode 
                             ? () => Navigator.pop(context, c)
                             : null,
                        );
                      },
                    );
                  },
                  error: (msg) => Center(child: Text('Error: $msg')),
                  orElse: () => const SizedBox.shrink(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _AddCustomerDialog extends StatefulWidget {
  const _AddCustomerDialog();

  @override
  State<_AddCustomerDialog> createState() => _AddCustomerDialogState();
}

class _AddCustomerDialogState extends State<_AddCustomerDialog> {
    final nameCtrl = TextEditingController();
    final phoneCtrl = TextEditingController();
    final emailCtrl = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        title: const Text('Add Customer'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(controller: nameCtrl, decoration: const InputDecoration(labelText: 'Name*')),
            TextField(controller: phoneCtrl, decoration: const InputDecoration(labelText: 'Phone')),
            TextField(controller: emailCtrl, decoration: const InputDecoration(labelText: 'Email')),
          ],
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('Cancel')),
          ElevatedButton(
            onPressed: () {
              if (nameCtrl.text.isNotEmpty) {
                context.read<CustomerBloc>().add(
                  CustomerEvent.addCustomer(nameCtrl.text, phoneCtrl.text, emailCtrl.text)
                );
                Navigator.pop(context);
              }
            },
            child: const Text('Save'),
          )
        ],
      );
  }
}
