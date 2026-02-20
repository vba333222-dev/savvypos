import 'package:savvy_pos/features/feedback/domain/entities/feedback_entities.dart';

abstract class IFeedbackRepository {
  /// Submit a new feedback entry
  Future<void> submitFeedback(CustomerFeedback feedback);

  /// Get feedback for a specific order
  Future<CustomerFeedback?> getFeedbackByOrder(String orderUuid);

  /// Get aggregated stream of recent feedback for dashboard
  Stream<List<CustomerFeedback>> watchRecentFeedback({int limit = 20});

  /// Calculate Net Promoter Score (NPS) or Avg Rating from recent data
  Future<double> getAverageRating({DateTime? from});
}
