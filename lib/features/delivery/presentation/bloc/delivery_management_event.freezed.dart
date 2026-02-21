// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'delivery_management_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DeliveryManagementEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DeliveryOrder order) incomingOrderReceived,
    required TResult Function(String deliveryUuid) acceptOrder,
    required TResult Function(String deliveryUuid, String reason) rejectOrder,
    required TResult Function(bool isAuto) toggleAutoAccept,
    required TResult Function() loadPendingOrders,
    required TResult Function(String deliveryUuid) markOrderReady,
    required TResult Function(String deliveryUuid) completeOrder,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DeliveryOrder order)? incomingOrderReceived,
    TResult? Function(String deliveryUuid)? acceptOrder,
    TResult? Function(String deliveryUuid, String reason)? rejectOrder,
    TResult? Function(bool isAuto)? toggleAutoAccept,
    TResult? Function()? loadPendingOrders,
    TResult? Function(String deliveryUuid)? markOrderReady,
    TResult? Function(String deliveryUuid)? completeOrder,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DeliveryOrder order)? incomingOrderReceived,
    TResult Function(String deliveryUuid)? acceptOrder,
    TResult Function(String deliveryUuid, String reason)? rejectOrder,
    TResult Function(bool isAuto)? toggleAutoAccept,
    TResult Function()? loadPendingOrders,
    TResult Function(String deliveryUuid)? markOrderReady,
    TResult Function(String deliveryUuid)? completeOrder,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(IncomingOrderReceived value)
        incomingOrderReceived,
    required TResult Function(AcceptOrder value) acceptOrder,
    required TResult Function(RejectOrder value) rejectOrder,
    required TResult Function(ToggleAutoAccept value) toggleAutoAccept,
    required TResult Function(LoadPendingOrders value) loadPendingOrders,
    required TResult Function(MarkOrderReady value) markOrderReady,
    required TResult Function(CompleteOrder value) completeOrder,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(IncomingOrderReceived value)? incomingOrderReceived,
    TResult? Function(AcceptOrder value)? acceptOrder,
    TResult? Function(RejectOrder value)? rejectOrder,
    TResult? Function(ToggleAutoAccept value)? toggleAutoAccept,
    TResult? Function(LoadPendingOrders value)? loadPendingOrders,
    TResult? Function(MarkOrderReady value)? markOrderReady,
    TResult? Function(CompleteOrder value)? completeOrder,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(IncomingOrderReceived value)? incomingOrderReceived,
    TResult Function(AcceptOrder value)? acceptOrder,
    TResult Function(RejectOrder value)? rejectOrder,
    TResult Function(ToggleAutoAccept value)? toggleAutoAccept,
    TResult Function(LoadPendingOrders value)? loadPendingOrders,
    TResult Function(MarkOrderReady value)? markOrderReady,
    TResult Function(CompleteOrder value)? completeOrder,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeliveryManagementEventCopyWith<$Res> {
  factory $DeliveryManagementEventCopyWith(DeliveryManagementEvent value,
          $Res Function(DeliveryManagementEvent) then) =
      _$DeliveryManagementEventCopyWithImpl<$Res, DeliveryManagementEvent>;
}

/// @nodoc
class _$DeliveryManagementEventCopyWithImpl<$Res,
        $Val extends DeliveryManagementEvent>
    implements $DeliveryManagementEventCopyWith<$Res> {
  _$DeliveryManagementEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DeliveryManagementEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$IncomingOrderReceivedImplCopyWith<$Res> {
  factory _$$IncomingOrderReceivedImplCopyWith(
          _$IncomingOrderReceivedImpl value,
          $Res Function(_$IncomingOrderReceivedImpl) then) =
      __$$IncomingOrderReceivedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({DeliveryOrder order});

  $DeliveryOrderCopyWith<$Res> get order;
}

/// @nodoc
class __$$IncomingOrderReceivedImplCopyWithImpl<$Res>
    extends _$DeliveryManagementEventCopyWithImpl<$Res,
        _$IncomingOrderReceivedImpl>
    implements _$$IncomingOrderReceivedImplCopyWith<$Res> {
  __$$IncomingOrderReceivedImplCopyWithImpl(_$IncomingOrderReceivedImpl _value,
      $Res Function(_$IncomingOrderReceivedImpl) _then)
      : super(_value, _then);

  /// Create a copy of DeliveryManagementEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? order = null,
  }) {
    return _then(_$IncomingOrderReceivedImpl(
      null == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as DeliveryOrder,
    ));
  }

  /// Create a copy of DeliveryManagementEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DeliveryOrderCopyWith<$Res> get order {
    return $DeliveryOrderCopyWith<$Res>(_value.order, (value) {
      return _then(_value.copyWith(order: value));
    });
  }
}

/// @nodoc

class _$IncomingOrderReceivedImpl implements IncomingOrderReceived {
  const _$IncomingOrderReceivedImpl(this.order);

  @override
  final DeliveryOrder order;

  @override
  String toString() {
    return 'DeliveryManagementEvent.incomingOrderReceived(order: $order)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IncomingOrderReceivedImpl &&
            (identical(other.order, order) || other.order == order));
  }

  @override
  int get hashCode => Object.hash(runtimeType, order);

  /// Create a copy of DeliveryManagementEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$IncomingOrderReceivedImplCopyWith<_$IncomingOrderReceivedImpl>
      get copyWith => __$$IncomingOrderReceivedImplCopyWithImpl<
          _$IncomingOrderReceivedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DeliveryOrder order) incomingOrderReceived,
    required TResult Function(String deliveryUuid) acceptOrder,
    required TResult Function(String deliveryUuid, String reason) rejectOrder,
    required TResult Function(bool isAuto) toggleAutoAccept,
    required TResult Function() loadPendingOrders,
    required TResult Function(String deliveryUuid) markOrderReady,
    required TResult Function(String deliveryUuid) completeOrder,
  }) {
    return incomingOrderReceived(order);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DeliveryOrder order)? incomingOrderReceived,
    TResult? Function(String deliveryUuid)? acceptOrder,
    TResult? Function(String deliveryUuid, String reason)? rejectOrder,
    TResult? Function(bool isAuto)? toggleAutoAccept,
    TResult? Function()? loadPendingOrders,
    TResult? Function(String deliveryUuid)? markOrderReady,
    TResult? Function(String deliveryUuid)? completeOrder,
  }) {
    return incomingOrderReceived?.call(order);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DeliveryOrder order)? incomingOrderReceived,
    TResult Function(String deliveryUuid)? acceptOrder,
    TResult Function(String deliveryUuid, String reason)? rejectOrder,
    TResult Function(bool isAuto)? toggleAutoAccept,
    TResult Function()? loadPendingOrders,
    TResult Function(String deliveryUuid)? markOrderReady,
    TResult Function(String deliveryUuid)? completeOrder,
    required TResult orElse(),
  }) {
    if (incomingOrderReceived != null) {
      return incomingOrderReceived(order);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(IncomingOrderReceived value)
        incomingOrderReceived,
    required TResult Function(AcceptOrder value) acceptOrder,
    required TResult Function(RejectOrder value) rejectOrder,
    required TResult Function(ToggleAutoAccept value) toggleAutoAccept,
    required TResult Function(LoadPendingOrders value) loadPendingOrders,
    required TResult Function(MarkOrderReady value) markOrderReady,
    required TResult Function(CompleteOrder value) completeOrder,
  }) {
    return incomingOrderReceived(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(IncomingOrderReceived value)? incomingOrderReceived,
    TResult? Function(AcceptOrder value)? acceptOrder,
    TResult? Function(RejectOrder value)? rejectOrder,
    TResult? Function(ToggleAutoAccept value)? toggleAutoAccept,
    TResult? Function(LoadPendingOrders value)? loadPendingOrders,
    TResult? Function(MarkOrderReady value)? markOrderReady,
    TResult? Function(CompleteOrder value)? completeOrder,
  }) {
    return incomingOrderReceived?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(IncomingOrderReceived value)? incomingOrderReceived,
    TResult Function(AcceptOrder value)? acceptOrder,
    TResult Function(RejectOrder value)? rejectOrder,
    TResult Function(ToggleAutoAccept value)? toggleAutoAccept,
    TResult Function(LoadPendingOrders value)? loadPendingOrders,
    TResult Function(MarkOrderReady value)? markOrderReady,
    TResult Function(CompleteOrder value)? completeOrder,
    required TResult orElse(),
  }) {
    if (incomingOrderReceived != null) {
      return incomingOrderReceived(this);
    }
    return orElse();
  }
}

abstract class IncomingOrderReceived implements DeliveryManagementEvent {
  const factory IncomingOrderReceived(final DeliveryOrder order) =
      _$IncomingOrderReceivedImpl;

  DeliveryOrder get order;

  /// Create a copy of DeliveryManagementEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$IncomingOrderReceivedImplCopyWith<_$IncomingOrderReceivedImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AcceptOrderImplCopyWith<$Res> {
  factory _$$AcceptOrderImplCopyWith(
          _$AcceptOrderImpl value, $Res Function(_$AcceptOrderImpl) then) =
      __$$AcceptOrderImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String deliveryUuid});
}

/// @nodoc
class __$$AcceptOrderImplCopyWithImpl<$Res>
    extends _$DeliveryManagementEventCopyWithImpl<$Res, _$AcceptOrderImpl>
    implements _$$AcceptOrderImplCopyWith<$Res> {
  __$$AcceptOrderImplCopyWithImpl(
      _$AcceptOrderImpl _value, $Res Function(_$AcceptOrderImpl) _then)
      : super(_value, _then);

  /// Create a copy of DeliveryManagementEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? deliveryUuid = null,
  }) {
    return _then(_$AcceptOrderImpl(
      null == deliveryUuid
          ? _value.deliveryUuid
          : deliveryUuid // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$AcceptOrderImpl implements AcceptOrder {
  const _$AcceptOrderImpl(this.deliveryUuid);

  @override
  final String deliveryUuid;

  @override
  String toString() {
    return 'DeliveryManagementEvent.acceptOrder(deliveryUuid: $deliveryUuid)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AcceptOrderImpl &&
            (identical(other.deliveryUuid, deliveryUuid) ||
                other.deliveryUuid == deliveryUuid));
  }

  @override
  int get hashCode => Object.hash(runtimeType, deliveryUuid);

  /// Create a copy of DeliveryManagementEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AcceptOrderImplCopyWith<_$AcceptOrderImpl> get copyWith =>
      __$$AcceptOrderImplCopyWithImpl<_$AcceptOrderImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DeliveryOrder order) incomingOrderReceived,
    required TResult Function(String deliveryUuid) acceptOrder,
    required TResult Function(String deliveryUuid, String reason) rejectOrder,
    required TResult Function(bool isAuto) toggleAutoAccept,
    required TResult Function() loadPendingOrders,
    required TResult Function(String deliveryUuid) markOrderReady,
    required TResult Function(String deliveryUuid) completeOrder,
  }) {
    return acceptOrder(deliveryUuid);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DeliveryOrder order)? incomingOrderReceived,
    TResult? Function(String deliveryUuid)? acceptOrder,
    TResult? Function(String deliveryUuid, String reason)? rejectOrder,
    TResult? Function(bool isAuto)? toggleAutoAccept,
    TResult? Function()? loadPendingOrders,
    TResult? Function(String deliveryUuid)? markOrderReady,
    TResult? Function(String deliveryUuid)? completeOrder,
  }) {
    return acceptOrder?.call(deliveryUuid);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DeliveryOrder order)? incomingOrderReceived,
    TResult Function(String deliveryUuid)? acceptOrder,
    TResult Function(String deliveryUuid, String reason)? rejectOrder,
    TResult Function(bool isAuto)? toggleAutoAccept,
    TResult Function()? loadPendingOrders,
    TResult Function(String deliveryUuid)? markOrderReady,
    TResult Function(String deliveryUuid)? completeOrder,
    required TResult orElse(),
  }) {
    if (acceptOrder != null) {
      return acceptOrder(deliveryUuid);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(IncomingOrderReceived value)
        incomingOrderReceived,
    required TResult Function(AcceptOrder value) acceptOrder,
    required TResult Function(RejectOrder value) rejectOrder,
    required TResult Function(ToggleAutoAccept value) toggleAutoAccept,
    required TResult Function(LoadPendingOrders value) loadPendingOrders,
    required TResult Function(MarkOrderReady value) markOrderReady,
    required TResult Function(CompleteOrder value) completeOrder,
  }) {
    return acceptOrder(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(IncomingOrderReceived value)? incomingOrderReceived,
    TResult? Function(AcceptOrder value)? acceptOrder,
    TResult? Function(RejectOrder value)? rejectOrder,
    TResult? Function(ToggleAutoAccept value)? toggleAutoAccept,
    TResult? Function(LoadPendingOrders value)? loadPendingOrders,
    TResult? Function(MarkOrderReady value)? markOrderReady,
    TResult? Function(CompleteOrder value)? completeOrder,
  }) {
    return acceptOrder?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(IncomingOrderReceived value)? incomingOrderReceived,
    TResult Function(AcceptOrder value)? acceptOrder,
    TResult Function(RejectOrder value)? rejectOrder,
    TResult Function(ToggleAutoAccept value)? toggleAutoAccept,
    TResult Function(LoadPendingOrders value)? loadPendingOrders,
    TResult Function(MarkOrderReady value)? markOrderReady,
    TResult Function(CompleteOrder value)? completeOrder,
    required TResult orElse(),
  }) {
    if (acceptOrder != null) {
      return acceptOrder(this);
    }
    return orElse();
  }
}

abstract class AcceptOrder implements DeliveryManagementEvent {
  const factory AcceptOrder(final String deliveryUuid) = _$AcceptOrderImpl;

  String get deliveryUuid;

  /// Create a copy of DeliveryManagementEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AcceptOrderImplCopyWith<_$AcceptOrderImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RejectOrderImplCopyWith<$Res> {
  factory _$$RejectOrderImplCopyWith(
          _$RejectOrderImpl value, $Res Function(_$RejectOrderImpl) then) =
      __$$RejectOrderImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String deliveryUuid, String reason});
}

/// @nodoc
class __$$RejectOrderImplCopyWithImpl<$Res>
    extends _$DeliveryManagementEventCopyWithImpl<$Res, _$RejectOrderImpl>
    implements _$$RejectOrderImplCopyWith<$Res> {
  __$$RejectOrderImplCopyWithImpl(
      _$RejectOrderImpl _value, $Res Function(_$RejectOrderImpl) _then)
      : super(_value, _then);

  /// Create a copy of DeliveryManagementEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? deliveryUuid = null,
    Object? reason = null,
  }) {
    return _then(_$RejectOrderImpl(
      null == deliveryUuid
          ? _value.deliveryUuid
          : deliveryUuid // ignore: cast_nullable_to_non_nullable
              as String,
      null == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$RejectOrderImpl implements RejectOrder {
  const _$RejectOrderImpl(this.deliveryUuid, this.reason);

  @override
  final String deliveryUuid;
  @override
  final String reason;

  @override
  String toString() {
    return 'DeliveryManagementEvent.rejectOrder(deliveryUuid: $deliveryUuid, reason: $reason)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RejectOrderImpl &&
            (identical(other.deliveryUuid, deliveryUuid) ||
                other.deliveryUuid == deliveryUuid) &&
            (identical(other.reason, reason) || other.reason == reason));
  }

  @override
  int get hashCode => Object.hash(runtimeType, deliveryUuid, reason);

  /// Create a copy of DeliveryManagementEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RejectOrderImplCopyWith<_$RejectOrderImpl> get copyWith =>
      __$$RejectOrderImplCopyWithImpl<_$RejectOrderImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DeliveryOrder order) incomingOrderReceived,
    required TResult Function(String deliveryUuid) acceptOrder,
    required TResult Function(String deliveryUuid, String reason) rejectOrder,
    required TResult Function(bool isAuto) toggleAutoAccept,
    required TResult Function() loadPendingOrders,
    required TResult Function(String deliveryUuid) markOrderReady,
    required TResult Function(String deliveryUuid) completeOrder,
  }) {
    return rejectOrder(deliveryUuid, reason);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DeliveryOrder order)? incomingOrderReceived,
    TResult? Function(String deliveryUuid)? acceptOrder,
    TResult? Function(String deliveryUuid, String reason)? rejectOrder,
    TResult? Function(bool isAuto)? toggleAutoAccept,
    TResult? Function()? loadPendingOrders,
    TResult? Function(String deliveryUuid)? markOrderReady,
    TResult? Function(String deliveryUuid)? completeOrder,
  }) {
    return rejectOrder?.call(deliveryUuid, reason);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DeliveryOrder order)? incomingOrderReceived,
    TResult Function(String deliveryUuid)? acceptOrder,
    TResult Function(String deliveryUuid, String reason)? rejectOrder,
    TResult Function(bool isAuto)? toggleAutoAccept,
    TResult Function()? loadPendingOrders,
    TResult Function(String deliveryUuid)? markOrderReady,
    TResult Function(String deliveryUuid)? completeOrder,
    required TResult orElse(),
  }) {
    if (rejectOrder != null) {
      return rejectOrder(deliveryUuid, reason);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(IncomingOrderReceived value)
        incomingOrderReceived,
    required TResult Function(AcceptOrder value) acceptOrder,
    required TResult Function(RejectOrder value) rejectOrder,
    required TResult Function(ToggleAutoAccept value) toggleAutoAccept,
    required TResult Function(LoadPendingOrders value) loadPendingOrders,
    required TResult Function(MarkOrderReady value) markOrderReady,
    required TResult Function(CompleteOrder value) completeOrder,
  }) {
    return rejectOrder(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(IncomingOrderReceived value)? incomingOrderReceived,
    TResult? Function(AcceptOrder value)? acceptOrder,
    TResult? Function(RejectOrder value)? rejectOrder,
    TResult? Function(ToggleAutoAccept value)? toggleAutoAccept,
    TResult? Function(LoadPendingOrders value)? loadPendingOrders,
    TResult? Function(MarkOrderReady value)? markOrderReady,
    TResult? Function(CompleteOrder value)? completeOrder,
  }) {
    return rejectOrder?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(IncomingOrderReceived value)? incomingOrderReceived,
    TResult Function(AcceptOrder value)? acceptOrder,
    TResult Function(RejectOrder value)? rejectOrder,
    TResult Function(ToggleAutoAccept value)? toggleAutoAccept,
    TResult Function(LoadPendingOrders value)? loadPendingOrders,
    TResult Function(MarkOrderReady value)? markOrderReady,
    TResult Function(CompleteOrder value)? completeOrder,
    required TResult orElse(),
  }) {
    if (rejectOrder != null) {
      return rejectOrder(this);
    }
    return orElse();
  }
}

abstract class RejectOrder implements DeliveryManagementEvent {
  const factory RejectOrder(final String deliveryUuid, final String reason) =
      _$RejectOrderImpl;

  String get deliveryUuid;
  String get reason;

  /// Create a copy of DeliveryManagementEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RejectOrderImplCopyWith<_$RejectOrderImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ToggleAutoAcceptImplCopyWith<$Res> {
  factory _$$ToggleAutoAcceptImplCopyWith(_$ToggleAutoAcceptImpl value,
          $Res Function(_$ToggleAutoAcceptImpl) then) =
      __$$ToggleAutoAcceptImplCopyWithImpl<$Res>;
  @useResult
  $Res call({bool isAuto});
}

/// @nodoc
class __$$ToggleAutoAcceptImplCopyWithImpl<$Res>
    extends _$DeliveryManagementEventCopyWithImpl<$Res, _$ToggleAutoAcceptImpl>
    implements _$$ToggleAutoAcceptImplCopyWith<$Res> {
  __$$ToggleAutoAcceptImplCopyWithImpl(_$ToggleAutoAcceptImpl _value,
      $Res Function(_$ToggleAutoAcceptImpl) _then)
      : super(_value, _then);

  /// Create a copy of DeliveryManagementEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isAuto = null,
  }) {
    return _then(_$ToggleAutoAcceptImpl(
      null == isAuto
          ? _value.isAuto
          : isAuto // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$ToggleAutoAcceptImpl implements ToggleAutoAccept {
  const _$ToggleAutoAcceptImpl(this.isAuto);

  @override
  final bool isAuto;

  @override
  String toString() {
    return 'DeliveryManagementEvent.toggleAutoAccept(isAuto: $isAuto)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ToggleAutoAcceptImpl &&
            (identical(other.isAuto, isAuto) || other.isAuto == isAuto));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isAuto);

  /// Create a copy of DeliveryManagementEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ToggleAutoAcceptImplCopyWith<_$ToggleAutoAcceptImpl> get copyWith =>
      __$$ToggleAutoAcceptImplCopyWithImpl<_$ToggleAutoAcceptImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DeliveryOrder order) incomingOrderReceived,
    required TResult Function(String deliveryUuid) acceptOrder,
    required TResult Function(String deliveryUuid, String reason) rejectOrder,
    required TResult Function(bool isAuto) toggleAutoAccept,
    required TResult Function() loadPendingOrders,
    required TResult Function(String deliveryUuid) markOrderReady,
    required TResult Function(String deliveryUuid) completeOrder,
  }) {
    return toggleAutoAccept(isAuto);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DeliveryOrder order)? incomingOrderReceived,
    TResult? Function(String deliveryUuid)? acceptOrder,
    TResult? Function(String deliveryUuid, String reason)? rejectOrder,
    TResult? Function(bool isAuto)? toggleAutoAccept,
    TResult? Function()? loadPendingOrders,
    TResult? Function(String deliveryUuid)? markOrderReady,
    TResult? Function(String deliveryUuid)? completeOrder,
  }) {
    return toggleAutoAccept?.call(isAuto);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DeliveryOrder order)? incomingOrderReceived,
    TResult Function(String deliveryUuid)? acceptOrder,
    TResult Function(String deliveryUuid, String reason)? rejectOrder,
    TResult Function(bool isAuto)? toggleAutoAccept,
    TResult Function()? loadPendingOrders,
    TResult Function(String deliveryUuid)? markOrderReady,
    TResult Function(String deliveryUuid)? completeOrder,
    required TResult orElse(),
  }) {
    if (toggleAutoAccept != null) {
      return toggleAutoAccept(isAuto);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(IncomingOrderReceived value)
        incomingOrderReceived,
    required TResult Function(AcceptOrder value) acceptOrder,
    required TResult Function(RejectOrder value) rejectOrder,
    required TResult Function(ToggleAutoAccept value) toggleAutoAccept,
    required TResult Function(LoadPendingOrders value) loadPendingOrders,
    required TResult Function(MarkOrderReady value) markOrderReady,
    required TResult Function(CompleteOrder value) completeOrder,
  }) {
    return toggleAutoAccept(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(IncomingOrderReceived value)? incomingOrderReceived,
    TResult? Function(AcceptOrder value)? acceptOrder,
    TResult? Function(RejectOrder value)? rejectOrder,
    TResult? Function(ToggleAutoAccept value)? toggleAutoAccept,
    TResult? Function(LoadPendingOrders value)? loadPendingOrders,
    TResult? Function(MarkOrderReady value)? markOrderReady,
    TResult? Function(CompleteOrder value)? completeOrder,
  }) {
    return toggleAutoAccept?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(IncomingOrderReceived value)? incomingOrderReceived,
    TResult Function(AcceptOrder value)? acceptOrder,
    TResult Function(RejectOrder value)? rejectOrder,
    TResult Function(ToggleAutoAccept value)? toggleAutoAccept,
    TResult Function(LoadPendingOrders value)? loadPendingOrders,
    TResult Function(MarkOrderReady value)? markOrderReady,
    TResult Function(CompleteOrder value)? completeOrder,
    required TResult orElse(),
  }) {
    if (toggleAutoAccept != null) {
      return toggleAutoAccept(this);
    }
    return orElse();
  }
}

abstract class ToggleAutoAccept implements DeliveryManagementEvent {
  const factory ToggleAutoAccept(final bool isAuto) = _$ToggleAutoAcceptImpl;

  bool get isAuto;

  /// Create a copy of DeliveryManagementEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ToggleAutoAcceptImplCopyWith<_$ToggleAutoAcceptImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadPendingOrdersImplCopyWith<$Res> {
  factory _$$LoadPendingOrdersImplCopyWith(_$LoadPendingOrdersImpl value,
          $Res Function(_$LoadPendingOrdersImpl) then) =
      __$$LoadPendingOrdersImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadPendingOrdersImplCopyWithImpl<$Res>
    extends _$DeliveryManagementEventCopyWithImpl<$Res, _$LoadPendingOrdersImpl>
    implements _$$LoadPendingOrdersImplCopyWith<$Res> {
  __$$LoadPendingOrdersImplCopyWithImpl(_$LoadPendingOrdersImpl _value,
      $Res Function(_$LoadPendingOrdersImpl) _then)
      : super(_value, _then);

  /// Create a copy of DeliveryManagementEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadPendingOrdersImpl implements LoadPendingOrders {
  const _$LoadPendingOrdersImpl();

  @override
  String toString() {
    return 'DeliveryManagementEvent.loadPendingOrders()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadPendingOrdersImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DeliveryOrder order) incomingOrderReceived,
    required TResult Function(String deliveryUuid) acceptOrder,
    required TResult Function(String deliveryUuid, String reason) rejectOrder,
    required TResult Function(bool isAuto) toggleAutoAccept,
    required TResult Function() loadPendingOrders,
    required TResult Function(String deliveryUuid) markOrderReady,
    required TResult Function(String deliveryUuid) completeOrder,
  }) {
    return loadPendingOrders();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DeliveryOrder order)? incomingOrderReceived,
    TResult? Function(String deliveryUuid)? acceptOrder,
    TResult? Function(String deliveryUuid, String reason)? rejectOrder,
    TResult? Function(bool isAuto)? toggleAutoAccept,
    TResult? Function()? loadPendingOrders,
    TResult? Function(String deliveryUuid)? markOrderReady,
    TResult? Function(String deliveryUuid)? completeOrder,
  }) {
    return loadPendingOrders?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DeliveryOrder order)? incomingOrderReceived,
    TResult Function(String deliveryUuid)? acceptOrder,
    TResult Function(String deliveryUuid, String reason)? rejectOrder,
    TResult Function(bool isAuto)? toggleAutoAccept,
    TResult Function()? loadPendingOrders,
    TResult Function(String deliveryUuid)? markOrderReady,
    TResult Function(String deliveryUuid)? completeOrder,
    required TResult orElse(),
  }) {
    if (loadPendingOrders != null) {
      return loadPendingOrders();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(IncomingOrderReceived value)
        incomingOrderReceived,
    required TResult Function(AcceptOrder value) acceptOrder,
    required TResult Function(RejectOrder value) rejectOrder,
    required TResult Function(ToggleAutoAccept value) toggleAutoAccept,
    required TResult Function(LoadPendingOrders value) loadPendingOrders,
    required TResult Function(MarkOrderReady value) markOrderReady,
    required TResult Function(CompleteOrder value) completeOrder,
  }) {
    return loadPendingOrders(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(IncomingOrderReceived value)? incomingOrderReceived,
    TResult? Function(AcceptOrder value)? acceptOrder,
    TResult? Function(RejectOrder value)? rejectOrder,
    TResult? Function(ToggleAutoAccept value)? toggleAutoAccept,
    TResult? Function(LoadPendingOrders value)? loadPendingOrders,
    TResult? Function(MarkOrderReady value)? markOrderReady,
    TResult? Function(CompleteOrder value)? completeOrder,
  }) {
    return loadPendingOrders?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(IncomingOrderReceived value)? incomingOrderReceived,
    TResult Function(AcceptOrder value)? acceptOrder,
    TResult Function(RejectOrder value)? rejectOrder,
    TResult Function(ToggleAutoAccept value)? toggleAutoAccept,
    TResult Function(LoadPendingOrders value)? loadPendingOrders,
    TResult Function(MarkOrderReady value)? markOrderReady,
    TResult Function(CompleteOrder value)? completeOrder,
    required TResult orElse(),
  }) {
    if (loadPendingOrders != null) {
      return loadPendingOrders(this);
    }
    return orElse();
  }
}

abstract class LoadPendingOrders implements DeliveryManagementEvent {
  const factory LoadPendingOrders() = _$LoadPendingOrdersImpl;
}

/// @nodoc
abstract class _$$MarkOrderReadyImplCopyWith<$Res> {
  factory _$$MarkOrderReadyImplCopyWith(_$MarkOrderReadyImpl value,
          $Res Function(_$MarkOrderReadyImpl) then) =
      __$$MarkOrderReadyImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String deliveryUuid});
}

/// @nodoc
class __$$MarkOrderReadyImplCopyWithImpl<$Res>
    extends _$DeliveryManagementEventCopyWithImpl<$Res, _$MarkOrderReadyImpl>
    implements _$$MarkOrderReadyImplCopyWith<$Res> {
  __$$MarkOrderReadyImplCopyWithImpl(
      _$MarkOrderReadyImpl _value, $Res Function(_$MarkOrderReadyImpl) _then)
      : super(_value, _then);

  /// Create a copy of DeliveryManagementEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? deliveryUuid = null,
  }) {
    return _then(_$MarkOrderReadyImpl(
      null == deliveryUuid
          ? _value.deliveryUuid
          : deliveryUuid // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$MarkOrderReadyImpl implements MarkOrderReady {
  const _$MarkOrderReadyImpl(this.deliveryUuid);

  @override
  final String deliveryUuid;

  @override
  String toString() {
    return 'DeliveryManagementEvent.markOrderReady(deliveryUuid: $deliveryUuid)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MarkOrderReadyImpl &&
            (identical(other.deliveryUuid, deliveryUuid) ||
                other.deliveryUuid == deliveryUuid));
  }

  @override
  int get hashCode => Object.hash(runtimeType, deliveryUuid);

  /// Create a copy of DeliveryManagementEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MarkOrderReadyImplCopyWith<_$MarkOrderReadyImpl> get copyWith =>
      __$$MarkOrderReadyImplCopyWithImpl<_$MarkOrderReadyImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DeliveryOrder order) incomingOrderReceived,
    required TResult Function(String deliveryUuid) acceptOrder,
    required TResult Function(String deliveryUuid, String reason) rejectOrder,
    required TResult Function(bool isAuto) toggleAutoAccept,
    required TResult Function() loadPendingOrders,
    required TResult Function(String deliveryUuid) markOrderReady,
    required TResult Function(String deliveryUuid) completeOrder,
  }) {
    return markOrderReady(deliveryUuid);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DeliveryOrder order)? incomingOrderReceived,
    TResult? Function(String deliveryUuid)? acceptOrder,
    TResult? Function(String deliveryUuid, String reason)? rejectOrder,
    TResult? Function(bool isAuto)? toggleAutoAccept,
    TResult? Function()? loadPendingOrders,
    TResult? Function(String deliveryUuid)? markOrderReady,
    TResult? Function(String deliveryUuid)? completeOrder,
  }) {
    return markOrderReady?.call(deliveryUuid);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DeliveryOrder order)? incomingOrderReceived,
    TResult Function(String deliveryUuid)? acceptOrder,
    TResult Function(String deliveryUuid, String reason)? rejectOrder,
    TResult Function(bool isAuto)? toggleAutoAccept,
    TResult Function()? loadPendingOrders,
    TResult Function(String deliveryUuid)? markOrderReady,
    TResult Function(String deliveryUuid)? completeOrder,
    required TResult orElse(),
  }) {
    if (markOrderReady != null) {
      return markOrderReady(deliveryUuid);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(IncomingOrderReceived value)
        incomingOrderReceived,
    required TResult Function(AcceptOrder value) acceptOrder,
    required TResult Function(RejectOrder value) rejectOrder,
    required TResult Function(ToggleAutoAccept value) toggleAutoAccept,
    required TResult Function(LoadPendingOrders value) loadPendingOrders,
    required TResult Function(MarkOrderReady value) markOrderReady,
    required TResult Function(CompleteOrder value) completeOrder,
  }) {
    return markOrderReady(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(IncomingOrderReceived value)? incomingOrderReceived,
    TResult? Function(AcceptOrder value)? acceptOrder,
    TResult? Function(RejectOrder value)? rejectOrder,
    TResult? Function(ToggleAutoAccept value)? toggleAutoAccept,
    TResult? Function(LoadPendingOrders value)? loadPendingOrders,
    TResult? Function(MarkOrderReady value)? markOrderReady,
    TResult? Function(CompleteOrder value)? completeOrder,
  }) {
    return markOrderReady?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(IncomingOrderReceived value)? incomingOrderReceived,
    TResult Function(AcceptOrder value)? acceptOrder,
    TResult Function(RejectOrder value)? rejectOrder,
    TResult Function(ToggleAutoAccept value)? toggleAutoAccept,
    TResult Function(LoadPendingOrders value)? loadPendingOrders,
    TResult Function(MarkOrderReady value)? markOrderReady,
    TResult Function(CompleteOrder value)? completeOrder,
    required TResult orElse(),
  }) {
    if (markOrderReady != null) {
      return markOrderReady(this);
    }
    return orElse();
  }
}

abstract class MarkOrderReady implements DeliveryManagementEvent {
  const factory MarkOrderReady(final String deliveryUuid) =
      _$MarkOrderReadyImpl;

  String get deliveryUuid;

  /// Create a copy of DeliveryManagementEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MarkOrderReadyImplCopyWith<_$MarkOrderReadyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CompleteOrderImplCopyWith<$Res> {
  factory _$$CompleteOrderImplCopyWith(
          _$CompleteOrderImpl value, $Res Function(_$CompleteOrderImpl) then) =
      __$$CompleteOrderImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String deliveryUuid});
}

/// @nodoc
class __$$CompleteOrderImplCopyWithImpl<$Res>
    extends _$DeliveryManagementEventCopyWithImpl<$Res, _$CompleteOrderImpl>
    implements _$$CompleteOrderImplCopyWith<$Res> {
  __$$CompleteOrderImplCopyWithImpl(
      _$CompleteOrderImpl _value, $Res Function(_$CompleteOrderImpl) _then)
      : super(_value, _then);

  /// Create a copy of DeliveryManagementEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? deliveryUuid = null,
  }) {
    return _then(_$CompleteOrderImpl(
      null == deliveryUuid
          ? _value.deliveryUuid
          : deliveryUuid // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$CompleteOrderImpl implements CompleteOrder {
  const _$CompleteOrderImpl(this.deliveryUuid);

  @override
  final String deliveryUuid;

  @override
  String toString() {
    return 'DeliveryManagementEvent.completeOrder(deliveryUuid: $deliveryUuid)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CompleteOrderImpl &&
            (identical(other.deliveryUuid, deliveryUuid) ||
                other.deliveryUuid == deliveryUuid));
  }

  @override
  int get hashCode => Object.hash(runtimeType, deliveryUuid);

  /// Create a copy of DeliveryManagementEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CompleteOrderImplCopyWith<_$CompleteOrderImpl> get copyWith =>
      __$$CompleteOrderImplCopyWithImpl<_$CompleteOrderImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DeliveryOrder order) incomingOrderReceived,
    required TResult Function(String deliveryUuid) acceptOrder,
    required TResult Function(String deliveryUuid, String reason) rejectOrder,
    required TResult Function(bool isAuto) toggleAutoAccept,
    required TResult Function() loadPendingOrders,
    required TResult Function(String deliveryUuid) markOrderReady,
    required TResult Function(String deliveryUuid) completeOrder,
  }) {
    return completeOrder(deliveryUuid);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DeliveryOrder order)? incomingOrderReceived,
    TResult? Function(String deliveryUuid)? acceptOrder,
    TResult? Function(String deliveryUuid, String reason)? rejectOrder,
    TResult? Function(bool isAuto)? toggleAutoAccept,
    TResult? Function()? loadPendingOrders,
    TResult? Function(String deliveryUuid)? markOrderReady,
    TResult? Function(String deliveryUuid)? completeOrder,
  }) {
    return completeOrder?.call(deliveryUuid);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DeliveryOrder order)? incomingOrderReceived,
    TResult Function(String deliveryUuid)? acceptOrder,
    TResult Function(String deliveryUuid, String reason)? rejectOrder,
    TResult Function(bool isAuto)? toggleAutoAccept,
    TResult Function()? loadPendingOrders,
    TResult Function(String deliveryUuid)? markOrderReady,
    TResult Function(String deliveryUuid)? completeOrder,
    required TResult orElse(),
  }) {
    if (completeOrder != null) {
      return completeOrder(deliveryUuid);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(IncomingOrderReceived value)
        incomingOrderReceived,
    required TResult Function(AcceptOrder value) acceptOrder,
    required TResult Function(RejectOrder value) rejectOrder,
    required TResult Function(ToggleAutoAccept value) toggleAutoAccept,
    required TResult Function(LoadPendingOrders value) loadPendingOrders,
    required TResult Function(MarkOrderReady value) markOrderReady,
    required TResult Function(CompleteOrder value) completeOrder,
  }) {
    return completeOrder(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(IncomingOrderReceived value)? incomingOrderReceived,
    TResult? Function(AcceptOrder value)? acceptOrder,
    TResult? Function(RejectOrder value)? rejectOrder,
    TResult? Function(ToggleAutoAccept value)? toggleAutoAccept,
    TResult? Function(LoadPendingOrders value)? loadPendingOrders,
    TResult? Function(MarkOrderReady value)? markOrderReady,
    TResult? Function(CompleteOrder value)? completeOrder,
  }) {
    return completeOrder?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(IncomingOrderReceived value)? incomingOrderReceived,
    TResult Function(AcceptOrder value)? acceptOrder,
    TResult Function(RejectOrder value)? rejectOrder,
    TResult Function(ToggleAutoAccept value)? toggleAutoAccept,
    TResult Function(LoadPendingOrders value)? loadPendingOrders,
    TResult Function(MarkOrderReady value)? markOrderReady,
    TResult Function(CompleteOrder value)? completeOrder,
    required TResult orElse(),
  }) {
    if (completeOrder != null) {
      return completeOrder(this);
    }
    return orElse();
  }
}

abstract class CompleteOrder implements DeliveryManagementEvent {
  const factory CompleteOrder(final String deliveryUuid) = _$CompleteOrderImpl;

  String get deliveryUuid;

  /// Create a copy of DeliveryManagementEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CompleteOrderImplCopyWith<_$CompleteOrderImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
