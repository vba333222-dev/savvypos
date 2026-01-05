import 'dart:convert';
import 'package:drift/drift.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:savvy_pos/core/database/database.dart';
import 'package:savvy_pos/core/di/injection.dart';
import 'package:savvy_pos/core/network/api_client.dart';
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
  final apiClient = GetIt.I<ApiClient>();
  
  // 1. Fetch PENDING items
  final pendingItems = await db.select(db.syncQueue).get();
  
  if (pendingItems.isEmpty) {
    logger.d('No pending sync items.');
    return;
  }

  logger.i('Found ${pendingItems.length} items to sync.');

  // 2. Prepare Payload
  final List<Map<String, dynamic>> payload = pendingItems.map((item) {
    return {
      'id': item.id, // For ack, though we just rely on 200 OK for batch
      'action': item.actionType,
      'payload': jsonDecode(item.payloadJson),
      'idempotency_key': item.idempotencyKey,
      'created_at': item.createdAt.toIso8601String(),
    };
  }).toList();

  // 3. Push to Backend
  final success = await apiClient.pushSyncData(payload);

  if (success) {
    logger.i('Sync Batch Success. Removing items from queue.');
    
    // 4. Remove from Queue (Success)
    // In a robust system, we might delete only specific IDs if partial success, 
    // but for now we assume all-or-nothing batch.
    
    // Also mark related entities as synced if needed - strictly speaking, 
    // we should wait for backend ACK to update 'isSynced' on the Entity Table itself?
    // OR we just rely on the Queue being empty.
    // Let's update the entities 'isSynced' flag for local UI feedback.
    
    for (final item in pendingItems) {
      if (item.actionType == 'CREATE_ORDER') {
        final p = jsonDecode(item.payloadJson);
        final orderUuid = p['orderUuid']; // Ensure consistency in keys
        if (orderUuid != null) {
          await (db.update(db.orderTable)..where((t) => t.uuid.equals(orderUuid)))
            .write(const OrderTableCompanion(isSynced: Value(true)));
        }
      }
      // Add other types here
      
      // Delete from Queue
      await (db.delete(db.syncQueue)..where((t) => t.id.equals(item.id))).go();
    }
  } else {
    logger.w('Sync Batch Failed. Will retry later.');
  }
}
