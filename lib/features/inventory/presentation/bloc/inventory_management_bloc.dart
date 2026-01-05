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
  const factory InventoryManagementEvent.addProduct(Product product, File? imageFile) = _AddProduct;
  const factory InventoryManagementEvent.updateProduct(Product product, File? imageFile) = _UpdateProduct;
  const factory InventoryManagementEvent.deleteProduct(String uuid) = _DeleteProduct;
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

      final product = event.product.copyWith(
        uuid: event.product.uuid.isEmpty ? _uuid.v4() : event.product.uuid,
        imageUrl: imagePath,
      );

      await _repository.saveProduct(product);
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
}
