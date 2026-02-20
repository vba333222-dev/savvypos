import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:savvy_pos/core/config/theme_config.dart';
import 'package:savvy_pos/features/shifts/presentation/bloc/shift_bloc.dart';

class CashManagementDialog extends StatefulWidget {
  final String type; // 'PAY_IN' or 'PAY_OUT'

  const CashManagementDialog({super.key, required this.type});

  @override
  State<CashManagementDialog> createState() => _CashManagementDialogState();
}

class _CashManagementDialogState extends State<CashManagementDialog> {
  final _amountCtrl = TextEditingController();
  final _reasonCtrl = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final colors = context.savvy.colors;
    final isPayIn = widget.type == 'PAY_IN';
    final isSafeDrop = widget.type == 'SAFE_DROP';
    // final title = comes from complex logic below
    final color = isPayIn ? colors.stateSuccess : (isSafeDrop ? Colors.orange : colors.stateError);
    final title = isPayIn 
        ? 'Pay In (Add Cash)' 
        : (isSafeDrop ? 'Safe Drop (To Safe)' : 'Pay Out (Expense)');

    return AlertDialog(
      title: Text(title, style: TextStyle(color: color)),
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: _amountCtrl,
              decoration: const InputDecoration(
                labelText: 'Amount',
                prefixText: '\$',
                border: OutlineInputBorder(),
              ),
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}'))],
              validator: (v) {
                if (v == null || v.isEmpty) return 'Required';
                 if (double.tryParse(v) == null) return 'Invalid';
                return null;
              },
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _reasonCtrl,
              decoration: InputDecoration(
                labelText: 'Reason / Reference',
                hintText: isSafeDrop ? 'e.g., Mid-day Drop #1' : (isPayIn ? 'e.g., Petty Cash Top-up' : 'e.g., Buy Ice'),
                border: const OutlineInputBorder(),
              ),
              validator: (v) => v?.isEmpty == true ? 'Required' : null,
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: color, foregroundColor: Colors.white),
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              final amount = double.parse(_amountCtrl.text);
              final reason = _reasonCtrl.text;
              
              if (isPayIn) {
                context.read<ShiftBloc>().add(ShiftEvent.payIn(amount, reason));
              } else if (isSafeDrop) {
                context.read<ShiftBloc>().add(ShiftEvent.safeDrop(amount, reason));
              } else {
                context.read<ShiftBloc>().add(ShiftEvent.payOut(amount, reason));
              }
              Navigator.pop(context);
            }
          },
          child: const Text('Confirm'),
        ),
      ],
    );
  }
}
