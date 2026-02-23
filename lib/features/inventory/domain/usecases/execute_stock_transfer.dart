import 'package:savvy_pos/core/utils/time_helper.dart';
import 'package:injectable/injectable.dart';
import 'package:savvy_pos/features/inventory/domain/entities/inventory_entities.dart';
import 'package:savvy_pos/features/inventory/domain/repositories/i_inventory_repository.dart';
import 'package:uuid/uuid.dart';

@injectable
class ExecuteStockTransfer {
  final IInventoryRepository _repository;

  ExecuteStockTransfer(this._repository);

  Future<void> call({
    required String sourceWarehouseId,
    required String targetWarehouseId,
    required List<StockTransferItem> items,
    required String referenceNote,
    required String createdBy,
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

    // 2. Execute Atomic Transfer via StockTransfer entity
    final transfer = StockTransfer(
      uuid: const Uuid().v4(),
      sourceWarehouseUuid: sourceWarehouseId,
      targetWarehouseUuid: targetWarehouseId,
      status: 'IN_TRANSIT',
      createdBy: createdBy,
      createdAt: TimeHelper.now(),
      items: items,
    );

    await _repository.transferStock(transfer);
  }
}
