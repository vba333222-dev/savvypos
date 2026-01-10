import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:savvy_pos/core/config/theme/savvy_theme.dart';
import 'package:savvy_pos/core/database/database.dart';
import 'package:savvy_pos/core/presentation/widgets/savvy_widgets.dart';
import 'package:savvy_pos/features/auth/domain/enums/user_role.dart';

class SupervisorAuthDialog extends StatefulWidget {
  final String title;
  final String reason;

  const SupervisorAuthDialog({
    super.key,
    this.title = 'Manager Approval Required',
    this.reason = 'This action requires supervisor privileges.',
  });

  static Future<bool> show(BuildContext context) async {
    final result = await showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (context) => const SupervisorAuthDialog(),
    );
    return result ?? false;
  }

  @override
  State<SupervisorAuthDialog> createState() => _SupervisorAuthDialogState();
}

class _SupervisorAuthDialogState extends State<SupervisorAuthDialog> {
  final TextEditingController _pinController = TextEditingController();
  bool _isLoading = false;
  String? _error;

  @override
  void dispose() {
    _pinController.dispose();
    super.dispose();
  }

  Future<void> _verifyPin() async {
    setState(() {
      _isLoading = true;
      _error = null;
    });

    final pin = _pinController.text;
    if (pin.isEmpty) {
      setState(() {
        _isLoading = false;
        _error = 'Please enter PIN';
      });
      return;
    }

    try {
      // In a real implementation, we should use a proper Repository or UseCase.
      // For speed in this prototype, we'll access DB directly via GetIt to check generic credentials.
      // Security Note: In production, verify against hashed PINs securely.
      final db = GetIt.I<AppDatabase>();
      
      final employee = await (db.select(db.employeeTable)
        ..where((t) => t.pin.equals(pin)))
        .getSingleOrNull();

      if (employee != null) {
        final role = UserRole.fromString(employee.role);
        if (RolePermissions.canPerformManagerOverride(role)) {
          // Success
          if (mounted) Navigator.pop(context, true);
        } else {
          setState(() {
             _isLoading = false;
             _error = 'Insufficient Privileges';
          });
        }
      } else {
         setState(() {
            _isLoading = false;
            _error = 'Invalid PIN';
         });
      }
    } catch (e) {
      setState(() {
        _isLoading = false;
        _error = 'Error verifying PIN';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: context.savvy.colors.bgSurface,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Container(
        width: 400,
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.security, size: 48, color: Colors.orange),
            const SizedBox(height: 16),
            SavvyText.h3(widget.title),
            const SizedBox(height: 8),
            SavvyText.body(widget.reason, align: TextAlign.center, color: context.savvy.colors.textSecondary),
            const SizedBox(height: 24),
            
            SavvyTextField(
               controller: _pinController,
               hintText: 'Enter Supervisor PIN',
               obscureText: true,
               keyboardType: TextInputType.number,
               maxLength: 6,
               autoFocus: true,
            ),
            
            if (_error != null)
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: SavvyText.label(_error!, color: Colors.red),
              ),

            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SavvyButton(
                  text: 'CANCEL',
                  style: SavvyButtonStyle.ghost,
                  onPressed: () => Navigator.pop(context, false),
                ),
                const SizedBox(width: 16),
                SavvyButton(
                  text: _isLoading ? 'VERIFYING...' : 'AUTHORIZE',
                  style: SavvyButtonStyle.primary,
                  onPressed: _isLoading ? null : _verifyPin,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
