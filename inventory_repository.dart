// inventory_repository.dart

import 'package:drift/drift.dart';
import 'package:savvy_pos/core/database/database.dart';
import 'package:savvy_pos/core/database/tables.dart';

class InventoryRepository {
  final AppDatabase db;
  InventoryRepository(this.db);

  // --- LOGIKA BACA STOK (SUDAH BENAR) ---
  Future<double> getDisplayStock(String productUuid) async {
    return db.transaction(() async {
      // 1. Ambil Cache (Server Quantity)
      final cache = await (db.select(db.inventoryCache)
            ..where((tbl) => tbl.productUuid.equals(productUuid)))
          .getSingleOrNull();
      
      final double baseQty = cache?.serverQuantity ?? 0.0;

      // 2. Hitung Delta Lokal (Belum Sync)
      // Drift: Select quantityChange from inventoryLedger where productUuid == ... and isSynced == false
      final localDeltas = await (db.select(db.inventoryLedger)
            ..where((tbl) => tbl.productUuid.equals(productUuid) & tbl.isSynced.equals(false)))
          .get();

      final double pendingChange = localDeltas.fold(0.0, (sum, item) => sum + item.quantityChange);

      return baseQty + pendingChange;
    });
  }

  // --- LOGIKA TULIS TRANSAKSI (OPTIMASI ACID) ---
  // Sebaiknya Order dan Ledger disimpan berbarengan
  Future<void> createOrderWithInventoryEffect(OrderCompanion order, List<OrderItemCompanion> items) async {
    await db.transaction(() async {
      // 1. Simpan Order
      await db.into(db.order).insert(order);

      // 2. Simpan Order Items
      for (final item in items) {
        await db.into(db.orderItem).insert(item);
        
        // 3. Buat Ledger Entry untuk setiap item (Penguranan Stok)
        // Cek logic service/trackStock di sini jika perlu (query product dulu)
        
        final ledger = InventoryLedgerCompanion(
          productUuid: item.productUuid,
          quantityChange: Value(-item.quantity.value), // Kurangi stok
          referenceId: order.uuid,
          type: const Value(StockMovementType.sale),
          timestamp: Value(DateTime.now()),
          isSynced: const Value(false),
        );

        await db.into(db.inventoryLedger).insert(ledger);
      }
    });
  }
}