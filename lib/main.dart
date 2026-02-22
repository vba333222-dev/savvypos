import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:savvy_pos/bootstrap.dart';
import 'package:savvy_pos/core/config/theme/savvy_theme.dart';
import 'package:savvy_pos/core/sync/sync_worker.dart';
import 'package:savvy_pos/core/config/routes/app_router.dart';
import 'package:savvy_pos/core/config/app_config.dart';
import 'package:savvy_pos/core/presentation/widgets/global_error_shield.dart';
import 'package:savvy_pos/core/presentation/bloc/theme_cubit.dart';
import 'package:savvy_pos/features/pos/presentation/bloc/cart/cart_bloc.dart';
import 'package:savvy_pos/features/shifts/presentation/bloc/shift_bloc.dart';
import 'package:savvy_pos/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:workmanager/workmanager.dart';

void main() async {
  // Ensure binding
  WidgetsFlutterBinding.ensureInitialized();

  // 1. Lock Orientation (Landscape Only for POS Kiosk)
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);

  // 2. Immersive Mode (Hide Status Bar & Bottom Navigation OS)
  await SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

  // Anti-Fragile Shield
  ErrorWidget.builder = (FlutterErrorDetails details) {
    return GlobalErrorShield(details: details);
  };

  // Init Workmanager
  await Workmanager().initialize(callbackDispatcher, isInDebugMode: true);

  await Workmanager().registerPeriodicTask(
    "1",
    "fiveMinuteSync",
    frequency: const Duration(minutes: 15),
  );

  // Initialize Antigravity Design System
  // Load saved theme preference (must be done before first frame)
  final themeCubit = await ThemeCubit.create();
  GetIt.I.registerSingleton<ThemeCubit>(themeCubit);

  bootstrap(AppConfig(
    appName: 'Savvy POS',
    flavor: Flavor.dev,
    apiBaseUrl: 'https://api.savvypos.com/dev',
    enableLogs: true,
    userApp: () => const App(),
  ));
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // PREVENT OOM: Aggressively clear image caches when app moves to background
    if (state == AppLifecycleState.paused ||
        state == AppLifecycleState.hidden) {
      PaintingBinding.instance.imageCache.clear();
      PaintingBinding.instance.imageCache.clearLiveImages();
    }
  }

  @override
  void didHaveMemoryPressure() {
    super.didHaveMemoryPressure();
    // Clear caches when OS signals low memory
    PaintingBinding.instance.imageCache.clear();
    PaintingBinding.instance.imageCache.clearLiveImages();
  }

  @override
  Widget build(BuildContext context) {
    // Build correct SavvyTheme per mode from the advanced fluid TokenService
    // Both satisfy WCAG AA 4.5:1 contrast ratio (textPrimary on bgPrimary).
    final lightTheme = SavvyTheme.loadFromTokens(isDark: false);
    final darkTheme = SavvyTheme.loadFromTokens(isDark: true);

    return BlocProvider<ThemeCubit>.value(
      value: GetIt.I<ThemeCubit>(),
      child: BlocBuilder<ThemeCubit, ThemeMode>(
        builder: (context, themeMode) {
          return MaterialApp.router(
            title: 'Savvy POS',
            routerConfig: AppRouter.router,
            // ── Instant theme switching — no AnimatedTheme lag ───────────
            themeMode: themeMode,
            theme: _buildMaterialTheme(lightTheme),
            darkTheme: _buildMaterialTheme(darkTheme),
            builder: (context, child) {
              return MultiBlocProvider(
                providers: [
                  BlocProvider.value(value: GetIt.I<AuthBloc>()),
                  BlocProvider.value(
                      value: GetIt.I<ShiftBloc>()
                        ..add(const ShiftEvent.checkStatus())),
                  BlocProvider(create: (_) => GetIt.I<CartBloc>()),
                ],
                child: child!,
              );
            },
          );
        },
      ),
    );
  }

  ThemeData _buildMaterialTheme(SavvyTheme savvyTheme) {
    return ThemeData(
      extensions: [savvyTheme],
      pageTransitionsTheme: const PageTransitionsTheme(
        builders: {
          TargetPlatform.android: ZoomPageTransitionsBuilder(),
          TargetPlatform.iOS: ZoomPageTransitionsBuilder(),
        },
      ),
      scaffoldBackgroundColor: savvyTheme.colors.bgPrimary,
      navigationRailTheme: NavigationRailThemeData(
        backgroundColor: savvyTheme.colors.bgPrimary,
        selectedIconTheme:
            IconThemeData(color: savvyTheme.colors.brandPrimary, size: 28),
        unselectedIconTheme:
            IconThemeData(color: savvyTheme.colors.textMuted, size: 24),
        selectedLabelTextStyle: TextStyle(
            color: savvyTheme.colors.brandPrimary, fontWeight: FontWeight.bold),
        unselectedLabelTextStyle: TextStyle(color: savvyTheme.colors.textMuted),
        useIndicator: true,
        indicatorColor: savvyTheme.colors.brandPrimary.withValues(alpha: 0.1),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: savvyTheme.colors.bgElevated,
        selectedItemColor: savvyTheme.colors.brandPrimary,
        unselectedItemColor: savvyTheme.colors.textMuted,
        elevation: 8,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
