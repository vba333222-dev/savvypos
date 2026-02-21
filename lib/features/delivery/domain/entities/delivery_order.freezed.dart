// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'delivery_order.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DeliveryOrder _$DeliveryOrderFromJson(Map<String, dynamic> json) {
  return _DeliveryOrder.fromJson(json);
}

/// @nodoc
mixin _$DeliveryOrder {
  String get deliveryUuid =>
      throw _privateConstructorUsedError; // Unique ID within Savvy for this delivery request
  String get externalOrderId =>
      throw _privateConstructorUsedError; // The ID from Gojek/Grab
  DeliveryChannel get channel => throw _privateConstructorUsedError;
  DeliveryStatus get status => throw _privateConstructorUsedError;
  double get deliveryFee => throw _privateConstructorUsedError;
  double get packagingFee => throw _privateConstructorUsedError;
  DriverDetails? get driverDetails =>
      throw _privateConstructorUsedError; // Internal Order Reference
// Since Savvy relies heavily on OrderTableData internally, we store the UUID
// that connects this delivery request to a real, fulfilled transaction.
  String? get internalOrderUuid =>
      throw _privateConstructorUsedError; // Instead of directly wrapping the whole SQL row in a Freezed class,
// we use @JsonKey(includeFromJson: false, includeToJson: false) to keep the object in memory when queried.
  @JsonKey(includeFromJson: false, includeToJson: false)
  OrderTableData? get internalOrder => throw _privateConstructorUsedError;

  /// Serializes this DeliveryOrder to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DeliveryOrder
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DeliveryOrderCopyWith<DeliveryOrder> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeliveryOrderCopyWith<$Res> {
  factory $DeliveryOrderCopyWith(
          DeliveryOrder value, $Res Function(DeliveryOrder) then) =
      _$DeliveryOrderCopyWithImpl<$Res, DeliveryOrder>;
  @useResult
  $Res call(
      {String deliveryUuid,
      String externalOrderId,
      DeliveryChannel channel,
      DeliveryStatus status,
      double deliveryFee,
      double packagingFee,
      DriverDetails? driverDetails,
      String? internalOrderUuid,
      @JsonKey(includeFromJson: false, includeToJson: false)
      OrderTableData? internalOrder});

  $DriverDetailsCopyWith<$Res>? get driverDetails;
}

/// @nodoc
class _$DeliveryOrderCopyWithImpl<$Res, $Val extends DeliveryOrder>
    implements $DeliveryOrderCopyWith<$Res> {
  _$DeliveryOrderCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DeliveryOrder
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? deliveryUuid = null,
    Object? externalOrderId = null,
    Object? channel = null,
    Object? status = null,
    Object? deliveryFee = null,
    Object? packagingFee = null,
    Object? driverDetails = freezed,
    Object? internalOrderUuid = freezed,
    Object? internalOrder = freezed,
  }) {
    return _then(_value.copyWith(
      deliveryUuid: null == deliveryUuid
          ? _value.deliveryUuid
          : deliveryUuid // ignore: cast_nullable_to_non_nullable
              as String,
      externalOrderId: null == externalOrderId
          ? _value.externalOrderId
          : externalOrderId // ignore: cast_nullable_to_non_nullable
              as String,
      channel: null == channel
          ? _value.channel
          : channel // ignore: cast_nullable_to_non_nullable
              as DeliveryChannel,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as DeliveryStatus,
      deliveryFee: null == deliveryFee
          ? _value.deliveryFee
          : deliveryFee // ignore: cast_nullable_to_non_nullable
              as double,
      packagingFee: null == packagingFee
          ? _value.packagingFee
          : packagingFee // ignore: cast_nullable_to_non_nullable
              as double,
      driverDetails: freezed == driverDetails
          ? _value.driverDetails
          : driverDetails // ignore: cast_nullable_to_non_nullable
              as DriverDetails?,
      internalOrderUuid: freezed == internalOrderUuid
          ? _value.internalOrderUuid
          : internalOrderUuid // ignore: cast_nullable_to_non_nullable
              as String?,
      internalOrder: freezed == internalOrder
          ? _value.internalOrder
          : internalOrder // ignore: cast_nullable_to_non_nullable
              as OrderTableData?,
    ) as $Val);
  }

  /// Create a copy of DeliveryOrder
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DriverDetailsCopyWith<$Res>? get driverDetails {
    if (_value.driverDetails == null) {
      return null;
    }

    return $DriverDetailsCopyWith<$Res>(_value.driverDetails!, (value) {
      return _then(_value.copyWith(driverDetails: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DeliveryOrderImplCopyWith<$Res>
    implements $DeliveryOrderCopyWith<$Res> {
  factory _$$DeliveryOrderImplCopyWith(
          _$DeliveryOrderImpl value, $Res Function(_$DeliveryOrderImpl) then) =
      __$$DeliveryOrderImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String deliveryUuid,
      String externalOrderId,
      DeliveryChannel channel,
      DeliveryStatus status,
      double deliveryFee,
      double packagingFee,
      DriverDetails? driverDetails,
      String? internalOrderUuid,
      @JsonKey(includeFromJson: false, includeToJson: false)
      OrderTableData? internalOrder});

  @override
  $DriverDetailsCopyWith<$Res>? get driverDetails;
}

/// @nodoc
class __$$DeliveryOrderImplCopyWithImpl<$Res>
    extends _$DeliveryOrderCopyWithImpl<$Res, _$DeliveryOrderImpl>
    implements _$$DeliveryOrderImplCopyWith<$Res> {
  __$$DeliveryOrderImplCopyWithImpl(
      _$DeliveryOrderImpl _value, $Res Function(_$DeliveryOrderImpl) _then)
      : super(_value, _then);

  /// Create a copy of DeliveryOrder
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? deliveryUuid = null,
    Object? externalOrderId = null,
    Object? channel = null,
    Object? status = null,
    Object? deliveryFee = null,
    Object? packagingFee = null,
    Object? driverDetails = freezed,
    Object? internalOrderUuid = freezed,
    Object? internalOrder = freezed,
  }) {
    return _then(_$DeliveryOrderImpl(
      deliveryUuid: null == deliveryUuid
          ? _value.deliveryUuid
          : deliveryUuid // ignore: cast_nullable_to_non_nullable
              as String,
      externalOrderId: null == externalOrderId
          ? _value.externalOrderId
          : externalOrderId // ignore: cast_nullable_to_non_nullable
              as String,
      channel: null == channel
          ? _value.channel
          : channel // ignore: cast_nullable_to_non_nullable
              as DeliveryChannel,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as DeliveryStatus,
      deliveryFee: null == deliveryFee
          ? _value.deliveryFee
          : deliveryFee // ignore: cast_nullable_to_non_nullable
              as double,
      packagingFee: null == packagingFee
          ? _value.packagingFee
          : packagingFee // ignore: cast_nullable_to_non_nullable
              as double,
      driverDetails: freezed == driverDetails
          ? _value.driverDetails
          : driverDetails // ignore: cast_nullable_to_non_nullable
              as DriverDetails?,
      internalOrderUuid: freezed == internalOrderUuid
          ? _value.internalOrderUuid
          : internalOrderUuid // ignore: cast_nullable_to_non_nullable
              as String?,
      internalOrder: freezed == internalOrder
          ? _value.internalOrder
          : internalOrder // ignore: cast_nullable_to_non_nullable
              as OrderTableData?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DeliveryOrderImpl implements _DeliveryOrder {
  const _$DeliveryOrderImpl(
      {required this.deliveryUuid,
      required this.externalOrderId,
      required this.channel,
      this.status = DeliveryStatus.newUnaccepted,
      this.deliveryFee = 0.0,
      this.packagingFee = 0.0,
      this.driverDetails,
      this.internalOrderUuid,
      @JsonKey(includeFromJson: false, includeToJson: false)
      this.internalOrder});

  factory _$DeliveryOrderImpl.fromJson(Map<String, dynamic> json) =>
      _$$DeliveryOrderImplFromJson(json);

  @override
  final String deliveryUuid;
// Unique ID within Savvy for this delivery request
  @override
  final String externalOrderId;
// The ID from Gojek/Grab
  @override
  final DeliveryChannel channel;
  @override
  @JsonKey()
  final DeliveryStatus status;
  @override
  @JsonKey()
  final double deliveryFee;
  @override
  @JsonKey()
  final double packagingFee;
  @override
  final DriverDetails? driverDetails;
// Internal Order Reference
// Since Savvy relies heavily on OrderTableData internally, we store the UUID
// that connects this delivery request to a real, fulfilled transaction.
  @override
  final String? internalOrderUuid;
// Instead of directly wrapping the whole SQL row in a Freezed class,
// we use @JsonKey(includeFromJson: false, includeToJson: false) to keep the object in memory when queried.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  final OrderTableData? internalOrder;

  @override
  String toString() {
    return 'DeliveryOrder(deliveryUuid: $deliveryUuid, externalOrderId: $externalOrderId, channel: $channel, status: $status, deliveryFee: $deliveryFee, packagingFee: $packagingFee, driverDetails: $driverDetails, internalOrderUuid: $internalOrderUuid, internalOrder: $internalOrder)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeliveryOrderImpl &&
            (identical(other.deliveryUuid, deliveryUuid) ||
                other.deliveryUuid == deliveryUuid) &&
            (identical(other.externalOrderId, externalOrderId) ||
                other.externalOrderId == externalOrderId) &&
            (identical(other.channel, channel) || other.channel == channel) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.deliveryFee, deliveryFee) ||
                other.deliveryFee == deliveryFee) &&
            (identical(other.packagingFee, packagingFee) ||
                other.packagingFee == packagingFee) &&
            (identical(other.driverDetails, driverDetails) ||
                other.driverDetails == driverDetails) &&
            (identical(other.internalOrderUuid, internalOrderUuid) ||
                other.internalOrderUuid == internalOrderUuid) &&
            const DeepCollectionEquality()
                .equals(other.internalOrder, internalOrder));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      deliveryUuid,
      externalOrderId,
      channel,
      status,
      deliveryFee,
      packagingFee,
      driverDetails,
      internalOrderUuid,
      const DeepCollectionEquality().hash(internalOrder));

  /// Create a copy of DeliveryOrder
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeliveryOrderImplCopyWith<_$DeliveryOrderImpl> get copyWith =>
      __$$DeliveryOrderImplCopyWithImpl<_$DeliveryOrderImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DeliveryOrderImplToJson(
      this,
    );
  }
}

abstract class _DeliveryOrder implements DeliveryOrder {
  const factory _DeliveryOrder(
      {required final String deliveryUuid,
      required final String externalOrderId,
      required final DeliveryChannel channel,
      final DeliveryStatus status,
      final double deliveryFee,
      final double packagingFee,
      final DriverDetails? driverDetails,
      final String? internalOrderUuid,
      @JsonKey(includeFromJson: false, includeToJson: false)
      final OrderTableData? internalOrder}) = _$DeliveryOrderImpl;

  factory _DeliveryOrder.fromJson(Map<String, dynamic> json) =
      _$DeliveryOrderImpl.fromJson;

  @override
  String get deliveryUuid; // Unique ID within Savvy for this delivery request
  @override
  String get externalOrderId; // The ID from Gojek/Grab
  @override
  DeliveryChannel get channel;
  @override
  DeliveryStatus get status;
  @override
  double get deliveryFee;
  @override
  double get packagingFee;
  @override
  DriverDetails? get driverDetails; // Internal Order Reference
// Since Savvy relies heavily on OrderTableData internally, we store the UUID
// that connects this delivery request to a real, fulfilled transaction.
  @override
  String?
      get internalOrderUuid; // Instead of directly wrapping the whole SQL row in a Freezed class,
// we use @JsonKey(includeFromJson: false, includeToJson: false) to keep the object in memory when queried.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  OrderTableData? get internalOrder;

  /// Create a copy of DeliveryOrder
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeliveryOrderImplCopyWith<_$DeliveryOrderImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
