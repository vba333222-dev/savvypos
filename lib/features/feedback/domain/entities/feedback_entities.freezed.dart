// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'feedback_entities.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CustomerFeedback _$CustomerFeedbackFromJson(Map<String, dynamic> json) {
  return _CustomerFeedback.fromJson(json);
}

/// @nodoc
mixin _$CustomerFeedback {
  String get uuid => throw _privateConstructorUsedError;
  String get orderUuid => throw _privateConstructorUsedError;
  String? get customerUuid =>
      throw _privateConstructorUsedError; // Optional link to CRM
  int get rating => throw _privateConstructorUsedError; // 1 to 5 stars
  List<FeedbackTag> get tags => throw _privateConstructorUsedError;
  String? get comment => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  FeedbackSentiment get sentiment => throw _privateConstructorUsedError;
  bool get isActioned => throw _privateConstructorUsedError;

  /// Serializes this CustomerFeedback to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CustomerFeedback
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CustomerFeedbackCopyWith<CustomerFeedback> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomerFeedbackCopyWith<$Res> {
  factory $CustomerFeedbackCopyWith(
          CustomerFeedback value, $Res Function(CustomerFeedback) then) =
      _$CustomerFeedbackCopyWithImpl<$Res, CustomerFeedback>;
  @useResult
  $Res call(
      {String uuid,
      String orderUuid,
      String? customerUuid,
      int rating,
      List<FeedbackTag> tags,
      String? comment,
      DateTime createdAt,
      FeedbackSentiment sentiment,
      bool isActioned});
}

/// @nodoc
class _$CustomerFeedbackCopyWithImpl<$Res, $Val extends CustomerFeedback>
    implements $CustomerFeedbackCopyWith<$Res> {
  _$CustomerFeedbackCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CustomerFeedback
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
    Object? orderUuid = null,
    Object? customerUuid = freezed,
    Object? rating = null,
    Object? tags = null,
    Object? comment = freezed,
    Object? createdAt = null,
    Object? sentiment = null,
    Object? isActioned = null,
  }) {
    return _then(_value.copyWith(
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      orderUuid: null == orderUuid
          ? _value.orderUuid
          : orderUuid // ignore: cast_nullable_to_non_nullable
              as String,
      customerUuid: freezed == customerUuid
          ? _value.customerUuid
          : customerUuid // ignore: cast_nullable_to_non_nullable
              as String?,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as int,
      tags: null == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<FeedbackTag>,
      comment: freezed == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      sentiment: null == sentiment
          ? _value.sentiment
          : sentiment // ignore: cast_nullable_to_non_nullable
              as FeedbackSentiment,
      isActioned: null == isActioned
          ? _value.isActioned
          : isActioned // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CustomerFeedbackImplCopyWith<$Res>
    implements $CustomerFeedbackCopyWith<$Res> {
  factory _$$CustomerFeedbackImplCopyWith(_$CustomerFeedbackImpl value,
          $Res Function(_$CustomerFeedbackImpl) then) =
      __$$CustomerFeedbackImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String uuid,
      String orderUuid,
      String? customerUuid,
      int rating,
      List<FeedbackTag> tags,
      String? comment,
      DateTime createdAt,
      FeedbackSentiment sentiment,
      bool isActioned});
}

/// @nodoc
class __$$CustomerFeedbackImplCopyWithImpl<$Res>
    extends _$CustomerFeedbackCopyWithImpl<$Res, _$CustomerFeedbackImpl>
    implements _$$CustomerFeedbackImplCopyWith<$Res> {
  __$$CustomerFeedbackImplCopyWithImpl(_$CustomerFeedbackImpl _value,
      $Res Function(_$CustomerFeedbackImpl) _then)
      : super(_value, _then);

  /// Create a copy of CustomerFeedback
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
    Object? orderUuid = null,
    Object? customerUuid = freezed,
    Object? rating = null,
    Object? tags = null,
    Object? comment = freezed,
    Object? createdAt = null,
    Object? sentiment = null,
    Object? isActioned = null,
  }) {
    return _then(_$CustomerFeedbackImpl(
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      orderUuid: null == orderUuid
          ? _value.orderUuid
          : orderUuid // ignore: cast_nullable_to_non_nullable
              as String,
      customerUuid: freezed == customerUuid
          ? _value.customerUuid
          : customerUuid // ignore: cast_nullable_to_non_nullable
              as String?,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as int,
      tags: null == tags
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<FeedbackTag>,
      comment: freezed == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      sentiment: null == sentiment
          ? _value.sentiment
          : sentiment // ignore: cast_nullable_to_non_nullable
              as FeedbackSentiment,
      isActioned: null == isActioned
          ? _value.isActioned
          : isActioned // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CustomerFeedbackImpl implements _CustomerFeedback {
  const _$CustomerFeedbackImpl(
      {required this.uuid,
      required this.orderUuid,
      this.customerUuid,
      required this.rating,
      final List<FeedbackTag> tags = const [],
      this.comment,
      required this.createdAt,
      this.sentiment = FeedbackSentiment.neutral,
      this.isActioned = false})
      : _tags = tags;

  factory _$CustomerFeedbackImpl.fromJson(Map<String, dynamic> json) =>
      _$$CustomerFeedbackImplFromJson(json);

  @override
  final String uuid;
  @override
  final String orderUuid;
  @override
  final String? customerUuid;
// Optional link to CRM
  @override
  final int rating;
// 1 to 5 stars
  final List<FeedbackTag> _tags;
// 1 to 5 stars
  @override
  @JsonKey()
  List<FeedbackTag> get tags {
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tags);
  }

  @override
  final String? comment;
  @override
  final DateTime createdAt;
  @override
  @JsonKey()
  final FeedbackSentiment sentiment;
  @override
  @JsonKey()
  final bool isActioned;

  @override
  String toString() {
    return 'CustomerFeedback(uuid: $uuid, orderUuid: $orderUuid, customerUuid: $customerUuid, rating: $rating, tags: $tags, comment: $comment, createdAt: $createdAt, sentiment: $sentiment, isActioned: $isActioned)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CustomerFeedbackImpl &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.orderUuid, orderUuid) ||
                other.orderUuid == orderUuid) &&
            (identical(other.customerUuid, customerUuid) ||
                other.customerUuid == customerUuid) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            (identical(other.comment, comment) || other.comment == comment) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.sentiment, sentiment) ||
                other.sentiment == sentiment) &&
            (identical(other.isActioned, isActioned) ||
                other.isActioned == isActioned));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      uuid,
      orderUuid,
      customerUuid,
      rating,
      const DeepCollectionEquality().hash(_tags),
      comment,
      createdAt,
      sentiment,
      isActioned);

  /// Create a copy of CustomerFeedback
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CustomerFeedbackImplCopyWith<_$CustomerFeedbackImpl> get copyWith =>
      __$$CustomerFeedbackImplCopyWithImpl<_$CustomerFeedbackImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CustomerFeedbackImplToJson(
      this,
    );
  }
}

abstract class _CustomerFeedback implements CustomerFeedback {
  const factory _CustomerFeedback(
      {required final String uuid,
      required final String orderUuid,
      final String? customerUuid,
      required final int rating,
      final List<FeedbackTag> tags,
      final String? comment,
      required final DateTime createdAt,
      final FeedbackSentiment sentiment,
      final bool isActioned}) = _$CustomerFeedbackImpl;

  factory _CustomerFeedback.fromJson(Map<String, dynamic> json) =
      _$CustomerFeedbackImpl.fromJson;

  @override
  String get uuid;
  @override
  String get orderUuid;
  @override
  String? get customerUuid; // Optional link to CRM
  @override
  int get rating; // 1 to 5 stars
  @override
  List<FeedbackTag> get tags;
  @override
  String? get comment;
  @override
  DateTime get createdAt;
  @override
  FeedbackSentiment get sentiment;
  @override
  bool get isActioned;

  /// Create a copy of CustomerFeedback
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CustomerFeedbackImplCopyWith<_$CustomerFeedbackImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
