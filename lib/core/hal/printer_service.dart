abstract class PrinterService {
  /// Connect to a specific printer device
  Future<bool> connect(String deviceId);

  /// Disconnect from the current printer
  Future<bool> disconnect();

  /// Check connection status
  Future<bool> get isConnected;

  /// Print simple text
  Future<void> printText(String text, {
    bool bold = false,
    bool center = false,
  });

  /// Print a row of key-value pairs (e.g., "Item ... $10.00")
  Future<void> printRow(String label, String value);

  /// Print a divider line
  Future<void> printDivider();

  /// Print a QR Code
  Future<void> printQRCode(String data, {int size = 200});

  /// Feed paper and cut (if supported)
  Future<void> feedAndCut();
}
