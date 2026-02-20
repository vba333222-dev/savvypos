// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'inventory_entities.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Supplier _$SupplierFromJson(Map<String, dynamic> json) {
  return _Supplier.fromJson(json);
}

/// @nodoc
mixin _$Supplier {
  String get uuid => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get phone => throw _privateConstructorUsedError;
  String? get address => throw _privateConstructorUsedError;
  int get leadTimeDays => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this Supplier to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Supplier
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SupplierCopyWith<Supplier> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SupplierCopyWith<$Res> {
  factory $SupplierCopyWith(Supplier value, $Res Function(Supplier) then) =
      _$SupplierCopyWithImpl<$Res, Supplier>;
  @useResult
  $Res call(
      {String uuid,
      String name,
      String? email,
      String? phone,
      String? address,
      int leadTimeDays,
      DateTime? updatedAt});
}

/// @nodoc
class _$SupplierCopyWithImpl<$Res, $Val extends Supplier>
    implements $SupplierCopyWith<$Res> {
  _$SupplierCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Supplier
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
    Object? name = null,
    Object? email = freezed,
    Object? phone = freezed,
    Object? address = freezed,
    Object? leadTimeDays = null,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      leadTimeDays: null == leadTimeDays
          ? _value.leadTimeDays
          : leadTimeDays // ignore: cast_nullable_to_non_nullable
              as int,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SupplierImplCopyWith<$Res>
    implements $SupplierCopyWith<$Res> {
  factory _$$SupplierImplCopyWith(
          _$SupplierImpl value, $Res Function(_$SupplierImpl) then) =
      __$$SupplierImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String uuid,
      String name,
      String? email,
      String? phone,
      String? address,
      int leadTimeDays,
      DateTime? updatedAt});
}

/// @nodoc
class __$$SupplierImplCopyWithImpl<$Res>
    extends _$SupplierCopyWithImpl<$Res, _$SupplierImpl>
    implements _$$SupplierImplCopyWith<$Res> {
  __$$SupplierImplCopyWithImpl(
      _$SupplierImpl _value, $Res Function(_$SupplierImpl) _then)
      : super(_value, _then);

  /// Create a copy of Supplier
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
    Object? name = null,
    Object? email = freezed,
    Object? phone = freezed,
    Object? address = freezed,
    Object? leadTimeDays = null,
    Object? updatedAt = freezed,
  }) {
    return _then(_$SupplierImpl(
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      leadTimeDays: null == leadTimeDays
          ? _value.leadTimeDays
          : leadTimeDays // ignore: cast_nullable_to_non_nullable
              as int,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SupplierImpl implements _Supplier {
  const _$SupplierImpl(
      {required this.uuid,
      required this.name,
      this.email,
      this.phone,
      this.address,
      required this.leadTimeDays,
      this.updatedAt});

  factory _$SupplierImpl.fromJson(Map<String, dynamic> json) =>
      _$$SupplierImplFromJson(json);

  @override
  final String uuid;
  @override
  final String name;
  @override
  final String? email;
  @override
  final String? phone;
  @override
  final String? address;
  @override
  final int leadTimeDays;
  @override
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'Supplier(uuid: $uuid, name: $name, email: $email, phone: $phone, address: $address, leadTimeDays: $leadTimeDays, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SupplierImpl &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.leadTimeDays, leadTimeDays) ||
                other.leadTimeDays == leadTimeDays) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, uuid, name, email, phone, address, leadTimeDays, updatedAt);

  /// Create a copy of Supplier
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SupplierImplCopyWith<_$SupplierImpl> get copyWith =>
      __$$SupplierImplCopyWithImpl<_$SupplierImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SupplierImplToJson(
      this,
    );
  }
}

abstract class _Supplier implements Supplier {
  const factory _Supplier(
      {required final String uuid,
      required final String name,
      final String? email,
      final String? phone,
      final String? address,
      required final int leadTimeDays,
      final DateTime? updatedAt}) = _$SupplierImpl;

  factory _Supplier.fromJson(Map<String, dynamic> json) =
      _$SupplierImpl.fromJson;

  @override
  String get uuid;
  @override
  String get name;
  @override
  String? get email;
  @override
  String? get phone;
  @override
  String? get address;
  @override
  int get leadTimeDays;
  @override
  DateTime? get updatedAt;

  /// Create a copy of Supplier
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SupplierImplCopyWith<_$SupplierImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PurchaseOrder _$PurchaseOrderFromJson(Map<String, dynamic> json) {
  return _PurchaseOrder.fromJson(json);
}

/// @nodoc
mixin _$PurchaseOrder {
  String get uuid => throw _privateConstructorUsedError;
  String get supplierUuid => throw _privateConstructorUsedError;
  String get targetWarehouseUuid => throw _privateConstructorUsedError;
  PoStatus get status => throw _privateConstructorUsedError;
  String? get referenceNumber => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;
  double get totalCost => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  List<PurchaseOrderItem> get items => throw _privateConstructorUsedError;

  /// Serializes this PurchaseOrder to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PurchaseOrder
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PurchaseOrderCopyWith<PurchaseOrder> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PurchaseOrderCopyWith<$Res> {
  factory $PurchaseOrderCopyWith(
          PurchaseOrder value, $Res Function(PurchaseOrder) then) =
      _$PurchaseOrderCopyWithImpl<$Res, PurchaseOrder>;
  @useResult
  $Res call(
      {String uuid,
      String supplierUuid,
      String targetWarehouseUuid,
      PoStatus status,
      String? referenceNumber,
      String? notes,
      double totalCost,
      DateTime? createdAt,
      DateTime? updatedAt,
      List<PurchaseOrderItem> items});
}

/// @nodoc
class _$PurchaseOrderCopyWithImpl<$Res, $Val extends PurchaseOrder>
    implements $PurchaseOrderCopyWith<$Res> {
  _$PurchaseOrderCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PurchaseOrder
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
    Object? supplierUuid = null,
    Object? targetWarehouseUuid = null,
    Object? status = null,
    Object? referenceNumber = freezed,
    Object? notes = freezed,
    Object? totalCost = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? items = null,
  }) {
    return _then(_value.copyWith(
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      supplierUuid: null == supplierUuid
          ? _value.supplierUuid
          : supplierUuid // ignore: cast_nullable_to_non_nullable
              as String,
      targetWarehouseUuid: null == targetWarehouseUuid
          ? _value.targetWarehouseUuid
          : targetWarehouseUuid // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as PoStatus,
      referenceNumber: freezed == referenceNumber
          ? _value.referenceNumber
          : referenceNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      totalCost: null == totalCost
          ? _value.totalCost
          : totalCost // ignore: cast_nullable_to_non_nullable
              as double,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<PurchaseOrderItem>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PurchaseOrderImplCopyWith<$Res>
    implements $PurchaseOrderCopyWith<$Res> {
  factory _$$PurchaseOrderImplCopyWith(
          _$PurchaseOrderImpl value, $Res Function(_$PurchaseOrderImpl) then) =
      __$$PurchaseOrderImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String uuid,
      String supplierUuid,
      String targetWarehouseUuid,
      PoStatus status,
      String? referenceNumber,
      String? notes,
      double totalCost,
      DateTime? createdAt,
      DateTime? updatedAt,
      List<PurchaseOrderItem> items});
}

/// @nodoc
class __$$PurchaseOrderImplCopyWithImpl<$Res>
    extends _$PurchaseOrderCopyWithImpl<$Res, _$PurchaseOrderImpl>
    implements _$$PurchaseOrderImplCopyWith<$Res> {
  __$$PurchaseOrderImplCopyWithImpl(
      _$PurchaseOrderImpl _value, $Res Function(_$PurchaseOrderImpl) _then)
      : super(_value, _then);

  /// Create a copy of PurchaseOrder
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
    Object? supplierUuid = null,
    Object? targetWarehouseUuid = null,
    Object? status = null,
    Object? referenceNumber = freezed,
    Object? notes = freezed,
    Object? totalCost = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? items = null,
  }) {
    return _then(_$PurchaseOrderImpl(
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      supplierUuid: null == supplierUuid
          ? _value.supplierUuid
          : supplierUuid // ignore: cast_nullable_to_non_nullable
              as String,
      targetWarehouseUuid: null == targetWarehouseUuid
          ? _value.targetWarehouseUuid
          : targetWarehouseUuid // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as PoStatus,
      referenceNumber: freezed == referenceNumber
          ? _value.referenceNumber
          : referenceNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      totalCost: null == totalCost
          ? _value.totalCost
          : totalCost // ignore: cast_nullable_to_non_nullable
              as double,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<PurchaseOrderItem>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PurchaseOrderImpl implements _PurchaseOrder {
  const _$PurchaseOrderImpl(
      {required this.uuid,
      required this.supplierUuid,
      required this.targetWarehouseUuid,
      required this.status,
      this.referenceNumber,
      this.notes,
      required this.totalCost,
      this.createdAt,
      this.updatedAt,
      final List<PurchaseOrderItem> items = const []})
      : _items = items;

  factory _$PurchaseOrderImpl.fromJson(Map<String, dynamic> json) =>
      _$$PurchaseOrderImplFromJson(json);

  @override
  final String uuid;
  @override
  final String supplierUuid;
  @override
  final String targetWarehouseUuid;
  @override
  final PoStatus status;
  @override
  final String? referenceNumber;
  @override
  final String? notes;
  @override
  final double totalCost;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;
  final List<PurchaseOrderItem> _items;
  @override
  @JsonKey()
  List<PurchaseOrderItem> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  String toString() {
    return 'PurchaseOrder(uuid: $uuid, supplierUuid: $supplierUuid, targetWarehouseUuid: $targetWarehouseUuid, status: $status, referenceNumber: $referenceNumber, notes: $notes, totalCost: $totalCost, createdAt: $createdAt, updatedAt: $updatedAt, items: $items)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PurchaseOrderImpl &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.supplierUuid, supplierUuid) ||
                other.supplierUuid == supplierUuid) &&
            (identical(other.targetWarehouseUuid, targetWarehouseUuid) ||
                other.targetWarehouseUuid == targetWarehouseUuid) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.referenceNumber, referenceNumber) ||
                other.referenceNumber == referenceNumber) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.totalCost, totalCost) ||
                other.totalCost == totalCost) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      uuid,
      supplierUuid,
      targetWarehouseUuid,
      status,
      referenceNumber,
      notes,
      totalCost,
      createdAt,
      updatedAt,
      const DeepCollectionEquality().hash(_items));

  /// Create a copy of PurchaseOrder
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PurchaseOrderImplCopyWith<_$PurchaseOrderImpl> get copyWith =>
      __$$PurchaseOrderImplCopyWithImpl<_$PurchaseOrderImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PurchaseOrderImplToJson(
      this,
    );
  }
}

abstract class _PurchaseOrder implements PurchaseOrder {
  const factory _PurchaseOrder(
      {required final String uuid,
      required final String supplierUuid,
      required final String targetWarehouseUuid,
      required final PoStatus status,
      final String? referenceNumber,
      final String? notes,
      required final double totalCost,
      final DateTime? createdAt,
      final DateTime? updatedAt,
      final List<PurchaseOrderItem> items}) = _$PurchaseOrderImpl;

  factory _PurchaseOrder.fromJson(Map<String, dynamic> json) =
      _$PurchaseOrderImpl.fromJson;

  @override
  String get uuid;
  @override
  String get supplierUuid;
  @override
  String get targetWarehouseUuid;
  @override
  PoStatus get status;
  @override
  String? get referenceNumber;
  @override
  String? get notes;
  @override
  double get totalCost;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;
  @override
  List<PurchaseOrderItem> get items;

  /// Create a copy of PurchaseOrder
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PurchaseOrderImplCopyWith<_$PurchaseOrderImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PurchaseOrderItem _$PurchaseOrderItemFromJson(Map<String, dynamic> json) {
  return _PurchaseOrderItem.fromJson(json);
}

/// @nodoc
mixin _$PurchaseOrderItem {
  String get poUuid => throw _privateConstructorUsedError;
  String? get productUuid => throw _privateConstructorUsedError;
  String? get ingredientUuid => throw _privateConstructorUsedError;
  double get quantityOrdered => throw _privateConstructorUsedError;
  double get quantityReceived => throw _privateConstructorUsedError;
  double get unitCost => throw _privateConstructorUsedError;
  String? get productName => throw _privateConstructorUsedError;

  /// Serializes this PurchaseOrderItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PurchaseOrderItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PurchaseOrderItemCopyWith<PurchaseOrderItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PurchaseOrderItemCopyWith<$Res> {
  factory $PurchaseOrderItemCopyWith(
          PurchaseOrderItem value, $Res Function(PurchaseOrderItem) then) =
      _$PurchaseOrderItemCopyWithImpl<$Res, PurchaseOrderItem>;
  @useResult
  $Res call(
      {String poUuid,
      String? productUuid,
      String? ingredientUuid,
      double quantityOrdered,
      double quantityReceived,
      double unitCost,
      String? productName});
}

/// @nodoc
class _$PurchaseOrderItemCopyWithImpl<$Res, $Val extends PurchaseOrderItem>
    implements $PurchaseOrderItemCopyWith<$Res> {
  _$PurchaseOrderItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PurchaseOrderItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? poUuid = null,
    Object? productUuid = freezed,
    Object? ingredientUuid = freezed,
    Object? quantityOrdered = null,
    Object? quantityReceived = null,
    Object? unitCost = null,
    Object? productName = freezed,
  }) {
    return _then(_value.copyWith(
      poUuid: null == poUuid
          ? _value.poUuid
          : poUuid // ignore: cast_nullable_to_non_nullable
              as String,
      productUuid: freezed == productUuid
          ? _value.productUuid
          : productUuid // ignore: cast_nullable_to_non_nullable
              as String?,
      ingredientUuid: freezed == ingredientUuid
          ? _value.ingredientUuid
          : ingredientUuid // ignore: cast_nullable_to_non_nullable
              as String?,
      quantityOrdered: null == quantityOrdered
          ? _value.quantityOrdered
          : quantityOrdered // ignore: cast_nullable_to_non_nullable
              as double,
      quantityReceived: null == quantityReceived
          ? _value.quantityReceived
          : quantityReceived // ignore: cast_nullable_to_non_nullable
              as double,
      unitCost: null == unitCost
          ? _value.unitCost
          : unitCost // ignore: cast_nullable_to_non_nullable
              as double,
      productName: freezed == productName
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PurchaseOrderItemImplCopyWith<$Res>
    implements $PurchaseOrderItemCopyWith<$Res> {
  factory _$$PurchaseOrderItemImplCopyWith(_$PurchaseOrderItemImpl value,
          $Res Function(_$PurchaseOrderItemImpl) then) =
      __$$PurchaseOrderItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String poUuid,
      String? productUuid,
      String? ingredientUuid,
      double quantityOrdered,
      double quantityReceived,
      double unitCost,
      String? productName});
}

/// @nodoc
class __$$PurchaseOrderItemImplCopyWithImpl<$Res>
    extends _$PurchaseOrderItemCopyWithImpl<$Res, _$PurchaseOrderItemImpl>
    implements _$$PurchaseOrderItemImplCopyWith<$Res> {
  __$$PurchaseOrderItemImplCopyWithImpl(_$PurchaseOrderItemImpl _value,
      $Res Function(_$PurchaseOrderItemImpl) _then)
      : super(_value, _then);

  /// Create a copy of PurchaseOrderItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? poUuid = null,
    Object? productUuid = freezed,
    Object? ingredientUuid = freezed,
    Object? quantityOrdered = null,
    Object? quantityReceived = null,
    Object? unitCost = null,
    Object? productName = freezed,
  }) {
    return _then(_$PurchaseOrderItemImpl(
      poUuid: null == poUuid
          ? _value.poUuid
          : poUuid // ignore: cast_nullable_to_non_nullable
              as String,
      productUuid: freezed == productUuid
          ? _value.productUuid
          : productUuid // ignore: cast_nullable_to_non_nullable
              as String?,
      ingredientUuid: freezed == ingredientUuid
          ? _value.ingredientUuid
          : ingredientUuid // ignore: cast_nullable_to_non_nullable
              as String?,
      quantityOrdered: null == quantityOrdered
          ? _value.quantityOrdered
          : quantityOrdered // ignore: cast_nullable_to_non_nullable
              as double,
      quantityReceived: null == quantityReceived
          ? _value.quantityReceived
          : quantityReceived // ignore: cast_nullable_to_non_nullable
              as double,
      unitCost: null == unitCost
          ? _value.unitCost
          : unitCost // ignore: cast_nullable_to_non_nullable
              as double,
      productName: freezed == productName
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PurchaseOrderItemImpl implements _PurchaseOrderItem {
  const _$PurchaseOrderItemImpl(
      {required this.poUuid,
      this.productUuid,
      this.ingredientUuid,
      required this.quantityOrdered,
      required this.quantityReceived,
      required this.unitCost,
      this.productName});

  factory _$PurchaseOrderItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$PurchaseOrderItemImplFromJson(json);

  @override
  final String poUuid;
  @override
  final String? productUuid;
  @override
  final String? ingredientUuid;
  @override
  final double quantityOrdered;
  @override
  final double quantityReceived;
  @override
  final double unitCost;
  @override
  final String? productName;

  @override
  String toString() {
    return 'PurchaseOrderItem(poUuid: $poUuid, productUuid: $productUuid, ingredientUuid: $ingredientUuid, quantityOrdered: $quantityOrdered, quantityReceived: $quantityReceived, unitCost: $unitCost, productName: $productName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PurchaseOrderItemImpl &&
            (identical(other.poUuid, poUuid) || other.poUuid == poUuid) &&
            (identical(other.productUuid, productUuid) ||
                other.productUuid == productUuid) &&
            (identical(other.ingredientUuid, ingredientUuid) ||
                other.ingredientUuid == ingredientUuid) &&
            (identical(other.quantityOrdered, quantityOrdered) ||
                other.quantityOrdered == quantityOrdered) &&
            (identical(other.quantityReceived, quantityReceived) ||
                other.quantityReceived == quantityReceived) &&
            (identical(other.unitCost, unitCost) ||
                other.unitCost == unitCost) &&
            (identical(other.productName, productName) ||
                other.productName == productName));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, poUuid, productUuid,
      ingredientUuid, quantityOrdered, quantityReceived, unitCost, productName);

  /// Create a copy of PurchaseOrderItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PurchaseOrderItemImplCopyWith<_$PurchaseOrderItemImpl> get copyWith =>
      __$$PurchaseOrderItemImplCopyWithImpl<_$PurchaseOrderItemImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PurchaseOrderItemImplToJson(
      this,
    );
  }
}

abstract class _PurchaseOrderItem implements PurchaseOrderItem {
  const factory _PurchaseOrderItem(
      {required final String poUuid,
      final String? productUuid,
      final String? ingredientUuid,
      required final double quantityOrdered,
      required final double quantityReceived,
      required final double unitCost,
      final String? productName}) = _$PurchaseOrderItemImpl;

  factory _PurchaseOrderItem.fromJson(Map<String, dynamic> json) =
      _$PurchaseOrderItemImpl.fromJson;

  @override
  String get poUuid;
  @override
  String? get productUuid;
  @override
  String? get ingredientUuid;
  @override
  double get quantityOrdered;
  @override
  double get quantityReceived;
  @override
  double get unitCost;
  @override
  String? get productName;

  /// Create a copy of PurchaseOrderItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PurchaseOrderItemImplCopyWith<_$PurchaseOrderItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

StockCount _$StockCountFromJson(Map<String, dynamic> json) {
  return _StockCount.fromJson(json);
}

/// @nodoc
mixin _$StockCount {
  String get uuid => throw _privateConstructorUsedError;
  String get warehouseUuid => throw _privateConstructorUsedError;
  String get status =>
      throw _privateConstructorUsedError; // IN_PROGRESS, COMPLETED
  DateTime get startedAt => throw _privateConstructorUsedError;
  DateTime? get completedAt => throw _privateConstructorUsedError;
  String get conductedBy => throw _privateConstructorUsedError;
  List<StockCountItem> get items => throw _privateConstructorUsedError;

  /// Serializes this StockCount to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of StockCount
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StockCountCopyWith<StockCount> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StockCountCopyWith<$Res> {
  factory $StockCountCopyWith(
          StockCount value, $Res Function(StockCount) then) =
      _$StockCountCopyWithImpl<$Res, StockCount>;
  @useResult
  $Res call(
      {String uuid,
      String warehouseUuid,
      String status,
      DateTime startedAt,
      DateTime? completedAt,
      String conductedBy,
      List<StockCountItem> items});
}

/// @nodoc
class _$StockCountCopyWithImpl<$Res, $Val extends StockCount>
    implements $StockCountCopyWith<$Res> {
  _$StockCountCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StockCount
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
    Object? warehouseUuid = null,
    Object? status = null,
    Object? startedAt = null,
    Object? completedAt = freezed,
    Object? conductedBy = null,
    Object? items = null,
  }) {
    return _then(_value.copyWith(
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      warehouseUuid: null == warehouseUuid
          ? _value.warehouseUuid
          : warehouseUuid // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      startedAt: null == startedAt
          ? _value.startedAt
          : startedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      completedAt: freezed == completedAt
          ? _value.completedAt
          : completedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      conductedBy: null == conductedBy
          ? _value.conductedBy
          : conductedBy // ignore: cast_nullable_to_non_nullable
              as String,
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<StockCountItem>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StockCountImplCopyWith<$Res>
    implements $StockCountCopyWith<$Res> {
  factory _$$StockCountImplCopyWith(
          _$StockCountImpl value, $Res Function(_$StockCountImpl) then) =
      __$$StockCountImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String uuid,
      String warehouseUuid,
      String status,
      DateTime startedAt,
      DateTime? completedAt,
      String conductedBy,
      List<StockCountItem> items});
}

/// @nodoc
class __$$StockCountImplCopyWithImpl<$Res>
    extends _$StockCountCopyWithImpl<$Res, _$StockCountImpl>
    implements _$$StockCountImplCopyWith<$Res> {
  __$$StockCountImplCopyWithImpl(
      _$StockCountImpl _value, $Res Function(_$StockCountImpl) _then)
      : super(_value, _then);

  /// Create a copy of StockCount
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
    Object? warehouseUuid = null,
    Object? status = null,
    Object? startedAt = null,
    Object? completedAt = freezed,
    Object? conductedBy = null,
    Object? items = null,
  }) {
    return _then(_$StockCountImpl(
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      warehouseUuid: null == warehouseUuid
          ? _value.warehouseUuid
          : warehouseUuid // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      startedAt: null == startedAt
          ? _value.startedAt
          : startedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      completedAt: freezed == completedAt
          ? _value.completedAt
          : completedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      conductedBy: null == conductedBy
          ? _value.conductedBy
          : conductedBy // ignore: cast_nullable_to_non_nullable
              as String,
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<StockCountItem>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StockCountImpl implements _StockCount {
  const _$StockCountImpl(
      {required this.uuid,
      required this.warehouseUuid,
      required this.status,
      required this.startedAt,
      this.completedAt,
      required this.conductedBy,
      final List<StockCountItem> items = const []})
      : _items = items;

  factory _$StockCountImpl.fromJson(Map<String, dynamic> json) =>
      _$$StockCountImplFromJson(json);

  @override
  final String uuid;
  @override
  final String warehouseUuid;
  @override
  final String status;
// IN_PROGRESS, COMPLETED
  @override
  final DateTime startedAt;
  @override
  final DateTime? completedAt;
  @override
  final String conductedBy;
  final List<StockCountItem> _items;
  @override
  @JsonKey()
  List<StockCountItem> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  String toString() {
    return 'StockCount(uuid: $uuid, warehouseUuid: $warehouseUuid, status: $status, startedAt: $startedAt, completedAt: $completedAt, conductedBy: $conductedBy, items: $items)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StockCountImpl &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.warehouseUuid, warehouseUuid) ||
                other.warehouseUuid == warehouseUuid) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.startedAt, startedAt) ||
                other.startedAt == startedAt) &&
            (identical(other.completedAt, completedAt) ||
                other.completedAt == completedAt) &&
            (identical(other.conductedBy, conductedBy) ||
                other.conductedBy == conductedBy) &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      uuid,
      warehouseUuid,
      status,
      startedAt,
      completedAt,
      conductedBy,
      const DeepCollectionEquality().hash(_items));

  /// Create a copy of StockCount
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StockCountImplCopyWith<_$StockCountImpl> get copyWith =>
      __$$StockCountImplCopyWithImpl<_$StockCountImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StockCountImplToJson(
      this,
    );
  }
}

abstract class _StockCount implements StockCount {
  const factory _StockCount(
      {required final String uuid,
      required final String warehouseUuid,
      required final String status,
      required final DateTime startedAt,
      final DateTime? completedAt,
      required final String conductedBy,
      final List<StockCountItem> items}) = _$StockCountImpl;

  factory _StockCount.fromJson(Map<String, dynamic> json) =
      _$StockCountImpl.fromJson;

  @override
  String get uuid;
  @override
  String get warehouseUuid;
  @override
  String get status; // IN_PROGRESS, COMPLETED
  @override
  DateTime get startedAt;
  @override
  DateTime? get completedAt;
  @override
  String get conductedBy;
  @override
  List<StockCountItem> get items;

  /// Create a copy of StockCount
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StockCountImplCopyWith<_$StockCountImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

StockCountItem _$StockCountItemFromJson(Map<String, dynamic> json) {
  return _StockCountItem.fromJson(json);
}

/// @nodoc
mixin _$StockCountItem {
  String get countUuid => throw _privateConstructorUsedError;
  String get productUuid => throw _privateConstructorUsedError;
  double get expectedQty => throw _privateConstructorUsedError;
  double get countedQty => throw _privateConstructorUsedError;
  double get variance => throw _privateConstructorUsedError;
  String? get productName => throw _privateConstructorUsedError;

  /// Serializes this StockCountItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of StockCountItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StockCountItemCopyWith<StockCountItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StockCountItemCopyWith<$Res> {
  factory $StockCountItemCopyWith(
          StockCountItem value, $Res Function(StockCountItem) then) =
      _$StockCountItemCopyWithImpl<$Res, StockCountItem>;
  @useResult
  $Res call(
      {String countUuid,
      String productUuid,
      double expectedQty,
      double countedQty,
      double variance,
      String? productName});
}

/// @nodoc
class _$StockCountItemCopyWithImpl<$Res, $Val extends StockCountItem>
    implements $StockCountItemCopyWith<$Res> {
  _$StockCountItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StockCountItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? countUuid = null,
    Object? productUuid = null,
    Object? expectedQty = null,
    Object? countedQty = null,
    Object? variance = null,
    Object? productName = freezed,
  }) {
    return _then(_value.copyWith(
      countUuid: null == countUuid
          ? _value.countUuid
          : countUuid // ignore: cast_nullable_to_non_nullable
              as String,
      productUuid: null == productUuid
          ? _value.productUuid
          : productUuid // ignore: cast_nullable_to_non_nullable
              as String,
      expectedQty: null == expectedQty
          ? _value.expectedQty
          : expectedQty // ignore: cast_nullable_to_non_nullable
              as double,
      countedQty: null == countedQty
          ? _value.countedQty
          : countedQty // ignore: cast_nullable_to_non_nullable
              as double,
      variance: null == variance
          ? _value.variance
          : variance // ignore: cast_nullable_to_non_nullable
              as double,
      productName: freezed == productName
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StockCountItemImplCopyWith<$Res>
    implements $StockCountItemCopyWith<$Res> {
  factory _$$StockCountItemImplCopyWith(_$StockCountItemImpl value,
          $Res Function(_$StockCountItemImpl) then) =
      __$$StockCountItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String countUuid,
      String productUuid,
      double expectedQty,
      double countedQty,
      double variance,
      String? productName});
}

/// @nodoc
class __$$StockCountItemImplCopyWithImpl<$Res>
    extends _$StockCountItemCopyWithImpl<$Res, _$StockCountItemImpl>
    implements _$$StockCountItemImplCopyWith<$Res> {
  __$$StockCountItemImplCopyWithImpl(
      _$StockCountItemImpl _value, $Res Function(_$StockCountItemImpl) _then)
      : super(_value, _then);

  /// Create a copy of StockCountItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? countUuid = null,
    Object? productUuid = null,
    Object? expectedQty = null,
    Object? countedQty = null,
    Object? variance = null,
    Object? productName = freezed,
  }) {
    return _then(_$StockCountItemImpl(
      countUuid: null == countUuid
          ? _value.countUuid
          : countUuid // ignore: cast_nullable_to_non_nullable
              as String,
      productUuid: null == productUuid
          ? _value.productUuid
          : productUuid // ignore: cast_nullable_to_non_nullable
              as String,
      expectedQty: null == expectedQty
          ? _value.expectedQty
          : expectedQty // ignore: cast_nullable_to_non_nullable
              as double,
      countedQty: null == countedQty
          ? _value.countedQty
          : countedQty // ignore: cast_nullable_to_non_nullable
              as double,
      variance: null == variance
          ? _value.variance
          : variance // ignore: cast_nullable_to_non_nullable
              as double,
      productName: freezed == productName
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StockCountItemImpl implements _StockCountItem {
  const _$StockCountItemImpl(
      {required this.countUuid,
      required this.productUuid,
      required this.expectedQty,
      required this.countedQty,
      required this.variance,
      this.productName});

  factory _$StockCountItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$StockCountItemImplFromJson(json);

  @override
  final String countUuid;
  @override
  final String productUuid;
  @override
  final double expectedQty;
  @override
  final double countedQty;
  @override
  final double variance;
  @override
  final String? productName;

  @override
  String toString() {
    return 'StockCountItem(countUuid: $countUuid, productUuid: $productUuid, expectedQty: $expectedQty, countedQty: $countedQty, variance: $variance, productName: $productName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StockCountItemImpl &&
            (identical(other.countUuid, countUuid) ||
                other.countUuid == countUuid) &&
            (identical(other.productUuid, productUuid) ||
                other.productUuid == productUuid) &&
            (identical(other.expectedQty, expectedQty) ||
                other.expectedQty == expectedQty) &&
            (identical(other.countedQty, countedQty) ||
                other.countedQty == countedQty) &&
            (identical(other.variance, variance) ||
                other.variance == variance) &&
            (identical(other.productName, productName) ||
                other.productName == productName));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, countUuid, productUuid,
      expectedQty, countedQty, variance, productName);

  /// Create a copy of StockCountItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StockCountItemImplCopyWith<_$StockCountItemImpl> get copyWith =>
      __$$StockCountItemImplCopyWithImpl<_$StockCountItemImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StockCountItemImplToJson(
      this,
    );
  }
}

abstract class _StockCountItem implements StockCountItem {
  const factory _StockCountItem(
      {required final String countUuid,
      required final String productUuid,
      required final double expectedQty,
      required final double countedQty,
      required final double variance,
      final String? productName}) = _$StockCountItemImpl;

  factory _StockCountItem.fromJson(Map<String, dynamic> json) =
      _$StockCountItemImpl.fromJson;

  @override
  String get countUuid;
  @override
  String get productUuid;
  @override
  double get expectedQty;
  @override
  double get countedQty;
  @override
  double get variance;
  @override
  String? get productName;

  /// Create a copy of StockCountItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StockCountItemImplCopyWith<_$StockCountItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

InventoryLedger _$InventoryLedgerFromJson(Map<String, dynamic> json) {
  return _InventoryLedger.fromJson(json);
}

/// @nodoc
mixin _$InventoryLedger {
  String get productUuid => throw _privateConstructorUsedError;
  double get quantityChange => throw _privateConstructorUsedError;
  String get referenceId => throw _privateConstructorUsedError;
  String get type =>
      throw _privateConstructorUsedError; // sale, restock, waste, audit
  DateTime get timestamp => throw _privateConstructorUsedError;

  /// Serializes this InventoryLedger to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of InventoryLedger
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $InventoryLedgerCopyWith<InventoryLedger> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InventoryLedgerCopyWith<$Res> {
  factory $InventoryLedgerCopyWith(
          InventoryLedger value, $Res Function(InventoryLedger) then) =
      _$InventoryLedgerCopyWithImpl<$Res, InventoryLedger>;
  @useResult
  $Res call(
      {String productUuid,
      double quantityChange,
      String referenceId,
      String type,
      DateTime timestamp});
}

/// @nodoc
class _$InventoryLedgerCopyWithImpl<$Res, $Val extends InventoryLedger>
    implements $InventoryLedgerCopyWith<$Res> {
  _$InventoryLedgerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of InventoryLedger
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productUuid = null,
    Object? quantityChange = null,
    Object? referenceId = null,
    Object? type = null,
    Object? timestamp = null,
  }) {
    return _then(_value.copyWith(
      productUuid: null == productUuid
          ? _value.productUuid
          : productUuid // ignore: cast_nullable_to_non_nullable
              as String,
      quantityChange: null == quantityChange
          ? _value.quantityChange
          : quantityChange // ignore: cast_nullable_to_non_nullable
              as double,
      referenceId: null == referenceId
          ? _value.referenceId
          : referenceId // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InventoryLedgerImplCopyWith<$Res>
    implements $InventoryLedgerCopyWith<$Res> {
  factory _$$InventoryLedgerImplCopyWith(_$InventoryLedgerImpl value,
          $Res Function(_$InventoryLedgerImpl) then) =
      __$$InventoryLedgerImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String productUuid,
      double quantityChange,
      String referenceId,
      String type,
      DateTime timestamp});
}

/// @nodoc
class __$$InventoryLedgerImplCopyWithImpl<$Res>
    extends _$InventoryLedgerCopyWithImpl<$Res, _$InventoryLedgerImpl>
    implements _$$InventoryLedgerImplCopyWith<$Res> {
  __$$InventoryLedgerImplCopyWithImpl(
      _$InventoryLedgerImpl _value, $Res Function(_$InventoryLedgerImpl) _then)
      : super(_value, _then);

  /// Create a copy of InventoryLedger
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productUuid = null,
    Object? quantityChange = null,
    Object? referenceId = null,
    Object? type = null,
    Object? timestamp = null,
  }) {
    return _then(_$InventoryLedgerImpl(
      productUuid: null == productUuid
          ? _value.productUuid
          : productUuid // ignore: cast_nullable_to_non_nullable
              as String,
      quantityChange: null == quantityChange
          ? _value.quantityChange
          : quantityChange // ignore: cast_nullable_to_non_nullable
              as double,
      referenceId: null == referenceId
          ? _value.referenceId
          : referenceId // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$InventoryLedgerImpl implements _InventoryLedger {
  const _$InventoryLedgerImpl(
      {required this.productUuid,
      required this.quantityChange,
      required this.referenceId,
      required this.type,
      required this.timestamp});

  factory _$InventoryLedgerImpl.fromJson(Map<String, dynamic> json) =>
      _$$InventoryLedgerImplFromJson(json);

  @override
  final String productUuid;
  @override
  final double quantityChange;
  @override
  final String referenceId;
  @override
  final String type;
// sale, restock, waste, audit
  @override
  final DateTime timestamp;

  @override
  String toString() {
    return 'InventoryLedger(productUuid: $productUuid, quantityChange: $quantityChange, referenceId: $referenceId, type: $type, timestamp: $timestamp)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InventoryLedgerImpl &&
            (identical(other.productUuid, productUuid) ||
                other.productUuid == productUuid) &&
            (identical(other.quantityChange, quantityChange) ||
                other.quantityChange == quantityChange) &&
            (identical(other.referenceId, referenceId) ||
                other.referenceId == referenceId) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, productUuid, quantityChange, referenceId, type, timestamp);

  /// Create a copy of InventoryLedger
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InventoryLedgerImplCopyWith<_$InventoryLedgerImpl> get copyWith =>
      __$$InventoryLedgerImplCopyWithImpl<_$InventoryLedgerImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$InventoryLedgerImplToJson(
      this,
    );
  }
}

abstract class _InventoryLedger implements InventoryLedger {
  const factory _InventoryLedger(
      {required final String productUuid,
      required final double quantityChange,
      required final String referenceId,
      required final String type,
      required final DateTime timestamp}) = _$InventoryLedgerImpl;

  factory _InventoryLedger.fromJson(Map<String, dynamic> json) =
      _$InventoryLedgerImpl.fromJson;

  @override
  String get productUuid;
  @override
  double get quantityChange;
  @override
  String get referenceId;
  @override
  String get type; // sale, restock, waste, audit
  @override
  DateTime get timestamp;

  /// Create a copy of InventoryLedger
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InventoryLedgerImplCopyWith<_$InventoryLedgerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

StockTransferItem _$StockTransferItemFromJson(Map<String, dynamic> json) {
  return _StockTransferItem.fromJson(json);
}

/// @nodoc
mixin _$StockTransferItem {
  String get productUuid => throw _privateConstructorUsedError;
  double get quantity => throw _privateConstructorUsedError;
  String? get productName => throw _privateConstructorUsedError;

  /// Serializes this StockTransferItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of StockTransferItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StockTransferItemCopyWith<StockTransferItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StockTransferItemCopyWith<$Res> {
  factory $StockTransferItemCopyWith(
          StockTransferItem value, $Res Function(StockTransferItem) then) =
      _$StockTransferItemCopyWithImpl<$Res, StockTransferItem>;
  @useResult
  $Res call({String productUuid, double quantity, String? productName});
}

/// @nodoc
class _$StockTransferItemCopyWithImpl<$Res, $Val extends StockTransferItem>
    implements $StockTransferItemCopyWith<$Res> {
  _$StockTransferItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StockTransferItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productUuid = null,
    Object? quantity = null,
    Object? productName = freezed,
  }) {
    return _then(_value.copyWith(
      productUuid: null == productUuid
          ? _value.productUuid
          : productUuid // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as double,
      productName: freezed == productName
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StockTransferItemImplCopyWith<$Res>
    implements $StockTransferItemCopyWith<$Res> {
  factory _$$StockTransferItemImplCopyWith(_$StockTransferItemImpl value,
          $Res Function(_$StockTransferItemImpl) then) =
      __$$StockTransferItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String productUuid, double quantity, String? productName});
}

/// @nodoc
class __$$StockTransferItemImplCopyWithImpl<$Res>
    extends _$StockTransferItemCopyWithImpl<$Res, _$StockTransferItemImpl>
    implements _$$StockTransferItemImplCopyWith<$Res> {
  __$$StockTransferItemImplCopyWithImpl(_$StockTransferItemImpl _value,
      $Res Function(_$StockTransferItemImpl) _then)
      : super(_value, _then);

  /// Create a copy of StockTransferItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productUuid = null,
    Object? quantity = null,
    Object? productName = freezed,
  }) {
    return _then(_$StockTransferItemImpl(
      productUuid: null == productUuid
          ? _value.productUuid
          : productUuid // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as double,
      productName: freezed == productName
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StockTransferItemImpl implements _StockTransferItem {
  const _$StockTransferItemImpl(
      {required this.productUuid, required this.quantity, this.productName});

  factory _$StockTransferItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$StockTransferItemImplFromJson(json);

  @override
  final String productUuid;
  @override
  final double quantity;
  @override
  final String? productName;

  @override
  String toString() {
    return 'StockTransferItem(productUuid: $productUuid, quantity: $quantity, productName: $productName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StockTransferItemImpl &&
            (identical(other.productUuid, productUuid) ||
                other.productUuid == productUuid) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.productName, productName) ||
                other.productName == productName));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, productUuid, quantity, productName);

  /// Create a copy of StockTransferItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StockTransferItemImplCopyWith<_$StockTransferItemImpl> get copyWith =>
      __$$StockTransferItemImplCopyWithImpl<_$StockTransferItemImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StockTransferItemImplToJson(
      this,
    );
  }
}

abstract class _StockTransferItem implements StockTransferItem {
  const factory _StockTransferItem(
      {required final String productUuid,
      required final double quantity,
      final String? productName}) = _$StockTransferItemImpl;

  factory _StockTransferItem.fromJson(Map<String, dynamic> json) =
      _$StockTransferItemImpl.fromJson;

  @override
  String get productUuid;
  @override
  double get quantity;
  @override
  String? get productName;

  /// Create a copy of StockTransferItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StockTransferItemImplCopyWith<_$StockTransferItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

StockTransfer _$StockTransferFromJson(Map<String, dynamic> json) {
  return _StockTransfer.fromJson(json);
}

/// @nodoc
mixin _$StockTransfer {
  String get uuid => throw _privateConstructorUsedError;
  String get sourceWarehouseUuid => throw _privateConstructorUsedError;
  String get targetWarehouseUuid => throw _privateConstructorUsedError;
  String get status =>
      throw _privateConstructorUsedError; // PENDING, IN_TRANSIT, COMPLETED
  String get createdBy => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get completedAt => throw _privateConstructorUsedError;
  List<StockTransferItem> get items => throw _privateConstructorUsedError;

  /// Serializes this StockTransfer to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of StockTransfer
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StockTransferCopyWith<StockTransfer> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StockTransferCopyWith<$Res> {
  factory $StockTransferCopyWith(
          StockTransfer value, $Res Function(StockTransfer) then) =
      _$StockTransferCopyWithImpl<$Res, StockTransfer>;
  @useResult
  $Res call(
      {String uuid,
      String sourceWarehouseUuid,
      String targetWarehouseUuid,
      String status,
      String createdBy,
      DateTime? createdAt,
      DateTime? completedAt,
      List<StockTransferItem> items});
}

/// @nodoc
class _$StockTransferCopyWithImpl<$Res, $Val extends StockTransfer>
    implements $StockTransferCopyWith<$Res> {
  _$StockTransferCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StockTransfer
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
    Object? sourceWarehouseUuid = null,
    Object? targetWarehouseUuid = null,
    Object? status = null,
    Object? createdBy = null,
    Object? createdAt = freezed,
    Object? completedAt = freezed,
    Object? items = null,
  }) {
    return _then(_value.copyWith(
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      sourceWarehouseUuid: null == sourceWarehouseUuid
          ? _value.sourceWarehouseUuid
          : sourceWarehouseUuid // ignore: cast_nullable_to_non_nullable
              as String,
      targetWarehouseUuid: null == targetWarehouseUuid
          ? _value.targetWarehouseUuid
          : targetWarehouseUuid // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      createdBy: null == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      completedAt: freezed == completedAt
          ? _value.completedAt
          : completedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<StockTransferItem>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StockTransferImplCopyWith<$Res>
    implements $StockTransferCopyWith<$Res> {
  factory _$$StockTransferImplCopyWith(
          _$StockTransferImpl value, $Res Function(_$StockTransferImpl) then) =
      __$$StockTransferImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String uuid,
      String sourceWarehouseUuid,
      String targetWarehouseUuid,
      String status,
      String createdBy,
      DateTime? createdAt,
      DateTime? completedAt,
      List<StockTransferItem> items});
}

/// @nodoc
class __$$StockTransferImplCopyWithImpl<$Res>
    extends _$StockTransferCopyWithImpl<$Res, _$StockTransferImpl>
    implements _$$StockTransferImplCopyWith<$Res> {
  __$$StockTransferImplCopyWithImpl(
      _$StockTransferImpl _value, $Res Function(_$StockTransferImpl) _then)
      : super(_value, _then);

  /// Create a copy of StockTransfer
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
    Object? sourceWarehouseUuid = null,
    Object? targetWarehouseUuid = null,
    Object? status = null,
    Object? createdBy = null,
    Object? createdAt = freezed,
    Object? completedAt = freezed,
    Object? items = null,
  }) {
    return _then(_$StockTransferImpl(
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      sourceWarehouseUuid: null == sourceWarehouseUuid
          ? _value.sourceWarehouseUuid
          : sourceWarehouseUuid // ignore: cast_nullable_to_non_nullable
              as String,
      targetWarehouseUuid: null == targetWarehouseUuid
          ? _value.targetWarehouseUuid
          : targetWarehouseUuid // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      createdBy: null == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      completedAt: freezed == completedAt
          ? _value.completedAt
          : completedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<StockTransferItem>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StockTransferImpl implements _StockTransfer {
  const _$StockTransferImpl(
      {required this.uuid,
      required this.sourceWarehouseUuid,
      required this.targetWarehouseUuid,
      required this.status,
      required this.createdBy,
      this.createdAt,
      this.completedAt,
      final List<StockTransferItem> items = const []})
      : _items = items;

  factory _$StockTransferImpl.fromJson(Map<String, dynamic> json) =>
      _$$StockTransferImplFromJson(json);

  @override
  final String uuid;
  @override
  final String sourceWarehouseUuid;
  @override
  final String targetWarehouseUuid;
  @override
  final String status;
// PENDING, IN_TRANSIT, COMPLETED
  @override
  final String createdBy;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? completedAt;
  final List<StockTransferItem> _items;
  @override
  @JsonKey()
  List<StockTransferItem> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  String toString() {
    return 'StockTransfer(uuid: $uuid, sourceWarehouseUuid: $sourceWarehouseUuid, targetWarehouseUuid: $targetWarehouseUuid, status: $status, createdBy: $createdBy, createdAt: $createdAt, completedAt: $completedAt, items: $items)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StockTransferImpl &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.sourceWarehouseUuid, sourceWarehouseUuid) ||
                other.sourceWarehouseUuid == sourceWarehouseUuid) &&
            (identical(other.targetWarehouseUuid, targetWarehouseUuid) ||
                other.targetWarehouseUuid == targetWarehouseUuid) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.completedAt, completedAt) ||
                other.completedAt == completedAt) &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      uuid,
      sourceWarehouseUuid,
      targetWarehouseUuid,
      status,
      createdBy,
      createdAt,
      completedAt,
      const DeepCollectionEquality().hash(_items));

  /// Create a copy of StockTransfer
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StockTransferImplCopyWith<_$StockTransferImpl> get copyWith =>
      __$$StockTransferImplCopyWithImpl<_$StockTransferImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StockTransferImplToJson(
      this,
    );
  }
}

abstract class _StockTransfer implements StockTransfer {
  const factory _StockTransfer(
      {required final String uuid,
      required final String sourceWarehouseUuid,
      required final String targetWarehouseUuid,
      required final String status,
      required final String createdBy,
      final DateTime? createdAt,
      final DateTime? completedAt,
      final List<StockTransferItem> items}) = _$StockTransferImpl;

  factory _StockTransfer.fromJson(Map<String, dynamic> json) =
      _$StockTransferImpl.fromJson;

  @override
  String get uuid;
  @override
  String get sourceWarehouseUuid;
  @override
  String get targetWarehouseUuid;
  @override
  String get status; // PENDING, IN_TRANSIT, COMPLETED
  @override
  String get createdBy;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get completedAt;
  @override
  List<StockTransferItem> get items;

  /// Create a copy of StockTransfer
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StockTransferImplCopyWith<_$StockTransferImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
