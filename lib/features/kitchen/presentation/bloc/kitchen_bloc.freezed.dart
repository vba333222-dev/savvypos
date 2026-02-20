// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'kitchen_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$KitchenEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() startListening,
    required TResult Function(List<KitchenOrder> orders) ordersUpdated,
    required TResult Function(String orderUuid) markAsDone,
    required TResult Function(String itemUuid) markItemDone,
    required TResult Function(String orderUuid) markOrderStarted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? startListening,
    TResult? Function(List<KitchenOrder> orders)? ordersUpdated,
    TResult? Function(String orderUuid)? markAsDone,
    TResult? Function(String itemUuid)? markItemDone,
    TResult? Function(String orderUuid)? markOrderStarted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? startListening,
    TResult Function(List<KitchenOrder> orders)? ordersUpdated,
    TResult Function(String orderUuid)? markAsDone,
    TResult Function(String itemUuid)? markItemDone,
    TResult Function(String orderUuid)? markOrderStarted,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_StartListening value) startListening,
    required TResult Function(_OrdersUpdated value) ordersUpdated,
    required TResult Function(_MarkAsDone value) markAsDone,
    required TResult Function(_MarkItemDone value) markItemDone,
    required TResult Function(_MarkOrderStarted value) markOrderStarted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_StartListening value)? startListening,
    TResult? Function(_OrdersUpdated value)? ordersUpdated,
    TResult? Function(_MarkAsDone value)? markAsDone,
    TResult? Function(_MarkItemDone value)? markItemDone,
    TResult? Function(_MarkOrderStarted value)? markOrderStarted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_StartListening value)? startListening,
    TResult Function(_OrdersUpdated value)? ordersUpdated,
    TResult Function(_MarkAsDone value)? markAsDone,
    TResult Function(_MarkItemDone value)? markItemDone,
    TResult Function(_MarkOrderStarted value)? markOrderStarted,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $KitchenEventCopyWith<$Res> {
  factory $KitchenEventCopyWith(
          KitchenEvent value, $Res Function(KitchenEvent) then) =
      _$KitchenEventCopyWithImpl<$Res, KitchenEvent>;
}

/// @nodoc
class _$KitchenEventCopyWithImpl<$Res, $Val extends KitchenEvent>
    implements $KitchenEventCopyWith<$Res> {
  _$KitchenEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of KitchenEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$StartListeningImplCopyWith<$Res> {
  factory _$$StartListeningImplCopyWith(_$StartListeningImpl value,
          $Res Function(_$StartListeningImpl) then) =
      __$$StartListeningImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$StartListeningImplCopyWithImpl<$Res>
    extends _$KitchenEventCopyWithImpl<$Res, _$StartListeningImpl>
    implements _$$StartListeningImplCopyWith<$Res> {
  __$$StartListeningImplCopyWithImpl(
      _$StartListeningImpl _value, $Res Function(_$StartListeningImpl) _then)
      : super(_value, _then);

  /// Create a copy of KitchenEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$StartListeningImpl implements _StartListening {
  const _$StartListeningImpl();

  @override
  String toString() {
    return 'KitchenEvent.startListening()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$StartListeningImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() startListening,
    required TResult Function(List<KitchenOrder> orders) ordersUpdated,
    required TResult Function(String orderUuid) markAsDone,
    required TResult Function(String itemUuid) markItemDone,
    required TResult Function(String orderUuid) markOrderStarted,
  }) {
    return startListening();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? startListening,
    TResult? Function(List<KitchenOrder> orders)? ordersUpdated,
    TResult? Function(String orderUuid)? markAsDone,
    TResult? Function(String itemUuid)? markItemDone,
    TResult? Function(String orderUuid)? markOrderStarted,
  }) {
    return startListening?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? startListening,
    TResult Function(List<KitchenOrder> orders)? ordersUpdated,
    TResult Function(String orderUuid)? markAsDone,
    TResult Function(String itemUuid)? markItemDone,
    TResult Function(String orderUuid)? markOrderStarted,
    required TResult orElse(),
  }) {
    if (startListening != null) {
      return startListening();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_StartListening value) startListening,
    required TResult Function(_OrdersUpdated value) ordersUpdated,
    required TResult Function(_MarkAsDone value) markAsDone,
    required TResult Function(_MarkItemDone value) markItemDone,
    required TResult Function(_MarkOrderStarted value) markOrderStarted,
  }) {
    return startListening(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_StartListening value)? startListening,
    TResult? Function(_OrdersUpdated value)? ordersUpdated,
    TResult? Function(_MarkAsDone value)? markAsDone,
    TResult? Function(_MarkItemDone value)? markItemDone,
    TResult? Function(_MarkOrderStarted value)? markOrderStarted,
  }) {
    return startListening?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_StartListening value)? startListening,
    TResult Function(_OrdersUpdated value)? ordersUpdated,
    TResult Function(_MarkAsDone value)? markAsDone,
    TResult Function(_MarkItemDone value)? markItemDone,
    TResult Function(_MarkOrderStarted value)? markOrderStarted,
    required TResult orElse(),
  }) {
    if (startListening != null) {
      return startListening(this);
    }
    return orElse();
  }
}

abstract class _StartListening implements KitchenEvent {
  const factory _StartListening() = _$StartListeningImpl;
}

/// @nodoc
abstract class _$$OrdersUpdatedImplCopyWith<$Res> {
  factory _$$OrdersUpdatedImplCopyWith(
          _$OrdersUpdatedImpl value, $Res Function(_$OrdersUpdatedImpl) then) =
      __$$OrdersUpdatedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<KitchenOrder> orders});
}

/// @nodoc
class __$$OrdersUpdatedImplCopyWithImpl<$Res>
    extends _$KitchenEventCopyWithImpl<$Res, _$OrdersUpdatedImpl>
    implements _$$OrdersUpdatedImplCopyWith<$Res> {
  __$$OrdersUpdatedImplCopyWithImpl(
      _$OrdersUpdatedImpl _value, $Res Function(_$OrdersUpdatedImpl) _then)
      : super(_value, _then);

  /// Create a copy of KitchenEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orders = null,
  }) {
    return _then(_$OrdersUpdatedImpl(
      null == orders
          ? _value._orders
          : orders // ignore: cast_nullable_to_non_nullable
              as List<KitchenOrder>,
    ));
  }
}

/// @nodoc

class _$OrdersUpdatedImpl implements _OrdersUpdated {
  const _$OrdersUpdatedImpl(final List<KitchenOrder> orders) : _orders = orders;

  final List<KitchenOrder> _orders;
  @override
  List<KitchenOrder> get orders {
    if (_orders is EqualUnmodifiableListView) return _orders;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_orders);
  }

  @override
  String toString() {
    return 'KitchenEvent.ordersUpdated(orders: $orders)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrdersUpdatedImpl &&
            const DeepCollectionEquality().equals(other._orders, _orders));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_orders));

  /// Create a copy of KitchenEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OrdersUpdatedImplCopyWith<_$OrdersUpdatedImpl> get copyWith =>
      __$$OrdersUpdatedImplCopyWithImpl<_$OrdersUpdatedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() startListening,
    required TResult Function(List<KitchenOrder> orders) ordersUpdated,
    required TResult Function(String orderUuid) markAsDone,
    required TResult Function(String itemUuid) markItemDone,
    required TResult Function(String orderUuid) markOrderStarted,
  }) {
    return ordersUpdated(orders);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? startListening,
    TResult? Function(List<KitchenOrder> orders)? ordersUpdated,
    TResult? Function(String orderUuid)? markAsDone,
    TResult? Function(String itemUuid)? markItemDone,
    TResult? Function(String orderUuid)? markOrderStarted,
  }) {
    return ordersUpdated?.call(orders);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? startListening,
    TResult Function(List<KitchenOrder> orders)? ordersUpdated,
    TResult Function(String orderUuid)? markAsDone,
    TResult Function(String itemUuid)? markItemDone,
    TResult Function(String orderUuid)? markOrderStarted,
    required TResult orElse(),
  }) {
    if (ordersUpdated != null) {
      return ordersUpdated(orders);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_StartListening value) startListening,
    required TResult Function(_OrdersUpdated value) ordersUpdated,
    required TResult Function(_MarkAsDone value) markAsDone,
    required TResult Function(_MarkItemDone value) markItemDone,
    required TResult Function(_MarkOrderStarted value) markOrderStarted,
  }) {
    return ordersUpdated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_StartListening value)? startListening,
    TResult? Function(_OrdersUpdated value)? ordersUpdated,
    TResult? Function(_MarkAsDone value)? markAsDone,
    TResult? Function(_MarkItemDone value)? markItemDone,
    TResult? Function(_MarkOrderStarted value)? markOrderStarted,
  }) {
    return ordersUpdated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_StartListening value)? startListening,
    TResult Function(_OrdersUpdated value)? ordersUpdated,
    TResult Function(_MarkAsDone value)? markAsDone,
    TResult Function(_MarkItemDone value)? markItemDone,
    TResult Function(_MarkOrderStarted value)? markOrderStarted,
    required TResult orElse(),
  }) {
    if (ordersUpdated != null) {
      return ordersUpdated(this);
    }
    return orElse();
  }
}

abstract class _OrdersUpdated implements KitchenEvent {
  const factory _OrdersUpdated(final List<KitchenOrder> orders) =
      _$OrdersUpdatedImpl;

  List<KitchenOrder> get orders;

  /// Create a copy of KitchenEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OrdersUpdatedImplCopyWith<_$OrdersUpdatedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$MarkAsDoneImplCopyWith<$Res> {
  factory _$$MarkAsDoneImplCopyWith(
          _$MarkAsDoneImpl value, $Res Function(_$MarkAsDoneImpl) then) =
      __$$MarkAsDoneImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String orderUuid});
}

/// @nodoc
class __$$MarkAsDoneImplCopyWithImpl<$Res>
    extends _$KitchenEventCopyWithImpl<$Res, _$MarkAsDoneImpl>
    implements _$$MarkAsDoneImplCopyWith<$Res> {
  __$$MarkAsDoneImplCopyWithImpl(
      _$MarkAsDoneImpl _value, $Res Function(_$MarkAsDoneImpl) _then)
      : super(_value, _then);

  /// Create a copy of KitchenEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderUuid = null,
  }) {
    return _then(_$MarkAsDoneImpl(
      null == orderUuid
          ? _value.orderUuid
          : orderUuid // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$MarkAsDoneImpl implements _MarkAsDone {
  const _$MarkAsDoneImpl(this.orderUuid);

  @override
  final String orderUuid;

  @override
  String toString() {
    return 'KitchenEvent.markAsDone(orderUuid: $orderUuid)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MarkAsDoneImpl &&
            (identical(other.orderUuid, orderUuid) ||
                other.orderUuid == orderUuid));
  }

  @override
  int get hashCode => Object.hash(runtimeType, orderUuid);

  /// Create a copy of KitchenEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MarkAsDoneImplCopyWith<_$MarkAsDoneImpl> get copyWith =>
      __$$MarkAsDoneImplCopyWithImpl<_$MarkAsDoneImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() startListening,
    required TResult Function(List<KitchenOrder> orders) ordersUpdated,
    required TResult Function(String orderUuid) markAsDone,
    required TResult Function(String itemUuid) markItemDone,
    required TResult Function(String orderUuid) markOrderStarted,
  }) {
    return markAsDone(orderUuid);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? startListening,
    TResult? Function(List<KitchenOrder> orders)? ordersUpdated,
    TResult? Function(String orderUuid)? markAsDone,
    TResult? Function(String itemUuid)? markItemDone,
    TResult? Function(String orderUuid)? markOrderStarted,
  }) {
    return markAsDone?.call(orderUuid);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? startListening,
    TResult Function(List<KitchenOrder> orders)? ordersUpdated,
    TResult Function(String orderUuid)? markAsDone,
    TResult Function(String itemUuid)? markItemDone,
    TResult Function(String orderUuid)? markOrderStarted,
    required TResult orElse(),
  }) {
    if (markAsDone != null) {
      return markAsDone(orderUuid);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_StartListening value) startListening,
    required TResult Function(_OrdersUpdated value) ordersUpdated,
    required TResult Function(_MarkAsDone value) markAsDone,
    required TResult Function(_MarkItemDone value) markItemDone,
    required TResult Function(_MarkOrderStarted value) markOrderStarted,
  }) {
    return markAsDone(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_StartListening value)? startListening,
    TResult? Function(_OrdersUpdated value)? ordersUpdated,
    TResult? Function(_MarkAsDone value)? markAsDone,
    TResult? Function(_MarkItemDone value)? markItemDone,
    TResult? Function(_MarkOrderStarted value)? markOrderStarted,
  }) {
    return markAsDone?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_StartListening value)? startListening,
    TResult Function(_OrdersUpdated value)? ordersUpdated,
    TResult Function(_MarkAsDone value)? markAsDone,
    TResult Function(_MarkItemDone value)? markItemDone,
    TResult Function(_MarkOrderStarted value)? markOrderStarted,
    required TResult orElse(),
  }) {
    if (markAsDone != null) {
      return markAsDone(this);
    }
    return orElse();
  }
}

abstract class _MarkAsDone implements KitchenEvent {
  const factory _MarkAsDone(final String orderUuid) = _$MarkAsDoneImpl;

  String get orderUuid;

  /// Create a copy of KitchenEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MarkAsDoneImplCopyWith<_$MarkAsDoneImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$MarkItemDoneImplCopyWith<$Res> {
  factory _$$MarkItemDoneImplCopyWith(
          _$MarkItemDoneImpl value, $Res Function(_$MarkItemDoneImpl) then) =
      __$$MarkItemDoneImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String itemUuid});
}

/// @nodoc
class __$$MarkItemDoneImplCopyWithImpl<$Res>
    extends _$KitchenEventCopyWithImpl<$Res, _$MarkItemDoneImpl>
    implements _$$MarkItemDoneImplCopyWith<$Res> {
  __$$MarkItemDoneImplCopyWithImpl(
      _$MarkItemDoneImpl _value, $Res Function(_$MarkItemDoneImpl) _then)
      : super(_value, _then);

  /// Create a copy of KitchenEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? itemUuid = null,
  }) {
    return _then(_$MarkItemDoneImpl(
      null == itemUuid
          ? _value.itemUuid
          : itemUuid // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$MarkItemDoneImpl implements _MarkItemDone {
  const _$MarkItemDoneImpl(this.itemUuid);

  @override
  final String itemUuid;

  @override
  String toString() {
    return 'KitchenEvent.markItemDone(itemUuid: $itemUuid)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MarkItemDoneImpl &&
            (identical(other.itemUuid, itemUuid) ||
                other.itemUuid == itemUuid));
  }

  @override
  int get hashCode => Object.hash(runtimeType, itemUuid);

  /// Create a copy of KitchenEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MarkItemDoneImplCopyWith<_$MarkItemDoneImpl> get copyWith =>
      __$$MarkItemDoneImplCopyWithImpl<_$MarkItemDoneImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() startListening,
    required TResult Function(List<KitchenOrder> orders) ordersUpdated,
    required TResult Function(String orderUuid) markAsDone,
    required TResult Function(String itemUuid) markItemDone,
    required TResult Function(String orderUuid) markOrderStarted,
  }) {
    return markItemDone(itemUuid);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? startListening,
    TResult? Function(List<KitchenOrder> orders)? ordersUpdated,
    TResult? Function(String orderUuid)? markAsDone,
    TResult? Function(String itemUuid)? markItemDone,
    TResult? Function(String orderUuid)? markOrderStarted,
  }) {
    return markItemDone?.call(itemUuid);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? startListening,
    TResult Function(List<KitchenOrder> orders)? ordersUpdated,
    TResult Function(String orderUuid)? markAsDone,
    TResult Function(String itemUuid)? markItemDone,
    TResult Function(String orderUuid)? markOrderStarted,
    required TResult orElse(),
  }) {
    if (markItemDone != null) {
      return markItemDone(itemUuid);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_StartListening value) startListening,
    required TResult Function(_OrdersUpdated value) ordersUpdated,
    required TResult Function(_MarkAsDone value) markAsDone,
    required TResult Function(_MarkItemDone value) markItemDone,
    required TResult Function(_MarkOrderStarted value) markOrderStarted,
  }) {
    return markItemDone(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_StartListening value)? startListening,
    TResult? Function(_OrdersUpdated value)? ordersUpdated,
    TResult? Function(_MarkAsDone value)? markAsDone,
    TResult? Function(_MarkItemDone value)? markItemDone,
    TResult? Function(_MarkOrderStarted value)? markOrderStarted,
  }) {
    return markItemDone?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_StartListening value)? startListening,
    TResult Function(_OrdersUpdated value)? ordersUpdated,
    TResult Function(_MarkAsDone value)? markAsDone,
    TResult Function(_MarkItemDone value)? markItemDone,
    TResult Function(_MarkOrderStarted value)? markOrderStarted,
    required TResult orElse(),
  }) {
    if (markItemDone != null) {
      return markItemDone(this);
    }
    return orElse();
  }
}

abstract class _MarkItemDone implements KitchenEvent {
  const factory _MarkItemDone(final String itemUuid) = _$MarkItemDoneImpl;

  String get itemUuid;

  /// Create a copy of KitchenEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MarkItemDoneImplCopyWith<_$MarkItemDoneImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$MarkOrderStartedImplCopyWith<$Res> {
  factory _$$MarkOrderStartedImplCopyWith(_$MarkOrderStartedImpl value,
          $Res Function(_$MarkOrderStartedImpl) then) =
      __$$MarkOrderStartedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String orderUuid});
}

/// @nodoc
class __$$MarkOrderStartedImplCopyWithImpl<$Res>
    extends _$KitchenEventCopyWithImpl<$Res, _$MarkOrderStartedImpl>
    implements _$$MarkOrderStartedImplCopyWith<$Res> {
  __$$MarkOrderStartedImplCopyWithImpl(_$MarkOrderStartedImpl _value,
      $Res Function(_$MarkOrderStartedImpl) _then)
      : super(_value, _then);

  /// Create a copy of KitchenEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderUuid = null,
  }) {
    return _then(_$MarkOrderStartedImpl(
      null == orderUuid
          ? _value.orderUuid
          : orderUuid // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$MarkOrderStartedImpl implements _MarkOrderStarted {
  const _$MarkOrderStartedImpl(this.orderUuid);

  @override
  final String orderUuid;

  @override
  String toString() {
    return 'KitchenEvent.markOrderStarted(orderUuid: $orderUuid)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MarkOrderStartedImpl &&
            (identical(other.orderUuid, orderUuid) ||
                other.orderUuid == orderUuid));
  }

  @override
  int get hashCode => Object.hash(runtimeType, orderUuid);

  /// Create a copy of KitchenEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MarkOrderStartedImplCopyWith<_$MarkOrderStartedImpl> get copyWith =>
      __$$MarkOrderStartedImplCopyWithImpl<_$MarkOrderStartedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() startListening,
    required TResult Function(List<KitchenOrder> orders) ordersUpdated,
    required TResult Function(String orderUuid) markAsDone,
    required TResult Function(String itemUuid) markItemDone,
    required TResult Function(String orderUuid) markOrderStarted,
  }) {
    return markOrderStarted(orderUuid);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? startListening,
    TResult? Function(List<KitchenOrder> orders)? ordersUpdated,
    TResult? Function(String orderUuid)? markAsDone,
    TResult? Function(String itemUuid)? markItemDone,
    TResult? Function(String orderUuid)? markOrderStarted,
  }) {
    return markOrderStarted?.call(orderUuid);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? startListening,
    TResult Function(List<KitchenOrder> orders)? ordersUpdated,
    TResult Function(String orderUuid)? markAsDone,
    TResult Function(String itemUuid)? markItemDone,
    TResult Function(String orderUuid)? markOrderStarted,
    required TResult orElse(),
  }) {
    if (markOrderStarted != null) {
      return markOrderStarted(orderUuid);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_StartListening value) startListening,
    required TResult Function(_OrdersUpdated value) ordersUpdated,
    required TResult Function(_MarkAsDone value) markAsDone,
    required TResult Function(_MarkItemDone value) markItemDone,
    required TResult Function(_MarkOrderStarted value) markOrderStarted,
  }) {
    return markOrderStarted(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_StartListening value)? startListening,
    TResult? Function(_OrdersUpdated value)? ordersUpdated,
    TResult? Function(_MarkAsDone value)? markAsDone,
    TResult? Function(_MarkItemDone value)? markItemDone,
    TResult? Function(_MarkOrderStarted value)? markOrderStarted,
  }) {
    return markOrderStarted?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_StartListening value)? startListening,
    TResult Function(_OrdersUpdated value)? ordersUpdated,
    TResult Function(_MarkAsDone value)? markAsDone,
    TResult Function(_MarkItemDone value)? markItemDone,
    TResult Function(_MarkOrderStarted value)? markOrderStarted,
    required TResult orElse(),
  }) {
    if (markOrderStarted != null) {
      return markOrderStarted(this);
    }
    return orElse();
  }
}

abstract class _MarkOrderStarted implements KitchenEvent {
  const factory _MarkOrderStarted(final String orderUuid) =
      _$MarkOrderStartedImpl;

  String get orderUuid;

  /// Create a copy of KitchenEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MarkOrderStartedImplCopyWith<_$MarkOrderStartedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$KitchenState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<KitchenOrder> orders) loaded,
    required TResult Function(String message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<KitchenOrder> orders)? loaded,
    TResult? Function(String message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<KitchenOrder> orders)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $KitchenStateCopyWith<$Res> {
  factory $KitchenStateCopyWith(
          KitchenState value, $Res Function(KitchenState) then) =
      _$KitchenStateCopyWithImpl<$Res, KitchenState>;
}

/// @nodoc
class _$KitchenStateCopyWithImpl<$Res, $Val extends KitchenState>
    implements $KitchenStateCopyWith<$Res> {
  _$KitchenStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of KitchenState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$KitchenStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of KitchenState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'KitchenState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<KitchenOrder> orders) loaded,
    required TResult Function(String message) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<KitchenOrder> orders)? loaded,
    TResult? Function(String message)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<KitchenOrder> orders)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements KitchenState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$KitchenStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of KitchenState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'KitchenState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<KitchenOrder> orders) loaded,
    required TResult Function(String message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<KitchenOrder> orders)? loaded,
    TResult? Function(String message)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<KitchenOrder> orders)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements KitchenState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$LoadedImplCopyWith<$Res> {
  factory _$$LoadedImplCopyWith(
          _$LoadedImpl value, $Res Function(_$LoadedImpl) then) =
      __$$LoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<KitchenOrder> orders});
}

/// @nodoc
class __$$LoadedImplCopyWithImpl<$Res>
    extends _$KitchenStateCopyWithImpl<$Res, _$LoadedImpl>
    implements _$$LoadedImplCopyWith<$Res> {
  __$$LoadedImplCopyWithImpl(
      _$LoadedImpl _value, $Res Function(_$LoadedImpl) _then)
      : super(_value, _then);

  /// Create a copy of KitchenState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orders = null,
  }) {
    return _then(_$LoadedImpl(
      null == orders
          ? _value._orders
          : orders // ignore: cast_nullable_to_non_nullable
              as List<KitchenOrder>,
    ));
  }
}

/// @nodoc

class _$LoadedImpl implements _Loaded {
  const _$LoadedImpl(final List<KitchenOrder> orders) : _orders = orders;

  final List<KitchenOrder> _orders;
  @override
  List<KitchenOrder> get orders {
    if (_orders is EqualUnmodifiableListView) return _orders;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_orders);
  }

  @override
  String toString() {
    return 'KitchenState.loaded(orders: $orders)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadedImpl &&
            const DeepCollectionEquality().equals(other._orders, _orders));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_orders));

  /// Create a copy of KitchenState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadedImplCopyWith<_$LoadedImpl> get copyWith =>
      __$$LoadedImplCopyWithImpl<_$LoadedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<KitchenOrder> orders) loaded,
    required TResult Function(String message) error,
  }) {
    return loaded(orders);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<KitchenOrder> orders)? loaded,
    TResult? Function(String message)? error,
  }) {
    return loaded?.call(orders);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<KitchenOrder> orders)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(orders);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class _Loaded implements KitchenState {
  const factory _Loaded(final List<KitchenOrder> orders) = _$LoadedImpl;

  List<KitchenOrder> get orders;

  /// Create a copy of KitchenState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadedImplCopyWith<_$LoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<$Res> {
  factory _$$ErrorImplCopyWith(
          _$ErrorImpl value, $Res Function(_$ErrorImpl) then) =
      __$$ErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<$Res>
    extends _$KitchenStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of KitchenState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$ErrorImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ErrorImpl implements _Error {
  const _$ErrorImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'KitchenState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of KitchenState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      __$$ErrorImplCopyWithImpl<_$ErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<KitchenOrder> orders) loaded,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<KitchenOrder> orders)? loaded,
    TResult? Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<KitchenOrder> orders)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements KitchenState {
  const factory _Error(final String message) = _$ErrorImpl;

  String get message;

  /// Create a copy of KitchenState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
