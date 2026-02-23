import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:savvy_pos/core/services/socket_service.dart';
import 'package:savvy_pos/core/error/failures.dart';
import 'package:savvy_pos/features/auth/domain/repositories/i_tenant_repository.dart';
import 'package:savvy_pos/core/hal/printer_router.dart';
import 'package:savvy_pos/features/tables/domain/entities/table.dart';
import 'package:savvy_pos/features/tables/domain/repositories/i_table_repository.dart';
import 'package:uuid/uuid.dart';

part 'table_bloc.freezed.dart';

@freezed
class TableEvent with _$TableEvent {
  const factory TableEvent.loadTables() = _LoadTables;
  const factory TableEvent.tablesUpdated(List<SavvyTable> tables) =
      _TablesUpdated;
  const factory TableEvent.addTable(String name, double x, double y) =
      _AddTable;
  const factory TableEvent.moveTable(String uuid, double x, double y) =
      _MoveTable;
  const factory TableEvent.deleteTable(String uuid) = _DeleteTable;
  const factory TableEvent.toggleOccupied(String uuid, bool isOccupied) =
      _ToggleOccupied;
  const factory TableEvent.transferTable(String sourceUuid, String targetUuid) =
      _TransferTable;
  const factory TableEvent.mergeTables(String sourceUuid, String targetUuid) =
      _MergeTables;
  const factory TableEvent.openQRSession(String tableUuid) = _OpenQRSession;
  const factory TableEvent.resetAndReload() = _ResetAndReload;
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
  final SocketService _socketService;
  final PrinterRouter _printerRouter;
  final ITenantRepository _tenantRepo;
  StreamSubscription? _outletChangeSubscription;

  TableBloc(this._repository, this._socketService, this._printerRouter,
      this._tenantRepo)
      : super(const TableState()) {
    _outletChangeSubscription = _tenantRepo.onOutletChanged.listen((_) {
      add(const TableEvent.resetAndReload());
    });

    on<_LoadTables>(_onLoadTables);
    on<_TablesUpdated>(_onTablesUpdated);
    on<_AddTable>(_onAddTable);
    on<_MoveTable>(_onMoveTable);
    on<_DeleteTable>(_onDeleteTable);
    on<_ToggleOccupied>(_onToggleOccupied);
    on<_TransferTable>(_onTransferTable);
    on<_MergeTables>(_onMergeTables);
    on<_OpenQRSession>(_onOpenQRSession);
    on<_ResetAndReload>(_onResetAndReload);
  }

  @override
  Future<void> close() {
    _outletChangeSubscription?.cancel();
    return super.close();
  }

  Future<void> _onResetAndReload(
      _ResetAndReload event, Emitter<TableState> emit) async {
    // Purge old tables directly from active RAM on outlet switch, then reload
    emit(const TableState(tables: [], isLoading: true));
    add(const TableEvent.loadTables());
  }

  Future<void> _onLoadTables(
      _LoadTables event, Emitter<TableState> emit) async {
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
      if (e is ConcurrencyException) {
        emit(state.copyWith(error: e.message));
        add(const TableEvent.loadTables());
      } else {
        emit(state.copyWith(error: 'Failed to add table: $e'));
      }
    }
  }

  Future<void> _onMoveTable(_MoveTable event, Emitter<TableState> emit) async {
    try {
      // Find table based on current state memory
      final status = state.tables.firstWhere((t) => t.id == event.uuid);
      final updated = status.copyWith(x: event.x, y: event.y /* , updatedAt: TimeHelper.now() */);
      await _repository.updateTable(updated);
    } catch (e) {
      if (e is ConcurrencyException) {
        emit(state.copyWith(error: 'Collision detected: ${e.message}'));
        add(const TableEvent.loadTables()); // Reload fresh state
      } else {
         emit(state.copyWith(error: 'Failed to move table: $e'));
      }
    }
  }

  Future<void> _onToggleOccupied(
      _ToggleOccupied event, Emitter<TableState> emit) async {
    try {
      await _repository.setTableOccupied(event.uuid, event.isOccupied);
    } catch (e) {
      if (e is ConcurrencyException) {
        emit(state.copyWith(error: 'Occupancy collision: ${e.message}'));
        add(const TableEvent.loadTables());
      } else {
        emit(state.copyWith(error: 'Toggle occupied fail: $e'));
      }
    }
  }

  Future<void> _onDeleteTable(
      _DeleteTable event, Emitter<TableState> emit) async {
    await _repository.deleteTable(event.uuid);
  }

  Future<void> _onTransferTable(
      _TransferTable event, Emitter<TableState> emit) async {
    try {
      await _repository.transferTable(event.sourceUuid, event.targetUuid);
      _socketService.emit('table_transferred',
          {'source': event.sourceUuid, 'target': event.targetUuid});
    } catch (e) {
      if (e is ConcurrencyException) {
        emit(state.copyWith(error: e.message));
        add(const TableEvent.loadTables());
      } else {
        emit(state.copyWith(error: 'Failed to transfer table: $e'));
      }
    }
  }

  Future<void> _onMergeTables(
      _MergeTables event, Emitter<TableState> emit) async {
    try {
      await _repository.mergeTables(event.sourceUuid, event.targetUuid);
      _socketService.emit('table_merged',
          {'source': event.sourceUuid, 'target': event.targetUuid});
    } catch (e) {
      if (e is ConcurrencyException) {
        emit(state.copyWith(error: e.message));
        add(const TableEvent.loadTables());
      } else {
        emit(state.copyWith(error: 'Failed to merge tables: $e'));
      }
    }
  }

  Future<void> _onOpenQRSession(
      _OpenQRSession event, Emitter<TableState> emit) async {
    try {
      final token = const Uuid().v4();
      final table = state.tables.firstWhere((t) => t.id == event.tableUuid);
      final url =
          'https://menu.savvypos.com/order?token=$token&table=${table.name}';

      // Update Database
      await _repository.updateSessionInfo(
          event.tableUuid, token, url, TableSessionStatus.ordering);

      // Print the QR Ticket
      await _printerRouter.printQRSessionTicket(table.name, url);
    } catch (e) {
      if (e is ConcurrencyException) {
        emit(state.copyWith(error: e.message));
        add(const TableEvent.loadTables());
      } else {
        emit(state.copyWith(error: 'Failed to open QR session: $e'));
      }
    }
  }
}
