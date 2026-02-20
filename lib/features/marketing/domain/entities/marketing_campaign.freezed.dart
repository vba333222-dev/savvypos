// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'marketing_campaign.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MarketingCampaign _$MarketingCampaignFromJson(Map<String, dynamic> json) {
  return _MarketingCampaign.fromJson(json);
}

/// @nodoc
mixin _$MarketingCampaign {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  CampaignChannel get channel => throw _privateConstructorUsedError;
  CampaignTriggerType get triggerType => throw _privateConstructorUsedError;
  String? get triggerValue =>
      throw _privateConstructorUsedError; // e.g., spending threshold amount
  String get content => throw _privateConstructorUsedError;
  bool get isActive => throw _privateConstructorUsedError;
  double get attributedSales => throw _privateConstructorUsedError;
  int get sentCount => throw _privateConstructorUsedError;
  DateTime? get lastRunAt => throw _privateConstructorUsedError;

  /// Serializes this MarketingCampaign to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MarketingCampaign
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MarketingCampaignCopyWith<MarketingCampaign> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MarketingCampaignCopyWith<$Res> {
  factory $MarketingCampaignCopyWith(
          MarketingCampaign value, $Res Function(MarketingCampaign) then) =
      _$MarketingCampaignCopyWithImpl<$Res, MarketingCampaign>;
  @useResult
  $Res call(
      {String id,
      String name,
      CampaignChannel channel,
      CampaignTriggerType triggerType,
      String? triggerValue,
      String content,
      bool isActive,
      double attributedSales,
      int sentCount,
      DateTime? lastRunAt});
}

/// @nodoc
class _$MarketingCampaignCopyWithImpl<$Res, $Val extends MarketingCampaign>
    implements $MarketingCampaignCopyWith<$Res> {
  _$MarketingCampaignCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MarketingCampaign
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? channel = null,
    Object? triggerType = null,
    Object? triggerValue = freezed,
    Object? content = null,
    Object? isActive = null,
    Object? attributedSales = null,
    Object? sentCount = null,
    Object? lastRunAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      channel: null == channel
          ? _value.channel
          : channel // ignore: cast_nullable_to_non_nullable
              as CampaignChannel,
      triggerType: null == triggerType
          ? _value.triggerType
          : triggerType // ignore: cast_nullable_to_non_nullable
              as CampaignTriggerType,
      triggerValue: freezed == triggerValue
          ? _value.triggerValue
          : triggerValue // ignore: cast_nullable_to_non_nullable
              as String?,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      attributedSales: null == attributedSales
          ? _value.attributedSales
          : attributedSales // ignore: cast_nullable_to_non_nullable
              as double,
      sentCount: null == sentCount
          ? _value.sentCount
          : sentCount // ignore: cast_nullable_to_non_nullable
              as int,
      lastRunAt: freezed == lastRunAt
          ? _value.lastRunAt
          : lastRunAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MarketingCampaignImplCopyWith<$Res>
    implements $MarketingCampaignCopyWith<$Res> {
  factory _$$MarketingCampaignImplCopyWith(_$MarketingCampaignImpl value,
          $Res Function(_$MarketingCampaignImpl) then) =
      __$$MarketingCampaignImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      CampaignChannel channel,
      CampaignTriggerType triggerType,
      String? triggerValue,
      String content,
      bool isActive,
      double attributedSales,
      int sentCount,
      DateTime? lastRunAt});
}

/// @nodoc
class __$$MarketingCampaignImplCopyWithImpl<$Res>
    extends _$MarketingCampaignCopyWithImpl<$Res, _$MarketingCampaignImpl>
    implements _$$MarketingCampaignImplCopyWith<$Res> {
  __$$MarketingCampaignImplCopyWithImpl(_$MarketingCampaignImpl _value,
      $Res Function(_$MarketingCampaignImpl) _then)
      : super(_value, _then);

  /// Create a copy of MarketingCampaign
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? channel = null,
    Object? triggerType = null,
    Object? triggerValue = freezed,
    Object? content = null,
    Object? isActive = null,
    Object? attributedSales = null,
    Object? sentCount = null,
    Object? lastRunAt = freezed,
  }) {
    return _then(_$MarketingCampaignImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      channel: null == channel
          ? _value.channel
          : channel // ignore: cast_nullable_to_non_nullable
              as CampaignChannel,
      triggerType: null == triggerType
          ? _value.triggerType
          : triggerType // ignore: cast_nullable_to_non_nullable
              as CampaignTriggerType,
      triggerValue: freezed == triggerValue
          ? _value.triggerValue
          : triggerValue // ignore: cast_nullable_to_non_nullable
              as String?,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      attributedSales: null == attributedSales
          ? _value.attributedSales
          : attributedSales // ignore: cast_nullable_to_non_nullable
              as double,
      sentCount: null == sentCount
          ? _value.sentCount
          : sentCount // ignore: cast_nullable_to_non_nullable
              as int,
      lastRunAt: freezed == lastRunAt
          ? _value.lastRunAt
          : lastRunAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MarketingCampaignImpl implements _MarketingCampaign {
  const _$MarketingCampaignImpl(
      {required this.id,
      required this.name,
      required this.channel,
      required this.triggerType,
      this.triggerValue,
      required this.content,
      this.isActive = true,
      this.attributedSales = 0.0,
      this.sentCount = 0,
      this.lastRunAt});

  factory _$MarketingCampaignImpl.fromJson(Map<String, dynamic> json) =>
      _$$MarketingCampaignImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final CampaignChannel channel;
  @override
  final CampaignTriggerType triggerType;
  @override
  final String? triggerValue;
// e.g., spending threshold amount
  @override
  final String content;
  @override
  @JsonKey()
  final bool isActive;
  @override
  @JsonKey()
  final double attributedSales;
  @override
  @JsonKey()
  final int sentCount;
  @override
  final DateTime? lastRunAt;

  @override
  String toString() {
    return 'MarketingCampaign(id: $id, name: $name, channel: $channel, triggerType: $triggerType, triggerValue: $triggerValue, content: $content, isActive: $isActive, attributedSales: $attributedSales, sentCount: $sentCount, lastRunAt: $lastRunAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MarketingCampaignImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.channel, channel) || other.channel == channel) &&
            (identical(other.triggerType, triggerType) ||
                other.triggerType == triggerType) &&
            (identical(other.triggerValue, triggerValue) ||
                other.triggerValue == triggerValue) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.attributedSales, attributedSales) ||
                other.attributedSales == attributedSales) &&
            (identical(other.sentCount, sentCount) ||
                other.sentCount == sentCount) &&
            (identical(other.lastRunAt, lastRunAt) ||
                other.lastRunAt == lastRunAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, channel, triggerType,
      triggerValue, content, isActive, attributedSales, sentCount, lastRunAt);

  /// Create a copy of MarketingCampaign
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MarketingCampaignImplCopyWith<_$MarketingCampaignImpl> get copyWith =>
      __$$MarketingCampaignImplCopyWithImpl<_$MarketingCampaignImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MarketingCampaignImplToJson(
      this,
    );
  }
}

abstract class _MarketingCampaign implements MarketingCampaign {
  const factory _MarketingCampaign(
      {required final String id,
      required final String name,
      required final CampaignChannel channel,
      required final CampaignTriggerType triggerType,
      final String? triggerValue,
      required final String content,
      final bool isActive,
      final double attributedSales,
      final int sentCount,
      final DateTime? lastRunAt}) = _$MarketingCampaignImpl;

  factory _MarketingCampaign.fromJson(Map<String, dynamic> json) =
      _$MarketingCampaignImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  CampaignChannel get channel;
  @override
  CampaignTriggerType get triggerType;
  @override
  String? get triggerValue; // e.g., spending threshold amount
  @override
  String get content;
  @override
  bool get isActive;
  @override
  double get attributedSales;
  @override
  int get sentCount;
  @override
  DateTime? get lastRunAt;

  /// Create a copy of MarketingCampaign
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MarketingCampaignImplCopyWith<_$MarketingCampaignImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
