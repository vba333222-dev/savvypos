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
        padding: const EdgeInsets.fromLTRB(
            24, 32, 24, 48), // Bottom padding for clipper
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // LOGO
            Icon(Icons.storefront, size: 48, color: theme.colors.textPrimary),
            SizedBox(height: 8),
            SavvyText('SAVVY MARKET',
                style: SavvyTextStyle.h3, color: theme.colors.textPrimary),
            SavvyText('123 Innovation Dr, Tech City',
                style: SavvyTextStyle.labelMedium,
                color: theme.colors.textSecondary),
            SizedBox(height: 24),

            // DOTTED DIVIDER
            CustomPaint(
              size: Size(double.infinity, 1),
              painter: _DottedLinePainter(color: theme.colors.borderDefault),
            ),
            SizedBox(height: 16),

            // METADATA
            _RowPair('Order ID', orderNumber, delay: baseDelay),
            _RowPair('Date', dateFormat.format(date),
                delay: baseDelay + stagger),

            SizedBox(height: 16),
            CustomPaint(
              size: Size(double.infinity, 1),
              painter: _DottedLinePainter(color: theme.colors.borderDefault),
            ),
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
                    Text('${item.quantity}x',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: theme.colors.textPrimary)),
                    SizedBox(width: 8),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(item.product.name,
                              style:
                                  TextStyle(color: theme.colors.textPrimary)),
                          if (item.modifiers.isNotEmpty)
                            Text(item.modifiers.map((e) => e.name).join(', '),
                                style: TextStyle(
                                    fontSize: 10,
                                    color: theme.colors.textMuted)),
                        ],
                      ),
                    ),
                    Text(currency.format(item.total),
                        style: TextStyle(color: theme.colors.textPrimary)),
                  ],
                )
                    .animate(delay: baseDelay + stagger * (2 + index))
                    .fadeIn()
                    .moveX(begin: 10, end: 0),
              );
            }),

            SizedBox(height: 16),
            CustomPaint(
              size: Size(double.infinity, 1),
              painter: _DottedLinePainter(color: theme.colors.borderDefault),
            ),
            SizedBox(height: 16),

            // TOTALS
            _RowPair('Subtotal', currency.format(subtotal),
                delay: baseDelay + 300.ms),
            if (discount > 0)
              _RowPair('Discount', '-${currency.format(discount)}',
                  color: theme.colors.stateSuccess, delay: baseDelay + 350.ms),
            _RowPair('Tax', currency.format(tax), delay: baseDelay + 400.ms),

            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SavvyText('TOTAL', style: SavvyTextStyle.h2),
                SavvyText(currency.format(total), style: SavvyTextStyle.h1),
              ],
            )
                .animate(delay: baseDelay + 450.ms)
                .scale(curve: Curves.elasticOut, duration: 500.ms),

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
                    Text('CHANGE DUE',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: theme.colors.textSecondary)),
                    Text(currency.format(change),
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: theme.colors.textPrimary)),
                  ],
                ),
              )
                  .animate(delay: baseDelay + 500.ms)
                  .fadeIn()
                  .moveY(begin: 10, end: 0),
            ],

            SizedBox(height: 32),

            // BARCODE (Procedural)
            SizedBox(
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(40, (index) {
                  // Random-ish width bars
                  final width = (index * 7 % 3 + 1).toDouble() * 2;
                  final space = (index * 3 % 2 + 1).toDouble();
                  return Container(
                    margin: EdgeInsets.only(right: space),
                    width: width,
                    color: Colors.black87,
                  );
                }),
              ),
            ).animate(delay: baseDelay + 550.ms).fadeIn(),
            SizedBox(height: 8),
            Text(orderNumber,
                    style: TextStyle(
                        fontFamily: 'Courier', fontSize: 10, letterSpacing: 2))
                .animate(delay: baseDelay + 600.ms)
                .fadeIn(),

            SizedBox(height: 24),
            SavvyText('Thank you for shopping!',
                    style: SavvyTextStyle.labelMedium,
                    textStyle: TextStyle(
                        color: theme.colors.textSecondary,
                        fontStyle: FontStyle.italic))
                .animate(delay: baseDelay + 650.ms)
                .fadeIn(),
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
          Text(value,
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: color ?? Colors.black87)),
        ],
      ),
    ).animate(delay: delay).fadeIn().moveX(begin: -5, end: 0);
  }
}

class _DottedLinePainter extends CustomPainter {
  final Color color;
  const _DottedLinePainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 1
      ..strokeCap = StrokeCap.round;

    const dashWidth = 3.0;
    const dashSpace = 3.0;
    double startX = 0;

    while (startX < size.width) {
      canvas.drawLine(Offset(startX, 0), Offset(startX + dashWidth, 0), paint);
      startX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
