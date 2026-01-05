import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:savvy_pos/core/config/theme_config.dart';
import 'package:savvy_pos/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:savvy_pos/features/auth/presentation/widgets/pin_pad_dialog.dart';
import 'package:savvy_pos/features/home/presentation/pages/main_shell_page.dart';

class EmployeeLoginPage extends StatefulWidget {
  const EmployeeLoginPage({Key? key}) : super(key: key);

  @override
  State<EmployeeLoginPage> createState() => _EmployeeLoginPageState();
}

class _EmployeeLoginPageState extends State<EmployeeLoginPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => GetIt.I<AuthBloc>(), // Shared AuthBloc (Singleton/Factory?) - Should be Singleton to hold session
      child: const _LoginView(),
    );
  }
}

class _LoginView extends StatelessWidget {
  const _LoginView();

  @override
  Widget build(BuildContext context) {
    final colors = context.savvy.colors;
    final typography = Theme.of(context).textTheme;

    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state.employee != null) {
          // Success
          Navigator.pushReplacement(
            context, 
            MaterialPageRoute(builder: (_) => const MainShellPage())
          );
        }
        if (state.error != null) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.error!)));
        }
      },
      child: Scaffold(
        backgroundColor: colors.bgPrimary,
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.storefront, size: 80, color: colors.brandPrimary),
              const SizedBox(height: 24),
              Text('Savvy POS', style: typography.displayMedium?.copyWith(color: colors.textPrimary)),
              const SizedBox(height: 8),
              Text('Employee Login', style: typography.titleMedium?.copyWith(color: colors.textSecondary)),
              const SizedBox(height: 48),
              
              SizedBox(
                width: 250,
                child: ElevatedButton.icon(
                  onPressed: () async {
                    final pin = await showDialog<String>(
                      context: context,
                      builder: (_) => const PinPadDialog(isLogin: true),
                    );
                    if (pin != null && context.mounted) {
                      context.read<AuthBloc>().add(AuthEvent.loginWithPin(pin));
                    }
                  },
                  icon: const Icon(Icons.login),
                  label: const Text('Login with PIN'),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    backgroundColor: colors.brandPrimary,
                    foregroundColor: colors.textInverse,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
