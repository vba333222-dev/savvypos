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
  final pendingItems = await (db.select(db.syncQueue)..limit(50)).get();
  
  if (pendingItems.isEmpty) {
    logger.d('No pending sync items.');
    return;
  }

  logger.i('Found ${pendingItems.length} items to sync.');

  // 2. Prepare Payload & Push (One by One)
  bool allSuccess = true;
  
  for (final item in pendingItems) {
      try {
        final Map<String, dynamic> payload = {
          'action': item.actionType,
          'payload': jsonDecode(item.payloadJson), 
          'idempotency_key': item.idempotencyKey,
        };
        
        // Simple manual backoff could be added here if needed, but Workmanager has its own retry policy.
        // We rely on ApiClient to handle immediate HTTP timeouts.
        
        final success = await apiClient.pushItem(payload);
        
        if (success) {
            logger.i('Synced Item: ${item.id}');
            // Delete from queue
            await (db.delete(db.syncQueue)..where((t) => t.id.equals(item.id))).go();
            
            // Mark Order as Synced if applicable
            if (item.actionType == 'CREATE_ORDER') {
                final p = jsonDecode(item.payloadJson);
                // Handle both structures if needed, but we standardized on `uuid` in recent models
                final orderUuid = p['uuid'] ?? p['orderUuid']; 
                if (orderUuid != null) {
                  await (db.update(db.orderTable)..where((t) => t.uuid.equals(orderUuid)))
                    .write(const OrderTableCompanion(isSynced: Value(true)));
                }
            }
        } else {
            allSuccess = false;
            logger.w('Failed to sync Item: ${item.id}. Halt batch to preserve order?');
            // If strict ordering is required, we should break. 
            // For Sales, sequential is safer.
            break; 
        }
      } catch (e) {
         logger.e('Error processing item ${item.id}', error: e);
         allSuccess = false;
         break;
      }
  }
  
  if (allSuccess && pendingItems.length == 50) {
     // If we hit limit and all success, maybe schedule immediate next run?
     // Workmanager doesn't support "run again now" easily from dart side without native code.
     // But we returned true, so it finishes.
     // Timer-based worker in App (Foreground) will pick up next batch.
  }

  // 3. Pull Downstream Updates
  // Get last synced time from Prefs (Mocking Prefs for now)
  // final prefs = await SharedPreferences.getInstance();
  // final lastSyncedAt = prefs.getString('last_synced_at') ?? "1970-01-01T00:00:00Z";
  final lastSyncedAt = "1970-01-01T00:00:00Z"; // Placeholder

  final data = await apiClient.pullSyncData(lastSyncedAt);
  
  if (data != null) {
      final products = List<Map<String, dynamic>>.from(data['products'] ?? []);
      final customers = List<Map<String, dynamic>>.from(data['customers'] ?? []);
      
      // Merge Strategy: Server Wins (InsertOnConflictUpdate)
      await db.batch((batch) {
          for (final p in products) {
             // Map JSON to ProductTableCompanion
             // simplified mapping:
             batch.insert(db.productTable, ProductTableCompanion(
                 uuid: Value(p['uuid']),
                 name: Value(p['name']),
                 price: Value((p['price'] as num).toDouble()),
                 sku: Value(p['sku']),
                 category: Value(p['category']),
                 // tenantId: Value(p['tenant_id']), // If table has it
             ), mode: InsertMode.insertOrReplace);
          }
          
          for (final c in customers) {
             batch.insert(db.customerTable, CustomerTableCompanion(
                 uuid: Value(c['uuid']),
                 name: Value(c['name']),
                 phone: Value(c['phone']),
                 email: Value(c['email']),
             ), mode: InsertMode.insertOrReplace);
          }
      });
      
      final serverTime = data['server_time'];
      if (serverTime != null) {
          // prefs.setString('last_synced_at', serverTime);
          logger.i('Sync Complete. Updated to $serverTime');
      }
  }
}
