import 'package:savvy_pos/features/notification/domain/entities/staff_alert_entities.dart';

/// Repository interface for Staff Alert management
abstract class IStaffAlertRepository {
  // ===================================
  // ALERT CRUD
  // ===================================
  
  /// Create and broadcast alert
  Future<StaffAlert> createAlert({
    required AlertType type,
    required AlertPriority priority,
    required String title,
    required String message,
    List<String>? targetRoles,
    List<String>? targetUserUuids,
    bool broadcastToAll = true,
    String? relatedOrderUuid,
    String? relatedTableUuid,
    String? relatedCustomerUuid,
    String? actionLabel,
    String? actionRoute,
    Duration? expiresIn,
    bool playSound = true,
    bool vibrate = true,
  });
  
  /// Get active alerts for current user
  Future<List<StaffAlert>> getActiveAlerts();
  
  /// Get all alerts
  Future<List<StaffAlert>> getAllAlerts({
    AlertType? type,
    AlertPriority? priority,
    AlertStatus? status,
    DateTime? since,
    int? limit,
  });
  
  /// Get alert by UUID
  Future<StaffAlert?> getAlert(String uuid);
  
  // ===================================
  // STATUS MANAGEMENT
  // ===================================
  
  /// Acknowledge alert
  Future<void> acknowledgeAlert(String uuid, String userUuid);
  
  /// Resolve alert
  Future<void> resolveAlert(String uuid, String userUuid);
  
  /// Dismiss alert (for UI)
  Future<void> dismissAlert(String uuid);
  
  /// Expire old alerts
  Future<int> expireOldAlerts();
  
  // ===================================
  // STREAMS
  // ===================================
  
  /// Stream of new alerts (for real-time UI)
  Stream<StaffAlert> watchNewAlerts();
  
  /// Stream of active alerts count
  Stream<int> watchActiveAlertCount();
  
  // ===================================
  // QUICK ALERTS
  // ===================================
  
  /// Send table ready alert
  Future<StaffAlert> sendTableReadyAlert(String tableUuid, String tableName);
  
  /// Send order ready alert
  Future<StaffAlert> sendOrderReadyAlert(String orderUuid, String orderNumber);
  
  /// Send customer assistance alert
  Future<StaffAlert> sendCustomerAssistanceAlert(String tableUuid, String tableName, String message);
  
  /// Get alert templates
  List<AlertTemplate> getAlertTemplates();
}
