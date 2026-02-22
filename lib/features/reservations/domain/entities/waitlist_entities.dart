import 'package:freezed_annotation/freezed_annotation.dart';

part 'waitlist_entities.freezed.dart';
part 'waitlist_entities.g.dart';

/// Waitlist entry status
enum WaitlistStatus {
  waiting,
  seated,
  cancelled,
  noShow,
}

/// Waitlist entry entity
@freezed
class WaitlistEntry with _$WaitlistEntry {
  const factory WaitlistEntry({
    required String uuid,
    required String guestName,
    required String phoneNumber,
    required int partySize,

    // Preferences
    String? specialRequests,
    @Default(false) bool highchairNeeded,
    @Default(false) bool wheelchairAccessible,
    String? tablePreference, // indoor, outdoor, bar, etc.

    // Status tracking
    @Default(WaitlistStatus.waiting) WaitlistStatus status,
    required DateTime createdAt,
    DateTime? quotedWaitTime, // When we expect to seat them
    DateTime? notifiedAt, // When SMS was sent
    DateTime? seatedAt,
    String? seatedTableUuid,

    // Queue position
    int? queuePosition,
  }) = _WaitlistEntry;

  factory WaitlistEntry.fromJson(Map<String, dynamic> json) =>
      _$WaitlistEntryFromJson(json);

  const WaitlistEntry._();

  /// Actual wait time in minutes
  int get actualWaitMinutes =>
      status == WaitlistStatus.seated && seatedAt != null
          ? seatedAt!.difference(createdAt).inMinutes
          : DateTime.now().difference(createdAt).inMinutes;

  /// Is ready to notify (within 5 mins of quoted time)
  bool get isReadyToNotify =>
      quotedWaitTime != null &&
      DateTime.now().difference(quotedWaitTime!).inMinutes >= -5;
}

/// Waitlist summary for display
@freezed
class WaitlistSummary with _$WaitlistSummary {
  const factory WaitlistSummary({
    required int totalWaiting,
    required int avgWaitMinutes,
    required int longestWaitMinutes,
    required Map<int, int> partySizeDistribution, // partySize -> count
  }) = _WaitlistSummary;

  factory WaitlistSummary.fromJson(Map<String, dynamic> json) =>
      _$WaitlistSummaryFromJson(json);
}
