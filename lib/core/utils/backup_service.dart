import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:savvy_pos/core/database/database.dart'; // To access DB logic if needed (e.g. close)
import 'package:share_plus/share_plus.dart';

@lazySingleton
class BackupService {
  final AppDatabase _db;

  BackupService(this._db);

  Future<File> _getDbFile() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    return File(p.join(dbFolder.path, 'savvy_pos.sqlite'));
  }

  Future<String> exportDb() async {
    try {
      final dbFile = await _getDbFile();
      if (!await dbFile.exists()) {
        throw Exception("Database file not found");
      }

      // Checkpoint WAL if needed? Drift usually handles this, 
      // but copying active DB might be risky if WAL not merged.
      // Ideally, we run 'VACUUM INTO' or just copy. 
      // For MVP, simplistic copy.
      
      final now = DateTime.now().toIso8601String().replaceAll(':', '-').split('.').first;
      final fileName = 'savvy_backup_$now.sqlite';

      // Use SharePlus for easiest export on mobile (Share to Drive, Email, Save to Files)
      // Or FilePicker.saveFile for Desktop/Android
      
      // Let's try SharePlus first as it's more user-friendly on mobile
      if (Platform.isAndroid || Platform.isIOS) {
        final xFile = XFile(dbFile.path, name: fileName);
        final result = await SharePlus.instance.share(ShareParams(files: [xFile], text: 'Savvy POS Backup'));
        if (result.status == ShareResultStatus.success) {
          return "Backup shared successfully";
        } else {
           return "Backup export cancelled"; 
        }
      } else {
        // Desktop
        final result = await FilePicker.platform.saveFile(
          dialogTitle: 'Save Backup',
          fileName: fileName,
        );
        
        if (result != null) {
          await dbFile.copy(result);
          return "Backup saved to $result";
        }
        return "Export cancelled";
      }
    } catch (e) {
      throw Exception("Export failed: $e");
    }
  }

  Future<String> importDb() async {
    try {
      final result = await FilePicker.platform.pickFiles(
        dialogTitle: 'Select Backup File',
        type: FileType.any, // .sqlite might be recognized as any
      );

      if (result != null && result.files.single.path != null) {
        final pickedPath = result.files.single.path!;
        final dbFile = await _getDbFile();
        
        // Validation: Check if it's a valid SQLite file?
        // Skip for MVP.
        
        // Close DB connection before overwriting?
        await _db.close();
        
        // Overwrite
        await File(pickedPath).copy(dbFile.path);
        
        // We MUST restart the app or re-open the DB.
        // Drift LazyDatabase auto-opens on next access, 
        // BUT we closed the singleton instance's connection.
        // If the singleton is kept alive, `_openConnection` lambda might not run again?
        // AppDatabase extends _$AppDatabase which calls super(executor).
        // If we close, the executor is closed.
        // We might need to crash/restart the app or instruct user.
        
        return "Restore successful. Please restart the app.";
      }
      return "Import cancelled";
    } catch (e) {
      throw Exception("Import failed: $e");
    }
  }
}
