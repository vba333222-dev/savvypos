import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:savvy_pos/core/di/injection.dart';
import 'package:savvy_pos/features/feedback/domain/entities/feedback_entities.dart';
import 'package:savvy_pos/features/feedback/domain/repositories/i_feedback_repository.dart';
import 'package:savvy_pos/features/feedback/presentation/dialogs/feedback_dialog.dart';
import 'package:uuid/uuid.dart';

class KioskSuccessPage extends StatefulWidget {
  final VoidCallback onDone;
  final String? orderUuid;

  const KioskSuccessPage({
    super.key,
    required this.onDone,
    this.orderUuid,
  });

  @override
  State<KioskSuccessPage> createState() => _KioskSuccessPageState();
}

class _KioskSuccessPageState extends State<KioskSuccessPage> {
  bool _feedbackShown = false;

  @override
  void initState() {
    super.initState();
    // Show feedback dialog after 2 seconds
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted && !_feedbackShown) {
        _showFeedbackDialog();
      }
    });

    // Auto-close after 10 seconds if no interaction
    Future.delayed(const Duration(seconds: 15), () {
      if (mounted) widget.onDone();
    });
  }

  Future<void> _showFeedbackDialog() async {
    setState(() => _feedbackShown = true);
    await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => FeedbackDialog(
        onSkip: () {
          Navigator.of(context).pop();
          widget.onDone();
        },
        onSubmit: (rating, tags, comment) async {
          Navigator.of(context).pop();
          await _submitFeedback(rating, tags, comment);
          widget.onDone();
        },
      ),
    );
  }

  Future<void> _submitFeedback(int rating, List<FeedbackTag> tags, String? comment) async {
    final repo = getIt<IFeedbackRepository>();
    final feedback = CustomerFeedback(
      uuid: const Uuid().v4(),
      orderUuid: widget.orderUuid ?? 'unknown', // Ideally passed from session
      rating: rating,
      tags: tags,
      comment: comment,
      createdAt: DateTime.now(),
      sentiment: rating >= 4 ? FeedbackSentiment.positive : (rating <= 2 ? FeedbackSentiment.negative : FeedbackSentiment.neutral),
    );
    await repo.submitFeedback(feedback);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Stack(
        children: [
          // Confetti or bg pattern here
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.check_circle, color: Colors.white, size: 120)
                    .animate()
                    .scale(duration: 500.ms, curve: Curves.elasticOut)
                    .then(delay: 200.ms)
                    .shake(hz: 4),
                
                const SizedBox(height: 32),
                
                const Text(
                  'THANK YOU!',
                  style: TextStyle(fontSize: 48, fontWeight: FontWeight.w900, color: Colors.white),
                ).animate().fadeIn(delay: 300.ms).slideY(begin: 0.2, end: 0),
                
                const SizedBox(height: 16),
                
                const Text(
                  'Please take your receipt.',
                  style: TextStyle(fontSize: 24, color: Colors.white70),
                ).animate().fadeIn(delay: 500.ms),
                
                const SizedBox(height: 48),
                
                ElevatedButton(
                  onPressed: widget.onDone,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.green,
                    padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 24),
                  ),
                  child: const Text('DONE', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                ).animate().scale(delay: 800.ms),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
