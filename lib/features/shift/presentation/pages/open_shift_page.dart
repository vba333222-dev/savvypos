import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:savvy_pos/core/config/theme_config.dart';
import 'package:savvy_pos/core/presentation/widgets/savvy_widgets.dart';
import 'package:savvy_pos/features/pos/presentation/pages/product_grid_page.dart';
import 'package:savvy_pos/features/pos/presentation/pages/product_grid_page.dart';
import 'package:savvy_pos/features/shift/presentation/bloc/shift_bloc.dart';
import 'package:savvy_pos/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OpenShiftPage extends StatefulWidget {
  const OpenShiftPage({super.key});

  @override
  State<OpenShiftPage> createState() => _OpenShiftPageState();
}

class _OpenShiftPageState extends State<OpenShiftPage> {
  final TextEditingController _cashCtrl = TextEditingController();
  bool _isLoading = false;

  void _openShift() {
    final startCash = double.tryParse(_cashCtrl.text);
    if (startCash == null) return;
    
    final authState = context.read<AuthBloc>().state;
    final userId = authState.employee?.uuid ?? 'UNKNOWN';
    final userName = authState.employee?.fullName ?? 'Unknown';

    context.read<ShiftBloc>().add(ShiftEvent.openShift(startCash, userId, userName));
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
               Icon(Icons.lock_open, size: 60, color: theme.colors.brandPrimary),
               SizedBox(height: theme.shapes.spacingMd),
               SavvyText("Open Shift", style: SavvyTextStyle.h2),
               SizedBox(height: theme.shapes.spacingLg),
               
               TextField(
                 controller: _cashCtrl,
                 keyboardType: TextInputType.number,
                 decoration: InputDecoration(
                   labelText: 'Starting Cash Amount',
                   border: OutlineInputBorder(borderRadius: BorderRadius.circular(theme.shapes.radiusMd)),
                   prefixText: '\$ ',
                 ),
               ),
               
               SizedBox(height: theme.shapes.spacingLg),
               
               SizedBox(
                 width: double.infinity,
                 height: 50,
                 child: ElevatedButton(
                   onPressed: _isLoading ? null : _openShift,
                   style: ElevatedButton.styleFrom(
                     backgroundColor: theme.colors.brandPrimary,
                     foregroundColor: theme.colors.textInverse,
                   ),
                    child: const Text("Start Shift"),
                 ),
               )
            ],
          ),
        ),
      ),
    );
  }
}
