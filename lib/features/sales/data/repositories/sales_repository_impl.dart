import 'package:savvy_pos/core/utils/time_helper.dart';
import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';
import 'package:savvy_pos/core/database/database.dart';
import 'package:savvy_pos/features/inventory/domain/entities/product.dart';
import 'package:savvy_pos/features/sales/domain/entities/cart.dart';
import 'package:savvy_pos/features/sales/domain/entities/category.dart';
import 'package:savvy_pos/features/sales/domain/repositories/i_sales_repository.dart';
import 'package:uuid/uuid.dart';

@LazySingleton(as: ISalesRepository)
class SalesRepositoryImpl implements ISalesRepository {
  final AppDatabase _db;
  final Uuid _uuid = const Uuid();

  SalesRepositoryImpl(this._db);

  @override
  Stream<List<Category>> watchCategories() {
    return (_db.select(_db.categoryTable)
          ..where((t) => t.isDeleted.equals(false)))
        .watch()
        .map((rows) {
      return rows.map((row) {
        return Category(
          id: row.uuid,
          name: row.name,
          colorHex: row.colorHex,
        );
      }).toList();
    });
  }

  @override
  Stream<List<Product>> watchProducts({String? categoryId}) {
    final query = _db.select(_db.productTable)
      ..where((t) => t.isDeleted.equals(false));

    if (categoryId != null) {
      query.where((t) => t.categoryId.equals(categoryId));
    }

    return query.watch().map((rows) {
      return rows.map((row) {
        return Product(
          uuid: row.uuid,
          name: row.name,
          sku: row.sku,
          price: row.price,
          imageUrl: row.imageUrl,
          colorHex: row.colorHex,
          categoryId: row.categoryId,
          trackStock: row.trackStock,
          isService: row.isService,
          isComposite: row.isComposite,
          printerCategory: row.printerCategory,
        );
      }).toList();
    });
  }

  @override
  Future<List<ModifierGroupTableData>> getModifierGroups(
      String productUuid) async {
    // Join Link Table to get Groups
    final query = _db.select(_db.modifierGroupTable).join([
      innerJoin(
        _db.productModifierLinkTable,
        _db.productModifierLinkTable.modifierGroupUuid
            .equalsExp(_db.modifierGroupTable.uuid),
      ),
    ])
      ..where(_db.productModifierLinkTable.productUuid.equals(productUuid));

    return query.map((row) => row.readTable(_db.modifierGroupTable)).get();
  }

  @override
  Future<List<ModifierItemTableData>> getModifierItems(String groupId) {
    return (_db.select(_db.modifierItemTable)
          ..where((t) => t.groupUuid.equals(groupId))
          ..where((t) => t.isDeleted.equals(false)))
        .get();
  }

  @override
  Future<String> createOrder(
      Cart cart, String? tableUuid, String? customerUuid) async {
    if (cart.items.isEmpty) throw Exception("Cart is empty");

    final orderUuid = _uuid.v4();
    final now = TimeHelper.now();

    await _db.transaction(() async {
      // 1. Create Order
      await _db.into(_db.orderTable).insert(OrderTableCompanion.insert(
            uuid: orderUuid,
            orderNumber: 'ORD-${now.millisecondsSinceEpoch}', // Simple ID gen
            transactionDate: now,
            subtotal: cart.subtotal,
            discountTotal: 0, // Implement discount logic later
            taxTotal: cart.taxAmount,
            grandTotal: cart.total,
            paymentMethod: const Value('PENDING'),
            status: const Value('PROCESSING'),
            paymentStatus: const Value('PENDING'),
            isSynced: const Value(false),
            customerUuid: Value(customerUuid),
            isFulfilled: const Value(false),
          ));

      // 2. Create Order Items
      for (final item in cart.items) {
        await _db
            .into(_db.orderItemTable)
            .insert(OrderItemTableCompanion.insert(
              orderUuid: orderUuid,
              productUuid: item.product.uuid,
              name: item.product.name,
              price: item.product.price,
              quantity: item.quantity.toDouble(),
              total: item.total,
              paidQty: const Value(0),
              modifiersJson: Value(item.modifiers.join(',')),
            ));
      }

      // 3. Link to Table if provided
      if (tableUuid != null) {
        // Update table to be occupied and linked to this order
        await (_db.update(_db.restaurantTable)
              ..where((t) => t.uuid.equals(tableUuid)))
            .write(
          RestaurantTableCompanion(
            isOccupied: const Value(true),
            currentOrderUuid: Value(orderUuid),
            updatedAt: Value(now),
          ),
        );
      }
    });

    return orderUuid;
  }
}
