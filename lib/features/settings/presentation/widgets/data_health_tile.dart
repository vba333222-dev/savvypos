import 'package:flutter/material.dart';
import 'package:savvy_pos/core/config/theme/savvy_theme.dart';

class DataHealthTile extends StatelessWidget {
  const DataHealthTile({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.savvy;
    // Mock Data
    final dbSize = '12.4 MB';
    final pendingSync = 0;
    final isHealthy = pendingSync == 0;

    return Container(
      decoration: BoxDecoration(
        color: theme.colors.bgElevated,
        borderRadius: BorderRadius.circular(theme.shapes.radiusLg),
        border: Border.all(color: theme.colors.borderDefault),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.cloud_sync, color: theme.colors.brandPrimary),
              const SizedBox(width: 8),
              Text('DATA HEALTH',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: theme.colors.textSecondary,
                    letterSpacing: 1.0,
                  )),
            ],
          ),
          const SizedBox(height: 16),
          Expanded(
            child: Row(
              children: [
                // Liquid Gauge Visual
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: isHealthy
                          ? theme.colors.stateSuccess.withValues(alpha: 0.1)
                          : theme.colors.stateWarning.withValues(alpha: 0.1),
                      borderRadius:
                          BorderRadius.circular(theme.shapes.radiusMd),
                      border: Border.all(
                          color: isHealthy
                              ? theme.colors.stateSuccess
                              : theme.colors.stateWarning),
                    ),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        // Imagine an Animated Liquid fill here
                        Icon(
                            isHealthy
                                ? Icons.check_circle_outline
                                : Icons.sync_problem,
                            size: 48,
                            color: isHealthy
                                ? theme.colors.stateSuccess
                                : theme.colors.stateWarning),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(dbSize,
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: theme.colors.textPrimary)),
                    Text('Local DB Size',
                        style: TextStyle(color: theme.colors.textSecondary)),
                    const SizedBox(height: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: isHealthy
                            ? theme.colors.stateSuccess
                            : theme.colors.stateWarning,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        isHealthy ? 'ALL SYNCED' : '$pendingSync PENDING',
                        style: TextStyle(
                            color: theme.colors.textInverse,
                            fontSize: 10,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
