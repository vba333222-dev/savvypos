import 'package:freezed_annotation/freezed_annotation.dart';

part 'split_bill_entities.freezed.dart';
part 'split_bill_entities.g.dart';

/// Split mode enumeration
enum SplitMode {
  equal,      // Split equally among all guests
  byItem,     // Each guest pays for their items
  custom,     // Custom amounts per guest
  byGuest,    // Assign items to specific guests
}

/// Split bill status
enum SplitBillStatus {
  active,     // Split in progress
  partial,    // Some guests have paid
  completed,  // All guests paid
  cancelled,
}

/// Main Split Bill entity
@freezed
class SplitBill with _$SplitBill {
  const factory SplitBill({
    required String uuid,
    required String orderUuid,
    required String orderNumber,
    required double originalTotal,
    required int guestCount,
    required SplitMode mode,
    @Default(SplitBillStatus.active) SplitBillStatus status,
    
    // Guest bills
    @Default([]) List<GuestBill> guestBills,
    
    // Tracking
    required String createdByUuid,
    required String createdByName,
    required DateTime createdAt,
    DateTime? completedAt,
  }) = _SplitBill;
  
  factory SplitBill.fromJson(Map<String, dynamic> json) => _$SplitBillFromJson(json);
  
  const SplitBill._();
  
  /// Total amount paid
  double get totalPaid => guestBills.fold<double>(0, (sum, g) => sum + (g.isPaid ? g.totalAmount : 0));
  
  /// Remaining amount
  double get remainingAmount => originalTotal - totalPaid;
  
  /// Check if all bills are paid
  bool get isFullyPaid => guestBills.every((g) => g.isPaid);
}

/// Individual guest bill
@freezed
class GuestBill with _$GuestBill {
  const factory GuestBill({
    required String uuid,
    required String splitBillUuid,
    required int guestNumber,  // Guest 1, 2, 3...
    String? guestName,
    
    // Items assigned to this guest (for byItem/byGuest modes)
    @Default([]) List<SplitBillItem> items,
    
    // Amount (for equal/custom modes, or calculated from items)
    required double totalAmount,
    double? tipAmount,
    
    // Payment status
    @Default(false) bool isPaid,
    String? paymentMethod,  // cash, card, etc.
    String? paymentTransactionUuid,
    DateTime? paidAt,
  }) = _GuestBill;
  
  factory GuestBill.fromJson(Map<String, dynamic> json) => _$GuestBillFromJson(json);
  
  const GuestBill._();
  
  /// Grand total including tip
  double get grandTotal => totalAmount + (tipAmount ?? 0);
}

/// Item in a split bill
@freezed
class SplitBillItem with _$SplitBillItem {
  const factory SplitBillItem({
    required String uuid,
    required String orderItemUuid,
    required String productName,
    required double price,
    required int quantity,
    
    // Share info (for partial item splitting)
    @Default(1) int shareCount,   // Split among how many guests
    @Default(1) int shareIndex,   // Which share is this (1 of 2, 2 of 2, etc.)
  }) = _SplitBillItem;
  
  factory SplitBillItem.fromJson(Map<String, dynamic> json) => _$SplitBillItemFromJson(json);
  
  const SplitBillItem._();
  
  /// Amount for this share
  double get shareAmount => (price * quantity) / shareCount;
}

/// Quick split preset for UI
@freezed
class SplitPreset with _$SplitPreset {
  const factory SplitPreset({
    required String label,
    required int guestCount,
    required SplitMode mode,
  }) = _SplitPreset;
  
  factory SplitPreset.fromJson(Map<String, dynamic> json) => _$SplitPresetFromJson(json);
}
