import 'package:savvy_pos/features/inventory/data/repositories/inventory_repository_impl.dart';

abstract class IInventoryRepository {
  Future<void> transferStock({
    required String sourceWarehouseId,
    required String targetWarehouseId,
    required List<StockTransferItem> items,
    required String referenceNote,
  });

  Future<void> receiveGoods({
    required String purchaseOrderUuid,
    required String warehouseUuid,
    required List<Map<String, dynamic>> items,
  });
}

class StockTransferItem {
  final String productUuid;
  final double quantity;

  const StockTransferItem({required this.productUuid, required this.quantity});
}
