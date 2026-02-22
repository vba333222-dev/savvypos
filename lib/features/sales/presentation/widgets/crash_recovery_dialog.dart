import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:savvy_pos/core/config/theme_config.dart';
import 'package:savvy_pos/core/database/database.dart';
import 'package:savvy_pos/features/sales/domain/usecases/check_hanging_transactions.dart';

class CrashRecoveryDialog extends StatefulWidget {
  final List<OrderTableData> hangingOrders;

  const CrashRecoveryDialog({super.key, required this.hangingOrders});

  /// Displays the persistent blocking dialog and prevents dismissal
  static Future<void> showPersistent(
      BuildContext context, List<OrderTableData> orders) {
    return showDialog(
      context: context,
      barrierDismissible: false, // Force manager to resolve
      builder: (context) => PopScope(
        canPop: false, // No back button escape
        child: CrashRecoveryDialog(hangingOrders: orders),
      ),
    );
  }

  @override
  State<CrashRecoveryDialog> createState() => _CrashRecoveryDialogState();
}

class _CrashRecoveryDialogState extends State<CrashRecoveryDialog> {
  final _useCase = GetIt.I<CheckHangingTransactionsUseCase>();
  late List<OrderTableData> _pendingOrders;
  bool _isProcessing = false;

  @override
  void initState() {
    super.initState();
    _pendingOrders = List.from(widget.hangingOrders);
  }

  Future<void> _handleResolution(OrderTableData order, bool isSuccess) async {
    setState(() => _isProcessing = true);
    try {
      if (isSuccess) {
        await _useCase.markAsSuccess(order.uuid);
      } else {
        await _useCase.revertToCart(order.uuid);
      }

      setState(() {
        _pendingOrders.removeWhere((o) => o.uuid == order.uuid);
        _isProcessing = false;
      });

      if (_pendingOrders.isEmpty && mounted) {
        Navigator.of(context).pop(); // All resolved, unblock POS
      }
    } catch (e) {
      setState(() => _isProcessing = false);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Gagal menyelesaikan rekod: $e')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.savvy.colors;
    final typography = Theme.of(context).textTheme;

    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(context.savvy.shapes.radiusLg),
      ),
      elevation: 24,
      child: Container(
        width: 600,
        padding: EdgeInsets.all(context.savvy.shapes.spacingXl),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Icon(Icons.warning_amber_rounded,
                    color: colors.stateWarning, size: 48),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Pemulihan Bencana Sistem',
                          style: typography.headlineSmall?.copyWith(
                              color: colors.stateWarning,
                              fontWeight: FontWeight.bold)),
                      const SizedBox(height: 4),
                      Text(
                          'Sistem terputus kuasa (Crash) sewaktu pesanan diproses. Harap selesaikan senarai di bawah.',
                          style: typography.bodyMedium
                              ?.copyWith(color: colors.textMuted)),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            ConstrainedBox(
              constraints: const BoxConstraints(maxHeight: 400),
              child: ListView.separated(
                shrinkWrap: true,
                itemCount: _pendingOrders.length,
                separatorBuilder: (_, __) => Divider(color: colors.borderDefault),
                itemBuilder: (context, index) {
                  final order = _pendingOrders[index];
                  final time = DateFormat('dd MMM, HH:mm')
                      .format(order.transactionDate);
                  return Card(
                    margin: EdgeInsets.zero,
                    color: colors.bgElevated,
                    shape: RoundedRectangleBorder(
                       side: BorderSide(color: colors.borderDefault),
                       borderRadius: BorderRadius.circular(context.savvy.shapes.radiusMd),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Order #${order.orderNumber}',
                                  style: typography.titleMedium
                                      ?.copyWith(fontWeight: FontWeight.bold)),
                              Text(time,
                                  style: typography.bodySmall
                                      ?.copyWith(color: colors.textMuted)),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Jumlah Tersangkut: Rp ${NumberFormat('#,###').format(order.grandTotal)}',
                            style: typography.bodyLarge?.copyWith(
                                color: colors.stateError,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 16),
                          Row(
                            children: [
                              Expanded(
                                child: OutlinedButton.icon(
                                  onPressed: _isProcessing
                                      ? null
                                      : () => _handleResolution(order, false),
                                  icon: const Icon(Icons.settings_backup_restore),
                                  label: const Text('Kembalikan ke Draf'),
                                  style: OutlinedButton.styleFrom(
                                    foregroundColor: colors.stateWarning,
                                    side: BorderSide(color: colors.stateWarning),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: ElevatedButton.icon(
                                  onPressed: _isProcessing
                                      ? null
                                      : () => _handleResolution(order, true),
                                  icon: const Icon(Icons.check_circle_outline),
                                  label: const Text('Tanda Sukses (Lunas)'),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: colors.stateSuccess,
                                    foregroundColor: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
