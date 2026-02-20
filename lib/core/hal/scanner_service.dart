import 'dart:async';

abstract class ScannerService {
  /// Start listening for barcode scans
  // Returns a stream of scanned strings (barcodes/QR codes)
  Stream<String> get scanResults;

  /// Initialize the scanner (request permissions, etc.)
  Future<void> initialize();

  /// Dispose/Stop the scanner
  Future<void> dispose();
}
