import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:savvy_pos/features/cash/domain/entities/cash_drawer_entities.dart';
import 'package:savvy_pos/features/shifts/presentation/bloc/shift_bloc.dart';

class ShiftReportPage extends StatefulWidget {
  final CashDrawerSummary summary;
  final CashDrawer drawer;

  const ShiftReportPage({
    super.key,
    required this.summary,
    required this.drawer,
  });

  @override
  State<ShiftReportPage> createState() => _ShiftReportPageState();
}

class _ShiftReportPageState extends State<ShiftReportPage> {
  int _currentStep = 0;
  final _actualCashController = TextEditingController();

  @override
  void dispose() {
    _actualCashController.dispose();
    super.dispose();
  }

  void _executeEod(BuildContext context) {
    final actual =
        double.tryParse(_actualCashController.text) ?? widget.summary.netCash;
    context.read<ShiftBloc>().add(ShiftEvent.closeShiftWithEod(actual));
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ShiftBloc, ShiftState>(
      listener: (context, state) {
        state.maybeWhen(
          syncingEod: () {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (_) => const AlertDialog(
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CircularProgressIndicator(),
                    SizedBox(height: 16),
                    Text('Menyinkronkan Buku Besar...'),
                  ],
                ),
              ),
            );
          },
          syncSuccess: () {
            HapticFeedback.mediumImpact();
            Navigator.of(context, rootNavigator: true).pop(); // close dialog
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                  content: Text('Ledger Synced to Jurnal successfully!',
                      style: TextStyle(color: Colors.white)),
                  backgroundColor: Colors.green),
            );
          },
          closed: () {
            // Already popped dialog. Now pop widget.
            if (Navigator.canPop(context)) {
              Navigator.pop(context);
            }
          },
          error: (msg) {
            Navigator.of(context, rootNavigator: true)
                .pop(); // close dialog if open
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(msg), backgroundColor: Colors.red));
          },
          orElse: () {},
        );
      },
      child: Scaffold(
        appBar: AppBar(title: const Text('End of Day (EOD) Wizard')),
        body: Stepper(
          currentStep: _currentStep,
          onStepContinue: () {
            if (_currentStep < 2) {
              setState(() => _currentStep++);
            } else {
              _executeEod(context);
            }
          },
          onStepCancel: () {
            if (_currentStep > 0) {
              setState(() => _currentStep--);
            } else {
              Navigator.pop(context);
            }
          },
          steps: [
            Step(
              title: const Text('Blind Cash Count'),
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                      'Enter the actual physical cash currently in the drawer. Do not look at expected totals yet.'),
                  const SizedBox(height: 16),
                  TextField(
                    controller: _actualCashController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'Actual Cash Amount',
                      border: OutlineInputBorder(),
                      prefixText: '\$ ',
                    ),
                  ),
                ],
              ),
              isActive: _currentStep >= 0,
            ),
            Step(
              title: const Text('Waste & Spoilage Audit'),
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text('Review recorded waste for today before closing.'),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 16),
                    padding: const EdgeInsets.all(16),
                    color: Colors.orange.shade50,
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Unrecorded Spoilage?'),
                        Icon(Icons.warning, color: Colors.orange),
                      ],
                    ),
                  )
                ],
              ),
              isActive: _currentStep >= 1,
            ),
            Step(
              title: const Text('Z-Report & Ledger Sync'),
              content: _ZReportSummary(
                  summary: widget.summary, drawer: widget.drawer),
              isActive: _currentStep >= 2,
            ),
          ],
        ),
      ),
    );
  }
}

class _ZReportSummary extends StatelessWidget {
  final CashDrawerSummary summary;
  final CashDrawer drawer;
  const _ZReportSummary({required this.summary, required this.drawer});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Center(
              child: Text('Z-REPORT AGGREGATION',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
          const Divider(),
          _Row('Cash Sales', '\$${summary.totalSales.toStringAsFixed(2)}'),
          _Row('Pay In', '\$${summary.totalCashIn.toStringAsFixed(2)}'),
          _Row('Pay Out', '\$${summary.totalCashOut.toStringAsFixed(2)}'),
          _Row('Safe Drops', '\$${summary.totalDrops.toStringAsFixed(2)}'),
          const Divider(),
          _Row('Expected Cash', '\$${summary.netCash.toStringAsFixed(2)}',
              isBold: true),
        ],
      ),
    );
  }
}

class _Row extends StatelessWidget {
  final String label;
  final String value;
  final bool isBold;

  const _Row(this.label, this.value, {this.isBold = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label,
              style: TextStyle(
                  fontWeight: isBold ? FontWeight.bold : FontWeight.normal)),
          Text(value,
              style: TextStyle(
                  fontWeight: isBold ? FontWeight.bold : FontWeight.normal)),
        ],
      ),
    );
  }
}
