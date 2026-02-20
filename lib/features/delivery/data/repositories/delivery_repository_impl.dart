import 'package:drift/drift.dart';
import 'package:logger/logger.dart';
import 'package:savvy_pos/core/database/database.dart';
import 'package:savvy_pos/features/delivery/domain/entities/delivery_channel.dart';
import 'package:savvy_pos/features/delivery/domain/repositories/i_delivery_repository.dart';
import 'package:uuid/uuid.dart';

class DeliveryRepositoryImpl implements IDeliveryRepository {
  final AppDatabase db;
  final Logger _logger = Logger();

  DeliveryRepositoryImpl(this.db);

  @override
  Future<List<DeliveryChannelConfig>> getConfigs() async {
    final rows = await db.select(db.deliveryChannelTable).get();
    return rows.map((row) => DeliveryChannelConfig(
      id: row.id,
      provider: DeliveryProvider.values.firstWhere((e) => e.name == row.provider),
      isActive: row.isActive,
      autoAcceptOrders: row.autoAcceptOrders,
      surchargePercent: row.surchargePercent,
      lastSyncedAt: row.lastSyncedAt,
    )).toList();
  }

  @override
  Future<void> updateConfig(DeliveryChannelConfig config) async {
    await db.into(db.deliveryChannelTable).insertOnConflictUpdate(
      DeliveryChannelTableCompanion(
        id: Value(config.id),
        provider: Value(config.provider.name),
        isActive: Value(config.isActive),
        autoAcceptOrders: Value(config.autoAcceptOrders),
        surchargePercent: Value(config.surchargePercent),
        lastSyncedAt: Value(DateTime.now()),
      )
    );
  }

  @override
  Future<String> simulateIncomingOrder(DeliveryProvider provider, Map<String, dynamic> payload) async {
    final channelId = provider == DeliveryProvider.uberEats ? 'uber_eats' : 'grab_food';
    final config = await (db.select(db.deliveryChannelTable)..where((t) => t.id.equals(channelId))).getSingleOrNull();
    
    if (config == null || !config.isActive) {
      throw Exception('Channel $channelId is inactive or not configured');
    }

    final orderUuid = const Uuid().v4();
    final now = DateTime.now();
    
    // 1. Create Core Order
    // In a real app, items would be parsed from payload mapping.
    // Here we simulate a standard "Burger & Fries" payload.
    await db.transaction(() async {
      await db.into(db.orderTable).insert(OrderTableCompanion.insert(
        uuid: orderUuid,
        orderNumber: payload['display_id'] ?? 'EXT-${DateTime.now().millisecond}',
        transactionDate: now,
        subtotal: 100.0, // Mock
        taxTotal: 10.0,
        discountTotal: 0,
        grandTotal: 110.0,
        paymentMethod: Value(provider.name.toUpperCase()),
        status: const Value('NEW'),
        paymentStatus: const Value('PAID'), 
        isFulfilled: const Value(false),
      ));

      // 2. Insert Dummy Items
      await db.into(db.orderItemTable).insert(OrderItemTableCompanion.insert(
        orderUuid: orderUuid,
        productUuid: 'mock-burger', // Assuming exists or foreign key constraint might fail if strict. 
        // Note: If Foreign Key fails, we need to ensure product exists. 
        // SAFEGUARD: Using a random non-FK insert or ensure product seeding.
        // For MVP demo, avoiding FK strictnes or assuming seeded.
        // Let's use a "Generic Item" approach if possible or just Text.
        // Checking tables.dart: productUuid is TextColumn NOT references ProductTable (Line 236). Good.
        name: '${provider.name} Meal Deal',
        price: 100.0,
        quantity: 1,
        total: 100.0,
      ));

      // 3. Insert Delivery Metadata
      await db.into(db.deliveryOrderMetadataTable).insert(DeliveryOrderMetadataTableCompanion.insert(
        orderUuid: orderUuid,
        provider: provider.name,
        externalOrderId: payload['id'] ?? 'EXT-${const Uuid().v4().substring(0,8)}',
        driverName: Value(payload['driver_name']),
        driverPlate: Value(payload['driver_plate']),
        deliveryStatus: const Value('NEW'),
      ));
    });
    
    _logger.i('Simulated Order $orderUuid from $provider');
    return orderUuid;
  }

  @override
  Future<void> updateDeliveryStatus(String orderUuid, String status, {String? driverName}) async {
    await (db.update(db.deliveryOrderMetadataTable)..where((t) => t.orderUuid.equals(orderUuid))).write(
      DeliveryOrderMetadataTableCompanion(
        deliveryStatus: Value(status),
        driverName: driverName != null ? Value(driverName) : const Value.absent(),
      )
    );
  }

  @override
  Future<void> syncMenuToChannel(DeliveryProvider provider) async {
    // Mock Sync
    await Future.delayed(const Duration(seconds: 2));
    final channelId = provider == DeliveryProvider.uberEats ? 'uber_eats' : 'grab_food';
    await (db.update(db.deliveryChannelTable)..where((t) => t.id.equals(channelId))).write(
      DeliveryChannelTableCompanion(lastSyncedAt: Value(DateTime.now()))
    );
  }
}
