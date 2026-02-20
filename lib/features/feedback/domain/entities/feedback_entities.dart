import 'package:freezed_annotation/freezed_annotation.dart';

part 'feedback_entities.freezed.dart';
part 'feedback_entities.g.dart';

enum FeedbackSentiment { positive, neutral, negative }

enum FeedbackTag {
  foodQuality,
  service,
  ambience,
  speed,
  value,
  cleanliness,
  other
}

@freezed
class CustomerFeedback with _$CustomerFeedback {
  const factory CustomerFeedback({
    required String uuid,
    required String orderUuid,
    String? customerUuid, // Optional link to CRM
    required int rating, // 1 to 5 stars
    @Default([]) List<FeedbackTag> tags,
    String? comment,
    required DateTime createdAt,
    @Default(FeedbackSentiment.neutral) FeedbackSentiment sentiment,
    @Default(false) bool isActioned, // If a manager has reviewed/resolved it
  }) = _CustomerFeedback;

  factory CustomerFeedback.fromJson(Map<String, dynamic> json) => _$CustomerFeedbackFromJson(json);
}
