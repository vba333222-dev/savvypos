import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:savvy_pos/core/config/theme/savvy_theme.dart';
import 'package:savvy_pos/core/database/usecases/purge_old_data_usecase.dart';
import 'package:savvy_pos/core/presentation/widgets/savvy_numpad.dart';
import 'package:savvy_pos/features/shifts/domain/entities/shift_entities.dart';
import 'package:savvy_pos/features/shifts/presentation/bloc/shift_bloc.dart';

class CloseShiftDialog extends StatefulWidget {
  final ShiftSession currentShift;
  final double totalPayIn;
  final double totalPayOut;
  final double totalSafeDrops;
  final double totalSales; 

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
  // Hardcoded IDR denominations for demo. In prod, load from Tenants/Config
  final List<int> _denominations = [
    100000, 50000, 20000, 10000, 5000, 2000, 1000, 500, 200, 100
  ];
  
  final Map<int, TextEditingController> _controllers = {};
  int? _activeDenomination;
  double _actualCash = 0.0;

  @override
  void initState() {
    super.initState();
    _activeDenomination = _denominations.first;
    for (var d in _denominations) {
      _controllers[d] = TextEditingController();
      _controllers[d]!.addListener(_updateActualCash);
    }
  }

  @override
  void dispose() {
    for (var c in _controllers.values) {
      c.dispose();
    }
    super.dispose();
  }

  void _onNumpadInput(String value) {
    if (_activeDenomination == null) return;
    final controller = _controllers[_activeDenomination]!;
    if (controller.text == '0') {
      controller.text = value;
    } else {
      controller.text += value;
    }
  }

  void _onNumpadBackspace() {
    if (_activeDenomination == null) return;
    final controller = _controllers[_activeDenomination]!;
    if (controller.text.isNotEmpty) {
      controller.text = controller.text.substring(0, controller.text.length - 1);
    }
  }

  void _onNumpadClear() {
    if (_activeDenomination == null) return;
    final controller = _controllers[_activeDenomination]!;
    controller.clear();
  }

  void _updateActualCash() {
    double total = 0.0;
    for (var entry in _controllers.entries) {
      final qty = int.tryParse(entry.value.text) ?? 0;
      total += (entry.key * qty);
    }
    setState(() {
      _actualCash = total;
    });
  }

  void _handleCloseShift() {
    context.read<ShiftBloc>().add(ShiftEvent.verifyCashCount(_actualCash));
  }

  void _showVarianceReasonDialog(double variance) {
    final reasonController = TextEditingController();
    final theme = context.savvy;
    final isShort = variance < 0;

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (ctx) => AlertDialog(
        backgroundColor: theme.colors.bgElevated,
        title: Row(
          children: [
            Icon(Icons.warning_amber_rounded, color: theme.colors.stateWarning, size: 28),
            const SizedBox(width: 8),
            Text('Cash Variance Detected', style: TextStyle(color: theme.colors.textPrimary)),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Your physical count does not match the system.',
              style: TextStyle(color: theme.colors.textSecondary),
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: isShort ? theme.colors.stateError.withValues(alpha: 0.1) : theme.colors.stateSuccess.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(theme.shapes.radiusMd),
                border: Border.all(color: isShort ? theme.colors.stateError : theme.colors.stateSuccess),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Variance Amount:', style: TextStyle(color: theme.colors.textPrimary, fontWeight: FontWeight.bold)),
                  Text(
                    '${isShort ? '' : '+'}\$${variance.toStringAsFixed(2)}',
                    style: TextStyle(
                      color: isShort ? theme.colors.stateError : theme.colors.stateSuccess,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: reasonController,
              maxLines: 3,
              style: TextStyle(color: theme.colors.textPrimary),
              decoration: InputDecoration(
                labelText: 'Mandatory Reason',
                hintText: 'Explain the discrepancy...',
                labelStyle: TextStyle(color: theme.colors.textSecondary),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: theme.colors.borderDefault),
                  borderRadius: BorderRadius.circular(theme.shapes.radiusMd),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: theme.colors.brandPrimary),
                  borderRadius: BorderRadius.circular(theme.shapes.radiusMd),
                ),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: Text('Cancel', style: TextStyle(color: theme.colors.textSecondary)),
          ),
          ElevatedButton(
            onPressed: () {
              if (reasonController.text.trim().isEmpty) {
                ScaffoldMessenger.of(ctx).showSnackBar(
                  SnackBar(content: Text('Variance reason is mandatory', style: TextStyle(color: theme.colors.textInverse)), backgroundColor: theme.colors.stateError),
                );
                return;
              }
              Navigator.pop(ctx);
              _submitCloseShift(reasonController.text.trim());
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: theme.colors.stateWarning,
              foregroundColor: theme.colors.textPrimary, // Better contrast on yellow/warning
            ),
            child: const Text('Confirm Discrepancy & Close'),
          ),
        ],
      ),
    );
  }

  void _submitCloseShift(String? varianceReason) {
    // ── Fire shift-close event ──────────────────────────────
    context.read<ShiftBloc>().add(ShiftEvent.closeShift(_actualCash, varianceReason: varianceReason));
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.savvy;

    return BlocConsumer<ShiftBloc, ShiftState>(
      listener: (context, state) {
        state.maybeWhen(
          varianceWarning: (variance, actualCash) {
            _showVarianceReasonDialog(variance);
          },
          closed: () {
            // ── Auto-clean image cache on shift end ─────────────────
            PaintingBinding.instance.imageCache.clear();
            PaintingBinding.instance.imageCache.clearLiveImages();
            debugPrint('[Cache] Image cache flushed on shift close. RAM freed.');
            
            // ── Execute Data Retention Auto-Purge Silently ──────────
            Future.microtask(() => GetIt.I<PurgeOldDataUseCase>().call());
            
            Navigator.pop(context);
          },
          error: (message) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(message, style: TextStyle(color: theme.colors.textInverse)), backgroundColor: theme.colors.stateError),
            );
          },
          orElse: () {},
        );
      },
      builder: (context, state) {
        final isLoading = state.maybeWhen(loading: () => true, orElse: () => false);

        return AlertDialog(
          backgroundColor: theme.colors.bgElevated,
          title: Text('Blind Cash Count', style: TextStyle(color: theme.colors.textPrimary)),
          content: SizedBox(
            width: 700, // Make it wider to fit two columns comfortably
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: theme.colors.bgSurface,
                borderRadius: BorderRadius.circular(theme.shapes.radiusSm),
                border: Border.all(color: theme.colors.borderDefault),
              ),
              child: Row(
                children: [
                  Icon(Icons.security, color: theme.colors.brandPrimary),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      'For security reasons, system expected totals are hidden. Please perform a physical count of the drawer.',
                      style: TextStyle(color: theme.colors.textSecondary, fontSize: 13),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Text('Denomination Input (Qty)', style: TextStyle(color: theme.colors.textPrimary, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            Flexible(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxHeight: MediaQuery.of(context).size.height * 0.45,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Left Column: Denominations List
                    Expanded(
                      flex: 3,
                      child: SingleChildScrollView(
                        child: Column(
                          children: _denominations.map((d) {
                            final isActive = _activeDenomination == d;
                            return InkWell(
                              onTap: () => setState(() => _activeDenomination = d),
                              child: Container(
                                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                                decoration: BoxDecoration(
                                  color: isActive ? theme.colors.brandPrimary.withValues(alpha: 0.1) : Colors.transparent,
                                  borderRadius: BorderRadius.circular(theme.shapes.radiusMd),
                                  border: Border.all(
                                    color: isActive ? theme.colors.brandPrimary : Colors.transparent,
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 90,
                                      child: Text(
                                        d >= 1000 ? '\$${(d/1000).toStringAsFixed(0)}k' : '\$$d',
                                        style: TextStyle(color: theme.colors.textSecondary, fontSize: 16),
                                        textAlign: TextAlign.right,
                                      ),
                                    ),
                                    const SizedBox(width: 16),
                                    Expanded(
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                                        decoration: BoxDecoration(
                                          border: Border.all(color: isActive ? theme.colors.brandPrimary : theme.colors.borderDefault),
                                          borderRadius: BorderRadius.circular(theme.shapes.radiusMd),
                                          color: theme.colors.bgSurface,
                                        ),
                                        child: Text(
                                          _controllers[d]!.text.isEmpty ? '0' : _controllers[d]!.text,
                                          style: TextStyle(color: theme.colors.textPrimary, fontWeight: FontWeight.bold),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    SizedBox(
                                      width: 80,
                                      child: Text(
                                        '= \$${(_controllers[d]?.text.isNotEmpty == true) ? (d * (int.tryParse(_controllers[d]!.text) ?? 0)) : 0}',
                                        style: TextStyle(color: theme.colors.textMuted, fontSize: 12),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                    const SizedBox(width: 24),
                    // Right Column: Numpad
                    Expanded(
                      flex: 2,
                      child: SavvyNumpad(
                        onInput: _onNumpadInput,
                        onBackspace: _onNumpadBackspace,
                        onClear: _onNumpadClear,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            Divider(color: theme.colors.borderDefault),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Total Physical Cash:', style: TextStyle(color: theme.colors.textSecondary, fontSize: 16)),
                Text(
                  '\$${_actualCash.toStringAsFixed(2)}',
                  style: TextStyle(
                    color: _actualCash > 0 ? theme.colors.stateSuccess : theme.colors.textPrimary,
                    fontWeight: FontWeight.bold,
                    fontSize: 28,
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
              onPressed: isLoading ? null : (_actualCash > 0 || widget.currentShift.startCash == 0 ? _handleCloseShift : null),
              style: ElevatedButton.styleFrom(
                backgroundColor: theme.colors.brandPrimary,
                foregroundColor: theme.colors.textInverse,
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              ),
              icon: isLoading 
                  ? SizedBox(width: 20, height: 20, child: CircularProgressIndicator(strokeWidth: 2, valueColor: AlwaysStoppedAnimation<Color>(theme.colors.textInverse)))
                  : const Icon(Icons.lock_clock),
              label: Text(isLoading ? 'Processing...' : 'Submit Count & Close', style: const TextStyle(fontWeight: FontWeight.bold)),
            ),
          ],
        );
      },
    );
  }
}
