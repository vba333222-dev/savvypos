import 'package:flutter/material.dart';
import 'package:savvy_pos/bootstrap.dart';
import 'package:savvy_pos/core/config/theme_config.dart';
import 'package:savvy_pos/core/sync/sync_worker.dart';
import 'package:savvy_pos/features/auth/domain/repositories/i_tenant_repository.dart';
import 'package:savvy_pos/features/auth/presentation/pages/onboarding_page.dart';
import 'package:savvy_pos/features/home/presentation/pages/main_shell_page.dart';
import 'package:savvy_pos/features/employees/presentation/pages/employee_login_page.dart';
import 'package:workmanager/workmanager.dart';
import 'package:savvy_pos/core/hal/printer_router.dart';
import 'package:get_it/get_it.dart';

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
          SavvyTheme.light(),
        ],
      ),
      darkTheme: ThemeData(
        extensions: [
          SavvyTheme.dark(),
        ],
      ),
      home: const _AppLoader(),
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
