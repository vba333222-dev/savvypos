import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:savvy_pos/core/database/database.dart';
import 'package:savvy_pos/features/history/presentation/bloc/history_bloc.dart';

class TransactionDetailDialog extends StatelessWidget {
  final OrderTableData order;

  const TransactionDetailDialog({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    context.read<HistoryBloc>().add(HistoryEvent.loadOrderItems(order.uuid));

    final typography = Theme.of(context).textTheme;
    final dateFormat = DateFormat('MMM dd, yyyy HH:mm');

    return AlertDialog(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Order #${order.orderNumber}', style: typography.titleMedium),
          Text(dateFormat.format(order.transactionDate), style: typography.bodySmall),
        ],
      ),
      content: SizedBox(
        width: double.maxFinite,
        child: BlocBuilder<HistoryBloc, HistoryState>(
          builder: (context, state) {
            final items = state.orderItems[order.uuid];

            if (items == null) {
              return const Center(child: CircularProgressIndicator());
            }

            return ListView.builder(
              shrinkWrap: true,
              itemCount: items.length,
              itemBuilder: (context, index) {
                final item = items[index];
                return ListTile(
                  title: Text(item.name),
                  trailing: Text('${item.quantity} x \$${item.price.toStringAsFixed(2)}'),
                  subtitle: Text('Total: \$${item.total.toStringAsFixed(2)}'),
                );
              },
            );
          },
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Close'),
        ),
        ElevatedButton(
          onPressed: () {
            // Re-print logic stub
            // GetIt.I<IPrinterService>().printReceipt(order);
          },
          child: const Text('Reprint Receipt'),
        ),
      ],
    );
  }
}
