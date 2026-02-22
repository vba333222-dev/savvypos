import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:savvy_pos/core/config/theme/savvy_theme.dart';

class DateScrubberWidget extends StatefulWidget {
  final DateTime selectedDate;
  final ValueChanged<DateTime> onDateSelected;

  const DateScrubberWidget({
    super.key,
    required this.selectedDate,
    required this.onDateSelected,
  });

  @override
  State<DateScrubberWidget> createState() => _DateScrubberWidgetState();
}

class _DateScrubberWidgetState extends State<DateScrubberWidget> {
  late PageController _controller;

  final List<DateTime> _dates = [];

  @override
  void initState() {
    super.initState();
    // Generate last 30 days + next 7 days? Or just historical?
    // Let's do last 60 days
    final now = DateTime.now();
    for (int i = 59; i >= 0; i--) {
      _dates.add(now.subtract(Duration(days: i)));
    }
    // _dates.last is Today.
    // Index of Today is 59.

    // Find index of selected Date
    final index = _dates.indexWhere((d) => isSameDay(d, widget.selectedDate));
    final initialIndex = index != -1 ? index : _dates.length - 1;

    _controller = PageController(
      viewportFraction: 0.2,
      initialPage: initialIndex,
    );
  }

  bool isSameDay(DateTime a, DateTime b) {
    return a.year == b.year && a.month == b.month && a.day == b.day;
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.savvy;

    return SizedBox(
      height: 80,
      child: PageView.builder(
        controller: _controller,
        itemCount: _dates.length,
        onPageChanged: (index) {
          HapticFeedback.selectionClick();
          widget.onDateSelected(_dates[index]);
        },
        itemBuilder: (context, index) {
          final date = _dates[index];
          final isSelected = isSameDay(date, widget.selectedDate);

          return AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              double opacity = 0.5;
              double scale = 1.0;

              if (_controller.position.haveDimensions) {
                final page = _controller.page ?? 0;
                final diff = (page - index).abs();
                if (diff < 1) {
                  scale = 1.0 + (1 - diff) * 0.3; // Scale up to 1.3
                  opacity = 0.5 + (1 - diff) * 0.5; // Fade to 1.0
                }
              } else if (isSelected) {
                scale = 1.3;
                opacity = 1.0;
              }

              return Center(
                child: Transform.scale(
                  scale: scale,
                  child: Opacity(
                    opacity: opacity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          DateFormat('E').format(date).toUpperCase(),
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: theme.colors.textSecondary,
                            letterSpacing: 1,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Container(
                          width: 36,
                          height: 36,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: isSelected
                                ? theme.colors.brandPrimary
                                : Colors.transparent,
                            boxShadow: isSelected
                                ? [
                                    BoxShadow(
                                        color: theme.colors.brandPrimary
                                            .withValues(alpha: 0.4),
                                        blurRadius: 8,
                                        spreadRadius: 2)
                                  ]
                                : null,
                          ),
                          child: Text(
                            date.day.toString(),
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: isSelected
                                  ? theme.colors.textInverse
                                  : theme.colors.textPrimary,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
