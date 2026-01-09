import 'package:injectable/injectable.dart';
import 'package:savvy_pos/features/inventory/domain/repositories/i_inventory_repository.dart';

@injectable
class ExecuteStockTransfer {
  final IInventoryRepository _repository;

  ExecuteStockTransfer(this._repository);

  Future<void> call({
    required String sourceWarehouseId,
    required String targetWarehouseId,
    required List<StockTransferItem> items,
    required String referenceNote,
  }) async {
    // 1. Validate Inputs
    if (sourceWarehouseId == targetWarehouseId) {
      throw Exception("Cannot transfer stock to the same warehouse.");
    }
    if (items.isEmpty) {
      throw Exception("Transfer list cannot be empty.");
    }
    if (items.any((i) => i.quantity <= 0)) {
       throw Exception("Quantity must be greater than zero.");
    }

    // 2. Execute Atomic Transfer
    await _repository.transferStock(
      sourceWarehouseId: sourceWarehouseId,
      targetWarehouseId: targetWarehouseId,
      items: items,
      referenceNote: referenceNote,
    );
  }
}
