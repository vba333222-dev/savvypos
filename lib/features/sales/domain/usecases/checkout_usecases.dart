import 'package:injectable/injectable.dart';
import 'package:savvy_pos/features/sales/domain/entities/payment_transaction.dart';
import 'package:savvy_pos/features/sales/domain/repositories/i_checkout_repository.dart';

@injectable
class ProcessPaymentUseCase {
  final ICheckoutRepository _repository;
  ProcessPaymentUseCase(this._repository);

  Future<void> call({
    required String orderUuid,
    required PaymentMethod method,
    required double amount,
    double? tendered,
    String? note,
  }) async {
    // 1. Validate
    if (amount <= 0) throw Exception('Payment amount must be positive');
    
    // 2. Calculate Change
    double? change;
    if (method == PaymentMethod.cash && tendered != null) {
      if (tendered < amount) throw Exception('Tendered amount is less than due amount');
      change = tendered - amount;
    }

    // 3. Create Transaction
    final transaction = PaymentTransaction(
      uuid: DateTime.now().millisecondsSinceEpoch.toString(), // Temporary UUID gen
      orderUuid: orderUuid,
      method: method,
      amount: amount,
      tendered: tendered,
      change: change,
      status: PaymentStatus.paid,
      createdAt: DateTime.now(),
      note: note,
    );

    // 4. Persist
    await _repository.addPayment(transaction);
  }
}

@injectable
class GetOrderBalanceUseCase {
  final ICheckoutRepository _repository;
  GetOrderBalanceUseCase(this._repository);

  Stream<double> call(String orderUuid, double totalAmount) {
    return _repository.watchPayments(orderUuid).map((transactions) {
      final paid = transactions
          .where((t) => t.status == PaymentStatus.paid)
          .fold(0.0, (sum, t) => sum + t.amount);
      return totalAmount - paid;
    });
  }
}
