import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:savvy_pos/features/tables/domain/entities/table.dart';
import 'package:savvy_pos/features/tables/domain/entities/zone.dart';
import 'package:savvy_pos/features/tables/domain/usecases/floor_plan_usecases.dart';

part 'floor_plan_editor_bloc.freezed.dart';

@freezed
class FloorPlanEditorEvent with _$FloorPlanEditorEvent {
  const factory FloorPlanEditorEvent.started() = _Started;
  const factory FloorPlanEditorEvent.zoneSelected(String? zoneId) = _ZoneSelected;
  const factory FloorPlanEditorEvent.zoneSaved(Zone zone) = _ZoneSaved;
  const factory FloorPlanEditorEvent.zoneDeleted(String zoneId) = _ZoneDeleted;
  const factory FloorPlanEditorEvent.tableSaved(SavvyTable table) = _TableSaved;
  const factory FloorPlanEditorEvent.tableDeleted(String tableId) = _TableDeleted;
  
  // Internal Stream Updates
  const factory FloorPlanEditorEvent.zonesUpdated(List<Zone> zones) = _ZonesUpdated;
  const factory FloorPlanEditorEvent.tablesUpdated(List<SavvyTable> tables) = _TablesUpdated;
}

@freezed
class FloorPlanEditorState with _$FloorPlanEditorState {
  const factory FloorPlanEditorState({
    @Default(false) bool isLoading,
    @Default([]) List<Zone> zones,
    @Default([]) List<SavvyTable> tables,
    String? selectedZoneId,
    String? errorMessage,
  }) = _FloorPlanEditorState;
}

@injectable
class FloorPlanEditorBloc extends Bloc<FloorPlanEditorEvent, FloorPlanEditorState> {
  final WatchZonesUseCase _watchZones;
  final WatchTablesUseCase _watchTables;
  final SaveZoneUseCase _saveZone;
  final DeleteZoneUseCase _deleteZone;
  final SaveTableUseCase _saveTable;
  final DeleteTableUseCase _deleteTable;

  StreamSubscription? _zonesSub;
  StreamSubscription? _tablesSub;

  FloorPlanEditorBloc(
    this._watchZones,
    this._watchTables,
    this._saveZone,
    this._deleteZone,
    this._saveTable,
    this._deleteTable,
  ) : super(const FloorPlanEditorState()) {
    on<_Started>(_onStarted);
    on<_ZoneSelected>((event, emit) => emit(state.copyWith(selectedZoneId: event.zoneId)));
    on<_ZoneSaved>(_onZoneSaved);
    on<_ZoneDeleted>(_onZoneDeleted);
    on<_TableSaved>(_onTableSaved);
    on<_TableDeleted>(_onTableDeleted);
    on<_ZonesUpdated>((event, emit) => emit(state.copyWith(zones: event.zones, isLoading: false)));
    on<_TablesUpdated>((event, emit) => emit(state.copyWith(tables: event.tables, isLoading: false)));
  }

  Future<void> _onStarted(_Started event, Emitter<FloorPlanEditorState> emit) async {
    emit(state.copyWith(isLoading: true));
    
    _zonesSub?.cancel();
    _zonesSub = _watchZones().listen((zones) {
      add(FloorPlanEditorEvent.zonesUpdated(zones));
    });
    
    _tablesSub?.cancel();
    _tablesSub = _watchTables().listen((tables) {
       add(FloorPlanEditorEvent.tablesUpdated(tables));
    });
  }

  Future<void> _onZoneSaved(_ZoneSaved event, Emitter<FloorPlanEditorState> emit) async {
    try {
      await _saveZone(event.zone);
    } catch (e) {
      emit(state.copyWith(errorMessage: e.toString()));
    }
  }

  Future<void> _onZoneDeleted(_ZoneDeleted event, Emitter<FloorPlanEditorState> emit) async {
    try {
      await _deleteZone(event.zoneId);
      if (state.selectedZoneId == event.zoneId) {
        emit(state.copyWith(selectedZoneId: null));
      }
    } catch (e) {
      emit(state.copyWith(errorMessage: e.toString()));
    }
  }

  Future<void> _onTableSaved(_TableSaved event, Emitter<FloorPlanEditorState> emit) async {
    try {
      await _saveTable(event.table);
    } catch (e) {
      emit(state.copyWith(errorMessage: e.toString()));
    }
  }

  Future<void> _onTableDeleted(_TableDeleted event, Emitter<FloorPlanEditorState> emit) async {
    try {
      await _deleteTable(event.tableId);
    } catch (e) {
      emit(state.copyWith(errorMessage: e.toString()));
    }
  }
  
  @override
  Future<void> close() {
    _zonesSub?.cancel();
    _tablesSub?.cancel();
    return super.close();
  }
}
