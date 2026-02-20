import 'package:injectable/injectable.dart';
import 'package:savvy_pos/features/inventory/domain/repositories/i_inventory_repository.dart';

@injectable
class ReceiveGoods {
  final IInventoryRepository _repository;

  ReceiveGoods(this._repository);

  Future<void> call(String poUuid, Map<String, double> quantities) async {
    await _repository.receiveGoods(poUuid, quantities);
  }
}
