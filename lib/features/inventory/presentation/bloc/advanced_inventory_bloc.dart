import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:savvy_pos/features/inventory/domain/entities/advanced_inventory_entities.dart';
import 'package:savvy_pos/features/inventory/domain/repositories/i_advanced_inventory_repository.dart';

part 'advanced_inventory_bloc.freezed.dart';

// ==============================================================================
// EVENTS
// ==============================================================================

@freezed
class AdvancedInventoryEvent with _$AdvancedInventoryEvent {
  // Dashboard
  const factory AdvancedInventoryEvent.loadDashboard({String? warehouseUuid}) = _LoadDashboard;
  const factory AdvancedInventoryEvent.refreshDashboard() = _RefreshDashboard;
  
  // Warehouses
  const factory AdvancedInventoryEvent.loadWarehouses() = _LoadWarehouses;
  const factory AdvancedInventoryEvent.selectWarehouse(String? uuid) = _SelectWarehouse;
  const factory AdvancedInventoryEvent.createWarehouse(Warehouse warehouse) = _CreateWarehouse;
  const factory AdvancedInventoryEvent.updateWarehouse(Warehouse warehouse) = _UpdateWarehouse;
  
  // Stock Levels
  const factory AdvancedInventoryEvent.loadStockLevels({
    String? warehouseUuid,
    String? categoryUuid,
    String? searchQuery,
    bool? lowStockOnly,
    bool? outOfStockOnly,
  }) = _LoadStockLevels;
  
  // Stock Adjustments
  const factory AdvancedInventoryEvent.adjustStock({
    required String productUuid,
    required String warehouseUuid,
    required double quantityChange,
    required String reason,
    String? notes,
  }) = _AdjustStock;
  
  // Movements
  const factory AdvancedInventoryEvent.loadMovements({
    String? productUuid,
    String? warehouseUuid,
    DateTime? startDate,
    DateTime? endDate,
  }) = _LoadMovements;
  
  // Batches
  const factory AdvancedInventoryEvent.loadBatches({
    String? productUuid,
    String? warehouseUuid,
    bool? expiringOnly,
  }) = _LoadBatches;
  
  // Alerts
  const factory AdvancedInventoryEvent.loadAlerts({AlertSeverity? severity}) = _LoadAlerts;
  const factory AdvancedInventoryEvent.acknowledgeAlert(String uuid) = _AcknowledgeAlert;
  const factory AdvancedInventoryEvent.resolveAlert(String uuid, String action) = _ResolveAlert;
  const factory AdvancedInventoryEvent.generateAlerts() = _GenerateAlerts;
  
  // Transfers
  const factory AdvancedInventoryEvent.loadTransfers({TransferStatus? status}) = _LoadTransfers;
  const factory AdvancedInventoryEvent.createTransfer(AdvancedStockTransfer transfer) = _CreateTransfer;
  const factory AdvancedInventoryEvent.approveTransfer(String uuid) = _ApproveTransfer;
  const factory AdvancedInventoryEvent.shipTransfer(String uuid, List<AdvancedStockTransferItem> items) = _ShipTransfer;
  const factory AdvancedInventoryEvent.receiveTransfer(String uuid, List<AdvancedStockTransferItem> items) = _ReceiveTransfer;
  
  // Insights
  const factory AdvancedInventoryEvent.loadInsights() = _LoadInsights;
  
  // Physical Count
  const factory AdvancedInventoryEvent.startPhysicalCount(String warehouseUuid) = _StartPhysicalCount;
}

// ==============================================================================
// STATE
// ==============================================================================

@freezed
class AdvancedInventoryState with _$AdvancedInventoryState {
  const factory AdvancedInventoryState({
    // Loading states
    @Default(false) bool isLoading,
    @Default(false) bool isRefreshing,
    String? error,
    
    // Dashboard
    InventoryDashboardStats? dashboardStats,
    
    // Warehouses
    @Default([]) List<Warehouse> warehouses,
    String? selectedWarehouseUuid,
    
    // Stock Levels
    @Default([]) List<StockLevel> stockLevels,
    @Default(false) bool isLoadingStock,
    
    // Movements
    @Default([]) List<StockMovement> movements,
    @Default(false) bool isLoadingMovements,
    
    // Batches
    @Default([]) List<Batch> batches,
    @Default(false) bool isLoadingBatches,
    
    // Alerts
    @Default([]) List<StockAlert> alerts,
    @Default(0) int unacknowledgedAlertCount,
    
    // Transfers
    @Default([]) List<AdvancedStockTransfer> transfers,
    @Default(false) bool isLoadingTransfers,
    
    // Insights
    @Default([]) List<InventoryInsight> insights,
    
    // Physical Count
    String? activeCountSessionUuid,
    
    // Operation success/failure
    String? successMessage,
  }) = _AdvancedInventoryState;
}

// ==============================================================================
// BLOC
// ==============================================================================

@injectable
class AdvancedInventoryBloc extends Bloc<AdvancedInventoryEvent, AdvancedInventoryState> {
  final IAdvancedInventoryRepository _repository;
  
  AdvancedInventoryBloc(this._repository) : super(const AdvancedInventoryState()) {
    on<_LoadDashboard>(_onLoadDashboard);
    on<_RefreshDashboard>(_onRefreshDashboard);
    on<_LoadWarehouses>(_onLoadWarehouses);
    on<_SelectWarehouse>(_onSelectWarehouse);
    on<_CreateWarehouse>(_onCreateWarehouse);
    on<_UpdateWarehouse>(_onUpdateWarehouse);
    on<_LoadStockLevels>(_onLoadStockLevels);
    on<_AdjustStock>(_onAdjustStock);
    on<_LoadMovements>(_onLoadMovements);
    on<_LoadBatches>(_onLoadBatches);
    on<_LoadAlerts>(_onLoadAlerts);
    on<_AcknowledgeAlert>(_onAcknowledgeAlert);
    on<_ResolveAlert>(_onResolveAlert);
    on<_GenerateAlerts>(_onGenerateAlerts);
    on<_LoadTransfers>(_onLoadTransfers);
    on<_CreateTransfer>(_onCreateTransfer);
    on<_ApproveTransfer>(_onApproveTransfer);
    on<_ShipTransfer>(_onShipTransfer);
    on<_ReceiveTransfer>(_onReceiveTransfer);
    on<_LoadInsights>(_onLoadInsights);
    on<_StartPhysicalCount>(_onStartPhysicalCount);
  }

  Future<void> _onLoadDashboard(_LoadDashboard event, Emitter<AdvancedInventoryState> emit) async {
    emit(state.copyWith(isLoading: true, error: null));
    try {
      final warehouses = await _repository.getWarehouses();
      final stats = await _repository.getDashboardStats(warehouseUuid: event.warehouseUuid);
      final alerts = await _repository.getActiveAlerts(limit: 10);
      final insights = await _repository.generateInsights(warehouseUuid: event.warehouseUuid);
      
      emit(state.copyWith(
        isLoading: false,
        warehouses: warehouses,
        dashboardStats: stats,
        alerts: alerts,
        unacknowledgedAlertCount: alerts.where((a) => !a.isAcknowledged).length,
        insights: insights,
        selectedWarehouseUuid: event.warehouseUuid,
      ));
    } catch (e) {
      emit(state.copyWith(isLoading: false, error: e.toString()));
    }
  }

  Future<void> _onRefreshDashboard(_RefreshDashboard event, Emitter<AdvancedInventoryState> emit) async {
    emit(state.copyWith(isRefreshing: true));
    try {
      final stats = await _repository.getDashboardStats(warehouseUuid: state.selectedWarehouseUuid);
      final alerts = await _repository.getActiveAlerts(limit: 10);
      emit(state.copyWith(
        isRefreshing: false,
        dashboardStats: stats,
        alerts: alerts,
        unacknowledgedAlertCount: alerts.where((a) => !a.isAcknowledged).length,
      ));
    } catch (e) {
      emit(state.copyWith(isRefreshing: false, error: e.toString()));
    }
  }

  Future<void> _onLoadWarehouses(_LoadWarehouses event, Emitter<AdvancedInventoryState> emit) async {
    try {
      final warehouses = await _repository.getWarehouses();
      emit(state.copyWith(warehouses: warehouses));
    } catch (e) {
      emit(state.copyWith(error: e.toString()));
    }
  }

  Future<void> _onSelectWarehouse(_SelectWarehouse event, Emitter<AdvancedInventoryState> emit) async {
    emit(state.copyWith(selectedWarehouseUuid: event.uuid));
    add(AdvancedInventoryEvent.loadDashboard(warehouseUuid: event.uuid));
  }

  Future<void> _onCreateWarehouse(_CreateWarehouse event, Emitter<AdvancedInventoryState> emit) async {
    try {
      await _repository.createWarehouse(event.warehouse);
      final warehouses = await _repository.getWarehouses();
      emit(state.copyWith(warehouses: warehouses, successMessage: 'Warehouse created'));
    } catch (e) {
      emit(state.copyWith(error: e.toString()));
    }
  }

  Future<void> _onUpdateWarehouse(_UpdateWarehouse event, Emitter<AdvancedInventoryState> emit) async {
    try {
      await _repository.updateWarehouse(event.warehouse);
      final warehouses = await _repository.getWarehouses();
      emit(state.copyWith(warehouses: warehouses, successMessage: 'Warehouse updated'));
    } catch (e) {
      emit(state.copyWith(error: e.toString()));
    }
  }

  Future<void> _onLoadStockLevels(_LoadStockLevels event, Emitter<AdvancedInventoryState> emit) async {
    emit(state.copyWith(isLoadingStock: true));
    try {
      final levels = await _repository.getStockLevels(
        warehouseUuid: event.warehouseUuid ?? state.selectedWarehouseUuid,
        categoryUuid: event.categoryUuid,
        searchQuery: event.searchQuery,
        lowStockOnly: event.lowStockOnly ?? false,
        outOfStockOnly: event.outOfStockOnly ?? false,
      );
      emit(state.copyWith(isLoadingStock: false, stockLevels: levels));
    } catch (e) {
      emit(state.copyWith(isLoadingStock: false, error: e.toString()));
    }
  }

  Future<void> _onAdjustStock(_AdjustStock event, Emitter<AdvancedInventoryState> emit) async {
    try {
      await _repository.recordMovement(
        productUuid: event.productUuid,
        warehouseUuid: event.warehouseUuid,
        movementType: MovementType.adjustment,
        quantityChange: event.quantityChange,
        performedBy: 'current-user', // TODO: Get from auth
        performedByName: 'Current User',
        reasonCode: event.reason,
        notes: event.notes,
      );
      emit(state.copyWith(successMessage: 'Stock adjusted'));
      add(AdvancedInventoryEvent.loadStockLevels(warehouseUuid: event.warehouseUuid));
    } catch (e) {
      emit(state.copyWith(error: e.toString()));
    }
  }

  Future<void> _onLoadMovements(_LoadMovements event, Emitter<AdvancedInventoryState> emit) async {
    emit(state.copyWith(isLoadingMovements: true));
    try {
      final movements = await _repository.getMovementHistory(
        productUuid: event.productUuid,
        warehouseUuid: event.warehouseUuid ?? state.selectedWarehouseUuid,
        startDate: event.startDate,
        endDate: event.endDate,
      );
      emit(state.copyWith(isLoadingMovements: false, movements: movements));
    } catch (e) {
      emit(state.copyWith(isLoadingMovements: false, error: e.toString()));
    }
  }

  Future<void> _onLoadBatches(_LoadBatches event, Emitter<AdvancedInventoryState> emit) async {
    emit(state.copyWith(isLoadingBatches: true));
    try {
      final batches = await _repository.getBatches(
        productUuid: event.productUuid,
        warehouseUuid: event.warehouseUuid ?? state.selectedWarehouseUuid,
        expiringWithinDays: event.expiringOnly ?? false,
        days: 7,
      );
      emit(state.copyWith(isLoadingBatches: false, batches: batches));
    } catch (e) {
      emit(state.copyWith(isLoadingBatches: false, error: e.toString()));
    }
  }

  Future<void> _onLoadAlerts(_LoadAlerts event, Emitter<AdvancedInventoryState> emit) async {
    try {
      final alerts = await _repository.getActiveAlerts(severity: event.severity);
      emit(state.copyWith(
        alerts: alerts,
        unacknowledgedAlertCount: alerts.where((a) => !a.isAcknowledged).length,
      ));
    } catch (e) {
      emit(state.copyWith(error: e.toString()));
    }
  }

  Future<void> _onAcknowledgeAlert(_AcknowledgeAlert event, Emitter<AdvancedInventoryState> emit) async {
    try {
      await _repository.acknowledgeAlert(event.uuid, 'current-user');
      add(const AdvancedInventoryEvent.loadAlerts());
    } catch (e) {
      emit(state.copyWith(error: e.toString()));
    }
  }

  Future<void> _onResolveAlert(_ResolveAlert event, Emitter<AdvancedInventoryState> emit) async {
    try {
      await _repository.resolveAlert(event.uuid, event.action);
      add(const AdvancedInventoryEvent.loadAlerts());
      emit(state.copyWith(successMessage: 'Alert resolved'));
    } catch (e) {
      emit(state.copyWith(error: e.toString()));
    }
  }

  Future<void> _onGenerateAlerts(_GenerateAlerts event, Emitter<AdvancedInventoryState> emit) async {
    try {
      await _repository.checkAndGenerateAlerts();
      add(const AdvancedInventoryEvent.loadAlerts());
    } catch (e) {
      emit(state.copyWith(error: e.toString()));
    }
  }

  Future<void> _onLoadTransfers(_LoadTransfers event, Emitter<AdvancedInventoryState> emit) async {
    emit(state.copyWith(isLoadingTransfers: true));
    try {
      final transfers = await _repository.getTransfers(status: event.status);
      emit(state.copyWith(isLoadingTransfers: false, transfers: transfers));
    } catch (e) {
      emit(state.copyWith(isLoadingTransfers: false, error: e.toString()));
    }
  }

  Future<void> _onCreateTransfer(_CreateTransfer event, Emitter<AdvancedInventoryState> emit) async {
    try {
      await _repository.createTransfer(event.transfer);
      add(const AdvancedInventoryEvent.loadTransfers());
      emit(state.copyWith(successMessage: 'Transfer created'));
    } catch (e) {
      emit(state.copyWith(error: e.toString()));
    }
  }

  Future<void> _onApproveTransfer(_ApproveTransfer event, Emitter<AdvancedInventoryState> emit) async {
    try {
      await _repository.updateTransferStatus(event.uuid, TransferStatus.approved, approvedBy: 'current-user');
      add(const AdvancedInventoryEvent.loadTransfers());
      emit(state.copyWith(successMessage: 'Transfer approved'));
    } catch (e) {
      emit(state.copyWith(error: e.toString()));
    }
  }

  Future<void> _onShipTransfer(_ShipTransfer event, Emitter<AdvancedInventoryState> emit) async {
    try {
      await _repository.shipTransfer(event.uuid, event.items);
      add(const AdvancedInventoryEvent.loadTransfers());
      emit(state.copyWith(successMessage: 'Transfer shipped'));
    } catch (e) {
      emit(state.copyWith(error: e.toString()));
    }
  }

  Future<void> _onReceiveTransfer(_ReceiveTransfer event, Emitter<AdvancedInventoryState> emit) async {
    try {
      await _repository.receiveTransfer(event.uuid, event.items, 'current-user');
      add(const AdvancedInventoryEvent.loadTransfers());
      emit(state.copyWith(successMessage: 'Transfer received'));
    } catch (e) {
      emit(state.copyWith(error: e.toString()));
    }
  }

  Future<void> _onLoadInsights(_LoadInsights event, Emitter<AdvancedInventoryState> emit) async {
    try {
      final insights = await _repository.generateInsights(warehouseUuid: state.selectedWarehouseUuid);
      emit(state.copyWith(insights: insights));
    } catch (e) {
      emit(state.copyWith(error: e.toString()));
    }
  }

  Future<void> _onStartPhysicalCount(_StartPhysicalCount event, Emitter<AdvancedInventoryState> emit) async {
    try {
      final sessionUuid = await _repository.startPhysicalCount(
        warehouseUuid: event.warehouseUuid,
        initiatedBy: 'current-user',
        initiatedByName: 'Current User',
      );
      emit(state.copyWith(activeCountSessionUuid: sessionUuid, successMessage: 'Physical count started'));
    } catch (e) {
      emit(state.copyWith(error: e.toString()));
    }
  }
}
