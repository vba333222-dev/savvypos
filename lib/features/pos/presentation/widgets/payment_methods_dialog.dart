import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:savvy_pos/core/config/theme_config.dart';
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

class _PaymentMethodsDialogState extends State<PaymentMethodsDialog> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final TextEditingController _cashCtrl = TextEditingController();
  
  // Payment Types
  final List<String> _methods = ['CASH', 'QRIS', 'CARD'];
  int _selectedIndex = 0;
  
  double _change = 0.0;
  double _enteredAmount = 0.0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(() {
      setState(() => _selectedIndex = _tabController.index);
    });
    
    _cashCtrl.addListener(_calculateChange);
  }
  
  void _calculateChange() {
    final val = double.tryParse(_cashCtrl.text) ?? 0.0;
    setState(() {
      _enteredAmount = val;
      _change = val - widget.totalAmount;
    });
  }

  void _onPay() {
    final method = _methods[_selectedIndex];
    
    // Validation for CASH
    if (method == 'CASH') {
      if (_enteredAmount < widget.totalAmount) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Insufficient amount')),
        );
        return;
      }
      
      widget.cartBloc.add(CartEvent.checkoutProcessed(
        paymentMethod: method,
        tenderedAmount: _enteredAmount,
        changeAmount: _change,
      ));
    } else {
      // For QRIS/CARD assume exact payment for now or manual terminal
      widget.cartBloc.add(CartEvent.checkoutProcessed(
        paymentMethod: method,
        tenderedAmount: widget.totalAmount,
        changeAmount: 0.0,
      ));
    }
    
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.savvy.colors;
    final typography = Theme.of(context).textTheme;
    final shapes = context.savvy.shapes;
    
    final currency = NumberFormat.currency(locale: 'en_US', symbol: '\$');

    return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(shapes.radiusLg)),
        backgroundColor: colors.bgPrimary,
        child: Container(
          width: 500,
          constraints: const BoxConstraints(maxHeight: 600),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Header
              Container(
                padding: EdgeInsets.all(shapes.spacingLg),
                decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: colors.borderDefault)),
                ),
                child: Row(
                  children: [
                    Text('Payment', style: typography.titleLarge?.copyWith(fontWeight: FontWeight.bold)),
                    const Spacer(),
                    IconButton(icon: const Icon(Icons.close), onPressed: () => Navigator.pop(context)),
                  ],
                ),
              ),
              
              // Total Display
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(shapes.spacingLg),
                color: colors.brandPrimary.withOpacity(0.1),
                child: Column(
                  children: [
                    Text('Total Amount', style: typography.bodyMedium),
                    const SizedBox(height: 4),
                    Text(
                      currency.format(widget.totalAmount),
                      style: typography.displaySmall?.copyWith(
                        color: colors.brandPrimary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),

              // Tabs
              TabBar(
                controller: _tabController,
                labelColor: colors.brandPrimary,
                unselectedLabelColor: colors.textSecondary,
                indicatorColor: colors.brandPrimary,
                tabs: const [
                  Tab(icon: Icon(Icons.money), text: 'Cash'),
                  Tab(icon: Icon(Icons.qr_code), text: 'QRIS'),
                  Tab(icon: Icon(Icons.credit_card), text: 'Card'),
                ],
              ),
              
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    // CASH VIEW
                    Padding(
                      padding: EdgeInsets.all(shapes.spacingLg),
                      child: Column(
                        children: [
                          TextField(
                            controller: _cashCtrl,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              labelText: 'Amount Tendered',
                              prefixText: '\$',
                              border: const OutlineInputBorder(),
                              errorText: (_enteredAmount > 0 && _enteredAmount < widget.totalAmount) 
                                ? 'Insufficient' : null,
                            ),
                            style: typography.headlineSmall,
                            autofocus: true,
                          ),
                          const SizedBox(height: 24),
                          // Quick suggestions could go here
                          if (_change > 0)
                            Container(
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: colors.stateSuccess.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Change Due:', style: typography.titleMedium?.copyWith(color: colors.stateSuccess)),
                                  Text(currency.format(_change), style: typography.headlineSmall?.copyWith(color: colors.stateSuccess, fontWeight: FontWeight.bold)),
                                ],
                              ),
                            ),
                        ],
                      ),
                    ),
                    
                    // QRIS VIEW
                    Center(child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.qr_code_2, size: 100, color: colors.textSecondary),
                        const SizedBox(height: 16),
                        const Text('Scan using Terminal or App'),
                        const SizedBox(height: 8),
                         const Text('Manual Verification Required', style: TextStyle(fontStyle: FontStyle.italic)),
                      ],
                    )),
                    
                    // CARD VIEW
                    Center(child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                         Icon(Icons.credit_card, size: 100, color: colors.textSecondary),
                         const SizedBox(height: 16),
                         const Text('Insert/Swipe Card on Terminal'),
                      ],
                    )),
                  ],
                ),
              ),
              
              // Action Button
              Padding(
                padding: EdgeInsets.all(shapes.spacingLg),
                child: SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () => _onPay(),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: colors.brandPrimary,
                      foregroundColor: colors.textInverse,
                    ),
                    child: Text(
                      'Confirm Payment', 
                      style: typography.titleMedium?.copyWith(fontWeight: FontWeight.bold)
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
    );
  }
}
