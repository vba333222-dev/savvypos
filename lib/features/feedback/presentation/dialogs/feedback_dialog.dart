import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:savvy_pos/core/config/theme_config.dart';
import 'package:savvy_pos/features/feedback/domain/entities/feedback_entities.dart';

class FeedbackDialog extends StatefulWidget {
  final Function(int rating, List<FeedbackTag> tags, String? comment) onSubmit;
  final VoidCallback onSkip;

  const FeedbackDialog({
    super.key,
    required this.onSubmit,
    required this.onSkip,
  });

  @override
  State<FeedbackDialog> createState() => _FeedbackDialogState();
}

class _FeedbackDialogState extends State<FeedbackDialog> {
  int _rating = 0;
  final List<FeedbackTag> _selectedTags = [];
  final TextEditingController _commentCtrl = TextEditingController();
  int _step = 0; // 0: Rating, 1: Details

  @override
  void dispose() {
    _commentCtrl.dispose();
    super.dispose();
  }

  void _handleRating(int rating) {
    setState(() {
      _rating = rating;
      // Auto advance to next step after short delay
    });
    Future.delayed(300.ms, () {
      if (mounted) setState(() => _step = 1);
    });
  }

  void _toggleTag(FeedbackTag tag) {
    setState(() {
      if (_selectedTags.contains(tag)) {
        _selectedTags.remove(tag);
      } else {
        _selectedTags.add(tag);
      }
    });
  }

  void _submit() {
    widget.onSubmit(_rating, _selectedTags,
        _commentCtrl.text.isEmpty ? null : _commentCtrl.text);
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.savvy;
    final colors = theme.colors;

    return Dialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      child: Container(
        width: 500,
        padding: const EdgeInsets.all(32),
        decoration: BoxDecoration(
          color: colors.bgElevated,
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.2),
              blurRadius: 30,
              offset: const Offset(0, 10),
            )
          ],
        ),
        child: AnimatedSwitcher(
          duration: 400.ms,
          transitionBuilder: (child, animation) => FadeTransition(
            opacity: animation,
            child: SlideTransition(
              position:
                  Tween<Offset>(begin: const Offset(0.2, 0), end: Offset.zero)
                      .animate(animation),
              child: child,
            ),
          ),
          child:
              _step == 0 ? _buildRatingStep(colors) : _buildDetailStep(colors),
        ),
      ),
    ).animate().scale(duration: 400.ms, curve: Curves.easeOutBack);
  }

  Widget _buildRatingStep(SavvyColors colors) {
    return Column(
      key: const ValueKey('rating_step'),
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.thumb_up_alt_outlined, size: 48, color: colors.brandPrimary)
            .animate(onPlay: (c) => c.repeat(reverse: true))
            .scale(
                begin: const Offset(1, 1),
                end: const Offset(1.1, 1.1),
                duration: 1000.ms),
        const SizedBox(height: 24),
        Text(
          'How was your experience?',
          style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: colors.textPrimary),
        ),
        const SizedBox(height: 8),
        Text(
          'Help us serve you better!',
          style: TextStyle(fontSize: 16, color: colors.textSecondary),
        ),
        const SizedBox(height: 32),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(5, (index) {
            final star = index + 1;
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: GestureDetector(
                onTap: () => _handleRating(star),
                child: Icon(
                  _rating >= star
                      ? Icons.star_rounded
                      : Icons.star_outline_rounded,
                  size: 48,
                  color: _rating >= star
                      ? Colors.amber
                      : colors.textSecondary.withValues(alpha: 0.3),
                ),
              ),
            );
          }),
        ),
        const SizedBox(height: 32),
        TextButton(
          onPressed: widget.onSkip,
          child: Text('Skip', style: TextStyle(color: colors.textSecondary)),
        ),
      ],
    );
  }

  Widget _buildDetailStep(SavvyColors colors) {
    return Column(
      key: const ValueKey('detail_step'),
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          _rating >= 4 ? 'Glad you liked it!' : 'Tell us more',
          style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: colors.textPrimary),
        ),
        const SizedBox(height: 24),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          alignment: WrapAlignment.center,
          children: FeedbackTag.values.map((tag) {
            final isSelected = _selectedTags.contains(tag);
            return GestureDetector(
              onTap: () => _toggleTag(tag),
              child: AnimatedContainer(
                duration: 200.ms,
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: isSelected ? colors.brandPrimary : colors.bgPrimary,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color:
                        isSelected ? colors.brandPrimary : colors.borderDefault,
                  ),
                ),
                child: Text(
                  _formatTag(tag),
                  style: TextStyle(
                    color: isSelected ? colors.textInverse : colors.textPrimary,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            );
          }).toList(),
        ),
        const SizedBox(height: 24),
        TextField(
          controller: _commentCtrl,
          maxLines: 3,
          decoration: InputDecoration(
            hintText: 'Any other comments? (Optional)',
            filled: true,
            fillColor: colors.bgPrimary,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
          ),
        ),
        const SizedBox(height: 32),
        Row(
          children: [
            TextButton(
              onPressed: () => setState(() => _step = 0),
              child: const Text('Back'),
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: _submit,
              style: ElevatedButton.styleFrom(
                backgroundColor: colors.brandPrimary,
                foregroundColor: colors.textInverse,
                padding:
                    const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
              ),
              child: const Text('Submit Feedback'),
            ),
          ],
        ),
      ],
    );
  }

  String _formatTag(FeedbackTag tag) {
    switch (tag) {
      case FeedbackTag.foodQuality:
        return 'Food Quality';
      case FeedbackTag.service:
        return 'Service';
      case FeedbackTag.ambience:
        return 'Ambience';
      case FeedbackTag.speed:
        return 'Speed';
      case FeedbackTag.value:
        return 'Value';
      case FeedbackTag.cleanliness:
        return 'Cleanliness';
      case FeedbackTag.other:
        return 'Other';
    }
  }
}
