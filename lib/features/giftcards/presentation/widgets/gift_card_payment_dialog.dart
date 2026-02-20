import 'package:flutter/material.dart';
import 'package:savvy_pos/core/di/injection.dart';
import 'package:savvy_pos/features/giftcards/domain/entities/gift_card.dart';
import 'package:savvy_pos/features/giftcards/domain/repositories/i_gift_card_repository.dart';

class GiftCardPaymentDialog extends StatefulWidget {
  final double totalDue;

  const GiftCardPaymentDialog({super.key, required this.totalDue});

  @override
  State<GiftCardPaymentDialog> createState() => _GiftCardPaymentDialogState();
}

class _GiftCardPaymentDialogState extends State<GiftCardPaymentDialog> {
  final _codeCtrl = TextEditingController();
  final _amountCtrl = TextEditingController(); // To customize redemption amount
  
  final _repo = getIt<IGiftCardRepository>();
  
  bool _isLoading = false;
  GiftCard? _card;
  String? _error;

  @override
  void initState() {
    super.initState();
    _amountCtrl.text = widget.totalDue.toStringAsFixed(2);
  }

  Future<void> _checkBalance() async {
    final code = _codeCtrl.text;
    if (code.isEmpty) return;

    setState(() { _isLoading = true; _error = null; _card = null; });

    try {
      // Try by number, then barcode
      // Or search repo smarts? Repo has getGiftCardByNumber
      final card = await _repo.getGiftCardByNumber(code) ?? await _repo.getGiftCardByBarcode(code);
      
      if (mounted) {
        setState(() {
          _isLoading = false;
          _card = card;
          if (card == null) {
            _error = "Card not found";
          } else if (!card.isUsable) {
            _error = "Card is ${card.status.displayName} or empty";
          } else {
            // Auto-adjust amount if card balance < due
            final redemptAmount = card.currentBalance < widget.totalDue 
                ? card.currentBalance 
                : widget.totalDue;
            _amountCtrl.text = redemptAmount.toStringAsFixed(2);
          }
        });
      }
    } catch (e) {
      if (mounted) setState(() { _isLoading = false; _error = e.toString(); });
    }
  }

  Future<void> _redeem() async {
    if (_card == null) return;
    
    final amount = double.tryParse(_amountCtrl.text) ?? 0;
    if (amount <= 0) return;
    if (amount > _card!.currentBalance) {
      setState(() => _error = "Insufficient balance on card");
      return;
    }

    // Return the result to the caller (POS Page)
    // The actual redemption transaction should happen here or be delegated?
    // Usually PAYMENT happens here.
    
    setState(() => _isLoading = true);
    
    try {
      // We don't have order ID yet if we are in "Cart" mode.
      // IF this dialog is called DURING checkout, we might just return the payment method info
      // OR we tentatively hold it? 
      // For POS simplicity: We return the 'Authorized' amount and card details. 
      // The POS Bloc will finalize transaction.
      
      // BUT IGiftCardRepository.redeemGiftCard requires orderUuid.
      // If we are just COLLECTING payment, we might not have order created yet?
      // Assuming POS flow: Order Created -> Payment Selection.
      
      Navigator.pop(context, {
        'cardUuid': _card!.uuid,
        'amount': amount,
        'cardNumber': _card!.cardNumber,
      });
      
    } catch (e) {
      setState(() => _error = e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Gift Card Payment'),
      content: SizedBox(
        width: 400,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
             Row(
               children: [
                 Expanded(
                   child: TextField(
                     controller: _codeCtrl, 
                     decoration: const InputDecoration(labelText: 'Card Number / Barcode', border: OutlineInputBorder()),
                     onSubmitted: (_) => _checkBalance(),
                   ),
                 ),
                 IconButton(icon: const Icon(Icons.search), onPressed: _checkBalance),
                 // IconButton(icon: const Icon(Icons.qr_code), onPressed: () {}), // TODO Scan
               ],
             ),
             
             if (_isLoading) const Padding(padding: EdgeInsets.all(16.0), child: LinearProgressIndicator()),
             
             if (_error != null)
               Padding(padding: const EdgeInsets.only(top: 8.0), child: Text(_error!, style: const TextStyle(color: Colors.red))),
               
             if (_card != null && _card!.isUsable) ...[
               const SizedBox(height: 16),
               Container(
                 padding: const EdgeInsets.all(12),
                 color: Colors.green.shade50,
                 child: Column(
                   children: [
                     Text('Balance: \$${_card!.currentBalance.toStringAsFixed(2)}', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.green)),
                     if (_card!.customerName != null) Text('Holder: ${_card!.customerName}'),
                   ],
                 ),
               ),
               const SizedBox(height: 16),
               TextField(
                 controller: _amountCtrl,
                 decoration: const InputDecoration(labelText: 'Redeem Amount', border: OutlineInputBorder()),
                 keyboardType: TextInputType.number,
               ),
             ]
          ],
        ),
      ),
      actions: [
        TextButton(onPressed: () => Navigator.pop(context), child: const Text('Cancel')),
        ElevatedButton(
          onPressed: (_card != null && _card!.isUsable && !_isLoading) ? _redeem : null,
          child: const Text('Charge Card'),
        ),
      ],
    );
  }
}
