import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart'; // Added Logger import
import 'package:savvy_pos/core/config/app_config.dart';
import 'package:savvy_pos/core/config/theme_config.dart'; // Ensure correct import
import 'package:savvy_pos/core/config/token_service.dart';
import 'package:savvy_pos/core/database/database.dart'; // Fix db import if needed
import 'package:savvy_pos/core/presentation/widgets/global_error_shield.dart';
import 'package:savvy_pos/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:savvy_pos/features/pos/presentation/bloc/cart/cart_bloc.dart';
import 'package:savvy_pos/features/shift/presentation/bloc/shift_bloc.dart';
import 'package:savvy_pos/main.dart'; // Import App widget
import 'package:workmanager/workmanager.dart';
// import 'package:savvy_pos/injection.dart'; // Assume DI setup is here or manually done

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
    // await configureDependencies(config.flavor.name); 

    runApp(const App());
    
  }, (error, stack) {
     if (config.enableLogs) Logger().e('Zoned Error', error: error, stackTrace: stack);
  });
}