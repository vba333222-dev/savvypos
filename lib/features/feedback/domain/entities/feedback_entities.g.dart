// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feedback_entities.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CustomerFeedbackImpl _$$CustomerFeedbackImplFromJson(
        Map<String, dynamic> json) =>
    _$CustomerFeedbackImpl(
      uuid: json['uuid'] as String,
      orderUuid: json['orderUuid'] as String,
      customerUuid: json['customerUuid'] as String?,
      rating: (json['rating'] as num).toInt(),
      tags: (json['tags'] as List<dynamic>?)
              ?.map((e) => $enumDecode(_$FeedbackTagEnumMap, e))
              .toList() ??
          const [],
      comment: json['comment'] as String?,
      createdAt: DateTime.parse(json['createdAt'] as String),
      sentiment:
          $enumDecodeNullable(_$FeedbackSentimentEnumMap, json['sentiment']) ??
              FeedbackSentiment.neutral,
      isActioned: json['isActioned'] as bool? ?? false,
    );

Map<String, dynamic> _$$CustomerFeedbackImplToJson(
        _$CustomerFeedbackImpl instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'orderUuid': instance.orderUuid,
      'customerUuid': instance.customerUuid,
      'rating': instance.rating,
      'tags': instance.tags.map((e) => _$FeedbackTagEnumMap[e]!).toList(),
      'comment': instance.comment,
      'createdAt': instance.createdAt.toIso8601String(),
      'sentiment': _$FeedbackSentimentEnumMap[instance.sentiment]!,
      'isActioned': instance.isActioned,
    };

const _$FeedbackTagEnumMap = {
  FeedbackTag.foodQuality: 'foodQuality',
  FeedbackTag.service: 'service',
  FeedbackTag.ambience: 'ambience',
  FeedbackTag.speed: 'speed',
  FeedbackTag.value: 'value',
  FeedbackTag.cleanliness: 'cleanliness',
  FeedbackTag.other: 'other',
};

const _$FeedbackSentimentEnumMap = {
  FeedbackSentiment.positive: 'positive',
  FeedbackSentiment.neutral: 'neutral',
  FeedbackSentiment.negative: 'negative',
};
