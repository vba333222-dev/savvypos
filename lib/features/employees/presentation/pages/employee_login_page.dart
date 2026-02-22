import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:savvy_pos/core/config/theme/savvy_theme.dart';
import 'package:savvy_pos/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:savvy_pos/features/employees/presentation/widgets/quick_login_view.dart';
import 'package:savvy_pos/features/home/presentation/pages/main_shell_page.dart';

class EmployeeLoginPage extends StatefulWidget {
  const EmployeeLoginPage({super.key});

  @override
  State<EmployeeLoginPage> createState() => _EmployeeLoginPageState();
}

class _EmployeeLoginPageState extends State<EmployeeLoginPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => GetIt.I<AuthBloc>(), // Shared AuthBloc
      child: const _LoginView(),
    );
  }
}

class _LoginView extends StatelessWidget {
  const _LoginView();

  @override
  Widget build(BuildContext context) {
    final theme = context.savvy;

    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state.employee != null) {
          // Success
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (_) => const MainShellPage()));
        }
        if (state.error != null) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(state.error!),
              backgroundColor: theme.colors.stateError));
        }
      },
      child: Scaffold(
        backgroundColor: theme.colors.bgCanvas,
        body: Stack(
          children: [
            // Background branding or gradient
            Positioned.fill(
              child: Opacity(
                opacity: 0.05,
                child: Center(
                    child: Icon(Icons.storefront,
                        size: 400, color: theme.colors.textPrimary)),
              ),
            ),

            // Avatar Grid Login
            const Center(
              child: QuickLoginView(),
            ),
          ],
        ),
      ),
    );
  }
}
