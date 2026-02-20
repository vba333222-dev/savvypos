import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:savvy_pos/features/analytics/domain/entities/analytics_entities.dart';

class SmartInsightCard extends StatelessWidget {
  final List<MenuPerformance> pmix;

  const SmartInsightCard({super.key, required this.pmix});

  String _generateInsight() {
    if (pmix.isEmpty) return 'Not enough data to generate insights.';

    // Find Stars and Dogs
    final stars = pmix.where((p) => p.category == MenuItemCategory.star).toList();
    final puzzles = pmix.where((p) => p.category == MenuItemCategory.puzzle).toList();
    final dogs = pmix.where((p) => p.category == MenuItemCategory.dog).toList();

    final insights = <String>[];

    if (stars.isNotEmpty) {
      insights.add('🌟 "${stars.first.itemName}" is a Star! Keep it featured.');
    }
    if (puzzles.isNotEmpty) {
      insights.add('💡 Promote "${puzzles.first.itemName}" - High margin, needs more visibility.');
    }
    if (dogs.isNotEmpty) {
      insights.add('⚠️ Consider removing "${dogs.last.itemName}" - Low margin, low volume.');
    }

    return insights.isNotEmpty ? insights.join('\n') : 'Your menu is performing well!';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.deepPurple.shade400, Colors.purple.shade300],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(color: Colors.purple.withValues(alpha: 0.3), blurRadius: 12, offset: const Offset(0, 4)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: const [
              Icon(Icons.auto_awesome, color: Colors.white),
              SizedBox(width: 8),
              Text('AI Menu Insights', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            _generateInsight(),
            style: const TextStyle(color: Colors.white, fontSize: 14, height: 1.5),
          ),
        ],
      ),
    ).animate().shimmer(duration: 2000.ms, color: Colors.white.withValues(alpha: 0.2));
  }
}
