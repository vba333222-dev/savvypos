import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';
import 'package:savvy_pos/features/inventory/domain/entities/product.dart';
import 'package:savvy_pos/features/inventory/domain/repositories/i_product_repository.dart';
import 'package:uuid/uuid.dart';
import 'package:path/path.dart' as p;

part 'inventory_management_bloc.freezed.dart';

@freezed
class InventoryManagementEvent with _$InventoryManagementEvent {
  const factory InventoryManagementEvent.addProduct(Product product, File? imageFile, {List<String>? modifierGroupUuids}) = _AddProduct;
  const factory InventoryManagementEvent.updateProduct(Product product, File? imageFile, {List<String>? modifierGroupUuids}) = _UpdateProduct;
  const factory InventoryManagementEvent.deleteProduct(String uuid) = _DeleteProduct;
  const factory InventoryManagementEvent.updateStock(String uuid, int delta) = _UpdateStock;
}

@freezed
class InventoryManagementState with _$InventoryManagementState {
  const factory InventoryManagementState.initial() = _Initial;
  const factory InventoryManagementState.loading() = _Loading;
  const factory InventoryManagementState.success() = _Success;
  const factory InventoryManagementState.error(String message) = _Error;
}

@injectable
class InventoryManagementBloc extends Bloc<InventoryManagementEvent, InventoryManagementState> {
  final IProductRepository _repository;
  final Uuid _uuid = const Uuid();

  InventoryManagementBloc(this._repository) : super(const InventoryManagementState.initial()) {
    on<_AddProduct>(_onAddProduct);
    on<_UpdateProduct>(_onUpdateProduct);
    on<_DeleteProduct>(_onDeleteProduct);
    on<_UpdateStock>(_onUpdateStock);
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
}
