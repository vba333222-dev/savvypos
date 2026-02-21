import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart'; 
import 'package:savvy_pos/core/config/app_config.dart';
import 'package:savvy_pos/core/config/token_service.dart';
import 'package:savvy_pos/core/database/database.dart'; 
import 'package:savvy_pos/core/presentation/widgets/global_error_shield.dart';
import 'package:savvy_pos/main.dart'; 
import 'package:savvy_pos/core/di/injection.dart'; 

// Main Bootstrap Function
Future<void> bootstrap(AppConfig config) async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // ==========================================
  // ZERO SILENT CRASHES: Global Error Catcher
  // ==========================================

  // 1. Flutter UI (Synchronous) Errors
  FlutterError.onError = (FlutterErrorDetails details) {
    if (config.enableLogs) {
      Logger().e('Flutter UI Error', error: details.exception, stackTrace: details.stack);
    }
    // Present error using our GlobalErrorShield
    FlutterError.presentError(details);
  };

  // 2. Headless/Isolate (Asynchronous) Errors
  PlatformDispatcher.instance.onError = (Object error, StackTrace stack) {
    if (config.enableLogs) {
      Logger().f('Fatal Async Error Caught', error: error, stackTrace: stack);
    }
    
    // PREVENT DRIFT CORRUPTION: Gracefully close database if app crashes fatally
    try {
      if (GetIt.I.isRegistered<AppDatabase>()) {
        final db = GetIt.I<AppDatabase>();
        db.close();
        if (config.enableLogs) Logger().i('Bootstrap: AppDatabase safely closed on fatal crash.');
      }
    } catch (e) {
      // Suppress error if already closing
    }
    
    // Return true to indicate the error has been handled.
    // This prevents the app from silently force-closing in production.
    return true; 
  };

  // 3. Fallback UI Widget (Grey Screen of Death Prevention)
  ErrorWidget.builder = (FlutterErrorDetails details) {
    return GlobalErrorShield(details: details);
  };

  // Register Config immediately
  if (!GetIt.I.isRegistered<AppConfig>()) {
    GetIt.I.registerSingleton<AppConfig>(config);
  }

  // Initialize DI / Services
  await GetIt.I.registerSingleton<TokenService>(TokenService()).loadTokens();
  
  // Configure DI
  await configureDependencies(config.flavor.name); 

  // Run the Application
  runApp(config.userApp?.call() ?? const App());
}