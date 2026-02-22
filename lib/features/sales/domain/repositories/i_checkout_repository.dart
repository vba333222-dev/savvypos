import 'package:savvy_pos/features/sales/domain/entities/payment_transaction.dart';
import 'package:savvy_pos/core/database/database.dart';

abstract class ICheckoutRepository {
  Future<void> addPayment(PaymentTransaction transaction);
  Stream<List<PaymentTransaction>> watchPayments(String orderUuid);
  Future<List<PaymentTransaction>> getPayments(String orderUuid);
  Future<void> updateOrderStatus(
      String orderUuid, String status); // PARTIAL, PAID
  Future<List<OrderItemTableData>> getOrderItems(String orderUuid);
}
