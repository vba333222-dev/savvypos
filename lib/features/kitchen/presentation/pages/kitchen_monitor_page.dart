import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:savvy_pos/core/config/theme/savvy_theme.dart';
import 'package:savvy_pos/core/presentation/widgets/savvy_ticker.dart';
import 'package:savvy_pos/features/kitchen/presentation/bloc/kitchen_bloc.dart';
import 'package:savvy_pos/features/kitchen/presentation/widgets/kitchen_order_card.dart';
import 'package:get_it/get_it.dart';

class KitchenMonitorPage extends StatefulWidget {
  const KitchenMonitorPage({super.key});

  @override
  State<KitchenMonitorPage> createState() => _KitchenMonitorPageState();
}

class _KitchenMonitorPageState extends State<KitchenMonitorPage> {
  int _prevCount = 0;

  @override
  Widget build(BuildContext context) {
    final theme = context.savvy;
    final width = MediaQuery.of(context).size.width;
    final crossAxisCount = width < 600 ? 1 : (width < 1200 ? 3 : 4);

    return BlocProvider(
      create: (context) => GetIt.I<KitchenBloc>()..add(const KitchenEvent.startListening()),
      child: Scaffold(
        backgroundColor: const Color(0xFF1A1F24), // Kinetic Dark
        appBar: AppBar(
          title: Row(
            children: [
              Icon(Icons.kitchen, color: theme.colors.brandPrimary),
              SizedBox(width: 8),
              Text('KINETIC KITCHEN', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white, letterSpacing: 2)),
            ],
          ),
          backgroundColor: const Color(0xFF0F1216),
          foregroundColor: Colors.white,
          actions: [
            // Header Stats
            BlocBuilder<KitchenBloc, KitchenState>(
              builder: (context, state) {
                final count = state.maybeWhen(loaded: (orders) => orders.length, orElse: () => 0);
                return Padding(
                  padding: const EdgeInsets.only(right: 24.0),
                  child: Row(
                    children: [
                       Column(
                         mainAxisAlignment: MainAxisAlignment.center,
                         crossAxisAlignment: CrossAxisAlignment.end,
                         children: [
                           Text('PENDING', style: TextStyle(color: Colors.white54, fontSize: 10)),
                           SavvyTicker(
                             value: count.toDouble(), 
                             style: TextStyle(color: theme.colors.brandAccent, fontSize: 24, fontWeight: FontWeight.bold),
                           ),
                         ],
                       ),
                       SizedBox(width: 24),
                       // Mock Avg Time or Calculate from orders
                       Column(
                         mainAxisAlignment: MainAxisAlignment.center,
                         crossAxisAlignment: CrossAxisAlignment.end,
                         children: [
                           Text('AVG TIME', style: TextStyle(color: Colors.white54, fontSize: 10)),
                           Text('06:30', style: TextStyle(color: theme.colors.stateSuccess, fontSize: 24, fontWeight: FontWeight.bold)),
                         ],
                       ),
                    ],
                  ),
                );
              },
            )
          ],
        ),
        body: BlocConsumer<KitchenBloc, KitchenState>(
          listener: (context, state) {
            state.mapOrNull(loaded: (data) {
              if (data.orders.length > _prevCount) {
                 HapticFeedback.mediumImpact(); // DING!
                 // Ideally play sound here
              }
              _prevCount = data.orders.length;
            });
          },
          builder: (context, state) {
            return state.when(
              initial: () => const Center(child: CircularProgressIndicator()),
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (msg) => Center(child: Text(msg, style: TextStyle(color: theme.colors.stateError))),
              loaded: (orders) {
                 if (orders.isEmpty) {
                   return Center(
                     child: Column(
                       mainAxisSize: MainAxisSize.min,
                       children: [
                         Icon(Icons.check_circle_outline, size: 100, color: Colors.white10)
                           .animate(onPlay: (c) => c.repeat(reverse: true))
                           .scale(begin: const Offset(1, 1), end: const Offset(1.05, 1.05), duration: 2.seconds),
                         const SizedBox(height: 24),
                         const Text('ALL CLEAR', style: TextStyle(color: Colors.white24, fontSize: 32, fontWeight: FontWeight.w900, letterSpacing: 4)),
                       ],
                     ),
                   );
                 }

                 // Sort: Oldest First (Urgent)
                 final sortedOrders = List.from(orders)..sort((a,b) => a.orderTime.compareTo(b.orderTime));

                 return MasonryGridView.count(
                   crossAxisCount: crossAxisCount,
                   mainAxisSpacing: 16,
                   crossAxisSpacing: 16,
                   padding: const EdgeInsets.all(16),
                   itemCount: sortedOrders.length,
                   itemBuilder: (context, index) {
                     final order = sortedOrders[index];
                     return KitchenOrderCard(
                       key: ValueKey(order.uuid),
                       order: order,
                       onBump: () => context.read<KitchenBloc>().add(KitchenEvent.markAsDone(order.uuid)),
                     ).animate()
                      .slideX(begin: -0.5, duration: 400.ms, curve: Curves.easeOutQuart)
                      .fadeIn(duration: 400.ms);
                   },
                 );
              },
            );
          },
        ),
      ),
    );
  }
}
