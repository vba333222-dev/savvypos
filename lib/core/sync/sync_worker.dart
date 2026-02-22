import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:drift/drift.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:workmanager/workmanager.dart';

import 'package:savvy_pos/core/database/database.dart';
import 'package:savvy_pos/core/di/injection.dart';
import 'package:savvy_pos/core/network/api_client.dart';
import 'package:savvy_pos/core/utils/isolate_helper.dart';
import 'package:savvy_pos/core/sync/sync_utils.dart'; // For SyncFileLogger

import 'dart:async';
import 'package:rxdart/rxdart.dart';

@lazySingleton
class SyncWorker {
  final AppDatabase db;
  final Logger logger;

  final PublishSubject<void> _syncIntent = PublishSubject<void>();
  final BehaviorSubject<int> _pendingQueueCount = BehaviorSubject<int>.seeded(0);
  Stream<int> get pendingQueueCountStatus => _pendingQueueCount.stream;

  StreamSubscription<void>? _syncSubscription;
  bool _isDisposed = false;

  SyncWorker(this.db, this.logger) {
    // Prevent overlapping background sync isolates to avoid memory leaks
    // and DB locks using exhaustMap (ignores triggers if a sync is running).
    _syncSubscription = _syncIntent
        .exhaustMap((_) => Stream.fromFuture(_runSyncIsolate()))
        .listen((_) {},
            onError: (e) => logger.e('SyncWorker intent error', error: e));
  }

  /// Triggers a sync operation safely (rate-limited by exhaustMap)
  void sync() {
    if (_isDisposed) return;
    logger.i('SyncWorker: Sync triggered');
    _syncIntent.add(null);
  }

  Future<void> _runSyncIsolate() async {
    // Run sync in a background isolate to avoid blocking the main UI thread.
    // We pass the root isolate token to allow platform channel communication if needed.
    final token = RootIsolateToken.instance;
    await IsolateHelper.run(_isolateSyncTask, token);
  }

  /// PROPER DISPOSAL: Terminates the streams and clears subscriptions
  /// ensuring 0 MB memory leak on logout.
  @disposeMethod
  void dispose() {
    logger.i('SyncWorker: Disposing resources to prevent memory leaks.');
    _isDisposed = true;
    _syncSubscription?.cancel();
    _syncSubscription = null;
    _syncIntent.close();
    _pendingQueueCount.close();
  }
}

// Top-level function for background isolate execution via IsolateHelper
@pragma('vm:entry-point')
Future<bool> _isolateSyncTask(RootIsolateToken? token) async {
  if (token != null) {
    BackgroundIsolateBinaryMessenger.ensureInitialized(token);
  }
  final logger = Logger();
  try {
    // We need to re-initialize dependencies for this isolate
    if (!GetIt.I.isRegistered<AppDatabase>()) {
      await configureDependencies(Environment.dev);
    }
    final db = GetIt.I<AppDatabase>();
    await processSyncQueue(db, logger);
    return true;
  } catch (e) {
    logger.e('Isolate Sync Task failed', error: e);
    await SyncFileLogger.logError('ISOLATE_SYNC_CRASH', e.toString());
    return false;
  }
}

// Top-level function for background execution via Workmanager
@pragma('vm:entry-point')
void callbackDispatcher() {
  Workmanager().executeTask((task, inputData) async {
    final logger = Logger();

    // We need to initialize DI and DB because this runs in a separate Isolate
    if (!GetIt.I.isRegistered<AppDatabase>()) {
      await configureDependencies(Environment.dev);
    }
    final db = GetIt.I<AppDatabase>();

    logger.i('Starting Sync Worker: $task');

    try {
      if (task == 'fiveMinuteSync') {
        await processSyncQueue(db, logger);
      }
    } catch (e) {
      logger.e('Sync Worker failed', error: e);
      await SyncFileLogger.logError('WORKMANAGER_SYNC_CRASH', e.toString());
      return Future.value(false);
    }

    return Future.value(true);
  });
}

Future<void> processSyncQueue(AppDatabase db, Logger logger) async {
  final apiClient = GetIt.I<ApiClient>();

  // 1. Broadly Count Full Queue for UI Progress Bar
  try {
    final countQuery = await db.customSelect('SELECT COUNT(*) AS c FROM sync_queue').getSingle();
    final totalPending = countQuery.read<int>('c');
    if (GetIt.I.isRegistered<SyncWorker>()) {
        final worker = GetIt.I<SyncWorker>();
        if (!worker._pendingQueueCount.isClosed) worker._pendingQueueCount.add(totalPending);
    }
  } catch (e) {
    logger.d('Could not broadcast sync queue total.');
  }

  // 2. Fetch PENDING or RETRY items where nextRetryAt is due
  final now = DateTime.now();
  final pendingItems = await (db.select(db.syncQueue)
        ..where((t) =>
            t.status.isIn(['PENDING', 'RETRY']) &
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

        if (response != null &&
            (response.statusCode == 200 || response.statusCode == 201)) {
          logger.i('Synced Item: ${item.id}');
          // Success: Delete from queue
          await (db.delete(db.syncQueue)..where((t) => t.id.equals(item.id)))
              .go();

          // Mark Order as Synced
          if (item.actionType == 'CREATE_ORDER') {
            final p = jsonDecode(item.payloadJson);
            final orderUuid = p['uuid'] ?? p['orderUuid'];
            if (orderUuid != null) {
              await (db.update(db.orderTable)
                    ..where((t) => t.uuid.equals(orderUuid)))
                  .write(OrderTableCompanion(
                isSynced: const Value(true),
                version: const Value(1), // Confirmed version 1
              ));
            }
          }
        } else if (response != null && response.statusCode == 409) {
          // CONFLICT DETECTED (Server Wins)
          logger.w(
              'Conflict detected for item ${item.id}. Server Wins strategy activated.');

          final serverData = response.data['server_data'];
          if (serverData != null) {
            // Merge Server Data into Local DB
            await _mergeServerData(db, item.actionType, serverData);
          }

          // Remove from queue as we accepted server state
          await (db.delete(db.syncQueue)..where((t) => t.id.equals(item.id)))
              .go();
          logger.i('Conflict resolved for item ${item.id} using Server Data.');
        } else {
          // RETRYABLE ERROR (500, etc)
          logger.w(
              'Sync failed for item ${item.id} with status ${response?.statusCode}. Retrying...');
          final errorMessage =
              'Bad Request or Server Error: HTTP ${response?.statusCode}';
          await SyncFileLogger.logError(
              'API_ERROR', '$errorMessage for ${item.actionType}');
          await _scheduleRetry(db, item, errorMessage);
        }
      } catch (e) {
        // NETWORK / SYSTEM ERROR
        logger.e('Error processing item ${item.id}', error: e);
        final errorMessage = 'Validation or Network Error: $e';
        await SyncFileLogger.logError(
            'NETWORK_ERROR', 'Item ${item.actionType} failed: $e');
        await _scheduleRetry(db, item, errorMessage);
      }
    }
  }

  // 3. Pull Downstream Updates (Delta Sync)
  await _performDeltaSync(db, apiClient, logger);
}

Future<void> _scheduleRetry(
    AppDatabase db, SyncQueueData item, String errorMessage) async {
  final retryCount = item.retryCount + 1;
  const maxRetries = 5;

  if (retryCount >= maxRetries) {
    // DEAD LETTER QUEUE (Quarantine)
    // Moving item to QUARANTINED status so it stops blocking the queue
    await (db.update(db.syncQueue)..where((t) => t.id.equals(item.id)))
        .write(SyncQueueCompanion(
      status: const Value('QUARANTINED'),
      retryCount: Value(retryCount),
    ));

    final timestamp = DateTime.now().toIso8601String();
    await SyncFileLogger.logError('QUARANTINED_DEAD_LETTER',
        '[$timestamp] Endpoint: ${item.actionType} | Error: $errorMessage | Action: Payload ${item.id} moved to Quarantine due to exceeding max $maxRetries retries. Worker will continue to next item.');

    return; // Stop here. Do not schedule future retry.
  }

  // Exponential Backoff: 1m, 5m, 15m, 30m, 60m
  int delayMinutes;
  if (retryCount == 1) {
    delayMinutes = 1;
  } else if (retryCount == 2) {
    delayMinutes = 5;
  } else if (retryCount == 3) {
    delayMinutes = 15;
  } else if (retryCount == 4) {
    delayMinutes = 30;
  } else {
    delayMinutes = 60; // Cap at 60 minutes
  }

  final nextRetry = DateTime.now().add(Duration(minutes: delayMinutes));

  await (db.update(db.syncQueue)..where((t) => t.id.equals(item.id)))
      .write(SyncQueueCompanion(
    status: const Value('RETRY'),
    retryCount: Value(retryCount),
    nextRetryAt: Value(nextRetry),
  ));

  await SyncFileLogger.logError('RETRY_SCHEDULED',
      'Item ${item.actionType} delayed by $delayMinutes mins (Attempt $retryCount)');
}

Future<void> _mergeServerData(
    AppDatabase db, String actionType, Map<String, dynamic> data) async {
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
}

Future<void> _performDeltaSync(
    AppDatabase db, ApiClient apiClient, Logger logger) async {
  try {
    final prefs = await SharedPreferences.getInstance();
    final lastSyncedAt =
        prefs.getString('last_synced_at') ?? "1970-01-01T00:00:00Z";

    logger.i('Pulling data since: $lastSyncedAt');

    final data = await apiClient.pullSyncData(lastSyncedAt);

    if (data != null) {
      final products = List<Map<String, dynamic>>.from(data['products'] ?? []);
      final stocks =
          List<Map<String, dynamic>>.from(data['inventory_stocks'] ?? []);

      await db.batch((batch) {
        for (final p in products) {
          batch.insert(
              db.productTable,
              ProductTableCompanion(
                uuid: Value(p['uuid']),
                name: Value(p['name']),
                price: Value((p['price'] as num).toDouble()),
                sku: Value(p['sku']),
                categoryId: Value(p['category']),
                version: Value((p['version'] as num).toInt()),
                isSynced: const Value(true),
              ),
              mode: InsertMode.insertOrReplace);
        }

        for (final s in stocks) {
          batch.insert(
              db.localStocksTable,
              LocalStocksTableCompanion(
                productUuid: Value(s['productUuid']),
                warehouseUuid: Value(s['warehouseUuid']),
                quantity: Value((s['quantity'] as num).toDouble()),
                updatedAt: Value(DateTime.now()),
                version: Value((s['version'] as num?)?.toInt() ?? 1),
              ),
              mode: InsertMode.insertOrReplace);
        }
      });

      final serverTime = data['server_time'];
      if (serverTime != null) {
        await prefs.setString('last_synced_at', serverTime);
      }
    }
  } catch (e) {
    logger.e('Pull Sync failed', error: e);
    await SyncFileLogger.logError('PULL_SYNC_ERROR', e.toString());
  }
}
