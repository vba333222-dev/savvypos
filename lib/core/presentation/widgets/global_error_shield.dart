import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:savvy_pos/core/config/theme/savvy_theme.dart';
import 'package:savvy_pos/core/presentation/widgets/savvy_text.dart';
import 'package:savvy_pos/core/presentation/widgets/savvy_box.dart';

class GlobalErrorShield extends StatelessWidget {
  final FlutterErrorDetails details;
  final VoidCallback? onReset;

  const GlobalErrorShield({
    super.key,
    required this.details,
    this.onReset,
  });

  @override
  Widget build(BuildContext context) {
    // Attempt to access theme, fallback to basic if theme context is broken
    SavvyTheme? theme;
    try {
      theme = context.savvy;
    } catch (_) {}

    final bgColor = theme?.colors.bgPrimary ?? Colors.white;
    final textColor = theme?.colors.textPrimary ?? Colors.black;
    final errorColor = theme?.colors.stateError ?? Colors.red;

    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        backgroundColor: bgColor,
        body: Center(
          child: Container(
            padding: const EdgeInsets.all(24),
            constraints: const BoxConstraints(maxWidth: 500),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.monitor_heart_outlined, size: 80, color: errorColor)
                    .animate(onPlay: (c) => c.loop(reverse: true))
                    .scale(begin: const Offset(1, 1), end: const Offset(1.1, 1.1), duration: 1.seconds),
                const SizedBox(height: 24),
                
                SavvyText(
                  "System Anomaly Detected",
                  style: SavvyTextStyle.h2,
                  color: textColor,
                  align: TextAlign.center,
                  textStyle: const TextStyle(fontWeight: FontWeight.w900, decoration: TextDecoration.none),
                ),
                const SizedBox(height: 12),
                
                SavvyText(
                  "Our rendering core encountered an unexpected state. This has been logged for immediate analysis.",
                  style: SavvyTextStyle.bodyMedium,
                  color: theme?.colors.textSecondary ?? Colors.grey,
                  align: TextAlign.center,
                  textStyle: const TextStyle(decoration: TextDecoration.none),
                ),
                
                const SizedBox(height: 32),
                
                ElevatedButton.icon(
                  onPressed: onReset ?? () {
                    // Default action
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: errorColor,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  icon: const Icon(Icons.restart_alt),
                  label: const Text("Perform System Restore", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                ).animate().shimmer(delay: 2.seconds, duration: 1.seconds),
                
                if (details.exceptionAsString().isNotEmpty) ...[
                  const SizedBox(height: 48),
                  SavvyBox(
                    color: theme?.colors.bgElevated ?? Colors.grey.shade100,
                    padding: const EdgeInsets.all(16),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: theme?.colors.borderDefault ?? Colors.grey.shade300),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        SavvyText('Technical Diagnostics', style: SavvyTextStyle.labelMedium, color: theme?.colors.textMuted),
                        const SizedBox(height: 8),
                         Text(
                          details.exceptionAsString(),
                          maxLines: 4,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontFamily: 'monospace',
                            fontSize: 11,
                            color: theme?.colors.textSecondary ?? Colors.black87,
                            decoration: TextDecoration.none,
                          ),
                        ),
                      ],
                    ),
                  ),
                ]
              ],
            ),
          ),
        ),
      ),
    );
  }
}
