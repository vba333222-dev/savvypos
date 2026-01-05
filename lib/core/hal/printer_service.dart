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

  // Helper method for settings page
  Future<List<BluetoothInfo>> scanDevices() async {
    try {
      if (await Permission.bluetoothScan.request().isGranted &&
          await Permission.bluetoothConnect.request().isGranted) {
          return await PrintBluetoothThermal.pairedBluetooths;
      }
      return [];
    } catch (e) {
      _logger.e('Error scanning devices', error: e);
      return [];
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

      // Items (Since we only accept OrderTableData here, we might not have items if not passed.
      // NOTE: Ideally this method receives a full Order entity with items. 
      // For this step, we will print the totals.
      // If the user wants granular items, we'd need to fetch them or pass them.
      // Assuming for now we just print totals as per interface signature.)
      
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
