import 'package:savvy_pos/core/utils/time_helper.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'customer_profile.freezed.dart';
part 'customer_profile.g.dart';

enum CustomerSegment {
  newGuest, // First visit
  returning, // 2-5 visits
  regular, // 6+ visits
  vip, // High spender
  lapsed, // No visit in 60+ days
}

@freezed
class CustomerProfile with _$CustomerProfile {
  const factory CustomerProfile({
    required String uuid,
    required String name,
    String? email,
    String? phoneNumber,
    DateTime? birthday,
    @Default(0) int visitCount,
    @Default(0.0) double totalSpent,
    @Default(0.0) double averageOrderValue,
    DateTime? firstVisit,
    DateTime? lastVisit,
    @Default([]) List<String> tags, // ['VIP', 'Allergies', 'Birthday']
    @Default([]) List<CustomerNote> notes,
    @Default(CustomerSegment.newGuest) CustomerSegment segment,
  }) = _CustomerProfile;

  factory CustomerProfile.fromJson(Map<String, dynamic> json) =>
      _$CustomerProfileFromJson(json);
}

extension CustomerProfileX on CustomerProfile {
  bool get isLapsed =>
      lastVisit != null && TimeHelper.now().difference(lastVisit!).inDays > 60;
  bool get isVip => totalSpent > 500;
  bool get hasBirthdayThisMonth =>
      birthday != null && birthday!.month == TimeHelper.now().month;
}

@freezed
class CustomerNote with _$CustomerNote {
  const factory CustomerNote({
    required String id,
    required String content,
    required String createdBy,
    required DateTime createdAt,
    @Default(false) bool isCritical, // Show popup on order
  }) = _CustomerNote;

  factory CustomerNote.fromJson(Map<String, dynamic> json) =>
      _$CustomerNoteFromJson(json);
}

@freezed
class OrderHistoryItem with _$OrderHistoryItem {
  const factory OrderHistoryItem({
    required String orderUuid,
    required DateTime orderDate,
    required double total,
    required int itemCount,
    required String paymentMethod,
    String? channel, // 'dine_in', 'takeout', 'delivery'
  }) = _OrderHistoryItem;

  factory OrderHistoryItem.fromJson(Map<String, dynamic> json) =>
      _$OrderHistoryItemFromJson(json);
}

@freezed
class CustomerInsights with _$CustomerInsights {
  const factory CustomerInsights({
    required int totalNewGuests,
    required int totalReturning,
    required int totalLapsed,
    required double averageSpendAll,
    required String topItem, // Most ordered item by this customer
    String? lastOrderChannel,
  }) = _CustomerInsights;

  factory CustomerInsights.fromJson(Map<String, dynamic> json) =>
      _$CustomerInsightsFromJson(json);
}
