import 'package:flutter/material.dart';
import 'package:savvy_pos/core/config/theme/savvy_theme.dart';
import 'package:savvy_pos/core/presentation/widgets/savvy_text.dart';
import 'package:savvy_pos/features/pos/presentation/bloc/cart/cart_bloc.dart';
import 'package:savvy_pos/features/pos/presentation/bloc/cart/cart_event.dart';

class PaymentMethodsDialog extends StatefulWidget {
  final double totalAmount;
  final CartBloc cartBloc;

  const PaymentMethodsDialog({super.key, required this.totalAmount, required this.cartBloc});

  @override
  State<PaymentMethodsDialog> createState() => _PaymentMethodsDialogState();
}

class _PaymentMethodsDialogState extends State<PaymentMethodsDialog> {
  String _input = '0';
  String _selectedMethod = 'CASH'; // CASH, CARD, QRIS

  @override
  Widget build(BuildContext context) {
    final theme = context.savvy;
    final size = MediaQuery.of(context).size;
    
    // Parse input
    double tenderAmount = double.tryParse(_input) ?? 0.0;
    if (_input.isEmpty) tenderAmount = 0.0;
    
    double change = tenderAmount - widget.totalAmount;
    if (change < 0) change = 0;

    return Dialog(
      backgroundColor: theme.colors.bgElevated,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(theme.shapes.radiusLg)),
      child: SizedBox(
        width: size.width > 900 ? 800 : size.width * 0.9,
        height: size.height > 600 ? 600 : size.height * 0.9,
        child: Row(
          children: [
            // LEFT PANEL: Payment Methods & Summary
            Expanded(
              flex: 4,
              child: Container(
                padding: EdgeInsets.all(theme.shapes.spacingLg),
                decoration: BoxDecoration(
                  border: Border(right: BorderSide(color: theme.colors.borderDefault)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SavvyText('Payment Method', style: SavvyTextStyle.h3, color: theme.colors.textPrimary),
                    SizedBox(height: theme.shapes.spacingMd),
                    
                    // Methods Grid
                    Expanded(
                      child: GridView.count(
                        crossAxisCount: 2,
                        crossAxisSpacing: theme.shapes.spacingSm,
                        mainAxisSpacing: theme.shapes.spacingSm,
                        childAspectRatio: 1.5,
                        children: [
                          _MethodCard(
                            label: 'CASH', 
                            icon: Icons.money, 
                            isSelected: _selectedMethod == 'CASH',
                            onTap: () => setState(() => _selectedMethod = 'CASH'),
                          ),
                          _MethodCard(
                            label: 'CARD', 
                            icon: Icons.credit_card, 
                             isSelected: _selectedMethod == 'CARD',
                            onTap: () => setState(() => _selectedMethod = 'CARD'),
                          ),
                          _MethodCard(
                            label: 'QRIS', 
                            icon: Icons.qr_code, 
                             isSelected: _selectedMethod == 'QRIS',
                            onTap: () => setState(() => _selectedMethod = 'QRIS'),
                          ),
                        ],
                      ),
                    ),
                    
                    // Summary Box
                    Container(
                      padding: EdgeInsets.all(theme.shapes.spacingMd),
                      decoration: BoxDecoration(
                        color: theme.colors.bgPrimary,
                        borderRadius: BorderRadius.circular(theme.shapes.radiusMd),
                      ),
                      child: Column(
                        children: [
                          _buildSummaryLine('Total Due', widget.totalAmount, theme, isBold: true),
                          SizedBox(height: 8),
                          _buildSummaryLine('Tendered', tenderAmount, theme),
                          Divider(),
                          _buildSummaryLine('Change', change, theme, isHighlight: true),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            
            // RIGHT PANEL: Numpad (Only visible for CASH usually, but let's keep it generally open or make it reactive)
            // If Card/QRIS, maybe show instruction. Assuming CASH flow mainly for numpad.
            if (_selectedMethod == 'CASH')
            Expanded(
              flex: 6,
              child: Column(
                children: [
                  // Amount Display
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(theme.shapes.spacingLg),
                    color: theme.colors.bgPrimary, // slightly visible header for numpad
                    alignment: Alignment.centerRight,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        SavvyText('Enter Cash Amount', style: SavvyTextStyle.label, color: theme.colors.textSecondary),
                        FittedBox(
                          child: SavvyText(
                            '\$${_input == '0' ? '0.00' : double.parse(_input).toStringAsFixed(2)}', 
                            textStyle: TextStyle(fontSize: 48, fontWeight: FontWeight.bold, color: theme.colors.brandPrimary),
                          ),
                        ),
                      ],
                    ),
                  ),
                  
                  // Quick Cash Buttons
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: theme.shapes.spacingMd, vertical: theme.shapes.spacingSm),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _QuickCashBtn('\$Exact', () => setState(() => _input = widget.totalAmount.toStringAsFixed(2))),
                        _QuickCashBtn('\$10', () => setState(() => _input = '10')),
                        _QuickCashBtn('\$20', () => setState(() => _input = '20')),
                        _QuickCashBtn('\$50', () => setState(() => _input = '50')),
                      ],
                    ),
                  ),

                  // Numpad Grid
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(theme.shapes.spacingMd),
                      child: LayoutBuilder(
                        builder: (ctx, constraints) {
                          return GridView.count(
                            crossAxisCount: 3,
                            childAspectRatio: (constraints.maxWidth / 3) / (constraints.maxHeight / 5),
                            physics: NeverScrollableScrollPhysics(),
                            children: [
                              _NumpadBtn('1', () => _addNum('1')),
                              _NumpadBtn('2', () => _addNum('2')),
                              _NumpadBtn('3', () => _addNum('3')),
                              _NumpadBtn('4', () => _addNum('4')),
                              _NumpadBtn('5', () => _addNum('5')),
                              _NumpadBtn('6', () => _addNum('6')),
                              _NumpadBtn('7', () => _addNum('7')),
                              _NumpadBtn('8', () => _addNum('8')),
                              _NumpadBtn('9', () => _addNum('9')),
                              _NumpadBtn('C', () => setState(() => _input = '0'), isDestructive: true),
                              _NumpadBtn('0', () => _addNum('0')),
                              _NumpadBtn('.', () => _addNum('.')), // Decimal
                            ],
                          );
                        }
                      ),
                    ),
                  ),
                  
                  // PAY BUTTON
                  Padding(
                    padding: EdgeInsets.all(theme.shapes.spacingMd),
                    child: SizedBox(
                      width: double.infinity,
                      height: 60,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: theme.colors.stateSuccess,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(theme.shapes.radiusMd)),
                        ),
                        onPressed: tenderAmount >= widget.totalAmount 
                          ? () {
						  widget.cartBloc.add(CartEvent.checkoutProcessed(
                              paymentMethod: 'CASH',
                              tenderedAmount: tenderAmount,
                              changeAmount: change,
                          ));
                              Navigator.pop(context); // Close Payment Dialog
                              // Success Dialog triggered by Bloc Listener in PosPage or CartView
                            }
                          : null,
                        child: SavvyText(
                           tenderAmount >= widget.totalAmount ? 'PAY' : 'INSUFFICIENT FUNDS',
                           style: SavvyTextStyle.h3, 
                           color: theme.colors.textInverse
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
            else
             // Non-Cash Placeholder
             Expanded(
               flex: 6,
               child: Center(
                 child: Column(
                   mainAxisSize: MainAxisSize.min,
                   children: [
                     Icon(
                       _selectedMethod == 'CARD' ? Icons.credit_card : Icons.qr_code_2, 
                       size: 80, 
                       color: theme.colors.textMuted
                     ),
                     SizedBox(height: 16),
                     SavvyText('Follow instructions on terminal', style: SavvyTextStyle.h3, color: theme.colors.textSecondary),
                     SizedBox(height: 32),
                     ElevatedButton(
                       onPressed: () {
                         widget.cartBloc.add(CartEvent.checkoutProcessed(
                              paymentMethod: _selectedMethod,
                              tenderedAmount: widget.totalAmount,
                          ));
                       },
                       style: ElevatedButton.styleFrom(backgroundColor: theme.colors.brandPrimary),
                       child: Text('Simulate Success', style: TextStyle(color: Colors.white)),
                     )
                   ],
                 ),
               ),
             ),
          ],
        ),
      ),
    );
  }

  void _addNum(String char) {
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

  Widget _buildSummaryLine(String label, double val, SavvyTheme theme, {bool isBold = false, bool isHighlight = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SavvyText(label, style: isBold ? SavvyTextStyle.bodyLarge : SavvyTextStyle.bodyMedium, color: theme.colors.textSecondary),
        SavvyText(
          '\$${val.toStringAsFixed(2)}', 
          style: isHighlight ? SavvyTextStyle.h3 : (isBold ? SavvyTextStyle.h3 : SavvyTextStyle.bodyMedium), 
          color: isHighlight ? theme.colors.stateSuccess : theme.colors.textPrimary
        ),
      ],
    );
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
        decoration: BoxDecoration(
          color: isSelected ? theme.colors.brandPrimary : theme.colors.bgPrimary,
          borderRadius: BorderRadius.circular(theme.shapes.radiusMd),
          border: Border.all(color: isSelected ? theme.colors.brandPrimary : theme.colors.borderDefault),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: isSelected ? theme.colors.textInverse : theme.colors.textSecondary),
            SizedBox(height: 8),
            SavvyText(label, style: SavvyTextStyle.label, color: isSelected ? theme.colors.textInverse : theme.colors.textSecondary),
          ],
        ),
      ),
    );
  }
}

class _NumpadBtn extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  final bool isDestructive;

  const _NumpadBtn(this.label, this.onTap, {this.isDestructive = false});

  @override
  Widget build(BuildContext context) {
    final theme = context.savvy;
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(theme.shapes.radiusMd),
        child: Container(
          decoration: BoxDecoration(
            color: isDestructive ? theme.colors.stateError.withValues(alpha: 0.1) : theme.colors.bgElevated,
            borderRadius: BorderRadius.circular(theme.shapes.radiusMd),
            border: Border.all(color: theme.colors.borderDefault),
          ),
          alignment: Alignment.center,
          child: Text(
            label,
            style: TextStyle(
              fontSize: 24, 
              fontWeight: FontWeight.bold, 
              color: isDestructive ? theme.colors.stateError : theme.colors.textPrimary
            ),
          ),
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
