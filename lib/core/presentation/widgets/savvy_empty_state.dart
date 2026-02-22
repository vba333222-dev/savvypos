import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:savvy_pos/core/config/theme/savvy_theme.dart';

class SavvyEmptyState extends StatelessWidget {
  final IconData icon;
  final String title;
  final String message;
  final String? actionLabel;
  final VoidCallback? onAction;

  const SavvyEmptyState({
    super.key,
    required this.icon,
    required this.title,
    required this.message,
    this.actionLabel,
    this.onAction,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.savvy;

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Floating Icon
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: theme.colors.bgElevated,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: theme.colors.bgInverse.withValues(alpha: 0.05),
                    blurRadius: 20,
                    spreadRadius: 5,
                    offset: const Offset(0, 10),
                  )
                ],
              ),
              child: Icon(icon, size: 64, color: theme.colors.textMuted),
            )
                .animate(
                    onPlay: (controller) => controller.repeat(reverse: true))
                .moveY(
                    begin: 0,
                    end: -10,
                    duration: 2000.ms,
                    curve: Curves.easeInOut), // Bobbing effect

            const SizedBox(height: 24),

            Text(
              title,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: theme.colors.textPrimary,
              ),
              textAlign: TextAlign.center,
            ).animate().fadeIn(duration: 600.ms).slideY(begin: 0.2, end: 0),

            const SizedBox(height: 8),

            Text(
              message,
              style: TextStyle(
                fontSize: 14,
                color: theme.colors.textSecondary,
                height: 1.5,
              ),
              textAlign: TextAlign.center,
            ).animate().fadeIn(delay: 200.ms, duration: 600.ms),

            if (actionLabel != null && onAction != null) ...[
              const SizedBox(height: 32),
              ElevatedButton.icon(
                onPressed: onAction,
                icon: const Icon(Icons
                    .refresh), // Generic icon, user can customize if needed
                label: Text(actionLabel!),
                style: ElevatedButton.styleFrom(
                  backgroundColor: theme.colors.brandPrimary,
                  foregroundColor: theme.colors.textInverse,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                ),
              ).animate().scale(
                  delay: 400.ms, duration: 400.ms, curve: Curves.elasticOut),
            ]
          ],
        ),
      ),
    );
  }
}
