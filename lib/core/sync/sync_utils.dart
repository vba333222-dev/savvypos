import 'dart:convert';
import 'dart:io';
import 'package:drift/drift.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:logger/logger.dart';
import 'package:uuid/uuid.dart';

import 'package:savvy_pos/core/database/database.dart';

/// Resets the 'last_synced_at' timestamp in SharedPreferences.
/// This forces the next sync to retrieve all data (Full Sync).
/// Use this in SettingsPage or Debug Menu.
Future<void> resetSyncState() async {
  final logger = Logger();
  try {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('last_synced_at');
    logger.i('Sync state reset. Next sync will be full.');
  } catch (e) {
    logger.e('Failed to reset sync state', error: e);
  }
}

/// Helper method to add an action to the local Advanced Sync Queue.
/// This will be picked up by the background isolate for processing.
Future<void> enqueueSyncAction(
    AppDatabase db, String actionType, Map<String, dynamic> payload) async {
  final logger = Logger();
  try {
    final idempotencyKey = const Uuid().v4();
    final item = SyncQueueCompanion(
      actionType: Value(actionType),
      payloadJson: Value(jsonEncode(payload)),
      idempotencyKey: Value(idempotencyKey),
      createdAt: Value(DateTime.now()),
      status: const Value('PENDING'),
      retryCount: const Value(0),
    );

    await db.into(db.syncQueue).insert(item);
    logger.i(
        'Successfully enqueued $actionType to SyncQueue (Key: $idempotencyKey)');
  } catch (e) {
    logger.e('Failed to enqueue sync action $actionType', error: e);
    await SyncFileLogger.logError(
        'FAILED_ENQUEUE', 'Action: $actionType. Error: $e');
  }
}

/// Logs sync errors to a local physical file to prevent data loss or silent failures.
class SyncFileLogger {
  static Future<File> get _localFile async {
    final directory = await getApplicationDocumentsDirectory();
    return File('${directory.path}/sync_error_logs.txt');
  }

  static Future<void> logError(String type, String message) async {
    try {
      final file = await _localFile;
      final timestamp = DateTime.now().toIso8601String();
      final logEntry = '[$timestamp] [$type] $message\n';

      await file.writeAsString(logEntry, mode: FileMode.append, flush: true);
    } catch (e) {
      // Fallback to console logger if file writing fails
      Logger().e('Failed to write to sync_error_logs.txt', error: e);
    }
  }

  static Future<String> readLogs() async {
    try {
      final file = await _localFile;
      if (await file.exists()) {
        return await file.readAsString();
      }
      return 'No logs found.';
    } catch (e) {
      return 'Error reading logs: $e';
    }
  }

  static Future<void> clearLogs() async {
    try {
      final file = await _localFile;
      if (await file.exists()) {
        await file.delete();
      }
    } catch (e) {
      Logger().e('Failed to clear sync_error_logs.txt', error: e);
    }
  }
}
