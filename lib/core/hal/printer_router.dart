import 'package:injectable/injectable.dart';
import 'package:savvy_pos/core/hal/printer_interface.dart';
import 'package:savvy_pos/features/pos/presentation/bloc/cart/cart_state.dart';

import 'package:shared_preferences/shared_preferences.dart';

@lazySingleton
class PrinterRouter {
  final IPrinterService _printerService;
  
  String? _kitchenPrinterMac;
  String? _barPrinterMac;
  String? _cashierPrinterMac;

  PrinterRouter(this._printerService);

  String? get kitchenPrinterMac => _kitchenPrinterMac;
  String? get barPrinterMac => _barPrinterMac;
  String? get cashierPrinterMac => _cashierPrinterMac;

  Future<void> loadSettings() async {
    final prefs = await SharedPreferences.getInstance();
    _kitchenPrinterMac = prefs.getString('printer_kitchen');
    _barPrinterMac = prefs.getString('printer_bar');
    _cashierPrinterMac = prefs.getString('printer_cashier');
  }

  Future<void> saveSettings({String? kitchen, String? bar, String? cashier}) async {
    final prefs = await SharedPreferences.getInstance();
    if (kitchen != null) {
      _kitchenPrinterMac = kitchen;
      await prefs.setString('printer_kitchen', kitchen);
    }
    if (bar != null) {
      _barPrinterMac = bar;
      await prefs.setString('printer_bar', bar);
    }
    if (cashier != null) {
      _cashierPrinterMac = cashier;
      await prefs.setString('printer_cashier', cashier);
    }
  }

  Future<List<PrinterDevice>> scanDevices() => _printerService.scan();


  Future<void> routeAndPrint(String orderNumber, List<CartItem> items, {String? table, bool isReprint = false}) async {
    // 1. Receipt Printer (Full Bill) - Only if desired, or maybe this is 'Send to Kitchen' only?
    // Requirement says: "Receipt Printer: Print full bill".
    if (_cashierPrinterMac != null) {
      await _printToDevice(
        _cashierPrinterMac!, 
        isReprint ? 'COPY RECEIPT' : 'RECEIPT', 
        orderNumber, 
        items, 
        table: table,
        showPrices: true,
      );
    }

    // 2. Kitchen Printer (Food)
    final foodItems = items.where((i) => i.product.printerCategory == 'FOOD').toList();
    if (foodItems.isNotEmpty && _kitchenPrinterMac != null) {
      await _printToDevice(
        _kitchenPrinterMac!, 
        'KITCHEN TICKET', 
        orderNumber, 
        foodItems, 
        table: table,
        showPrices: false, // No prices for kitchen
        largeFont: true,
      );
    }

    // 3. Bar Printer (Beverage)
    final barItems = items.where((i) => i.product.printerCategory == 'BEVERAGE').toList();
    if (barItems.isNotEmpty && _barPrinterMac != null) {
      await _printToDevice(
        _barPrinterMac!, 
        'BAR TICKET', 
        orderNumber, 
        barItems, 
        table: table,
        showPrices: false,
        largeFont: true,
      );
    }
  }

  Future<void> _printToDevice(
    String mac, 
    String title, 
    String orderNo, 
    List<CartItem> items, 
    {String? table, bool showPrices = false, bool largeFont = false}
  ) async {
    try {
      await _printerService.connect(mac);
      
      // Formatting
      // If largeFont is true, we might apply specific commands if supported by IPrinterService,
      // or just emphasize with asterisks/spacing for text-only printers.
      // Assuming IPrinterService has `setStyles` or we just send Text.
      // We'll stick to Text formatting for MVP compatibility.
      
      StringBuffer buffer = StringBuffer();
      
      if (largeFont) buffer.writeln("!SIZE_DOUBLE!"); // Pseudo-command if parser supports, or just visual spacer
      buffer.writeln("=== $title ===");
      if (table != null) buffer.writeln("TABLE: $table");
      buffer.writeln("Order: $orderNo");
      buffer.writeln("Time: ${DateTime.now().toString().substring(11, 16)}");
      buffer.writeln("--------------------------------");
      
      for (final item in items) {
        // Qty x Name
        String line = "${item.quantity}x ${item.product.name}";
        if (showPrices) {
             buffer.writeln(line);
             buffer.writeln("   @ \$${item.product.price.toStringAsFixed(2)} = \$${item.total.toStringAsFixed(2)}");
        } else {
             buffer.writeln(line);
        }
        
        // Modifiers
        if (item.modifiers.isNotEmpty) {
           for (final m in item.modifiers) {
              buffer.writeln("    + ${m.name}");
           }
        }
        
        // Notes
        if (item.note != null && item.note!.isNotEmpty) buffer.writeln("    [NOTE]: ${item.note}");
      }
      buffer.writeln("--------------------------------");
      buffer.writeln("\n\n");
      
      await _printerService.printText(buffer.toString());
      
    } catch (e) {
      print('Printer Error ($title): $e');
    }
  }
}
