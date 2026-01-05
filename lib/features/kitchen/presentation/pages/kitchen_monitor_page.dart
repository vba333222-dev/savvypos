import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:savvy_pos/core/config/theme_config.dart';
import 'package:savvy_pos/features/kitchen/presentation/bloc/kitchen_bloc.dart';
import 'package:savvy_pos/features/kitchen/presentation/widgets/kitchen_order_card.dart';

class KitchenMonitorPage extends StatelessWidget {
  const KitchenMonitorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => GetIt.I<KitchenBloc>()..add(const KitchenEvent.startMonitoring()),
      child: const _KitchenMonitorView(),
    );
  }
}

class _KitchenMonitorView extends StatelessWidget {
  const _KitchenMonitorView();

  @override
  Widget build(BuildContext context) {
    final colors = context.savvy.colors;
    
    return Scaffold(
      backgroundColor: colors.bgSecondary,
      appBar: AppBar(
        title: const Text('KDS - Kitchen Monitor'),
        backgroundColor: colors.bgPrimary,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
               context.read<KitchenBloc>().add(const KitchenEvent.startMonitoring());
            },
          )
        ],
      ),
      body: BlocBuilder<KitchenBloc, KitchenState>(
        builder: (context, state) {
          return state.maybeWhen(
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (msg) => Center(child: Text('Error: $msg', style: TextStyle(color: colors.stateError))),
            loaded: (orders) {
              if (orders.isEmpty) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.check_circle_outline, size: 64, color: colors.stateSuccess),
                      const SizedBox(height: 16),
                      Text('All Orders Cleared!', style: TextStyle(color: colors.textSecondary, fontSize: 24)),
                    ],
                  ),
                );
              }
              
              return ListView.builder(
                padding: const EdgeInsets.all(16),
                scrollDirection: Axis.horizontal,
                itemCount: orders.length,
                itemBuilder: (context, index) {
                  return KitchenOrderCard(order: orders[index]);
                },
              );
            },
            orElse: () => const SizedBox.shrink(),
          );
        },
      ),
    );
  }
}
