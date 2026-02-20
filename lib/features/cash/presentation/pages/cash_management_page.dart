import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:savvy_pos/core/di/injection.dart';
import 'package:savvy_pos/features/cash/presentation/bloc/cash_management_bloc.dart';
import 'package:savvy_pos/features/cash/presentation/widgets/cash_count_dialog.dart';
import 'package:savvy_pos/features/cash/presentation/pages/shift_report_page.dart';

class CashManagementPage extends StatelessWidget {
  final String shiftUuid;

  const CashManagementPage({super.key, required this.shiftUuid});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<CashManagementBloc>()..add(CashManagementEvent.started(shiftUuid)),
      child: BlocListener<CashManagementBloc, CashManagementState>(
        listener: (context, state) {
           if (state.errorMessage != null) {
             ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.errorMessage!), backgroundColor: Colors.red));
           }
           if (state.isShiftClosed) {
             // Navigate to Z-Report
             if (state.currentDrawer != null && state.summary != null) {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (_) => ShiftReportPage(
                    drawer: state.currentDrawer!,
                    summary: state.summary!,
                  )
                ));
             } else {
                Navigator.of(context).pop();
             }
           }
        },
        child: BlocBuilder<CashManagementBloc, CashManagementState>(
          builder: (context, state) {
            if (state.isLoading) return const Scaffold(body: Center(child: CircularProgressIndicator()));

            final drawer = state.currentDrawer;
            if (drawer == null) {
              return _buildStartShiftUI(context);
            }
            
            return Scaffold(
              appBar: AppBar(title: const Text('Cash Management'), actions: [
                IconButton(
                  icon: const Icon(Icons.refresh), 
                  onPressed: () => context.read<CashManagementBloc>().add(CashManagementEvent.started(shiftUuid))
                )
              ]),
              body: Padding(
                padding: const EdgeInsets.all(24),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // LEFT: Dashboard Metrics
                    Expanded(
                      flex: 2,
                      child: Column(
                        children: [
                          _buildBalanceCard(context, state),
                          const SizedBox(height: 24),
                          _buildSummaryCard(state),
                        ],
                      ),
                    ),
                    const SizedBox(width: 24),
                    // RIGHT: Actions
                    Expanded(
                      flex: 1,
                      child: Column(
                        children: [
                             _ActionButton(
                               label: 'CASH DROP', 
                               icon: Icons.move_to_inbox, 
                               color: Colors.orange,
                               onTap: () => _showCashDropDialog(context)
                             ),
                             const SizedBox(height: 16),
                             _ActionButton(
                               label: 'PAY IN / OUT', 
                               icon: Icons.swap_horiz, 
                               color: Colors.blue,
                               onTap: () {} // Todo
                             ),
                             const Spacer(),
                             _ActionButton(
                               label: 'CLOSE SHIFT', 
                               icon: Icons.lock_clock, 
                               color: Colors.red,
                               onTap: () => _showCloseShiftDialog(context)
                             ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildStartShiftUI(BuildContext context) {
     return Scaffold(
       appBar: AppBar(title: const Text("Start Shift")),
       body: Center(
         child: ElevatedButton(
           style: ElevatedButton.styleFrom(padding: const EdgeInsets.all(32)),
           child: const Text("OPEN DRAWER / START SHIFT", style: TextStyle(fontSize: 24)),
           onPressed: () {
             // Show count dialog for starting cash
              showDialog(
                context: context,
                builder: (_) => CashCountDialog(
                  title: 'Starting Cash',
                  onConfirm: (amount) {
                    context.read<CashManagementBloc>().add(CashManagementEvent.openDrawer(amount));
                  },
                ),
              );
           },
         ),
       ),
     );
  }

  Widget _buildBalanceCard(BuildContext context, CashManagementState state) {
    final balance = state.currentDrawer?.currentBalance ?? 0;
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
             const Text('CASH IN DRAWER', style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold)),
             const SizedBox(height: 8),
             Row(
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 Text(
                   state.isBalanceVisible ? '\$${balance.toStringAsFixed(2)}' : '****', 
                   style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold)
                 ),
                 const SizedBox(width: 16),
                 IconButton(
                   icon: Icon(state.isBalanceVisible ? Icons.visibility : Icons.visibility_off),
                   onPressed: () => context.read<CashManagementBloc>().add(const CashManagementEvent.toggleBalanceVisibility()),
                 )
               ],
             ),
             if (state.isBalanceVisible)
               const Text('Live System Balance', style: TextStyle(color: Colors.green, fontStyle: FontStyle.italic)),
          ],
        ),
      ),
    );
  }

  Widget _buildSummaryCard(CashManagementState state) {
    final summary = state.summary;
    if (summary == null) return const SizedBox.shrink();

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             const Text('SHIFT ACTIVITY', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
             const Divider(),
             _DetailRow('Starting Cash', summary.netCash - summary.totalSales + summary.totalRefunds - (summary.totalCashIn - summary.totalCashOut - summary.totalDrops)), // Approximation or use Drawer.starting
             _DetailRow('Cash Sales', summary.totalSales, color: Colors.green),
             _DetailRow('Refunds', -summary.totalRefunds, color: Colors.red),
             _DetailRow('Cash Drops', -summary.totalDrops, color: Colors.orange),
             const Divider(),
             _DetailRow('Expected Net', summary.netCash, isBold: true),
           ],
        ),
      ),
    );
  }
  
  void _showCashDropDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => CashCountDialog(
        title: 'Cash Drop',
        reasonField: true,
        onConfirm: (amount) { // We need reason, update Dialog to support reason or separate dialog
           // Simplified for now: assume dialog handles reason or we ask separate?
           // I'll update CashCountDialog to have optional note.
           context.read<CashManagementBloc>().add(CashManagementEvent.cashDrop(amount, "Safe Drop"));
        },
      ),
    );
  }

  void _showCloseShiftDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => CashCountDialog(
        title: 'Blind Close Count',
        isBlind: true,
        onConfirm: (amount) {
           context.read<CashManagementBloc>().add(CashManagementEvent.closeShift(amount));
        },
      ),
    );
  }
}

class _DetailRow extends StatelessWidget {
  final String label;
  final double amount;
  final bool isBold;
  final Color? color;

  const _DetailRow(this.label, this.amount, {this.isBold = false, this.color});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: TextStyle(fontWeight: isBold ? FontWeight.bold : FontWeight.normal)),
          Text('\$${amount.toStringAsFixed(2)}', style: TextStyle(fontWeight: isBold ? FontWeight.bold : FontWeight.normal, color: color)),
        ],
      ),
    );
  }
}

class _ActionButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final Color color;
  final VoidCallback onTap;

  const _ActionButton({required this.label, required this.icon, required this.color, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 80,
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
        onPressed: onTap,
        icon: Icon(icon, size: 32),
        label: Text(label, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
      ),
    );
  }
}
