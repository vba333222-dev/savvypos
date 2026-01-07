import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:savvy_pos/core/config/theme/savvy_theme.dart';
import 'package:savvy_pos/core/presentation/widgets/receipt_clipper.dart';
import 'package:savvy_pos/core/presentation/widgets/savvy_text.dart';
import 'package:savvy_pos/features/pos/presentation/bloc/cart/cart_state.dart';
import 'package:intl/intl.dart';

class DigitalReceiptWidget extends StatelessWidget {
  final List<CartItem> items;
  final double total;
  final double subtotal;
  final double tax;
  final double discount;
  final double change;
  final String orderNumber;
  final DateTime date;

  const DigitalReceiptWidget({
    super.key,
    required this.items,
    required this.total,
    required this.subtotal,
    required this.tax,
    required this.discount,
    required this.change,
    required this.orderNumber,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.savvy;
    final currency = NumberFormat.currency(symbol: '\$');
    final dateFormat = DateFormat('MMM dd, yyyy HH:mm');

    // Printing Animation Stagger
    final baseDelay = 300.ms;
    final stagger = 50.ms;

    return ClipPath(
      clipper: ReceiptZigZagClipper(sawToothDepth: 10, density: 16),
      child: Container(
        width: 380,
        color: const Color(0xFFF8F8F5), // Paper White (Warm)
        padding: const EdgeInsets.fromLTRB(24, 32, 24, 48), // Bottom padding for clipper
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
             // HEADER: Animated Checkmark
             Container(
               padding: const EdgeInsets.all(12),
               decoration: BoxDecoration(
                 shape: BoxShape.circle,
                 border: Border.all(color: theme.colors.stateSuccess, width: 3),
               ),
               child: Icon(Icons.check, size: 32, color: theme.colors.stateSuccess)
                 .animate(delay: baseDelay + 200.ms).scale(duration: 400.ms, curve: Curves.elasticOut),
             ).animate(delay: baseDelay).scale(duration: 400.ms, curve: Curves.easeOutBack),
             
             SizedBox(height: 16),
             SavvyText('PAYMENT SUCCESS', style: SavvyTextStyle.h3.copyWith(color: theme.colors.stateSuccess), textAlign: TextAlign.center)
               .animate(delay: baseDelay + stagger).fadeIn().moveY(begin: 10, end: 0),
             
             SizedBox(height: 8),
             Text('Savvy Store #123', style: TextStyle(color: theme.colors.textSecondary, fontSize: 12))
               .animate(delay: baseDelay + stagger * 2).fadeIn(),

             SizedBox(height: 24),
             Divider(color: theme.colors.borderDefault, height: 1)
               .animate(delay: baseDelay + stagger * 3).scaleX(alignment: Alignment.centerLeft, duration: 400.ms),
             SizedBox(height: 16),

             // METADATA
             _RowPair('Order #', orderNumber, delay: baseDelay + stagger * 4),
             _RowPair('Date', dateFormat.format(date), delay: baseDelay + stagger * 5),
             
             SizedBox(height: 16),
             Divider(color: theme.colors.borderDefault, dashed: true)
                .animate(delay: baseDelay + stagger * 6).fadeIn(),
             SizedBox(height: 16),

             // ITEMS
             ...items.asMap().entries.map((entry) {
                final index = entry.key;
                final item = entry.value;
                return Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                       Text('${item.quantity}x', style: TextStyle(fontWeight: FontWeight.bold, color: theme.colors.textPrimary)),
                       SizedBox(width: 8),
                       Expanded(
                         child: Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                             Text(item.product.name, style: TextStyle(color: theme.colors.textPrimary)),
                             if (item.modifiers.isNotEmpty)
                               Text(
                                 item.modifiers.map((e) => e.name).join(', '), 
                                 style: TextStyle(fontSize: 10, color: theme.colors.textMuted)
                               ),
                           ],
                         ),
                       ),
                       Text(currency.format(item.total), style: TextStyle(color: theme.colors.textPrimary)),
                    ],
                  ).animate(delay: baseDelay + stagger * (7 + index)).fadeIn().moveX(begin: 10, end: 0),
                );
             }).toList(),

             SizedBox(height: 16),
             Divider(color: theme.colors.borderDefault, height: 1)
               .animate(delay: baseDelay + stagger * (8 + items.length)).fadeIn(),
             SizedBox(height: 16),

             // TOTALS
             _RowPair('Subtotal', currency.format(subtotal), delay: baseDelay + stagger * (9 + items.length)),
             if (discount > 0)
               _RowPair('Discount', '-${currency.format(discount)}', color: theme.colors.stateSuccess, delay: baseDelay + stagger * (10 + items.length)),
             _RowPair('Tax', currency.format(tax), delay: baseDelay + stagger * (11 + items.length)),
             
             SizedBox(height: 16),
             Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                  Text('TOTAL', style: SavvyTextStyle.h3),
                  Text(currency.format(total), style: SavvyTextStyle.h2),
               ],
             ).animate(delay: baseDelay + stagger * (12 + items.length)).scale(curve: Curves.elasticOut, duration: 500.ms),

             if (change > 0) ...[
               SizedBox(height: 12),
               Container(
                 padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                 decoration: BoxDecoration(
                   color: theme.colors.bgPrimary,
                   borderRadius: BorderRadius.circular(4),
                   border: Border.all(color: theme.colors.borderDefault),
                 ),
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                      Text('CHANGE DUE', style: TextStyle(fontWeight: FontWeight.bold, color: theme.colors.textSecondary)),
                      Text(currency.format(change), style: TextStyle(fontWeight: FontWeight.bold, color: theme.colors.textPrimary)),
                   ],
                 ),
               ).animate(delay: baseDelay + stagger * (13 + items.length)).fadeIn().moveY(begin: 10, end: 0),
             ],
             
             SizedBox(height: 32),
             
             // BARCODE DUMMY
             Container(
               height: 40,
               width: 200,
               color: Colors.black12, // Placeholder
               child: Center(child: Text('||| || ||| || |||', style: TextStyle(fontFamily: 'Courier', letterSpacing: 4))),
             ).animate(delay: baseDelay + stagger * (14 + items.length)).fadeIn(),
             
             SizedBox(height: 8),
             Text('Thank you for shopping!', style: SavvyTextStyle.labelMedium.copyWith(color: theme.colors.textSecondary))
               .animate(delay: baseDelay + stagger * (15 + items.length)).fadeIn(),
          ],
        ),
      ),
    );
  }
}

class _RowPair extends StatelessWidget {
  final String label;
  final String value;
  final Color? color;
  final Duration delay;

  const _RowPair(this.label, this.value, {this.color, required this.delay});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: TextStyle(fontSize: 14, color: Colors.black54)),
          Text(value, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: color ?? Colors.black87)),
        ],
      ),
    ).animate(delay: delay).fadeIn().moveX(begin: -5, end: 0);
  }
}

extension DividerDashed on Divider {
   // Reusing the extension idea if we want custom painter later, 
   // but for now standard Divider is used.
}
