import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:savvy_pos/core/di/injection.dart';
import 'package:savvy_pos/core/hal/payment_terminal_interface.dart';
import 'package:savvy_pos/features/sales/domain/entities/payment_transaction.dart';
import 'package:savvy_pos/features/sales/domain/entities/cart.dart';
import 'package:savvy_pos/features/sales/presentation/bloc/checkout_bloc.dart';
import 'package:savvy_pos/features/sales/presentation/widgets/numpad_widget.dart';
import 'package:savvy_pos/features/sales/presentation/widgets/loyalty_lookup_dialog.dart';

class CheckoutPage extends StatefulWidget {
  final String orderUuid;
  final Cart cart;
  final String? tableName;

  const CheckoutPage({
    super.key,
    required this.orderUuid,
    required this.cart,
    this.tableName,
  });

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  String _tenderInput = '';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<CheckoutBloc>()
        ..add(CheckoutEvent.started(widget.orderUuid, widget.cart.total)),
      child: BlocListener<CheckoutBloc, CheckoutState>(
        listener: (context, state) {
          if (state.isComplete) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  state.lastApprovalCode != null
                      ? 'Card Approved! (${state.lastApprovalCode})'
                      : 'Order Paid Successfully!',
                  style: const TextStyle(color: Colors.white),
                ),
                backgroundColor: Colors.green,
              ),
            );
            Navigator.of(context)
                .popUntil((route) => route.settings.name == '/floor_plan');
          }
          if (state.errorMessage != null && !state.isAwaitingEdc) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Error: ${state.errorMessage}'),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        child: BlocBuilder<CheckoutBloc, CheckoutState>(
          builder: (context, state) {
            final double tenderValue = double.tryParse(_tenderInput) ?? 0.0;
            final double due = state.remainingBalance;

            return Stack(
              children: [
                _buildMainContent(context, state, tenderValue, due),
                // EDC Awaiting Overlay — appears when awaiting card tap/swipe
                if (state.isAwaitingEdc)
                  _EdcAwaitingOverlay(
                    status: state.edcTerminalStatus,
                    onCancel: () => context
                        .read<CheckoutBloc>()
                        .add(const CheckoutEvent.cancelEdcPayment()),
                  ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildMainContent(BuildContext context, CheckoutState state,
      double tenderValue, double due) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Checkout: ${widget.tableName ?? "Order"}'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Row(
        children: [
          // LEFT: Receipt Summary
          Expanded(
            flex: 2,
            child: Container(
              color: Colors.grey[50],
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(16),
                    width: double.infinity,
                    child: const Text(
                      'ORDER SUMMARY',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, letterSpacing: 1.2),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const Divider(height: 1),
                  Expanded(
                    child: state.items.isEmpty
                        ? const Center(child: Text('Loading items...'))
                        : ListView.builder(
                            padding: const EdgeInsets.all(16),
                            itemCount: state.items.length,
                            itemBuilder: (context, index) {
                              final item = state.items[index];
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 4),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                        '${item.quantity.toInt()}x  ${item.name}'),
                                    Text('\$${item.total.toStringAsFixed(2)}'),
                                  ],
                                ),
                              );
                            },
                          ),
                  ),
                  const Divider(),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        _Row('Subtotal', widget.cart.subtotal),
                        _Row('Tax', widget.cart.taxAmount),
                        const Divider(),
                        _Row('Total', widget.cart.total, isBold: true),
                        const SizedBox(height: 8),
                        _Row('Paid', widget.cart.total - state.remainingBalance,
                            color: Colors.green),
                        _Row('Due', state.remainingBalance,
                            isBold: true, color: Colors.red, size: 20),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // RIGHT: Payment Controls
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Tender Amount Display
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.blueAccent),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      children: [
                        const Text('TENDER AMOUNT',
                            style: TextStyle(color: Colors.grey, fontSize: 12)),
                        Text(
                          _tenderInput.isEmpty ? '\$0.00' : '\$$_tenderInput',
                          style: const TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                              color: Colors.blueAccent),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),

                  Expanded(
                    child: Row(
                      children: [
                        // Numpad
                        Expanded(
                          flex: 3,
                          child: NumpadWidget(
                            onKeyPressed: (key) {
                              setState(() {
                                if (_tenderInput.contains('.') && key == '.')
                                  return;
                                if (key == '.' && _tenderInput.isEmpty) {
                                  _tenderInput = '0.';
                                } else {
                                  _tenderInput += key;
                                }
                              });
                            },
                            onClear: () => setState(() => _tenderInput = ''),
                            onBackspace: () => setState(() => _tenderInput =
                                _tenderInput.isNotEmpty
                                    ? _tenderInput.substring(
                                        0, _tenderInput.length - 1)
                                    : ''),
                          ),
                        ),
                        const SizedBox(width: 24),

                        // Payment Method Buttons
                        Expanded(
                          flex: 2,
                          child: Column(
                            children: [
                              // Quick Exact Cash
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.green,
                                  foregroundColor: Colors.white,
                                  minimumSize: const Size(double.infinity, 60),
                                ),
                                onPressed: () {
                                  context.read<CheckoutBloc>().add(
                                        CheckoutEvent.processPayment(
                                          method: PaymentMethod.cash,
                                          amount: due,
                                          tendered: due,
                                        ),
                                      );
                                },
                                child: const Text('EXACT CASH',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                              ),
                              const SizedBox(height: 16),

                              _PaymentBtn(
                                label: 'CASH',
                                icon: Icons.money,
                                onTap: () {
                                  final amount =
                                      tenderValue > 0 ? tenderValue : due;
                                  context.read<CheckoutBloc>().add(
                                        CheckoutEvent.processPayment(
                                          method: PaymentMethod.cash,
                                          amount: amount,
                                          tendered: amount,
                                        ),
                                      );
                                },
                              ),
                              const SizedBox(height: 12),

                              // CARD via EDC Terminal — auto-confirms on hardware response
                              _PaymentBtn(
                                label: 'CARD (EDC)',
                                icon: Icons.contactless,
                                onTap: () {
                                  final amount =
                                      tenderValue > 0 ? tenderValue : due;
                                  // Sends amount to the physical EDC terminal.
                                  // CheckoutBloc will auto-confirm when terminal responds.
                                  context.read<CheckoutBloc>().add(
                                        CheckoutEvent.initiateEdcPayment(
                                            amount),
                                      );
                                },
                              ),
                              const SizedBox(height: 12),

                              // Loyalty Button
                              OutlinedButton.icon(
                                style: OutlinedButton.styleFrom(
                                  minimumSize: const Size(double.infinity, 60),
                                  foregroundColor: state.attachedMember != null
                                      ? Colors.purple
                                      : Colors.grey,
                                  side: BorderSide(
                                      color: state.attachedMember != null
                                          ? Colors.purple
                                          : Colors.grey),
                                ),
                                icon: Icon(state.attachedMember != null
                                    ? Icons.check_circle
                                    : Icons.card_membership),
                                label: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(state.attachedMember != null
                                        ? state.attachedMember!.customerName
                                        : 'LOYALTY'),
                                    if (state.attachedMember != null)
                                      Text(
                                          '${state.attachedMember!.currentPoints} pts',
                                          style: const TextStyle(fontSize: 10)),
                                  ],
                                ),
                                onPressed: () {
                                  if (state.attachedMember == null) {
                                    showDialog(
                                      context: context,
                                      builder: (_) => LoyaltyLookupDialog(
                                        onMemberSelected: (member) {
                                          context.read<CheckoutBloc>().add(
                                              CheckoutEvent.attachLoyaltyMember(
                                                  member));
                                        },
                                      ),
                                    );
                                  }
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Helper Widgets
// ─────────────────────────────────────────────────────────────────────────────

class _Row extends StatelessWidget {
  final String label;
  final double amount;
  final bool isBold;
  final Color? color;
  final double? size;

  const _Row(this.label, this.amount,
      {this.isBold = false, this.color, this.size});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label,
              style: TextStyle(
                  fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
                  fontSize: size,
                  color: color)),
          Text('\$${amount.toStringAsFixed(2)}',
              style: TextStyle(
                  fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
                  fontSize: size,
                  color: color)),
        ],
      ),
    );
  }
}

class _PaymentBtn extends StatelessWidget {
  final String label;
  final IconData icon;
  final VoidCallback onTap;

  const _PaymentBtn(
      {required this.label, required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 60,
      child: OutlinedButton.icon(
        style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        onPressed: onTap,
        icon: Icon(icon),
        label: Text(label),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// EDC Awaiting Card Overlay
// Shown when state.isAwaitingEdc == true, covering the checkout screen.
// ─────────────────────────────────────────────────────────────────────────────
class _EdcAwaitingOverlay extends StatelessWidget {
  final EdcTerminalStatus status;
  final VoidCallback onCancel;

  const _EdcAwaitingOverlay({required this.status, required this.onCancel});

  String get _statusMessage => switch (status) {
        EdcTerminalStatus.connecting => 'Connecting to terminal...',
        EdcTerminalStatus.awaitingCard => 'Tap or swipe card on terminal',
        EdcTerminalStatus.processing => 'Processing payment...',
        EdcTerminalStatus.approved => 'Approved! ✓',
        EdcTerminalStatus.declined => 'Card declined',
        EdcTerminalStatus.timeout => 'Request timed out',
        _ => 'Waiting for terminal...',
      };

  IconData get _statusIcon => switch (status) {
        EdcTerminalStatus.connecting => Icons.wifi_tethering,
        EdcTerminalStatus.awaitingCard => Icons.contactless,
        EdcTerminalStatus.processing => Icons.hourglass_top,
        EdcTerminalStatus.approved => Icons.check_circle,
        EdcTerminalStatus.declined => Icons.cancel,
        _ => Icons.payment,
      };

  Color get _statusColor => switch (status) {
        EdcTerminalStatus.approved => Colors.green,
        EdcTerminalStatus.declined => Colors.red,
        EdcTerminalStatus.timeout => Colors.orange,
        _ => Colors.blueAccent,
      };

  @override
  Widget build(BuildContext context) {
    final bool isActive = status == EdcTerminalStatus.awaitingCard ||
        status == EdcTerminalStatus.connecting;

    return Container(
      color: Colors.black.withValues(alpha: 0.75),
      child: Center(
        child: Container(
          width: 320,
          padding: const EdgeInsets.all(32),
          decoration: BoxDecoration(
            color: Colors.grey[900],
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: _statusColor, width: 2),
            boxShadow: [
              BoxShadow(
                  color: _statusColor.withValues(alpha: 0.3),
                  blurRadius: 24,
                  spreadRadius: 4),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Animated pulsing icon
              Icon(_statusIcon, size: 72, color: _statusColor)
                  .animate(
                      onPlay: (c) => isActive ? c.repeat(reverse: true) : null)
                  .scale(
                    begin: const Offset(1, 1),
                    end: const Offset(1.12, 1.12),
                    duration: 800.ms,
                  )
                  .animate()
                  .fadeIn(),

              const SizedBox(height: 20),
              Text(
                'EDC Terminal',
                style: TextStyle(
                    color: Colors.white.withValues(alpha: 0.5),
                    fontSize: 12,
                    letterSpacing: 2),
              ),
              const SizedBox(height: 8),
              Text(
                _statusMessage,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ).animate().fadeIn(delay: 100.ms).slideY(begin: 0.2, end: 0),

              // Indeterminate progress indicator for active states
              if (isActive)
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: LinearProgressIndicator(
                    color: _statusColor,
                    backgroundColor: Colors.grey[800],
                  ),
                )
                    .animate(onPlay: (c) => c.repeat())
                    .shimmer(color: _statusColor),

              const SizedBox(height: 24),
              TextButton.icon(
                onPressed: onCancel,
                icon: const Icon(Icons.close, color: Colors.white54),
                label: const Text('Cancel',
                    style: TextStyle(color: Colors.white54)),
              ),
            ],
          ),
        ),
      ),
    ).animate().fadeIn(duration: 200.ms);
  }
}
