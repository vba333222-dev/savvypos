import 'package:freezed_annotation/freezed_annotation.dart';

part 'kiosk_entities.freezed.dart';
part 'kiosk_entities.g.dart';

/// Represents a customer self-ordering session
@freezed
class KioskSession with _$KioskSession {
  const factory KioskSession({
    required String uuid,
    required DateTime startedAt, // Time session began
    DateTime? lastInteractionAt, // For idle timeout logic

    // Guest Preferences
    @Default('en') String languageCode,
    @Default(false) bool isDineIn,

    // Current Order State
    @Default([]) List<KioskCartItem> cartItems,

    // Status
    @Default(KioskFlowStep.welcome) KioskFlowStep currentStep,
  }) = _KioskSession;

  const KioskSession._();

  double get totalAmount =>
      cartItems.fold(0, (sum, item) => sum + (item.unitPrice * item.quantity));

  factory KioskSession.fromJson(Map<String, dynamic> json) =>
      _$KioskSessionFromJson(json);
}

enum KioskFlowStep {
  welcome, // "Tap to Start"
  diningOption, // "Eat In" or "Take Out"
  menu, // Browsing products
  cart, // Review order + Upsell
  payment, // Processing payment
  success, // "Thank you" screen
}

@freezed
class KioskCartItem with _$KioskCartItem {
  const factory KioskCartItem({
    required String uuid,
    required String productUuid,
    required String name,
    required double unitPrice,
    required int quantity,

    // Image for visual confirmation
    String? imageUrl,

    // Selected options
    @Default([]) List<String> modifiers,
    String? note,
  }) = _KioskCartItem;

  factory KioskCartItem.fromJson(Map<String, dynamic> json) =>
      _$KioskCartItemFromJson(json);
}
