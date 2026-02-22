import 'package:injectable/injectable.dart';
import 'package:savvy_pos/features/inventory/domain/repositories/i_inventory_repository.dart';

@injectable
class ReceiveStockTransfer {
  final IInventoryRepository _repository;

  ReceiveStockTransfer(this._repository);

  Future<void> call({
    required String transferUuid,
    required String receiverId,
  }) async {
    if (transferUuid.isEmpty) {
      throw Exception("Transfer UUID cannot be empty.");
    }

    await _repository.receiveStockTransfer(transferUuid, receiverId);
  }
}
