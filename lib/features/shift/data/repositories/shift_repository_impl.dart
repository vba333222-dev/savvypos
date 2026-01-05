import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';
import 'package:savvy_pos/core/database/database.dart';
import 'package:savvy_pos/features/shift/domain/repositories/i_shift_repository.dart';
import 'package:uuid/uuid.dart';

@LazySingleton(as: IShiftRepository)
class ShiftRepositoryImpl implements IShiftRepository {
  final AppDatabase db;
  final Uuid _uuid = const Uuid();

  ShiftRepositoryImpl(this.db);

  @override
  Future<ShiftSessionTableData?> getCurrentShift() async {
    return (db.select(db.shiftSessionTable)
          ..where((t) => t.isClosed.equals(false))
          ..orderBy([(t) => OrderingTerm(expression: t.startShift, mode: OrderingMode.desc)])
          ..limit(1))
        .getSingleOrNull();
  }

  @override
  Future<void> openShift(double startCash, String staffId, String staffName) async {
    await db.into(db.shiftSessionTable).insert(ShiftSessionTableCompanion.insert(
      uuid: _uuid.v4(),
      staffId: staffId,
      staffName: staffName,
      startShift: DateTime.now(),
      startCash: startCash,
      expectedCash: startCash, // Initially expected = start
      actualCash: 0.0,
      difference: 0.0,
      isClosed: const Value(false),
    ));
  }

  @override
  Future<void> closeShift(String shiftUuid, double actualCash) async {
    await db.transaction(() async {
      final shift = await (db.select(db.shiftSessionTable)..where((t) => t.uuid.equals(shiftUuid))).getSingle();
      
      // Calculate Totals
      // 1. Sales (Orders linked to shift)
      // Note: Ensure CartBloc saves shiftUuid. If null, we might miss sales here.
      final orders = await (db.select(db.orderTable)..where((t) => t.shiftUuid.equals(shiftUuid))).get();
      final totalSales = orders.fold(0.0, (sum, o) => sum + o.grandTotal);

      // 2. Cash Transactions
      final txs = await (db.select(db.cashTransactionTable)..where((t) => t.shiftUuid.equals(shiftUuid))).get();
      double payIn = 0;
      double payOut = 0;
      for (var t in txs) {
        if (t.type == 'PAY_IN') payIn += t.amount;
        if (t.type == 'PAY_OUT') payOut += t.amount;
      }
      
      final expected = shift.startCash + totalSales + payIn - payOut;
      final difference = actualCash - expected;

      await (db.update(db.shiftSessionTable)..where((t) => t.uuid.equals(shiftUuid))).write(ShiftSessionTableCompanion(
        endShift: Value(DateTime.now()),
        expectedCash: Value(expected),
        actualCash: Value(actualCash),
        difference: Value(difference),
        isClosed: const Value(true),
      ));
    });
  }

  @override
  Future<void> addCashTransaction(String shiftUuid, String type, double amount, String reason) async {
    await db.into(db.cashTransactionTable).insert(CashTransactionTableCompanion.insert(
      uuid: _uuid.v4(),
      shiftUuid: Value(shiftUuid),
      type: type,
      amount: amount,
      reason: Value(reason),
      createdAt: DateTime.now(),
    ));
  }

  @override
  Future<Map<String, double>> getCashTransactionSummary(String shiftUuid) async {
    final txs = await (db.select(db.cashTransactionTable)..where((t) => t.shiftUuid.equals(shiftUuid))).get();
    double payIn = 0;
    double payOut = 0;
    for (var t in txs) {
      if (t.type == 'PAY_IN') payIn += t.amount;
      if (t.type == 'PAY_OUT') payOut += t.amount;
    }
    return {'payIn': payIn, 'payOut': payOut};
  }
}
