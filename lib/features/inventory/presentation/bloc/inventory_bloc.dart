import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:savvy_pos/features/inventory/domain/entities/inventory_entities.dart';
import 'package:savvy_pos/features/inventory/domain/repositories/i_inventory_repository.dart';
import 'package:savvy_pos/features/inventory/domain/usecases/inventory_usecases.dart';

part 'inventory_bloc.freezed.dart';

@freezed
class InventoryEvent with _$InventoryEvent {
  const factory InventoryEvent.started() = _Started;
  const factory InventoryEvent.refresh() = _Refresh;
  const factory InventoryEvent.createPo({
    required String supplierUuid,
    required String targetWarehouseUuid,
    required List<PurchaseOrderItem> items,
    String? notes,
  }) = _CreatePo;
}

@freezed
class InventoryState with _$InventoryState {
  const factory InventoryState({
    @Default(false) bool isLoading,
    @Default(0) double totalStockValue,
    @Default([]) List<String> lowStockProductUuids,
    @Default([]) List<PurchaseOrder> activePurchaseOrders,
    @Default([]) List<Supplier> suppliers,
    String? errorMessage,
  }) = _InventoryState;
}

@injectable
class InventoryBloc extends Bloc<InventoryEvent, InventoryState> {
  final IInventoryRepository _repository;
  final GetLowStockItemsUseCase _getLowStock;
  final CreatePurchaseOrderUseCase _createPo;

  InventoryBloc(this._repository, this._getLowStock, this._createPo)
      : super(const InventoryState()) {
    on<_Started>(_onStarted);
    on<_Refresh>(_onRefresh);
    on<_CreatePo>(_onCreatePo);
  }

  Future<void> _onStarted(_Started event, Emitter<InventoryState> emit) async {
    add(const InventoryEvent.refresh());
  }

  Future<void> _onRefresh(_Refresh event, Emitter<InventoryState> emit) async {
    emit(state.copyWith(isLoading: true, errorMessage: null));
    try {
      // Parallel fetch
      final results = await Future.wait([
        _repository.getPurchaseOrders(status: PoStatus.pending),
        _repository.getPurchaseOrders(status: PoStatus.sent),
        _repository.getPurchaseOrders(status: PoStatus.partiallyReceived),
        _repository.getSuppliers(),
        _getLowStock(),
      ]);

      final pendingPOs = results[0] as List<PurchaseOrder>;
      final sentPOs = results[1] as List<PurchaseOrder>;
      final partialPOs = results[2] as List<PurchaseOrder>;
      final suppliers = results[3] as List<Supplier>;
      final lowStock = results[4] as List<String>;

      final activePOs = [...pendingPOs, ...sentPOs, ...partialPOs];

      // Calculate Total Value?
      // Repository doesn't have "getTotalValue".
      // For now mock or 0.

      emit(state.copyWith(
        isLoading: false,
        activePurchaseOrders: activePOs,
        suppliers: suppliers,
        lowStockProductUuids: lowStock,
      ));
    } catch (e) {
      emit(state.copyWith(isLoading: false, errorMessage: e.toString()));
    }
  }

  Future<void> _onCreatePo(
      _CreatePo event, Emitter<InventoryState> emit) async {
    emit(state.copyWith(isLoading: true));
    try {
      await _createPo(
        supplierUuid: event.supplierUuid,
        targetWarehouseUuid: event.targetWarehouseUuid,
        items: event.items,
        notes: event.notes,
      );
      add(const InventoryEvent.refresh());
    } catch (e) {
      emit(state.copyWith(isLoading: false, errorMessage: e.toString()));
    }
  }
}
