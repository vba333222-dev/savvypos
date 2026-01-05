import 'dart:typed_data';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:intl/intl.dart';

class ReceiptGenerator {
  
  static Future<Uint8List> generateReceipt({
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
  }) async {
    final pdf = pw.Document();
    final currency = NumberFormat.currency(locale: 'en_US', symbol: '\$');
    final dateFormat = DateFormat('yyyy-MM-dd HH:mm');

    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.roll80, // Thermal printer roll width approx 80mm
        margin: const pw.EdgeInsets.all(10),
        build: (pw.Context context) {
          return pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.center,
            mainAxisSize: pw.MainAxisSize.min,
            children: [
              pw.Text(storeName, style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 18)),
              pw.SizedBox(height: 5),
              pw.Text(dateFormat.format(date), style: const pw.TextStyle(fontSize: 10)),
              pw.Text('Order: $orderNumber', style: const pw.TextStyle(fontSize: 10)),
              pw.Divider(),
              
              // Items
              ...items.map((item) {
                return pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: [
                    pw.Expanded(child: pw.Text('${item['qty']}x ${item['name']}', style: const pw.TextStyle(fontSize: 10))),
                    pw.Text(currency.format(item['total']), style: const pw.TextStyle(fontSize: 10)),
                  ],
                );
              }).toList(),
              
              pw.Divider(),
              
              // Totals
              _buildRow('Subtotal', currency.format(subtotal)),
              if (discount > 0) _buildRow('Discount', '-${currency.format(discount)}'),
              _buildRow('Tax', currency.format(tax)),
              pw.Divider(),
              _buildRow('TOTAL', currency.format(total), isBold: true, fontSize: 14),
              
              pw.SizedBox(height: 10),
              _buildRow('Method', paymentMethod),
              if (tendered != null) _buildRow('Tendered', currency.format(tendered)),
              if (change != null) _buildRow('Change', currency.format(change)),
              
              pw.SizedBox(height: 20),
              pw.Text('Thank you for visiting!', style: const pw.TextStyle(fontSize: 10, fontStyle: pw.FontStyle.italic)),
            ],
          );
        },
      ),
    );

    return pdf.save();
  }

  static pw.Widget _buildRow(String label, String value, {bool isBold = false, double fontSize = 10}) {
    return pw.Row(
      mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
      children: [
        pw.Text(label, style: pw.TextStyle(fontSize: fontSize, fontWeight: isBold ? pw.FontWeight.bold : null)),
        pw.Text(value, style: pw.TextStyle(fontSize: fontSize, fontWeight: isBold ? pw.FontWeight.bold : null)),
      ],
    );
  }
}
