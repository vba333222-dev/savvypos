import 'package:shared_preferences/shared_preferences.dart';
import 'package:logger/logger.dart';

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
