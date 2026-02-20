import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:savvy_pos/core/config/theme/savvy_theme.dart';
import 'package:savvy_pos/core/presentation/widgets/savvy_text.dart';
import 'package:savvy_pos/features/pos/presentation/bloc/cart/cart_bloc.dart';
import 'dart:async';
import 'package:savvy_pos/features/pos/presentation/widgets/payment/smart_cash_helper.dart';
import 'package:savvy_pos/features/pos/presentation/bloc/cart/cart_event.dart';

class PaymentMethodsSheet extends StatefulWidget {
  final double totalAmount;

  const PaymentMethodsSheet({super.key, required this.totalAmount});

  @override
  State<PaymentMethodsSheet> createState() => _PaymentMethodsSheetState();
}

class _PaymentMethodsSheetState extends State<PaymentMethodsSheet> {
  String _input = '0';
  String _selectedMethod = 'CASH'; // CASH, CARD, QRIS

  @override
  Widget build(BuildContext context) {
    final theme = context.savvy;
    // Parse input
    double tenderAmount = double.tryParse(_input) ?? 0.0;
    if (_input.isEmpty) tenderAmount = 0.0;
    
    double change = tenderAmount - widget.totalAmount;
    if (change < 0) change = 0;

    return DraggableScrollableSheet(
      initialChildSize: 0.85,
      minChildSize: 0.5,
      maxChildSize: 0.95,
      builder: (context, scrollController) {
        return Container(
          decoration: BoxDecoration(
            color: theme.colors.bgElevated,
            borderRadius: BorderRadius.vertical(top: Radius.circular(theme.shapes.radiusLg)),
            boxShadow: [
              BoxShadow(color: Colors.black26, blurRadius: 20, offset: const Offset(0, -5))
            ],
          ),
          child: Column(
            children: [
              // HANDLE BAR
              Center(
                child: Container(
                  width: 40,
                  height: 4,
                  margin: EdgeInsets.symmetric(vertical: theme.shapes.spacingSm),
                  decoration: BoxDecoration(
                    color: theme.colors.borderDefault,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),

              // SCROLLABLE CONTENT
              Expanded(
                child: SingleChildScrollView(
                  controller: scrollController,
                  child: Padding(
                    padding: EdgeInsets.all(theme.shapes.spacingMd),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        // HEADER
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SavvyText('Payment', style: SavvyTextStyle.h2, color: theme.colors.textPrimary),
                            IconButton(
                              icon: const Icon(Icons.close),
                              onPressed: () => Navigator.pop(context),
                            )
                          ],
                        ),
                        SizedBox(height: theme.shapes.spacingMd),
                        
                        // LAYOUT: Responsive if needed, but for Sheet usually Stacked.
                        // For tablet landscape, maybe Row? But Sheet is bottom-up.
                        // Let's keep it vertical stack for "Mobile-First" liquid feel, works on tablet too.

                        // 1. PAYMENT METHODS
                        SavvyText('Select Method', style: SavvyTextStyle.label, color: theme.colors.textSecondary),
                        SizedBox(height: theme.shapes.spacingSm),
                        SizedBox(
                          height: 80,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              _MethodCard(
                                label: 'CASH', 
                                icon: Icons.money, 
                                isSelected: _selectedMethod == 'CASH',
                                onTap: () => setState(() => _selectedMethod = 'CASH'),
                              ),
                              SizedBox(width: theme.shapes.spacingSm),
                              _MethodCard(
                                label: 'CARD', 
                                icon: Icons.credit_card, 
                                isSelected: _selectedMethod == 'CARD',
                                onTap: () => setState(() => _selectedMethod = 'CARD'),
                              ),
                              SizedBox(width: theme.shapes.spacingSm),
                              _MethodCard(
                                label: 'QRIS', 
                                icon: Icons.qr_code, 
                                isSelected: _selectedMethod == 'QRIS',
                                onTap: () => setState(() => _selectedMethod = 'QRIS'),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: theme.shapes.spacingLg),

                        // 2. SUMMARY (Compact)
                        Container(
                          padding: EdgeInsets.all(theme.shapes.spacingMd),
                          decoration: BoxDecoration(
                            color: theme.colors.bgPrimary,
                            borderRadius: BorderRadius.circular(theme.shapes.radiusMd),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SavvyText('Total Due', style: SavvyTextStyle.bodyLarge, color: theme.colors.textSecondary),
                              SavvyText('\$${widget.totalAmount.toStringAsFixed(2)}', style: SavvyTextStyle.h2, color: theme.colors.brandPrimary),
                            ],
                          ),
                        ),
                        SizedBox(height: theme.shapes.spacingLg),

                        // 3. INPUT AREA (If Cash)
                        if (_selectedMethod == 'CASH') ...[
                          Container(
                            padding: EdgeInsets.all(theme.shapes.spacingMd),
                            decoration: BoxDecoration(
                              border: Border.all(color: theme.colors.borderDefault),
                              borderRadius: BorderRadius.circular(theme.shapes.radiusMd),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                SavvyText('Tendered Amount', style: SavvyTextStyle.label, color: theme.colors.textSecondary),
                                SavvyText(
                                  '\$${_input == '0' ? '0.00' : double.parse(_input).toStringAsFixed(2)}', 
                                  textStyle: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: theme.colors.textPrimary),
                                ),
                                Divider(),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    SavvyText('Change', style: SavvyTextStyle.bodyMedium, color: theme.colors.textSecondary),
                                    SavvyText('\$${change.toStringAsFixed(2)}', style: SavvyTextStyle.h3, color: theme.colors.stateSuccess),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: theme.shapes.spacingMd),
                          
                          // Smart Cash Suggestions
                          Builder(builder: (context) {
                            final suggestions = SmartCashHelper.generateSuggestions(widget.totalAmount);
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: suggestions.map((amount) {
                                final isExact = amount == widget.totalAmount;
                                final label = isExact ? 'Exact' : '\$${amount.toStringAsFixed(0)}'; // Or 2 decimals if needed
                                
                                return _QuickCashBtn(label, () => _handleSmartCash(amount));
                              }).toList(),
                            );
                          }),
                          SizedBox(height: theme.shapes.spacingMd),

                          // Numpad
                          _SimpleNumpad(
                            onTap: _addNum, 
                            onClear: () => setState(() => _input = '0'),
                          ),
                        ] else ...[
                          // Card/QR Instruction
                          SizedBox(height: 40),
                          Center(
                            child: Column(
                              children: [
                                Icon(Icons.payment, size: 64, color: theme.colors.brandSecondary),
                                SizedBox(height: 16),
                                SavvyText('Use Terminal to Complete Payment', style: SavvyTextStyle.bodyLarge),
                              ],
                            ),
                          ),
                          SizedBox(height: 40),
                        ],

                        SizedBox(height: 80), // Bottom padding for FAB/Button space
                      ],
                    ),
                  ),
                ),
              ),
              
              // STICKY BOTTOM BUTTON
              Padding(
                padding: EdgeInsets.all(theme.shapes.spacingMd),
                child: SizedBox(
                   width: double.infinity,
                   height: 56,
                   child: ElevatedButton(
                     style: ElevatedButton.styleFrom(
                       backgroundColor: theme.colors.stateSuccess,
                       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(theme.shapes.radiusMd)),
                       elevation: 4,
                     ),
                     onPressed: (tenderAmount >= widget.totalAmount || _selectedMethod != 'CASH')
                       ? () {
                           context.read<CartBloc>().add(CartEvent.checkoutProcessed(
                             paymentMethod: _selectedMethod,
                             tenderedAmount: tenderAmount,
                           ));
                           Navigator.pop(context); // Close Sheet
                         }
                       : null,
                     child: SavvyText(
                        (tenderAmount >= widget.totalAmount || _selectedMethod != 'CASH') ? 'CONFIRM PAYMENT' : 'INSUFFICIENT FUNDS',
                        style: SavvyTextStyle.h3, 
                        color: theme.colors.textInverse
                     ),
                   ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Timer? _smartPayTimer;

  void _handleSmartCash(double amount) {
    // 1. Set Input
    setState(() {
       _input = amount.toStringAsFixed(2);
    });

    // 2. Cancel previous timer if any
    _smartPayTimer?.cancel();

    // 3. Show Local Feedback (e.g. Toast or Snackbar)
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    final snackBar = SnackBar(
      content: Row(
        children: [
           SizedBox(width: 20, height: 20, child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white)),
           SizedBox(width: 16),
           Text('Paying \$${amount.toStringAsFixed(2)}...'),
        ],
      ),
      duration: const Duration(milliseconds: 1000), // Give slightly more visual time, but trigger fast
      action: SnackBarAction(
        label: 'UNDO', 
        textColor: Colors.white,
        onPressed: () {
           _smartPayTimer?.cancel();
        },
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);

    // 4. Buffer Timer
    _smartPayTimer = Timer(const Duration(milliseconds: 800), () { 
       // Trigger Checkout
       if (mounted) {
           ScaffoldMessenger.of(context).hideCurrentSnackBar();
           context.read<CartBloc>().add(CartEvent.checkoutProcessed(
             paymentMethod: 'CASH',
             tenderedAmount: amount, // or _input
           ));
           Navigator.pop(context); // Close Sheet
       }
    });
  }

  void _addNum(String char) {
    _smartPayTimer?.cancel(); // Cancel smart pay if manual input starts
    setState(() {
      if (char == '.') {
        if (!_input.contains('.')) _input += char;
      } else {
        if (_input == '0') {
          _input = char;
        } else {
          _input += char;
        }
      }
    });
  }
}

class _MethodCard extends StatelessWidget {
  final String label;
  final IconData icon;
  final bool isSelected;
  final VoidCallback onTap;

  const _MethodCard({required this.label, required this.icon, required this.isSelected, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final theme = context.savvy;
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(theme.shapes.radiusMd),
      child: Container(
        width: 100,
        decoration: BoxDecoration(
          color: isSelected ? theme.colors.brandPrimary : theme.colors.bgPrimary,
          borderRadius: BorderRadius.circular(theme.shapes.radiusMd),
          border: Border.all(color: isSelected ? theme.colors.brandPrimary : theme.colors.borderDefault),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: isSelected ? theme.colors.textInverse : theme.colors.textSecondary),
            SizedBox(height: 4),
            SavvyText(label, style: SavvyTextStyle.label, color: isSelected ? theme.colors.textInverse : theme.colors.textSecondary),
          ],
        ),
      ),
    );
  }
}

class _QuickCashBtn extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  
  const _QuickCashBtn(this.label, this.onTap);
  
   @override
  Widget build(BuildContext context) {
    final theme = context.savvy;
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(theme.shapes.radiusPill),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: theme.colors.bgElevated,
          border: Border.all(color: theme.colors.brandSecondary),
          borderRadius: BorderRadius.circular(theme.shapes.radiusPill),
        ),
        child: Text(label, style: TextStyle(color: theme.colors.brandSecondary, fontWeight: FontWeight.bold)),
      ),
    );
  }
}

class _SimpleNumpad extends StatelessWidget {
  final Function(String) onTap;
  final VoidCallback onClear;

  const _SimpleNumpad({required this.onTap, required this.onClear});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (ctx, constraints) {
        // Simple 3-column grid manually
        return Column(
          children: [
             _row(['1', '2', '3']),
             SizedBox(height: 8),
             _row(['4', '5', '6']),
             SizedBox(height: 8),
             _row(['7', '8', '9']),
             SizedBox(height: 8),
             _row(['C', '0', '.'], lastRow: true),
          ],
        );
      }
    );
  }

  Widget _row(List<String> keys, {bool lastRow = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: keys.map((k) => 
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: SizedBox(
              height: 50,
              child: _padBtn(k, lastRow && k == 'C'),
            ),
          ),
        )
      ).toList(),
    );
  }

  Widget _padBtn(String k, bool isClear) {
    return Builder(builder: (context) {
      final theme = context.savvy;
      return TextButton(
        onPressed: isClear ? onClear : () => onTap(k),
        style: TextButton.styleFrom(
           backgroundColor: isClear ? theme.colors.stateError.withValues(alpha: 0.1) : theme.colors.bgPrimary,
           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        child: Text(k, style: TextStyle(fontSize: 20, color: isClear ? theme.colors.stateError : theme.colors.textPrimary)),
      );
    });
  }
}
