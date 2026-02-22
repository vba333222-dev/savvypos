import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:savvy_pos/features/inventory/domain/entities/modifier.dart';
import 'package:savvy_pos/features/inventory/domain/entities/product.dart';
import 'package:savvy_pos/features/inventory/domain/repositories/i_product_repository.dart';
import 'package:uuid/uuid.dart';

part 'menu_management_bloc.freezed.dart';

@freezed
class MenuManagementEvent with _$MenuManagementEvent {
  const factory MenuManagementEvent.loadAllModifiers() = _LoadAllModifiers;
  const factory MenuManagementEvent.saveModifierGroup(String name,
      bool multiSelect, int min, int? max, List<ModifierItem> items,
      {String? uuid}) = _SaveModifierGroup;

  const factory MenuManagementEvent.saveProduct({
    required String name,
    required double price,
    required String categoryId,
    String? sku,
    String? printerCategory,
    List<String>? modifierGroupUuids,
    String? uuid, // If null, create new
  }) = _SaveProduct;

  const factory MenuManagementEvent.loadProductDetails(String productUuid) =
      _LoadProductDetails;
}

@freezed
class MenuManagementState with _$MenuManagementState {
  const factory MenuManagementState({
    @Default(false) bool isLoading,
    @Default([]) List<ModifierGroup> allModifierGroups,
    Product? editingProduct,
    @Default([]) List<String> editingProductModifierIds,
    String? errorMessage,
    bool? isSuccess,
  }) = _MenuManagementState;
}

@injectable
class MenuManagementBloc
    extends Bloc<MenuManagementEvent, MenuManagementState> {
  final IProductRepository _repo;

  MenuManagementBloc(this._repo) : super(const MenuManagementState()) {
    on<_LoadAllModifiers>(_onLoadAllModifiers);
    on<_SaveModifierGroup>(_onSaveModifierGroup);
    on<_SaveProduct>(_onSaveProduct);
    on<_LoadProductDetails>(_onLoadProductDetails);
  }

  Future<void> _onLoadAllModifiers(
      _LoadAllModifiers event, Emitter<MenuManagementState> emit) async {
    emit(state.copyWith(isLoading: true));
    final result = await _repo.getAllModifierGroups();
    result.fold(
      (l) => emit(state.copyWith(isLoading: false, errorMessage: l.toString())),
      (r) => emit(state.copyWith(isLoading: false, allModifierGroups: r)),
    );
  }

  Future<void> _onSaveModifierGroup(
      _SaveModifierGroup event, Emitter<MenuManagementState> emit) async {
    emit(state.copyWith(isLoading: true));

    final group = ModifierGroup(
      uuid: event.uuid ?? const Uuid().v4(),
      name: event.name,
      allowMultiSelect: event.multiSelect,
      minSelection: event.min,
      maxSelection: event.max,
      items: event.items,
    );

    final result = await _repo.saveModifierGroup(group);

    await result.fold(
        (l) async =>
            emit(state.copyWith(isLoading: false, errorMessage: l.toString())),
        (r) async {
      // Reload list
      add(const MenuManagementEvent.loadAllModifiers());
      emit(state.copyWith(
          isLoading: false, isSuccess: true)); // Trigger UI success
    });
  }

  Future<void> _onSaveProduct(
      _SaveProduct event, Emitter<MenuManagementState> emit) async {
    emit(state.copyWith(isLoading: true, errorMessage: null));

    final productUuid = event.uuid ?? const Uuid().v4();
    final product = Product(
      uuid: productUuid,
      name: event.name,
      price: event.price,
      categoryId: event.categoryId,
      sku: event.sku ?? '',
      printerCategory: event.printerCategory ?? 'OTHER',
      trackStock: true, // Default
      isService: false,
      colorHex: null, // Basic for now
      imageUrl: null,
    );

    try {
      await _repo.saveProduct(product);

      if (event.modifierGroupUuids != null) {
        await _repo.updateProductModifiers(
            productUuid, event.modifierGroupUuids!);
      }

      emit(state.copyWith(isLoading: false, isSuccess: true));
    } catch (e) {
      emit(state.copyWith(isLoading: false, errorMessage: e.toString()));
    }
  }

  Future<void> _onLoadProductDetails(
      _LoadProductDetails event, Emitter<MenuManagementState> emit) async {
    emit(state.copyWith(isLoading: true));
    // Load Product
    final product = await _repo.getProductByUuid(event.productUuid);
    if (product == null) {
      emit(state.copyWith(isLoading: false, errorMessage: "Product not found"));
      return;
    }

    // Load Linked Modifiers
    final modResult = await _repo.getModifierGroups(event.productUuid);

    modResult.fold(
        (l) =>
            emit(state.copyWith(isLoading: false, errorMessage: l.toString())),
        (groups) => emit(state.copyWith(
            isLoading: false,
            editingProduct: product,
            editingProductModifierIds: groups.map((g) => g.uuid).toList())));
  }
}
