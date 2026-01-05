import 'package:injectable/injectable.dart';
import 'package:savvy_pos/core/database/database.dart';
import 'package:savvy_pos/core/hal/printer_interface.dart';
import 'package:savvy_pos/features/pos/presentation/bloc/cart/cart_state.dart';

@lazySingleton
class PrinterRouter {
  final IPrinterService _printerService;
  
  // In a real app, these would come from User Settings (mac mapped to category)
  String? _kitchenPrinterMac;
  String? _barPrinterMac;
  String? _cashierPrinterMac;

  PrinterRouter(this._printerService);

  void setPrinters({String? kitchen, String? bar, String? cashier}) {
    _kitchenPrinterMac = kitchen;
    _barPrinterMac = bar;
    _cashierPrinterMac = cashier;
  }

  Future<void> printOrder(String orderNumber, List<CartItem> items, {String? table}) async {
    // 1. Group items
    final foodItems = items.where((i) => i.product.printerCategory == 'FOOD').toList();
    final barItems = items.where((i) => i.product.printerCategory == 'BEVERAGE').toList();
    
    // 2. Print Kitchen Ticket
    if (foodItems.isNotEmpty && _kitchenPrinterMac != null) {
      await _printToDevice(_kitchenPrinterMac!, 'KITCHEN ORDER', orderNumber, foodItems, table: table);
    }

    // 3. Print Bar Ticket
    if (barItems.isNotEmpty && _barPrinterMac != null) {
      await _printToDevice(_barPrinterMac!, 'BAR ORDER', orderNumber, barItems, table: table);
    }
    
    // 4. Print Customer Receipt (All Items) - Optional here or separate event
    // Usually cashier printer prints everything?
    // Let's assume this method is for "Sending Order to Kitchen/Bar".
  }

  Future<void> _printToDevice(String mac, String title, String orderNo, List<CartItem> items, {String? table}) async {
    try {
      await _printerService.connect(mac);
      
      // Simple Text Format for now
      String content = '$title\n';
      content += 'Order: $orderNo\n';
      if (table != null) content += 'Table: $table\n';
      content += '----------------\n';
      for (final item in items) {
        content += '${item.quantity}x ${item.product.name}\n';
        if (item.product.note != null) content += '  Note: ${item.product.note}\n';
      }
      content += '----------------\n\n\n';
      
      await _printerService.printText(content);
      // await _printerService.disconnect(); // Depends on service implementation
    } catch (e) {
      // Log error (Fire and forget or retry)
      print('Printer Error ($title): $e');
    }
  }
}
