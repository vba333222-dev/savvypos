import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';
import 'package:savvy_pos/core/database/database.dart';
import 'package:savvy_pos/features/sales/domain/entities/payment_transaction.dart';
import 'package:savvy_pos/features/sales/domain/repositories/i_checkout_repository.dart';

@Injectable(as: ICheckoutRepository)
class CheckoutRepositoryImpl implements ICheckoutRepository {
  final AppDatabase _db;

  CheckoutRepositoryImpl(this._db);

  @override
  Future<void> addPayment(PaymentTransaction transaction) async {
    await _db.into(_db.paymentTransactionTable).insert(
          PaymentTransactionTableCompanion.insert(
            uuid: transaction.uuid,
            orderUuid: transaction.orderUuid,
            method: transaction.method.name,
            amount: transaction.amount,
            tendered: Value(transaction.tendered),
            change: Value(transaction.change),
            status: Value(transaction.status.name),
            createdAt: transaction.createdAt,
            note: Value(transaction.note),
          ),
        );
  }

  @override
  Stream<List<PaymentTransaction>> watchPayments(String orderUuid) {
    return (_db.select(_db.paymentTransactionTable)
          ..where((t) => t.orderUuid.equals(orderUuid))
          ..orderBy([
            (t) =>
                OrderingTerm(expression: t.createdAt, mode: OrderingMode.desc)
          ]))
        .watch()
        .map((rows) => rows.map(_mapToEntity).toList());
  }

  @override
  Future<List<PaymentTransaction>> getPayments(String orderUuid) async {
    final rows = await (_db.select(_db.paymentTransactionTable)
          ..where((t) => t.orderUuid.equals(orderUuid))
          ..orderBy([
            (t) =>
                OrderingTerm(expression: t.createdAt, mode: OrderingMode.desc)
          ]))
        .get();
    return rows.map(_mapToEntity).toList();
  }

  @override
  Future<void> updateOrderStatus(String orderUuid, String status) async {
    await (_db.update(_db.orderTable)..where((t) => t.uuid.equals(orderUuid)))
        .write(OrderTableCompanion(
      status: Value(status),
      paymentStatus:
          Value(status == 'COMPLETED' ? 'PAID' : 'PARTIAL'), // Simplified logic
    ));
  }

  @override
  Future<List<OrderTableData>> getHangingTransactions() async {
    return (_db.select(_db.orderTable)
          ..where((t) => t.status.equals('PROCESSING_PAYMENT')))
        .get();
  }

  @override
  Future<List<OrderItemTableData>> getOrderItems(String orderUuid) {
    return (_db.select(_db.orderItemTable)
          ..where((t) => t.orderUuid.equals(orderUuid)))
        .get();
  }

  PaymentTransaction _mapToEntity(PaymentTransactionTableData data) {
    return PaymentTransaction(
      uuid: data.uuid,
      orderUuid: data.orderUuid,
      method: PaymentMethod.values.firstWhere((e) => e.name == data.method,
          orElse: () => PaymentMethod.custom),
      amount: data.amount,
      tendered: data.tendered,
      change: data.change,
      status: PaymentStatus.values.firstWhere((e) => e.name == data.status,
          orElse: () => PaymentStatus.paid),
      createdAt: data.createdAt,
      note: data.note,
    );
  }
}
