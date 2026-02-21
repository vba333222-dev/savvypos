import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';
import 'package:savvy_pos/core/database/database.dart';
import 'package:savvy_pos/core/database/repositories/i_data_retention_repository.dart';

@LazySingleton(as: IDataRetentionRepository)
class DataRetentionRepositoryImpl implements IDataRetentionRepository {
  final AppDatabase _db;

  DataRetentionRepositoryImpl(this._db);

  @override
  Future<int> purgeOldData({int olderThanDays = 30}) async {
    final cutoffDate = DateTime.now().subtract(Duration(days: olderThanDays));
    int totalDeleted = 0;

    // Run deletes inside a transaction for safety and performance
    await _db.transaction(() async {
      // 1. Purge Orders
      // Due to onDelete: KeyAction.cascade in OrderItemTable and PaymentTransactionTable,
      // deleting an OrderTable record automatically cleans the child tables.
      final deletedOrders = await (_db.delete(_db.orderTable)
            ..where((t) => t.transactionDate.isSmallerThanValue(cutoffDate))
            ..where((t) => t.isSynced.equals(true)))
          .go();

      // 2. Purge Audit Logs
      final deletedLogs = await (_db.delete(_db.auditLogTable)
            ..where((t) => t.timestamp.isSmallerThanValue(cutoffDate))
            ..where((t) => t.isSynced.equals(true)))
          .go();

      // Optionally purge old shift sessions
      final deletedShifts = await (_db.delete(_db.shiftSessionTable)
            ..where((t) => t.endShift.isSmallerThanValue(cutoffDate))
            ..where((t) => t.isSynced.equals(true))
            ..where((t) => t.isClosed.equals(true)))
          .go();

      totalDeleted = deletedOrders + deletedLogs + deletedShifts;
    });

    return totalDeleted;
  }
}
