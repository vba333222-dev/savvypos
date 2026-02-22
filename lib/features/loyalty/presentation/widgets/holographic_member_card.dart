import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:savvy_pos/core/presentation/widgets/savvy_text.dart';

enum LoyaltyTier { bronze, silver, gold }

class HolographicMemberCard extends StatefulWidget {
  final String memberName;
  final int points;
  final int nextTierThreshold;
  final LoyaltyTier tier;

  const HolographicMemberCard({
    super.key,
    required this.memberName,
    required this.points,
    required this.nextTierThreshold,
    required this.tier,
  });

  @override
  State<HolographicMemberCard> createState() => _HolographicMemberCardState();
}

class _HolographicMemberCardState extends State<HolographicMemberCard>
    with SingleTickerProviderStateMixin {
  // Parallax Values
  double _rotationX = 0;
  double _rotationY = 0;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onHover: (event) {
        final dx = event.localPosition.dx - 150; // Half width
        final dy = event.localPosition.dy - 90; // Half height
        setState(() {
          _rotationY = -dx * 0.001;
          _rotationX = dy * 0.001;
        });
      },
      onExit: (_) => setState(() {
        _rotationX = 0;
        _rotationY = 0;
      }),
      child: Transform(
        transform: Matrix4.identity()
          ..setEntry(3, 2, 0.001) // Perspective
          ..rotateX(_rotationX)
          ..rotateY(_rotationY),
        alignment: Alignment.center,
        child: Container(
          width: 300,
          height: 180,
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: _getGradient(widget.tier),
            boxShadow: [
              BoxShadow(
                color: _getShadowColor(widget.tier).withValues(alpha: 0.4),
                blurRadius: 20,
                offset: const Offset(0, 10),
              )
            ],
            border: Border.all(
                color: Colors.white.withValues(alpha: 0.3), width: 1),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SavvyText.h3('SAVVY MEMBER',
                      color: Colors.white.withValues(alpha: 0.9)),
                  Icon(Icons.nfc, color: Colors.white.withValues(alpha: 0.6)),
                ],
              ),
              const Spacer(),
              SavvyText.h2(widget.memberName.toUpperCase(),
                  color: Colors.white),
              const SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(4),
                      child: LinearProgressIndicator(
                        value: widget.points / widget.nextTierThreshold,
                        backgroundColor: Colors.black.withValues(alpha: 0.2),
                        valueColor: const AlwaysStoppedAnimation(Colors.white),
                        minHeight: 6,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  SavvyText.label(
                      '${widget.points} / ${widget.nextTierThreshold} XP',
                      color: Colors.white),
                ],
              ),
              const SizedBox(height: 4),
              SavvyText.label(widget.tier.name.toUpperCase(),
                  color: Colors.white.withValues(alpha: 0.8)),
            ],
          ),
        ).animate(onPlay: (c) => c.repeat(reverse: true)).shimmer(
            duration: 3.seconds, color: Colors.white.withValues(alpha: 0.1)),
      ),
    );
  }

  LinearGradient _getGradient(LoyaltyTier tier) {
    switch (tier) {
      case LoyaltyTier.gold:
        return const LinearGradient(
          colors: [Color(0xFFFFD700), Color(0xFFB8860B)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        );
      case LoyaltyTier.silver:
        return const LinearGradient(
          colors: [Color(0xFFC0C0C0), Color(0xFF708090)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        );
      case LoyaltyTier.bronze:
        return const LinearGradient(
          colors: [Color(0xFFCD7F32), Color(0xFF8B4513)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        );
    }
  }

  Color _getShadowColor(LoyaltyTier tier) {
    switch (tier) {
      case LoyaltyTier.gold:
        return Colors.amber;
      case LoyaltyTier.silver:
        return Colors.blueGrey;
      default:
        return Colors.brown;
    }
  }
}
