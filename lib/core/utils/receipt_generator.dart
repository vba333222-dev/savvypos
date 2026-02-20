import 'package:esc_pos_utils_plus/esc_pos_utils_plus.dart';
import 'package:intl/intl.dart';

class ReceiptGenerator {
  
  static Future<List<int>> generateReceipt({
    required String storeName,
    required String orderNumber,
    required DateTime date,
    required List<Map<String, dynamic>> items, // {name, qty, price, total}
    required double subtotal,
    required double discount,
    required double tax,
    required double total,
    required String paymentMethod,
    double? tendered,
    double? change,
    PaperSize paperSize = PaperSize.mm58,
  }) async {
    final profile = await CapabilityProfile.load();
    final generator = Generator(paperSize, profile);
    List<int> bytes = [];
    
    final currency = NumberFormat.currency(locale: 'en_US', symbol: '\$');
    final dateFormat = DateFormat('yyyy-MM-dd HH:mm');

    // Header
    bytes += generator.text(storeName, styles: const PosStyles(
      align: PosAlign.center,
      height: PosTextSize.size2,
      width: PosTextSize.size2,
      bold: true,
    ));
    bytes += generator.text('Enterprise Solution', styles: const PosStyles(align: PosAlign.center));
    bytes += generator.hr();
    
    // Info
    bytes += generator.text('Date: ${dateFormat.format(date)}', styles: const PosStyles(align: PosAlign.left));
    bytes += generator.text('Order: $orderNumber', styles: const PosStyles(align: PosAlign.left));
    bytes += generator.hr();
    
    // Items
    for (final item in items) {
      // 58mm has limited width (approx 32 chars). 
      // Qty (4) + Name (18) + Total (10)
      final name = item['name'].toString();
      final qty = item['qty'].toString();
      final price = currency.format(item['total']);
      
      bytes += generator.row([
        PosColumn(text: '${qty}x', width: 2),
        PosColumn(text: name, width: 6),
        PosColumn(text: price, width: 4, styles: const PosStyles(align: PosAlign.right)),
      ]);
    }
    
    bytes += generator.hr();
    
    // Totals
    bytes += generator.row([
      PosColumn(text: 'Subtotal:', width: 6),
      PosColumn(text: currency.format(subtotal), width: 6, styles: const PosStyles(align: PosAlign.right)),
    ]);
    
    if (discount > 0) {
      bytes += generator.row([
        PosColumn(text: 'Discount:', width: 6),
        PosColumn(text: '-${currency.format(discount)}', width: 6, styles: const PosStyles(align: PosAlign.right)),
      ]);
    }
    
    bytes += generator.row([
      PosColumn(text: 'Tax:', width: 6),
      PosColumn(text: currency.format(tax), width: 6, styles: const PosStyles(align: PosAlign.right)),
    ]);
    
    bytes += generator.feed(1);
    
    bytes += generator.row([
      PosColumn(text: 'TOTAL', width: 5, styles: const PosStyles(bold: true, height: PosTextSize.size2, width: PosTextSize.size2)),
      PosColumn(text: currency.format(total), width: 7, styles: const PosStyles(bold: true, align: PosAlign.right, height: PosTextSize.size2, width: PosTextSize.size2)),
    ]);

    bytes += generator.hr();

    // Payment Info
    bytes += generator.text('Paid via: $paymentMethod');
    if (tendered != null) bytes += generator.text('Tendered: ${currency.format(tendered)}');
    if (change != null) bytes += generator.text('Change: ${currency.format(change)}');
    
    // Footer
    bytes += generator.feed(2);
    bytes += generator.text('Thank you for shopping!', styles: const PosStyles(align: PosAlign.center, bold: true));
    bytes += generator.feed(1);
    bytes += generator.cut();
    
    return bytes;
  }
}
