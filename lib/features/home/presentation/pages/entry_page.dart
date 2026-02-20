import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get_it/get_it.dart';
import 'package:savvy_pos/core/database/database.dart';
import 'package:savvy_pos/core/hal/printer_router.dart';
import 'package:savvy_pos/core/security/lifecycle_manager.dart';
import 'package:savvy_pos/features/admin/presentation/pages/web_admin_layout.dart';
import 'package:savvy_pos/features/auth/domain/repositories/i_tenant_repository.dart';
import 'package:savvy_pos/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:savvy_pos/features/auth/presentation/pages/onboarding_page.dart';
import 'package:savvy_pos/features/employees/presentation/pages/employee_login_page.dart';

class EntryPage extends StatelessWidget {
  const EntryPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Security Amnesia Wrapper
    return LifecycleManager(
      onLockRequest: () {
        if (context.mounted) {
             GetIt.I<AuthBloc>().add(const AuthEvent.logout());
             ScaffoldMessenger.of(context).showSnackBar(
               const SnackBar(
                 content: Text("Session Locked due to inactivity"), 
                 backgroundColor: Colors.orange
               )
             );
        }
      },
      child: const _EntryContent(),
    );
  }
}

class _EntryContent extends StatelessWidget {
  const _EntryContent();

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
          return const Scaffold(body: Center(child: _SavvySplashLoader()));
        }
        
        final config = snapshot.data?[0] as TenantConfigTableData?;
        if (config == null) {
          return const OnboardingPage();
        } else {
          return const EmployeeLoginPage();
        }
      },
    );
    }
}

class _SavvySplashLoader extends StatelessWidget {
  const _SavvySplashLoader();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.storefront, size: 64, color: Theme.of(context).primaryColor)
          .animate(onPlay: (c) => c.repeat(reverse: true))
          .scale(begin: const Offset(1, 1), end: const Offset(1.2, 1.2), duration: 800.ms)
          .then()
          .tint(color: Colors.purpleAccent, duration: 800.ms)
          .then()
          .tint(color: Theme.of(context).primaryColor, duration: 800.ms),
        const SizedBox(height: 24),
        const Text("Savvy POS", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
        const SizedBox(height: 8),
        const SizedBox(
          width: 120, 
          child: LinearProgressIndicator(minHeight: 2)
        )
      ],
    );
  }
}
