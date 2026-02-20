import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:intl/intl.dart';
import 'package:savvy_pos/core/config/theme/savvy_theme.dart';
import 'package:savvy_pos/features/customers/domain/entities/customer_profile.dart';

class RolodexCard extends StatefulWidget {
  final CustomerProfile customer;
  final VoidCallback onTap;
  
  const RolodexCard({
    super.key,
    required this.customer,
    required this.onTap,
  });

  @override
  State<RolodexCard> createState() => _RolodexCardState();
}

class _RolodexCardState extends State<RolodexCard> with SingleTickerProviderStateMixin {
  late AnimationController _flipCtrl;
  late Animation<double> _flipAnim;
  bool _isFront = true;

  @override
  void initState() {
    super.initState();
    _flipCtrl = AnimationController(vsync: this, duration: const Duration(milliseconds: 600));
    _flipAnim = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _flipCtrl, curve: Curves.easeInOutBack),
    );
  }

  @override
  void dispose() {
    _flipCtrl.dispose();
    super.dispose();
  }

  void _toggleFlip() {
    HapticFeedback.selectionClick();
    if (_isFront) {
      _flipCtrl.forward();
    } else {
      _flipCtrl.reverse();
    }
    setState(() => _isFront = !_isFront);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _toggleFlip,
      child: AnimatedBuilder(
        animation: _flipAnim,
        builder: (context, child) {
          final angle = _flipAnim.value * pi; // 0 to 180 degrees
          
          // Is the front face currently visible? (0-90 degrees)
          final isFrontVisible = angle < pi / 2;

          return Transform(
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.001) // Perspective
              ..rotateY(angle),
            alignment: Alignment.center,
            child: isFrontVisible
                ? _FrontFace(customer: widget.customer)
                : Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.identity()..rotateY(pi), // Mirror back so text is readable
                    child: _BackFace(customer: widget.customer),
                  ),
          );
        },
      ),
    );
  }
}

class _FrontFace extends StatelessWidget {
  final CustomerProfile customer;
  const _FrontFace({required this.customer});

  @override
  Widget build(BuildContext context) {
    final theme = context.savvy;
    final points = customer.totalSpent.toInt();
    
    // Tier Colors
    Color tierColor;
    if (points > 500) {
      tierColor = const Color(0xFFFFD700); // Gold
    } else if (points > 100) {
      tierColor = const Color(0xFFC0C0C0); // Silver
    } else {
      tierColor = const Color(0xFFCD7F32); // Bronze
    }

    return Container(
      height: 110,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: theme.colors.bgElevated,
        borderRadius: BorderRadius.circular(theme.shapes.radiusLg),
        border: Border.all(color: theme.colors.borderDefault),
        boxShadow: theme.elevations.sm,
      ),
      child: Row(
        children: [
          // LOYALTY ORB
          Container(
            width: 60, height: 60,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: [tierColor.withValues(alpha: 0.20), tierColor.withValues(alpha: 0.78)], // alpha 0-255 roughly
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              boxShadow: [
                BoxShadow(color: tierColor.withValues(alpha: 0.39), blurRadius: 10, spreadRadius: 2),
              ],
            ),
            alignment: Alignment.center,
            child: Text(
              '$points',
              style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 16),
            ),
          ).animate(onPlay: (c) => c.repeat(reverse: true))
           .scale(begin: const Offset(1, 1), end: const Offset(1.1, 1.1), duration: 2.seconds),
          
          const SizedBox(width: 16),
          
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(customer.name, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: theme.colors.textPrimary)),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Icon(Icons.calendar_today, size: 12, color: theme.colors.textMuted),
                    const SizedBox(width: 4),
                    Text(
                      customer.lastVisit != null 
                         ? 'Last seen: ${DateFormat('MMM dd').format(customer.lastVisit!)}'
                         : 'New Customer',
                      style: TextStyle(color: theme.colors.textSecondary, fontSize: 12),
                    ),
                  ],
                ),
              ],
            ),
          ),
          
          Icon(Icons.touch_app, color: theme.colors.textMuted.withValues(alpha: 0.20)),
        ],
      ),
    );
  }
}

class _BackFace extends StatelessWidget {
  final CustomerProfile customer;
  const _BackFace({required this.customer});

  @override
  Widget build(BuildContext context) {
    final theme = context.savvy;
    return Container(
      height: 110,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF2C3E50), // Slate/Dark backside
        borderRadius: BorderRadius.circular(theme.shapes.radiusLg),
        boxShadow: theme.elevations.sm,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _ActionButton(icon: Icons.call, color: Colors.green, label: 'Call', onTap: (){}),
          _ActionButton(icon: Icons.message, color: Colors.teal, label: 'Msg', onTap: (){}),
          _ActionButton(icon: Icons.history, color: Colors.blueAccent, label: 'Order', onTap: (){}),
        ],
      ),
    );
  }
}

class _ActionButton extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String label;
  final VoidCallback onTap;

  const _ActionButton({required this.icon, required this.color, required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        InkWell(
          onTap: () {
            HapticFeedback.heavyImpact();
            onTap();
          },
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(color: color.withValues(alpha: 0.20), shape: BoxShape.circle),
            child: Icon(icon, color: color, size: 24),
          ),
        ),
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(color: Colors.white70, fontSize: 10)),
      ],
    );
  }
}
