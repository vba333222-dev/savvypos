import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:savvy_pos/core/config/theme/savvy_theme.dart';
import 'package:savvy_pos/core/presentation/widgets/savvy_text.dart';
import 'package:savvy_pos/core/presentation/widgets/savvy_box.dart';
import 'package:savvy_pos/core/presentation/widgets/savvy_slider_button.dart';
import 'package:savvy_pos/features/shifts/presentation/bloc/shift_bloc.dart';
import 'package:savvy_pos/features/auth/presentation/bloc/auth_bloc.dart';

class OpenShiftPage extends StatefulWidget {
  const OpenShiftPage({super.key});

  @override
  State<OpenShiftPage> createState() => _OpenShiftPageState();
}

class _OpenShiftPageState extends State<OpenShiftPage> {
  final TextEditingController _cashCtrl = TextEditingController();

  void _openShift() {
    final startCash = double.tryParse(_cashCtrl.text);
    if (startCash == null) return;

    final authState = context.read<AuthBloc>().state;
    final userId = authState.employee?.uuid ?? 'UNKNOWN';
    final userName = authState.employee?.name ?? 'Unknown';

    context
        .read<ShiftBloc>()
        .add(ShiftEvent.openShift(startCash, userId, userName));
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.savvy;

    return Scaffold(
      backgroundColor: theme.colors.bgPrimary,
      body: Center(
        child: SavvyBox(
          width: 400,
          padding: EdgeInsets.all(theme.shapes.spacingLg),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.lock_open_rounded,
                  size: 60, color: theme.colors.brandPrimary),
              SizedBox(height: theme.shapes.spacingMd),
              SavvyText("Start Operations", style: SavvyTextStyle.h2),
              SavvyText("Confirm opening cash to begin.",
                  style: SavvyTextStyle.labelMedium,
                  color: theme.colors.textSecondary),
              SizedBox(height: theme.shapes.spacingLg),
              TextField(
                controller: _cashCtrl,
                keyboardType: TextInputType.number,
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: theme.colors.textPrimary),
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  hintText: '0.00',
                  prefixText: '\$ ',
                  filled: true,
                  fillColor: theme.colors.bgSurface,
                  border: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(theme.shapes.radiusMd),
                      borderSide: BorderSide.none),
                ),
              ),
              SizedBox(height: theme.shapes.spacingLg),
              SavvySliderButton(
                label: 'SLIDE TO OPEN',
                icon: Icons.storefront,
                onConfirmed: _openShift,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
