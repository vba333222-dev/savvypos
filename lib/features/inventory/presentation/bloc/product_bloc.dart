import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:savvy_pos/features/inventory/domain/entities/product.dart';
import 'package:savvy_pos/features/inventory/domain/repositories/i_product_repository.dart';
import 'package:rxdart/rxdart.dart';

part 'product_bloc.freezed.dart';

@freezed
class ProductEvent with _$ProductEvent {
  const factory ProductEvent.load() = _Load;
  const factory ProductEvent.search(String query) = _Search;
  const factory ProductEvent.delete(String uuid) = _Delete;
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
  final IProductRepository _repository;

  ProductBloc(this._repository) : super(const ProductState.initial()) {
    on<_Load>(_onLoad);
    on<_Search>(
      _onSearch,
      transformer: (events, mapper) => events
          .debounceTime(const Duration(milliseconds: 300))
          .switchMap(mapper),
    );
    on<_Delete>(_onDelete);
  }

  Future<void> _onLoad(_Load event, Emitter<ProductState> emit) async {
    emit(const ProductState.loading());
    try {
      // NOTE: watchAllProducts is a stream, but for this specific Bloc pattern
      // (often used for search/list view snapshots), we might prefer a future-based fetch
      // or we subscribe to the stream.
      // Given the repository signature: Stream<List<Product>> watchAllProducts();
      // We will listen to the stream.

      await emit.forEach<List<Product>>(
        _repository.watchAllProducts(),
        onData: (products) => ProductState.loaded(products),
        onError: (error, stackTrace) => ProductState.error(error.toString()),
      );
    } catch (e) {
      emit(ProductState.error(e.toString()));
    }
  }

  Future<void> _onSearch(_Search event, Emitter<ProductState> emit) async {
    emit(const ProductState.loading());
    try {
      final products = await _repository.searchProducts(event.query);
      emit(ProductState.loaded(products));
    } catch (e) {
      emit(ProductState.error(e.toString()));
    }
  }

  Future<void> _onDelete(_Delete event, Emitter<ProductState> emit) async {
    try {
      await _repository.deleteProduct(event.uuid);
      // The stream subscription in _onLoad should automatically update the list if delete succeeds.
    } catch (e) {
      emit(ProductState.error(e.toString()));
    }
  }
}
