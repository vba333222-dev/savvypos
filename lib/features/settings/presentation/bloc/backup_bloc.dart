import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:savvy_pos/core/utils/backup_service.dart';

part 'backup_bloc.freezed.dart';

@freezed
class BackupEvent with _$BackupEvent {
  const factory BackupEvent.createBackup() = _CreateBackup;
  const factory BackupEvent.restoreBackup() = _RestoreBackup;
}

@freezed
class BackupState with _$BackupState {
  const factory BackupState.initial() = _Initial;
  const factory BackupState.loading() = _Loading;
  const factory BackupState.success(String message) = _Success;
  const factory BackupState.error(String message) = _Error;
}

@injectable
class BackupBloc extends Bloc<BackupEvent, BackupState> {
  final BackupService _backupService;

  BackupBloc(this._backupService) : super(const BackupState.initial()) {
    on<_CreateBackup>(_onCreateBackup);
    on<_RestoreBackup>(_onRestoreBackup);
  }

  Future<void> _onCreateBackup(
      _CreateBackup event, Emitter<BackupState> emit) async {
    emit(const BackupState.loading());
    try {
      final msg = await _backupService.exportDb();
      emit(BackupState.success(msg));
    } catch (e) {
      emit(BackupState.error(e.toString()));
    }
  }

  Future<void> _onRestoreBackup(
      _RestoreBackup event, Emitter<BackupState> emit) async {
    emit(const BackupState.loading());
    try {
      final msg = await _backupService.importDb();
      emit(BackupState.success(msg));
    } catch (e) {
      emit(BackupState.error(e.toString()));
    }
  }
}
