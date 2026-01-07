import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:savvy_pos/core/config/theme/savvy_theme.dart';
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
  bool _isMatched = false;

  @override
  void initState() {
    super.initState();
    _actualCashController.addListener(_updateVariance);
  }

  void _updateVariance() {
    final actual = double.tryParse(_actualCashController.text) ?? 0.0;
    final diff = actual - widget.currentShift.expectedCash;
    
    setState(() {
      _variance = diff;
      _isMatched = diff.abs() < 0.01; // Within cent
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.savvy;
    // Determine status color
    final statusColor = _actualCashController.text.isEmpty 
        ? theme.colors.borderDefault 
        : (_isMatched ? theme.colors.stateSuccess : theme.colors.stateError);

    return AlertDialog(
      backgroundColor: theme.colors.bgElevated,
      title: Text('Reconcile & Close', style: TextStyle(color: theme.colors.textPrimary)),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _Row('Start Cash', widget.currentShift.startCash, theme),
          Divider(color: theme.colors.borderDefault),
          _Row('Expected Cash', widget.currentShift.expectedCash, theme, isBold: true),
          
          const SizedBox(height: 24),
          
          // INPUT with Glow
          TextField(
            controller: _actualCashController,
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            style: TextStyle(
              fontSize: 28, 
              fontWeight: FontWeight.bold, 
              color: statusColor
            ),
            decoration: InputDecoration(
              labelText: 'Actual Drawer Count',
              labelStyle: TextStyle(color: theme.colors.textSecondary),
              prefixText: '\$ ',
              prefixStyle: TextStyle(color: statusColor, fontSize: 28),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: statusColor, width: 2),
                borderRadius: BorderRadius.circular(theme.shapes.radiusMd),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: statusColor, width: 2), // Glow effect
                borderRadius: BorderRadius.circular(theme.shapes.radiusMd),
              ),
              suffixIcon: _isMatched 
                  ? Icon(Icons.check_circle, color: theme.colors.stateSuccess)
                  : (_actualCashController.text.isNotEmpty ? Icon(Icons.warning_amber, color: theme.colors.stateError) : null),
            ),
          ),
          
          const SizedBox(height: 16),
          
          if (_actualCashController.text.isNotEmpty)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Variance:', style: TextStyle(color: theme.colors.textSecondary)),
                Text(
                  (_variance > 0 ? '+' : '') + '\$${_variance.toStringAsFixed(2)}',
                  style: TextStyle(
                    color: statusColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text('Cancel', style: TextStyle(color: theme.colors.textSecondary)),
        ),
        ElevatedButton.icon(
          onPressed: () {
            final actual = double.tryParse(_actualCashController.text);
            if (actual != null) {
              // Might prompt for reason if variance is high?
              context.read<ShiftBloc>().add(ShiftEvent.closeShift(actual));
              Navigator.pop(context);
            }
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: _isMatched ? theme.colors.brandPrimary : theme.colors.bgSurface,
            foregroundColor: _isMatched ? theme.colors.textInverse : theme.colors.stateError,
            side: _isMatched ? null : BorderSide(color: theme.colors.stateError),
          ),
          icon: const Icon(Icons.lock_clock),
          label: const Text('Close Session'),
        ),
      ],
    );
  }

  Widget _Row(String label, double amount, SavvyTheme theme, {bool isBold = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: TextStyle(color: theme.colors.textSecondary, fontWeight: isBold ? FontWeight.bold : FontWeight.normal)),
          Text('\$${amount.toStringAsFixed(2)}', style: TextStyle(color: theme.colors.textPrimary, fontWeight: isBold ? FontWeight.bold : FontWeight.normal)),
        ],
      ),
    );
  }
}
