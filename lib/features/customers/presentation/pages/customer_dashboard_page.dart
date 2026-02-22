import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:savvy_pos/core/di/injection.dart';
import 'package:savvy_pos/features/customers/presentation/bloc/customer_bloc.dart';
import 'package:savvy_pos/features/customers/presentation/bloc/customer_event.dart';
import 'package:savvy_pos/features/customers/presentation/bloc/customer_state.dart';
import 'package:savvy_pos/features/customers/domain/entities/customer_profile.dart';
import 'package:intl/intl.dart';

class CustomerDashboardPage extends StatelessWidget {
  const CustomerDashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<CustomerBloc>(),
      child: const _CustomerDashboardView(),
    );
  }
}

class _CustomerDashboardView extends StatelessWidget {
  const _CustomerDashboardView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Customer CRM'),
        actions: [
          IconButton(
              onPressed: () => context
                  .read<CustomerBloc>()
                  .add(const CustomerEvent.refresh()),
              icon: const Icon(Icons.refresh)),
        ],
      ),
      body: Row(
        children: [
          // Sidebar List
          const Expanded(flex: 3, child: _CustomerListPanel()),
          const VerticalDivider(width: 1),
          // Detail View
          Expanded(flex: 7, child: _CustomerDetailPanel()),
        ],
      ),
    );
  }
}

class _CustomerListPanel extends StatelessWidget {
  const _CustomerListPanel();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Search & Filter
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Search Customers',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(),
                ),
                onChanged: (val) =>
                    context.read<CustomerBloc>().add(CustomerEvent.search(val)),
              ),
              const SizedBox(height: 8),
              SizedBox(
                height: 40,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    _FilterChip(label: 'All', segment: null),
                    _FilterChip(label: 'VIP', segment: CustomerSegment.vip),
                    _FilterChip(
                        label: 'Regular', segment: CustomerSegment.regular),
                    _FilterChip(
                        label: 'New', segment: CustomerSegment.newGuest),
                    _FilterChip(
                        label: 'At Risk', segment: CustomerSegment.lapsed),
                  ],
                ),
              )
            ],
          ),
        ),

        // List
        Expanded(
          child: BlocBuilder<CustomerBloc, CustomerState>(
            builder: (context, state) {
              if (state.isLoading && state.customers.isEmpty) {
                return const Center(child: CircularProgressIndicator());
              }

              if (state.customers.isEmpty) {
                return const Center(child: Text('No customers found'));
              }

              return ListView.builder(
                itemCount: state.customers.length,
                itemBuilder: (context, index) {
                  final customer = state.customers[index];
                  final isSelected =
                      state.selectedCustomer?.uuid == customer.uuid;

                  return ListTile(
                    selected: isSelected,
                    selectedTileColor: Colors.blue.withValues(alpha: 0.1),
                    leading: CircleAvatar(
                      backgroundColor: _getSegmentColor(customer.segment),
                      child: Text(customer.name[0].toUpperCase(),
                          style: const TextStyle(color: Colors.white)),
                    ),
                    title: Text(customer.name),
                    subtitle: Text(customer.phoneNumber ?? 'No Phone'),
                    trailing:
                        Text('\$${customer.totalSpent.toStringAsFixed(0)}'),
                    onTap: () => context
                        .read<CustomerBloc>()
                        .add(CustomerEvent.selectCustomer(customer.uuid)),
                  ).animate().fadeIn(duration: 200.ms);
                },
              );
            },
          ),
        ),
      ],
    );
  }

  Color _getSegmentColor(CustomerSegment s) {
    switch (s) {
      case CustomerSegment.vip:
        return Colors.purple;
      case CustomerSegment.regular:
        return Colors.blue;
      case CustomerSegment.returning:
        return Colors.green;
      case CustomerSegment.newGuest:
        return Colors.orange;
      case CustomerSegment.lapsed:
        return Colors.grey;
    }
  }
}

class _FilterChip extends StatelessWidget {
  final String label;
  final CustomerSegment? segment;

  const _FilterChip({required this.label, required this.segment});

  @override
  Widget build(BuildContext context) {
    final active =
        context.select((CustomerBloc b) => b.state.activeFilter == segment);
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: FilterChip(
        label: Text(label),
        selected: active,
        onSelected: (val) {
          context
              .read<CustomerBloc>()
              .add(CustomerEvent.filterBySegment(active ? null : segment));
        },
      ),
    );
  }
}

class _CustomerDetailPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final customer =
        context.select((CustomerBloc b) => b.state.selectedCustomer);

    if (customer == null) {
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.person_pin, size: 64, color: Colors.grey),
            SizedBox(height: 16),
            Text('Select a customer to view profile',
                style: TextStyle(color: Colors.grey)),
          ],
        ),
      );
    }

    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Row(
            children: [
              CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.blue.shade100,
                  child: Text(customer.name[0],
                      style: const TextStyle(fontSize: 32))),
              const SizedBox(width: 24),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(customer.name,
                      style: Theme.of(context).textTheme.headlineMedium),
                  Row(
                    children: [
                      const Icon(Icons.phone, size: 16, color: Colors.grey),
                      const SizedBox(width: 4),
                      Text(customer.phoneNumber ?? 'No Phone'),
                      const SizedBox(width: 16),
                      const Icon(Icons.email, size: 16, color: Colors.grey),
                      const SizedBox(width: 4),
                      Text(customer.email ?? 'No Email'),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Chip(
                      label: Text(customer.segment.name.toUpperCase()),
                      backgroundColor: Colors.blue.withValues(alpha: 0.1)),
                ],
              ),
              const Spacer(),
              _StatCard(
                  'Total Spent', '\$${customer.totalSpent.toStringAsFixed(2)}'),
              const SizedBox(width: 16),
              _StatCard('Visits', '${customer.visitCount}'),
              const SizedBox(width: 16),
              _StatCard('Avg Order',
                  '\$${customer.averageOrderValue.toStringAsFixed(2)}'),
            ],
          ),

          const Divider(height: 48),

          // Notes section
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Notes', style: Theme.of(context).textTheme.titleLarge),
              IconButton(
                  onPressed: () => _addNoteDialog(context, customer),
                  icon: const Icon(Icons.add)),
            ],
          ),
          if (customer.notes.isEmpty)
            const Padding(
                padding: EdgeInsets.all(16),
                child: Text('No notes yet.',
                    style: TextStyle(fontStyle: FontStyle.italic)))
          else
            ...customer.notes.map((n) => Card(
                  color: n.isCritical ? Colors.red.shade50 : null,
                  child: ListTile(
                    title: Text(n.content),
                    subtitle: Text(
                        '${n.createdBy} • ${DateFormat.yMMMd().format(n.createdAt)}'),
                    trailing: n.isCritical
                        ? const Icon(Icons.warning, color: Colors.red)
                        : null,
                  ),
                )),

          const Divider(height: 48),

          // Loyalty Section (Placeholder)
          Text('Loyalty Program',
              style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 16),
          // We could integrate LoyaltyBloc here to show points.
          // For now just structure.
          const Card(
            child: ListTile(
              leading: Icon(Icons.stars, color: Colors.amber, size: 40),
              title: Text('Gold Tier'),
              subtitle: Text('1,250 Points Available'),
              trailing:
                  ElevatedButton(onPressed: null, child: Text("View History")),
            ),
          ),
        ],
      ),
    ).animate().fadeIn();
  }

  void _addNoteDialog(BuildContext context, CustomerProfile customer) {
    String content = '';
    bool isCrit = false;
    showDialog(
        context: context,
        builder: (ctx) => StatefulBuilder(
              builder: (context, setState) => AlertDialog(
                title: const Text('Add Note'),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      decoration: const InputDecoration(
                          labelText: 'Content', border: OutlineInputBorder()),
                      maxLines: 3,
                      onChanged: (v) => content = v,
                    ),
                    CheckboxListTile(
                      title: const Text('Critical Note (Popup)'),
                      value: isCrit,
                      onChanged: (v) => setState(() => isCrit = v!),
                    ),
                  ],
                ),
                actions: [
                  TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('Cancel')),
                  ElevatedButton(
                      onPressed: () {
                        context.read<CustomerBloc>().add(CustomerEvent.addNote(
                            customer.uuid, content,
                            isCritical: isCrit));
                        Navigator.pop(context);
                      },
                      child: const Text('Add')),
                ],
              ),
            ));
  }
}

class _StatCard extends StatelessWidget {
  final String label;
  final String value;
  const _StatCard(this.label, this.value);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(value,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        Text(label, style: const TextStyle(fontSize: 12, color: Colors.grey)),
      ],
    );
  }
}
