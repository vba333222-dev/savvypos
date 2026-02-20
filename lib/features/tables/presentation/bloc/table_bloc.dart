import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:savvy_pos/features/tables/domain/entities/table.dart';
import 'package:savvy_pos/features/tables/domain/repositories/i_table_repository.dart';

part 'table_bloc.freezed.dart';

@freezed
class TableEvent with _$TableEvent {
  const factory TableEvent.loadTables() = _LoadTables;
  const factory TableEvent.tablesUpdated(List<SavvyTable> tables) = _TablesUpdated;
  const factory TableEvent.addTable(String name, double x, double y) = _AddTable;
  const factory TableEvent.moveTable(String uuid, double x, double y) = _MoveTable;
  const factory TableEvent.deleteTable(String uuid) = _DeleteTable;
  const factory TableEvent.toggleOccupied(String uuid, bool isOccupied) = _ToggleOccupied; 
  const factory TableEvent.mergeTables(String sourceUuid, String targetUuid) = _MergeTables;
}

@freezed
class TableState with _$TableState {
  const factory TableState({
    @Default([]) List<SavvyTable> tables,
    @Default(false) bool isLoading,
    String? error,
  }) = _TableState;
}

@injectable
class TableBloc extends Bloc<TableEvent, TableState> {
  final ITableRepository _repository;

  TableBloc(this._repository) : super(const TableState()) {
    on<_LoadTables>(_onLoadTables);
    on<_TablesUpdated>(_onTablesUpdated);
    on<_AddTable>(_onAddTable);
    on<_MoveTable>(_onMoveTable);
    on<_DeleteTable>(_onDeleteTable);
    on<_ToggleOccupied>(_onToggleOccupied);
    on<_MergeTables>(_onMergeTables);
  }

  Future<void> _onLoadTables(_LoadTables event, Emitter<TableState> emit) async {
    emit(state.copyWith(isLoading: true));
    await emit.forEach(
      _repository.watchTables(),
      onData: (tables) => state.copyWith(isLoading: false, tables: tables),
      onError: (e, s) => state.copyWith(isLoading: false, error: e.toString()),
    );
  }

  void _onTablesUpdated(_TablesUpdated event, Emitter<TableState> emit) {
    emit(state.copyWith(tables: event.tables));
  }

  Future<void> _onAddTable(_AddTable event, Emitter<TableState> emit) async {
    try {
      await _repository.addTable(event.name, event.x, event.y);
    } catch (e) {
      // Handle error
    }
  }

  Future<void> _onMoveTable(_MoveTable event, Emitter<TableState> emit) async {
    final status = state.tables.firstWhere((t) => t.id == event.uuid);
    final updated = status.copyWith(x: event.x, y: event.y /* , updatedAt: DateTime.now() */);
    await _repository.updateTable(updated);
  }
  
  Future<void> _onToggleOccupied(_ToggleOccupied event, Emitter<TableState> emit) async {
    try {
      // The variable 'status' was unused.
      // We use setTableOccupied to handle logic if needed
      await _repository.setTableOccupied(event.uuid, event.isOccupied); 
    } catch (e) {
      // Handle error
    }
  }

  Future<void> _onDeleteTable(_DeleteTable event, Emitter<TableState> emit) async {
    await _repository.deleteTable(event.uuid);
  }

  Future<void> _onMergeTables(_MergeTables event, Emitter<TableState> emit) async {
    try {
      await _repository.mergeTables(event.sourceUuid, event.targetUuid);
    } catch (e) {
      emit(state.copyWith(error: 'Failed to merge tables: $e'));
    }
  }
}
