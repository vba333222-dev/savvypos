import 'package:savvy_pos/features/delivery/domain/entities/delivery_channel.dart';

abstract class IDeliveryRepository {
  /// Get configurations for all channels
  Future<List<DeliveryChannelConfig>> getConfigs();

  /// Update a channel config (e.g., toggle active/busy mode)
  Future<void> updateConfig(DeliveryChannelConfig config);

  /// Simulate an incoming webhook from a provider
  /// [payload] mock JSON from Uber/Grab
  /// Returns the internal Order UUID created
  Future<String> simulateIncomingOrder(
      DeliveryChannel provider, Map<String, dynamic> payload);

  /// Update delivery status (e.g., driver arrived)
  Future<void> updateDeliveryStatus(String orderUuid, String status,
      {String? driverName});

  /// Sync menu to external provider (Mock)
  Future<void> syncMenuToChannel(DeliveryChannel provider);
}
