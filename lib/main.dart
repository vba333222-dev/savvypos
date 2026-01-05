import 'package:flutter/material.dart';
import 'package:savvy_pos/bootstrap.dart';
import 'package:savvy_pos/core/config/theme_config.dart';
import 'package:savvy_pos/core/sync/sync_worker.dart';
import 'package:savvy_pos/features/pos/presentation/pages/pos_page.dart';
import 'package:workmanager/workmanager.dart';

void main() async {
  // Ensure binding
  WidgetsFlutterBinding.ensureInitialized();
  
  // Init Workmanager
  await Workmanager().initialize(
    callbackDispatcher, // The top level function, aka callbackDispatcher
    isInDebugMode: true // If enabled it will post a notification whenever the task is running. Handy for debugging tasks
  );
  
  // Register Periodic Task
  await Workmanager().registerPeriodicTask(
    "1",
    "fiveMinuteSync",
    frequency: const Duration(minutes: 15), // Minimum interval on Android
  );

  bootstrap(() => const App());
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
      home: const PosPage(),
    );
  }
}
