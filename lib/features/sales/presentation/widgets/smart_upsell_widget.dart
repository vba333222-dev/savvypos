import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:savvy_pos/core/presentation/widgets/savvy_text.dart';

class SmartUpsellWidget extends StatefulWidget {
  final List<String> currentCartItems;
  final Function(String, double) onAddItem;

  const SmartUpsellWidget({
    super.key,
    required this.currentCartItems,
    required this.onAddItem,
  });

  @override
  State<SmartUpsellWidget> createState() => _SmartUpsellWidgetState();
}

class _SmartUpsellWidgetState extends State<SmartUpsellWidget> {
  String? _suggestion;
  double _price = 0;

  @override
  void didUpdateWidget(covariant SmartUpsellWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.currentCartItems != widget.currentCartItems) {
      _analyzeCart();
    }
  }

  void _analyzeCart() {
    // Mocking "The Oracle" Logic Client-Side for responsiveness
    // In production, this would be cached rules or API call
    String? newSuggestion;
    double newPrice = 0;

    final cartStr = widget.currentCartItems.join(' ').toLowerCase();

    if (cartStr.contains('burger') && !cartStr.contains('fries')) {
      newSuggestion = 'Add French Fries';
      newPrice = 2.50;
    } else if (cartStr.contains('coffee') && !cartStr.contains('donut')) {
      newSuggestion = 'Add Glazed Donut';
      newPrice = 1.50;
    }

    if (newSuggestion != _suggestion) {
      setState(() {
        _suggestion = newSuggestion;
        _price = newPrice;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_suggestion == null) return const SizedBox.shrink();

    return GestureDetector(
      onTap: () {
        widget.onAddItem(_suggestion!.replaceAll('Add ', ''), _price);
        setState(() => _suggestion = null); // Dismiss after adding
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.purple.shade50, Colors.deepPurple.shade50]),
            borderRadius: BorderRadius.circular(30),
            border: Border.all(color: Colors.purple.shade100),
            boxShadow: [
              BoxShadow(
                  color: Colors.purple.withValues(alpha: 0.1),
                  blurRadius: 10,
                  offset: const Offset(0, 4))
            ]),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.auto_awesome, color: Colors.purple, size: 20)
                .animate(onPlay: (c) => c.repeat())
                .rotate(duration: 2.seconds),
            const SizedBox(width: 8),
            SavvyText.body(_suggestion!,
                color: Colors.purple.shade800,
                textStyle: const TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(width: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(12)),
              child: SavvyText.label('+\$${_price.toStringAsFixed(2)}',
                  color: Colors.purple),
            ),
          ],
        ),
      ),
    )
        .animate()
        .fadeIn()
        .slideX(begin: 0.1, curve: Curves.easeOutBack)
        .shimmer(duration: 2.seconds, delay: 1.seconds);
  }
}
