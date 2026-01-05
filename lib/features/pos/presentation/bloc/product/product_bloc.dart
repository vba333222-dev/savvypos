import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:savvy_pos/features/inventory/domain/entities/product.dart';
import 'package:savvy_pos/features/inventory/domain/usecases/get_products.dart';

part 'product_bloc.freezed.dart';

@freezed
class ProductEvent with _$ProductEvent {
  const factory ProductEvent.loadProducts() = _LoadProducts;
}

@freezed
class ProductState with _$ProductState {
  const factory ProductState.initial() = _Initial;
  const factory ProductState.loading() = _Loading;
  const factory ProductState.loaded(List<Product> products) = _Loaded;
  const factory ProductState.error(String message) = _Error;
}

@injectable
class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final GetProductsUseCase getProducts;

  ProductBloc(this.getProducts) : super(const ProductState.initial()) {
    on<_LoadProducts>(_onLoadProducts);
  }

  Future<void> _onLoadProducts(_LoadProducts event, Emitter<ProductState> emit) async {
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
