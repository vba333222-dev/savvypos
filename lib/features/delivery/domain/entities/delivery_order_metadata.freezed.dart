// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'delivery_order_metadata.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DeliveryOrderMetadata _$DeliveryOrderMetadataFromJson(
    Map<String, dynamic> json) {
  return _DeliveryOrderMetadata.fromJson(json);
}

/// @nodoc
mixin _$DeliveryOrderMetadata {
  String get orderUuid =>
      throw _privateConstructorUsedError; // Link to core Order
  DeliveryProvider get provider => throw _privateConstructorUsedError;
  String get externalOrderId =>
      throw _privateConstructorUsedError; // e.g., "#8839" from Uber
  String? get driverName => throw _privateConstructorUsedError;
  String? get driverPhone => throw _privateConstructorUsedError;
  String? get driverPlate => throw _privateConstructorUsedError;
  DateTime? get pickupTime => throw _privateConstructorUsedError;
  String get deliveryStatus => throw _privateConstructorUsedError;

  /// Serializes this DeliveryOrderMetadata to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DeliveryOrderMetadata
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DeliveryOrderMetadataCopyWith<DeliveryOrderMetadata> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeliveryOrderMetadataCopyWith<$Res> {
  factory $DeliveryOrderMetadataCopyWith(DeliveryOrderMetadata value,
          $Res Function(DeliveryOrderMetadata) then) =
      _$DeliveryOrderMetadataCopyWithImpl<$Res, DeliveryOrderMetadata>;
  @useResult
  $Res call(
      {String orderUuid,
      DeliveryProvider provider,
      String externalOrderId,
      String? driverName,
      String? driverPhone,
      String? driverPlate,
      DateTime? pickupTime,
      String deliveryStatus});
}

/// @nodoc
class _$DeliveryOrderMetadataCopyWithImpl<$Res,
        $Val extends DeliveryOrderMetadata>
    implements $DeliveryOrderMetadataCopyWith<$Res> {
  _$DeliveryOrderMetadataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DeliveryOrderMetadata
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderUuid = null,
    Object? provider = null,
    Object? externalOrderId = null,
    Object? driverName = freezed,
    Object? driverPhone = freezed,
    Object? driverPlate = freezed,
    Object? pickupTime = freezed,
    Object? deliveryStatus = null,
  }) {
    return _then(_value.copyWith(
      orderUuid: null == orderUuid
          ? _value.orderUuid
          : orderUuid // ignore: cast_nullable_to_non_nullable
              as String,
      provider: null == provider
          ? _value.provider
          : provider // ignore: cast_nullable_to_non_nullable
              as DeliveryProvider,
      externalOrderId: null == externalOrderId
          ? _value.externalOrderId
          : externalOrderId // ignore: cast_nullable_to_non_nullable
              as String,
      driverName: freezed == driverName
          ? _value.driverName
          : driverName // ignore: cast_nullable_to_non_nullable
              as String?,
      driverPhone: freezed == driverPhone
          ? _value.driverPhone
          : driverPhone // ignore: cast_nullable_to_non_nullable
              as String?,
      driverPlate: freezed == driverPlate
          ? _value.driverPlate
          : driverPlate // ignore: cast_nullable_to_non_nullable
              as String?,
      pickupTime: freezed == pickupTime
          ? _value.pickupTime
          : pickupTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      deliveryStatus: null == deliveryStatus
          ? _value.deliveryStatus
          : deliveryStatus // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DeliveryOrderMetadataImplCopyWith<$Res>
    implements $DeliveryOrderMetadataCopyWith<$Res> {
  factory _$$DeliveryOrderMetadataImplCopyWith(
          _$DeliveryOrderMetadataImpl value,
          $Res Function(_$DeliveryOrderMetadataImpl) then) =
      __$$DeliveryOrderMetadataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String orderUuid,
      DeliveryProvider provider,
      String externalOrderId,
      String? driverName,
      String? driverPhone,
      String? driverPlate,
      DateTime? pickupTime,
      String deliveryStatus});
}

/// @nodoc
class __$$DeliveryOrderMetadataImplCopyWithImpl<$Res>
    extends _$DeliveryOrderMetadataCopyWithImpl<$Res,
        _$DeliveryOrderMetadataImpl>
    implements _$$DeliveryOrderMetadataImplCopyWith<$Res> {
  __$$DeliveryOrderMetadataImplCopyWithImpl(_$DeliveryOrderMetadataImpl _value,
      $Res Function(_$DeliveryOrderMetadataImpl) _then)
      : super(_value, _then);

  /// Create a copy of DeliveryOrderMetadata
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderUuid = null,
    Object? provider = null,
    Object? externalOrderId = null,
    Object? driverName = freezed,
    Object? driverPhone = freezed,
    Object? driverPlate = freezed,
    Object? pickupTime = freezed,
    Object? deliveryStatus = null,
  }) {
    return _then(_$DeliveryOrderMetadataImpl(
      orderUuid: null == orderUuid
          ? _value.orderUuid
          : orderUuid // ignore: cast_nullable_to_non_nullable
              as String,
      provider: null == provider
          ? _value.provider
          : provider // ignore: cast_nullable_to_non_nullable
              as DeliveryProvider,
      externalOrderId: null == externalOrderId
          ? _value.externalOrderId
          : externalOrderId // ignore: cast_nullable_to_non_nullable
              as String,
      driverName: freezed == driverName
          ? _value.driverName
          : driverName // ignore: cast_nullable_to_non_nullable
              as String?,
      driverPhone: freezed == driverPhone
          ? _value.driverPhone
          : driverPhone // ignore: cast_nullable_to_non_nullable
              as String?,
      driverPlate: freezed == driverPlate
          ? _value.driverPlate
          : driverPlate // ignore: cast_nullable_to_non_nullable
              as String?,
      pickupTime: freezed == pickupTime
          ? _value.pickupTime
          : pickupTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      deliveryStatus: null == deliveryStatus
          ? _value.deliveryStatus
          : deliveryStatus // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DeliveryOrderMetadataImpl implements _DeliveryOrderMetadata {
  const _$DeliveryOrderMetadataImpl(
      {required this.orderUuid,
      required this.provider,
      required this.externalOrderId,
      this.driverName,
      this.driverPhone,
      this.driverPlate,
      this.pickupTime,
      this.deliveryStatus = 'NEW'});

  factory _$DeliveryOrderMetadataImpl.fromJson(Map<String, dynamic> json) =>
      _$$DeliveryOrderMetadataImplFromJson(json);

  @override
  final String orderUuid;
// Link to core Order
  @override
  final DeliveryProvider provider;
  @override
  final String externalOrderId;
// e.g., "#8839" from Uber
  @override
  final String? driverName;
  @override
  final String? driverPhone;
  @override
  final String? driverPlate;
  @override
  final DateTime? pickupTime;
  @override
  @JsonKey()
  final String deliveryStatus;

  @override
  String toString() {
    return 'DeliveryOrderMetadata(orderUuid: $orderUuid, provider: $provider, externalOrderId: $externalOrderId, driverName: $driverName, driverPhone: $driverPhone, driverPlate: $driverPlate, pickupTime: $pickupTime, deliveryStatus: $deliveryStatus)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeliveryOrderMetadataImpl &&
            (identical(other.orderUuid, orderUuid) ||
                other.orderUuid == orderUuid) &&
            (identical(other.provider, provider) ||
                other.provider == provider) &&
            (identical(other.externalOrderId, externalOrderId) ||
                other.externalOrderId == externalOrderId) &&
            (identical(other.driverName, driverName) ||
                other.driverName == driverName) &&
            (identical(other.driverPhone, driverPhone) ||
                other.driverPhone == driverPhone) &&
            (identical(other.driverPlate, driverPlate) ||
                other.driverPlate == driverPlate) &&
            (identical(other.pickupTime, pickupTime) ||
                other.pickupTime == pickupTime) &&
            (identical(other.deliveryStatus, deliveryStatus) ||
                other.deliveryStatus == deliveryStatus));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      orderUuid,
      provider,
      externalOrderId,
      driverName,
      driverPhone,
      driverPlate,
      pickupTime,
      deliveryStatus);

  /// Create a copy of DeliveryOrderMetadata
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeliveryOrderMetadataImplCopyWith<_$DeliveryOrderMetadataImpl>
      get copyWith => __$$DeliveryOrderMetadataImplCopyWithImpl<
          _$DeliveryOrderMetadataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DeliveryOrderMetadataImplToJson(
      this,
    );
  }
}

abstract class _DeliveryOrderMetadata implements DeliveryOrderMetadata {
  const factory _DeliveryOrderMetadata(
      {required final String orderUuid,
      required final DeliveryProvider provider,
      required final String externalOrderId,
      final String? driverName,
      final String? driverPhone,
      final String? driverPlate,
      final DateTime? pickupTime,
      final String deliveryStatus}) = _$DeliveryOrderMetadataImpl;

  factory _DeliveryOrderMetadata.fromJson(Map<String, dynamic> json) =
      _$DeliveryOrderMetadataImpl.fromJson;

  @override
  String get orderUuid; // Link to core Order
  @override
  DeliveryProvider get provider;
  @override
  String get externalOrderId; // e.g., "#8839" from Uber
  @override
  String? get driverName;
  @override
  String? get driverPhone;
  @override
  String? get driverPlate;
  @override
  DateTime? get pickupTime;
  @override
  String get deliveryStatus;

  /// Create a copy of DeliveryOrderMetadata
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeliveryOrderMetadataImplCopyWith<_$DeliveryOrderMetadataImpl>
      get copyWith => throw _privateConstructorUsedError;
}
