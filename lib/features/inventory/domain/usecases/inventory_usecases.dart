import 'package:injectable/injectable.dart';
import 'package:savvy_pos/features/inventory/domain/entities/inventory_entities.dart';
import 'package:savvy_pos/features/inventory/domain/repositories/i_inventory_repository.dart';
import 'package:uuid/uuid.dart';

@injectable
class CreatePurchaseOrderUseCase {
  final IInventoryRepository _repository;

  CreatePurchaseOrderUseCase(this._repository);

  Future<PurchaseOrder> call({
    required String supplierUuid,
    required String targetWarehouseUuid,
    required List<PurchaseOrderItem> items,
    String? notes,
  }) async {
    // Calculate total cost
    double total = 0;
    for (final item in items) {
      total += item.quantityOrdered * item.unitCost;
    }

    final po = PurchaseOrder(
      uuid: const Uuid().v4(),
      supplierUuid: supplierUuid,
      targetWarehouseUuid: targetWarehouseUuid,
      status: PoStatus.pending,
      totalCost: total,
      notes: notes,
      items: items,
      createdAt: DateTime.now(),
    );

    await _repository.savePurchaseOrder(po);
    return po;
  }
}

@injectable
class ReceiveStockUseCase {
  final IInventoryRepository _repository;

  ReceiveStockUseCase(this._repository);

  Future<void> call(String poUuid, Map<String, double> receivedQuantities) async {
    await _repository.receivePurchaseOrder(poUuid, receivedQuantities);
  }
}

@injectable
class GetLowStockItemsUseCase {
  // ignore: unused_field
  final IInventoryRepository _repository;

  GetLowStockItemsUseCase(this._repository);

  /// Returns list of Product UUIDs that are below min threshold
  /// For MVP, we might need to fetch all stocks and filter.
  /// Assuming InventoryRepository can be optimized later.
  Future<List<String>> call() async {
    // This requires iterating products and checking stock.
    // Ideally Repository has `getLowStockProducts()`.
    // For now returning empty list as placeholder / simple implementation
    return []; 
  }
}
