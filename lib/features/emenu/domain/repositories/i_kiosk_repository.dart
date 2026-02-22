import 'package:savvy_pos/features/emenu/domain/entities/kiosk_entities.dart';

abstract class IKioskRepository {
  /// Start a new session
  Future<KioskSession> startSession();

  /// Update session interactions (reset timeout)
  Future<void> touchSession(String sessionUuid);

  /// Update flow step
  Future<void> updateStep(String sessionUuid, KioskFlowStep step);

  /// Update dining option
  Future<void> setDiningOption(String sessionUuid, bool isDineIn);

  // Cart Actions
  Future<void> addToCart(String sessionUuid, KioskCartItem item);
  Future<void> removeFromCart(String sessionUuid, String itemUuid);
  Future<void> updateCartItemQuantity(
      String sessionUuid, String itemUuid, int quantity);
  Future<void> clearCart(String sessionUuid);

  /// Submit order to POS system
  Future<String> submitOrder(String sessionUuid);

  /// Stream active session state
  Stream<KioskSession?> watchSession();
}
