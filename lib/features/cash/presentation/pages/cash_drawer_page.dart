import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:savvy_pos/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:savvy_pos/features/cash/domain/entities/cash_drawer_entities.dart';
import 'package:savvy_pos/features/cash/domain/repositories/i_cash_drawer_repository.dart';
import 'package:savvy_pos/features/shifts/domain/repositories/i_shift_repository.dart';

class CashDrawerPage extends StatefulWidget {
  const CashDrawerPage({super.key});

  @override
  State<CashDrawerPage> createState() => _CashDrawerPageState();
}

class _CashDrawerPageState extends State<CashDrawerPage> {
  final _repo = GetIt.I<ICashDrawerRepository>();
  final _shiftRepo = GetIt.I<IShiftRepository>();

  CashDrawer? _currentDrawer;
  // ignore: unused_field - Will be used for summary display in future enhancement
  CashDrawerSummary? _summary;
  List<CashEvent> _events = [];
  bool _isLoading = true;
  String? _currentShiftUuid;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    setState(() => _isLoading = true);
    try {
      final authBloc = context.read<AuthBloc>();
      final employee = authBloc.state.employee;

      if (employee != null) {
        final shift = await _shiftRepo.getCurrentShift(employee.uuid);
        if (shift != null) {
          _currentShiftUuid = shift.id;
          final drawer = await _repo.getCurrentDrawer(shift.id);
          if (drawer != null) {
            final summary = await _repo.getDrawerSummary(drawer.id);
            final events = await _repo.getDrawerEvents(drawer.id);

            if (mounted) {
              setState(() {
                _currentDrawer = drawer;
                _summary = summary;
                _events = events;
              });
            }
          }
        }
      }
    } catch (e) {
      // Handle error
    }
    if (mounted) setState(() => _isLoading = false);
  }

  Future<void> _openDrawer() async {
    final authBloc = context.read<AuthBloc>();
    final employee = authBloc.state.employee;
    if (employee == null || _currentShiftUuid == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('Please clock in first'),
            backgroundColor: Colors.orange),
      );
      return;
    }

    final amount = await _showAmountDialog('Starting Balance');
    if (amount == null) return;

    final drawer = await _repo.openDrawer(
        _currentShiftUuid!, employee.uuid, employee.name, amount);
    setState(() => _currentDrawer = drawer);
    _loadData();
  }

  Future<void> _recordEvent(CashEventType type, String title) async {
    if (_currentDrawer == null) return;

    final result = await _showEventDialog(title, type);
    if (result == null) return;

    await _repo.recordEvent(_currentDrawer!.id, type, result.$1, result.$2,
        comment: result.$3);
    _loadData();
  }

  Future<void> _closeDrawer() async {
    if (_currentDrawer == null) return;

    final amount = await _showAmountDialog('Actual Cash Count');
    if (amount == null) return;

    final drawer = await _repo.closeDrawer(_currentDrawer!.id, amount);

    if (mounted) {
      _showReconciliationResult(drawer);
    }
    _loadData();
  }

  void _showReconciliationResult(CashDrawer drawer) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Drawer Closed'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _ResultRow(
                label: 'Expected',
                value: '\$${drawer.expectedBalance.toStringAsFixed(2)}'),
            _ResultRow(
                label: 'Actual',
                value: '\$${drawer.closingBalance?.toStringAsFixed(2) ?? '0'}'),
            const Divider(),
            _ResultRow(
              label: 'Variance',
              value: '\$${drawer.variance?.toStringAsFixed(2) ?? '0'}',
              valueColor: drawer.hasVariance
                  ? (drawer.isOverage ? Colors.green : Colors.red)
                  : null,
            ),
            if (drawer.hasVariance) ...[
              const Gap(8),
              Text(
                drawer.isOverage ? '⬆️ Overage' : '⬇️ Shortage',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: drawer.isOverage ? Colors.green : Colors.red,
                ),
              ),
            ],
          ],
        ),
        actions: [
          ElevatedButton(
              onPressed: () => Navigator.pop(context), child: const Text('OK')),
        ],
      ),
    );
  }

  Future<double?> _showAmountDialog(String title) async {
    final controller = TextEditingController();
    return showDialog<double>(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(title),
        content: TextField(
          controller: controller,
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          decoration: const InputDecoration(
            prefixText: '\$ ',
            border: OutlineInputBorder(),
          ),
          autofocus: true,
        ),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel')),
          ElevatedButton(
            onPressed: () {
              final amount = double.tryParse(controller.text);
              Navigator.pop(context, amount);
            },
            child: const Text('Confirm'),
          ),
        ],
      ),
    );
  }

  Future<(double, String, String?)?> _showEventDialog(
      String title, CashEventType type) async {
    final amountController = TextEditingController();
    final commentController = TextEditingController();
    String selectedReason = type == CashEventType.cashIn
        ? 'Change'
        : type == CashEventType.cashOut
            ? 'Tip Out'
            : type == CashEventType.cashDrop
                ? 'Bank Deposit'
                : 'Other';

    return showDialog<(double, String, String?)>(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(title),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: amountController,
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              decoration: const InputDecoration(
                  labelText: 'Amount',
                  prefixText: '\$ ',
                  border: OutlineInputBorder()),
            ),
            const Gap(12),
            DropdownButtonFormField<String>(
              initialValue: selectedReason,
              decoration: const InputDecoration(
                  labelText: 'Reason', border: OutlineInputBorder()),
              items: (type == CashEventType.cashIn
                      ? ['Change', 'Other']
                      : type == CashEventType.cashOut
                          ? ['Tip Out', 'Payout', 'Other']
                          : ['Bank Deposit', 'Safe Drop'])
                  .map((r) => DropdownMenuItem(value: r, child: Text(r)))
                  .toList(),
              onChanged: (v) => selectedReason = v ?? selectedReason,
            ),
            const Gap(12),
            TextField(
              controller: commentController,
              decoration: const InputDecoration(
                  labelText: 'Comment (Optional)',
                  border: OutlineInputBorder()),
            ),
          ],
        ),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel')),
          ElevatedButton(
            onPressed: () {
              final amount = double.tryParse(amountController.text) ?? 0;
              Navigator.pop(context, (
                amount,
                selectedReason,
                commentController.text.isEmpty ? null : commentController.text
              ));
            },
            child: const Text('Submit'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final currFmt = NumberFormat.currency(symbol: '\$', decimalDigits: 2);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cash Drawer'),
        actions: [
          IconButton(onPressed: _loadData, icon: const Icon(Icons.refresh)),
        ],
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _currentDrawer == null
              ? _buildEmptyState()
              : _buildDrawerContent(currFmt),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.point_of_sale, size: 80, color: Colors.grey),
          const Gap(16),
          const Text('No drawer open',
              style: TextStyle(fontSize: 18, color: Colors.grey)),
          const Gap(24),
          ElevatedButton.icon(
            onPressed: _openDrawer,
            icon: const Icon(Icons.add),
            label: const Text('Open Drawer'),
            style: ElevatedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(horizontal: 32, vertical: 16)),
          ),
        ],
      ).animate().fadeIn(),
    );
  }

  Widget _buildDrawerContent(NumberFormat currFmt) {
    return Row(
      children: [
        // Left: Status & Actions
        Expanded(
          flex: 2,
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Status Card
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.green.shade400, Colors.teal.shade400],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Current Balance',
                          style: TextStyle(color: Colors.white70)),
                      const Gap(8),
                      Text(currFmt.format(_currentDrawer!.currentBalance),
                          style: const TextStyle(
                              fontSize: 36,
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                      const Gap(8),
                      Text(
                          'Expected: ${currFmt.format(_currentDrawer!.expectedBalance)}',
                          style: const TextStyle(color: Colors.white54)),
                    ],
                  ),
                ).animate().scale(duration: 300.ms),

                const Gap(24),

                // Quick Actions Grid
                Wrap(
                  spacing: 12,
                  runSpacing: 12,
                  children: [
                    _ActionButton(
                        icon: Icons.add,
                        label: 'Cash In',
                        color: Colors.green,
                        onTap: () =>
                            _recordEvent(CashEventType.cashIn, 'Cash In')),
                    _ActionButton(
                        icon: Icons.remove,
                        label: 'Cash Out',
                        color: Colors.orange,
                        onTap: () =>
                            _recordEvent(CashEventType.cashOut, 'Cash Out')),
                    _ActionButton(
                        icon: Icons.savings,
                        label: 'Cash Drop',
                        color: Colors.blue,
                        onTap: () => _recordEvent(
                            CashEventType.cashDrop, 'Cash Drop to Safe')),
                    _ActionButton(
                        icon: Icons.receipt_long,
                        label: 'No Sale',
                        color: Colors.grey,
                        onTap: () =>
                            _recordEvent(CashEventType.noSale, 'No Sale')),
                  ],
                ),

                const Spacer(),

                // Close Drawer Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: _closeDrawer,
                    icon: const Icon(Icons.lock),
                    label: const Text('Close & Reconcile Drawer'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),

        const VerticalDivider(width: 1),

        // Right: Activity Log
        Expanded(
          flex: 1,
          child: Container(
            color: Theme.of(context).colorScheme.surfaceContainerLowest,
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Activity Log',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                const Gap(12),
                Expanded(
                  child: _events.isEmpty
                      ? const Center(
                          child: Text('No activity yet',
                              style: TextStyle(color: Colors.grey)))
                      : ListView.builder(
                          itemCount: _events.length,
                          itemBuilder: (context, index) {
                            final e = _events[index];
                            return ListTile(
                              dense: true,
                              leading: Icon(_getEventIcon(e.type),
                                  size: 20, color: _getEventColor(e.type)),
                              title: Text('${e.type.name} - ${e.reason}'),
                              subtitle:
                                  Text(DateFormat('HH:mm').format(e.timestamp)),
                              trailing: Text(
                                '${e.type == CashEventType.cashIn || e.type == CashEventType.sale ? '+' : '-'}\$${e.amount.toStringAsFixed(2)}',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: e.type == CashEventType.cashIn ||
                                          e.type == CashEventType.sale
                                      ? Colors.green
                                      : Colors.red,
                                ),
                              ),
                            );
                          },
                        ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  IconData _getEventIcon(CashEventType type) {
    switch (type) {
      case CashEventType.cashIn:
        return Icons.add_circle;
      case CashEventType.cashOut:
        return Icons.remove_circle;
      case CashEventType.cashDrop:
        return Icons.savings;
      case CashEventType.noSale:
        return Icons.receipt_long;
      case CashEventType.sale:
        return Icons.attach_money;
      case CashEventType.refund:
        return Icons.undo;
    }
  }

  Color _getEventColor(CashEventType type) {
    switch (type) {
      case CashEventType.cashIn:
      case CashEventType.sale:
        return Colors.green;
      case CashEventType.cashOut:
      case CashEventType.refund:
        return Colors.orange;
      case CashEventType.cashDrop:
        return Colors.blue;
      case CashEventType.noSale:
        return Colors.grey;
    }
  }
}

class _ActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  final VoidCallback onTap;

  const _ActionButton(
      {required this.icon,
      required this.label,
      required this.color,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        width: 100,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: color.withValues(alpha: 0.3)),
        ),
        child: Column(
          children: [
            Icon(icon, color: color, size: 28),
            const Gap(8),
            Text(label,
                style: TextStyle(color: color, fontWeight: FontWeight.w600)),
          ],
        ),
      ),
    ).animate().fadeIn().scale(delay: 100.ms);
  }
}

class _ResultRow extends StatelessWidget {
  final String label;
  final String value;
  final Color? valueColor;

  const _ResultRow({required this.label, required this.value, this.valueColor});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label),
          Text(value,
              style: TextStyle(fontWeight: FontWeight.bold, color: valueColor)),
        ],
      ),
    );
  }
}
