import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:savvy_pos/core/config/theme_config.dart';

/// Premium Tip Entry Widget with animated percentage buttons and custom input
/// Features: Glassmorphic design, haptic feedback, animated selection
class TipEntryWidget extends StatefulWidget {
  final double orderTotal;
  final Function(double tipAmount, bool isCustom) onTipSelected;
  final double? initialTip;

  const TipEntryWidget({
    super.key,
    required this.orderTotal,
    required this.onTipSelected,
    this.initialTip,
  });

  @override
  State<TipEntryWidget> createState() => _TipEntryWidgetState();
}

class _TipEntryWidgetState extends State<TipEntryWidget> {
  int? _selectedPercentage;
  double _customAmount = 0;
  bool _isCustom = false;
  final _customController = TextEditingController();

  static const _percentages = [15, 18, 20, 25];

  @override
  void initState() {
    super.initState();
    if (widget.initialTip != null && widget.initialTip! > 0) {
      _customAmount = widget.initialTip!;
      _isCustom = true;
      _customController.text = widget.initialTip!.toStringAsFixed(2);
    }
  }

  @override
  void dispose() {
    _customController.dispose();
    super.dispose();
  }

  double get _currentTip {
    if (_isCustom) return _customAmount;
    if (_selectedPercentage != null) {
      return widget.orderTotal * _selectedPercentage! / 100;
    }
    return 0;
  }

  void _selectPercentage(int percentage) {
    HapticFeedback.lightImpact();
    setState(() {
      _selectedPercentage = percentage;
      _isCustom = false;
    });
    widget.onTipSelected(_currentTip, false);
  }

  void _enterCustomAmount() {
    HapticFeedback.selectionClick();
    setState(() {
      _isCustom = true;
      _selectedPercentage = null;
    });
  }

  void _updateCustomAmount(String value) {
    final amount = double.tryParse(value) ?? 0;
    setState(() {
      _customAmount = amount;
    });
    widget.onTipSelected(amount, true);
  }

  void _skipTip() {
    HapticFeedback.lightImpact();
    setState(() {
      _selectedPercentage = null;
      _isCustom = false;
      _customAmount = 0;
    });
    widget.onTipSelected(0, false);
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.savvy;
    final colors = theme.colors;

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            colors.bgElevated,
            colors.bgElevated.withValues(alpha: 0.95),
          ],
        ),
        borderRadius: BorderRadius.circular(theme.shapes.radiusLg),
        border: Border.all(
          color: colors.borderDefault.withValues(alpha: 0.3),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: colors.brandPrimary.withValues(alpha: 0.1),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(Icons.volunteer_activism,
                      color: colors.brandPrimary, size: 24),
                  const SizedBox(width: 10),
                  Text(
                    'Add a Tip',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: colors.textPrimary,
                    ),
                  ),
                ],
              ),
              if (_currentTip > 0)
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: colors.stateSuccess.withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    '\$${_currentTip.toStringAsFixed(2)}',
                    style: TextStyle(
                      color: colors.stateSuccess,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ).animate(target: 1).scale(
                    begin: const Offset(0.8, 0.8),
                    duration: 200.ms,
                    curve: Curves.elasticOut),
            ],
          ),

          const SizedBox(height: 20),

          // Percentage buttons
          Row(
            children: _percentages.map((pct) {
              final isSelected = _selectedPercentage == pct && !_isCustom;
              final tipAmount = widget.orderTotal * pct / 100;

              return Expanded(
                child: Padding(
                  padding:
                      EdgeInsets.only(right: pct != _percentages.last ? 10 : 0),
                  child: _TipPercentageButton(
                    percentage: pct,
                    tipAmount: tipAmount,
                    isSelected: isSelected,
                    onTap: () => _selectPercentage(pct),
                  ),
                ),
              );
            }).toList(),
          ),

          const SizedBox(height: 16),

          // Custom amount input
          AnimatedContainer(
            duration: 200.ms,
            decoration: BoxDecoration(
              color: _isCustom
                  ? colors.brandPrimary.withValues(alpha: 0.1)
                  : colors.bgPrimary,
              borderRadius: BorderRadius.circular(theme.shapes.radiusMd),
              border: Border.all(
                color: _isCustom ? colors.brandPrimary : colors.borderDefault,
                width: _isCustom ? 2 : 1,
              ),
            ),
            child: TextField(
              controller: _customController,
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              onTap: _enterCustomAmount,
              onChanged: _updateCustomAmount,
              style: TextStyle(
                color: colors.textPrimary,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
              decoration: InputDecoration(
                hintText: 'Enter custom amount',
                hintStyle: TextStyle(color: colors.textSecondary),
                prefixIcon:
                    Icon(Icons.attach_money, color: colors.textSecondary),
                border: InputBorder.none,
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              ),
            ),
          ),

          const SizedBox(height: 16),

          // No tip option
          Center(
            child: TextButton.icon(
              onPressed: _skipTip,
              icon: Icon(Icons.not_interested,
                  size: 18, color: colors.textSecondary),
              label: Text(
                'No Tip',
                style: TextStyle(color: colors.textSecondary),
              ),
            ),
          ),
        ],
      ),
    ).animate().fadeIn(duration: 300.ms).slideY(
        begin: 0.1, end: 0, duration: 300.ms, curve: Curves.easeOutQuad);
  }
}

class _TipPercentageButton extends StatefulWidget {
  final int percentage;
  final double tipAmount;
  final bool isSelected;
  final VoidCallback onTap;

  const _TipPercentageButton({
    required this.percentage,
    required this.tipAmount,
    required this.isSelected,
    required this.onTap,
  });

  @override
  State<_TipPercentageButton> createState() => _TipPercentageButtonState();
}

class _TipPercentageButtonState extends State<_TipPercentageButton> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    final colors = context.savvy.colors;
    final shapes = context.savvy.shapes;

    return GestureDetector(
      onTapDown: (_) => setState(() => _isPressed = true),
      onTapUp: (_) => setState(() => _isPressed = false),
      onTapCancel: () => setState(() => _isPressed = false),
      onTap: widget.onTap,
      child: AnimatedScale(
        scale: _isPressed ? 0.95 : 1.0,
        duration: 100.ms,
        child: AnimatedContainer(
          duration: 200.ms,
          padding: const EdgeInsets.symmetric(vertical: 16),
          decoration: BoxDecoration(
            gradient: widget.isSelected
                ? LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      colors.brandPrimary,
                      colors.brandPrimary.withValues(alpha: 0.8),
                    ],
                  )
                : null,
            color: widget.isSelected ? null : colors.bgPrimary,
            borderRadius: BorderRadius.circular(shapes.radiusMd),
            border: Border.all(
              color: widget.isSelected
                  ? colors.brandPrimary
                  : colors.borderDefault,
              width: widget.isSelected ? 0 : 1,
            ),
            boxShadow: widget.isSelected
                ? [
                    BoxShadow(
                      color: colors.brandPrimary.withValues(alpha: 0.3),
                      blurRadius: 12,
                      offset: const Offset(0, 4),
                    ),
                  ]
                : null,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                '${widget.percentage}%',
                style: TextStyle(
                  color: widget.isSelected
                      ? colors.textInverse
                      : colors.textPrimary,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                '\$${widget.tipAmount.toStringAsFixed(2)}',
                style: TextStyle(
                  color: widget.isSelected
                      ? colors.textInverse.withValues(alpha: 0.8)
                      : colors.textSecondary,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      ),
    )
        .animate(target: widget.isSelected ? 1 : 0)
        .scale(
            begin: const Offset(1, 1),
            end: const Offset(1.05, 1.05),
            duration: 150.ms)
        .then()
        .scale(
            begin: const Offset(1.05, 1.05),
            end: const Offset(1, 1),
            duration: 100.ms);
  }
}
