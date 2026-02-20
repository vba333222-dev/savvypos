import 'package:flutter/material.dart';
import 'package:savvy_pos/features/sales/presentation/widgets/numpad_widget.dart'; // Reuse the checkout numpad

class CashCountDialog extends StatefulWidget {
  final String title;
  final bool isBlind;
  final bool reasonField;
  final Function(double) onConfirm;

  const CashCountDialog({
    super.key,
    required this.title,
    required this.onConfirm,
    this.isBlind = false,
    this.reasonField = false,
  });

  @override
  State<CashCountDialog> createState() => _CashCountDialogState();
}

class _CashCountDialogState extends State<CashCountDialog> {
  String _input = '';

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: SizedBox(
        width: 400,
        height: 600,
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              Text(widget.title, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              if (widget.isBlind)
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    "BLIND COUNT: Enter total cash. You will not see the expected amount.",
                    style: TextStyle(color: Colors.red, fontStyle: FontStyle.italic),
                    textAlign: TextAlign.center,
                  ),
                ),
              const SizedBox(height: 16),
              
              // Display
              Container(
                padding: const EdgeInsets.all(16),
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  _input.isEmpty ? '\$0.00' : '\$$_input', 
                  style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 24),
              
              Expanded(
                child: NumpadWidget(
                  onKeyPressed: (key) {
                     setState(() {
                        if (_input.contains('.') && key == '.') return;
                        if (key == '.' && _input.isEmpty) {
                          _input = '0.';
                        } else {
                          _input += key;
                        }
                     });
                  },
                  onClear: () => setState(() => _input = ''),
                  onBackspace: () => setState(() => _input = _input.isNotEmpty ? _input.substring(0, _input.length - 1) : ''),
                ),
              ),
              
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blueAccent, foregroundColor: Colors.white),
                  onPressed: () {
                    final value = double.tryParse(_input) ?? 0.0;
                    widget.onConfirm(value);
                    Navigator.of(context).pop();
                  },
                  child: const Text('CONFIRM', style: TextStyle(fontWeight: FontWeight.bold))
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
