import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:savvy_pos/core/config/theme/savvy_theme.dart';
import 'package:savvy_pos/core/presentation/widgets/savvy_text.dart';
import 'package:savvy_pos/features/pos/presentation/widgets/scanner_listener_widget.dart';

class GoodsReceiptPage extends StatefulWidget {
  final String purchaseOrderUuid;

  const GoodsReceiptPage({super.key, required this.purchaseOrderUuid});

  @override
  State<GoodsReceiptPage> createState() => _GoodsReceiptPageState();
}

class _GoodsReceiptPageState extends State<GoodsReceiptPage> {
  // Mock State
  final List<POItemUIModel> items = [
    POItemUIModel(uuid: 'prod-001', name: 'Espresso Beans', sku: '001', ordered: 100, received: 0),
    POItemUIModel(uuid: 'prod-002', name: 'Almond Milk', sku: '002', ordered: 50, received: 0),
    POItemUIModel(uuid: 'prod-003', name: 'Paper Cups', sku: '003', ordered: 500, received: 100),
  ];

  String? _lastScannedSku;

  void _onScan(String code) {
    setState(() {
      _lastScannedSku = code;
      // Find item
      final index = items.indexWhere((i) => i.sku == code);
      if (index != -1) {
        final item = items[index];
        if (item.received < item.ordered) {
          items[index] = item.copyWith(received: item.received + 1);
          HapticFeedback.mediumImpact();
          // Play sound here
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Item $code not found in PO'), backgroundColor: Colors.orange)
        );
      }
    });

    // Clear highlight after delay
    Future.delayed(1.seconds, () {
      if (mounted) setState(() => _lastScannedSku = null);
    });
  }

  @override
  Widget build(BuildContext context) {
    // Progress
    final totalOrdered = items.fold(0, (sum, i) => sum + i.ordered);
    final totalReceived = items.fold(0, (sum, i) => sum + i.received);
    final progress = totalOrdered > 0 ? totalReceived / totalOrdered : 0.0;
    final isComplete = progress >= 1.0;

    return ScannerListenerWidget(
      onScanned: _onScan,
      child: Scaffold(
        backgroundColor: context.savvy.colors.bgCanvas,
        appBar: AppBar(
          title: const SavvyText.h3('Receive Goods (Scan)'),
          backgroundColor: context.savvy.colors.bgSurface,
          elevation: 0,
          actions: [
             if (isComplete)
               TextButton.icon(
                 icon: const Icon(Icons.check_circle, color: Colors.green),
                 label: const Text('FINISH', style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold)),
                 onPressed: () {
                   // Complete Usecase
                   Navigator.pop(context);
                 },
               )
          ],
        ),
        body: Column(
          children: [
            // Header Progress
            Container(
              color: context.savvy.colors.bgSurface,
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SavvyText.label('PROGRESS'),
                      SavvyText.h4('${(progress * 100).toInt()}%', color: isComplete ? Colors.green : context.savvy.colors.primary),
                    ],
                  ),
                  const SizedBox(height: 12),
                  LinearProgressIndicator(
                    value: progress, 
                    backgroundColor: context.savvy.colors.border,
                    color: isComplete ? Colors.green : context.savvy.colors.primary,
                    minHeight: 12,
                    borderRadius: BorderRadius.circular(6),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 1), // Divider gap

            // List
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: items.length,
                itemBuilder: (context, index) {
                  final item = items[index];
                  final isJustScanned = item.sku == _lastScannedSku;
                  final isDone = item.received >= item.ordered;

                  return AnimatedContainer(
                    duration: 300.ms,
                    margin: const EdgeInsets.only(bottom: 12),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: isJustScanned ? Colors.green.withValues(alpha: 0.2) : context.savvy.colors.bgSurface,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: isDone ? Colors.green : (isJustScanned ? Colors.green : Colors.transparent),
                        width: isDone || isJustScanned ? 2 : 0
                      )
                    ),
                    child: Row(
                      children: [
                        // Status Icon
                        if (isDone)
                          const Icon(Icons.check_circle, color: Colors.green, size: 32)
                        else
                          Container(
                            width: 32, height: 32,
                            decoration: BoxDecoration(
                              color: context.savvy.colors.bgCanvas,
                              shape: BoxShape.circle,
                              border: Border.all(color: context.savvy.colors.border)
                            ),
                            child: Center(child: SavvyText.label(item.sku)),
                          ),
                        const SizedBox(width: 16),

                        // Details
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SavvyText.h4(item.name),
                              SavvyText.body('SKU: ${item.sku}', color: context.savvy.colors.textSecondary),
                            ],
                          )
                        ),

                        // Qty
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            SavvyText.h3('${item.received}/${item.ordered}'),
                            const SavvyText.label('PCS'),
                          ],
                        )
                      ],
                    ),
                  ).animate(target: isJustScanned ? 1 : 0).shake();
                },
              ),
            ),
            
            // Manual Footer
            Container(
              padding: const EdgeInsets.all(16),
              color: context.savvy.colors.bgSurface,
              child: Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                    const Icon(Icons.qr_code_scanner, size: 20),
                    const SizedBox(width: 8),
                    SavvyText.body('Ready to scan...', color: context.savvy.colors.textSecondary)
                 ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class POItemUIModel {
  final String uuid;
  final String name;
  final String sku;
  final int ordered;
  final int received;

  POItemUIModel({required this.uuid, required this.name, required this.sku, required this.ordered, required this.received});

  POItemUIModel copyWith({int? received}) {
    return POItemUIModel(
      uuid: uuid,
      name: name,
      sku: sku,
      ordered: ordered,
      received: received ?? this.received,
    );
  }
}
