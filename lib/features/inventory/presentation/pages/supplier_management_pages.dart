import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:savvy_pos/core/di/injection.dart';
import 'package:savvy_pos/features/inventory/domain/entities/inventory_entities.dart';
import 'package:savvy_pos/features/inventory/domain/repositories/i_inventory_repository.dart';
import 'package:uuid/uuid.dart';
import 'package:gap/gap.dart';

class SupplierListPage extends StatefulWidget {
  const SupplierListPage({super.key});

  @override
  State<SupplierListPage> createState() => _SupplierListPageState();
}

class _SupplierListPageState extends State<SupplierListPage> {
  late Future<List<Supplier>> _suppliersFuture;
  final _repo = getIt<IInventoryRepository>();

  @override
  void initState() {
    super.initState();
    _refresh();
  }

  void _refresh() {
    setState(() {
      _suppliersFuture = _repo.getSuppliers();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Suppliers'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () async {
              await Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const SupplierEditorPage()),
              );
              _refresh();
            },
          ),
        ],
      ),
      body: FutureBuilder<List<Supplier>>(
        future: _suppliersFuture,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          final suppliers = snapshot.data!;

          if (suppliers.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.local_shipping_outlined,
                      size: 64, color: Colors.grey),
                  const Gap(16),
                  Text('No Suppliers Yet',
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge
                          ?.copyWith(color: Colors.grey)),
                  const Gap(8),
                  ElevatedButton(
                    onPressed: () async {
                      await Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (_) => const SupplierEditorPage()),
                      );
                      _refresh();
                    },
                    child: const Text('Add Supplier'),
                  )
                ],
              ),
            );
          }

          return ListView.builder(
            itemCount: suppliers.length,
            padding: const EdgeInsets.all(16),
            itemBuilder: (context, index) {
              final supplier = suppliers[index];
              return Card(
                elevation: 2,
                margin: const EdgeInsets.only(bottom: 12),
                child: ListTile(
                  leading: CircleAvatar(child: Text(supplier.name[0])),
                  title: Text(supplier.name,
                      style: const TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: Text(
                      '${supplier.email ?? '-'} • ${supplier.phone ?? '-'}'),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () async {
                    await Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (_) =>
                              SupplierEditorPage(supplier: supplier)),
                    );
                    _refresh();
                  },
                ),
              )
                  .animate()
                  .fadeIn()
                  .slideY(begin: 0.1, end: 0, delay: (index * 50).ms);
            },
          );
        },
      ),
    );
  }
}

class SupplierEditorPage extends StatefulWidget {
  final Supplier? supplier;

  const SupplierEditorPage({super.key, this.supplier});

  @override
  State<SupplierEditorPage> createState() => _SupplierEditorPageState();
}

class _SupplierEditorPageState extends State<SupplierEditorPage> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameCtrl;
  late TextEditingController _emailCtrl;
  late TextEditingController _phoneCtrl;
  late TextEditingController _addressCtrl;
  late TextEditingController _leadTimeCtrl;

  @override
  void initState() {
    super.initState();
    _nameCtrl = TextEditingController(text: widget.supplier?.name);
    _emailCtrl = TextEditingController(text: widget.supplier?.email);
    _phoneCtrl = TextEditingController(text: widget.supplier?.phone);
    _addressCtrl = TextEditingController(text: widget.supplier?.address);
    _leadTimeCtrl = TextEditingController(
        text: widget.supplier?.leadTimeDays.toString() ?? '0');
  }

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) return;

    final supplier = Supplier(
      uuid: widget.supplier?.uuid ?? const Uuid().v4(),
      name: _nameCtrl.text,
      email: _emailCtrl.text.isEmpty ? null : _emailCtrl.text,
      phone: _phoneCtrl.text.isEmpty ? null : _phoneCtrl.text,
      address: _addressCtrl.text.isEmpty ? null : _addressCtrl.text,
      leadTimeDays: int.tryParse(_leadTimeCtrl.text) ?? 0,
      updatedAt: DateTime.now(),
    );

    await getIt<IInventoryRepository>().saveSupplier(supplier);
    if (mounted) Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.supplier == null ? 'New Supplier' : 'Edit Supplier'),
        actions: [
          IconButton(icon: const Icon(Icons.check), onPressed: _save),
        ],
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(24),
          children: [
            TextFormField(
              controller: _nameCtrl,
              decoration: const InputDecoration(
                  labelText: 'Supplier Name', border: OutlineInputBorder()),
              validator: (v) => v == null || v.isEmpty ? 'Required' : null,
            ),
            const Gap(16),
            TextFormField(
              controller: _emailCtrl,
              decoration: const InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.email)),
            ),
            const Gap(16),
            TextFormField(
              controller: _phoneCtrl,
              decoration: const InputDecoration(
                  labelText: 'Phone',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.phone)),
            ),
            const Gap(16),
            TextFormField(
              controller: _addressCtrl,
              decoration: const InputDecoration(
                  labelText: 'Address',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.location_on)),
              maxLines: 2,
            ),
            const Gap(16),
            TextFormField(
              controller: _leadTimeCtrl,
              decoration: const InputDecoration(
                  labelText: 'Lead Time (Days)', border: OutlineInputBorder()),
              keyboardType: TextInputType.number,
            ),
            const Gap(32),
            SizedBox(
              height: 50,
              child: ElevatedButton(
                onPressed: _save,
                child: const Text('Save Supplier'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
