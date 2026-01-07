import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:savvy_pos/core/config/theme/savvy_theme.dart';
import 'package:savvy_pos/core/presentation/widgets/savvy_text.dart';
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

    return BlocProvider(
      create: (context) => GetIt.I<KitchenBloc>()..add(const KitchenEvent.startListening()),
      child: Scaffold(
        backgroundColor: const Color(0xFF1A1F24), // Dark rail background
        appBar: AppBar(
          title: Row(
            children: [
              Icon(Icons.kitchen, color: theme.colors.brandPrimary),
              SizedBox(width: 8),
              Text('KITCHEN RAIL', style: SavvyTextStyle.h3.style(theme).copyWith(color: Colors.white, letterSpacing: 2)),
            ],
          ),
          backgroundColor: const Color(0xFF0F1216),
          foregroundColor: Colors.white,
          automaticallyImplyLeading: true,
          actions: [
            // Stats Bar
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
                       Column(
                         mainAxisAlignment: MainAxisAlignment.center,
                         crossAxisAlignment: CrossAxisAlignment.end,
                         children: [
                           Text('AVG TIME', style: TextStyle(color: Colors.white54, fontSize: 10)),
                           Text('04:12', style: TextStyle(color: theme.colors.stateSuccess, fontSize: 24, fontWeight: FontWeight.bold)),
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
                // New Order Arrived! 
                // Play Ding? SoundHelper needed.
                HapticFeedback.mediumImpact(); 
              }
              _prevCount = data.orders.length;
            });
          },
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
                         Icon(Icons.check_circle_outline, size: 100, color: Colors.white10)
                           .animate(onPlay: (c) => c.repeat(reverse: true))
                           .scale(begin: const Offset(1, 1), end: const Offset(1.05, 1.05), duration: 2.seconds),
                         const SizedBox(height: 24),
                         const Text('RAIL CLEAR', style: TextStyle(color: Colors.white24, fontSize: 32, fontWeight: FontWeight.w900, letterSpacing: 4)),
                       ],
                     ),
                   );
                 }

                 // THE RAIL (Horizontal List)
                 // We reverse it? Or Newest Left? 
                 // Assuming List is sorted by time. Usually Oldest (Urgent) on Left. 
                 // If we want "Slide in from Left", implies Newest Left? 
                 // Standard KDS: Oldest Left (Work Left to Right). New orders appear on Right or push in?
                 // Requirement: "Slide In from the Left, pushing existing tickets to the right". 
                 // So Newest is Left.
                 
                 final sortedOrders = List.from(orders)..sort((a,b) => b.orderTime.compareTo(a.orderTime)); // Newest first

                 return ListView.builder(
                   scrollDirection: Axis.horizontal,
                   padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                   itemCount: sortedOrders.length,
                   itemBuilder: (context, index) {
                     final order = sortedOrders[index];
                     return Padding(
                       padding: const EdgeInsets.only(right: 16),
                       child: KitchenOrderCard(
                         order: order,
                         onBump: () => context.read<KitchenBloc>().add(KitchenEvent.markAsDone(order.uuid)),
                         onVoid: () {}, // Optional
                       ).animate(key: ValueKey(order.uuid)) // Unique key for entrance
                        .moveX(begin: -100, duration: 400.ms, curve: Curves.easeOutBack) // Slide from Left
                        .fadeIn(),
                     );
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
