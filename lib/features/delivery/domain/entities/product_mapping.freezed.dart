// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_mapping.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ProductMapping _$ProductMappingFromJson(Map<String, dynamic> json) {
  return _ProductMapping.fromJson(json);
}

/// @nodoc
mixin _$ProductMapping {
  String get externalItemRef => throw _privateConstructorUsedError;
  String get internalProductId => throw _privateConstructorUsedError;
  DeliveryChannel get channel => throw _privateConstructorUsedError;

  /// Serializes this ProductMapping to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProductMapping
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProductMappingCopyWith<ProductMapping> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductMappingCopyWith<$Res> {
  factory $ProductMappingCopyWith(
          ProductMapping value, $Res Function(ProductMapping) then) =
      _$ProductMappingCopyWithImpl<$Res, ProductMapping>;
  @useResult
  $Res call(
      {String externalItemRef,
      String internalProductId,
      DeliveryChannel channel});
}

/// @nodoc
class _$ProductMappingCopyWithImpl<$Res, $Val extends ProductMapping>
    implements $ProductMappingCopyWith<$Res> {
  _$ProductMappingCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProductMapping
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? externalItemRef = null,
    Object? internalProductId = null,
    Object? channel = null,
  }) {
    return _then(_value.copyWith(
      externalItemRef: null == externalItemRef
          ? _value.externalItemRef
          : externalItemRef // ignore: cast_nullable_to_non_nullable
              as String,
      internalProductId: null == internalProductId
          ? _value.internalProductId
          : internalProductId // ignore: cast_nullable_to_non_nullable
              as String,
      channel: null == channel
          ? _value.channel
          : channel // ignore: cast_nullable_to_non_nullable
              as DeliveryChannel,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProductMappingImplCopyWith<$Res>
    implements $ProductMappingCopyWith<$Res> {
  factory _$$ProductMappingImplCopyWith(_$ProductMappingImpl value,
          $Res Function(_$ProductMappingImpl) then) =
      __$$ProductMappingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String externalItemRef,
      String internalProductId,
      DeliveryChannel channel});
}

/// @nodoc
class __$$ProductMappingImplCopyWithImpl<$Res>
    extends _$ProductMappingCopyWithImpl<$Res, _$ProductMappingImpl>
    implements _$$ProductMappingImplCopyWith<$Res> {
  __$$ProductMappingImplCopyWithImpl(
      _$ProductMappingImpl _value, $Res Function(_$ProductMappingImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProductMapping
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? externalItemRef = null,
    Object? internalProductId = null,
    Object? channel = null,
  }) {
    return _then(_$ProductMappingImpl(
      externalItemRef: null == externalItemRef
          ? _value.externalItemRef
          : externalItemRef // ignore: cast_nullable_to_non_nullable
              as String,
      internalProductId: null == internalProductId
          ? _value.internalProductId
          : internalProductId // ignore: cast_nullable_to_non_nullable
              as String,
      channel: null == channel
          ? _value.channel
          : channel // ignore: cast_nullable_to_non_nullable
              as DeliveryChannel,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProductMappingImpl implements _ProductMapping {
  const _$ProductMappingImpl(
      {required this.externalItemRef,
      required this.internalProductId,
      required this.channel});

  factory _$ProductMappingImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductMappingImplFromJson(json);

  @override
  final String externalItemRef;
  @override
  final String internalProductId;
  @override
  final DeliveryChannel channel;

  @override
  String toString() {
    return 'ProductMapping(externalItemRef: $externalItemRef, internalProductId: $internalProductId, channel: $channel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductMappingImpl &&
            (identical(other.externalItemRef, externalItemRef) ||
                other.externalItemRef == externalItemRef) &&
            (identical(other.internalProductId, internalProductId) ||
                other.internalProductId == internalProductId) &&
            (identical(other.channel, channel) || other.channel == channel));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, externalItemRef, internalProductId, channel);

  /// Create a copy of ProductMapping
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductMappingImplCopyWith<_$ProductMappingImpl> get copyWith =>
      __$$ProductMappingImplCopyWithImpl<_$ProductMappingImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductMappingImplToJson(
      this,
    );
  }
}

abstract class _ProductMapping implements ProductMapping {
  const factory _ProductMapping(
      {required final String externalItemRef,
      required final String internalProductId,
      required final DeliveryChannel channel}) = _$ProductMappingImpl;

  factory _ProductMapping.fromJson(Map<String, dynamic> json) =
      _$ProductMappingImpl.fromJson;

  @override
  String get externalItemRef;
  @override
  String get internalProductId;
  @override
  DeliveryChannel get channel;

  /// Create a copy of ProductMapping
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProductMappingImplCopyWith<_$ProductMappingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
