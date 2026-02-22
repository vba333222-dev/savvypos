import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:savvy_pos/features/inventory/domain/entities/product.dart';
import 'package:savvy_pos/features/sales/domain/entities/cart.dart';
import 'package:savvy_pos/features/sales/domain/entities/cart_item.dart';
import 'package:savvy_pos/features/sales/domain/entities/category.dart';
import 'package:savvy_pos/features/sales/domain/usecases/sales_usecases.dart';
import 'package:savvy_pos/features/sales/domain/usecases/get_modifiers_usecase.dart';

part 'sales_bloc.freezed.dart';

@freezed
class SalesEvent with _$SalesEvent {
  const factory SalesEvent.started() = _Started;

  // Menu
  const factory SalesEvent.categorySelected(String? categoryId) =
      _CategorySelected;
  const factory SalesEvent.searchQueryChanged(String query) =
      _SearchQueryChanged;
  const factory SalesEvent.selectProduct(Product product) =
      _SelectProduct; // New event to trigger modifier check

  // Cart
  const factory SalesEvent.addToCart(Product product,
      {int? quantity, List<String>? modifiers, String? note}) = _AddToCart;
  const factory SalesEvent.removeFromCart(String cartItemId) = _RemoveFromCart;
  const factory SalesEvent.updateQuantity(String cartItemId, int quantity) =
      _UpdateQuantity;
  const factory SalesEvent.clearCart() = _ClearCart;

  // Order
  const factory SalesEvent.createOrder(
      {String? tableUuid, String? customerUuid}) = _CreateOrder;

  // Internal
  const factory SalesEvent.categoriesUpdated(List<Category> categories) =
      _CategoriesUpdated;
  const factory SalesEvent.productsUpdated(List<Product> products) =
      _ProductsUpdated;
}

@freezed
class SalesState with _$SalesState {
  const factory SalesState({
    @Default(false) bool isLoading,
    @Default([]) List<Category> categories,
    @Default([]) List<Product> products,
    @Default(Cart()) Cart cart,
    String? selectedCategoryId,
    String? searchQuery,
    String? errorMessage,
    @Default(false) bool isOrderSuccess,
    String? lastCreatedOrderUuid, // Added for navigation
    Product? selectedProductForModifiers, // To show dialog
    @Default([]) List<ModifierGroupWithItems> modifierGroups, // Data for dialog
  }) = _SalesState;
}

@injectable
class SalesBloc extends Bloc<SalesEvent, SalesState> {
  final WatchCategoriesUseCase _watchCategories;
  final WatchProductsByCategoryUseCase _watchProducts;
  final CreateOrderUseCase _createOrder;
  final GetModifiersUseCase _getModifiers;

  StreamSubscription? _categoriesSub;
  StreamSubscription? _productsSub;

  SalesBloc(
    this._watchCategories,
    this._watchProducts,
    this._createOrder,
    this._getModifiers,
  ) : super(const SalesState()) {
    on<_Started>(_onStarted);
    on<_CategorySelected>(_onCategorySelected);
    on<_SelectProduct>(_onSelectProduct);
    // on<_SearchQueryChanged>(_onSearchQueryChanged); // Implement later
    on<_AddToCart>(_onAddToCart);
    on<_RemoveFromCart>(_onRemoveFromCart);
    on<_UpdateQuantity>(_onUpdateQuantity);
    on<_ClearCart>(_onClearCart);
    on<_CreateOrder>(_onCreateOrder);
    on<_CategoriesUpdated>((event, emit) =>
        emit(state.copyWith(categories: event.categories, isLoading: false)));
    on<_ProductsUpdated>(
        (event, emit) => emit(state.copyWith(products: event.products)));
  }

  Future<void> _onStarted(_Started event, Emitter<SalesState> emit) async {
    emit(state.copyWith(isLoading: true));

    _categoriesSub?.cancel();
    _categoriesSub = _watchCategories().listen((categories) {
      add(SalesEvent.categoriesUpdated(categories));
      // Select first category by default if none selected?
      // For now keep null (All)
    });

    _watchProductsStream();
  }

  void _watchProductsStream() {
    _productsSub?.cancel();
    _productsSub =
        _watchProducts(categoryId: state.selectedCategoryId).listen((products) {
      add(SalesEvent.productsUpdated(products));
    });
  }

  Future<void> _onCategorySelected(
      _CategorySelected event, Emitter<SalesState> emit) async {
    if (state.selectedCategoryId == event.categoryId) return;

    emit(state.copyWith(selectedCategoryId: event.categoryId));
    _watchProductsStream();
  }

  Future<void> _onSelectProduct(
      _SelectProduct event, Emitter<SalesState> emit) async {
    final modifiers = await _getModifiers(event.product.uuid);
    if (modifiers.isEmpty) {
      // No modifiers, add directly
      add(SalesEvent.addToCart(event.product));
    } else {
      // Show dialog with modifiers
      emit(state.copyWith(
          selectedProductForModifiers: event.product,
          modifierGroups: modifiers));
    }
  }

  Future<void> _onAddToCart(_AddToCart event, Emitter<SalesState> emit) async {
    final item = CartItem.create(
      product: event.product,
      quantity: event.quantity ?? 1,
      modifiers: event.modifiers ?? [],
      note: event.note,
    );
    emit(state.copyWith(
      cart: state.cart.addItem(item),
      selectedProductForModifiers: null, // Close dialog if open
      modifierGroups: [],
    ));
  }

  Future<void> _onRemoveFromCart(
      _RemoveFromCart event, Emitter<SalesState> emit) async {
    emit(state.copyWith(cart: state.cart.removeItem(event.cartItemId)));
  }

  Future<void> _onUpdateQuantity(
      _UpdateQuantity event, Emitter<SalesState> emit) async {
    emit(state.copyWith(
        cart: state.cart.updateQuantity(event.cartItemId, event.quantity)));
  }

  Future<void> _onClearCart(_ClearCart event, Emitter<SalesState> emit) async {
    emit(state.copyWith(cart: state.cart.clear()));
  }

  Future<void> _onCreateOrder(
      _CreateOrder event, Emitter<SalesState> emit) async {
    emit(state.copyWith(
        isLoading: true, isOrderSuccess: false, errorMessage: null));
    try {
      final orderUuid = await _createOrder(state.cart,
          tableUuid: event.tableUuid, customerUuid: event.customerUuid);
      emit(state.copyWith(
        isLoading: false,
        isOrderSuccess: true,
        lastCreatedOrderUuid: orderUuid,
        cart: state.cart.clear(), // Clear cart on success
      ));
    } catch (e) {
      emit(state.copyWith(isLoading: false, errorMessage: e.toString()));
    }
  }

  @override
  Future<void> close() {
    _categoriesSub?.cancel();
    _productsSub?.cancel();
    return super.close();
  }
}
