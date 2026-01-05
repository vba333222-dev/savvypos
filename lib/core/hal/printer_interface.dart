import 'package:savvy_pos/core/database/database.dart';

abstract class IPrinterService {
  /// Connects to a printer by its address (MAC or IP)
  Future<void> connect(String address);

  /// Prints a receipt for the given order
  Future<void> printReceipt(OrderTableData order); // Using OrderTableData or Domain Entity

  /// Stream of printer connection status
  Stream<String> get status;
}
