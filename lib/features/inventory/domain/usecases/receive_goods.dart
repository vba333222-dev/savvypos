import 'package:injectable/injectable.dart';
import 'package:savvy_pos/features/inventory/domain/repositories/i_inventory_repository.dart';

@injectable
class ReceiveGoods {
  final IInventoryRepository _repository;

  ReceiveGoods(this._repository);

  Future<void> execute({
    required String purchaseOrderUuid,
    required String warehouseUuid, 
    required List<Map<String, dynamic>> items,
  }) async {
    await _repository.receiveGoods(
      purchaseOrderUuid: purchaseOrderUuid, 
      warehouseUuid: warehouseUuid, 
      items: items
    );
  }
}
