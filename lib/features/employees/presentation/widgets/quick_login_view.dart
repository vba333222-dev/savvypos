import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:savvy_pos/core/config/theme/savvy_theme.dart';
import 'package:savvy_pos/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:savvy_pos/features/auth/presentation/widgets/pin_pad_dialog.dart';
// Note: Assuming we have an Employee Entity or similar.
// For now, I'll mock a list of "Recent Users" or fetch from a future EmployeeBloc.
// But requirement says "Fetch & Display: Load all active employees from EmployeeRepository".
// Does EmployeeRepository exist? Previous searches saw `employees/presentation/pages/employee_list_page.dart`.
// I will create a simple mock list here or use a Bloc if available.
// Let's assume we pass in a list of mock users for the UI visualization as requested for "Antigravity".

class QuickLoginView extends StatelessWidget {
  const QuickLoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.savvy;

    // Mock Data for "Sentient Staff"
    final employees = [
      _emp("Admin", "AD", Colors.purple),
      _emp("Manager", "MG", Colors.blue),
      _emp("Chef", "CK", Colors.orange),
      _emp("Server", "SV", Colors.green),
      _emp("Cashier", "CS", Colors.pink),
    ];

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("Who's working?",
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w300,
                color: theme.colors.textPrimary,
                letterSpacing: 1.5,
              )),
          const SizedBox(height: 48),
          Wrap(
            spacing: 32,
            runSpacing: 32,
            alignment: WrapAlignment.center,
            children: employees
                .map((emp) => _AvatarItem(
                      name: emp['name'] as String,
                      initials: emp['initials'] as String,
                      color: emp['color'] as Color,
                      onTap: () => _handleLogin(context, emp),
                    ))
                .toList(),
          ),
        ],
      ),
    );
  }

  void _handleLogin(BuildContext context, Map<String, dynamic> emp) async {
    // Show Glassmorphic PIN Pad
    // Reusing PinPadDialog but ideally it should be nicer.
    final pin = await showDialog<String>(
      context: context,
      barrierColor: Colors.black54, // Or blur
      builder: (_) => const PinPadDialog(isLogin: true),
    );

    if (pin != null && context.mounted) {
      // Pass PIN to AuthBloc
      context.read<AuthBloc>().add(AuthEvent.loginWithPin(pin));
    }
  }

  Map<String, dynamic> _emp(String name, String initials, Color color) {
    return {'name': name, 'initials': initials, 'color': color};
  }
}

class _AvatarItem extends StatelessWidget {
  final String name;
  final String initials;
  final Color color;
  final VoidCallback onTap;

  const _AvatarItem(
      {required this.name,
      required this.initials,
      required this.color,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(100),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.2),
              shape: BoxShape.circle,
              border: Border.all(color: color.withValues(alpha: 0.5), width: 2),
              boxShadow: [
                BoxShadow(
                    color: color.withValues(alpha: 0.3),
                    blurRadius: 15,
                    spreadRadius: 2)
              ],
            ),
            alignment: Alignment.center,
            child: Text(initials,
                style: TextStyle(
                    fontSize: 32, fontWeight: FontWeight.bold, color: color)),
          ),
          const SizedBox(height: 16),
          Text(name,
              style:
                  const TextStyle(fontWeight: FontWeight.w600, fontSize: 16)),
        ],
      ),
    );
  }
}
