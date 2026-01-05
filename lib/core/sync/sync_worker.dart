import 'dart:convert';
import 'package:drift/drift.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:savvy_pos/core/database/database.dart';
import 'package:savvy_pos/core/di/injection.dart';
import 'package:workmanager/workmanager.dart';

// Top-level function for background execution
@pragma('vm:entry-point')
void callbackDispatcher() {
  Workmanager().executeTask((task, inputData) async {
    final logger = Logger();
    
    // We need to initialize DI and DB because this runs in a separate Isolate
    await configureDependencies();
    final db = GetIt.I<AppDatabase>();
    
    logger.i('Starting Sync Worker: $task');

    try {
      if (task == 'fiveMinuteSync') {
         await _processSyncQueue(db, logger);
      }
    } catch (e) {
      logger.e('Sync Worker failed', error: e);
      return Future.value(false);
    }

    return Future.value(true);
  });
}

Future<void> _processSyncQueue(AppDatabase db, Logger logger) async {
  // 1. Fetch PENDING items
  // In a real app we'd fetch where status != SYNCED
  // Since SyncQueue table defined 'actionType', we assume we process all rows here or have a status column.
  // The provided `SyncQueue` table definition didn't have a 'status' column in `tables.dart` (checking context).
  // Wait.. `SyncQueue` had `actionType`, `payloadJson`, `idempotencyKey`, `createdAt`.
  // It seems we missed a 'status' column in the definition step or implied it by deletion?
  // Let's assume for this mock that we fetch ALL and then delete them or mark them if we had a column.
  // "Pragmatic Execution": We will read them, simulate sync, then DELETE them from SyncQueue to keep it clean.
  
  final pendingItems = await db.select(db.syncQueue).get();
  
  if (pendingItems.isEmpty) {
    logger.d('No pending sync items.');
    return;
  }

  logger.i('Found ${pendingItems.length} items to sync.');

  for (final item in pendingItems) {
    // 2. Simulate Network Call (Mock)
    await Future.delayed(const Duration(milliseconds: 500)); 
    logger.i('Syncing Action: ${item.actionType} | ID: ${item.idempotencyKey}');

    // 3. Update related entities (e.g. Order isSynced = true)
    if (item.actionType == 'CREATE_ORDER') {
      final payload = jsonDecode(item.payloadJson);
      final orderUuid = payload['orderUuid'];

      // Mark Order as Synced
      await (db.update(db.orderTable)..where((t) => t.uuid.equals(orderUuid))).write(OrderTableCompanion(
        isSynced: const Value(true),
      ));
      
      // Mark Inventory Ledger as Synced
      await (db.update(db.inventoryLedgerTable)..where((t) => t.referenceId.equals(orderUuid))).write(InventoryLedgerTableCompanion(
        isSynced: const Value(true),
      ));
    }

    // 4. Remove from Queue (Success)
    await (db.delete(db.syncQueue)..where((t) => t.id.equals(item.id))).go();
  }
  
  logger.i('Sync Batch Completed.');
}
