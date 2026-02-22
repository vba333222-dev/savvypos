import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:savvy_pos/core/config/theme/savvy_theme.dart';
import 'package:savvy_pos/core/presentation/widgets/savvy_text.dart';

class GlobalLoadingOverlay extends StatelessWidget {
  final Widget child;
  final bool isLoading;
  final String message;

  const GlobalLoadingOverlay({
    super.key,
    required this.child,
    required this.isLoading,
    this.message = 'Processing...',
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        if (isLoading)
          Container(
            color: Colors.black.withValues(alpha: 0.5),
            child: Center(
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
                decoration: BoxDecoration(
                    color: context.savvy.colors.bgSurface,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withValues(alpha: 0.2),
                          blurRadius: 20)
                    ]),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const CircularProgressIndicator(),
                    const SizedBox(height: 16),
                    SavvyText.h4(message),
                  ],
                ),
              ).animate().scale(duration: 300.ms, curve: Curves.easeOutBack),
            ),
          ).animate().fadeIn(duration: 200.ms),
      ],
    );
  }
}
