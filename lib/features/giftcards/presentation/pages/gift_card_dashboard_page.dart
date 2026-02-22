import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:savvy_pos/core/di/injection.dart';
import 'package:savvy_pos/features/giftcards/presentation/bloc/gift_card_bloc.dart';
import 'package:intl/intl.dart';

class GiftCardDashboardPage extends StatelessWidget {
  const GiftCardDashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<GiftCardBloc>()..add(const GiftCardEvent.started()),
      child: Scaffold(
        appBar: AppBar(title: const Text('Gift Cards')),
        floatingActionButton: Builder(
          builder: (ctx) => FloatingActionButton.extended(
            onPressed: () => _showIssueDialog(ctx),
            icon: const Icon(Icons.add_card),
            label: const Text('Issue Card'),
          ),
        ),
        body: BlocBuilder<GiftCardBloc, GiftCardState>(
          builder: (context, state) {
            return state.when(
              initial: () => const SizedBox(),
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (msg) => Center(child: Text('Error: $msg')),
              loaded: (cards, summary) {
                return Column(
                  children: [
                    // Summary Header
                    Container(
                      padding: const EdgeInsets.all(16),
                      color: Colors.blue.shade50,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          _StatItem(
                              label: 'Total Active Cards',
                              value: '${summary.activeCards}'),
                          _StatItem(
                              label: 'Liability',
                              value:
                                  '\$${summary.outstandingLiability.toStringAsFixed(2)}'),
                          _StatItem(
                              label: 'Redeemed',
                              value:
                                  '\$${summary.totalRedemptions.toStringAsFixed(2)}'),
                        ],
                      ),
                    ),
                    const Divider(height: 1),
                    Expanded(
                      child: ListView.separated(
                        itemCount: cards.length,
                        separatorBuilder: (_, __) => const Divider(height: 1),
                        itemBuilder: (context, index) {
                          final card = cards[index];
                          return ListTile(
                            leading: Icon(Icons.card_giftcard,
                                color:
                                    card.isUsable ? Colors.green : Colors.grey),
                            title: Text(card.cardNumber,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold)),
                            subtitle: Text(
                                'Bal: \$${card.currentBalance.toStringAsFixed(2)} • ${card.status.displayName}'),
                            trailing: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(card.customerName ?? 'Anonymous',
                                    style: const TextStyle(fontSize: 12)),
                                Text(
                                    DateFormat.yMMMd().format(
                                        card.createdAt ?? DateTime.now()),
                                    style: const TextStyle(
                                        fontSize: 10, color: Colors.grey)),
                              ],
                            ),
                            onTap: () {
                              // Details Dialog (Todo)
                            },
                          );
                        },
                      ),
                    ),
                  ],
                );
              },
            );
          },
        ),
      ),
    );
  }

  void _showIssueDialog(BuildContext context) {
    final cardNoCtrl = TextEditingController(); // Auto-generate usually
    final amountCtrl = TextEditingController();
    final nameCtrl = TextEditingController();

    // Pre-fill mock
    cardNoCtrl.text =
        "GC-${DateTime.now().millisecondsSinceEpoch.toString().substring(8)}";

    showDialog(
        context: context,
        builder: (_) => AlertDialog(
              title: const Text("Issue Gift Card"),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                      controller: cardNoCtrl,
                      decoration:
                          const InputDecoration(labelText: "Card Number")),
                  TextField(
                      controller: amountCtrl,
                      decoration: const InputDecoration(labelText: "Amount"),
                      keyboardType: TextInputType.number),
                  TextField(
                      controller: nameCtrl,
                      decoration: const InputDecoration(
                          labelText: "Customer Name (Opt)")),
                ],
              ),
              actions: [
                TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text("Cancel")),
                ElevatedButton(
                    onPressed: () {
                      final amt = double.tryParse(amountCtrl.text);
                      if (amt == null) return;

                      context.read<GiftCardBloc>().add(GiftCardEvent.issueCard(
                            cardNumber: cardNoCtrl.text,
                            amount: amt,
                            customerName:
                                nameCtrl.text.isEmpty ? null : nameCtrl.text,
                          ));
                      Navigator.pop(context);
                    },
                    child: const Text("Issue")),
              ],
            ));
  }
}

class _StatItem extends StatelessWidget {
  final String label;
  final String value;
  const _StatItem({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(value,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        Text(label, style: const TextStyle(fontSize: 12, color: Colors.grey)),
      ],
    );
  }
}
