import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TimeHelper {
  static Duration _offset = Duration.zero;
  static bool _hasLoadedOffset = false;
  static final Logger _logger = Logger();

  /// Gets the current adjusted time based on continuous server offset syncing.
  static DateTime now() {
    return DateTime.now().add(_offset);
  }

  /// Calculates the difference between device time and remote server time.
  static Future<void> syncWithServer(DateTime serverTime) async {
    final localTimeNow = DateTime.now();
    _offset = serverTime.difference(localTimeNow);

    _logger.i('TimeHelper: Server Time Offset Sync Completed. Offset: ${_offset.inSeconds} seconds.');

    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('server_time_offset_seconds', _offset.inSeconds);
  }

  /// Loads the persisted offset on application boot.
  static Future<void> loadPersistedOffset() async {
    if (_hasLoadedOffset) return;

    try {
      final prefs = await SharedPreferences.getInstance();
      final offsetSeconds = prefs.getInt('server_time_offset_seconds') ?? 0;
      _offset = Duration(seconds: offsetSeconds);
      _hasLoadedOffset = true;
      _logger.i('TimeHelper: Loaded Persisted Offset: $_offset');
    } catch (e) {
      _logger.w('TimeHelper: Failed to load offset: $e');
    }
  }

  /// Returns true if offset is significantly large, possibly implying device time tampering
  static bool hasSignificantTampering() {
    // Arbitrary threshold: warn if offset > 10 minutes (600 seconds)
    return _offset.abs().inSeconds > 600;
  }
}
