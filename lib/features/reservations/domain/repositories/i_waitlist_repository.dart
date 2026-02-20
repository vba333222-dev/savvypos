import 'package:savvy_pos/features/reservations/domain/entities/waitlist_entities.dart';

/// Repository interface for Waitlist management
abstract class IWaitlistRepository {
  // ===================================
  // WAITLIST CRUD
  // ===================================
  
  /// Add guest to waitlist
  Future<WaitlistEntry> addToWaitlist({
    required String guestName,
    required String phoneNumber,
    required int partySize,
    String? specialRequests,
    bool highchairNeeded = false,
    bool wheelchairAccessible = false,
    String? tablePreference,
  });
  
  /// Get waiting entries
  Future<List<WaitlistEntry>> getWaitingEntries();
  
  /// Get entry by UUID
  Future<WaitlistEntry?> getEntry(String uuid);
  
  /// Update entry
  Future<void> updateEntry(WaitlistEntry entry);
  
  /// Remove from waitlist
  Future<void> removeFromWaitlist(String uuid);
  
  // ===================================
  // STATUS MANAGEMENT
  // ===================================
  
  /// Mark as seated
  Future<void> markAsSeated(String uuid, String tableUuid);
  
  /// Mark as no-show
  Future<void> markAsNoShow(String uuid);
  
  /// Mark as cancelled
  Future<void> markAsCancelled(String uuid);
  
  // ===================================
  // NOTIFICATIONS
  // ===================================
  
  /// Send ready notification (SMS)
  Future<void> sendReadyNotification(String uuid);
  
  /// Get entries ready to notify
  Future<List<WaitlistEntry>> getReadyToNotify();
  
  // ===================================
  // ANALYTICS
  // ===================================
  
  /// Get current summary
  Future<WaitlistSummary> getSummary();
  
  /// Estimate wait time for party size
  Future<int> estimateWaitTime(int partySize);
  
  /// Recalculate queue positions
  Future<void> recalculatePositions();
}
