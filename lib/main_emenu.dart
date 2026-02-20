import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:savvy_pos/core/config/theme/savvy_theme.dart';
import 'package:savvy_pos/features/emenu/presentation/pages/emenu_home_page.dart';
import 'package:savvy_pos/bootstrap.dart';
import 'package:savvy_pos/core/config/app_config.dart';

void main() {
  bootstrap(AppConfig(
    appName: 'Savvy E-Menu',
    flavor: Flavor.prod,
    apiBaseUrl: 'https://api.savvypos.com',
    userApp: () => const EMenuApp(),
  ));
}

class EMenuApp extends StatelessWidget {
  const EMenuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Savvy E-Menu',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(extensions: [SavvyTheme.light()]), // Default to light or custom emenu theme
      routerConfig: _router,
    );
  }
}

final _router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) {
        // Parse Query Params for Guest Session (Safe fallback)
        final uri = Uri.parse(state.location); 
        final storeId = uri.queryParameters['store'];
        final tableId = uri.queryParameters['table'];
        
        return EMenuHomePage(storeId: storeId, tableId: tableId);
      },
    ),
  ],
);
