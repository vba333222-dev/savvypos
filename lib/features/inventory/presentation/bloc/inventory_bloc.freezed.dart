// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'inventory_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$InventoryEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() refresh,
    required TResult Function(String supplierUuid, String targetWarehouseUuid,
            List<PurchaseOrderItem> items, String? notes)
        createPo,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? refresh,
    TResult? Function(String supplierUuid, String targetWarehouseUuid,
            List<PurchaseOrderItem> items, String? notes)?
        createPo,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? refresh,
    TResult Function(String supplierUuid, String targetWarehouseUuid,
            List<PurchaseOrderItem> items, String? notes)?
        createPo,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_Refresh value) refresh,
    required TResult Function(_CreatePo value) createPo,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_Refresh value)? refresh,
    TResult? Function(_CreatePo value)? createPo,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_Refresh value)? refresh,
    TResult Function(_CreatePo value)? createPo,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InventoryEventCopyWith<$Res> {
  factory $InventoryEventCopyWith(
          InventoryEvent value, $Res Function(InventoryEvent) then) =
      _$InventoryEventCopyWithImpl<$Res, InventoryEvent>;
}

/// @nodoc
class _$InventoryEventCopyWithImpl<$Res, $Val extends InventoryEvent>
    implements $InventoryEventCopyWith<$Res> {
  _$InventoryEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of InventoryEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$StartedImplCopyWith<$Res> {
  factory _$$StartedImplCopyWith(
          _$StartedImpl value, $Res Function(_$StartedImpl) then) =
      __$$StartedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$StartedImplCopyWithImpl<$Res>
    extends _$InventoryEventCopyWithImpl<$Res, _$StartedImpl>
    implements _$$StartedImplCopyWith<$Res> {
  __$$StartedImplCopyWithImpl(
      _$StartedImpl _value, $Res Function(_$StartedImpl) _then)
      : super(_value, _then);

  /// Create a copy of InventoryEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$StartedImpl implements _Started {
  const _$StartedImpl();

  @override
  String toString() {
    return 'InventoryEvent.started()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$StartedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() refresh,
    required TResult Function(String supplierUuid, String targetWarehouseUuid,
            List<PurchaseOrderItem> items, String? notes)
        createPo,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? refresh,
    TResult? Function(String supplierUuid, String targetWarehouseUuid,
            List<PurchaseOrderItem> items, String? notes)?
        createPo,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? refresh,
    TResult Function(String supplierUuid, String targetWarehouseUuid,
            List<PurchaseOrderItem> items, String? notes)?
        createPo,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_Refresh value) refresh,
    required TResult Function(_CreatePo value) createPo,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_Refresh value)? refresh,
    TResult? Function(_CreatePo value)? createPo,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_Refresh value)? refresh,
    TResult Function(_CreatePo value)? createPo,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements InventoryEvent {
  const factory _Started() = _$StartedImpl;
}

/// @nodoc
abstract class _$$RefreshImplCopyWith<$Res> {
  factory _$$RefreshImplCopyWith(
          _$RefreshImpl value, $Res Function(_$RefreshImpl) then) =
      __$$RefreshImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RefreshImplCopyWithImpl<$Res>
    extends _$InventoryEventCopyWithImpl<$Res, _$RefreshImpl>
    implements _$$RefreshImplCopyWith<$Res> {
  __$$RefreshImplCopyWithImpl(
      _$RefreshImpl _value, $Res Function(_$RefreshImpl) _then)
      : super(_value, _then);

  /// Create a copy of InventoryEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$RefreshImpl implements _Refresh {
  const _$RefreshImpl();

  @override
  String toString() {
    return 'InventoryEvent.refresh()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$RefreshImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() refresh,
    required TResult Function(String supplierUuid, String targetWarehouseUuid,
            List<PurchaseOrderItem> items, String? notes)
        createPo,
  }) {
    return refresh();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? refresh,
    TResult? Function(String supplierUuid, String targetWarehouseUuid,
            List<PurchaseOrderItem> items, String? notes)?
        createPo,
  }) {
    return refresh?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? refresh,
    TResult Function(String supplierUuid, String targetWarehouseUuid,
            List<PurchaseOrderItem> items, String? notes)?
        createPo,
    required TResult orElse(),
  }) {
    if (refresh != null) {
      return refresh();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_Refresh value) refresh,
    required TResult Function(_CreatePo value) createPo,
  }) {
    return refresh(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_Refresh value)? refresh,
    TResult? Function(_CreatePo value)? createPo,
  }) {
    return refresh?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_Refresh value)? refresh,
    TResult Function(_CreatePo value)? createPo,
    required TResult orElse(),
  }) {
    if (refresh != null) {
      return refresh(this);
    }
    return orElse();
  }
}

abstract class _Refresh implements InventoryEvent {
  const factory _Refresh() = _$RefreshImpl;
}

/// @nodoc
abstract class _$$CreatePoImplCopyWith<$Res> {
  factory _$$CreatePoImplCopyWith(
          _$CreatePoImpl value, $Res Function(_$CreatePoImpl) then) =
      __$$CreatePoImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {String supplierUuid,
      String targetWarehouseUuid,
      List<PurchaseOrderItem> items,
      String? notes});
}

/// @nodoc
class __$$CreatePoImplCopyWithImpl<$Res>
    extends _$InventoryEventCopyWithImpl<$Res, _$CreatePoImpl>
    implements _$$CreatePoImplCopyWith<$Res> {
  __$$CreatePoImplCopyWithImpl(
      _$CreatePoImpl _value, $Res Function(_$CreatePoImpl) _then)
      : super(_value, _then);

  /// Create a copy of InventoryEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? supplierUuid = null,
    Object? targetWarehouseUuid = null,
    Object? items = null,
    Object? notes = freezed,
  }) {
    return _then(_$CreatePoImpl(
      supplierUuid: null == supplierUuid
          ? _value.supplierUuid
          : supplierUuid // ignore: cast_nullable_to_non_nullable
              as String,
      targetWarehouseUuid: null == targetWarehouseUuid
          ? _value.targetWarehouseUuid
          : targetWarehouseUuid // ignore: cast_nullable_to_non_nullable
              as String,
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<PurchaseOrderItem>,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$CreatePoImpl implements _CreatePo {
  const _$CreatePoImpl(
      {required this.supplierUuid,
      required this.targetWarehouseUuid,
      required final List<PurchaseOrderItem> items,
      this.notes})
      : _items = items;

  @override
  final String supplierUuid;
  @override
  final String targetWarehouseUuid;
  final List<PurchaseOrderItem> _items;
  @override
  List<PurchaseOrderItem> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  final String? notes;

  @override
  String toString() {
    return 'InventoryEvent.createPo(supplierUuid: $supplierUuid, targetWarehouseUuid: $targetWarehouseUuid, items: $items, notes: $notes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreatePoImpl &&
            (identical(other.supplierUuid, supplierUuid) ||
                other.supplierUuid == supplierUuid) &&
            (identical(other.targetWarehouseUuid, targetWarehouseUuid) ||
                other.targetWarehouseUuid == targetWarehouseUuid) &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.notes, notes) || other.notes == notes));
  }

  @override
  int get hashCode => Object.hash(runtimeType, supplierUuid,
      targetWarehouseUuid, const DeepCollectionEquality().hash(_items), notes);

  /// Create a copy of InventoryEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreatePoImplCopyWith<_$CreatePoImpl> get copyWith =>
      __$$CreatePoImplCopyWithImpl<_$CreatePoImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() refresh,
    required TResult Function(String supplierUuid, String targetWarehouseUuid,
            List<PurchaseOrderItem> items, String? notes)
        createPo,
  }) {
    return createPo(supplierUuid, targetWarehouseUuid, items, notes);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? refresh,
    TResult? Function(String supplierUuid, String targetWarehouseUuid,
            List<PurchaseOrderItem> items, String? notes)?
        createPo,
  }) {
    return createPo?.call(supplierUuid, targetWarehouseUuid, items, notes);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? refresh,
    TResult Function(String supplierUuid, String targetWarehouseUuid,
            List<PurchaseOrderItem> items, String? notes)?
        createPo,
    required TResult orElse(),
  }) {
    if (createPo != null) {
      return createPo(supplierUuid, targetWarehouseUuid, items, notes);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_Refresh value) refresh,
    required TResult Function(_CreatePo value) createPo,
  }) {
    return createPo(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_Refresh value)? refresh,
    TResult? Function(_CreatePo value)? createPo,
  }) {
    return createPo?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_Refresh value)? refresh,
    TResult Function(_CreatePo value)? createPo,
    required TResult orElse(),
  }) {
    if (createPo != null) {
      return createPo(this);
    }
    return orElse();
  }
}

abstract class _CreatePo implements InventoryEvent {
  const factory _CreatePo(
      {required final String supplierUuid,
      required final String targetWarehouseUuid,
      required final List<PurchaseOrderItem> items,
      final String? notes}) = _$CreatePoImpl;

  String get supplierUuid;
  String get targetWarehouseUuid;
  List<PurchaseOrderItem> get items;
  String? get notes;

  /// Create a copy of InventoryEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreatePoImplCopyWith<_$CreatePoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$InventoryState {
  bool get isLoading => throw _privateConstructorUsedError;
  double get totalStockValue => throw _privateConstructorUsedError;
  List<String> get lowStockProductUuids => throw _privateConstructorUsedError;
  List<PurchaseOrder> get activePurchaseOrders =>
      throw _privateConstructorUsedError;
  List<Supplier> get suppliers => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  /// Create a copy of InventoryState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $InventoryStateCopyWith<InventoryState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InventoryStateCopyWith<$Res> {
  factory $InventoryStateCopyWith(
          InventoryState value, $Res Function(InventoryState) then) =
      _$InventoryStateCopyWithImpl<$Res, InventoryState>;
  @useResult
  $Res call(
      {bool isLoading,
      double totalStockValue,
      List<String> lowStockProductUuids,
      List<PurchaseOrder> activePurchaseOrders,
      List<Supplier> suppliers,
      String? errorMessage});
}

/// @nodoc
class _$InventoryStateCopyWithImpl<$Res, $Val extends InventoryState>
    implements $InventoryStateCopyWith<$Res> {
  _$InventoryStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of InventoryState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? totalStockValue = null,
    Object? lowStockProductUuids = null,
    Object? activePurchaseOrders = null,
    Object? suppliers = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      totalStockValue: null == totalStockValue
          ? _value.totalStockValue
          : totalStockValue // ignore: cast_nullable_to_non_nullable
              as double,
      lowStockProductUuids: null == lowStockProductUuids
          ? _value.lowStockProductUuids
          : lowStockProductUuids // ignore: cast_nullable_to_non_nullable
              as List<String>,
      activePurchaseOrders: null == activePurchaseOrders
          ? _value.activePurchaseOrders
          : activePurchaseOrders // ignore: cast_nullable_to_non_nullable
              as List<PurchaseOrder>,
      suppliers: null == suppliers
          ? _value.suppliers
          : suppliers // ignore: cast_nullable_to_non_nullable
              as List<Supplier>,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InventoryStateImplCopyWith<$Res>
    implements $InventoryStateCopyWith<$Res> {
  factory _$$InventoryStateImplCopyWith(_$InventoryStateImpl value,
          $Res Function(_$InventoryStateImpl) then) =
      __$$InventoryStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      double totalStockValue,
      List<String> lowStockProductUuids,
      List<PurchaseOrder> activePurchaseOrders,
      List<Supplier> suppliers,
      String? errorMessage});
}

/// @nodoc
class __$$InventoryStateImplCopyWithImpl<$Res>
    extends _$InventoryStateCopyWithImpl<$Res, _$InventoryStateImpl>
    implements _$$InventoryStateImplCopyWith<$Res> {
  __$$InventoryStateImplCopyWithImpl(
      _$InventoryStateImpl _value, $Res Function(_$InventoryStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of InventoryState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? totalStockValue = null,
    Object? lowStockProductUuids = null,
    Object? activePurchaseOrders = null,
    Object? suppliers = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_$InventoryStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      totalStockValue: null == totalStockValue
          ? _value.totalStockValue
          : totalStockValue // ignore: cast_nullable_to_non_nullable
              as double,
      lowStockProductUuids: null == lowStockProductUuids
          ? _value._lowStockProductUuids
          : lowStockProductUuids // ignore: cast_nullable_to_non_nullable
              as List<String>,
      activePurchaseOrders: null == activePurchaseOrders
          ? _value._activePurchaseOrders
          : activePurchaseOrders // ignore: cast_nullable_to_non_nullable
              as List<PurchaseOrder>,
      suppliers: null == suppliers
          ? _value._suppliers
          : suppliers // ignore: cast_nullable_to_non_nullable
              as List<Supplier>,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$InventoryStateImpl implements _InventoryState {
  const _$InventoryStateImpl(
      {this.isLoading = false,
      this.totalStockValue = 0,
      final List<String> lowStockProductUuids = const [],
      final List<PurchaseOrder> activePurchaseOrders = const [],
      final List<Supplier> suppliers = const [],
      this.errorMessage})
      : _lowStockProductUuids = lowStockProductUuids,
        _activePurchaseOrders = activePurchaseOrders,
        _suppliers = suppliers;

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final double totalStockValue;
  final List<String> _lowStockProductUuids;
  @override
  @JsonKey()
  List<String> get lowStockProductUuids {
    if (_lowStockProductUuids is EqualUnmodifiableListView)
      return _lowStockProductUuids;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_lowStockProductUuids);
  }

  final List<PurchaseOrder> _activePurchaseOrders;
  @override
  @JsonKey()
  List<PurchaseOrder> get activePurchaseOrders {
    if (_activePurchaseOrders is EqualUnmodifiableListView)
      return _activePurchaseOrders;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_activePurchaseOrders);
  }

  final List<Supplier> _suppliers;
  @override
  @JsonKey()
  List<Supplier> get suppliers {
    if (_suppliers is EqualUnmodifiableListView) return _suppliers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_suppliers);
  }

  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'InventoryState(isLoading: $isLoading, totalStockValue: $totalStockValue, lowStockProductUuids: $lowStockProductUuids, activePurchaseOrders: $activePurchaseOrders, suppliers: $suppliers, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InventoryStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.totalStockValue, totalStockValue) ||
                other.totalStockValue == totalStockValue) &&
            const DeepCollectionEquality()
                .equals(other._lowStockProductUuids, _lowStockProductUuids) &&
            const DeepCollectionEquality()
                .equals(other._activePurchaseOrders, _activePurchaseOrders) &&
            const DeepCollectionEquality()
                .equals(other._suppliers, _suppliers) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      totalStockValue,
      const DeepCollectionEquality().hash(_lowStockProductUuids),
      const DeepCollectionEquality().hash(_activePurchaseOrders),
      const DeepCollectionEquality().hash(_suppliers),
      errorMessage);

  /// Create a copy of InventoryState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InventoryStateImplCopyWith<_$InventoryStateImpl> get copyWith =>
      __$$InventoryStateImplCopyWithImpl<_$InventoryStateImpl>(
          this, _$identity);
}

abstract class _InventoryState implements InventoryState {
  const factory _InventoryState(
      {final bool isLoading,
      final double totalStockValue,
      final List<String> lowStockProductUuids,
      final List<PurchaseOrder> activePurchaseOrders,
      final List<Supplier> suppliers,
      final String? errorMessage}) = _$InventoryStateImpl;

  @override
  bool get isLoading;
  @override
  double get totalStockValue;
  @override
  List<String> get lowStockProductUuids;
  @override
  List<PurchaseOrder> get activePurchaseOrders;
  @override
  List<Supplier> get suppliers;
  @override
  String? get errorMessage;

  /// Create a copy of InventoryState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InventoryStateImplCopyWith<_$InventoryStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
