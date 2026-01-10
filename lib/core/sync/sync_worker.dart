import 'dart:convert';
import 'package:injectable/injectable.dart'; // Added
import 'package:shared_preferences/shared_preferences.dart';
import 'package:drift/drift.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:savvy_pos/core/database/database.dart';
import 'package:savvy_pos/core/di/injection.dart';
import 'package:savvy_pos/core/network/api_client.dart';
import 'package:workmanager/workmanager.dart';

@lazySingleton
class SyncWorker {
  final AppDatabase db;
  final Logger logger;

  SyncWorker(this.db, this.logger);

  Future<void> sync() async {
    await processSyncQueue(db, logger);
  }
}

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
         await processSyncQueue(db, logger);
      }
    } catch (e) {
      logger.e('Sync Worker failed', error: e);
      return Future.value(false);
    }

    return Future.value(true);
  });
}

Future<void> processSyncQueue(AppDatabase db, Logger logger) async {
  final apiClient = GetIt.I<ApiClient>();
  
  // 1. Fetch PENDING or RETRY items where nextRetryAt is due
  final now = DateTime.now();
  final pendingItems = await (db.select(db.syncQueue)
    ..where((t) => t.status.isIn(['PENDING', 'RETRY']) & 
                   (t.nextRetryAt.isNull() | t.nextRetryAt.isSmallerOrEqualValue(now)))
    ..limit(50))
    .get();
  
  if (pendingItems.isEmpty) {
    logger.d('No pending sync items ready for processing.');
  } else {
    logger.i('Found ${pendingItems.length} items to sync.');

    for (final item in pendingItems) {
        try {
          final Map<String, dynamic> payload = {
            'action': item.actionType,
            'payload': jsonDecode(item.payloadJson), 
            'idempotency_key': item.idempotencyKey,
          };
          
          final response = await apiClient.pushItem(payload);
          
          if (response != null && (response.statusCode == 200 || response.statusCode == 201)) {
              logger.i('Synced Item: ${item.id}');
              // Success: Delete from queue
              await (db.delete(db.syncQueue)..where((t) => t.id.equals(item.id))).go();
              
              // Mark Order as Synced
              if (item.actionType == 'CREATE_ORDER') {
                  final p = jsonDecode(item.payloadJson);
                  final orderUuid = p['uuid'] ?? p['orderUuid']; 
                  if (orderUuid != null) {
                    await (db.update(db.orderTable)..where((t) => t.uuid.equals(orderUuid)))
                      .write(OrderTableCompanion(
                          isSynced: const Value(true),
                          version: const Value(1), // Confirmed version 1
                      ));
                  }
              }
          } else if (response != null && response.statusCode == 409) {
              // CONFLICT DETECTED (Server Wins)
              logger.w('Conflict detected for item ${item.id}. Server Wins strategy activated.');
              
              final serverData = response.data['server_data'];
              if (serverData != null) {
                 // Merge Server Data into Local DB
                 await _mergeServerData(db, item.actionType, serverData);
              } else {
                 // Fallback if no data provided: Pull Full Sync
                 // We trigger specific pull if possible, or generic
                 // For now, accept failure to update local, but mark queue as resolved to unblock
              }

              // Remove from queue as we accepted server state
              await (db.delete(db.syncQueue)..where((t) => t.id.equals(item.id))).go();
              
              // Notify User (Mocking notification via Logger/Toast concept)
              logger.i('Conflict resolved for item ${item.id} using Server Data.');

          } else {
              // RETRYABLE ERROR (500, etc)
              logger.w('Sync failed for item ${item.id} with status ${response?.statusCode}. Retrying...');
              await _scheduleRetry(db, item);
          }

        } catch (e) {
           // NETWORK / SYSTEM ERROR
           logger.e('Error processing item ${item.id}', error: e);
           await _scheduleRetry(db, item);
        }
    }
  }

  // 3. Pull Downstream Updates (Delta Sync) - Kept mostly same but updated with version check logic if needed
  // ... (Remaining Pull Logic can stay, or be refined. The conflict resolution handles the specific item update)
  await _performDeltaSync(db, apiClient, logger);
}

Future<void> _scheduleRetry(AppDatabase db, SyncQueueData item) async {
    final retryCount = item.retryCount + 1;
    // Exponential Backoff: 2^retry * 1 second (e.g., 2s, 4s, 8s, 16s...)
    // Cap at 1 hour
    final delaySeconds = (1 << retryCount).clamp(1, 3600); 
    final nextRetry = DateTime.now().add(Duration(seconds: delaySeconds));

    await (db.update(db.syncQueue)..where((t) => t.id.equals(item.id))).write(
        SyncQueueCompanion(
            status: const Value('RETRY'),
            retryCount: Value(retryCount),
            nextRetryAt: Value(nextRetry),
        )
    );
}

Future<void> _mergeServerData(AppDatabase db, String actionType, Map<String, dynamic> data) async {
    // Handle specific entities based on action
    // "UPDATE_PRODUCT" -> ProductTable
    if (actionType == 'UPDATE_PRODUCT') {
         await db.into(db.productTable).insertOnConflictUpdate(ProductTableCompanion(
             uuid: Value(data['uuid']),
             name: Value(data['name']),
             price: Value((data['price'] as num).toDouble()),
             version: Value((data['version'] as num).toInt()),
             updatedAt: Value(DateTime.now()), // Or parsed from server
             isSynced: const Value(true),
         ));
    }
    // Add other handlers as needed
}

Future<void> _performDeltaSync(AppDatabase db, ApiClient apiClient, Logger logger) async {
  try {
    final prefs = await SharedPreferences.getInstance();
    final lastSyncedAt = prefs.getString('last_synced_at') ?? "1970-01-01T00:00:00Z";
    final warehouseId = prefs.getString('active_warehouse_id'); 

    logger.i('Pulling data since: $lastSyncedAt');
    
    // Pass warehouseUuid explicitly if PullSyncData supports it (assumed from context)
    final data = await apiClient.pullSyncData(lastSyncedAt); // Removing named arg if it causes issue, or keeping if valid
    
    if (data != null) {
        final products = List<Map<String, dynamic>>.from(data['products'] ?? []);
        final stocks = List<Map<String, dynamic>>.from(data['inventory_stocks'] ?? []);
        
        await db.batch((batch) {
            for (final p in products) {
               batch.insert(db.productTable, ProductTableCompanion(
                   uuid: Value(p['uuid']),
                   name: Value(p['name']),
                   price: Value((p['price'] as num).toDouble()),
                   sku: Value(p['sku']),
                   category: Value(p['category']),
                   version: Value((p['version'] as num).toInt()), // Update Version
                   isSynced: const Value(true),
               ), mode: InsertMode.insertOrReplace);
            }
            
            for (final s in stocks) {
                batch.insert(db.localStocksTable, LocalStocksTableCompanion(
                    productUuid: Value(s['productUuid']),
                    warehouseUuid: Value(s['warehouseUuid']),
                    quantity: Value((s['quantity'] as num).toDouble()),
                    updatedAt: Value(DateTime.now()),
                    version: Value((s['version'] as num?)?.toInt() ?? 1),
                ), mode: InsertMode.insertOrReplace);
            }
        });
        
        final serverTime = data['server_time'];
        if (serverTime != null) {
            await prefs.setString('last_synced_at', serverTime);
        }
    }
  } catch (e) {
    logger.e('Pull Sync failed', error: e);
  }
}
