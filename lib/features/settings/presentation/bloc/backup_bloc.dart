import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:file_picker/file_picker.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart' as p;

part 'backup_bloc.freezed.dart';

@freezed
class BackupEvent with _$BackupEvent {
  const factory BackupEvent.createBackup() = _CreateBackup;
  const factory BackupEvent.restoreBackup() = _RestoreBackup;
}

@freezed
class BackupState with _$BackupState {
  const factory BackupState({
    @Default(false) bool isLoading,
    @Default(false) bool isSuccess,
    String? message,
    String? error,
  }) = _BackupState;
}

@injectable
class BackupBloc extends Bloc<BackupEvent, BackupState> {
  BackupBloc() : super(const BackupState()) {
    on<_CreateBackup>(_onCreateBackup);
    on<_RestoreBackup>(_onRestoreBackup);
  }

  Future<void> _onCreateBackup(_CreateBackup event, Emitter<BackupState> emit) async {
    emit(state.copyWith(isLoading: true, error: null, message: null));
    try {
      final dbFolder = await getApplicationDocumentsDirectory();
      final dbFile = File(p.join(dbFolder.path, 'savvy_pos.sqlite'));
      
      if (!await dbFile.exists()) {
        emit(state.copyWith(isLoading: false, error: 'Database file not found'));
        return;
      }

      final dateStr = DateFormat('yyyyMMdd_HHmm').format(DateTime.now());
      final backupFileName = 'savvy_backup_$dateStr.db';
      final backupPath = p.join(dbFolder.path, backupFileName);
      
      // Copy
      await dbFile.copy(backupPath);
      
      // Share
      await Share.shareXFiles([XFile(backupPath)], text: 'Savvy POS Backup');
      
      emit(state.copyWith(isLoading: false, isSuccess: true, message: 'Backup created successfully'));
    } catch (e) {
      emit(state.copyWith(isLoading: false, error: 'Backup Failed: $e'));
    }
  }

  Future<void> _onRestoreBackup(_RestoreBackup event, Emitter<BackupState> emit) async {
    emit(state.copyWith(isLoading: true, error: null, message: null));
    try {
      final result = await FilePicker.platform.pickFiles();
      
      if (result != null && result.files.single.path != null) {
        final pickedPath = result.files.single.path!;
        final dbFolder = await getApplicationDocumentsDirectory();
        final dbFile = File(p.join(dbFolder.path, 'savvy_pos.sqlite'));
        
        // Simple overwrite (Safety warning should be in UI)
        await File(pickedPath).copy(dbFile.path);
        
        emit(state.copyWith(isLoading: false, isSuccess: true, message: 'Restore Successful. Please Restart App.'));
      } else {
        emit(state.copyWith(isLoading: false)); // Cancelled
      }
    } catch (e) {
      emit(state.copyWith(isLoading: false, error: 'Restore Failed: $e'));
    }
  }
}
