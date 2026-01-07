import 'package:flutter/material.dart';
import 'package:savvy_pos/bootstrap.dart';
import 'package:savvy_pos/core/config/theme_config.dart';
import 'package:savvy_pos/core/sync/sync_worker.dart';
import 'package:savvy_pos/features/auth/domain/repositories/i_tenant_repository.dart';
import 'package:savvy_pos/features/auth/presentation/pages/onboarding_page.dart';
import 'package:savvy_pos/features/home/presentation/pages/main_shell_page.dart';
import 'package:savvy_pos/features/employees/presentation/pages/employee_login_page.dart';
import 'package:savvy_pos/features/pos/presentation/bloc/cart/cart_bloc.dart';
import 'package:savvy_pos/features/shift/presentation/bloc/shift_bloc.dart';
import 'package:savvy_pos/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:workmanager/workmanager.dart';
import 'package:savvy_pos/core/hal/printer_router.dart';
import 'package:get_it/get_it.dart';
import 'package:savvy_pos/core/config/token_service.dart';

import 'package:flutter/foundation.dart'; // for kIsWeb
import 'package:savvy_pos/features/admin/presentation/pages/web_admin_layout.dart';
import 'core/database/database.dart';

void main() async {
  // Ensure binding
  WidgetsFlutterBinding.ensureInitialized();
  
  // Init Workmanager
  await Workmanager().initialize(
    callbackDispatcher, 
    isInDebugMode: true 
  );
  
  await Workmanager().registerPeriodicTask(
    "1",
    "fiveMinuteSync",
    frequency: const Duration(minutes: 15), 
  );

  // Initialize Antigravity Design System
  await GetIt.I.registerSingleton<TokenService>(TokenService()).loadTokens();

  bootstrap(() => const App(), environment: 'mobile');
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Savvy POS',
      theme: ThemeData(
        extensions: [
          SavvyTheme.loadFromTokens(isDark: false),
        ],
        pageTransitionsTheme: const PageTransitionsTheme(
          builders: {
            TargetPlatform.android: ZoomPageTransitionsBuilder(),
            TargetPlatform.iOS: ZoomPageTransitionsBuilder(),
          },
        ),
      ),
      darkTheme: ThemeData(
        extensions: [
          SavvyTheme.loadFromTokens(isDark: true),
        ],
        pageTransitionsTheme: const PageTransitionsTheme(
          builders: {
            TargetPlatform.android: ZoomPageTransitionsBuilder(),
            TargetPlatform.iOS: ZoomPageTransitionsBuilder(),
          },
        ),
      ),
      home: MultiBlocProvider(
        providers: [
          BlocProvider.value(value: GetIt.I<AuthBloc>()),
          BlocProvider.value(value: GetIt.I<ShiftBloc>()..add(const ShiftEvent.checkStatus())),
          BlocProvider(create: (_) => GetIt.I<CartBloc>()),
        ],
        child: const _AppLoader(),
      ),
    );
  }
}

class _AppLoader extends StatelessWidget {
  const _AppLoader();

  @override
  @override
  Widget build(BuildContext context) {
    if (kIsWeb) {
      return const WebAdminLayout();
    }
    
    // Check Tenant Config
    return FutureBuilder(
      future: Future.wait([
        GetIt.I<ITenantRepository>().getConfig(),
        GetIt.I<PrinterRouter>().loadSettings(),
      ]),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(body: Center(child: CircularProgressIndicator()));
        }
        
        final config = snapshot.data?[0] as TenantConfig?;
        if (config == null) {
          return const OnboardingPage();
        } else {
          return const EmployeeLoginPage();
        }
      },
    );
  }
}
