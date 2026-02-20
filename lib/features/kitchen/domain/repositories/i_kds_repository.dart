import 'package:savvy_pos/features/kitchen/domain/entities/kds_entities.dart';

/// Repository interface for Kitchen Display System
abstract class IKDSRepository {
  // ===================================
  // TICKET MANAGEMENT
  // ===================================
  
  /// Create a ticket from an order
  Future<KDSTicket> createTicket({
    required String orderUuid,
    required String orderNumber,
    required List<KDSItem> items,
    String? tableUuid,
    String? tableName,
    String? serverName,
    String? note,
  });
  
  /// Get active tickets (fired, prep, ready)
  Future<List<KDSTicket>> getActiveTickets({
    List<KDSCourse>? filterCourses,
    bool includeDone = false, // If true, include recently ready
  });
  
  /// Get ticket by UUID
  Future<KDSTicket?> getTicket(String uuid);
  
  // ===================================
  // STATUS UPDATES (BUMPING)
  // ===================================
  
  /// Update ticket status (e.g. Fired -> Prep -> Ready)
  Future<void> updateTicketStatus(String ticketUuid, KDSTicketStatus status);
  
  /// Update individual item status
  Future<void> updateItemStatus(String itemUuid, KDSTicketStatus status);
  
  /// Bump ticket (move to next status automatically)
  Future<void> bumpTicket(String ticketUuid);
  
  /// Recall ticket (move back to previous status or un-archive)
  Future<void> recallTicket(String ticketUuid);
  
  // ===================================
  // EXPO & ANALYTICS
  // ===================================
  
  /// Get Expo summary (aggregated items)
  Future<KDSExpoSummary> getExpoSummary();
  
  /// Get average prep times
  Future<Map<KDSCourse, double>> getAveragePrepTimes();
  
  // ===================================
  // STREAMS
  // ===================================
  
  /// Stream of active tickets for real-time updates
  Stream<List<KDSTicket>> watchActiveTickets();
  
  /// Stream of expo summary
  Stream<KDSExpoSummary> watchExpoSummary();
}
