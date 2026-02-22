import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get_it/get_it.dart';
import 'package:savvy_pos/core/config/theme/savvy_theme.dart';
import 'package:savvy_pos/core/presentation/widgets/savvy_widgets.dart';
import 'package:savvy_pos/features/inventory/domain/usecases/receive_goods.dart';

class GoodsReceiptDialog extends StatefulWidget {
  final String purchaseOrderUuid; // In real app pass full PO Entity
  final String warehouseUuid;

  const GoodsReceiptDialog({
    super.key,
    required this.purchaseOrderUuid,
    required this.warehouseUuid,
  });

  @override
  State<GoodsReceiptDialog> createState() => _GoodsReceiptDialogState();
}

class _GoodsReceiptDialogState extends State<GoodsReceiptDialog> {
  // Mocking PO Items for UI - In real app, fetch from Repo using widget.purchaseOrderUuid
  final List<Map<String, dynamic>> _items = [
    {
      'productUuid': 'prod-001',
      'name': 'Espresso Beans',
      'ordered': 100.0,
      'received': 50.0
    },
    {
      'productUuid': 'prod-002',
      'name': 'Milk (1L)',
      'ordered': 20.0,
      'received': 20.0
    },
    {
      'productUuid': 'prod-003',
      'name': 'Vanilla Syrup',
      'ordered': 5.0,
      'received': 0.0
    },
  ];

  final Map<String, double> _receivingNow = {};
  bool _isSubmitting = false;
  bool _isSuccess = false;

  @override
  void initState() {
    super.initState();
    // Initialize receiving with 0 or remaining
    for (var item in _items) {
      _receivingNow[item['productUuid'] as String] = 0.0;
    }
  }

  Future<void> _submitReceipt() async {
    setState(() => _isSubmitting = true);

    // Simulate API/DB Latency
    await Future.delayed(500.ms);

    try {
      // Construct Payload
      final List<Map<String, dynamic>> payload = [];
      _receivingNow.forEach((productId, qty) {
        if (qty > 0) {
          payload.add({
            'productUuid': productId,
            'quantityReceived': qty,
          });
        }
      });

      if (payload.isEmpty) {
        throw Exception("No items received.");
      }

      // Execute UseCase (Directly GetIt for simplicity, ideally via Bloc)
      final receiveGoods = GetIt.I<ReceiveGoods>();
      // Build quantities map from payload
      final quantities = <String, double>{};
      for (final p in payload) {
        quantities[p['productUuid'] as String] =
            (p['quantityReceived'] as num).toDouble();
      }
      await receiveGoods(widget.purchaseOrderUuid, quantities);

      if (mounted) {
        setState(() {
          _isSubmitting = false;
          _isSuccess = true;
        });

        // Auto Close after animation
        Future.delayed(1.5.seconds, () {
          if (mounted) Navigator.pop(context, true);
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() => _isSubmitting = false);
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Error: $e')));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isSuccess) {
      return Dialog(
        backgroundColor: Colors.transparent,
        elevation: 0,
        child: _SuccessView(),
      );
    }

    return Dialog(
      backgroundColor: context.savvy.colors.bgSurface,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Container(
        width: 600,
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SavvyText.h3('Receive Goods'),
                IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () => Navigator.pop(context)),
              ],
            ),
            const SizedBox(height: 8),
            SavvyText.body(
                'PO #${widget.purchaseOrderUuid.substring(0, 8).toUpperCase()}',
                color: context.savvy.colors.textSecondary),

            const SizedBox(height: 24),

            // Header
            Row(
              children: [
                Expanded(flex: 3, child: SavvyText.label('ITEM')),
                Expanded(flex: 1, child: SavvyText.label('ORDERED')),
                Expanded(flex: 1, child: SavvyText.label('RECEIVED')),
                Expanded(flex: 2, child: SavvyText.label('RECEIVING NOW')),
              ],
            ),
            const Divider(),

            // List
            Flexible(
              child: ListView.separated(
                shrinkWrap: true,
                itemCount: _items.length,
                separatorBuilder: (c, i) => const Divider(height: 1),
                itemBuilder: (context, index) {
                  final item = _items[index];
                  final pid = item['productUuid'] as String;
                  final ordered = item['ordered'] as double;
                  final prevReceived = item['received'] as double;
                  final remaining = ordered - prevReceived;

                  // Simple Stepper UI
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: Row(
                      children: [
                        Expanded(flex: 3, child: SavvyText.body(item['name'])),
                        Expanded(
                            flex: 1,
                            child: SavvyText.body(ordered.toStringAsFixed(0))),
                        Expanded(
                            flex: 1,
                            child: SavvyText.body(
                                prevReceived.toStringAsFixed(0),
                                color: context.savvy.colors.textSecondary)),
                        Expanded(
                          flex: 2,
                          child: Row(
                            children: [
                              IconButton(
                                icon: const Icon(Icons.remove_circle_outline,
                                    size: 20),
                                onPressed: () {
                                  final current = _receivingNow[pid] ?? 0;
                                  if (current > 0) {
                                    setState(
                                        () => _receivingNow[pid] = current - 1);
                                  }
                                },
                              ),
                              SizedBox(
                                width: 40,
                                child: Center(
                                    child: SavvyText.h4(
                                        (_receivingNow[pid] ?? 0)
                                            .toStringAsFixed(0))),
                              ),
                              IconButton(
                                icon: const Icon(Icons.add_circle_outline,
                                    size: 20),
                                onPressed: () {
                                  final current = _receivingNow[pid] ?? 0;
                                  if (current < remaining) {
                                    // Cap at remaining? Optional.
                                    setState(
                                        () => _receivingNow[pid] = current + 1);
                                  }
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 24),

            // Footer
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SavvyButton(
                  text: 'CANCEL',
                  style: SavvyButtonStyle.ghost,
                  onPressed: () => Navigator.pop(context),
                ),
                const SizedBox(width: 16),
                SavvyButton(
                  text: _isSubmitting ? 'PROCESSING...' : 'CONFIRM RECEIPT',
                  style: SavvyButtonStyle.primary,
                  onPressed: _isSubmitting ? null : _submitReceipt,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class _SuccessView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: context.savvy.colors.bgSurface,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
                color: Colors.green.withValues(alpha: 0.1),
                shape: BoxShape.circle),
            child: const Icon(Icons.check, color: Colors.green, size: 48),
          ).animate(onPlay: (c) => c.repeat(reverse: true)).scale(
              begin: const Offset(1, 1),
              end: const Offset(1.1, 1.1),
              duration: 1.seconds),
          const SizedBox(height: 24),
          const SavvyText.h3('Stock Updated!'),
          const SizedBox(height: 8),
          SavvyText.body('Inventory levels have been adjusted.',
              color: context.savvy.colors.textSecondary),
        ],
      )
          .animate()
          .fadeIn()
          .slideY(begin: 0.2, end: 0, curve: Curves.easeOutBack),
    );
  }
}
