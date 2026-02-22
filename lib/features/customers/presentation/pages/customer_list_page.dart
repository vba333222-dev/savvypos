import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get_it/get_it.dart';
import 'package:savvy_pos/core/config/theme/savvy_theme.dart';
import 'package:savvy_pos/features/customers/presentation/bloc/customer_bloc.dart';
import 'package:savvy_pos/features/customers/presentation/bloc/customer_event.dart';
import 'package:savvy_pos/features/customers/presentation/bloc/customer_state.dart';
import 'package:savvy_pos/features/customers/presentation/widgets/rolodex_card.dart';

class CustomerListPage extends StatelessWidget {
  final bool isSelectionMode;

  const CustomerListPage({super.key, this.isSelectionMode = false});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          GetIt.I<CustomerBloc>()..add(const CustomerEvent.search('')),
      child: _CustomerRolodexView(isSelectionMode: isSelectionMode),
    );
  }
}

class _CustomerRolodexView extends StatelessWidget {
  final bool isSelectionMode;
  const _CustomerRolodexView({required this.isSelectionMode});

  @override
  Widget build(BuildContext context) {
    final theme = context.savvy;

    return Scaffold(
      backgroundColor: theme.colors.bgPrimary,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text('ROLODEX',
                style: TextStyle(
                    color: theme.colors.textPrimary,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.5)),
            centerTitle: true,
            backgroundColor: theme.colors.bgPrimary,
            floating: true,
            pinned: true,
            elevation: 0,
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(60),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: TextField(
                  onChanged: (v) =>
                      context.read<CustomerBloc>().add(CustomerEvent.search(v)),
                  style: TextStyle(color: theme.colors.textPrimary),
                  decoration: InputDecoration(
                    hintText: 'Search contacts...',
                    prefixIcon:
                        Icon(Icons.search, color: theme.colors.textMuted),
                    filled: true,
                    fillColor: theme.colors.bgElevated,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                  ),
                ),
              ),
            ),
          ),
          BlocBuilder<CustomerBloc, CustomerState>(
            builder: (context, state) {
              if (state.isLoading) {
                return const SliverFillRemaining(
                    child: Center(child: CircularProgressIndicator()));
              }

              final customers = state.customers;
              if (customers.isEmpty) {
                return const SliverFillRemaining(
                    child: Center(child: Text('No Contacts')));
              }

              return SliverPadding(
                padding: const EdgeInsets.only(bottom: 100, top: 16),
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      final c = customers[index];
                      return Transform.translate(
                        offset: const Offset(0, 0),
                        child: Container(
                          margin: const EdgeInsets.only(bottom: 8),
                          child: RolodexCard(
                            customer: c,
                            onTap: () {
                              if (isSelectionMode) Navigator.pop(context, c);
                            },
                          ),
                        )
                            .animate()
                            .fadeIn(duration: 400.ms, delay: (50 * index).ms)
                            .slideY(
                                begin: 0.2, end: 0, curve: Curves.easeOutBack),
                      );
                    },
                    childCount: customers.length,
                  ),
                ),
              );
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: theme.colors.brandPrimary.withValues(alpha: 0.78),
        elevation: 10,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        onPressed: () {
          showDialog(
            context: context,
            builder: (_) => BlocProvider.value(
              value: context.read<CustomerBloc>(),
              child: const _AddCustomerDialog(),
            ),
          );
        },
        child: const Icon(Icons.person_add, color: Colors.white),
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
    final theme = context.savvy;
    return AlertDialog(
      backgroundColor: theme.colors.bgElevated,
      title: const Text('New Contact'),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
              controller: nameCtrl,
              decoration:
                  const InputDecoration(labelText: 'Name', filled: true)),
          const SizedBox(height: 8),
          TextField(
              controller: phoneCtrl,
              decoration:
                  const InputDecoration(labelText: 'Phone', filled: true)),
          const SizedBox(height: 8),
          TextField(
              controller: emailCtrl,
              decoration:
                  const InputDecoration(labelText: 'Email', filled: true)),
        ],
      ),
      actions: [
        TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancel',
                style: TextStyle(color: theme.colors.textSecondary))),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: theme.colors.brandPrimary,
              shape: const StadiumBorder()),
          onPressed: () {
            if (nameCtrl.text.isNotEmpty) {
              context.read<CustomerBloc>().add(CustomerEvent.addCustomer(
                  nameCtrl.text, phoneCtrl.text, emailCtrl.text));
              Navigator.pop(context);
            }
          },
          child:
              const Text('Save Contact', style: TextStyle(color: Colors.white)),
        )
      ],
    );
  }
}
