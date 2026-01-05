import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:savvy_pos/core/database/database.dart';
import 'package:savvy_pos/core/config/theme_config.dart';
import 'package:savvy_pos/features/history/domain/repositories/i_order_repository.dart';
import 'package:savvy_pos/features/kitchen/presentation/bloc/kitchen_bloc.dart';
import 'package:intl/intl.dart';

class KitchenOrderCard extends StatefulWidget {
  final OrderTableData order;

  const KitchenOrderCard({Key? key, required this.order}) : super(key: key);

  @override
  State<KitchenOrderCard> createState() => _KitchenOrderCardState();
}

class _KitchenOrderCardState extends State<KitchenOrderCard> {
  List<OrderItemTableData> _items = [];
  bool _isLoading = true;
  late Timer _timer;
  Duration _elapsed = Duration.zero;

  @override
  void initState() {
    super.initState();
    _fetchItems();
    _startTimer();
  }

  void _fetchItems() async {
    try {
      final items = await GetIt.I<IOrderRepository>().getOrderItems(widget.order.uuid);
      if (mounted) {
        setState(() {
          _items = items;
          _isLoading = false;
        });
      }
    } catch (e) {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  void _startTimer() {
    _updateElapsed();
    _timer = Timer.periodic(const Duration(seconds: 30), (_) => _updateElapsed());
  }

  void _updateElapsed() {
    final diff = DateTime.now().difference(widget.order.createdAt);
    if (mounted) setState(() => _elapsed = diff);
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.savvy.colors;
    final typography = context.savvy.typography;
    
    // Alert color if waiting > 15 mins
    final isLate = _elapsed.inMinutes >= 15;
    final headerColor = isLate ? colors.stateError : colors.brandPrimary;
    
    return Container(
      width: 280,
      margin: const EdgeInsets.only(right: 16, bottom: 8, top: 8),
      decoration: BoxDecoration(
        color: colors.bgElevated,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: headerColor, width: 2),
        boxShadow: [
           BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 4, offset: const Offset(0, 2))
        ]
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Header
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: headerColor,
              borderRadius: const BorderRadius.vertical(top: Radius.circular(9)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.order.orderNumber.length > 8 ? widget.order.orderNumber.substring(widget.order.orderNumber.length - 8) : widget.order.orderNumber,
                      style: typography.h5.copyWith(color: colors.textInverse),
                    ),
                    Text(
                      '${_elapsed.inMinutes}m',
                      style: typography.h5.copyWith(color: colors.textInverse, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                // Table Name? Not in OrderTableData directly, implicitly in restaurantTable join or just name if set.
                // Assuming customerName or similar.
                if (widget.order.customerUuid != null)
                   Text('Cust: TODO', style: typography.bodySm.copyWith(color: colors.textInverse)),
              ],
            ),
          ),
          
          // Items
          Expanded(
            child: _isLoading 
              ? const Center(child: CircularProgressIndicator())
              : ListView.separated(
                  padding: const EdgeInsets.all(12),
                  itemCount: _items.length,
                  separatorBuilder: (_, __) => const Divider(),
                  itemBuilder: (context, index) {
                    final item = _items[index];
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                              decoration: BoxDecoration(
                                color: colors.bgPrimary,
                                borderRadius: BorderRadius.circular(4),
                                border: Border.all(color: colors.borderDefault),
                              ),
                              child: Text('${item.quantity.toInt()}x', style: typography.h6.copyWith(fontWeight: FontWeight.bold)),
                            ),
                            const SizedBox(width: 8),
                            Expanded(child: Text(item.name, style: typography.h6)),
                          ],
                        ),
                        if (item.note != null && item.note!.isNotEmpty)
                          Padding(
                            padding: const EdgeInsets.only(left: 32, top: 4),
                            child: Text(
                              'NOTE: ${item.note}', 
                              style: typography.bodySm.copyWith(color: colors.stateError, fontStyle: FontStyle.italic),
                            ),
                          ),
                      ],
                    );
                  },
                ),
          ),
          
          // Footer
          Padding(
            padding: const EdgeInsets.all(12),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: colors.stateSuccess,
                foregroundColor: colors.textInverse,
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              onPressed: () {
                 context.read<KitchenBloc>().add(KitchenEvent.markFulfilled(widget.order.uuid));
              },
              child: const Text('READY / DONE'),
            ),
          ),
        ],
      ),
    );
  }
}
