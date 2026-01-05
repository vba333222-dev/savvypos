import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:savvy_pos/core/config/theme_config.dart';
import 'package:savvy_pos/core/database/database.dart';
import 'package:savvy_pos/features/shift/presentation/bloc/shift_bloc.dart';

class CloseShiftDialog extends StatefulWidget {
  final ShiftSessionTableData currentShift;

  const CloseShiftDialog({Key? key, required this.currentShift}) : super(key: key);

  @override
  State<CloseShiftDialog> createState() => _CloseShiftDialogState();
}

class _CloseShiftDialogState extends State<CloseShiftDialog> {
  final TextEditingController _actualCashController = TextEditingController();
  double _variance = 0.0;

  @override
  void initState() {
    super.initState();
    _actualCashController.addListener(_updateVariance);
  }

  void _updateVariance() {
    final actual = double.tryParse(_actualCashController.text) ?? 0.0;
    setState(() {
      _variance = actual - widget.currentShift.expectedCash;
    });
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.savvy.colors;
    final typography = Theme.of(context).textTheme;

    return AlertDialog(
      title: const Text('Close Shift'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _Row('Start Cash', widget.currentShift.startCash),
          // In real app, we would show Sales here too.
          Divider(color: colors.borderDefault),
          _Row('Expected Cash', widget.currentShift.expectedCash, isBold: true),
          const SizedBox(height: 16),
          TextField(
            controller: _actualCashController,
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            decoration: const InputDecoration(
              labelText: 'Actual Cash in Drawer',
              prefixText: '\$ ',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Variance:', style: typography.titleMedium),
              Text(
                '\$${_variance.toStringAsFixed(2)}',
                style: typography.titleMedium?.copyWith(
                  color: _variance < 0 ? colors.stateError : colors.stateSuccess,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () {
            final actual = double.tryParse(_actualCashController.text);
            if (actual != null) {
              context.read<ShiftBloc>().add(ShiftEvent.closeShift(actual));
              Navigator.pop(context); // Close dialog
            }
          },
          style: ElevatedButton.styleFrom(backgroundColor: colors.stateError),
          child: const Text('Close Shift', style: TextStyle(color: Colors.white)),
        ),
      ],
    );
  }

  Widget _Row(String label, double amount, {bool isBold = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: TextStyle(fontWeight: isBold ? FontWeight.bold : FontWeight.normal)),
          Text('\$${amount.toStringAsFixed(2)}', style: TextStyle(fontWeight: isBold ? FontWeight.bold : FontWeight.normal)),
        ],
      ),
    );
  }
}
