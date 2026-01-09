import 'package:flutter/material.dart';
import 'package:savvy_pos/core/config/theme/savvy_theme.dart';
import 'package:savvy_pos/core/presentation/widgets/savvy_box.dart';
import 'package:savvy_pos/core/presentation/widgets/savvy_text.dart';

class OutletSwitcherPill extends StatelessWidget {
  final String outletName;
  final String warehouseName;
  final bool isOnline;
  final VoidCallback onTap;

  const OutletSwitcherPill({
    super.key,
    required this.outletName,
    required this.warehouseName,
    required this.onTap,
    this.isOnline = true,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SavvyBox(
        color: context.savvy.colors.bgSurface,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: context.savvy.colors.border),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Live Status Dot
            Container(
              width: 8,
              height: 8,
              decoration: BoxDecoration(
                color: isOnline ? context.savvy.colors.success : context.savvy.colors.textDisabled,
                shape: BoxShape.circle,
              ),
            ),
            const SizedBox(width: 8),
            
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                SavvyText.label(outletName, size: 10, color: context.savvy.colors.textSecondary),
                SavvyText.body(warehouseName, size: 12, weight: FontWeight.w600),
              ],
            ),
            
            const SizedBox(width: 8),
            Icon(Icons.keyboard_arrow_down, size: 16, color: context.savvy.colors.textSecondary),
          ],
        ),
      ),
    );
  }
}
