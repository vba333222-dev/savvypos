import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:savvy_pos/features/inventory/domain/entities/product.dart';
import 'package:savvy_pos/features/inventory/domain/usecases/get_products.dart';

part 'product_bloc.freezed.dart';

@freezed
class ProductEvent with _$ProductEvent {
  const factory ProductEvent.loadProducts() = LoadProducts;
}

@freezed
class ProductState with _$ProductState {
  const factory ProductState.initial() = ProductInitial;
  const factory ProductState.loading() = ProductLoading;
  const factory ProductState.loaded(List<Product> products) = ProductLoaded;
  const factory ProductState.error(String message) = ProductError;
}

@injectable
class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final GetProductsUseCase getProducts;

  ProductBloc(this.getProducts) : super(const ProductState.initial()) {
    on<LoadProducts>(_onLoadProducts);
  }

  Future<void> _onLoadProducts(LoadProducts event, Emitter<ProductState> emit) async {
    emit(const ProductState.loading());
    try {
      await emit.forEach(
        getProducts.execute(),
        onData: (List<Product> data) => ProductState.loaded(data),
        onError: (error, stackTrace) => ProductState.error(error.toString()),
      );
    } catch (e) {
      emit(ProductState.error(e.toString()));
    }
  }
}
