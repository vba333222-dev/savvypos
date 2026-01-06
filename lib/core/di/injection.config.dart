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

import '../../features/auth/data/repositories/tenant_repository_impl.dart'
    as _i422;
import '../../features/auth/domain/repositories/i_tenant_repository.dart'
    as _i302;
import '../../features/auth/presentation/bloc/auth_bloc.dart' as _i797;
import '../../features/customers/data/repositories/customer_repository_impl.dart'
    as _i877;
import '../../features/customers/domain/repositories/i_customer_repository.dart'
    as _i884;
import '../../features/customers/presentation/bloc/customer_bloc.dart' as _i676;
import '../../features/dashboard/data/repositories/dashboard_repository_impl.dart'
    as _i509;
import '../../features/dashboard/data/repositories/remote_dashboard_repository_impl.dart'
    as _i477;
import '../../features/dashboard/domain/repositories/i_dashboard_repository.dart'
    as _i485;
import '../../features/dashboard/presentation/bloc/dashboard_bloc.dart'
    as _i652;
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
import '../../features/inventory/presentation/bloc/inventory_management_bloc.dart'
    as _i965;
import '../../features/kitchen/presentation/bloc/kitchen_bloc.dart' as _i86;
import '../../features/pos/presentation/bloc/cart/cart_bloc.dart' as _i177;
import '../../features/pos/presentation/bloc/product/product_bloc.dart'
    as _i313;
import '../../features/reports/data/repositories/report_repository_impl.dart'
    as _i246;
import '../../features/reports/domain/repositories/i_report_repository.dart'
    as _i912;
import '../../features/reports/presentation/bloc/report_bloc.dart' as _i652;
import '../../features/reservations/data/repositories/reservation_repository_impl.dart'
    as _i386;
import '../../features/reservations/domain/repositories/i_reservation_repository.dart'
    as _i856;
import '../../features/reservations/presentation/bloc/reservation_bloc.dart'
    as _i118;
import '../../features/settings/presentation/bloc/backup_bloc.dart' as _i521;
import '../../features/shift/data/repositories/shift_repository_impl.dart'
    as _i139;
import '../../features/shift/domain/repositories/i_shift_repository.dart'
    as _i240;
import '../../features/shift/presentation/bloc/shift_bloc.dart' as _i246;
import '../../features/tables/data/repositories/table_repository_impl.dart'
    as _i392;
import '../../features/tables/domain/repositories/i_table_repository.dart'
    as _i22;
import '../../features/tables/presentation/bloc/table_bloc.dart' as _i424;
import '../database/database.dart' as _i660;
import '../hal/printer_interface.dart' as _i560;
import '../hal/printer_router.dart' as _i430;
import '../hal/printer_service.dart' as _i16;
import '../network/api_client.dart' as _i557;
import '../utils/sound_helper.dart' as _i842;

const String _mobile = 'mobile';
const String _web = 'web';

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
    gh.factory<_i521.BackupBloc>(() => _i521.BackupBloc());
    gh.lazySingleton<_i660.AppDatabase>(() => _i660.AppDatabase());
    gh.lazySingleton<_i842.SoundHelper>(() => _i842.SoundHelper());
    gh.lazySingleton<_i557.ApiClient>(() => _i557.ApiClient());
    gh.lazySingleton<_i240.IShiftRepository>(
        () => _i139.ShiftRepositoryImpl(gh<_i660.AppDatabase>()));
    gh.lazySingleton<_i22.ITableRepository>(
        () => _i392.TableRepositoryImpl(gh<_i660.AppDatabase>()));
    gh.lazySingleton<_i485.IDashboardRepository>(
      () => _i509.DashboardRepositoryImpl(gh<_i660.AppDatabase>()),
      registerFor: {_mobile},
    );
    gh.lazySingleton<_i695.IProductRepository>(
        () => _i777.ProductRepositoryImpl(gh<_i660.AppDatabase>()));
    gh.lazySingleton<_i302.ITenantRepository>(
        () => _i422.TenantRepositoryImpl(gh<_i660.AppDatabase>()));
    gh.factory<_i177.CartBloc>(() => _i177.CartBloc(
          gh<_i660.AppDatabase>(),
          gh<_i842.SoundHelper>(),
        ));
    gh.lazySingleton<_i67.IOrderRepository>(
        () => _i14.OrderRepositoryImpl(gh<_i660.AppDatabase>()));
    gh.lazySingleton<_i560.IPrinterService>(() => _i16.PrinterService());
    gh.lazySingleton<_i485.IDashboardRepository>(
      () => _i477.RemoteDashboardRepositoryImpl(gh<_i557.ApiClient>()),
      registerFor: {_web},
    );
    gh.lazySingleton<_i856.IReservationRepository>(
        () => _i386.ReservationRepositoryImpl(gh<_i660.AppDatabase>()));
    gh.lazySingleton<_i884.ICustomerRepository>(
        () => _i877.CustomerRepositoryImpl(gh<_i660.AppDatabase>()));
    gh.factory<_i797.AuthBloc>(() => _i797.AuthBloc(gh<_i660.AppDatabase>()));
    gh.lazySingleton<_i912.IReportRepository>(
        () => _i246.ReportRepositoryImpl(gh<_i660.AppDatabase>()));
    gh.factory<_i424.TableBloc>(
        () => _i424.TableBloc(gh<_i22.ITableRepository>()));
    gh.factory<_i652.ReportBloc>(
        () => _i652.ReportBloc(gh<_i912.IReportRepository>()));
    gh.lazySingleton<_i430.PrinterRouter>(
        () => _i430.PrinterRouter(gh<_i560.IPrinterService>()));
    gh.lazySingleton<_i246.ShiftBloc>(
        () => _i246.ShiftBloc(gh<_i240.IShiftRepository>()));
    gh.factory<_i652.DashboardBloc>(
      () => _i652.DashboardBloc(gh<_i485.IDashboardRepository>()),
      registerFor: {
        _mobile,
        _web,
      },
    );
    gh.factory<_i118.ReservationBloc>(
        () => _i118.ReservationBloc(gh<_i856.IReservationRepository>()));
    gh.factory<_i1070.HistoryBloc>(
        () => _i1070.HistoryBloc(gh<_i67.IOrderRepository>()));
    gh.factory<_i86.KitchenBloc>(
        () => _i86.KitchenBloc(gh<_i67.IOrderRepository>()));
    gh.factory<_i965.InventoryManagementBloc>(
        () => _i965.InventoryManagementBloc(gh<_i695.IProductRepository>()));
    gh.factory<_i1053.GetProductsUseCase>(
        () => _i1053.GetProductsUseCase(gh<_i695.IProductRepository>()));
    gh.factory<_i676.CustomerBloc>(
        () => _i676.CustomerBloc(gh<_i884.ICustomerRepository>()));
    gh.factory<_i313.ProductBloc>(
        () => _i313.ProductBloc(gh<_i1053.GetProductsUseCase>()));
    return this;
  }
}
