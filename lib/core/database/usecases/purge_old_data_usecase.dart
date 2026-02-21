import 'package:injectable/injectable.dart';
import 'package:savvy_pos/core/database/repositories/i_data_retention_repository.dart';

@injectable
class PurgeOldDataUseCase {
  final IDataRetentionRepository _repository;

  PurgeOldDataUseCase(this._repository);

  /// Executes background cleanup of fully synced historical data to free storage space.
  /// Typically called silently after daily shift closures.
  Future<void> call({int olderThanDays = 30}) async {
    try {
      final rowsDeleted = await _repository.purgeOldData(olderThanDays: olderThanDays);
      print('Auto-Purge Complete: Freed up local database by removing $rowsDeleted stale synced records.');
    } catch (e) {
      print('Auto-Purge Error: Failed to clear old records: $e');
    }
  }
}
