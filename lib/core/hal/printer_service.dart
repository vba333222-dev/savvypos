import 'dart:async';
import 'package:esc_pos_utils_plus/esc_pos_utils_plus.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:print_bluetooth_thermal/print_bluetooth_thermal.dart';
import 'package:savvy_pos/core/database/database.dart';
import 'package:savvy_pos/core/hal/printer_interface.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:savvy_pos/core/utils/receipt_generator.dart';

@LazySingleton(as: IPrinterService)
class PrinterService implements IPrinterService {
  final Logger _logger = Logger();
  
  final _statusController = StreamController<String>.broadcast();

  static const String _prefKeyPrinterAddress = 'savvy_printer_address';
  
  @override
  Stream<String> get status => _statusController.stream;

  PrinterService() {
    init();
  }

  void init() {
    autoConnect();
  }

  Future<void> autoConnect() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final savedAddress = prefs.getString(_prefKeyPrinterAddress);
      
      if (savedAddress != null && savedAddress.isNotEmpty) {
        _logger.i('Found saved printer: $savedAddress. Auto-connecting...');
        connect(savedAddress); // Fire and forget connection
      }
    } catch (e) {
      _logger.w('Error auto-connecting printer', error: e);
    }
  }

  @override
  Future<void> connect(String address) async {
    try {
      _logger.d('Connecting to printer: $address');
      _statusController.add('Connecting...');

      // Request permissions
      if (await Permission.bluetoothConnect.request().isGranted && 
          await Permission.bluetoothScan.request().isGranted) {
          
        final bool isConnected = await PrintBluetoothThermal.connect(macPrinterAddress: address);
        
        if (isConnected) {
          _statusController.add('Connected');
          _logger.i('Printer connected: $address');
          _savePrinterAddress(address); // Persist success
        } else {
          _statusController.add('Disconnected');
          _logger.w('Failed to connect to printer: $address');
          throw Exception('Failed to connect to printer');
        }
      } else {
        _statusController.add('Permission Denied');
        throw Exception('Bluetooth permissions denied');
      }
    } catch (e) {
      _logger.e('Error connecting to printer', error: e);
      _statusController.add('Error: $e');
      rethrow;
    }
  }

  Future<void> _savePrinterAddress(String address) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(_prefKeyPrinterAddress, address);
    } catch (e) {
      _logger.e('Failed to save printer address', error: e);
    }
  }



  @override
  Future<void> disconnect() async {
     await PrintBluetoothThermal.disconnect;
     _statusController.add('Disconnected');
  }

  @override
  Future<List<PrinterDevice>> scan() async {
    try {
      // Check permissions again just in case (though UI should handle asking)
       if (await Permission.bluetoothScan.request().isGranted &&
           await Permission.bluetoothConnect.request().isGranted) {
        final list = await PrintBluetoothThermal.pairedBluetooths;
        return list.map((e) => PrinterDevice(name: e.name, address: e.macAdress)).toList();
      }
      return [];
    } catch (e) {
      _logger.e('Error scanning devices', error: e);
      return [];
    }
  }

  @override
  Future<void> printText(String text, {bool isBold = false, bool isLarge = false}) async {
    try {
      final bool? isConnected = await PrintBluetoothThermal.connectionStatus;
      if (isConnected != true) {
         // Try to reconnect if we have a stored mac? 
         // For now, simple fail or rely on Router to have called connect.
         throw Exception('Printer not connected');
      }

      final profile = await CapabilityProfile.load();
      final generator = Generator(PaperSize.mm58, profile);
      List<int> bytes = [];

      // Simple Text Processing
      // Split by newline
      final lines = text.split('\n');
      for (final line in lines) {
        if (line.contains('!SIZE_DOUBLE!')) {
           // Skip marker, print rest large
           final content = line.replaceAll('!SIZE_DOUBLE!', '');
           bytes += generator.text(
             content, 
             styles: const PosStyles(
               height: PosTextSize.size2, 
               width: PosTextSize.size2,
               bold: true
             )
           );
        } else {
           bytes += generator.text(
             line, 
             styles: PosStyles(
               bold: isBold, 
               height: isLarge ? PosTextSize.size2 : PosTextSize.size1,
               width: isLarge ? PosTextSize.size2 : PosTextSize.size1,
             )
           );
        }
      }
      
      bytes += generator.feed(2);
      bytes += generator.cut();

      await PrintBluetoothThermal.writeBytes(bytes);
    } catch (e) {
      _logger.e('Error printing text', error: e);
      rethrow;
    }
  }

  @override
  Future<void> printReceipt(OrderTableData order, {List<Map<String, dynamic>>? items}) async {
    try {
      final bool? isConnected = await PrintBluetoothThermal.connectionStatus;
      if (isConnected != true) {
        // Try auto-reconnect if we have an address?
         final prefs = await SharedPreferences.getInstance();
         final saved = prefs.getString(_prefKeyPrinterAddress);
         if (saved != null) {
            await connect(saved);
         } else {
            throw Exception('Printer not connected');
         }
      }

      // Convert OrderTableData to ReceiptGenerator format
      // Note: We need items. If not passed, we can't print a full receipt.
      // For now, we handle the case where items might be missing by showing a placeholder.
      
      final receiptBytes = await ReceiptGenerator.generateReceipt(
        storeName: 'Savvy POS', // TODO: Get from config
        orderNumber: '#${order.orderNumber}',
        date: order.createdAt,
        items: items ?? [], // Expecting list of maps {name, qty, total}
        subtotal: order.subTotal,
        discount: order.discountTotal,
        tax: order.taxTotal,
        total: order.grandTotal,
        paymentMethod: order.paymentMethod,
        change: order.changeAmount,
        tendered: order.tenderAmount,
      );

      await PrintBluetoothThermal.writeBytes(receiptBytes);
      
      _logger.i('Receipt printed for order: ${order.uuid}');
    } catch (e) {
      _logger.e('Error printing receipt', error: e);
      rethrow;
    }
  }
}
