import 'package:savvy_pos/core/utils/time_helper.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/material.dart';

part 'kds_entities.freezed.dart';
part 'kds_entities.g.dart';

/// Ticket state in the kitchen
enum KDSTicketStatus {
  fired, // Sent to kitchen, not yet started
  prep, // Currently being prepared
  ready, // Ready for expo/runner
  served, // Delivered to customer (history)
  voided, // Cancelled
}

/// Course type for pacing
enum KDSCourse {
  drink,
  appetizer,
  main,
  dessert,
  other,
}

/// Alert level for wait times
enum KDSAlertLevel {
  normal, // On track
  warning, // Getting close to target time
  critical, // Overdue
}

/// Main Kitchen Ticket entity
@freezed
class KDSTicket with _$KDSTicket {
  const factory KDSTicket({
    required String uuid,
    required String orderUuid,
    required String orderNumber,
    required String? tableUuid,
    required String? tableName,
    required String? serverName,

    // Items in this ticket
    @Default([]) List<KDSItem> items,

    // Status & Timing
    @Default(KDSTicketStatus.fired) KDSTicketStatus status,
    required DateTime firedAt,
    DateTime? startedAt,
    DateTime? completedAt,

    // Target completion time (based on longest item prep time)
    DateTime? targetTime,

    // Notes
    String? note,
    @Default(false) bool isRush,
  }) = _KDSTicket;

  factory KDSTicket.fromJson(Map<String, dynamic> json) =>
      _$KDSTicketFromJson(json);

  const KDSTicket._();

  /// Duration since fired
  Duration get duration => TimeHelper.now().difference(firedAt);

  /// Get current alert level based on duration vs target
  KDSAlertLevel get alertLevel {
    if (targetTime == null) return KDSAlertLevel.normal;
    final now = TimeHelper.now();

    if (now.isAfter(targetTime!)) return KDSAlertLevel.critical;
    if (now.add(const Duration(minutes: 5)).isAfter(targetTime!))
      return KDSAlertLevel.warning;
    return KDSAlertLevel.normal;
  }

  /// Get ticket background color based on status/alert
  Color get statusColor {
    if (status == KDSTicketStatus.ready)
      return const Color(0xFF4CAF50); // Green
    if (status == KDSTicketStatus.voided)
      return const Color(0xFF9E9E9E); // Grey

    switch (alertLevel) {
      case KDSAlertLevel.critical:
        return const Color(0xFFF44336); // Red
      case KDSAlertLevel.warning:
        return const Color(0xFFFF9800); // Orange
      case KDSAlertLevel.normal:
        return const Color(0xFF2196F3); // Blue
    }
  }
}

/// Individual Item on a KDS Ticket
@freezed
class KDSItem with _$KDSItem {
  const factory KDSItem({
    required String uuid,
    required String ticketUuid,
    required String orderItemUuid,
    required String name,
    required int quantity,

    // Modifiers/Variations
    @Default([]) List<String> modifiers,
    String? note,

    // Coursing
    @Default(KDSCourse.main) KDSCourse course,

    // Item specific status (e.g. if one item is done before others)
    @Default(KDSTicketStatus.fired) KDSTicketStatus status,
  }) = _KDSItem;

  factory KDSItem.fromJson(Map<String, dynamic> json) =>
      _$KDSItemFromJson(json);
}

/// Expo Summary (Aggregated view)
@freezed
class KDSExpoSummary with _$KDSExpoSummary {
  const factory KDSExpoSummary({
    required int totalActiveTickets,
    required int itemsInPrep,
    required int itemsReady,
    required double avgPrepTimeMinutes,

    // Aggregated counts by item (e.g. "We need 5 Burgers total right now")
    required Map<String, int> activeItemCounts, // ItemName -> Quantity
  }) = _KDSExpoSummary;

  factory KDSExpoSummary.fromJson(Map<String, dynamic> json) =>
      _$KDSExpoSummaryFromJson(json);
}
