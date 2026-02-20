import 'package:flutter/material.dart';

class NumpadWidget extends StatelessWidget {
  final Function(String) onKeyPressed;
  final VoidCallback onClear;
  final VoidCallback onBackspace;

  const NumpadWidget({
    super.key,
    required this.onKeyPressed,
    required this.onClear,
    required this.onBackspace,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final buttonSize = constraints.maxWidth / 3 - 8; // approx size with spacing
        return Column(
          children: [
            _buildRow(['1', '2', '3'], buttonSize),
            const SizedBox(height: 8),
            _buildRow(['4', '5', '6'], buttonSize),
            const SizedBox(height: 8),
            _buildRow(['7', '8', '9'], buttonSize),
            const SizedBox(height: 8),
            _buildRow(['C', '0', 'DEL'], buttonSize),
          ],
        );
      },
    );
  }

  Widget _buildRow(List<String> keys, double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: keys.map((key) {
        return SizedBox(
          width: size,
          height: size * 0.7,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.zero,
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              elevation: 1,
            ),
            onPressed: () {
              if (key == 'C') {
                onClear();
              } else if (key == 'DEL') {
                onBackspace();
              } else {
                onKeyPressed(key);
              }
            },
            child: key == 'DEL' 
               ? const Icon(Icons.backspace_outlined) 
               : Text(key, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          ),
        );
      }).toList(),
    );
  }
}
