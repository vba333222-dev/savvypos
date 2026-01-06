import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:savvy_pos/core/config/theme_config.dart';
import 'package:savvy_pos/core/presentation/widgets/savvy_widgets.dart'; // Barrel file
import 'package:savvy_pos/features/pos/presentation/bloc/cart/cart_bloc.dart';
import 'package:savvy_pos/features/pos/presentation/bloc/cart/cart_event.dart';

class PaymentMethodsDialog extends StatefulWidget {
  final double totalAmount;
  final CartBloc cartBloc;

  const PaymentMethodsDialog({
    Key? key,
    required this.totalAmount,
    required this.cartBloc,
  }) : super(key: key);

  @override
  State<PaymentMethodsDialog> createState() => _PaymentMethodsDialogState();
}

class _PaymentMethodsDialogState extends State<PaymentMethodsDialog> {
  // Payment Logic
  String _selectedMethod = 'CASH'; // CASH, QRIS, CARD
  String _cashInput = ''; 
  
  double get _enteredAmount => double.tryParse(_cashInput) ?? 0.0;
  double get _change => (_enteredAmount - widget.totalAmount).clamp(0.0, double.infinity);
  bool get _canPay => _selectedMethod != 'CASH' || _enteredAmount >= widget.totalAmount;

  @override
  Widget build(BuildContext context) {
    final theme = context.savvy;
    final currency = NumberFormat.currency(locale: 'en_US', symbol: '\$');

    return Dialog(
      backgroundColor: Colors.transparent, // Use SavvyBox for background
      child: SavvyBox(
        width: 800,
        height: 600,
        color: theme.colors.bgPrimary,
        padding: EdgeInsets.zero,
        child: Row(
          children: [
            // LEFT: Methods & Numpad
            Expanded(
              flex: 3,
              child: Column(
                children: [
                  // Payment Methods Grid
                  Padding(
                    padding: EdgeInsets.all(theme.shapes.spacingMd),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _PaymentMethodCard(
                          label: 'CASH',
                          icon: Icons.money,
                          isSelected: _selectedMethod == 'CASH',
                          onTap: () => setState(() => _selectedMethod = 'CASH'),
                        ),
                        SizedBox(width: theme.shapes.spacingSm),
                        _PaymentMethodCard(
                          label: 'QRIS',
                          icon: Icons.qr_code,
                          isSelected: _selectedMethod == 'QRIS',
                          onTap: () => setState(() => _selectedMethod = 'QRIS'),
                        ),
                        SizedBox(width: theme.shapes.spacingSm),
                        _PaymentMethodCard(
                          label: 'CARD',
                          icon: Icons.credit_card,
                          isSelected: _selectedMethod == 'CARD',
                          onTap: () => setState(() => _selectedMethod = 'CARD'),
                        ),
                      ],
                    ),
                  ),
                  
                  Divider(color: theme.colors.borderDefault),
                  
                  // Content Area
                  Expanded(
                    child: _selectedMethod == 'CASH' 
                      ? _buildCashNumpad(theme)
                      : _buildTerminalWait(theme),
                  ),
                ],
              ),
            ),
            
            // RIGHT: Summary
            Container(
              width: 300,
              decoration: BoxDecoration(
                color: theme.colors.bgSecondary,
                border: Border(left: BorderSide(color: theme.colors.borderDefault)),
                borderRadius: BorderRadius.horizontal(right: Radius.circular(theme.shapes.radiusMd)),
              ),
              padding: EdgeInsets.all(theme.shapes.spacingLg),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SavvyText("Total Due", style: SavvyTextStyle.bodyLarge, color: theme.colors.textSecondary),
                      IconButton(onPressed: () => Navigator.pop(context), icon: Icon(Icons.close, color: theme.colors.textSecondary)),
                    ],
                  ),
                  const SizedBox(height: 8),
                  SavvyText(
                    currency.format(widget.totalAmount),
                    style: SavvyTextStyle.h1,
                    color: theme.colors.brandPrimary,
                  ),
                  
                  const Spacer(),
                  
                  if (_selectedMethod == 'CASH') ...[
                    SavvyBox(
                      color: theme.colors.bgElevated,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SavvyText("Tendered", style: SavvyTextStyle.bodyMedium),
                              SavvyText(currency.format(_enteredAmount), style: SavvyTextStyle.h3),
                            ],
                          ),
                          Divider(color: theme.colors.borderDefault),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SavvyText("Change", style: SavvyTextStyle.bodyMedium, color: theme.colors.stateSuccess),
                              SavvyText(currency.format(_change), style: SavvyTextStyle.h2, color: theme.colors.stateSuccess),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 32),
                  ],
                  
                  SizedBox(
                    height: 56,
                    child: ElevatedButton(
                      onPressed: _canPay ? _processPayment : null,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: theme.colors.stateSuccess,
                        foregroundColor: theme.colors.textInverse,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(theme.shapes.radiusMd)),
                        // Ensure button looks disabled if canPay is false
                      ),
                      child: SavvyText(
                        _selectedMethod == 'CASH' 
                           ? "PAY ${currency.format(_enteredAmount > 0 ? widget.totalAmount : 0)}" 
                           : "CONFIRM PAYMENT",
                        style: SavvyTextStyle.h3, 
                        color: theme.colors.textInverse,
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildCashNumpad(SavvyTheme theme) {
    return Padding(
      padding: EdgeInsets.all(theme.shapes.spacingMd),
      child: Column(
        children: [
          // Display Field
          SavvyBox(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: theme.shapes.spacingMd, horizontal: theme.shapes.spacingLg),
            color: theme.colors.bgElevated,
            border: Border.all(color: theme.colors.brandPrimary),
            child: SavvyText(
              _cashInput.isEmpty ? '0.00' : '\$${double.parse(_cashInput).toStringAsFixed(2)}', // Rough formatting while typing
              style: SavvyTextStyle.h2,
              align: TextAlign.right,
            ),
          ),
          const SizedBox(height: 16),
          // Numpad Grid
          Expanded(
            child: LayoutBuilder(
              builder: (context, constraints) {
                final btnWidth = constraints.maxWidth / 3;
                final btnHeight = constraints.maxHeight / 4;
                return Wrap(
                  children: [
                    for (var i = 1; i <= 9; i++)
                      _NumKey(i.toString(), btnWidth, btnHeight, onTap: () => _addNum(i.toString())),
                    _NumKey('.', btnWidth, btnHeight, onTap: () => _addNum('.')),
                    _NumKey('0', btnWidth, btnHeight, onTap: () => _addNum('0')),
                    _NumKey('⌫', btnWidth, btnHeight, onTap: _backspace),
                  ],
                );
              }
            ),
          ),
          // Quick Amounts
          SizedBox(
            height: 50,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                _QuickAmountBtn(10.0),
                _QuickAmountBtn(20.0),
                _QuickAmountBtn(50.0),
                _QuickAmountBtn(100.0),
                _QuickAmountBtn(widget.totalAmount, label: "EXACT"),
              ],
            ),
          )
        ],
      ),
    );
  }
  
  Widget _buildTerminalWait(SavvyTheme theme) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          _selectedMethod == 'QRIS' ? Icons.qr_code_scanner : Icons.credit_card, 
          size: 80, 
          color: theme.colors.textMuted
        ),
        SizedBox(height: theme.shapes.spacingMd),
        SavvyText("Waiting for External Terminal...", style: SavvyTextStyle.h3, color: theme.colors.textSecondary),
        SizedBox(height: theme.shapes.spacingSm),
        SavvyText("Please complete payment on device", style: SavvyTextStyle.bodyMedium, color: theme.colors.textMuted),
      ],
    );
  }

  void _addNum(String val) {
    if (val == '.' && _cashInput.contains('.')) return;
    setState(() {
      _cashInput += val;
    });
  }

  void _backspace() {
    if (_cashInput.isNotEmpty) {
      setState(() {
        _cashInput = _cashInput.substring(0, _cashInput.length - 1);
      });
    }
  }

  void _processPayment() {
    widget.cartBloc.add(CartEvent.checkoutProcessed(
      paymentMethod: _selectedMethod,
      tenderedAmount: _selectedMethod == 'CASH' ? _enteredAmount : widget.totalAmount, // External assumed exact
      changeAmount: _selectedMethod == 'CASH' ? _change : 0.0,
    ));
    Navigator.pop(context);
  }
  
  Widget _NumKey(String label, double w, double h, {required VoidCallback onTap}) {
    return SizedBox(
      width: w,
      height: h,
      child: TextButton(
        onPressed: onTap,
        child: Text(label, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
      ),
    );
  }
  
  Widget _QuickAmountBtn(double amount, {String? label}) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: OutlinedButton(
        onPressed: () => setState(() => _cashInput = amount.toString()),
        child: Text(label ?? "\$${amount.toStringAsFixed(0)}"),
      ),
    );
  }
}

class _PaymentMethodCard extends StatelessWidget {
  final String label;
  final IconData icon;
  final bool isSelected;
  final VoidCallback onTap;

  const _PaymentMethodCard({required this.label, required this.icon, required this.isSelected, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final theme = context.savvy;
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: theme.motion.durationFast,
        width: 100,
        height: 80,
        decoration: BoxDecoration(
          color: isSelected ? theme.colors.brandPrimary : theme.colors.bgElevated,
          borderRadius: BorderRadius.circular(theme.shapes.radiusMd),
          border: Border.all(
            color: isSelected ? theme.colors.brandPrimary : theme.colors.borderDefault,
            width: 2,
          ),
          boxShadow: isSelected ? theme.elevations.floating : theme.elevations.sm,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: isSelected ? theme.colors.textInverse : theme.colors.textPrimary),
            const SizedBox(height: 4),
            SavvyText(
              label, 
              style: SavvyTextStyle.label, 
              color: isSelected ? theme.colors.textInverse : theme.colors.textPrimary
            ),
          ],
        ),
      ),
    );
  }
}
