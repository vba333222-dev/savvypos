import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:savvy_pos/core/config/theme/savvy_theme.dart';
import 'package:savvy_pos/features/shifts/domain/entities/shift_entities.dart';
import 'package:savvy_pos/features/shifts/presentation/bloc/shift_bloc.dart';

class CloseShiftDialog extends StatefulWidget {
  final ShiftSession currentShift;
  final double totalPayIn;
  final double totalPayOut;
  final double totalSafeDrops;
  final double totalSales; // Cash sales only ideally, but using total for now

  const CloseShiftDialog({
    super.key, 
    required this.currentShift,
    required this.totalPayIn,
    required this.totalPayOut,
    required this.totalSafeDrops,
    required this.totalSales,
  });

  @override
  State<CloseShiftDialog> createState() => _CloseShiftDialogState();
}

class _CloseShiftDialogState extends State<CloseShiftDialog> {
  final TextEditingController _actualCashController = TextEditingController();
  double _variance = 0.0;
  bool _isMatched = false;
  double _expectedCash = 0.0;

  @override
  void initState() {
    super.initState();
    _calculateExpected();
    _actualCashController.addListener(_updateVariance);
  }

  void _calculateExpected() {
    _expectedCash = widget.currentShift.startCash 
        + widget.totalPayIn 
        - widget.totalPayOut 
        - widget.totalSafeDrops
        + widget.totalSales;
  }

  void _updateVariance() {
    final actual = double.tryParse(_actualCashController.text) ?? 0.0;
    final diff = actual - _expectedCash;
    
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
      title: Text('Reconcile & Close Shift', style: TextStyle(color: theme.colors.textPrimary)),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _sectionHeader('Breakdown', theme),
            _breakdownRow('Start Cash', widget.currentShift.startCash, theme),
            _breakdownRow('Cash Sales', widget.totalSales, theme, color: theme.colors.stateSuccess),
            _breakdownRow('Pay Ins', widget.totalPayIn, theme, color: theme.colors.stateSuccess),
            _breakdownRow('Pay Outs', widget.totalPayOut, theme, color: theme.colors.stateError),
            _breakdownRow('Safe Drops', widget.totalSafeDrops, theme, color: Colors.orange),
            Divider(color: theme.colors.borderDefault),
            _breakdownRow('Expected in Drawer', _expectedCash, theme, isBold: true, size: 18),
            
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
                  Text('Variance (Over/Short):', style: TextStyle(color: theme.colors.textSecondary)),
                  Text(
                    '${_variance > 0 ? '+' : ''}\$${_variance.toStringAsFixed(2)}',
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
              // ── Fire shift-close event ──────────────────────────────
              context.read<ShiftBloc>().add(ShiftEvent.closeShift(actual));

              // ── Auto-clean image cache on shift end ─────────────────
              // Frees decoded image RAM (~50-200MB on heavy product menus)
              // before the next cashier's login/PIN screen renders.
              // This runs synchronously on the UI thread — it's a HashMap
              // clear, takes <1ms and does NOT stall the UI.
              PaintingBinding.instance.imageCache.clear();
              PaintingBinding.instance.imageCache.clearLiveImages();
              debugPrint('[Cache] Image cache flushed on shift close. RAM freed.');

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

  Widget _sectionHeader(String title, SavvyTheme theme) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(title, style: TextStyle(color: theme.colors.textSecondary, fontWeight: FontWeight.bold, fontSize: 12)),
    );
  }

  Widget _breakdownRow(String label, double amount, SavvyTheme theme, {bool isBold = false, Color? color, double size = 14}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: TextStyle(color: theme.colors.textSecondary, fontWeight: isBold ? FontWeight.bold : FontWeight.normal, fontSize: size)),
          Text(
            '\$${amount.toStringAsFixed(2)}', 
            style: TextStyle(
              color: color ?? theme.colors.textPrimary, 
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
              fontSize: size
            )
          ),
        ],
      ),
    );
  }
}
