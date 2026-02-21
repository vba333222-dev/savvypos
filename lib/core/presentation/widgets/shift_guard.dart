import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:savvy_pos/features/shifts/presentation/bloc/shift_bloc.dart';
import 'package:savvy_pos/features/shifts/presentation/pages/open_shift_page.dart';

class ShiftGuard extends StatelessWidget {
  final Widget child;

  const ShiftGuard({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShiftBloc, ShiftState>(
      builder: (context, state) {
        return state.when(
          initial: () => const Scaffold(body: Center(child: CircularProgressIndicator())),
          loading: () => const Scaffold(body: Center(child: CircularProgressIndicator())),
          error: (message) => Scaffold(
            body: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.error_outline, size: 48, color: Colors.red),
                  const SizedBox(height: 16),
                  Text('Shift Error: $message'),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () => context.read<ShiftBloc>().add(const ShiftEvent.checkStatus()),
                    child: const Text('Retry'),
                  )
                ],
              ),
            ),
          ),
          closed: () => const OpenShiftPage(),
          open: (shift, payIn, payOut, safeDrops, sales) => child,
          varianceWarning: (variance, actual) => child,
          syncingEod: () => child,
          syncSuccess: () => child,
        );
      },
    );
  }
}
