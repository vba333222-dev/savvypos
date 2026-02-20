import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:savvy_pos/core/config/theme/savvy_theme.dart';
import 'package:savvy_pos/core/presentation/widgets/savvy_widgets.dart';
import 'package:savvy_pos/core/security/roles.dart';
import 'package:savvy_pos/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:savvy_pos/features/auth/presentation/widgets/supervisor_pin_dialog.dart';

class AccessControlWrapper extends StatefulWidget {
  final Widget child;
  final bool Function(UserRole) permissionCheck;
  final String restrictedMessage;

  const AccessControlWrapper({
    super.key,
    required this.child,
    required this.permissionCheck,
    this.restrictedMessage = 'You do not have permission to access this feature.',
  });

  @override
  State<AccessControlWrapper> createState() => _AccessControlWrapperState();
}

class _AccessControlWrapperState extends State<AccessControlWrapper> {
  bool _isOverrideActive = false;

  @override
  Widget build(BuildContext context) {
    if (_isOverrideActive) {
      return widget.child;
    }

    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        final employee = state.employee;
        UserRole role = UserRole.unknown;
        
        if (employee != null) {
          role = UserRole.fromString(employee.role);
        }

        if (widget.permissionCheck(role)) {
           return widget.child;
        }

        // Locked Access View
        return Center(
          child: Container(
             padding: const EdgeInsets.all(32),
             constraints: const BoxConstraints(maxWidth: 400),
             child: Column(
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 Icon(Icons.lock_outline, size: 64, color: context.savvy.colors.textDisabled),
                 const SizedBox(height: 16),
                 const SavvyText.h3('Restricted Access'),
                 const SizedBox(height: 8),
                 SavvyText.body(widget.restrictedMessage),
                 const SizedBox(height: 32),
                 SavvyButton(
                   text: 'MANAGER OVERRIDE',
                   style: SavvyButtonStyle.outline,
                   icon: Icons.vpn_key,
                   onPressed: () async {
                      final approved = await SupervisorPinDialog.show(context);
                      if (approved) {
                        setState(() => _isOverrideActive = true);
                      }
                   },
                 )
               ],
             ),
          ),
        );
      },
    );
  }
}
