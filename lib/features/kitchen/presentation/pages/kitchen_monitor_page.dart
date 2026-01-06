import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:savvy_pos/core/config/theme_config.dart';
import 'package:savvy_pos/core/presentation/widgets/savvy_widgets.dart';
import 'package:savvy_pos/features/kitchen/domain/entities/kitchen_order.dart';
import 'package:savvy_pos/features/kitchen/presentation/bloc/kitchen_bloc.dart';
import 'package:savvy_pos/core/database/database.dart'; // For OrderItemTableData

class KitchenMonitorPage extends StatelessWidget {
  const KitchenMonitorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => GetIt.I<KitchenBloc>()..add(const KitchenEvent.startListening()),
      child: const _KitchenView(),
    );
  }
}

class _KitchenView extends StatelessWidget {
  const _KitchenView();

  @override
  Widget build(BuildContext context) {
    final theme = context.savvy;
    return Scaffold(
      backgroundColor: theme.colors.bgPrimary,
      appBar: AppBar(
        title: SavvyText("Kitchen Monitor (KDS)", style: SavvyTextStyle.h3, color: theme.colors.textPrimary),
        backgroundColor: theme.colors.bgSecondary,
        elevation: 0,
        iconTheme: IconThemeData(color: theme.colors.textPrimary),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => context.read<KitchenBloc>().add(const KitchenEvent.startListening()),
          )
        ],
      ),
      body: BlocBuilder<KitchenBloc, KitchenState>(
        builder: (context, state) {
          return state.when(
            initial: () => const Center(child: CircularProgressIndicator()),
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (msg) => Center(child: Text("Error: $msg")),
            loaded: (orders) {
              if (orders.isEmpty) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.check_circle_outline, size: 64, color: theme.colors.stateSuccess),
                      const SizedBox(height: 16),
                      Text("All Clear!", style: TextStyle(fontSize: 24, color: theme.colors.textSecondary)),
                    ],
                  ),
                );
              }

              return SingleChildScrollView(
                padding: EdgeInsets.all(theme.shapes.spacingMd),
                child: Wrap(
                  spacing: theme.shapes.spacingMd,
                  runSpacing: theme.shapes.spacingMd,
                  children: orders.map((order) {
                    return _KitchenTicket(
                      key: ValueKey(order.order.uuid),
                      order: order,
                    ).animate().fadeIn().scale();
                  }).toList(),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class _KitchenTicket extends StatefulWidget {
  final KitchenOrder order;

  const _KitchenTicket({super.key, required this.order});

  @override
  State<_KitchenTicket> createState() => _KitchenTicketState();
}

class _KitchenTicketState extends State<_KitchenTicket> {
  late Timer _timer;
  Duration _elapsed = Duration.zero;

  @override
  void initState() {
    super.initState();
    _updateTime();
    _timer = Timer.periodic(const Duration(seconds: 30), (_) => _updateTime());
  }

  void _updateTime() {
    if (mounted) {
      setState(() {
        _elapsed = DateTime.now().difference(widget.order.order.transactionDate);
      });
    }
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  Color _getStatusColor(SavvyColors themeColors) {
    if (_elapsed.inMinutes >= 15) return themeColors.stateError;
    if (_elapsed.inMinutes >= 10) return themeColors.stateWarning;
    return themeColors.stateSuccess;
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.savvy;
    final statusColor = _getStatusColor(theme.colors);
    final order = widget.order.order;
    final items = widget.order.items;

    // Responsive width (Mobile: Full, Desktop: Fixed)
    final width = MediaQuery.of(context).size.width > 600 ? 300.0 : double.infinity;

    return GestureDetector(
      onTap: () {
        context.read<KitchenBloc>().add(KitchenEvent.markAsDone(order.uuid));
      },
      onLongPress: () {
        // Show details if needed, but card has list already
      },
      child: SavvyBox(
        width: width,
        color: theme.colors.bgElevated,
        borderColor: statusColor,
        borderWidth: 2,
        padding: EdgeInsets.zero,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Header
            Container(
              color: statusColor,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "#${order.orderNumber}", 
                    style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)
                  ),
                  Text(
                    "${_elapsed.inMinutes}m", 
                    style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)
                  ),
                ],
              ),
            ),
            
            // Body
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Table info if available? (Wait, OrderTable doesn't have explicit Table Number column in typical schema unless mapped. Logic: restaurantTable uses RestaurantTable. 
                  // But usually Order has text note or table link. 
                  // OrderTable schema showed 'customerUuid' but no 'tableUuid'. 
                  // Wait, tables.dart: RestaurantTable has 'currentOrderUuid'. 
                  // Link is reverse. Finding table requires query. 
                  // For MVP, if no table, show Customer Name or ID.
                  // Or assume manual note has table.)
                  
                  if (order.customerUuid != null)
                     Text("Cust: ${order.customerUuid}", style: TextStyle(color: theme.colors.textSecondary, fontSize: 12)),
                  
                  const Divider(),
                  
                  ...items.map((item) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                          decoration: BoxDecoration(
                            color: theme.colors.bgSecondary,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text(
                            "${item.quantity.toInt()}x",
                            style: TextStyle(fontWeight: FontWeight.bold, color: theme.colors.brandPrimary),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(item.name, style: TextStyle(color: theme.colors.textPrimary, fontSize: 16)),
                              if (item.note != null && item.note!.isNotEmpty)
                                Text("Note: ${item.note}", style: TextStyle(color: theme.colors.stateError, fontSize: 12, fontStyle: FontStyle.italic)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )),
                ],
              ),
            ),
            
            // Footer Action Hint
            Container(
              padding: const EdgeInsets.all(8),
              color: theme.colors.bgSecondary,
              child: Center(child: Text("Tap to Complete", style: TextStyle(color: theme.colors.textMuted, fontSize: 10))),
            )
          ],
        ),
      ),
    );
  }
}
