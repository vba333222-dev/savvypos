import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'injection.config.dart';

import 'package:logger/logger.dart';
import 'package:savvy_pos/core/database/database.dart';
import 'package:savvy_pos/features/marketing/domain/repositories/i_marketing_repository.dart';
import 'package:savvy_pos/features/marketing/data/repositories/marketing_repository_impl.dart';
import 'package:savvy_pos/features/delivery/domain/repositories/i_delivery_repository.dart';
import 'package:savvy_pos/features/delivery/data/repositories/delivery_repository_impl.dart';
import 'package:savvy_pos/features/delivery/domain/services/delivery_orchestrator_service.dart';
import 'package:savvy_pos/features/delivery/presentation/bloc/delivery_management_bloc.dart';
import 'package:savvy_pos/core/hal/printer_router.dart';
import 'package:savvy_pos/features/analytics/domain/repositories/i_analytics_repository.dart';
import 'package:savvy_pos/features/analytics/data/repositories/analytics_repository_impl.dart';
import 'package:savvy_pos/features/shifts/domain/repositories/i_shift_repository.dart';
import 'package:savvy_pos/features/shifts/data/repositories/shift_repository_impl.dart';
import 'package:savvy_pos/features/loyalty/domain/repositories/i_loyalty_repository.dart';
import 'package:savvy_pos/features/loyalty/data/repositories/loyalty_repository_impl.dart';
import 'package:savvy_pos/features/cash/domain/repositories/i_cash_drawer_repository.dart';
import 'package:savvy_pos/features/cash/data/repositories/cash_drawer_repository_impl.dart';
import 'package:savvy_pos/features/customers/domain/repositories/i_customer_crm_repository.dart';
import 'package:savvy_pos/features/customers/data/repositories/customer_crm_repository_impl.dart';
import 'package:savvy_pos/features/inventory/data/repositories/advanced_inventory_repository_impl.dart';
import 'package:savvy_pos/features/inventory/domain/repositories/i_advanced_inventory_repository.dart';
import 'package:savvy_pos/features/feedback/domain/repositories/i_feedback_repository.dart';
import 'package:savvy_pos/features/feedback/data/repositories/feedback_repository_impl.dart';
import 'package:savvy_pos/features/inventory/domain/repositories/i_recipe_repository.dart';
import 'package:savvy_pos/features/inventory/data/repositories/recipe_repository_impl.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: 'init',
  preferRelativeImports: true,
  asExtension: true,
)
Future<void> configureDependencies(String environment) async {
  getIt.init(environment: environment);
  
  // Manual registrations for new feature repositories
  if (!getIt.isRegistered<IMarketingRepository>()) {
    getIt.registerLazySingleton<IMarketingRepository>(
      () => MarketingRepositoryImpl(getIt<AppDatabase>()),
    );
  }
  
  if (!getIt.isRegistered<IDeliveryRepository>()) {
    getIt.registerLazySingleton<IDeliveryRepository>(
      () => DeliveryRepositoryImpl(getIt<AppDatabase>()),
    );
  }

  if (!getIt.isRegistered<DeliveryOrchestratorService>()) {
    getIt.registerLazySingleton<DeliveryOrchestratorService>(
      () => DeliveryOrchestratorService(
        getIt<DeliveryManagementBloc>(),
        getIt<PrinterRouter>(),
        getIt<AppDatabase>(),
      ),
    );
  }
  
  if (!getIt.isRegistered<IAnalyticsRepository>()) {
    getIt.registerLazySingleton<IAnalyticsRepository>(
      () => AnalyticsRepositoryImpl(getIt<AppDatabase>()),
    );
  }
  
  if (!getIt.isRegistered<IShiftRepository>()) {
    getIt.registerLazySingleton<IShiftRepository>(
      () => ShiftRepositoryImpl(getIt<AppDatabase>()),
    );
  }
  
  if (!getIt.isRegistered<ILoyaltyRepository>()) {
    getIt.registerLazySingleton<ILoyaltyRepository>(
      () => LoyaltyRepositoryImpl(getIt<AppDatabase>()),
    );
  }
  
  if (!getIt.isRegistered<ICashDrawerRepository>()) {
    getIt.registerLazySingleton<ICashDrawerRepository>(
      () => CashDrawerRepositoryImpl(getIt<AppDatabase>()),
    );
  }
  
  if (!getIt.isRegistered<ICustomerCrmRepository>()) {
    getIt.registerLazySingleton<ICustomerCrmRepository>(
      () => CustomerCrmRepositoryImpl(getIt<AppDatabase>()),
    );
  }

  if (!getIt.isRegistered<IAdvancedInventoryRepository>()) {
    getIt.registerLazySingleton<IAdvancedInventoryRepository>(
      () => AdvancedInventoryRepositoryImpl(getIt<AppDatabase>()),
    );
  }

  if (!getIt.isRegistered<IFeedbackRepository>()) {
    getIt.registerLazySingleton<IFeedbackRepository>(
      () => FeedbackRepositoryImpl(getIt<AppDatabase>()),
    );
  }

  if (!getIt.isRegistered<IRecipeRepository>()) {
    getIt.registerLazySingleton<IRecipeRepository>(
      () => RecipeRepositoryImpl(getIt<AppDatabase>()),
    );
  }
}

@module
abstract class CoreModule {
  @lazySingleton
  Logger get logger => Logger();
}
