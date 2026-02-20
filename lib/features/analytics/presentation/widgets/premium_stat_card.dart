import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:savvy_pos/core/config/theme_config.dart';

/// Premium Stat Card with animated counter, trend indicator, and glassmorphic design
class PremiumStatCard extends StatefulWidget {
  final String title;
  final double value;
  final String? prefix;
  final String? suffix;
  final IconData icon;
  final Color? iconColor;
  final double? previousValue;  // For trend calculation
  final int decimalPlaces;
  final VoidCallback? onTap;
  final bool isLoading;
  
  const PremiumStatCard({
    super.key,
    required this.title,
    required this.value,
    this.prefix,
    this.suffix,
    required this.icon,
    this.iconColor,
    this.previousValue,
    this.decimalPlaces = 2,
    this.onTap,
    this.isLoading = false,
  });

  @override
  State<PremiumStatCard> createState() => _PremiumStatCardState();
}

class _PremiumStatCardState extends State<PremiumStatCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _countAnimation;
  double _displayValue = 0;
  
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    
    _countAnimation = Tween<double>(begin: 0, end: widget.value).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic),
    )..addListener(() {
      setState(() {
        _displayValue = _countAnimation.value;
      });
    });
    
    _controller.forward();
  }
  
  @override
  void didUpdateWidget(PremiumStatCard oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.value != widget.value) {
      _countAnimation = Tween<double>(
        begin: _displayValue,
        end: widget.value,
      ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic));
      _controller.forward(from: 0);
    }
  }
  
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  
  double? get _trendPercentage {
    if (widget.previousValue == null || widget.previousValue == 0) return null;
    return ((widget.value - widget.previousValue!) / widget.previousValue!) * 100;
  }
  
  bool get _isPositiveTrend => _trendPercentage != null && _trendPercentage! >= 0;

  @override
  Widget build(BuildContext context) {
    final colors = context.savvy.colors;
    final shapes = context.savvy.shapes;
    
    final iconCol = widget.iconColor ?? colors.brandPrimary;
    
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              colors.bgElevated,
              colors.bgElevated.withValues(alpha: 0.85),
            ],
          ),
          borderRadius: BorderRadius.circular(shapes.radiusLg),
          border: Border.all(
            color: colors.borderDefault.withValues(alpha: 0.2),
            width: 1,
          ),
          boxShadow: [
            BoxShadow(
              color: iconCol.withValues(alpha: 0.08),
              blurRadius: 24,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Icon with glow
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: iconCol.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(shapes.radiusMd),
                    boxShadow: [
                      BoxShadow(
                        color: iconCol.withValues(alpha: 0.2),
                        blurRadius: 12,
                        spreadRadius: 0,
                      ),
                    ],
                  ),
                  child: Icon(widget.icon, color: iconCol, size: 22),
                ),
                
                // Trend indicator
                if (_trendPercentage != null)
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                      color: (_isPositiveTrend ? colors.stateSuccess : colors.stateError)
                          .withValues(alpha: 0.12),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          _isPositiveTrend ? Icons.trending_up : Icons.trending_down,
                          size: 14,
                          color: _isPositiveTrend ? colors.stateSuccess : colors.stateError,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          '${_isPositiveTrend ? '+' : ''}${_trendPercentage!.toStringAsFixed(1)}%',
                          style: TextStyle(
                            color: _isPositiveTrend ? colors.stateSuccess : colors.stateError,
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  )
                  .animate()
                  .fadeIn(duration: 300.ms, delay: 400.ms)
                  .slideX(begin: 0.2, end: 0),
              ],
            ),
            
            const SizedBox(height: 16),
            
            // Title
            Text(
              widget.title,
              style: TextStyle(
                color: colors.textSecondary,
                fontSize: 13,
                fontWeight: FontWeight.w500,
                letterSpacing: 0.3,
              ),
            ),
            
            const SizedBox(height: 8),
            
            // Value with animated counter
            widget.isLoading
                ? _buildSkeleton(colors)
                : Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      if (widget.prefix != null)
                        Text(
                          widget.prefix!,
                          style: TextStyle(
                            color: colors.textPrimary,
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      Text(
                        _displayValue.toStringAsFixed(widget.decimalPlaces),
                        style: TextStyle(
                          color: colors.textPrimary,
                          fontSize: 28,
                          fontWeight: FontWeight.w700,
                          fontFeatures: const [FontFeature.tabularFigures()],
                        ),
                      ),
                      if (widget.suffix != null)
                        Padding(
                          padding: const EdgeInsets.only(left: 4, bottom: 4),
                          child: Text(
                            widget.suffix!,
                            style: TextStyle(
                              color: colors.textSecondary,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                    ],
                  ),
          ],
        ),
      ),
    )
    .animate()
    .fadeIn(duration: 400.ms)
    .slideY(begin: 0.1, end: 0, duration: 400.ms, curve: Curves.easeOutQuad);
  }
  
  Widget _buildSkeleton(SavvyColors colors) {
    return Container(
      height: 32,
      width: 120,
      decoration: BoxDecoration(
        color: colors.bgPrimary,
        borderRadius: BorderRadius.circular(8),
      ),
    )
    .animate(onPlay: (c) => c.repeat())
    .shimmer(duration: 1200.ms, color: colors.borderDefault.withValues(alpha: 0.3));
  }
}
