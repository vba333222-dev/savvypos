import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:savvy_pos/features/auth/presentation/bloc/auth_bloc.dart';

class AccessControlWidget extends StatelessWidget {
  final String permission;
  final Widget child;
  final Widget? fallback;

  const AccessControlWidget({
    super.key,
    required this.permission,
    required this.child,
    this.fallback,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        final role = state.employee?.role ?? 'CASHIER';

        // Simple Permission Logic (MVP)
        // OWNER: All
        // MANAGER: All except critical system wipes?
        // CASHIER: Sales, No Reports, No Inventory Edit

        bool hasAccess = false;

        if (role == 'OWNER') {
          hasAccess = true;
        } else if (role == 'MANAGER') {
          hasAccess = true;
        } else {
          // CASHIER Restrictions
          if (permission == 'VIEW_REPORTS') {
            hasAccess = false;
          } else if (permission == 'MANAGE_INVENTORY') {
            hasAccess = false;
          } else if (permission == 'MANAGE_SETTINGS') {
            hasAccess = false;
          } else {
            hasAccess = true;
          }
        }

        if (hasAccess) return child;

        return fallback ?? const SizedBox.shrink();
      },
    );
  }
}
