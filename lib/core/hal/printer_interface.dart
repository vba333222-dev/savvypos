import 'package:savvy_pos/core/database/database.dart';

class PrinterDevice {
  final String name;
  final String address;
  const PrinterDevice({required this.name, required this.address});
}

abstract class IPrinterService {
  /// Connects to a printer by its address (MAC or IP)
  Future<void> connect(String address);

  /// Disconnects from current printer
  Future<void> disconnect(); // Good to have

  /// Scans for available devices
  Future<List<PrinterDevice>> scan();

  /// Prints a receipt for the given order
  Future<void> printReceipt(OrderTableData order);

  /// Prints raw text (with optional simple formatting)
  Future<void> printText(String text, {bool isBold = false, bool isLarge = false});

  /// Stream of printer connection status
  Stream<String> get status;
}
