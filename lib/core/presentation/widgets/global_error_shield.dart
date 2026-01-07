import 'package:flutter/material.dart';
import 'package:savvy_pos/core/config/theme/savvy_theme.dart';

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

    final bgColor = theme?.colors.bgBase ?? Colors.white;
    final textColor = theme?.colors.textPrimary ?? Colors.black;
    final errorColor = theme?.colors.stateError ?? Colors.red;

    return Container(
      color: bgColor,
      padding: const EdgeInsets.all(24),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.face_retouching_natural, size: 64, color: errorColor), // Confused robot-ish
            const SizedBox(height: 16),
            Text(
              "System Component Malfunction",
              style: TextStyle(
                color: textColor,
                fontSize: 18,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.none,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              "A rendering module has encountered an unexpected anomaly.",
              style: TextStyle(
                color: textColor.withOpacity(0.7),
                fontSize: 14,
                decoration: TextDecoration.none,
                fontWeight: FontWeight.normal,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: onReset ?? () {
                // Default reload action (often just rebuilds the widget if handled higher up)
                // In a global handler, this might need to trigger a full app reload or nav pop
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: errorColor,
                foregroundColor: Colors.white,
              ),
              icon: const Icon(Icons.refresh),
              label: const Text("Attempt System Restore"),
            ),
            if (details.exceptionAsString().isNotEmpty) ...[
              const SizedBox(height: 24),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  details.exceptionAsString(),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontFamily: 'monospace',
                    fontSize: 10,
                    color: Colors.black87,
                    decoration: TextDecoration.none,
                  ),
                ),
              ),
            ]
          ],
        ),
      ),
    );
  }
}
