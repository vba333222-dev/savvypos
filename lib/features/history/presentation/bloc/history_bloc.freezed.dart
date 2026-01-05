// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'history_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$HistoryEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadHistory,
    required TResult Function(String orderUuid) loadOrderItems,
    required TResult Function(DateTime start, DateTime end) exportHistoryToCsv,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadHistory,
    TResult? Function(String orderUuid)? loadOrderItems,
    TResult? Function(DateTime start, DateTime end)? exportHistoryToCsv,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadHistory,
    TResult Function(String orderUuid)? loadOrderItems,
    TResult Function(DateTime start, DateTime end)? exportHistoryToCsv,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadHistory value) loadHistory,
    required TResult Function(_LoadOrderItems value) loadOrderItems,
    required TResult Function(_ExportHistoryToCsv value) exportHistoryToCsv,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadHistory value)? loadHistory,
    TResult? Function(_LoadOrderItems value)? loadOrderItems,
    TResult? Function(_ExportHistoryToCsv value)? exportHistoryToCsv,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadHistory value)? loadHistory,
    TResult Function(_LoadOrderItems value)? loadOrderItems,
    TResult Function(_ExportHistoryToCsv value)? exportHistoryToCsv,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HistoryEventCopyWith<$Res> {
  factory $HistoryEventCopyWith(
          HistoryEvent value, $Res Function(HistoryEvent) then) =
      _$HistoryEventCopyWithImpl<$Res, HistoryEvent>;
}

/// @nodoc
class _$HistoryEventCopyWithImpl<$Res, $Val extends HistoryEvent>
    implements $HistoryEventCopyWith<$Res> {
  _$HistoryEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HistoryEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$LoadHistoryImplCopyWith<$Res> {
  factory _$$LoadHistoryImplCopyWith(
          _$LoadHistoryImpl value, $Res Function(_$LoadHistoryImpl) then) =
      __$$LoadHistoryImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadHistoryImplCopyWithImpl<$Res>
    extends _$HistoryEventCopyWithImpl<$Res, _$LoadHistoryImpl>
    implements _$$LoadHistoryImplCopyWith<$Res> {
  __$$LoadHistoryImplCopyWithImpl(
      _$LoadHistoryImpl _value, $Res Function(_$LoadHistoryImpl) _then)
      : super(_value, _then);

  /// Create a copy of HistoryEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadHistoryImpl implements _LoadHistory {
  const _$LoadHistoryImpl();

  @override
  String toString() {
    return 'HistoryEvent.loadHistory()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadHistoryImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadHistory,
    required TResult Function(String orderUuid) loadOrderItems,
    required TResult Function(DateTime start, DateTime end) exportHistoryToCsv,
  }) {
    return loadHistory();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadHistory,
    TResult? Function(String orderUuid)? loadOrderItems,
    TResult? Function(DateTime start, DateTime end)? exportHistoryToCsv,
  }) {
    return loadHistory?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadHistory,
    TResult Function(String orderUuid)? loadOrderItems,
    TResult Function(DateTime start, DateTime end)? exportHistoryToCsv,
    required TResult orElse(),
  }) {
    if (loadHistory != null) {
      return loadHistory();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadHistory value) loadHistory,
    required TResult Function(_LoadOrderItems value) loadOrderItems,
    required TResult Function(_ExportHistoryToCsv value) exportHistoryToCsv,
  }) {
    return loadHistory(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadHistory value)? loadHistory,
    TResult? Function(_LoadOrderItems value)? loadOrderItems,
    TResult? Function(_ExportHistoryToCsv value)? exportHistoryToCsv,
  }) {
    return loadHistory?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadHistory value)? loadHistory,
    TResult Function(_LoadOrderItems value)? loadOrderItems,
    TResult Function(_ExportHistoryToCsv value)? exportHistoryToCsv,
    required TResult orElse(),
  }) {
    if (loadHistory != null) {
      return loadHistory(this);
    }
    return orElse();
  }
}

abstract class _LoadHistory implements HistoryEvent {
  const factory _LoadHistory() = _$LoadHistoryImpl;
}

/// @nodoc
abstract class _$$LoadOrderItemsImplCopyWith<$Res> {
  factory _$$LoadOrderItemsImplCopyWith(_$LoadOrderItemsImpl value,
          $Res Function(_$LoadOrderItemsImpl) then) =
      __$$LoadOrderItemsImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String orderUuid});
}

/// @nodoc
class __$$LoadOrderItemsImplCopyWithImpl<$Res>
    extends _$HistoryEventCopyWithImpl<$Res, _$LoadOrderItemsImpl>
    implements _$$LoadOrderItemsImplCopyWith<$Res> {
  __$$LoadOrderItemsImplCopyWithImpl(
      _$LoadOrderItemsImpl _value, $Res Function(_$LoadOrderItemsImpl) _then)
      : super(_value, _then);

  /// Create a copy of HistoryEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderUuid = null,
  }) {
    return _then(_$LoadOrderItemsImpl(
      null == orderUuid
          ? _value.orderUuid
          : orderUuid // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$LoadOrderItemsImpl implements _LoadOrderItems {
  const _$LoadOrderItemsImpl(this.orderUuid);

  @override
  final String orderUuid;

  @override
  String toString() {
    return 'HistoryEvent.loadOrderItems(orderUuid: $orderUuid)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadOrderItemsImpl &&
            (identical(other.orderUuid, orderUuid) ||
                other.orderUuid == orderUuid));
  }

  @override
  int get hashCode => Object.hash(runtimeType, orderUuid);

  /// Create a copy of HistoryEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadOrderItemsImplCopyWith<_$LoadOrderItemsImpl> get copyWith =>
      __$$LoadOrderItemsImplCopyWithImpl<_$LoadOrderItemsImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadHistory,
    required TResult Function(String orderUuid) loadOrderItems,
    required TResult Function(DateTime start, DateTime end) exportHistoryToCsv,
  }) {
    return loadOrderItems(orderUuid);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadHistory,
    TResult? Function(String orderUuid)? loadOrderItems,
    TResult? Function(DateTime start, DateTime end)? exportHistoryToCsv,
  }) {
    return loadOrderItems?.call(orderUuid);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadHistory,
    TResult Function(String orderUuid)? loadOrderItems,
    TResult Function(DateTime start, DateTime end)? exportHistoryToCsv,
    required TResult orElse(),
  }) {
    if (loadOrderItems != null) {
      return loadOrderItems(orderUuid);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadHistory value) loadHistory,
    required TResult Function(_LoadOrderItems value) loadOrderItems,
    required TResult Function(_ExportHistoryToCsv value) exportHistoryToCsv,
  }) {
    return loadOrderItems(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadHistory value)? loadHistory,
    TResult? Function(_LoadOrderItems value)? loadOrderItems,
    TResult? Function(_ExportHistoryToCsv value)? exportHistoryToCsv,
  }) {
    return loadOrderItems?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadHistory value)? loadHistory,
    TResult Function(_LoadOrderItems value)? loadOrderItems,
    TResult Function(_ExportHistoryToCsv value)? exportHistoryToCsv,
    required TResult orElse(),
  }) {
    if (loadOrderItems != null) {
      return loadOrderItems(this);
    }
    return orElse();
  }
}

abstract class _LoadOrderItems implements HistoryEvent {
  const factory _LoadOrderItems(final String orderUuid) = _$LoadOrderItemsImpl;

  String get orderUuid;

  /// Create a copy of HistoryEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadOrderItemsImplCopyWith<_$LoadOrderItemsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ExportHistoryToCsvImplCopyWith<$Res> {
  factory _$$ExportHistoryToCsvImplCopyWith(_$ExportHistoryToCsvImpl value,
          $Res Function(_$ExportHistoryToCsvImpl) then) =
      __$$ExportHistoryToCsvImplCopyWithImpl<$Res>;
  @useResult
  $Res call({DateTime start, DateTime end});
}

/// @nodoc
class __$$ExportHistoryToCsvImplCopyWithImpl<$Res>
    extends _$HistoryEventCopyWithImpl<$Res, _$ExportHistoryToCsvImpl>
    implements _$$ExportHistoryToCsvImplCopyWith<$Res> {
  __$$ExportHistoryToCsvImplCopyWithImpl(_$ExportHistoryToCsvImpl _value,
      $Res Function(_$ExportHistoryToCsvImpl) _then)
      : super(_value, _then);

  /// Create a copy of HistoryEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? start = null,
    Object? end = null,
  }) {
    return _then(_$ExportHistoryToCsvImpl(
      null == start
          ? _value.start
          : start // ignore: cast_nullable_to_non_nullable
              as DateTime,
      null == end
          ? _value.end
          : end // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$ExportHistoryToCsvImpl implements _ExportHistoryToCsv {
  const _$ExportHistoryToCsvImpl(this.start, this.end);

  @override
  final DateTime start;
  @override
  final DateTime end;

  @override
  String toString() {
    return 'HistoryEvent.exportHistoryToCsv(start: $start, end: $end)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExportHistoryToCsvImpl &&
            (identical(other.start, start) || other.start == start) &&
            (identical(other.end, end) || other.end == end));
  }

  @override
  int get hashCode => Object.hash(runtimeType, start, end);

  /// Create a copy of HistoryEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ExportHistoryToCsvImplCopyWith<_$ExportHistoryToCsvImpl> get copyWith =>
      __$$ExportHistoryToCsvImplCopyWithImpl<_$ExportHistoryToCsvImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadHistory,
    required TResult Function(String orderUuid) loadOrderItems,
    required TResult Function(DateTime start, DateTime end) exportHistoryToCsv,
  }) {
    return exportHistoryToCsv(start, end);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadHistory,
    TResult? Function(String orderUuid)? loadOrderItems,
    TResult? Function(DateTime start, DateTime end)? exportHistoryToCsv,
  }) {
    return exportHistoryToCsv?.call(start, end);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadHistory,
    TResult Function(String orderUuid)? loadOrderItems,
    TResult Function(DateTime start, DateTime end)? exportHistoryToCsv,
    required TResult orElse(),
  }) {
    if (exportHistoryToCsv != null) {
      return exportHistoryToCsv(start, end);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadHistory value) loadHistory,
    required TResult Function(_LoadOrderItems value) loadOrderItems,
    required TResult Function(_ExportHistoryToCsv value) exportHistoryToCsv,
  }) {
    return exportHistoryToCsv(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadHistory value)? loadHistory,
    TResult? Function(_LoadOrderItems value)? loadOrderItems,
    TResult? Function(_ExportHistoryToCsv value)? exportHistoryToCsv,
  }) {
    return exportHistoryToCsv?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadHistory value)? loadHistory,
    TResult Function(_LoadOrderItems value)? loadOrderItems,
    TResult Function(_ExportHistoryToCsv value)? exportHistoryToCsv,
    required TResult orElse(),
  }) {
    if (exportHistoryToCsv != null) {
      return exportHistoryToCsv(this);
    }
    return orElse();
  }
}

abstract class _ExportHistoryToCsv implements HistoryEvent {
  const factory _ExportHistoryToCsv(final DateTime start, final DateTime end) =
      _$ExportHistoryToCsvImpl;

  DateTime get start;
  DateTime get end;

  /// Create a copy of HistoryEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ExportHistoryToCsvImplCopyWith<_$ExportHistoryToCsvImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$HistoryState {
  List<OrderTableData> get orders => throw _privateConstructorUsedError;
  Map<String, List<OrderItemTableData>> get orderItems =>
      throw _privateConstructorUsedError; // Cache items by Order UUID
  bool get isLoading => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;

  /// Create a copy of HistoryState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HistoryStateCopyWith<HistoryState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HistoryStateCopyWith<$Res> {
  factory $HistoryStateCopyWith(
          HistoryState value, $Res Function(HistoryState) then) =
      _$HistoryStateCopyWithImpl<$Res, HistoryState>;
  @useResult
  $Res call(
      {List<OrderTableData> orders,
      Map<String, List<OrderItemTableData>> orderItems,
      bool isLoading,
      String? error});
}

/// @nodoc
class _$HistoryStateCopyWithImpl<$Res, $Val extends HistoryState>
    implements $HistoryStateCopyWith<$Res> {
  _$HistoryStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HistoryState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orders = null,
    Object? orderItems = null,
    Object? isLoading = null,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      orders: null == orders
          ? _value.orders
          : orders // ignore: cast_nullable_to_non_nullable
              as List<OrderTableData>,
      orderItems: null == orderItems
          ? _value.orderItems
          : orderItems // ignore: cast_nullable_to_non_nullable
              as Map<String, List<OrderItemTableData>>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HistoryStateImplCopyWith<$Res>
    implements $HistoryStateCopyWith<$Res> {
  factory _$$HistoryStateImplCopyWith(
          _$HistoryStateImpl value, $Res Function(_$HistoryStateImpl) then) =
      __$$HistoryStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<OrderTableData> orders,
      Map<String, List<OrderItemTableData>> orderItems,
      bool isLoading,
      String? error});
}

/// @nodoc
class __$$HistoryStateImplCopyWithImpl<$Res>
    extends _$HistoryStateCopyWithImpl<$Res, _$HistoryStateImpl>
    implements _$$HistoryStateImplCopyWith<$Res> {
  __$$HistoryStateImplCopyWithImpl(
      _$HistoryStateImpl _value, $Res Function(_$HistoryStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of HistoryState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orders = null,
    Object? orderItems = null,
    Object? isLoading = null,
    Object? error = freezed,
  }) {
    return _then(_$HistoryStateImpl(
      orders: null == orders
          ? _value._orders
          : orders // ignore: cast_nullable_to_non_nullable
              as List<OrderTableData>,
      orderItems: null == orderItems
          ? _value._orderItems
          : orderItems // ignore: cast_nullable_to_non_nullable
              as Map<String, List<OrderItemTableData>>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$HistoryStateImpl implements _HistoryState {
  const _$HistoryStateImpl(
      {final List<OrderTableData> orders = const [],
      final Map<String, List<OrderItemTableData>> orderItems = const {},
      this.isLoading = true,
      this.error})
      : _orders = orders,
        _orderItems = orderItems;

  final List<OrderTableData> _orders;
  @override
  @JsonKey()
  List<OrderTableData> get orders {
    if (_orders is EqualUnmodifiableListView) return _orders;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_orders);
  }

  final Map<String, List<OrderItemTableData>> _orderItems;
  @override
  @JsonKey()
  Map<String, List<OrderItemTableData>> get orderItems {
    if (_orderItems is EqualUnmodifiableMapView) return _orderItems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_orderItems);
  }

// Cache items by Order UUID
  @override
  @JsonKey()
  final bool isLoading;
  @override
  final String? error;

  @override
  String toString() {
    return 'HistoryState(orders: $orders, orderItems: $orderItems, isLoading: $isLoading, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HistoryStateImpl &&
            const DeepCollectionEquality().equals(other._orders, _orders) &&
            const DeepCollectionEquality()
                .equals(other._orderItems, _orderItems) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_orders),
      const DeepCollectionEquality().hash(_orderItems),
      isLoading,
      error);

  /// Create a copy of HistoryState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HistoryStateImplCopyWith<_$HistoryStateImpl> get copyWith =>
      __$$HistoryStateImplCopyWithImpl<_$HistoryStateImpl>(this, _$identity);
}

abstract class _HistoryState implements HistoryState {
  const factory _HistoryState(
      {final List<OrderTableData> orders,
      final Map<String, List<OrderItemTableData>> orderItems,
      final bool isLoading,
      final String? error}) = _$HistoryStateImpl;

  @override
  List<OrderTableData> get orders;
  @override
  Map<String, List<OrderItemTableData>>
      get orderItems; // Cache items by Order UUID
  @override
  bool get isLoading;
  @override
  String? get error;

  /// Create a copy of HistoryState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HistoryStateImplCopyWith<_$HistoryStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
