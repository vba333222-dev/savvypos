import 'package:savvy_pos/core/database/database.dart';

enum PrinterConnectionType {
  bluetooth,
  network,
  usb,
}

enum PrinterStatus {
  ready,
  printing,
  connecting,
  disconnected,
  outOfPaper,
  error,
}

class PrinterDevice {
  final String name;
  final String address;
  final PrinterConnectionType connectionType;

  const PrinterDevice({
    required this.name,
    required this.address,
    this.connectionType = PrinterConnectionType.bluetooth,
  });
}

abstract class IPrinterService {
  /// Connects to a printer using the specified connection type
  Future<void> connect(String address,
      {PrinterConnectionType type = PrinterConnectionType.bluetooth});

  /// Disconnects from current printer
  Future<void> disconnect();

  /// Scans for available Bluetooth devices (and potentially network devices via mDNS later)
  Future<List<PrinterDevice>> scan(
      {PrinterConnectionType type = PrinterConnectionType.bluetooth});

  /// Queues a receipt for printing. The execution happens in a background Isolate spooler.
  Future<void> printReceipt(OrderTableData order,
      {List<Map<String, dynamic>>? items});

  /// Queues raw text for printing. The execution happens in a background Isolate spooler.
  Future<void> printText(String text,
      {bool isBold = false, bool isLarge = false});

  /// Stream of structured, precise printer connection status
  Stream<PrinterStatus> get status;
}
