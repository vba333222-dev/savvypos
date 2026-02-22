import 'dart:async';
import 'package:injectable/injectable.dart';
import 'package:savvy_pos/core/hal/printer_interface.dart';
import 'package:savvy_pos/features/pos/presentation/bloc/cart/cart_state.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

@lazySingleton
class PrinterRouter {
  final IPrinterService _printerService;
  final List<Map<String, dynamic>> failedPrintJobs = [];

  String? _kitchenPrinterAddress;
  PrinterConnectionType _kitchenPrinterType =
      PrinterConnectionType.network; // Kitchen defaults to Network

  String? _barPrinterAddress;
  PrinterConnectionType _barPrinterType = PrinterConnectionType.network;

  String? _cashierPrinterAddress;
  PrinterConnectionType _cashierPrinterType =
      PrinterConnectionType.bluetooth; // Cashier defaults to Bluetooth

  PrinterRouter(this._printerService);

  String? get kitchenPrinterAddress => _kitchenPrinterAddress;
  String? get barPrinterAddress => _barPrinterAddress;
  String? get cashierPrinterAddress => _cashierPrinterAddress;

  Future<void> loadSettings() async {
    final prefs = await SharedPreferences.getInstance();

    _kitchenPrinterAddress = prefs.getString('printer_kitchen_address');
    _kitchenPrinterType = _parseConnectionType(
        prefs.getString('printer_kitchen_type') ?? 'network');

    _barPrinterAddress = prefs.getString('printer_bar_address');
    _barPrinterType =
        _parseConnectionType(prefs.getString('printer_bar_type') ?? 'network');

    _cashierPrinterAddress = prefs.getString('printer_cashier_address');
    _cashierPrinterType = _parseConnectionType(
        prefs.getString('printer_cashier_type') ?? 'bluetooth');
  }

  PrinterConnectionType _parseConnectionType(String type) {
    if (type.toLowerCase() == 'usb') return PrinterConnectionType.usb;
    if (type.toLowerCase() == 'network') return PrinterConnectionType.network;
    return PrinterConnectionType.bluetooth;
  }

  String _typeToString(PrinterConnectionType type) {
    if (type == PrinterConnectionType.usb) return 'usb';
    if (type == PrinterConnectionType.network) return 'network';
    return 'bluetooth';
  }

  Future<void> saveSettings({
    String? kitchenAddr,
    PrinterConnectionType? kitchenType,
    String? barAddr,
    PrinterConnectionType? barType,
    String? cashierAddr,
    PrinterConnectionType? cashierType,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    if (kitchenAddr != null) {
      _kitchenPrinterAddress = kitchenAddr;
      await prefs.setString('printer_kitchen_address', kitchenAddr);
      if (kitchenType != null) {
        _kitchenPrinterType = kitchenType;
        await prefs.setString(
            'printer_kitchen_type', _typeToString(kitchenType));
      }
    }
    // Repeat for bar/cashier...
    if (cashierAddr != null) {
      _cashierPrinterAddress = cashierAddr;
      await prefs.setString('printer_cashier_address', cashierAddr);
      if (cashierType != null) {
        _cashierPrinterType = cashierType;
        await prefs.setString(
            'printer_cashier_type', _typeToString(cashierType));
      }
    }
  }

  Future<List<PrinterDevice>> scanDevices(
          {PrinterConnectionType type = PrinterConnectionType.bluetooth}) =>
      _printerService.scan(type: type);

  Future<void> routeAndPrint(String orderNumber, List<CartItem> items,
      {String? table, bool isReprint = false}) async {
    // 1. Receipt Printer (Full Bill)
    if (_cashierPrinterAddress != null) {
      await _dispatchTextTicket(
        _cashierPrinterAddress!,
        _cashierPrinterType,
        isReprint ? 'COPY RECEIPT' : 'RECEIPT',
        orderNumber,
        items,
        table: table,
        showPrices: true,
      );
    }

    // 2. Kitchen Printer (Food)
    final foodItems =
        items.where((i) => i.product.printerCategory == 'FOOD').toList();
    if (foodItems.isNotEmpty && _kitchenPrinterAddress != null) {
      await _dispatchTextTicket(
        _kitchenPrinterAddress!,
        _kitchenPrinterType,
        'KITCHEN TICKET',
        orderNumber,
        foodItems,
        table: table,
        showPrices: false,
        largeFont: true,
      );
    }

    // 3. Bar Printer (Beverage)
    final barItems =
        items.where((i) => i.product.printerCategory == 'BEVERAGE').toList();
    if (barItems.isNotEmpty && _barPrinterAddress != null) {
      await _dispatchTextTicket(
        _barPrinterAddress!,
        _barPrinterType,
        'BAR TICKET',
        orderNumber,
        barItems,
        table: table,
        showPrices: false,
        largeFont: true,
      );
    }
  }

  Future<void> _dispatchTextTicket(
      String targetAddress,
      PrinterConnectionType type,
      String title,
      String orderNo,
      List<CartItem> items,
      {String? table,
      bool showPrices = false,
      bool largeFont = false}) async {
    try {
      // Setup connection context (Service auto-connects if needed on print command)
      await _printerService
          .connect(targetAddress, type: type)
          .timeout(const Duration(seconds: 5));

      // We only string-build here. The actual layout ESC/POS byte translation
      // happens inside the background Isolate via PrinterService.
      StringBuffer buffer = StringBuffer();

      if (largeFont) buffer.writeln("!SIZE_DOUBLE!");
      buffer.writeln("=== $title ===");
      if (table != null) buffer.writeln("TABLE: $table");
      buffer.writeln("Order: $orderNo");
      buffer.writeln("Time: ${DateTime.now().toString().substring(11, 16)}");
      buffer.writeln("--------------------------------");

      for (final item in items) {
        String line = "${item.quantity}x ${item.product.name}";
        if (showPrices) {
          buffer.writeln(line);
          buffer.writeln(
              "   @ \$${item.product.price.toStringAsFixed(2)} = \$${item.total.toStringAsFixed(2)}");
        } else {
          buffer.writeln(line);
        }

        if (item.modifiers.isNotEmpty) {
          for (final m in item.modifiers) {
            buffer.writeln("    + ${m.name}");
          }
        }

        if (item.note != null && item.note!.isNotEmpty)
          buffer.writeln("    [NOTE]: ${item.note}");
      }
      buffer.writeln("--------------------------------");
      buffer.writeln("\n\n");

      // Spool to Background Isolate Queue
      await _printerService
          .printText(buffer.toString(), isLarge: largeFont)
          .timeout(const Duration(seconds: 5));
    } on TimeoutException catch (e) {
      debugPrint('Printer Router Timeout ($title): $e');
      failedPrintJobs.add({
        'title': title,
        'orderNo': orderNo,
        'targetAddress': targetAddress,
        'type': _typeToString(type),
        'timestamp': DateTime.now().toIso8601String(),
        'error': 'TimeoutException'
      });
    } catch (e) {
      debugPrint('Printer Router Error ($title): $e');
      failedPrintJobs.add({
        'title': title,
        'orderNo': orderNo,
        'targetAddress': targetAddress,
        'type': _typeToString(type),
        'timestamp': DateTime.now().toIso8601String(),
        'error': e.toString()
      });
    }
  }

  Future<void> printQRSessionTicket(String tableNumber, String url) async {
    if (_cashierPrinterAddress == null) return;

    try {
      await _printerService
          .connect(_cashierPrinterAddress!, type: _cashierPrinterType)
          .timeout(const Duration(seconds: 5));

      StringBuffer buffer = StringBuffer();
      buffer.writeln("=== TABLE QR ORDERING ===");
      buffer.writeln("TABLE: $tableNumber");
      buffer.writeln("Scan this code to order:");
      buffer.writeln("");
      buffer.writeln(url); // Emulate printing QR
      buffer.writeln("");
      buffer.writeln("Thank you!");
      buffer.writeln("--------------------------------");
      buffer.writeln("\n\n");

      await _printerService
          .printText(buffer.toString(), isLarge: false)
          .timeout(const Duration(seconds: 5));
    } on TimeoutException catch (e) {
      debugPrint('Printer Router QR Timeout: $e');
      failedPrintJobs.add({
        'title': 'QR_SESSION',
        'targetAddress': _cashierPrinterAddress,
        'timestamp': DateTime.now().toIso8601String(),
        'error': 'TimeoutException'
      });
    } catch (e) {
      debugPrint('Printer Router QR Error: $e');
      failedPrintJobs.add({
        'title': 'QR_SESSION',
        'targetAddress': _cashierPrinterAddress,
        'timestamp': DateTime.now().toIso8601String(),
        'error': e.toString()
      });
    }
  }
}
