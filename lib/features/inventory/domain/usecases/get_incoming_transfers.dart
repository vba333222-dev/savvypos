import 'package:injectable/injectable.dart';
import 'package:savvy_pos/features/inventory/domain/entities/inventory_entities.dart';
import 'package:savvy_pos/features/inventory/domain/repositories/i_inventory_repository.dart';

@injectable
class GetIncomingTransfers {
  final IInventoryRepository _repository;

  GetIncomingTransfers(this._repository);

  Future<List<StockTransfer>> call(String targetWarehouseUuid) async {
    return await _repository.getIncomingTransfers(targetWarehouseUuid);
  }
}
