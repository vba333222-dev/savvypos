import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:get_it/get_it.dart';
import 'package:savvy_pos/core/config/theme_config.dart';
import 'package:savvy_pos/features/delivery/domain/entities/delivery_order.dart';
import 'package:savvy_pos/features/delivery/domain/entities/delivery_status.dart';
import 'package:savvy_pos/features/delivery/presentation/bloc/delivery_management_bloc.dart';
import 'package:savvy_pos/features/delivery/presentation/bloc/delivery_management_state.dart';
import 'package:savvy_pos/features/delivery/presentation/bloc/delivery_management_event.dart';
import 'package:savvy_pos/features/delivery/presentation/widgets/delivery_order_card.dart';

class DeliveryDashboardPage extends StatelessWidget {
  const DeliveryDashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => GetIt.I<DeliveryManagementBloc>()
        ..add(const DeliveryManagementEvent.loadPendingOrders()),
      child: const _DeliveryDashboardView(),
    );
  }
}

class _DeliveryDashboardView extends StatelessWidget {
  const _DeliveryDashboardView();

  @override
  Widget build(BuildContext context) {
    final colors = context.savvy.colors;

    return Scaffold(
      backgroundColor: colors.bgPrimary,
      appBar: AppBar(
        title: const Text('Omnichannel Delivery'),
        backgroundColor: colors.bgSecondary,
        elevation: 1,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            tooltip: 'Pengaturan Channel',
            onPressed: () {
              // TODO: Open bottom sheet or dialog for Channel configs
            },
          ),
          const Gap(16),
        ],
      ),
      body: BlocBuilder<DeliveryManagementBloc, DeliveryManagementState>(
        builder: (context, state) {
          if (state.isLoading &&
              state.pendingOrders.isEmpty &&
              state.activeOrders.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }

          // Segregate orders based on status
          final newOrders = state.pendingOrders
              .where((o) => o.status == DeliveryStatus.newUnaccepted)
              .toList();
          final preparingOrders = state.activeOrders
              .where((o) =>
                  o.status == DeliveryStatus.accepted ||
                  o.status == DeliveryStatus.preparing)
              .toList();
          final readyOrders = state.activeOrders
              .where((o) => o.status == DeliveryStatus.readyForPickup)
              .toList();

          return LayoutBuilder(
            builder: (context, constraints) {
              final isDesktop = constraints.maxWidth >= 900;

              if (isDesktop) {
                // ── 3-Column Kanban Layout ──
                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                          child: _KanbanColumn(
                              title: 'Masuk / Baru',
                              icon: Icons.inbox,
                              orders: newOrders,
                              color: Colors.blue)),
                      const Gap(16),
                      Expanded(
                          child: _KanbanColumn(
                              title: 'Diproses Dapur',
                              icon: Icons.soup_kitchen,
                              orders: preparingOrders,
                              color: Colors.orange)),
                      const Gap(16),
                      Expanded(
                          child: _KanbanColumn(
                              title: 'Menunggu Pickup',
                              icon: Icons.two_wheeler,
                              orders: readyOrders,
                              color: Colors.green)),
                    ],
                  ),
                );
              } else {
                // ── Mobile/Tablet Portrait Fallback (Not optimized for this task, placeholder) ──
                return const Center(
                    child: Text(
                        'Gunakan mode Lanskap / Tablet untuk melihat Kanban Board.'));
              }
            },
          );
        },
      ),
    );
  }
}

class _KanbanColumn extends StatelessWidget {
  final String title;
  final IconData icon;
  final List<DeliveryOrder> orders;
  final Color color;

  const _KanbanColumn({
    required this.title,
    required this.icon,
    required this.orders,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    final shapes = context.savvy.shapes;
    final bloc = context.read<DeliveryManagementBloc>();

    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(shapes.radiusLg),
        border: Border.all(color: color.withValues(alpha: 0.3), width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Column Header
          Container(
            padding: EdgeInsets.all(shapes.spacingMd),
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.1),
              borderRadius:
                  BorderRadius.vertical(top: Radius.circular(shapes.radiusLg)),
              border: Border(
                  bottom: BorderSide(color: color.withValues(alpha: 0.2))),
            ),
            child: Row(
              children: [
                Icon(icon, color: color),
                const Gap(8),
                Text(
                  title,
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16, color: color),
                ),
                const Spacer(),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  decoration: BoxDecoration(
                      color: color, borderRadius: BorderRadius.circular(12)),
                  child: Text('${orders.length}',
                      style: const TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold)),
                ),
              ],
            ),
          ),

          // Orders List
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.all(shapes.spacingMd),
              itemCount: orders.length,
              separatorBuilder: (_, __) => Gap(shapes.spacingMd),
              itemBuilder: (context, index) {
                final order = orders[index];
                return DeliveryOrderCard(
                    order: order,
                    onAccept: () => bloc.add(
                        DeliveryManagementEvent.acceptOrder(
                            order.deliveryUuid)),
                    onReject: () => bloc.add(
                        DeliveryManagementEvent.rejectOrder(
                            order.deliveryUuid, 'Stock kosong')),
                    // TODO: Real reject requires a dialog for reason

                    onMarkReady: () {
                      // TODO: In real app, this updates DB status to ReadyForPickup
                      // For UI simulation, we might need a dummy event in BLoC
                    },
                    onComplete: () {
                      // TODO: Complete order
                    });
              },
            ),
          ),
        ],
      ),
    );
  }
}
