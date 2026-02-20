// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'delivery_channel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DeliveryChannelConfig _$DeliveryChannelConfigFromJson(
    Map<String, dynamic> json) {
  return _DeliveryChannelConfig.fromJson(json);
}

/// @nodoc
mixin _$DeliveryChannelConfig {
  String get id => throw _privateConstructorUsedError; // e.g., 'uber-eats-001'
  DeliveryProvider get provider => throw _privateConstructorUsedError;
  bool get isActive => throw _privateConstructorUsedError;
  bool get autoAcceptOrders => throw _privateConstructorUsedError;
  double get surchargePercent =>
      throw _privateConstructorUsedError; // e.g., 20.0 for 20% markup
  DateTime? get lastSyncedAt => throw _privateConstructorUsedError;

  /// Serializes this DeliveryChannelConfig to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DeliveryChannelConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DeliveryChannelConfigCopyWith<DeliveryChannelConfig> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeliveryChannelConfigCopyWith<$Res> {
  factory $DeliveryChannelConfigCopyWith(DeliveryChannelConfig value,
          $Res Function(DeliveryChannelConfig) then) =
      _$DeliveryChannelConfigCopyWithImpl<$Res, DeliveryChannelConfig>;
  @useResult
  $Res call(
      {String id,
      DeliveryProvider provider,
      bool isActive,
      bool autoAcceptOrders,
      double surchargePercent,
      DateTime? lastSyncedAt});
}

/// @nodoc
class _$DeliveryChannelConfigCopyWithImpl<$Res,
        $Val extends DeliveryChannelConfig>
    implements $DeliveryChannelConfigCopyWith<$Res> {
  _$DeliveryChannelConfigCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DeliveryChannelConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? provider = null,
    Object? isActive = null,
    Object? autoAcceptOrders = null,
    Object? surchargePercent = null,
    Object? lastSyncedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      provider: null == provider
          ? _value.provider
          : provider // ignore: cast_nullable_to_non_nullable
              as DeliveryProvider,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      autoAcceptOrders: null == autoAcceptOrders
          ? _value.autoAcceptOrders
          : autoAcceptOrders // ignore: cast_nullable_to_non_nullable
              as bool,
      surchargePercent: null == surchargePercent
          ? _value.surchargePercent
          : surchargePercent // ignore: cast_nullable_to_non_nullable
              as double,
      lastSyncedAt: freezed == lastSyncedAt
          ? _value.lastSyncedAt
          : lastSyncedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DeliveryChannelConfigImplCopyWith<$Res>
    implements $DeliveryChannelConfigCopyWith<$Res> {
  factory _$$DeliveryChannelConfigImplCopyWith(
          _$DeliveryChannelConfigImpl value,
          $Res Function(_$DeliveryChannelConfigImpl) then) =
      __$$DeliveryChannelConfigImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      DeliveryProvider provider,
      bool isActive,
      bool autoAcceptOrders,
      double surchargePercent,
      DateTime? lastSyncedAt});
}

/// @nodoc
class __$$DeliveryChannelConfigImplCopyWithImpl<$Res>
    extends _$DeliveryChannelConfigCopyWithImpl<$Res,
        _$DeliveryChannelConfigImpl>
    implements _$$DeliveryChannelConfigImplCopyWith<$Res> {
  __$$DeliveryChannelConfigImplCopyWithImpl(_$DeliveryChannelConfigImpl _value,
      $Res Function(_$DeliveryChannelConfigImpl) _then)
      : super(_value, _then);

  /// Create a copy of DeliveryChannelConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? provider = null,
    Object? isActive = null,
    Object? autoAcceptOrders = null,
    Object? surchargePercent = null,
    Object? lastSyncedAt = freezed,
  }) {
    return _then(_$DeliveryChannelConfigImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      provider: null == provider
          ? _value.provider
          : provider // ignore: cast_nullable_to_non_nullable
              as DeliveryProvider,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      autoAcceptOrders: null == autoAcceptOrders
          ? _value.autoAcceptOrders
          : autoAcceptOrders // ignore: cast_nullable_to_non_nullable
              as bool,
      surchargePercent: null == surchargePercent
          ? _value.surchargePercent
          : surchargePercent // ignore: cast_nullable_to_non_nullable
              as double,
      lastSyncedAt: freezed == lastSyncedAt
          ? _value.lastSyncedAt
          : lastSyncedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DeliveryChannelConfigImpl implements _DeliveryChannelConfig {
  const _$DeliveryChannelConfigImpl(
      {required this.id,
      required this.provider,
      this.isActive = true,
      this.autoAcceptOrders = true,
      this.surchargePercent = 0.0,
      this.lastSyncedAt});

  factory _$DeliveryChannelConfigImpl.fromJson(Map<String, dynamic> json) =>
      _$$DeliveryChannelConfigImplFromJson(json);

  @override
  final String id;
// e.g., 'uber-eats-001'
  @override
  final DeliveryProvider provider;
  @override
  @JsonKey()
  final bool isActive;
  @override
  @JsonKey()
  final bool autoAcceptOrders;
  @override
  @JsonKey()
  final double surchargePercent;
// e.g., 20.0 for 20% markup
  @override
  final DateTime? lastSyncedAt;

  @override
  String toString() {
    return 'DeliveryChannelConfig(id: $id, provider: $provider, isActive: $isActive, autoAcceptOrders: $autoAcceptOrders, surchargePercent: $surchargePercent, lastSyncedAt: $lastSyncedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeliveryChannelConfigImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.provider, provider) ||
                other.provider == provider) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.autoAcceptOrders, autoAcceptOrders) ||
                other.autoAcceptOrders == autoAcceptOrders) &&
            (identical(other.surchargePercent, surchargePercent) ||
                other.surchargePercent == surchargePercent) &&
            (identical(other.lastSyncedAt, lastSyncedAt) ||
                other.lastSyncedAt == lastSyncedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, provider, isActive,
      autoAcceptOrders, surchargePercent, lastSyncedAt);

  /// Create a copy of DeliveryChannelConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeliveryChannelConfigImplCopyWith<_$DeliveryChannelConfigImpl>
      get copyWith => __$$DeliveryChannelConfigImplCopyWithImpl<
          _$DeliveryChannelConfigImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DeliveryChannelConfigImplToJson(
      this,
    );
  }
}

abstract class _DeliveryChannelConfig implements DeliveryChannelConfig {
  const factory _DeliveryChannelConfig(
      {required final String id,
      required final DeliveryProvider provider,
      final bool isActive,
      final bool autoAcceptOrders,
      final double surchargePercent,
      final DateTime? lastSyncedAt}) = _$DeliveryChannelConfigImpl;

  factory _DeliveryChannelConfig.fromJson(Map<String, dynamic> json) =
      _$DeliveryChannelConfigImpl.fromJson;

  @override
  String get id; // e.g., 'uber-eats-001'
  @override
  DeliveryProvider get provider;
  @override
  bool get isActive;
  @override
  bool get autoAcceptOrders;
  @override
  double get surchargePercent; // e.g., 20.0 for 20% markup
  @override
  DateTime? get lastSyncedAt;

  /// Create a copy of DeliveryChannelConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeliveryChannelConfigImplCopyWith<_$DeliveryChannelConfigImpl>
      get copyWith => throw _privateConstructorUsedError;
}
