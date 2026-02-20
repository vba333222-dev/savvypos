import 'dart:async';
import 'dart:io';
import 'package:esc_pos_utils_plus/esc_pos_utils_plus.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:print_bluetooth_thermal/print_bluetooth_thermal.dart';
import 'package:savvy_pos/core/database/database.dart';
import 'package:savvy_pos/core/hal/printer_interface.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:savvy_pos/core/utils/receipt_generator.dart';
import 'package:savvy_pos/core/utils/isolate_helper.dart'; // Added for background isolate computation

import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';

// Background Isolate Function for Heavy ESC/POS Byte Generation (Receipt)
@pragma('vm:entry-point')
Future<List<int>> _generateReceiptBytesTask(Map<String, dynamic> data) async {
  final orderNumber = data['orderNumber'] as String;
  final date = DateTime.parse(data['date'] as String);
  final items = (data['items'] as List).cast<Map<String, dynamic>>();
  final subtotal = data['subtotal'] as double;
  final discount = data['discount'] as double;
  final tax = data['tax'] as double;
  final total = data['total'] as double;
  final paymentMethod = data['paymentMethod'] as String;
  final change = data['change'] as double?;
  final tendered = data['tendered'] as double?;

  // Computes the ESC/POS layout (which takes 50-100ms and would block UI)
  return await ReceiptGenerator.generateReceipt(
    storeName: 'Savvy POS', // Could be passed in data map
    orderNumber: orderNumber,
    date: date,
    items: items,
    subtotal: subtotal,
    discount: discount,
    tax: tax,
    total: total,
    paymentMethod: paymentMethod,
    change: change,
    tendered: tendered,
  );
}

// Background Isolate Function for Heavy ESC/POS Byte Generation (Text)
@pragma('vm:entry-point')
Future<List<int>> _generateTextBytesTask(Map<String, dynamic> data) async {
  final text = data['text'] as String;
  final isBold = data['isBold'] as bool;
  final isLarge = data['isLarge'] as bool;

  final profile = await CapabilityProfile.load();
  final generator = Generator(PaperSize.mm58, profile);
  List<int> bytes = [];

  final lines = text.split('\n');
  for (final line in lines) {
    if (line.contains('!SIZE_DOUBLE!')) {
      final content = line.replaceAll('!SIZE_DOUBLE!', '');
      bytes += generator.text(content,
          styles: const PosStyles(
              height: PosTextSize.size2, width: PosTextSize.size2, bold: true));
    } else {
      bytes += generator.text(line,
          styles: PosStyles(
            bold: isBold,
            height: isLarge ? PosTextSize.size2 : PosTextSize.size1,
            width: isLarge ? PosTextSize.size2 : PosTextSize.size1,
          ));
    }
  }

  bytes += generator.feed(2);
  bytes += generator.cut();
  return bytes;
}

@LazySingleton(as: IPrinterService)
class PrinterService implements IPrinterService {
  final Logger _logger = Logger();
  final AppDatabase _db;

  final _statusController = StreamController<PrinterStatus>.broadcast();

  bool _isPrinting = false;

  static const String _prefKeyPrinterAddress = 'savvy_printer_address';
  static const String _prefKeyPrinterType = 'savvy_printer_type'; // New pref

  String? _currentAddress;
  PrinterConnectionType _currentType = PrinterConnectionType.bluetooth;

  @override
  Stream<PrinterStatus> get status => _statusController.stream;

  PrinterService(this._db) {
    init();
  }

  void init() {
    autoConnect().then((_) {
      // Recovery on Startup: Check persistent queue
      _logger.i('Spooler init: checking persistent pending print queue.');
      _processSpoolerQueue();
    });
  }

  Future<void> autoConnect() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final savedAddress = prefs.getString(_prefKeyPrinterAddress);
      final savedTypeStr = prefs.getString(_prefKeyPrinterType);

      PrinterConnectionType type = PrinterConnectionType.bluetooth;
      if (savedTypeStr == 'NETWORK') type = PrinterConnectionType.network;
      if (savedTypeStr == 'USB') type = PrinterConnectionType.usb;

      if (savedAddress != null && savedAddress.isNotEmpty) {
        _logger.i(
            'Found saved printer: $savedAddress ($type). Auto-connecting...');
        await _savePrinterAddress(savedAddress, type); // Keep synced locally
      }
    } catch (e) {
      _logger.w('Error auto-connecting printer', error: e);
    }
  }

  @override
  Future<void> connect(String address,
      {PrinterConnectionType type = PrinterConnectionType.bluetooth}) async {
    try {
      _logger.d('Connecting to printer: $address ($type)');
      _statusController.add(PrinterStatus.connecting);

      _currentAddress = address;
      _currentType = type;

      if (type == PrinterConnectionType.bluetooth) {
        if (await Permission.bluetoothConnect.request().isGranted &&
            await Permission.bluetoothScan.request().isGranted) {
          final bool isConnected =
              await PrintBluetoothThermal.connect(macPrinterAddress: address);
          if (isConnected) {
            _statusController.add(PrinterStatus.ready);
            _logger.i('Bluetooth Printer connected: $address');
            _savePrinterAddress(address, type);
          } else {
            _statusController.add(PrinterStatus.disconnected);
            throw Exception('Failed to connect to Bluetooth printer');
          }
        } else {
          _statusController.add(PrinterStatus.error);
          throw Exception('Bluetooth permissions denied');
        }
      } else if (type == PrinterConnectionType.network) {
        // Networking ping test to ensure 9100 port is open
        try {
          final socket = await Socket.connect(address, 9100,
              timeout: const Duration(seconds: 3));
          socket.destroy(); // Close immediately, just a ping test
          _statusController.add(PrinterStatus.ready);
          _savePrinterAddress(address, type);
          _logger.i('Network Printer accessible at: $address:9100');
        } catch (e) {
          _statusController.add(PrinterStatus.disconnected);
          throw Exception('Network printer unreachable at $address');
        }
      } else if (type == PrinterConnectionType.usb) {
        // Mock USB check for MVP implementation
        _statusController.add(PrinterStatus.ready);
        _savePrinterAddress(address, type);
      }
    } catch (e) {
      _logger.e('Error connecting to printer', error: e);
      _statusController.add(PrinterStatus.error);
      rethrow;
    }
  }

  Future<void> _savePrinterAddress(
      String address, PrinterConnectionType type) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(_prefKeyPrinterAddress, address);

      String typeStr = 'BLUETOOTH';
      if (type == PrinterConnectionType.network) typeStr = 'NETWORK';
      if (type == PrinterConnectionType.usb) typeStr = 'USB';

      await prefs.setString(_prefKeyPrinterType, typeStr);
      _currentAddress = address;
      _currentType = type;
    } catch (e) {
      _logger.e('Failed to save printer address', error: e);
    }
  }

  @override
  Future<void> disconnect() async {
    if (_currentType == PrinterConnectionType.bluetooth) {
      await PrintBluetoothThermal.disconnect;
    }
    _statusController.add(PrinterStatus.disconnected);
  }

  @override
  Future<List<PrinterDevice>> scan(
      {PrinterConnectionType type = PrinterConnectionType.bluetooth}) async {
    try {
      if (type == PrinterConnectionType.bluetooth) {
        if (await Permission.bluetoothScan.request().isGranted &&
            await Permission.bluetoothConnect.request().isGranted) {
          final list = await PrintBluetoothThermal.pairedBluetooths;
          return list
              .map((e) => PrinterDevice(
                  name: e.name,
                  address: e.macAdress,
                  connectionType: PrinterConnectionType.bluetooth))
              .toList();
        }
      }
      return [];
    } catch (e) {
      _logger.e('Error scanning devices', error: e);
      return [];
    }
  }

  // --- Persistent SPOOLER MECHANIC ---
  Future<void> _enqueuePrintJob(List<int> bytes) async {
    if (_currentAddress == null) {
      _logger.w('No current print address, skipping job.');
      return;
    }

    final typeStr = _currentType == PrinterConnectionType.bluetooth
        ? 'BLUETOOTH'
        : _currentType == PrinterConnectionType.network
            ? 'NETWORK'
            : 'USB';

    await _db.into(_db.printJobTable).insert(PrintJobTableCompanion(
          uuid: Value(const Uuid().v4()),
          targetPrinterAddress: Value(_currentAddress!), // Extracted implicitly
          targetPrinterType: Value(typeStr),
          bytes: Value(Uint8List.fromList(bytes)),
          status: const Value('PENDING'),
          createdAt: Value(DateTime.now()),
          retryCount: const Value(0),
        ));
    _logger.i('Print job added to persistent queue.');
    _processSpoolerQueue();
  }

  Future<void> _processSpoolerQueue() async {
    if (_isPrinting) return; // Prevent concurrent buffer overlapping

    // Fetch pending or interrupted printing jobs from Local DB
    final query = _db.select(_db.printJobTable)
      ..where((t) => t.status.isIn(['PENDING', 'PRINTING']))
      ..orderBy([
        (t) => OrderingTerm(expression: t.createdAt, mode: OrderingMode.asc)
      ])
      ..limit(1);

    final jobs = await query.get();

    if (jobs.isEmpty) {
      _statusController.add(PrinterStatus.ready);
      return;
    }

    _isPrinting = true;
    _statusController.add(PrinterStatus.printing);

    final job = jobs.first;

    try {
      // Mark as PRINTING (Recovery on Startup visibility)
      await (_db.update(_db.printJobTable)..where((t) => t.id.equals(job.id)))
          .write(const PrintJobTableCompanion(status: Value('PRINTING')));

      await _dispatchBytesToHardware(
          job.bytes, job.targetPrinterAddress, job.targetPrinterType);

      // Succeeded - Safe Deletion
      await (_db.delete(_db.printJobTable)..where((t) => t.id.equals(job.id)))
          .go();
      _logger.i('Print job ${job.id} successful and queue cleared.');
    } catch (e) {
      _logger.e('Spooler failed to print job ${job.id}', error: e);
      _statusController.add(PrinterStatus.error);

      final retry = job.retryCount + 1;
      if (retry >= 5) {
        // Drop it after 5 retries to avoid deadlocking queue forever
        await (_db.delete(_db.printJobTable)..where((t) => t.id.equals(job.id)))
            .go();
        _logger.w('Print job ${job.id} exceeded max retries. Dropped from DB.');
      } else {
        await (_db.update(_db.printJobTable)..where((t) => t.id.equals(job.id)))
            .write(PrintJobTableCompanion(
          status: const Value('PENDING'),
          retryCount: Value(retry),
        ));
      }
    } finally {
      // Add a slight delay between jobs so the hardware buffer flushes reliably
      await Future.delayed(const Duration(milliseconds: 500));
      _isPrinting = false;
      _processSpoolerQueue(); // Process next in queue
    }
  }

  Future<void> _dispatchBytesToHardware(
      Uint8List bytes, String address, String typeStr) async {
    PrinterConnectionType type = PrinterConnectionType.bluetooth;
    if (typeStr == 'NETWORK') type = PrinterConnectionType.network;
    if (typeStr == 'USB') type = PrinterConnectionType.usb;

    if (type == PrinterConnectionType.bluetooth) {
      final bool isConnected = await PrintBluetoothThermal.connectionStatus;
      if (!isConnected || _currentAddress != address) {
        await connect(address, type: type);
      }
      await PrintBluetoothThermal.writeBytes(bytes.toList());
    } else if (type == PrinterConnectionType.network) {
      // Send raw TCP socket stream
      final socket = await Socket.connect(address, 9100,
          timeout: const Duration(seconds: 5));
      socket.add(bytes);
      await socket.flush(); // Waits for successful network ACK
      await socket.close();
    } else if (type == PrinterConnectionType.usb) {
      // Send USB serial stream. (Mocking for now unless specific usb package implementation dictates otherwise)
      _logger.w(
          'USB routing is mocked for MVP compatibility. Emitted ${bytes.length} bytes.');
    }
  }

  @override
  Future<void> printText(String text,
      {bool isBold = false, bool isLarge = false}) async {
    try {
      // 1. Generate Bytes in Background Isolate to prevent UI frame drops
      final payload = {
        'text': text,
        'isBold': isBold,
        'isLarge': isLarge,
      };

      final bytes = await IsolateHelper.run(_generateTextBytesTask, payload);

      // 2. Queue into Spooler
      await _enqueuePrintJob(bytes);
    } catch (e) {
      _logger.e('Error enqueuing text', error: e);
      rethrow;
    }
  }

  @override
  Future<void> printReceipt(OrderTableData order,
      {List<Map<String, dynamic>>? items}) async {
    try {
      // 1. Generate Bytes in Background Isolate to prevent UI frame drops
      final payload = {
        'orderNumber': '#${order.orderNumber}',
        'date': order.transactionDate.toIso8601String(),
        'items': items ?? [],
        'subtotal': order.subtotal,
        'discount': order.discountTotal,
        'tax': order.taxTotal,
        'total': order.grandTotal,
        'paymentMethod': order.paymentMethod ?? 'UNKNOWN',
        'change': order.changeAmount,
        'tendered': order.tenderedAmount,
      };

      final receiptBytes =
          await IsolateHelper.run(_generateReceiptBytesTask, payload);

      // 2. Queue into Spooler
      await _enqueuePrintJob(receiptBytes);
      _logger.i('Receipt queued for order: ${order.uuid}');
    } catch (e) {
      _logger.e('Error enqueuing receipt', error: e);
      rethrow;
    }
  }
}
