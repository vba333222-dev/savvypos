import 'dart:async';
import 'package:esc_pos_utils_plus/esc_pos_utils_plus.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:print_bluetooth_thermal/print_bluetooth_thermal.dart';
import 'package:savvy_pos/core/database/database.dart';
import 'package:savvy_pos/core/hal/printer_interface.dart';

@LazySingleton(as: IPrinterService)
class PrinterService implements IPrinterService {
  final Logger _logger = Logger();
  
  final _statusController = StreamController<String>.broadcast();

  @override
  Stream<String> get status => _statusController.stream;

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
  Future<void> printReceipt(OrderTableData order) async {
    try {
      final bool? isConnected = await PrintBluetoothThermal.connectionStatus;
      if (isConnected != true) {
        throw Exception('Printer not connected');
      }

      // Generate ESC/POS bytes
      final profile = await CapabilityProfile.load();
      final generator = Generator(PaperSize.mm58, profile);
      List<int> bytes = [];

      // Header
      bytes += generator.text(
        'Savvy POS',
        styles: const PosStyles(
          align: PosAlign.center,
          height: PosTextSize.size2,
          width: PosTextSize.size2,
          bold: true,
        ),
      );
      bytes += generator.text('Enterprise Solution', styles: const PosStyles(align: PosAlign.center));
      bytes += generator.text('--------------------------------');

      // Order Info
      bytes += generator.text('Order #: ${order.orderNumber}');
      bytes += generator.text('Date: ${order.createdAt}');
      bytes += generator.text('--------------------------------');

      // Totals
      bytes += generator.row([
        PosColumn(text: 'Subtotal:', width: 8, styles: const PosStyles(align: PosAlign.left)),
        PosColumn(text: order.subTotal.toStringAsFixed(2), width: 4, styles: const PosStyles(align: PosAlign.right)),
      ]);
      bytes += generator.row([
        PosColumn(text: 'Tax:', width: 8, styles: const PosStyles(align: PosAlign.left)),
        PosColumn(text: order.taxTotal.toStringAsFixed(2), width: 4, styles: const PosStyles(align: PosAlign.right)),
      ]);
      bytes += generator.text('--------------------------------');
      bytes += generator.text(
        'TOTAL: \$${order.grandTotal.toStringAsFixed(2)}',
        styles: const PosStyles(
          align: PosAlign.center,
          height: PosTextSize.size2,
          bold: true,
        ),
      );

      // Footer
      bytes += generator.feed(2);
      bytes += generator.text('Thank you for shopping!', styles: const PosStyles(align: PosAlign.center));
      bytes += generator.feed(1);
      bytes += generator.cut();

      // Print
      await PrintBluetoothThermal.writeBytes(bytes);
      
      _logger.i('Receipt printed for order: ${order.uuid}');
    } catch (e) {
      _logger.e('Error printing receipt', error: e);
      rethrow;
    }
  }
}
