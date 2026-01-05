import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:savvy_pos/features/inventory/domain/entities/product.dart';
import 'package:savvy_pos/features/inventory/domain/usecases/get_products.dart';

// --- EVENTS ---
abstract class ProductEvent extends Equatable {
  const ProductEvent();
  @override
  List<Object> get props => [];
}

class LoadProducts extends ProductEvent {}

// --- STATES ---
abstract class ProductState extends Equatable {
  const ProductState();
  @override
  List<Object> get props => [];
}

class ProductInitial extends ProductState {}

class ProductLoading extends ProductState {}

class ProductLoaded extends ProductState {
  final List<Product> products;
  const ProductLoaded(this.products);
  @override
  List<Object> get props => [products];
}

class ProductError extends ProductState {
  final String message;
  const ProductError(this.message);
  @override
  List<Object> get props => [message];
}

// --- BLOC ---
class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final GetProductsUseCase getProducts;

  ProductBloc(this.getProducts) : super(ProductInitial()) {
    on<LoadProducts>(_onLoadProducts);
  }

  Future<void> _onLoadProducts(LoadProducts event, Emitter<ProductState> emit) async {
    emit(ProductLoading());
    try {
      await emit.forEach(
        getProducts.execute(),
        onData: (List<Product> data) => ProductLoaded(data),
        onError: (error, stackTrace) => ProductError(error.toString()),
      );
    } catch (e) {
      emit(ProductError(e.toString()));
    }
  }
}
