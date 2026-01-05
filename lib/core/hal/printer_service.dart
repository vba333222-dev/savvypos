import 'dart:async';
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

      // Request permissions first
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
  Future<void> printReceipt(OrderTableData order) async {
    try {
      final bool? isConnected = await PrintBluetoothThermal.connectionStatus;
      if (isConnected != true) {
        throw Exception('Printer not connected');
      }

      // Basic Receipt Layout
      await PrintBluetoothThermal.writeBytes([
        ...await PrintBluetoothThermal.writeString(
          printText: PrintTextSize(size: 10, text: 'Savvy POS\n')
        ),
        ...await PrintBluetoothThermal.writeString(
            printText: PrintTextSize(size: 8, text: 'Order #${order.orderNumber}\n')
        ),
        ...await PrintBluetoothThermal.writeString(
            printText: PrintTextSize(size: 8, text: '--------------------------------\n')
        ),
         ...await PrintBluetoothThermal.writeString(
            printText: PrintTextSize(size: 8, text: 'Total: ${order.grandTotal}\n')
        ),
        ...await PrintBluetoothThermal.writeString(
            printText: PrintTextSize(size: 8, text: '\n\n')
        ),
      ]);
      
      _logger.i('Receipt printed for order: ${order.uuid}');
    } catch (e) {
      _logger.e('Error printing receipt', error: e);
      rethrow;
    }
  }
  
  @disposeMethod
  void dispose() {
    _statusController.close();
  }
}
