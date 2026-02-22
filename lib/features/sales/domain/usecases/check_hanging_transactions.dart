import 'package:injectable/injectable.dart';
import 'package:savvy_pos/core/database/database.dart';
import 'package:savvy_pos/features/sales/domain/repositories/i_checkout_repository.dart';

@injectable
class CheckHangingTransactionsUseCase {
  final ICheckoutRepository _repository;

  CheckHangingTransactionsUseCase(this._repository);

  /// Retrieves any active transaction left in 'PROCESSING_PAYMENT' state 
  /// due to an abnormal terminal shutdown or crash.
  Future<List<OrderTableData>> execute() async {
    return _repository.getHangingTransactions();
  }

  /// Restores a hanging transaction back to its initial DRAFT status
  Future<void> revertToCart(String orderUuid) async {
    return _repository.updateOrderStatus(orderUuid, 'DRAFT');
  }

  /// Forces a hanging transaction to COMPLETED (if manager confirms payment received in drawer/EDC)
  Future<void> markAsSuccess(String orderUuid) async {
    return _repository.updateOrderStatus(orderUuid, 'COMPLETED');
  }
}
