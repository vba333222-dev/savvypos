import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:savvy_pos/core/di/injection.dart';
import 'package:savvy_pos/features/loyalty/presentation/bloc/loyalty_bloc.dart';
import 'package:savvy_pos/features/loyalty/presentation/bloc/loyalty_state.dart';

class LoyaltyProgramPage extends StatelessWidget {
  const LoyaltyProgramPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<LoyaltyBloc>(),
      child: const _LoyaltyProgramView(),
    );
  }
}

class _LoyaltyProgramView extends StatelessWidget {
  const _LoyaltyProgramView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Loyalty Program')),
      body: BlocBuilder<LoyaltyBloc, LoyaltyState>(
        builder: (context, state) {
          if (state.isLoading)
            return const Center(child: CircularProgressIndicator());

          final config = state.config;
          if (config == null)
            return const Center(child: Text("Loading Config..."));

          return ListView(
            padding: const EdgeInsets.all(24),
            children: [
              _ConfigCard(
                title: 'Earning Rules',
                children: [
                  ListTile(
                    title: const Text('Points Per Dollar'),
                    subtitle: Text('${config.pointsPerDollar} points'),
                    trailing: const Icon(Icons.edit),
                    onTap: () {
                      // Show dialog to edit
                    },
                  ),
                  ListTile(
                    title: const Text('Signup Bonus'),
                    subtitle: Text('${config.signupBonus} points'),
                    trailing: const Icon(Icons.edit),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              _ConfigCard(
                title: 'Active Rewards',
                children: [
                  if (state.availableRewards.isEmpty)
                    const Padding(
                        padding: EdgeInsets.all(16),
                        child: Text("No active rewards defined.")),
                  ...state.availableRewards.map((r) => ListTile(
                        title: Text(r.name),
                        subtitle: Text('${r.pointsCost} pts'),
                        leading: const Icon(Icons.card_giftcard),
                        trailing: Switch(value: r.isActive, onChanged: (v) {}),
                      )),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: ElevatedButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.add),
                        label: const Text("Add Reward")),
                  )
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}

class _ConfigCard extends StatelessWidget {
  final String title;
  final List<Widget> children;
  const _ConfigCard({required this.title, required this.children});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(title, style: Theme.of(context).textTheme.titleLarge),
          ),
          const Divider(height: 1),
          ...children,
        ],
      ),
    );
  }
}
