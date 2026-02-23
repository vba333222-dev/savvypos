import 'package:savvy_pos/core/utils/time_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:savvy_pos/core/config/theme_config.dart';
import 'package:savvy_pos/features/pos/domain/entities/split_bill_entities.dart';

/// Premium Split Bill Dialog with animated presets and guest management
class SplitBillDialog extends StatefulWidget {
  final double orderTotal;
  final String orderUuid;
  final String orderNumber;
  final List<SplitBillItem> orderItems;
  final Function(SplitBill) onSplitCreated;

  const SplitBillDialog({
    super.key,
    required this.orderTotal,
    required this.orderUuid,
    required this.orderNumber,
    required this.orderItems,
    required this.onSplitCreated,
  });

  @override
  State<SplitBillDialog> createState() => _SplitBillDialogState();
}

class _SplitBillDialogState extends State<SplitBillDialog> {
  SplitMode _selectedMode = SplitMode.equal;
  int _guestCount = 2;
  final Map<int, double> _customAmounts = {};

  List<double> get _equalSplits {
    if (_guestCount <= 0) return [];
    final base = (widget.orderTotal / _guestCount * 100).floor() / 100;
    final remainder = widget.orderTotal - (base * _guestCount);
    return List.generate(_guestCount, (i) => i == 0 ? base + remainder : base);
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.savvy.colors;
    final shapes = context.savvy.shapes;

    return Dialog(
      backgroundColor: colors.bgElevated,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(shapes.radiusLg),
      ),
      child: Container(
        width: 420,
        constraints: const BoxConstraints(maxHeight: 600),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Header
            _buildHeader(colors, shapes),

            // Content
            Flexible(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Split mode selector
                    _buildModeSelector(colors, shapes),

                    const SizedBox(height: 24),

                    // Guest count selector
                    _buildGuestCounter(colors, shapes),

                    const SizedBox(height: 24),

                    // Split preview
                    _buildSplitPreview(colors, shapes),
                  ],
                ),
              ),
            ),

            // Footer
            _buildFooter(colors, shapes),
          ],
        ),
      ),
    ).animate().fadeIn(duration: 200.ms).scale(
        begin: const Offset(0.95, 0.95),
        duration: 200.ms,
        curve: Curves.easeOutQuad);
  }

  Widget _buildHeader(SavvyColors colors, SavvyShapes shapes) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            colors.brandPrimary,
            colors.brandPrimary.withValues(alpha: 0.8)
          ],
        ),
        borderRadius:
            BorderRadius.vertical(top: Radius.circular(shapes.radiusLg)),
      ),
      child: Row(
        children: [
          Icon(Icons.call_split, color: colors.textInverse, size: 28),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Split Bill',
                  style: TextStyle(
                    color: colors.textInverse,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  'Order #${widget.orderNumber} • \$${widget.orderTotal.toStringAsFixed(2)}',
                  style: TextStyle(
                    color: colors.textInverse.withValues(alpha: 0.8),
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: Icon(Icons.close, color: colors.textInverse),
          ),
        ],
      ),
    );
  }

  Widget _buildModeSelector(SavvyColors colors, SavvyShapes shapes) {
    final modes = [
      (SplitMode.equal, 'Equal Split', Icons.pie_chart),
      (SplitMode.byItem, 'By Item', Icons.list_alt),
      (SplitMode.custom, 'Custom', Icons.edit),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Split Method',
          style: TextStyle(
            color: colors.textSecondary,
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 10),
        Row(
          children: modes.map((m) {
            final isSelected = _selectedMode == m.$1;
            return Expanded(
              child: Padding(
                padding: EdgeInsets.only(right: m != modes.last ? 8 : 0),
                child: GestureDetector(
                  onTap: () {
                    HapticFeedback.selectionClick();
                    setState(() => _selectedMode = m.$1);
                  },
                  child: AnimatedContainer(
                    duration: 200.ms,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    decoration: BoxDecoration(
                      gradient: isSelected
                          ? LinearGradient(
                              colors: [
                                colors.brandPrimary,
                                colors.brandPrimary.withValues(alpha: 0.8)
                              ],
                            )
                          : null,
                      color: isSelected ? null : colors.bgPrimary,
                      borderRadius: BorderRadius.circular(shapes.radiusMd),
                      border: Border.all(
                        color: isSelected
                            ? colors.brandPrimary
                            : colors.borderDefault,
                      ),
                    ),
                    child: Column(
                      children: [
                        Icon(
                          m.$3,
                          color: isSelected
                              ? colors.textInverse
                              : colors.textSecondary,
                          size: 22,
                        ),
                        const SizedBox(height: 6),
                        Text(
                          m.$2,
                          style: TextStyle(
                            color: isSelected
                                ? colors.textInverse
                                : colors.textPrimary,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildGuestCounter(SavvyColors colors, SavvyShapes shapes) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildCounterButton(
          icon: Icons.remove,
          onTap: _guestCount > 2 ? () => setState(() => _guestCount--) : null,
          colors: colors,
          shapes: shapes,
        ),
        const SizedBox(width: 24),
        Column(
          children: [
            Text(
              '$_guestCount',
              style: TextStyle(
                color: colors.textPrimary,
                fontSize: 48,
                fontWeight: FontWeight.w700,
              ),
            )
                .animate(key: ValueKey(_guestCount))
                .scale(begin: const Offset(1.2, 1.2), duration: 150.ms)
                .fadeIn(duration: 150.ms),
            Text(
              'Guests',
              style: TextStyle(
                color: colors.textSecondary,
                fontSize: 14,
              ),
            ),
          ],
        ),
        const SizedBox(width: 24),
        _buildCounterButton(
          icon: Icons.add,
          onTap: _guestCount < 20 ? () => setState(() => _guestCount++) : null,
          colors: colors,
          shapes: shapes,
        ),
      ],
    );
  }

  Widget _buildCounterButton({
    required IconData icon,
    required VoidCallback? onTap,
    required SavvyColors colors,
    required SavvyShapes shapes,
  }) {
    final isEnabled = onTap != null;

    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: 150.ms,
        width: 56,
        height: 56,
        decoration: BoxDecoration(
          color: isEnabled ? colors.brandPrimary : colors.bgPrimary,
          borderRadius: BorderRadius.circular(shapes.radiusMd),
          boxShadow: isEnabled
              ? [
                  BoxShadow(
                      color: colors.brandPrimary.withValues(alpha: 0.3),
                      blurRadius: 12)
                ]
              : null,
        ),
        child: Icon(
          icon,
          color: isEnabled ? colors.textInverse : colors.textSecondary,
          size: 28,
        ),
      ),
    );
  }

  Widget _buildSplitPreview(SavvyColors colors, SavvyShapes shapes) {
    final splits = _equalSplits;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Split Preview',
          style: TextStyle(
            color: colors.textSecondary,
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 10),
        Container(
          decoration: BoxDecoration(
            color: colors.bgPrimary,
            borderRadius: BorderRadius.circular(shapes.radiusMd),
            border: Border.all(color: colors.borderDefault),
          ),
          child: Column(
            children: List.generate(_guestCount, (i) {
              final amount = splits.isNotEmpty
                  ? splits[i]
                  : widget.orderTotal / _guestCount;
              return Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: BoxDecoration(
                  border: i < _guestCount - 1
                      ? Border(bottom: BorderSide(color: colors.borderDefault))
                      : null,
                ),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 18,
                      backgroundColor:
                          colors.brandPrimary.withValues(alpha: 0.15),
                      child: Text(
                        '${i + 1}',
                        style: TextStyle(
                          color: colors.brandPrimary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Text(
                      'Guest ${i + 1}',
                      style: TextStyle(
                        color: colors.textPrimary,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      '\$${amount.toStringAsFixed(2)}',
                      style: TextStyle(
                        color: colors.textPrimary,
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              )
                  .animate(delay: (i * 50).ms)
                  .fadeIn(duration: 200.ms)
                  .slideX(begin: 0.1, end: 0);
            }),
          ),
        ),
      ],
    );
  }

  Widget _buildFooter(SavvyColors colors, SavvyShapes shapes) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: colors.bgPrimary,
        borderRadius:
            BorderRadius.vertical(bottom: Radius.circular(shapes.radiusLg)),
        border: Border(top: BorderSide(color: colors.borderDefault)),
      ),
      child: Row(
        children: [
          Expanded(
            child: OutlinedButton(
              onPressed: () => Navigator.of(context).pop(),
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 14),
                side: BorderSide(color: colors.borderDefault),
              ),
              child: Text(
                'Cancel',
                style: TextStyle(color: colors.textSecondary),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            flex: 2,
            child: ElevatedButton(
              onPressed: _createSplit,
              style: ElevatedButton.styleFrom(
                backgroundColor: colors.brandPrimary,
                padding: const EdgeInsets.symmetric(vertical: 14),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.check, color: colors.textInverse, size: 20),
                  const SizedBox(width: 8),
                  Text(
                    'Split Bill',
                    style: TextStyle(
                      color: colors.textInverse,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _createSplit() {
    HapticFeedback.mediumImpact();

    final now = TimeHelper.now();
    final guestBills = List.generate(_guestCount, (i) {
      final amount = _selectedMode == SplitMode.custom
          ? (_customAmounts[i + 1] ?? 0)
          : _equalSplits[i];

      return GuestBill(
        uuid: 'guest_${i + 1}_${now.millisecondsSinceEpoch}',
        splitBillUuid: '',
        guestNumber: i + 1,
        totalAmount: amount,
      );
    });

    final splitBill = SplitBill(
      uuid: 'split_${now.millisecondsSinceEpoch}',
      orderUuid: widget.orderUuid,
      orderNumber: widget.orderNumber,
      originalTotal: widget.orderTotal,
      guestCount: _guestCount,
      mode: _selectedMode,
      guestBills: guestBills,
      createdByUuid: 'current_user', // Would come from auth
      createdByName: 'Staff',
      createdAt: now,
    );

    widget.onSplitCreated(splitBill);
    Navigator.of(context).pop();
  }
}
