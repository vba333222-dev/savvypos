import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
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
  
  // 1. Fetch PENDING items
  final pendingItems = await (db.select(db.syncQueue)..limit(50)).get();
  
  if (pendingItems.isEmpty) {
    logger.d('No pending sync items.');
  } else {
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
          
          final success = await apiClient.pushItem(payload);
          
          if (success) {
              logger.i('Synced Item: ${item.id}');
              // Delete from queue
              await (db.delete(db.syncQueue)..where((t) => t.id.equals(item.id))).go();
              
              // Mark Order as Synced if applicable
              if (item.actionType == 'CREATE_ORDER') {
                  final p = jsonDecode(item.payloadJson);
                  final orderUuid = p['uuid'] ?? p['orderUuid']; 
                  if (orderUuid != null) {
                    await (db.update(db.orderTable)..where((t) => t.uuid.equals(orderUuid)))
                      .write(const OrderTableCompanion(isSynced: Value(true)));
                  }
              }
          } else {
              allSuccess = false;
              logger.w('Failed to sync Item: ${item.id}. Halt to preserve order.');
              break; 
          }
        } catch (e) {
           logger.e('Error processing item ${item.id}', error: e);
           allSuccess = false;
           break;
        }
    }
  }

  // 3. Pull Downstream Updates (Delta Sync)
  try {
    final prefs = await SharedPreferences.getInstance();
    final lastSyncedAt = prefs.getString('last_synced_at') ?? "1970-01-01T00:00:00Z";

    logger.i('Pulling data since: $lastSyncedAt');
    final data = await apiClient.pullSyncData(lastSyncedAt);
    
    if (data != null) {
        final products = List<Map<String, dynamic>>.from(data['products'] ?? []);
        final customers = List<Map<String, dynamic>>.from(data['customers'] ?? []);
        
        if (products.isNotEmpty || customers.isNotEmpty) {
           logger.i('Received ${products.length} products and ${customers.length} customers.');
        }

        // Merge Strategy: Server Wins (InsertOnConflictUpdate)
        await db.batch((batch) {
            for (final p in products) {
               batch.insert(db.productTable, ProductTableCompanion(
                   uuid: Value(p['uuid']),
                   name: Value(p['name']),
                   price: Value((p['price'] as num).toDouble()),
                   sku: Value(p['sku']),
                   category: Value(p['category']),
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
            await prefs.setString('last_synced_at', serverTime);
            logger.i('Sync Logic Complete. Updated memory to $serverTime');
        }
    }
  } catch (e) {
    logger.e('Pull Sync failed', error: e);
  }
}
