abstract class IDataRetentionRepository {
  /// Purges transactional data older than [olderThanDays] that has been successfully synced.
  /// This helps prevent local storage bloat on offline-first devices.
  Future<int> purgeOldData({int olderThanDays = 30});
}
