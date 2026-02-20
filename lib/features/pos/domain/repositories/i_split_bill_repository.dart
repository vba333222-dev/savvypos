import 'package:savvy_pos/features/pos/domain/entities/split_bill_entities.dart';

/// Repository interface for Split Bill management
abstract class ISplitBillRepository {
  // ===================================
  // SPLIT BILL CRUD
  // ===================================
  
  /// Create a new split bill
  Future<SplitBill> createSplitBill({
    required String orderUuid,
    required String orderNumber,
    required double originalTotal,
    required int guestCount,
    required SplitMode mode,
    required String createdByUuid,
    required String createdByName,
  });
  
  /// Get split bill by order
  Future<SplitBill?> getSplitBillByOrder(String orderUuid);
  
  /// Get split bill by UUID
  Future<SplitBill?> getSplitBill(String uuid);
  
  /// Update split bill
  Future<void> updateSplitBill(SplitBill splitBill);
  
  /// Cancel split bill
  Future<void> cancelSplitBill(String uuid);
  
  // ===================================
  // GUEST BILL MANAGEMENT
  // ===================================
  
  /// Add guest to split
  Future<GuestBill> addGuest({
    required String splitBillUuid,
    required int guestNumber,
    String? guestName,
    required double amount,
  });
  
  /// Update guest bill
  Future<void> updateGuestBill(GuestBill guestBill);
  
  /// Remove guest from split
  Future<void> removeGuest(String guestBillUuid);
  
  /// Assign items to guest
  Future<void> assignItemsToGuest({
    required String guestBillUuid,
    required List<SplitBillItem> items,
  });
  
  // ===================================
  // PAYMENT
  // ===================================
  
  /// Mark guest bill as paid
  Future<void> markGuestPaid({
    required String guestBillUuid,
    required String paymentMethod,
    required String paymentTransactionUuid,
    double? tipAmount,
  });
  
  /// Check if split bill is complete
  Future<bool> isSplitComplete(String splitBillUuid);
  
  /// Complete the split bill
  Future<void> completeSplitBill(String splitBillUuid);
  
  // ===================================
  // UTILITIES
  // ===================================
  
  /// Calculate equal split amounts
  List<double> calculateEqualSplit(double total, int guestCount);
  
  /// Calculate amounts with tip
  Map<int, double> calculateWithTip(double total, int guestCount, double tipPercent);
  
  /// Get split presets for quick selection
  List<SplitPreset> getSplitPresets();
}
