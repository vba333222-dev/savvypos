import 'package:savvy_pos/core/utils/time_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:savvy_pos/core/config/theme_config.dart';
import 'package:savvy_pos/features/history/presentation/bloc/history_bloc.dart';
import 'package:savvy_pos/features/history/presentation/widgets/transaction_detail_dialog.dart';

class TransactionHistoryPage extends StatelessWidget {
  const TransactionHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Provide the Bloc here
    return BlocProvider(
      create: (_) =>
          GetIt.I<HistoryBloc>()..add(const HistoryEvent.loadHistory()),
      child: const _HistoryView(),
    );
  }
}

class _HistoryView extends StatefulWidget {
  const _HistoryView();

  @override
  State<_HistoryView> createState() => _HistoryViewState();
}

class _HistoryViewState extends State<_HistoryView> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200) {
      context.read<HistoryBloc>().add(const HistoryEvent.fetchMoreTransactions());
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.savvy.colors;
    final typography = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Transaction History'),
        backgroundColor: colors.bgPrimary,
        actions: [
          IconButton(
            icon: const Icon(Icons.download),
            onPressed: () async {
              final range = await showDateRangePicker(
                context: context,
                firstDate: DateTime(2020),
                lastDate: TimeHelper.now(),
              );
              if (range != null && context.mounted) {
                context.read<HistoryBloc>().add(
                    HistoryEvent.exportHistoryToCsv(range.start, range.end));
              }
            },
          ),
        ],
      ),
      body: BlocBuilder<HistoryBloc, HistoryState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state.orders.isEmpty) {
            return Center(
                child:
                    Text('No transactions found', style: typography.bodyLarge));
          }

          return ListView.separated(
            controller: _scrollController,
            padding: EdgeInsets.all(context.savvy.shapes.spacingMd),
            itemCount: state.orders.length + (state.isLoadingMore ? 1 : 0),
            separatorBuilder: (_, __) => Divider(color: colors.borderDefault),
            itemBuilder: (context, index) {
              if (index == state.orders.length) {
                return const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Center(
                    child: SizedBox(
                       width: 24, height: 24, 
                       child: CircularProgressIndicator(strokeWidth: 2)
                    )
                  ),
                );
              }
              
              final order = state.orders[index];
              return ListTile(
                leading: CircleAvatar(
                  backgroundColor: colors.bgElevated,
                  child: Icon(Icons.receipt_long, color: colors.brandPrimary),
                ),
                title: Text('Order #${order.orderNumber}',
                    style: typography.titleMedium),
                subtitle: Text(
                    DateFormat('MMM dd, HH:mm').format(order.transactionDate)),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      '\$${order.grandTotal.toStringAsFixed(2)}',
                      style: typography.titleMedium
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(width: 8),
                    Icon(
                      order.isSynced ? Icons.cloud_done : Icons.cloud_off,
                      color: order.isSynced
                          ? colors.stateSuccess
                          : colors.textMuted,
                      size: 16,
                    ),
                  ],
                ),
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (_) => BlocProvider.value(
                      value: context.read<HistoryBloc>(), // Pass existing bloc
                      child: TransactionDetailDialog(order: order),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
