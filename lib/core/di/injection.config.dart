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
import 'package:logger/logger.dart' as _i974;

import '../../features/auth/data/repositories/tenant_repository_impl.dart'
    as _i422;
import '../../features/auth/domain/repositories/i_tenant_repository.dart'
    as _i302;
import '../../features/auth/presentation/bloc/auth_bloc.dart' as _i797;
import '../../features/cash/data/repositories/cash_drawer_repository_impl.dart'
    as _i436;
import '../../features/cash/domain/repositories/i_cash_drawer_repository.dart'
    as _i24;
import '../../features/cash/domain/usecases/cash_usecases.dart' as _i821;
import '../../features/cash/presentation/bloc/cash_management_bloc.dart'
    as _i797;
import '../../features/cds/presentation/bloc/cds_bloc.dart' as _i277;
import '../../features/customers/data/repositories/customer_crm_repository_impl.dart'
    as _i942;
import '../../features/customers/data/repositories/customer_repository_impl.dart'
    as _i877;
import '../../features/customers/domain/repositories/i_customer_crm_repository.dart'
    as _i739;
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
import '../../features/delivery/data/repositories/delivery_repository_impl.dart'
    as _i43;
import '../../features/delivery/domain/repositories/i_delivery_repository.dart'
    as _i411;
import '../../features/delivery/domain/services/delivery_orchestrator_service.dart'
    as _i678;
import '../../features/delivery/presentation/bloc/delivery_management_bloc.dart'
    as _i658;
import '../../features/emenu/data/repositories/kiosk_repository_impl.dart'
    as _i844;
import '../../features/emenu/domain/repositories/i_kiosk_repository.dart'
    as _i228;
import '../../features/employees/data/repositories/employee_repository_impl.dart'
    as _i274;
import '../../features/employees/domain/repositories/i_employee_repository.dart'
    as _i531;
import '../../features/feedback/data/repositories/feedback_repository_impl.dart'
    as _i961;
import '../../features/feedback/domain/repositories/i_feedback_repository.dart'
    as _i620;
import '../../features/giftcards/data/repositories/gift_card_repository_impl.dart'
    as _i774;
import '../../features/giftcards/domain/repositories/i_gift_card_repository.dart'
    as _i1067;
import '../../features/giftcards/presentation/bloc/gift_card_bloc.dart'
    as _i306;
import '../../features/history/data/repositories/order_repository_impl.dart'
    as _i14;
import '../../features/history/domain/repositories/i_order_repository.dart'
    as _i67;
import '../../features/history/presentation/bloc/history_bloc.dart' as _i1070;
import '../../features/inventory/data/repositories/advanced_inventory_repository_impl.dart'
    as _i281;
import '../../features/inventory/data/repositories/inventory_repository_impl.dart'
    as _i572;
import '../../features/inventory/data/repositories/product_repository_impl.dart'
    as _i777;
import '../../features/inventory/data/repositories/recipe_repository_impl.dart'
    as _i994;
import '../../features/inventory/domain/repositories/i_advanced_inventory_repository.dart'
    as _i932;
import '../../features/inventory/domain/repositories/i_inventory_repository.dart'
    as _i110;
import '../../features/inventory/domain/repositories/i_product_repository.dart'
    as _i695;
import '../../features/inventory/domain/repositories/i_recipe_repository.dart'
    as _i212;
import '../../features/inventory/domain/usecases/execute_stock_transfer.dart'
    as _i595;
import '../../features/inventory/domain/usecases/get_products.dart' as _i1053;
import '../../features/inventory/domain/usecases/inventory_usecases.dart'
    as _i380;
import '../../features/inventory/domain/usecases/receive_goods.dart' as _i932;
import '../../features/inventory/presentation/bloc/advanced_inventory_bloc.dart'
    as _i926;
import '../../features/inventory/presentation/bloc/inventory_bloc.dart'
    as _i690;
import '../../features/inventory/presentation/bloc/inventory_management_bloc.dart'
    as _i965;
import '../../features/inventory/presentation/bloc/menu_management_bloc.dart'
    as _i576;
import '../../features/inventory/presentation/bloc/product_bloc.dart' as _i820;
import '../../features/kitchen/data/repositories/kds_repository_impl.dart'
    as _i933;
import '../../features/kitchen/data/repositories/kitchen_repository_impl.dart'
    as _i901;
import '../../features/kitchen/data/repositories/mock_kitchen_repository.dart'
    as _i204;
import '../../features/kitchen/domain/repositories/i_kds_repository.dart'
    as _i803;
import '../../features/kitchen/domain/repositories/i_kitchen_repository.dart'
    as _i856;
import '../../features/kitchen/presentation/bloc/kitchen_bloc.dart' as _i86;
import '../../features/loyalty/data/repositories/loyalty_repository_impl.dart'
    as _i662;
import '../../features/loyalty/domain/repositories/i_loyalty_repository.dart'
    as _i63;
import '../../features/loyalty/domain/usecases/loyalty_usecases.dart' as _i74;
import '../../features/loyalty/presentation/bloc/loyalty_bloc.dart' as _i705;
import '../../features/marketing/data/repositories/marketing_repository_impl.dart'
    as _i904;
import '../../features/marketing/domain/repositories/i_marketing_repository.dart'
    as _i617;
import '../../features/notification/data/repositories/staff_alert_repository_impl.dart'
    as _i998;
import '../../features/notification/domain/repositories/i_staff_alert_repository.dart'
    as _i327;
import '../../features/notification/presentation/bloc/notification_bloc.dart'
    as _i29;
import '../../features/pos/data/repositories/split_bill_repository_impl.dart'
    as _i281;
import '../../features/pos/domain/repositories/i_split_bill_repository.dart'
    as _i989;
import '../../features/pos/presentation/bloc/cart/cart_bloc.dart' as _i177;
import '../../features/promotions/data/repositories/discount_repository_impl.dart'
    as _i1060;
import '../../features/promotions/domain/repositories/i_discount_repository.dart'
    as _i34;
import '../../features/reports/data/repositories/report_repository_impl.dart'
    as _i246;
import '../../features/reports/domain/repositories/i_report_repository.dart'
    as _i912;
import '../../features/reports/presentation/bloc/report_bloc.dart' as _i652;
import '../../features/reservations/data/repositories/reservation_repository_impl.dart'
    as _i386;
import '../../features/reservations/data/repositories/waitlist_repository_impl.dart'
    as _i1056;
import '../../features/reservations/domain/repositories/i_reservation_repository.dart'
    as _i856;
import '../../features/reservations/domain/repositories/i_waitlist_repository.dart'
    as _i259;
import '../../features/reservations/presentation/bloc/reservation_bloc.dart'
    as _i118;
import '../../features/sales/data/repositories/checkout_repository_impl.dart'
    as _i10;
import '../../features/sales/data/repositories/sales_repository_impl.dart'
    as _i779;
import '../../features/sales/domain/repositories/i_checkout_repository.dart'
    as _i98;
import '../../features/sales/domain/repositories/i_sales_repository.dart'
    as _i639;
import '../../features/sales/domain/usecases/checkout_usecases.dart' as _i931;
import '../../features/sales/domain/usecases/get_modifiers_usecase.dart'
    as _i105;
import '../../features/sales/domain/usecases/sales_usecases.dart' as _i873;
import '../../features/sales/presentation/bloc/checkout_bloc.dart' as _i858;
import '../../features/sales/presentation/bloc/sales_bloc.dart' as _i249;
import '../../features/settings/presentation/bloc/backup_bloc.dart' as _i521;
import '../../features/shifts/data/repositories/shift_repository_impl.dart'
    as _i307;
import '../../features/shifts/domain/repositories/i_shift_repository.dart'
    as _i19;
import '../../features/shifts/presentation/bloc/shift_bloc.dart' as _i455;
import '../../features/tables/data/repositories/table_repository_impl.dart'
    as _i392;
import '../../features/tables/domain/repositories/i_table_repository.dart'
    as _i22;
import '../../features/tables/domain/usecases/floor_plan_usecases.dart'
    as _i426;
import '../../features/tables/presentation/bloc/floor_plan_editor_bloc.dart'
    as _i994;
import '../../features/tables/presentation/bloc/table_bloc.dart' as _i424;
import '../../features/tips/data/repositories/tip_repository_impl.dart' as _i25;
import '../../features/tips/domain/repositories/i_tip_repository.dart' as _i441;
import '../database/database.dart' as _i660;
import '../design_system/token_loader.dart' as _i258;
import '../hal/mock_edc_terminal.dart' as _i525;
import '../hal/payment_terminal_interface.dart' as _i222;
import '../hal/printer_interface.dart' as _i560;
import '../hal/printer_router.dart' as _i430;
import '../hal/printer_service.dart' as _i16;
import '../network/api_client.dart' as _i557;
import '../services/data_seeder.dart' as _i517;
import '../services/socket_service.dart' as _i411;
import '../sync/sync_worker.dart' as _i987;
import '../utils/backup_service.dart' as _i847;
import '../utils/sound_helper.dart' as _i842;
import 'injection.dart' as _i464;

const String _dev = 'dev';
const String _mobile = 'mobile';
const String _web = 'web';
const String _prod = 'prod';

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
    final coreModule = _$CoreModule();
    gh.factory<_i29.NotificationBloc>(() => _i29.NotificationBloc());
    gh.singleton<_i258.TokenLoader>(() => _i258.TokenLoader());
    gh.singleton<_i660.AppDatabase>(() => _i660.AppDatabase());
    gh.lazySingleton<_i974.Logger>(() => coreModule.logger);
    gh.lazySingleton<_i411.SocketService>(
      () => _i411.SocketService(),
      dispose: (i) => i.dispose(),
    );
    gh.lazySingleton<_i842.SoundHelper>(() => _i842.SoundHelper());
    gh.lazySingleton<_i557.ApiClient>(() => _i557.ApiClient());
    gh.lazySingleton<_i212.IRecipeRepository>(
        () => _i994.RecipeRepositoryImpl(gh<_i660.AppDatabase>()));
    gh.lazySingleton<_i620.IFeedbackRepository>(
        () => _i961.FeedbackRepositoryImpl(gh<_i660.AppDatabase>()));
    gh.lazySingleton<_i932.IAdvancedInventoryRepository>(
        () => _i281.AdvancedInventoryRepositoryImpl(gh<_i660.AppDatabase>()));
    gh.lazySingleton<_i847.BackupService>(
        () => _i847.BackupService(gh<_i660.AppDatabase>()));
    gh.factory<_i652.DashboardBloc>(
        () => _i652.DashboardBloc(gh<_i660.AppDatabase>()));
    gh.lazySingleton<_i24.ICashDrawerRepository>(
        () => _i436.CashDrawerRepositoryImpl(gh<_i660.AppDatabase>()));
    gh.lazySingleton<_i110.IInventoryRepository>(
        () => _i572.InventoryRepositoryImpl(gh<_i660.AppDatabase>()));
    gh.lazySingleton<_i22.ITableRepository>(
        () => _i392.TableRepositoryImpl(gh<_i660.AppDatabase>()));
    gh.factory<_i98.ICheckoutRepository>(
        () => _i10.CheckoutRepositoryImpl(gh<_i660.AppDatabase>()));
    gh.lazySingleton<_i228.IKioskRepository>(() => _i844.KioskRepositoryImpl());
    gh.factory<_i277.CdsBloc>(() => _i277.CdsBloc(gh<_i411.SocketService>()));
    gh.lazySingleton<_i222.IPaymentTerminalDevice>(
      () => _i525.MockEdcTerminal(
        shouldSimulateFailure: gh<bool>(),
        shouldSimulateTimeout: gh<bool>(),
      ),
      registerFor: {_dev},
    );
    gh.factory<_i931.ProcessPaymentUseCase>(
        () => _i931.ProcessPaymentUseCase(gh<_i98.ICheckoutRepository>()));
    gh.factory<_i931.GetOrderBalanceUseCase>(
        () => _i931.GetOrderBalanceUseCase(gh<_i98.ICheckoutRepository>()));
    gh.lazySingleton<_i485.IDashboardRepository>(
      () => _i509.DashboardRepositoryImpl(gh<_i660.AppDatabase>()),
      registerFor: {_mobile},
    );
    gh.lazySingleton<_i803.IKDSRepository>(
        () => _i933.KDSRepositoryImpl(gh<_i660.AppDatabase>()));
    gh.lazySingleton<_i327.IStaffAlertRepository>(
        () => _i998.StaffAlertRepositoryImpl(gh<_i660.AppDatabase>()));
    gh.lazySingleton<_i531.IEmployeeRepository>(
        () => _i274.EmployeeRepositoryImpl(gh<_i660.AppDatabase>()));
    gh.lazySingleton<_i19.IShiftRepository>(
        () => _i307.ShiftRepositoryImpl(gh<_i660.AppDatabase>()));
    gh.lazySingleton<_i739.ICustomerCrmRepository>(
        () => _i942.CustomerCrmRepositoryImpl(gh<_i660.AppDatabase>()));
    gh.lazySingleton<_i695.IProductRepository>(
        () => _i777.ProductRepositoryImpl(gh<_i660.AppDatabase>()));
    gh.lazySingleton<_i302.ITenantRepository>(
        () => _i422.TenantRepositoryImpl(gh<_i660.AppDatabase>()));
    gh.lazySingleton<_i989.ISplitBillRepository>(
        () => _i281.SplitBillRepositoryImpl(gh<_i660.AppDatabase>()));
    gh.lazySingleton<_i63.ILoyaltyRepository>(
        () => _i662.LoyaltyRepositoryImpl(gh<_i660.AppDatabase>()));
    gh.lazySingleton<_i617.IMarketingRepository>(
        () => _i904.MarketingRepositoryImpl(gh<_i660.AppDatabase>()));
    gh.lazySingleton<_i411.IDeliveryRepository>(
        () => _i43.DeliveryRepositoryImpl(gh<_i660.AppDatabase>()));
    gh.lazySingleton<_i67.IOrderRepository>(
        () => _i14.OrderRepositoryImpl(gh<_i660.AppDatabase>()));
    gh.lazySingleton<_i987.SyncWorker>(
      () => _i987.SyncWorker(
        gh<_i660.AppDatabase>(),
        gh<_i974.Logger>(),
      ),
      dispose: (i) => i.dispose(),
    );
    gh.lazySingleton<_i1067.IGiftCardRepository>(
        () => _i774.GiftCardRepositoryImpl(gh<_i660.AppDatabase>()));
    gh.lazySingleton<_i259.IWaitlistRepository>(
        () => _i1056.WaitlistRepositoryImpl(gh<_i660.AppDatabase>()));
    gh.lazySingleton<_i34.IDiscountRepository>(
        () => _i1060.DiscountRepositoryImpl(gh<_i660.AppDatabase>()));
    gh.lazySingleton<_i441.ITipRepository>(
        () => _i25.TipRepositoryImpl(gh<_i660.AppDatabase>()));
    gh.lazySingleton<_i639.ISalesRepository>(
        () => _i779.SalesRepositoryImpl(gh<_i660.AppDatabase>()));
    gh.lazySingleton<_i856.IKitchenRepository>(
      () => _i204.MockKitchenRepository(),
      registerFor: {_dev},
    );
    gh.lazySingleton<_i485.IDashboardRepository>(
      () => _i477.RemoteDashboardRepositoryImpl(gh<_i557.ApiClient>()),
      registerFor: {_web},
    );
    gh.factory<_i926.AdvancedInventoryBloc>(() =>
        _i926.AdvancedInventoryBloc(gh<_i932.IAdvancedInventoryRepository>()));
    gh.lazySingleton<_i856.IReservationRepository>(
        () => _i386.ReservationRepositoryImpl(gh<_i660.AppDatabase>()));
    gh.lazySingleton<_i884.ICustomerRepository>(
        () => _i877.CustomerRepositoryImpl(gh<_i660.AppDatabase>()));
    gh.lazySingleton<_i560.IPrinterService>(
        () => _i16.PrinterService(gh<_i660.AppDatabase>()));
    gh.lazySingleton<_i517.DataSeeder>(
        () => _i517.DataSeeder(gh<_i660.AppDatabase>()));
    gh.lazySingleton<_i912.IReportRepository>(
        () => _i246.ReportRepositoryImpl(gh<_i660.AppDatabase>()));
    gh.lazySingleton<_i856.IKitchenRepository>(
      () => _i901.KitchenRepositoryImpl(gh<_i660.AppDatabase>()),
      registerFor: {_prod},
    );
    gh.factory<_i595.ExecuteStockTransfer>(
        () => _i595.ExecuteStockTransfer(gh<_i110.IInventoryRepository>()));
    gh.factory<_i932.ReceiveGoods>(
        () => _i932.ReceiveGoods(gh<_i110.IInventoryRepository>()));
    gh.factory<_i380.CreatePurchaseOrderUseCase>(() =>
        _i380.CreatePurchaseOrderUseCase(gh<_i110.IInventoryRepository>()));
    gh.factory<_i380.ReceiveStockUseCase>(
        () => _i380.ReceiveStockUseCase(gh<_i110.IInventoryRepository>()));
    gh.factory<_i380.GetLowStockItemsUseCase>(
        () => _i380.GetLowStockItemsUseCase(gh<_i110.IInventoryRepository>()));
    gh.factory<_i105.GetModifiersUseCase>(
        () => _i105.GetModifiersUseCase(gh<_i639.ISalesRepository>()));
    gh.factory<_i873.WatchCategoriesUseCase>(
        () => _i873.WatchCategoriesUseCase(gh<_i639.ISalesRepository>()));
    gh.factory<_i873.WatchProductsByCategoryUseCase>(() =>
        _i873.WatchProductsByCategoryUseCase(gh<_i639.ISalesRepository>()));
    gh.factory<_i873.CreateOrderUseCase>(
        () => _i873.CreateOrderUseCase(gh<_i639.ISalesRepository>()));
    gh.factory<_i821.StartShiftUseCase>(
        () => _i821.StartShiftUseCase(gh<_i24.ICashDrawerRepository>()));
    gh.factory<_i821.CloseShiftUseCase>(
        () => _i821.CloseShiftUseCase(gh<_i24.ICashDrawerRepository>()));
    gh.factory<_i821.CashDropUseCase>(
        () => _i821.CashDropUseCase(gh<_i24.ICashDrawerRepository>()));
    gh.factory<_i821.GetShiftReportUseCase>(
        () => _i821.GetShiftReportUseCase(gh<_i24.ICashDrawerRepository>()));
    gh.factory<_i426.WatchZonesUseCase>(
        () => _i426.WatchZonesUseCase(gh<_i22.ITableRepository>()));
    gh.factory<_i426.WatchTablesUseCase>(
        () => _i426.WatchTablesUseCase(gh<_i22.ITableRepository>()));
    gh.factory<_i426.SaveZoneUseCase>(
        () => _i426.SaveZoneUseCase(gh<_i22.ITableRepository>()));
    gh.factory<_i426.DeleteZoneUseCase>(
        () => _i426.DeleteZoneUseCase(gh<_i22.ITableRepository>()));
    gh.factory<_i426.SaveTableUseCase>(
        () => _i426.SaveTableUseCase(gh<_i22.ITableRepository>()));
    gh.factory<_i426.DeleteTableUseCase>(
        () => _i426.DeleteTableUseCase(gh<_i22.ITableRepository>()));
    gh.lazySingleton<_i797.AuthBloc>(() => _i797.AuthBloc(
          gh<_i660.AppDatabase>(),
          gh<_i302.ITenantRepository>(),
        ));
    gh.factory<_i994.FloorPlanEditorBloc>(() => _i994.FloorPlanEditorBloc(
          gh<_i426.WatchZonesUseCase>(),
          gh<_i426.WatchTablesUseCase>(),
          gh<_i426.SaveZoneUseCase>(),
          gh<_i426.DeleteZoneUseCase>(),
          gh<_i426.SaveTableUseCase>(),
          gh<_i426.DeleteTableUseCase>(),
        ));
    gh.factory<_i652.ReportBloc>(
        () => _i652.ReportBloc(gh<_i912.IReportRepository>()));
    gh.lazySingleton<_i430.PrinterRouter>(
        () => _i430.PrinterRouter(gh<_i560.IPrinterService>()));
    gh.factory<_i74.EarnPointsUseCase>(
        () => _i74.EarnPointsUseCase(gh<_i63.ILoyaltyRepository>()));
    gh.factory<_i74.GetSegmentedMembersUseCase>(
        () => _i74.GetSegmentedMembersUseCase(gh<_i63.ILoyaltyRepository>()));
    gh.factory<_i690.InventoryBloc>(() => _i690.InventoryBloc(
          gh<_i110.IInventoryRepository>(),
          gh<_i380.GetLowStockItemsUseCase>(),
          gh<_i380.CreatePurchaseOrderUseCase>(),
        ));
    gh.factory<_i576.MenuManagementBloc>(
        () => _i576.MenuManagementBloc(gh<_i695.IProductRepository>()));
    gh.lazySingleton<_i455.ShiftBloc>(
        () => _i455.ShiftBloc(gh<_i19.IShiftRepository>()));
    gh.factory<_i797.CashManagementBloc>(() => _i797.CashManagementBloc(
          gh<_i821.StartShiftUseCase>(),
          gh<_i821.CloseShiftUseCase>(),
          gh<_i821.CashDropUseCase>(),
          gh<_i821.GetShiftReportUseCase>(),
          gh<_i24.ICashDrawerRepository>(),
        ));
    gh.factory<_i86.KitchenBloc>(
        () => _i86.KitchenBloc(gh<_i856.IKitchenRepository>()));
    gh.factory<_i965.InventoryManagementBloc>(
        () => _i965.InventoryManagementBloc(
              gh<_i695.IProductRepository>(),
              gh<_i797.AuthBloc>(),
              gh<_i595.ExecuteStockTransfer>(),
              gh<_i932.ReceiveGoods>(),
            ));
    gh.factory<_i118.ReservationBloc>(
        () => _i118.ReservationBloc(gh<_i856.IReservationRepository>()));
    gh.factory<_i676.CustomerBloc>(
        () => _i676.CustomerBloc(gh<_i739.ICustomerCrmRepository>()));
    gh.factory<_i306.GiftCardBloc>(
        () => _i306.GiftCardBloc(gh<_i1067.IGiftCardRepository>()));
    gh.factory<_i521.BackupBloc>(
        () => _i521.BackupBloc(gh<_i847.BackupService>()));
    gh.factory<_i658.DeliveryManagementBloc>(() => _i658.DeliveryManagementBloc(
          gh<_i411.IDeliveryRepository>(),
          gh<_i842.SoundHelper>(),
        ));
    gh.factory<_i858.CheckoutBloc>(() => _i858.CheckoutBloc(
          gh<_i931.ProcessPaymentUseCase>(),
          gh<_i931.GetOrderBalanceUseCase>(),
          gh<_i98.ICheckoutRepository>(),
          gh<_i74.EarnPointsUseCase>(),
          gh<_i222.IPaymentTerminalDevice>(),
        ));
    gh.factory<_i1070.HistoryBloc>(
        () => _i1070.HistoryBloc(gh<_i67.IOrderRepository>()));
    gh.factory<_i177.CartBloc>(() => _i177.CartBloc(
          gh<_i660.AppDatabase>(),
          gh<_i842.SoundHelper>(),
          gh<_i987.SyncWorker>(),
          gh<_i411.SocketService>(),
        ));
    gh.factory<_i820.ProductBloc>(
        () => _i820.ProductBloc(gh<_i695.IProductRepository>()));
    gh.factory<_i424.TableBloc>(() => _i424.TableBloc(
          gh<_i22.ITableRepository>(),
          gh<_i411.SocketService>(),
        ));
    gh.factory<_i705.LoyaltyBloc>(
        () => _i705.LoyaltyBloc(gh<_i63.ILoyaltyRepository>()));
    gh.factory<_i1053.GetProductsUseCase>(
        () => _i1053.GetProductsUseCase(gh<_i695.IProductRepository>()));
    gh.singleton<_i678.DeliveryOrchestratorService>(
      () => _i678.DeliveryOrchestratorService(
        gh<_i658.DeliveryManagementBloc>(),
        gh<_i430.PrinterRouter>(),
        gh<_i660.AppDatabase>(),
      ),
      dispose: (i) => i.dispose(),
    );
    gh.factory<_i249.SalesBloc>(() => _i249.SalesBloc(
          gh<_i873.WatchCategoriesUseCase>(),
          gh<_i873.WatchProductsByCategoryUseCase>(),
          gh<_i873.CreateOrderUseCase>(),
          gh<_i105.GetModifiersUseCase>(),
        ));
    return this;
  }
}

class _$CoreModule extends _i464.CoreModule {}
