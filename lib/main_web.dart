import 'package:flutter/material.dart';
import 'package:savvy_pos/bootstrap.dart';
import 'package:savvy_pos/core/config/theme_config.dart';
import 'package:savvy_pos/features/admin/presentation/pages/web_admin_shell.dart';
import 'package:savvy_pos/features/employees/presentation/pages/employee_login_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  bootstrap(() => const WebApp(), environment: 'web');
}

class WebApp extends StatelessWidget {
  const WebApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Savvy POS Admin',
      theme: ThemeData(extensions: [SavvyTheme.light()]),
      darkTheme: ThemeData(extensions: [SavvyTheme.dark()]),
      home: const EmployeeLoginPage(
        // On success, navigate to WebAdminShell
        // We might need to modify EmployeeLoginPage to accept a generic 'onSuccess' callback 
        // or handle navigation logic inside it based on platform.
        // For now, let's assume standard routing or that logic is internal.
        // Actually EmployeeLoginPage typically pushes route. 
        // If we want to force Shell, we might need a wrapper or modified logic.
        // For simple start:
      ),
      routes: {
        '/admin': (context) => const WebAdminShell(),
      },
    );
  }
}
