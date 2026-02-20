import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';
import 'package:savvy_pos/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:savvy_pos/features/inventory/domain/entities/inventory_entities.dart';
import 'package:savvy_pos/features/inventory/domain/entities/product.dart';
import 'package:savvy_pos/features/inventory/domain/repositories/i_product_repository.dart';
import 'package:savvy_pos/features/inventory/domain/usecases/execute_stock_transfer.dart';
import 'package:savvy_pos/features/inventory/domain/usecases/receive_goods.dart';
import 'package:uuid/uuid.dart';
import 'package:path/path.dart' as p;

part 'inventory_management_bloc.freezed.dart';

@freezed
class InventoryManagementEvent with _$InventoryManagementEvent {
  const factory InventoryManagementEvent.addProduct(Product product, File? imageFile, {List<String>? modifierGroupUuids}) = _AddProduct;
  const factory InventoryManagementEvent.updateProduct(Product product, File? imageFile, {List<String>? modifierGroupUuids}) = _UpdateProduct;
  const factory InventoryManagementEvent.deleteProduct(String uuid) = _DeleteProduct;
  const factory InventoryManagementEvent.updateStock(String uuid, int delta) = _UpdateStock;
  const factory InventoryManagementEvent.watchInventory(String warehouseId) = _WatchInventory;
  const factory InventoryManagementEvent.inventoryUpdated(List<ProductStock> inventory) = _InventoryUpdated;
  const factory InventoryManagementEvent.stockTransferRequested({
    required String sourceWarehouseId,
    required String targetWarehouseId,
    required List<StockTransferItem> items,
    required String referenceNote,
  }) = _StockTransferRequested;
  const factory InventoryManagementEvent.receiveGoods({
    required String purchaseOrderUuid,
    required String warehouseUuid,
    required List<Map<String, dynamic>> items,
  }) = _ReceiveGoods;
}

@freezed
class InventoryManagementState with _$InventoryManagementState {
  const factory InventoryManagementState.initial() = _Initial;
  const factory InventoryManagementState.loading() = _Loading;
  const factory InventoryManagementState.success() = _Success;
  const factory InventoryManagementState.loaded(List<ProductStock> inventory) = _Loaded;
  const factory InventoryManagementState.error(String message) = _Error;
}

@injectable
class InventoryManagementBloc extends Bloc<InventoryManagementEvent, InventoryManagementState> {
  final IProductRepository _repository;
  final AuthBloc _authBloc;
  final ExecuteStockTransfer _executeStockTransfer;
  final ReceiveGoods _receiveGoods;
  final Uuid _uuid = const Uuid();
  
  StreamSubscription? _authSubscription;
  StreamSubscription? _inventorySubscription;

  InventoryManagementBloc(this._repository, this._authBloc, this._executeStockTransfer, this._receiveGoods) : super(const InventoryManagementState.initial()) {
    on<_AddProduct>(_onAddProduct);
    on<_UpdateProduct>(_onUpdateProduct);
    on<_DeleteProduct>(_onDeleteProduct);
    on<_UpdateStock>(_onUpdateStock);
    on<_WatchInventory>(_onWatchInventory);
    on<_InventoryUpdated>(_onInventoryUpdated);
    on<_StockTransferRequested>(_onStockTransferRequested);
    on<_ReceiveGoods>(_onReceiveGoods);

    // React to Auth Changes
    _authSubscription = _authBloc.stream.listen((authState) {
       if (authState.activeWarehouseId != null) {
         add(InventoryManagementEvent.watchInventory(authState.activeWarehouseId!));
       }
    });

    // Initial Load
    if (_authBloc.state.activeWarehouseId != null) {
       add(InventoryManagementEvent.watchInventory(_authBloc.state.activeWarehouseId!));
    }
  }

  @override
  Future<void> close() {
    _authSubscription?.cancel();
    _inventorySubscription?.cancel();
    return super.close();
  }
  
  Future<void> _onStockTransferRequested(_StockTransferRequested event, Emitter<InventoryManagementState> emit) async {
    emit(const InventoryManagementState.loading());
    try {
      await _executeStockTransfer(
        sourceWarehouseId: event.sourceWarehouseId,
        targetWarehouseId: event.targetWarehouseId,
        items: event.items,
        referenceNote: event.referenceNote,
        createdBy: _authBloc.state.employee?.uuid ?? 'unknown',
      );
      // Wait a tick for streams to update
      await Future.delayed(const Duration(milliseconds: 300));
      emit(const InventoryManagementState.success());
      
      // Return to loaded state shortly after to show list again if needed, 
      // but UI likely pops or refreshes.
    } catch (e) {
      emit(InventoryManagementState.error(e.toString()));
    }
  }

  Future<void> _onWatchInventory(_WatchInventory event, Emitter<InventoryManagementState> emit) async {
     emit(const InventoryManagementState.loading());
     await _inventorySubscription?.cancel();
     _inventorySubscription = _repository.watchInventory(event.warehouseId).listen(
       (items) => add(InventoryManagementEvent.inventoryUpdated(items)),
       onError: (e) => add(InventoryManagementEvent.updateStock('error', 0)) // Hacky but reuses logic or just log. Ideally add error event.
     );
  }

  Future<void> _onInventoryUpdated(_InventoryUpdated event, Emitter<InventoryManagementState> emit) async {
    emit(InventoryManagementState.loaded(event.inventory));
  }

  Future<String?> _saveImage(File? imageFile) async {
    if (imageFile == null) return null;
    try {
      final appDir = await getApplicationDocumentsDirectory();
      final fileName = '${_uuid.v4()}${p.extension(imageFile.path)}';
      final savedImage = await imageFile.copy('${appDir.path}/$fileName');
      return savedImage.path;
    } catch (e) {
      return null;
    }
  }

  Future<void> _onAddProduct(_AddProduct event, Emitter<InventoryManagementState> emit) async {
    emit(const InventoryManagementState.loading());
    try {
      String? imagePath;
      if (event.imageFile != null) {
        imagePath = await _saveImage(event.imageFile);
      }

      final uuid = event.product.uuid.isEmpty ? _uuid.v4() : event.product.uuid;
      final product = event.product.copyWith(
        uuid: uuid,
        imageUrl: imagePath,
      );

      await _repository.saveProduct(product);
      
      if (event.modifierGroupUuids != null) {
        await _repository.updateProductModifiers(uuid, event.modifierGroupUuids!);
      }
      
      // Success keeps it on same page or pops? Listing stays on loaded if stream persists.
      // But emit(success) overrides loaded. Listing page should handle it.
      emit(const InventoryManagementState.success());
    } catch (e) {
      emit(InventoryManagementState.error(e.toString()));
    }
  }

  Future<void> _onUpdateProduct(_UpdateProduct event, Emitter<InventoryManagementState> emit) async {
    emit(const InventoryManagementState.loading());
    try {
      String? imagePath = event.product.imageUrl;
      if (event.imageFile != null) {
        imagePath = await _saveImage(event.imageFile);
      }

      final product = event.product.copyWith(imageUrl: imagePath);
      await _repository.saveProduct(product);
      
      if (event.modifierGroupUuids != null) {
         await _repository.updateProductModifiers(product.uuid, event.modifierGroupUuids!);
      }
      
      emit(const InventoryManagementState.success());
    } catch (e) {
      emit(InventoryManagementState.error(e.toString()));
    }
  }

  Future<void> _onDeleteProduct(_DeleteProduct event, Emitter<InventoryManagementState> emit) async {
    emit(const InventoryManagementState.loading());
    try {
      await _repository.deleteProduct(event.uuid);
      emit(const InventoryManagementState.success());
    } catch (e) {
      emit(InventoryManagementState.error(e.toString()));
    }
  }

  Future<void> _onUpdateStock(_UpdateStock event, Emitter<InventoryManagementState> emit) async {
    // Optimistic update - assume success or just fire and forget for UI speed?
    // Let's fire and forget for Kinetic feel, repository handles the rest.
    try {
       await _repository.updateStock(event.uuid, event.delta);
       // No emit success needed if we are just listening to stream in UI? 
       // Ideally we might want to emit a transient state but streams handle data.
    } catch (e) {
       // Silent fail or snackbar?
    }
  }
  Future<void> _onReceiveGoods(_ReceiveGoods event, Emitter<InventoryManagementState> emit) async {
    emit(const InventoryManagementState.loading());
    try {
      // Convert items to Map<String, double> for quantities
      final quantities = <String, double>{};
      for (final item in event.items) {
        final productUuid = item['productUuid'] as String?;
        final qty = item['quantity'] as num?;
        if (productUuid != null && qty != null) {
          quantities[productUuid] = qty.toDouble();
        }
      }
      await _receiveGoods(event.purchaseOrderUuid, quantities);
      emit(const InventoryManagementState.success());
    } catch (e) {
      emit(InventoryManagementState.error(e.toString()));
    }
  }
}
