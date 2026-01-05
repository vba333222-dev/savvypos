// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../features/history/data/repositories/order_repository_impl.dart'
    as _i14;
import '../../features/history/domain/repositories/i_order_repository.dart'
    as _i67;
import '../../features/history/presentation/bloc/history_bloc.dart' as _i1070;
import '../../features/inventory/data/repositories/product_repository_impl.dart'
    as _i777;
import '../../features/inventory/domain/repositories/i_product_repository.dart'
    as _i695;
import '../../features/inventory/domain/usecases/get_products.dart' as _i1053;
import '../../features/pos/presentation/bloc/cart/cart_bloc.dart' as _i177;
import '../../features/pos/presentation/bloc/product/product_bloc.dart'
    as _i313;
import '../../features/shift/data/repositories/shift_repository_impl.dart'
    as _i139;
import '../../features/shift/domain/repositories/i_shift_repository.dart'
    as _i240;
import '../../features/shift/presentation/bloc/shift_bloc.dart' as _i246;
import '../database/database.dart' as _i660;
import '../hal/printer_interface.dart' as _i560;
import '../hal/printer_service.dart' as _i16;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.lazySingleton<_i660.AppDatabase>(() => _i660.AppDatabase());
    gh.lazySingleton<_i240.IShiftRepository>(
        () => _i139.ShiftRepositoryImpl(gh<_i660.AppDatabase>()));
    gh.lazySingleton<_i695.IProductRepository>(
        () => _i777.ProductRepositoryImpl(gh<_i660.AppDatabase>()));
    gh.lazySingleton<_i67.IOrderRepository>(
        () => _i14.OrderRepositoryImpl(gh<_i660.AppDatabase>()));
    gh.lazySingleton<_i560.IPrinterService>(() => _i16.PrinterService());
    gh.factory<_i177.CartBloc>(() => _i177.CartBloc(gh<_i660.AppDatabase>()));
    gh.factory<_i246.ShiftBloc>(
        () => _i246.ShiftBloc(gh<_i240.IShiftRepository>()));
    gh.factory<_i1070.HistoryBloc>(
        () => _i1070.HistoryBloc(gh<_i67.IOrderRepository>()));
    gh.factory<_i1053.GetProductsUseCase>(
        () => _i1053.GetProductsUseCase(gh<_i695.IProductRepository>()));
    gh.factory<_i313.ProductBloc>(
        () => _i313.ProductBloc(gh<_i1053.GetProductsUseCase>()));
    return this;
  }
}
