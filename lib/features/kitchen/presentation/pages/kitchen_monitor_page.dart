import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:savvy_pos/core/config/theme/savvy_theme.dart';
import 'package:savvy_pos/core/presentation/widgets/savvy_text.dart';
import 'package:savvy_pos/features/kitchen/presentation/bloc/kitchen_bloc.dart';
import 'package:savvy_pos/features/kitchen/presentation/widgets/kitchen_order_card.dart';
import 'package:get_it/get_it.dart';

class KitchenMonitorPage extends StatelessWidget {
  const KitchenMonitorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetIt.I<KitchenBloc>()..add(const KitchenEvent.startListening()),
      child: const _KitchenMonitorView(),
    );
  }
}

class _KitchenMonitorView extends StatelessWidget {
  const _KitchenMonitorView();

  @override
  Widget build(BuildContext context) {
    final theme = context.savvy;

    return Scaffold(
      backgroundColor: const Color(0xFF263238), // Dark KDS Background
      appBar: AppBar(
        title: const Text('KITCHEN DISPLAY SYSTEM'),
        centerTitle: true,
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        actions: [
          // Stats or Status
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: BlocBuilder<KitchenBloc, KitchenState>(
              builder: (context, state) {
                return state.maybeWhen(
                  loaded: (orders) => Center(child: Text('PENDING: ${orders.length}', style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.orangeAccent))),
                  orElse: () => const SizedBox.shrink(),
                );
              },
            ),
          )
        ],
      ),
      body: BlocBuilder<KitchenBloc, KitchenState>(
        builder: (context, state) {
          return state.when(
            initial: () => const Center(child: CircularProgressIndicator()),
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (msg) => Center(child: Text(msg, style: const TextStyle(color: Colors.red))),
            loaded: (orders) {
               if (orders.isEmpty) {
                 return Center(
                   child: Column(
                     mainAxisSize: MainAxisSize.min,
                     children: [
                       Icon(Icons.check_circle_outline, size: 100, color: Colors.white.withOpacity(0.2))
                         .animate(onPlay: (c) => c.repeat(reverse: true))
                         .scale(begin: const Offset(1, 1), end: const Offset(1.1, 1.1), duration: 2.seconds),
                       const SizedBox(height: 24),
                       const Text('All Orders Cleared', style: TextStyle(color: Colors.white54, fontSize: 24)),
                       const SizedBox(height: 8),
                       const Text('Waiting for new tickets...', style: TextStyle(color: Colors.white30)),
                     ],
                   ),
                 );
               }

               // Manual Staggered Layout (3 Columns for standard wide KDS)
               // Simple row of columns approach for fixed layout stability
               return SingleChildScrollView(
                 padding: const EdgeInsets.all(16),
                 child: LayoutBuilder(
                   builder: (context, constraints) {
                     int cols = 3;
                     if (constraints.maxWidth < 800) cols = 2;
                     if (constraints.maxWidth < 500) cols = 1;
                     
                     // Distribute orders
                     List<List<Widget>> columns = List.generate(cols, (_) => []);
                     for (var i = 0; i < orders.length; i++) {
                       columns[i % cols].add(
                         Padding(
                           padding: const EdgeInsets.only(bottom: 16),
                           child: KitchenOrderCard(
                             order: orders[i],
                             onBump: () => context.read<KitchenBloc>().add(KitchenEvent.markAsDone(orders[i].uuid)),
                           ),
                         )
                       );
                     }

                     return Row(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: columns.map((colWidgets) => Expanded(
                         child: Padding(
                           padding: const EdgeInsets.symmetric(horizontal: 8),
                           child: Column(children: colWidgets),
                         ),
                       )).toList(),
                     );
                   },
                 ),
               );
            },
          );
        },
      ),
    );
  }
}
