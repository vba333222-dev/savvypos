import 'package:flutter/material.dart';
import 'package:savvy_pos/features/cash/domain/entities/cash_drawer_entities.dart';

class ShiftReportPage extends StatelessWidget {
  final CashDrawerSummary summary;
  final CashDrawer drawer;

  const ShiftReportPage({
    super.key,
    required this.summary,
    required this.drawer,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('End of Shift Report (Z-Report)')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Center(
          child: Container(
            width: 400,
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.grey.shade300),
              boxShadow: [BoxShadow(blurRadius: 10, color: Colors.black.withValues(alpha: 0.05))]
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Center(child: Icon(Icons.receipt_long, size: 48)),
                const SizedBox(height: 16),
                const Center(child: Text('Z-REPORT', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold))),
                const Divider(),
                _Row('Shift ID', drawer.shiftUuid),
                _Row('Opened', drawer.openedAt.toString().substring(0, 16)),
                _Row('Closed', drawer.closedAt?.toString().substring(0, 16) ?? 'Active'),
                const Divider(),
                
                const Text('CASH FLOW', style: TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                _Row('Starting Cash', _fmt(drawer.startingBalance)),
                _Row('Cash Sales', _fmt(summary.totalSales)),
                _Row('Cash Refunds', _fmt(summary.totalRefunds)),
                _Row('Pay In', _fmt(summary.totalCashIn)),
                _Row('Pay Out', _fmt(summary.totalCashOut)),
                _Row('Safe Drops', _fmt(summary.totalDrops)),
                const Divider(),
                
                _Row('Expected Cash', _fmt(summary.netCash), isBold: true),
                _Row('Actual Count', _fmt(drawer.closingBalance ?? 0), isBold: true),
                const Divider(),
                _Row('VARIANCE', _fmt(drawer.variance ?? 0), isBold: true, color: (drawer.variance ?? 0) != 0 ? Colors.red : Colors.green),
                
                const SizedBox(height: 32),
                ElevatedButton.icon(
                  icon: const Icon(Icons.print),
                  label: const Text('PRINT REPORT'),
                  onPressed: () {
                    // Logic to print via PrinterService
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Printing Z-Report...')));
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  String _fmt(double val) {
    return '\$${val.toStringAsFixed(2)}';
  }
}

class _Row extends StatelessWidget {
  final String label;
  final String value;
  final bool isBold;
  final Color? color;

  const _Row(this.label, this.value, {this.isBold = false, this.color});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: TextStyle(fontWeight: isBold ? FontWeight.bold : FontWeight.normal, color: color)),
          Text(value, style: TextStyle(fontWeight: isBold ? FontWeight.bold : FontWeight.normal, color: color)),
        ],
      ),
    );
  }
}
