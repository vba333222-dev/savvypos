import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart'; // Added Logger import
import 'package:savvy_pos/core/config/app_config.dart';
// Ensure correct import
import 'package:savvy_pos/core/config/token_service.dart';
import 'package:savvy_pos/core/database/database.dart'; // Added AppDatabase import
import 'package:savvy_pos/core/presentation/widgets/global_error_shield.dart';
import 'package:savvy_pos/main.dart'; // Import App widget
import 'package:savvy_pos/core/di/injection.dart'; // Uncommented

// Main Bootstrap Function
Future<void> bootstrap(AppConfig config) async {
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    
    // Register Config immediately
    if (!GetIt.I.isRegistered<AppConfig>()) {
      GetIt.I.registerSingleton<AppConfig>(config);
    }
    
    // Error Shield
    FlutterError.onError = (FlutterErrorDetails details) {
      // In production, send to Crashlytics
      if (config.enableLogs) Logger().e('Flutter Error', error: details.exception, stackTrace: details.stack);
    };

    ErrorWidget.builder = (FlutterErrorDetails details) {
      return GlobalErrorShield(details: details);
    };

    // Init Workmanager
    /* 
    await Workmanager().initialize(
      callbackDispatcher, 
      isInDebugMode: config.isDev
    );
    */

    // Initialize DI / Services
    await GetIt.I.registerSingleton<TokenService>(TokenService()).loadTokens();
    
    // Configure DI (configureDependencies normally called here)
    await configureDependencies(config.flavor.name); 

    runApp(config.userApp?.call() ?? const App());
    
  }, (error, stack) async {
     if (config.enableLogs) Logger().e('Zoned Error', error: error, stackTrace: stack);
     
     // PREVENT DRIFT CORRUPTION: Gracefully close database if app crashes fatally
     try {
       if (GetIt.I.isRegistered<AppDatabase>()) {
         final db = GetIt.I<AppDatabase>();
         await db.close();
         if (config.enableLogs) Logger().i('Bootstrap: AppDatabase safely closed on fatal crash.');
       }
     } catch (e) {
       // Suppress error if already closing
     }
  });
}