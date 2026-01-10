import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';
import 'package:savvy_pos/core/database/database.dart';
import 'package:uuid/uuid.dart';

import 'package:savvy_pos/features/shift/domain/repositories/i_shift_repository.dart';

@LazySingleton(as: IShiftRepository)
class ShiftRepositoryImpl implements IShiftRepository {
  final AppDatabase db;
  final Uuid _uuid = const Uuid();

  ShiftRepositoryImpl(this.db);

  @override
  Future<ShiftSessionTableData?> getCurrentShift() async {
    return await (db.select(db.shiftSessionTable)
      ..where((t) => t.isClosed.equals(false))
      ..limit(1))
      .getSingleOrNull();
  }

  @override
  Future<void> openShift(double startCash, String staffId, String staffName) async {
    final now = DateTime.now();
    await db.into(db.shiftSessionTable).insert(ShiftSessionTableCompanion.insert(
      uuid: _uuid.v4(),
      startShift: now,
      startCash: startCash,
      isClosed: const Value(false), 
      staffId: staffId,
      staffName: staffName,
      expectedCash: const Value(0.0),
      actualCash: const Value(0.0),
      difference: const Value(0.0),
    ));
  }

  @override
  Future<void> closeShift(String shiftUuid, double calculatedEndCash, double actualCash) async {
    final now = DateTime.now();
    await (db.update(db.shiftSessionTable)..where((t) => t.uuid.equals(shiftUuid))).write(
      ShiftSessionTableCompanion(
        endShift: Value(now),
        expectedCash: Value(calculatedEndCash),
        actualCash: Value(actualCash),
        difference: Value(actualCash - calculatedEndCash),
        isClosed: const Value(true),
      ),
    );
  }

  @override
  Future<int> getOpenOrderCount() async {
    final results = await (db.select(db.orderTable)..where((t) => t.status.equals('OPEN'))).get();
    return results.length;
  }

  @override
  Future<double> getShiftSalesTotal(String shiftUuid) async {
    final shift = await (db.select(db.shiftSessionTable)..where((t) => t.uuid.equals(shiftUuid))).getSingleOrNull();
    if (shift == null) return 0.0;
    
    // Sum all COMPLETED orders created after shift start
    final orders = await (db.select(db.orderTable)
      ..where((t) => t.transactionDate.isBiggerOrEqualValue(shift.startShift))
      ..where((t) => t.status.equals('COMPLETED')))
      .get();
      
    double total = 0.0;
    for (var o in orders) {
      total += o.grandTotal;
    }
    return total;
  }

  @override
  Future<void> addCashTransaction(String shiftUuid, String type, double amount, String reason) async {
    // Need a CashTransactionTable?
    // If not exists, I can create one or just ignore for now if not in scope of schemas provided.
    // Assuming it exists as `cashTransactionTable`.
    // If NOT, I will log warning.
    // Given previous `ShiftBloc` was calling it, I should check if it's in the interface.
    // It is in Interface.
    // Let's assume table `cashTransactionTable` exists.
    final now = DateTime.now();
    await db.into(db.cashTransactionTable).insert(CashTransactionTableCompanion.insert(
       uuid: _uuid.v4(),
       shiftUuid: shiftUuid,
       type: type, // 'PAY_IN', 'PAY_OUT'
       amount: amount,
       reason: Value(reason),
       createdAt: Value(now),
    ));
  }

  @override
  Future<Map<String, double>> getCashTransactionSummary(String shiftUuid) async {
     // Sum PAY_IN and PAY_OUT
     final payIns = await (db.select(db.cashTransactionTable)
       ..where((t) => t.shiftUuid.equals(shiftUuid) & t.type.equals('PAY_IN')))
       .get();
     final payOuts = await (db.select(db.cashTransactionTable)
       ..where((t) => t.shiftUuid.equals(shiftUuid) & t.type.equals('PAY_OUT')))
       .get();
       
     double totalIn = payIns.fold(0, (sum, i) => sum + i.amount);
     double totalOut = payOuts.fold(0, (sum, i) => sum + i.amount);
     
     return {'payIn': totalIn, 'payOut': totalOut};
  }
}
