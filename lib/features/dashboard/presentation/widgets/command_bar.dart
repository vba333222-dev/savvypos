import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:savvy_pos/core/config/theme/savvy_theme.dart';

class CommandBar extends StatelessWidget {
  const CommandBar({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.savvy;

    return ClipRRect(
      borderRadius: BorderRadius.circular(theme.shapes.radiusPill),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          decoration: BoxDecoration(
            color: Colors.black87, // Dark command bar regardless of theme usually looks cool
            borderRadius: BorderRadius.circular(theme.shapes.radiusPill),
            border: Border.all(color: Colors.white24),
            boxShadow: [
               BoxShadow(color: Colors.black45, blurRadius: 20, spreadRadius: 0, offset: Offset(0, 10))
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
               _CmdAction(icon: Icons.lock, label: 'Lock POS', onTap: () {
                 HapticFeedback.lightImpact();
                 ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('POS Terminals Locked')));
               }),
               _Divider(),
               _CmdAction(icon: Icons.campaign, label: 'Broadcast', onTap: () {
                 HapticFeedback.lightImpact();
                 ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Message Broadcasted')));
               }),
               _Divider(),
               _CmdAction(icon: Icons.sync, label: 'Flush', onTap: () {
                 HapticFeedback.heavyImpact();
                 // Trigger sync logic
                 ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Cache Flushed')));
               }),
            ],
          ),
        ),
      ),
    );
  }
}

class _CmdAction extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _CmdAction({required this.icon, required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          children: [
            Icon(icon, color: Colors.white, size: 18),
            SizedBox(width: 8),
            Text(label, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w500)),
          ],
        ),
      ),
    );
  }
}

class _Divider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1,
      height: 20,
      color: Colors.white24,
    );
  }
}
