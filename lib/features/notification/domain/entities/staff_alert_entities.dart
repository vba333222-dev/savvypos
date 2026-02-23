import 'package:savvy_pos/core/utils/time_helper.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'staff_alert_entities.freezed.dart';
part 'staff_alert_entities.g.dart';

/// Alert priority levels
enum AlertPriority {
  low, // Informational
  medium, // Needs attention soon
  high, // Urgent
  critical, // Immediate action required
}

/// Alert type categories
enum AlertType {
  tableReady, // Table is ready for seating
  orderReady, // Order ready for pickup
  kitchenAlert, // Kitchen needs attention
  lowStock, // Inventory alert
  paymentIssue, // Payment problem
  customerRequest, // Guest needs assistance
  staffMessage, // Internal message
  systemAlert, // System notification
}

/// Staff alert status
enum AlertStatus {
  active,
  acknowledged,
  resolved,
  expired,
}

/// Staff Alert entity
@freezed
class StaffAlert with _$StaffAlert {
  const factory StaffAlert({
    required String uuid,
    required AlertType type,
    required AlertPriority priority,
    required String title,
    required String message,
    @Default(AlertStatus.active) AlertStatus status,

    // Targeting
    @Default([]) List<String> targetRoles, // server, manager, kitchen, etc.
    @Default([]) List<String> targetUserUuids, // Specific users
    @Default(true) bool broadcastToAll, // All staff

    // Context
    String? relatedOrderUuid,
    String? relatedTableUuid,
    String? relatedCustomerUuid,

    // Action
    String? actionLabel, // "View Order", "Go to Table", etc.
    String? actionRoute, // Navigation route

    // Timing
    required DateTime createdAt,
    DateTime? expiresAt,
    DateTime? acknowledgedAt,
    String? acknowledgedByUuid,
    DateTime? resolvedAt,
    String? resolvedByUuid,

    // Sound/Vibration
    @Default(true) bool playSound,
    @Default(true) bool vibrate,
  }) = _StaffAlert;

  factory StaffAlert.fromJson(Map<String, dynamic> json) =>
      _$StaffAlertFromJson(json);

  const StaffAlert._();

  /// Check if alert is still active
  bool get isActive =>
      status == AlertStatus.active &&
      (expiresAt == null || TimeHelper.now().isBefore(expiresAt!));
}

/// Quick alert templates
@freezed
class AlertTemplate with _$AlertTemplate {
  const factory AlertTemplate({
    required String id,
    required String name,
    required AlertType type,
    required AlertPriority priority,
    required String messageTemplate,
  }) = _AlertTemplate;

  factory AlertTemplate.fromJson(Map<String, dynamic> json) =>
      _$AlertTemplateFromJson(json);
}
