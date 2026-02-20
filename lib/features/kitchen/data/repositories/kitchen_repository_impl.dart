import 'dart:convert';
import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';
import 'package:savvy_pos/core/database/database.dart';
import 'package:savvy_pos/features/kitchen/domain/entities/kitchen_order.dart';
import 'package:savvy_pos/features/kitchen/domain/repositories/i_kitchen_repository.dart';

@LazySingleton(as: IKitchenRepository, env: [Environment.prod])
class KitchenRepositoryImpl implements IKitchenRepository {
  final AppDatabase db;

  KitchenRepositoryImpl(this.db);

  @override
  Stream<List<KitchenOrder>> getActiveKitchenOrders() {
    // Select Orders that are NOT fulfilled and are COMPLETED (Paid/Sent)
    // We join OrderItem and Product to filter only 'FOOD' or similar if needed, 
    // but requirement doesn't explicitly strict it. We'll show all. 
    // Actually, KDS usually shows Food. 
    // Let's join Product to check printerCategory? 
    // User task: "Ticket Content: List of Items".
    // "Kitchen Staff (KDS)".
    
    final query = db.select(db.orderTable).join([
      innerJoin(db.orderItemTable, db.orderItemTable.orderUuid.equalsExp(db.orderTable.uuid)),
      innerJoin(db.productTable, db.productTable.uuid.equalsExp(db.orderItemTable.productUuid)),
    ])
      ..where(db.orderTable.isFulfilled.equals(false) & 
              db.orderTable.status.equals('COMPLETED'))
      ..orderBy([OrderingTerm.asc(db.orderTable.transactionDate)]); // Oldest first

    return query.watch().map((rows) {
      final grouped = <String, KitchenOrder>{};

      for (final row in rows) {
        final order = row.readTable(db.orderTable);
        final item = row.readTable(db.orderItemTable);
        final product = row.readTable(db.productTable);

        // Filter: Only show FOOD items in KDS? 
        // Or show all but highlight? 
        // Let's show specific categories if 'FOOD'. 
        // If product.printerCategory == 'FOOD'.
        if (product.printerCategory == 'FOOD') {
            if (!grouped.containsKey(order.uuid)) {
              grouped[order.uuid] = KitchenOrder(order: order, items: []);
            }
            
            // Parse modifiers
            List<String> modifierNames = [];
            if (item.modifiersJson != null && item.modifiersJson!.isNotEmpty) {
              try {
                final List<dynamic> jsonList = jsonDecode(item.modifiersJson!);
                // Expecting list of ModifierItem JSON or just objects with 'name'
                // CartBloc saves: map((e) => e.toJson())
                // ModifierItem.toJson() -> {uuid, name, ...}
                modifierNames = jsonList.map((e) => e['name'] as String).toList();
              } catch (e) {
                // Ignore parsing errors
              }
            }

            grouped[order.uuid]!.items.add(KitchenOrderItem(
              item: item,
              productName: product.name,
              modifiers: modifierNames,
            ));
        }
      }
      
      return grouped.values.toList();
    });
  }

  @override
  Future<void> markOrderFulfilled(String orderUuid) async {
    await (db.update(db.orderTable)..where((t) => t.uuid.equals(orderUuid))).write(
      const OrderTableCompanion(isFulfilled: Value(true)),
    );
  }

  @override
  Future<void> markItemFulfilled(String itemUuid) async {
    // TODO: Add item-level fulfillment column to schema and update here.
    // For now, no-op stub to satisfy interface.
  }

  @override
  Future<void> markOrderStarted(String orderUuid) async {
    // TODO: Update order status to 'PREPARING' for kitchen flow.
  }
}
