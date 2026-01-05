import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:savvy_pos/core/config/theme_config.dart';
import 'package:savvy_pos/features/shift/presentation/bloc/shift_bloc.dart';

class OpenShiftPage extends StatefulWidget {
  const OpenShiftPage({Key? key}) : super(key: key);

  @override
  State<OpenShiftPage> createState() => _OpenShiftPageState();
}

class _OpenShiftPageState extends State<OpenShiftPage> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final colors = context.savvy.colors;
    final typography = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: colors.bgPrimary,
      body: Center(
        child: Container(
          padding: EdgeInsets.all(context.savvy.shapes.spacingLg),
          constraints: const BoxConstraints(maxWidth: 400),
          decoration: BoxDecoration(
            color: colors.bgElevated,
            borderRadius: BorderRadius.circular(context.savvy.shapes.radiusLg),
            boxShadow: context.savvy.elevations.md,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.lock_open, size: 64, color: colors.brandPrimary),
              const SizedBox(height: 24),
              Text(
                'Open Register',
                style: typography.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              Text(
                'Enter starting cash amount',
                style: typography.bodyMedium?.copyWith(color: colors.textSecondary),
              ),
              const SizedBox(height: 24),
              TextField(
                controller: _controller,
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                decoration: InputDecoration(
                  labelText: 'Start Cash',
                  prefixText: '\$ ',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(context.savvy.shapes.radiusMd),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    final amount = double.tryParse(_controller.text);
                    if (amount != null) {
                      context.read<ShiftBloc>().add(ShiftEvent.openShift(amount));
                    }
                  },
                  child: const Text('Start Shift'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
