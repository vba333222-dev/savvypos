// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'advanced_inventory_entities.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Warehouse _$WarehouseFromJson(Map<String, dynamic> json) {
  return _Warehouse.fromJson(json);
}

/// @nodoc
mixin _$Warehouse {
  String get uuid => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get code => throw _privateConstructorUsedError;
  WarehouseType get type => throw _privateConstructorUsedError;
  String? get address => throw _privateConstructorUsedError;
  String? get contactPhone => throw _privateConstructorUsedError;
  bool get isPrimary => throw _privateConstructorUsedError;
  bool get isActive => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this Warehouse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Warehouse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WarehouseCopyWith<Warehouse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WarehouseCopyWith<$Res> {
  factory $WarehouseCopyWith(Warehouse value, $Res Function(Warehouse) then) =
      _$WarehouseCopyWithImpl<$Res, Warehouse>;
  @useResult
  $Res call(
      {String uuid,
      String name,
      String code,
      WarehouseType type,
      String? address,
      String? contactPhone,
      bool isPrimary,
      bool isActive,
      DateTime? createdAt,
      DateTime? updatedAt});
}

/// @nodoc
class _$WarehouseCopyWithImpl<$Res, $Val extends Warehouse>
    implements $WarehouseCopyWith<$Res> {
  _$WarehouseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Warehouse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
    Object? name = null,
    Object? code = null,
    Object? type = null,
    Object? address = freezed,
    Object? contactPhone = freezed,
    Object? isPrimary = null,
    Object? isActive = null,
    Object? createdAt = freezed,
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
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as WarehouseType,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      contactPhone: freezed == contactPhone
          ? _value.contactPhone
          : contactPhone // ignore: cast_nullable_to_non_nullable
              as String?,
      isPrimary: null == isPrimary
          ? _value.isPrimary
          : isPrimary // ignore: cast_nullable_to_non_nullable
              as bool,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WarehouseImplCopyWith<$Res>
    implements $WarehouseCopyWith<$Res> {
  factory _$$WarehouseImplCopyWith(
          _$WarehouseImpl value, $Res Function(_$WarehouseImpl) then) =
      __$$WarehouseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String uuid,
      String name,
      String code,
      WarehouseType type,
      String? address,
      String? contactPhone,
      bool isPrimary,
      bool isActive,
      DateTime? createdAt,
      DateTime? updatedAt});
}

/// @nodoc
class __$$WarehouseImplCopyWithImpl<$Res>
    extends _$WarehouseCopyWithImpl<$Res, _$WarehouseImpl>
    implements _$$WarehouseImplCopyWith<$Res> {
  __$$WarehouseImplCopyWithImpl(
      _$WarehouseImpl _value, $Res Function(_$WarehouseImpl) _then)
      : super(_value, _then);

  /// Create a copy of Warehouse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
    Object? name = null,
    Object? code = null,
    Object? type = null,
    Object? address = freezed,
    Object? contactPhone = freezed,
    Object? isPrimary = null,
    Object? isActive = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$WarehouseImpl(
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as WarehouseType,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      contactPhone: freezed == contactPhone
          ? _value.contactPhone
          : contactPhone // ignore: cast_nullable_to_non_nullable
              as String?,
      isPrimary: null == isPrimary
          ? _value.isPrimary
          : isPrimary // ignore: cast_nullable_to_non_nullable
              as bool,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WarehouseImpl implements _Warehouse {
  const _$WarehouseImpl(
      {required this.uuid,
      required this.name,
      required this.code,
      this.type = WarehouseType.warehouse,
      this.address,
      this.contactPhone,
      this.isPrimary = false,
      this.isActive = true,
      this.createdAt,
      this.updatedAt});

  factory _$WarehouseImpl.fromJson(Map<String, dynamic> json) =>
      _$$WarehouseImplFromJson(json);

  @override
  final String uuid;
  @override
  final String name;
  @override
  final String code;
  @override
  @JsonKey()
  final WarehouseType type;
  @override
  final String? address;
  @override
  final String? contactPhone;
  @override
  @JsonKey()
  final bool isPrimary;
  @override
  @JsonKey()
  final bool isActive;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'Warehouse(uuid: $uuid, name: $name, code: $code, type: $type, address: $address, contactPhone: $contactPhone, isPrimary: $isPrimary, isActive: $isActive, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WarehouseImpl &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.contactPhone, contactPhone) ||
                other.contactPhone == contactPhone) &&
            (identical(other.isPrimary, isPrimary) ||
                other.isPrimary == isPrimary) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, uuid, name, code, type, address,
      contactPhone, isPrimary, isActive, createdAt, updatedAt);

  /// Create a copy of Warehouse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WarehouseImplCopyWith<_$WarehouseImpl> get copyWith =>
      __$$WarehouseImplCopyWithImpl<_$WarehouseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WarehouseImplToJson(
      this,
    );
  }
}

abstract class _Warehouse implements Warehouse {
  const factory _Warehouse(
      {required final String uuid,
      required final String name,
      required final String code,
      final WarehouseType type,
      final String? address,
      final String? contactPhone,
      final bool isPrimary,
      final bool isActive,
      final DateTime? createdAt,
      final DateTime? updatedAt}) = _$WarehouseImpl;

  factory _Warehouse.fromJson(Map<String, dynamic> json) =
      _$WarehouseImpl.fromJson;

  @override
  String get uuid;
  @override
  String get name;
  @override
  String get code;
  @override
  WarehouseType get type;
  @override
  String? get address;
  @override
  String? get contactPhone;
  @override
  bool get isPrimary;
  @override
  bool get isActive;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;

  /// Create a copy of Warehouse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WarehouseImplCopyWith<_$WarehouseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

StockLevel _$StockLevelFromJson(Map<String, dynamic> json) {
  return _StockLevel.fromJson(json);
}

/// @nodoc
mixin _$StockLevel {
  String get productUuid => throw _privateConstructorUsedError;
  String get warehouseUuid => throw _privateConstructorUsedError;
  double get quantity => throw _privateConstructorUsedError;
  double get reservedQuantity => throw _privateConstructorUsedError;
  double get availableQuantity => throw _privateConstructorUsedError;
  double? get reorderPoint => throw _privateConstructorUsedError;
  double? get reorderQuantity => throw _privateConstructorUsedError;
  double? get maxStockLevel => throw _privateConstructorUsedError;
  double get averageCost => throw _privateConstructorUsedError;
  double get averageDailySales => throw _privateConstructorUsedError;
  int? get daysOfStock => throw _privateConstructorUsedError;
  DateTime? get lastCountedAt => throw _privateConstructorUsedError;
  DateTime? get lastMovementAt =>
      throw _privateConstructorUsedError; // UI helpers
  String? get productName => throw _privateConstructorUsedError;
  String? get productSku => throw _privateConstructorUsedError;
  String? get warehouseName => throw _privateConstructorUsedError;
  String? get categoryName => throw _privateConstructorUsedError;

  /// Serializes this StockLevel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of StockLevel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StockLevelCopyWith<StockLevel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StockLevelCopyWith<$Res> {
  factory $StockLevelCopyWith(
          StockLevel value, $Res Function(StockLevel) then) =
      _$StockLevelCopyWithImpl<$Res, StockLevel>;
  @useResult
  $Res call(
      {String productUuid,
      String warehouseUuid,
      double quantity,
      double reservedQuantity,
      double availableQuantity,
      double? reorderPoint,
      double? reorderQuantity,
      double? maxStockLevel,
      double averageCost,
      double averageDailySales,
      int? daysOfStock,
      DateTime? lastCountedAt,
      DateTime? lastMovementAt,
      String? productName,
      String? productSku,
      String? warehouseName,
      String? categoryName});
}

/// @nodoc
class _$StockLevelCopyWithImpl<$Res, $Val extends StockLevel>
    implements $StockLevelCopyWith<$Res> {
  _$StockLevelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StockLevel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productUuid = null,
    Object? warehouseUuid = null,
    Object? quantity = null,
    Object? reservedQuantity = null,
    Object? availableQuantity = null,
    Object? reorderPoint = freezed,
    Object? reorderQuantity = freezed,
    Object? maxStockLevel = freezed,
    Object? averageCost = null,
    Object? averageDailySales = null,
    Object? daysOfStock = freezed,
    Object? lastCountedAt = freezed,
    Object? lastMovementAt = freezed,
    Object? productName = freezed,
    Object? productSku = freezed,
    Object? warehouseName = freezed,
    Object? categoryName = freezed,
  }) {
    return _then(_value.copyWith(
      productUuid: null == productUuid
          ? _value.productUuid
          : productUuid // ignore: cast_nullable_to_non_nullable
              as String,
      warehouseUuid: null == warehouseUuid
          ? _value.warehouseUuid
          : warehouseUuid // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as double,
      reservedQuantity: null == reservedQuantity
          ? _value.reservedQuantity
          : reservedQuantity // ignore: cast_nullable_to_non_nullable
              as double,
      availableQuantity: null == availableQuantity
          ? _value.availableQuantity
          : availableQuantity // ignore: cast_nullable_to_non_nullable
              as double,
      reorderPoint: freezed == reorderPoint
          ? _value.reorderPoint
          : reorderPoint // ignore: cast_nullable_to_non_nullable
              as double?,
      reorderQuantity: freezed == reorderQuantity
          ? _value.reorderQuantity
          : reorderQuantity // ignore: cast_nullable_to_non_nullable
              as double?,
      maxStockLevel: freezed == maxStockLevel
          ? _value.maxStockLevel
          : maxStockLevel // ignore: cast_nullable_to_non_nullable
              as double?,
      averageCost: null == averageCost
          ? _value.averageCost
          : averageCost // ignore: cast_nullable_to_non_nullable
              as double,
      averageDailySales: null == averageDailySales
          ? _value.averageDailySales
          : averageDailySales // ignore: cast_nullable_to_non_nullable
              as double,
      daysOfStock: freezed == daysOfStock
          ? _value.daysOfStock
          : daysOfStock // ignore: cast_nullable_to_non_nullable
              as int?,
      lastCountedAt: freezed == lastCountedAt
          ? _value.lastCountedAt
          : lastCountedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      lastMovementAt: freezed == lastMovementAt
          ? _value.lastMovementAt
          : lastMovementAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      productName: freezed == productName
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String?,
      productSku: freezed == productSku
          ? _value.productSku
          : productSku // ignore: cast_nullable_to_non_nullable
              as String?,
      warehouseName: freezed == warehouseName
          ? _value.warehouseName
          : warehouseName // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryName: freezed == categoryName
          ? _value.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StockLevelImplCopyWith<$Res>
    implements $StockLevelCopyWith<$Res> {
  factory _$$StockLevelImplCopyWith(
          _$StockLevelImpl value, $Res Function(_$StockLevelImpl) then) =
      __$$StockLevelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String productUuid,
      String warehouseUuid,
      double quantity,
      double reservedQuantity,
      double availableQuantity,
      double? reorderPoint,
      double? reorderQuantity,
      double? maxStockLevel,
      double averageCost,
      double averageDailySales,
      int? daysOfStock,
      DateTime? lastCountedAt,
      DateTime? lastMovementAt,
      String? productName,
      String? productSku,
      String? warehouseName,
      String? categoryName});
}

/// @nodoc
class __$$StockLevelImplCopyWithImpl<$Res>
    extends _$StockLevelCopyWithImpl<$Res, _$StockLevelImpl>
    implements _$$StockLevelImplCopyWith<$Res> {
  __$$StockLevelImplCopyWithImpl(
      _$StockLevelImpl _value, $Res Function(_$StockLevelImpl) _then)
      : super(_value, _then);

  /// Create a copy of StockLevel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productUuid = null,
    Object? warehouseUuid = null,
    Object? quantity = null,
    Object? reservedQuantity = null,
    Object? availableQuantity = null,
    Object? reorderPoint = freezed,
    Object? reorderQuantity = freezed,
    Object? maxStockLevel = freezed,
    Object? averageCost = null,
    Object? averageDailySales = null,
    Object? daysOfStock = freezed,
    Object? lastCountedAt = freezed,
    Object? lastMovementAt = freezed,
    Object? productName = freezed,
    Object? productSku = freezed,
    Object? warehouseName = freezed,
    Object? categoryName = freezed,
  }) {
    return _then(_$StockLevelImpl(
      productUuid: null == productUuid
          ? _value.productUuid
          : productUuid // ignore: cast_nullable_to_non_nullable
              as String,
      warehouseUuid: null == warehouseUuid
          ? _value.warehouseUuid
          : warehouseUuid // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as double,
      reservedQuantity: null == reservedQuantity
          ? _value.reservedQuantity
          : reservedQuantity // ignore: cast_nullable_to_non_nullable
              as double,
      availableQuantity: null == availableQuantity
          ? _value.availableQuantity
          : availableQuantity // ignore: cast_nullable_to_non_nullable
              as double,
      reorderPoint: freezed == reorderPoint
          ? _value.reorderPoint
          : reorderPoint // ignore: cast_nullable_to_non_nullable
              as double?,
      reorderQuantity: freezed == reorderQuantity
          ? _value.reorderQuantity
          : reorderQuantity // ignore: cast_nullable_to_non_nullable
              as double?,
      maxStockLevel: freezed == maxStockLevel
          ? _value.maxStockLevel
          : maxStockLevel // ignore: cast_nullable_to_non_nullable
              as double?,
      averageCost: null == averageCost
          ? _value.averageCost
          : averageCost // ignore: cast_nullable_to_non_nullable
              as double,
      averageDailySales: null == averageDailySales
          ? _value.averageDailySales
          : averageDailySales // ignore: cast_nullable_to_non_nullable
              as double,
      daysOfStock: freezed == daysOfStock
          ? _value.daysOfStock
          : daysOfStock // ignore: cast_nullable_to_non_nullable
              as int?,
      lastCountedAt: freezed == lastCountedAt
          ? _value.lastCountedAt
          : lastCountedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      lastMovementAt: freezed == lastMovementAt
          ? _value.lastMovementAt
          : lastMovementAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      productName: freezed == productName
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String?,
      productSku: freezed == productSku
          ? _value.productSku
          : productSku // ignore: cast_nullable_to_non_nullable
              as String?,
      warehouseName: freezed == warehouseName
          ? _value.warehouseName
          : warehouseName // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryName: freezed == categoryName
          ? _value.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StockLevelImpl implements _StockLevel {
  const _$StockLevelImpl(
      {required this.productUuid,
      required this.warehouseUuid,
      this.quantity = 0,
      this.reservedQuantity = 0,
      this.availableQuantity = 0,
      this.reorderPoint,
      this.reorderQuantity,
      this.maxStockLevel,
      this.averageCost = 0,
      this.averageDailySales = 0,
      this.daysOfStock,
      this.lastCountedAt,
      this.lastMovementAt,
      this.productName,
      this.productSku,
      this.warehouseName,
      this.categoryName});

  factory _$StockLevelImpl.fromJson(Map<String, dynamic> json) =>
      _$$StockLevelImplFromJson(json);

  @override
  final String productUuid;
  @override
  final String warehouseUuid;
  @override
  @JsonKey()
  final double quantity;
  @override
  @JsonKey()
  final double reservedQuantity;
  @override
  @JsonKey()
  final double availableQuantity;
  @override
  final double? reorderPoint;
  @override
  final double? reorderQuantity;
  @override
  final double? maxStockLevel;
  @override
  @JsonKey()
  final double averageCost;
  @override
  @JsonKey()
  final double averageDailySales;
  @override
  final int? daysOfStock;
  @override
  final DateTime? lastCountedAt;
  @override
  final DateTime? lastMovementAt;
// UI helpers
  @override
  final String? productName;
  @override
  final String? productSku;
  @override
  final String? warehouseName;
  @override
  final String? categoryName;

  @override
  String toString() {
    return 'StockLevel(productUuid: $productUuid, warehouseUuid: $warehouseUuid, quantity: $quantity, reservedQuantity: $reservedQuantity, availableQuantity: $availableQuantity, reorderPoint: $reorderPoint, reorderQuantity: $reorderQuantity, maxStockLevel: $maxStockLevel, averageCost: $averageCost, averageDailySales: $averageDailySales, daysOfStock: $daysOfStock, lastCountedAt: $lastCountedAt, lastMovementAt: $lastMovementAt, productName: $productName, productSku: $productSku, warehouseName: $warehouseName, categoryName: $categoryName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StockLevelImpl &&
            (identical(other.productUuid, productUuid) ||
                other.productUuid == productUuid) &&
            (identical(other.warehouseUuid, warehouseUuid) ||
                other.warehouseUuid == warehouseUuid) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.reservedQuantity, reservedQuantity) ||
                other.reservedQuantity == reservedQuantity) &&
            (identical(other.availableQuantity, availableQuantity) ||
                other.availableQuantity == availableQuantity) &&
            (identical(other.reorderPoint, reorderPoint) ||
                other.reorderPoint == reorderPoint) &&
            (identical(other.reorderQuantity, reorderQuantity) ||
                other.reorderQuantity == reorderQuantity) &&
            (identical(other.maxStockLevel, maxStockLevel) ||
                other.maxStockLevel == maxStockLevel) &&
            (identical(other.averageCost, averageCost) ||
                other.averageCost == averageCost) &&
            (identical(other.averageDailySales, averageDailySales) ||
                other.averageDailySales == averageDailySales) &&
            (identical(other.daysOfStock, daysOfStock) ||
                other.daysOfStock == daysOfStock) &&
            (identical(other.lastCountedAt, lastCountedAt) ||
                other.lastCountedAt == lastCountedAt) &&
            (identical(other.lastMovementAt, lastMovementAt) ||
                other.lastMovementAt == lastMovementAt) &&
            (identical(other.productName, productName) ||
                other.productName == productName) &&
            (identical(other.productSku, productSku) ||
                other.productSku == productSku) &&
            (identical(other.warehouseName, warehouseName) ||
                other.warehouseName == warehouseName) &&
            (identical(other.categoryName, categoryName) ||
                other.categoryName == categoryName));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      productUuid,
      warehouseUuid,
      quantity,
      reservedQuantity,
      availableQuantity,
      reorderPoint,
      reorderQuantity,
      maxStockLevel,
      averageCost,
      averageDailySales,
      daysOfStock,
      lastCountedAt,
      lastMovementAt,
      productName,
      productSku,
      warehouseName,
      categoryName);

  /// Create a copy of StockLevel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StockLevelImplCopyWith<_$StockLevelImpl> get copyWith =>
      __$$StockLevelImplCopyWithImpl<_$StockLevelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StockLevelImplToJson(
      this,
    );
  }
}

abstract class _StockLevel implements StockLevel {
  const factory _StockLevel(
      {required final String productUuid,
      required final String warehouseUuid,
      final double quantity,
      final double reservedQuantity,
      final double availableQuantity,
      final double? reorderPoint,
      final double? reorderQuantity,
      final double? maxStockLevel,
      final double averageCost,
      final double averageDailySales,
      final int? daysOfStock,
      final DateTime? lastCountedAt,
      final DateTime? lastMovementAt,
      final String? productName,
      final String? productSku,
      final String? warehouseName,
      final String? categoryName}) = _$StockLevelImpl;

  factory _StockLevel.fromJson(Map<String, dynamic> json) =
      _$StockLevelImpl.fromJson;

  @override
  String get productUuid;
  @override
  String get warehouseUuid;
  @override
  double get quantity;
  @override
  double get reservedQuantity;
  @override
  double get availableQuantity;
  @override
  double? get reorderPoint;
  @override
  double? get reorderQuantity;
  @override
  double? get maxStockLevel;
  @override
  double get averageCost;
  @override
  double get averageDailySales;
  @override
  int? get daysOfStock;
  @override
  DateTime? get lastCountedAt;
  @override
  DateTime? get lastMovementAt; // UI helpers
  @override
  String? get productName;
  @override
  String? get productSku;
  @override
  String? get warehouseName;
  @override
  String? get categoryName;

  /// Create a copy of StockLevel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StockLevelImplCopyWith<_$StockLevelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Batch _$BatchFromJson(Map<String, dynamic> json) {
  return _Batch.fromJson(json);
}

/// @nodoc
mixin _$Batch {
  String get uuid => throw _privateConstructorUsedError;
  String get productUuid => throw _privateConstructorUsedError;
  String get warehouseUuid => throw _privateConstructorUsedError;
  String get batchNumber => throw _privateConstructorUsedError;
  String? get supplierUuid => throw _privateConstructorUsedError;
  String? get poUuid => throw _privateConstructorUsedError;
  double get initialQuantity => throw _privateConstructorUsedError;
  double get currentQuantity => throw _privateConstructorUsedError;
  double get unitCost => throw _privateConstructorUsedError;
  DateTime? get manufacturedAt => throw _privateConstructorUsedError;
  DateTime? get expiryDate => throw _privateConstructorUsedError;
  DateTime get receivedAt => throw _privateConstructorUsedError;
  BatchStatus get status => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError; // UI helpers
  String? get productName => throw _privateConstructorUsedError;
  String? get supplierName => throw _privateConstructorUsedError;
  int? get daysUntilExpiry => throw _privateConstructorUsedError;

  /// Serializes this Batch to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Batch
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BatchCopyWith<Batch> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BatchCopyWith<$Res> {
  factory $BatchCopyWith(Batch value, $Res Function(Batch) then) =
      _$BatchCopyWithImpl<$Res, Batch>;
  @useResult
  $Res call(
      {String uuid,
      String productUuid,
      String warehouseUuid,
      String batchNumber,
      String? supplierUuid,
      String? poUuid,
      double initialQuantity,
      double currentQuantity,
      double unitCost,
      DateTime? manufacturedAt,
      DateTime? expiryDate,
      DateTime receivedAt,
      BatchStatus status,
      String? notes,
      String? productName,
      String? supplierName,
      int? daysUntilExpiry});
}

/// @nodoc
class _$BatchCopyWithImpl<$Res, $Val extends Batch>
    implements $BatchCopyWith<$Res> {
  _$BatchCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Batch
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
    Object? productUuid = null,
    Object? warehouseUuid = null,
    Object? batchNumber = null,
    Object? supplierUuid = freezed,
    Object? poUuid = freezed,
    Object? initialQuantity = null,
    Object? currentQuantity = null,
    Object? unitCost = null,
    Object? manufacturedAt = freezed,
    Object? expiryDate = freezed,
    Object? receivedAt = null,
    Object? status = null,
    Object? notes = freezed,
    Object? productName = freezed,
    Object? supplierName = freezed,
    Object? daysUntilExpiry = freezed,
  }) {
    return _then(_value.copyWith(
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      productUuid: null == productUuid
          ? _value.productUuid
          : productUuid // ignore: cast_nullable_to_non_nullable
              as String,
      warehouseUuid: null == warehouseUuid
          ? _value.warehouseUuid
          : warehouseUuid // ignore: cast_nullable_to_non_nullable
              as String,
      batchNumber: null == batchNumber
          ? _value.batchNumber
          : batchNumber // ignore: cast_nullable_to_non_nullable
              as String,
      supplierUuid: freezed == supplierUuid
          ? _value.supplierUuid
          : supplierUuid // ignore: cast_nullable_to_non_nullable
              as String?,
      poUuid: freezed == poUuid
          ? _value.poUuid
          : poUuid // ignore: cast_nullable_to_non_nullable
              as String?,
      initialQuantity: null == initialQuantity
          ? _value.initialQuantity
          : initialQuantity // ignore: cast_nullable_to_non_nullable
              as double,
      currentQuantity: null == currentQuantity
          ? _value.currentQuantity
          : currentQuantity // ignore: cast_nullable_to_non_nullable
              as double,
      unitCost: null == unitCost
          ? _value.unitCost
          : unitCost // ignore: cast_nullable_to_non_nullable
              as double,
      manufacturedAt: freezed == manufacturedAt
          ? _value.manufacturedAt
          : manufacturedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      expiryDate: freezed == expiryDate
          ? _value.expiryDate
          : expiryDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      receivedAt: null == receivedAt
          ? _value.receivedAt
          : receivedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as BatchStatus,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      productName: freezed == productName
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String?,
      supplierName: freezed == supplierName
          ? _value.supplierName
          : supplierName // ignore: cast_nullable_to_non_nullable
              as String?,
      daysUntilExpiry: freezed == daysUntilExpiry
          ? _value.daysUntilExpiry
          : daysUntilExpiry // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BatchImplCopyWith<$Res> implements $BatchCopyWith<$Res> {
  factory _$$BatchImplCopyWith(
          _$BatchImpl value, $Res Function(_$BatchImpl) then) =
      __$$BatchImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String uuid,
      String productUuid,
      String warehouseUuid,
      String batchNumber,
      String? supplierUuid,
      String? poUuid,
      double initialQuantity,
      double currentQuantity,
      double unitCost,
      DateTime? manufacturedAt,
      DateTime? expiryDate,
      DateTime receivedAt,
      BatchStatus status,
      String? notes,
      String? productName,
      String? supplierName,
      int? daysUntilExpiry});
}

/// @nodoc
class __$$BatchImplCopyWithImpl<$Res>
    extends _$BatchCopyWithImpl<$Res, _$BatchImpl>
    implements _$$BatchImplCopyWith<$Res> {
  __$$BatchImplCopyWithImpl(
      _$BatchImpl _value, $Res Function(_$BatchImpl) _then)
      : super(_value, _then);

  /// Create a copy of Batch
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
    Object? productUuid = null,
    Object? warehouseUuid = null,
    Object? batchNumber = null,
    Object? supplierUuid = freezed,
    Object? poUuid = freezed,
    Object? initialQuantity = null,
    Object? currentQuantity = null,
    Object? unitCost = null,
    Object? manufacturedAt = freezed,
    Object? expiryDate = freezed,
    Object? receivedAt = null,
    Object? status = null,
    Object? notes = freezed,
    Object? productName = freezed,
    Object? supplierName = freezed,
    Object? daysUntilExpiry = freezed,
  }) {
    return _then(_$BatchImpl(
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      productUuid: null == productUuid
          ? _value.productUuid
          : productUuid // ignore: cast_nullable_to_non_nullable
              as String,
      warehouseUuid: null == warehouseUuid
          ? _value.warehouseUuid
          : warehouseUuid // ignore: cast_nullable_to_non_nullable
              as String,
      batchNumber: null == batchNumber
          ? _value.batchNumber
          : batchNumber // ignore: cast_nullable_to_non_nullable
              as String,
      supplierUuid: freezed == supplierUuid
          ? _value.supplierUuid
          : supplierUuid // ignore: cast_nullable_to_non_nullable
              as String?,
      poUuid: freezed == poUuid
          ? _value.poUuid
          : poUuid // ignore: cast_nullable_to_non_nullable
              as String?,
      initialQuantity: null == initialQuantity
          ? _value.initialQuantity
          : initialQuantity // ignore: cast_nullable_to_non_nullable
              as double,
      currentQuantity: null == currentQuantity
          ? _value.currentQuantity
          : currentQuantity // ignore: cast_nullable_to_non_nullable
              as double,
      unitCost: null == unitCost
          ? _value.unitCost
          : unitCost // ignore: cast_nullable_to_non_nullable
              as double,
      manufacturedAt: freezed == manufacturedAt
          ? _value.manufacturedAt
          : manufacturedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      expiryDate: freezed == expiryDate
          ? _value.expiryDate
          : expiryDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      receivedAt: null == receivedAt
          ? _value.receivedAt
          : receivedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as BatchStatus,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      productName: freezed == productName
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String?,
      supplierName: freezed == supplierName
          ? _value.supplierName
          : supplierName // ignore: cast_nullable_to_non_nullable
              as String?,
      daysUntilExpiry: freezed == daysUntilExpiry
          ? _value.daysUntilExpiry
          : daysUntilExpiry // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BatchImpl implements _Batch {
  const _$BatchImpl(
      {required this.uuid,
      required this.productUuid,
      required this.warehouseUuid,
      required this.batchNumber,
      this.supplierUuid,
      this.poUuid,
      required this.initialQuantity,
      required this.currentQuantity,
      required this.unitCost,
      this.manufacturedAt,
      this.expiryDate,
      required this.receivedAt,
      this.status = BatchStatus.active,
      this.notes,
      this.productName,
      this.supplierName,
      this.daysUntilExpiry});

  factory _$BatchImpl.fromJson(Map<String, dynamic> json) =>
      _$$BatchImplFromJson(json);

  @override
  final String uuid;
  @override
  final String productUuid;
  @override
  final String warehouseUuid;
  @override
  final String batchNumber;
  @override
  final String? supplierUuid;
  @override
  final String? poUuid;
  @override
  final double initialQuantity;
  @override
  final double currentQuantity;
  @override
  final double unitCost;
  @override
  final DateTime? manufacturedAt;
  @override
  final DateTime? expiryDate;
  @override
  final DateTime receivedAt;
  @override
  @JsonKey()
  final BatchStatus status;
  @override
  final String? notes;
// UI helpers
  @override
  final String? productName;
  @override
  final String? supplierName;
  @override
  final int? daysUntilExpiry;

  @override
  String toString() {
    return 'Batch(uuid: $uuid, productUuid: $productUuid, warehouseUuid: $warehouseUuid, batchNumber: $batchNumber, supplierUuid: $supplierUuid, poUuid: $poUuid, initialQuantity: $initialQuantity, currentQuantity: $currentQuantity, unitCost: $unitCost, manufacturedAt: $manufacturedAt, expiryDate: $expiryDate, receivedAt: $receivedAt, status: $status, notes: $notes, productName: $productName, supplierName: $supplierName, daysUntilExpiry: $daysUntilExpiry)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BatchImpl &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.productUuid, productUuid) ||
                other.productUuid == productUuid) &&
            (identical(other.warehouseUuid, warehouseUuid) ||
                other.warehouseUuid == warehouseUuid) &&
            (identical(other.batchNumber, batchNumber) ||
                other.batchNumber == batchNumber) &&
            (identical(other.supplierUuid, supplierUuid) ||
                other.supplierUuid == supplierUuid) &&
            (identical(other.poUuid, poUuid) || other.poUuid == poUuid) &&
            (identical(other.initialQuantity, initialQuantity) ||
                other.initialQuantity == initialQuantity) &&
            (identical(other.currentQuantity, currentQuantity) ||
                other.currentQuantity == currentQuantity) &&
            (identical(other.unitCost, unitCost) ||
                other.unitCost == unitCost) &&
            (identical(other.manufacturedAt, manufacturedAt) ||
                other.manufacturedAt == manufacturedAt) &&
            (identical(other.expiryDate, expiryDate) ||
                other.expiryDate == expiryDate) &&
            (identical(other.receivedAt, receivedAt) ||
                other.receivedAt == receivedAt) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.productName, productName) ||
                other.productName == productName) &&
            (identical(other.supplierName, supplierName) ||
                other.supplierName == supplierName) &&
            (identical(other.daysUntilExpiry, daysUntilExpiry) ||
                other.daysUntilExpiry == daysUntilExpiry));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      uuid,
      productUuid,
      warehouseUuid,
      batchNumber,
      supplierUuid,
      poUuid,
      initialQuantity,
      currentQuantity,
      unitCost,
      manufacturedAt,
      expiryDate,
      receivedAt,
      status,
      notes,
      productName,
      supplierName,
      daysUntilExpiry);

  /// Create a copy of Batch
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BatchImplCopyWith<_$BatchImpl> get copyWith =>
      __$$BatchImplCopyWithImpl<_$BatchImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BatchImplToJson(
      this,
    );
  }
}

abstract class _Batch implements Batch {
  const factory _Batch(
      {required final String uuid,
      required final String productUuid,
      required final String warehouseUuid,
      required final String batchNumber,
      final String? supplierUuid,
      final String? poUuid,
      required final double initialQuantity,
      required final double currentQuantity,
      required final double unitCost,
      final DateTime? manufacturedAt,
      final DateTime? expiryDate,
      required final DateTime receivedAt,
      final BatchStatus status,
      final String? notes,
      final String? productName,
      final String? supplierName,
      final int? daysUntilExpiry}) = _$BatchImpl;

  factory _Batch.fromJson(Map<String, dynamic> json) = _$BatchImpl.fromJson;

  @override
  String get uuid;
  @override
  String get productUuid;
  @override
  String get warehouseUuid;
  @override
  String get batchNumber;
  @override
  String? get supplierUuid;
  @override
  String? get poUuid;
  @override
  double get initialQuantity;
  @override
  double get currentQuantity;
  @override
  double get unitCost;
  @override
  DateTime? get manufacturedAt;
  @override
  DateTime? get expiryDate;
  @override
  DateTime get receivedAt;
  @override
  BatchStatus get status;
  @override
  String? get notes; // UI helpers
  @override
  String? get productName;
  @override
  String? get supplierName;
  @override
  int? get daysUntilExpiry;

  /// Create a copy of Batch
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BatchImplCopyWith<_$BatchImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

StockAlert _$StockAlertFromJson(Map<String, dynamic> json) {
  return _StockAlert.fromJson(json);
}

/// @nodoc
mixin _$StockAlert {
  String get uuid => throw _privateConstructorUsedError;
  String get productUuid => throw _privateConstructorUsedError;
  String get productName => throw _privateConstructorUsedError;
  String? get warehouseUuid => throw _privateConstructorUsedError;
  String? get warehouseName => throw _privateConstructorUsedError;
  AlertType get alertType => throw _privateConstructorUsedError;
  AlertSeverity get severity => throw _privateConstructorUsedError;
  double? get currentValue => throw _privateConstructorUsedError;
  double? get thresholdValue => throw _privateConstructorUsedError;
  int? get daysBeforeExpiry => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  bool get isAcknowledged => throw _privateConstructorUsedError;
  String? get acknowledgedBy => throw _privateConstructorUsedError;
  DateTime? get acknowledgedAt => throw _privateConstructorUsedError;
  String? get actionTaken => throw _privateConstructorUsedError;
  bool get isResolved => throw _privateConstructorUsedError;
  DateTime? get resolvedAt => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;

  /// Serializes this StockAlert to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of StockAlert
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StockAlertCopyWith<StockAlert> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StockAlertCopyWith<$Res> {
  factory $StockAlertCopyWith(
          StockAlert value, $Res Function(StockAlert) then) =
      _$StockAlertCopyWithImpl<$Res, StockAlert>;
  @useResult
  $Res call(
      {String uuid,
      String productUuid,
      String productName,
      String? warehouseUuid,
      String? warehouseName,
      AlertType alertType,
      AlertSeverity severity,
      double? currentValue,
      double? thresholdValue,
      int? daysBeforeExpiry,
      String message,
      bool isAcknowledged,
      String? acknowledgedBy,
      DateTime? acknowledgedAt,
      String? actionTaken,
      bool isResolved,
      DateTime? resolvedAt,
      DateTime? createdAt});
}

/// @nodoc
class _$StockAlertCopyWithImpl<$Res, $Val extends StockAlert>
    implements $StockAlertCopyWith<$Res> {
  _$StockAlertCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StockAlert
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
    Object? productUuid = null,
    Object? productName = null,
    Object? warehouseUuid = freezed,
    Object? warehouseName = freezed,
    Object? alertType = null,
    Object? severity = null,
    Object? currentValue = freezed,
    Object? thresholdValue = freezed,
    Object? daysBeforeExpiry = freezed,
    Object? message = null,
    Object? isAcknowledged = null,
    Object? acknowledgedBy = freezed,
    Object? acknowledgedAt = freezed,
    Object? actionTaken = freezed,
    Object? isResolved = null,
    Object? resolvedAt = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_value.copyWith(
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      productUuid: null == productUuid
          ? _value.productUuid
          : productUuid // ignore: cast_nullable_to_non_nullable
              as String,
      productName: null == productName
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String,
      warehouseUuid: freezed == warehouseUuid
          ? _value.warehouseUuid
          : warehouseUuid // ignore: cast_nullable_to_non_nullable
              as String?,
      warehouseName: freezed == warehouseName
          ? _value.warehouseName
          : warehouseName // ignore: cast_nullable_to_non_nullable
              as String?,
      alertType: null == alertType
          ? _value.alertType
          : alertType // ignore: cast_nullable_to_non_nullable
              as AlertType,
      severity: null == severity
          ? _value.severity
          : severity // ignore: cast_nullable_to_non_nullable
              as AlertSeverity,
      currentValue: freezed == currentValue
          ? _value.currentValue
          : currentValue // ignore: cast_nullable_to_non_nullable
              as double?,
      thresholdValue: freezed == thresholdValue
          ? _value.thresholdValue
          : thresholdValue // ignore: cast_nullable_to_non_nullable
              as double?,
      daysBeforeExpiry: freezed == daysBeforeExpiry
          ? _value.daysBeforeExpiry
          : daysBeforeExpiry // ignore: cast_nullable_to_non_nullable
              as int?,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      isAcknowledged: null == isAcknowledged
          ? _value.isAcknowledged
          : isAcknowledged // ignore: cast_nullable_to_non_nullable
              as bool,
      acknowledgedBy: freezed == acknowledgedBy
          ? _value.acknowledgedBy
          : acknowledgedBy // ignore: cast_nullable_to_non_nullable
              as String?,
      acknowledgedAt: freezed == acknowledgedAt
          ? _value.acknowledgedAt
          : acknowledgedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      actionTaken: freezed == actionTaken
          ? _value.actionTaken
          : actionTaken // ignore: cast_nullable_to_non_nullable
              as String?,
      isResolved: null == isResolved
          ? _value.isResolved
          : isResolved // ignore: cast_nullable_to_non_nullable
              as bool,
      resolvedAt: freezed == resolvedAt
          ? _value.resolvedAt
          : resolvedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StockAlertImplCopyWith<$Res>
    implements $StockAlertCopyWith<$Res> {
  factory _$$StockAlertImplCopyWith(
          _$StockAlertImpl value, $Res Function(_$StockAlertImpl) then) =
      __$$StockAlertImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String uuid,
      String productUuid,
      String productName,
      String? warehouseUuid,
      String? warehouseName,
      AlertType alertType,
      AlertSeverity severity,
      double? currentValue,
      double? thresholdValue,
      int? daysBeforeExpiry,
      String message,
      bool isAcknowledged,
      String? acknowledgedBy,
      DateTime? acknowledgedAt,
      String? actionTaken,
      bool isResolved,
      DateTime? resolvedAt,
      DateTime? createdAt});
}

/// @nodoc
class __$$StockAlertImplCopyWithImpl<$Res>
    extends _$StockAlertCopyWithImpl<$Res, _$StockAlertImpl>
    implements _$$StockAlertImplCopyWith<$Res> {
  __$$StockAlertImplCopyWithImpl(
      _$StockAlertImpl _value, $Res Function(_$StockAlertImpl) _then)
      : super(_value, _then);

  /// Create a copy of StockAlert
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
    Object? productUuid = null,
    Object? productName = null,
    Object? warehouseUuid = freezed,
    Object? warehouseName = freezed,
    Object? alertType = null,
    Object? severity = null,
    Object? currentValue = freezed,
    Object? thresholdValue = freezed,
    Object? daysBeforeExpiry = freezed,
    Object? message = null,
    Object? isAcknowledged = null,
    Object? acknowledgedBy = freezed,
    Object? acknowledgedAt = freezed,
    Object? actionTaken = freezed,
    Object? isResolved = null,
    Object? resolvedAt = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_$StockAlertImpl(
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      productUuid: null == productUuid
          ? _value.productUuid
          : productUuid // ignore: cast_nullable_to_non_nullable
              as String,
      productName: null == productName
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String,
      warehouseUuid: freezed == warehouseUuid
          ? _value.warehouseUuid
          : warehouseUuid // ignore: cast_nullable_to_non_nullable
              as String?,
      warehouseName: freezed == warehouseName
          ? _value.warehouseName
          : warehouseName // ignore: cast_nullable_to_non_nullable
              as String?,
      alertType: null == alertType
          ? _value.alertType
          : alertType // ignore: cast_nullable_to_non_nullable
              as AlertType,
      severity: null == severity
          ? _value.severity
          : severity // ignore: cast_nullable_to_non_nullable
              as AlertSeverity,
      currentValue: freezed == currentValue
          ? _value.currentValue
          : currentValue // ignore: cast_nullable_to_non_nullable
              as double?,
      thresholdValue: freezed == thresholdValue
          ? _value.thresholdValue
          : thresholdValue // ignore: cast_nullable_to_non_nullable
              as double?,
      daysBeforeExpiry: freezed == daysBeforeExpiry
          ? _value.daysBeforeExpiry
          : daysBeforeExpiry // ignore: cast_nullable_to_non_nullable
              as int?,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      isAcknowledged: null == isAcknowledged
          ? _value.isAcknowledged
          : isAcknowledged // ignore: cast_nullable_to_non_nullable
              as bool,
      acknowledgedBy: freezed == acknowledgedBy
          ? _value.acknowledgedBy
          : acknowledgedBy // ignore: cast_nullable_to_non_nullable
              as String?,
      acknowledgedAt: freezed == acknowledgedAt
          ? _value.acknowledgedAt
          : acknowledgedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      actionTaken: freezed == actionTaken
          ? _value.actionTaken
          : actionTaken // ignore: cast_nullable_to_non_nullable
              as String?,
      isResolved: null == isResolved
          ? _value.isResolved
          : isResolved // ignore: cast_nullable_to_non_nullable
              as bool,
      resolvedAt: freezed == resolvedAt
          ? _value.resolvedAt
          : resolvedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StockAlertImpl implements _StockAlert {
  const _$StockAlertImpl(
      {required this.uuid,
      required this.productUuid,
      required this.productName,
      this.warehouseUuid,
      this.warehouseName,
      required this.alertType,
      this.severity = AlertSeverity.warning,
      this.currentValue,
      this.thresholdValue,
      this.daysBeforeExpiry,
      required this.message,
      this.isAcknowledged = false,
      this.acknowledgedBy,
      this.acknowledgedAt,
      this.actionTaken,
      this.isResolved = false,
      this.resolvedAt,
      this.createdAt});

  factory _$StockAlertImpl.fromJson(Map<String, dynamic> json) =>
      _$$StockAlertImplFromJson(json);

  @override
  final String uuid;
  @override
  final String productUuid;
  @override
  final String productName;
  @override
  final String? warehouseUuid;
  @override
  final String? warehouseName;
  @override
  final AlertType alertType;
  @override
  @JsonKey()
  final AlertSeverity severity;
  @override
  final double? currentValue;
  @override
  final double? thresholdValue;
  @override
  final int? daysBeforeExpiry;
  @override
  final String message;
  @override
  @JsonKey()
  final bool isAcknowledged;
  @override
  final String? acknowledgedBy;
  @override
  final DateTime? acknowledgedAt;
  @override
  final String? actionTaken;
  @override
  @JsonKey()
  final bool isResolved;
  @override
  final DateTime? resolvedAt;
  @override
  final DateTime? createdAt;

  @override
  String toString() {
    return 'StockAlert(uuid: $uuid, productUuid: $productUuid, productName: $productName, warehouseUuid: $warehouseUuid, warehouseName: $warehouseName, alertType: $alertType, severity: $severity, currentValue: $currentValue, thresholdValue: $thresholdValue, daysBeforeExpiry: $daysBeforeExpiry, message: $message, isAcknowledged: $isAcknowledged, acknowledgedBy: $acknowledgedBy, acknowledgedAt: $acknowledgedAt, actionTaken: $actionTaken, isResolved: $isResolved, resolvedAt: $resolvedAt, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StockAlertImpl &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.productUuid, productUuid) ||
                other.productUuid == productUuid) &&
            (identical(other.productName, productName) ||
                other.productName == productName) &&
            (identical(other.warehouseUuid, warehouseUuid) ||
                other.warehouseUuid == warehouseUuid) &&
            (identical(other.warehouseName, warehouseName) ||
                other.warehouseName == warehouseName) &&
            (identical(other.alertType, alertType) ||
                other.alertType == alertType) &&
            (identical(other.severity, severity) ||
                other.severity == severity) &&
            (identical(other.currentValue, currentValue) ||
                other.currentValue == currentValue) &&
            (identical(other.thresholdValue, thresholdValue) ||
                other.thresholdValue == thresholdValue) &&
            (identical(other.daysBeforeExpiry, daysBeforeExpiry) ||
                other.daysBeforeExpiry == daysBeforeExpiry) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.isAcknowledged, isAcknowledged) ||
                other.isAcknowledged == isAcknowledged) &&
            (identical(other.acknowledgedBy, acknowledgedBy) ||
                other.acknowledgedBy == acknowledgedBy) &&
            (identical(other.acknowledgedAt, acknowledgedAt) ||
                other.acknowledgedAt == acknowledgedAt) &&
            (identical(other.actionTaken, actionTaken) ||
                other.actionTaken == actionTaken) &&
            (identical(other.isResolved, isResolved) ||
                other.isResolved == isResolved) &&
            (identical(other.resolvedAt, resolvedAt) ||
                other.resolvedAt == resolvedAt) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      uuid,
      productUuid,
      productName,
      warehouseUuid,
      warehouseName,
      alertType,
      severity,
      currentValue,
      thresholdValue,
      daysBeforeExpiry,
      message,
      isAcknowledged,
      acknowledgedBy,
      acknowledgedAt,
      actionTaken,
      isResolved,
      resolvedAt,
      createdAt);

  /// Create a copy of StockAlert
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StockAlertImplCopyWith<_$StockAlertImpl> get copyWith =>
      __$$StockAlertImplCopyWithImpl<_$StockAlertImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StockAlertImplToJson(
      this,
    );
  }
}

abstract class _StockAlert implements StockAlert {
  const factory _StockAlert(
      {required final String uuid,
      required final String productUuid,
      required final String productName,
      final String? warehouseUuid,
      final String? warehouseName,
      required final AlertType alertType,
      final AlertSeverity severity,
      final double? currentValue,
      final double? thresholdValue,
      final int? daysBeforeExpiry,
      required final String message,
      final bool isAcknowledged,
      final String? acknowledgedBy,
      final DateTime? acknowledgedAt,
      final String? actionTaken,
      final bool isResolved,
      final DateTime? resolvedAt,
      final DateTime? createdAt}) = _$StockAlertImpl;

  factory _StockAlert.fromJson(Map<String, dynamic> json) =
      _$StockAlertImpl.fromJson;

  @override
  String get uuid;
  @override
  String get productUuid;
  @override
  String get productName;
  @override
  String? get warehouseUuid;
  @override
  String? get warehouseName;
  @override
  AlertType get alertType;
  @override
  AlertSeverity get severity;
  @override
  double? get currentValue;
  @override
  double? get thresholdValue;
  @override
  int? get daysBeforeExpiry;
  @override
  String get message;
  @override
  bool get isAcknowledged;
  @override
  String? get acknowledgedBy;
  @override
  DateTime? get acknowledgedAt;
  @override
  String? get actionTaken;
  @override
  bool get isResolved;
  @override
  DateTime? get resolvedAt;
  @override
  DateTime? get createdAt;

  /// Create a copy of StockAlert
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StockAlertImplCopyWith<_$StockAlertImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

StockAlertConfig _$StockAlertConfigFromJson(Map<String, dynamic> json) {
  return _StockAlertConfig.fromJson(json);
}

/// @nodoc
mixin _$StockAlertConfig {
  String get uuid => throw _privateConstructorUsedError;
  String get productUuid => throw _privateConstructorUsedError;
  String? get warehouseUuid => throw _privateConstructorUsedError;
  double? get lowStockThreshold => throw _privateConstructorUsedError;
  double? get criticalStockThreshold => throw _privateConstructorUsedError;
  double? get overstockThreshold => throw _privateConstructorUsedError;
  int get expiryWarningDays => throw _privateConstructorUsedError;
  bool get lowStockEmailEnabled => throw _privateConstructorUsedError;
  bool get outOfStockEmailEnabled => throw _privateConstructorUsedError;
  bool get expiryEmailEnabled => throw _privateConstructorUsedError;

  /// Serializes this StockAlertConfig to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of StockAlertConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StockAlertConfigCopyWith<StockAlertConfig> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StockAlertConfigCopyWith<$Res> {
  factory $StockAlertConfigCopyWith(
          StockAlertConfig value, $Res Function(StockAlertConfig) then) =
      _$StockAlertConfigCopyWithImpl<$Res, StockAlertConfig>;
  @useResult
  $Res call(
      {String uuid,
      String productUuid,
      String? warehouseUuid,
      double? lowStockThreshold,
      double? criticalStockThreshold,
      double? overstockThreshold,
      int expiryWarningDays,
      bool lowStockEmailEnabled,
      bool outOfStockEmailEnabled,
      bool expiryEmailEnabled});
}

/// @nodoc
class _$StockAlertConfigCopyWithImpl<$Res, $Val extends StockAlertConfig>
    implements $StockAlertConfigCopyWith<$Res> {
  _$StockAlertConfigCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StockAlertConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
    Object? productUuid = null,
    Object? warehouseUuid = freezed,
    Object? lowStockThreshold = freezed,
    Object? criticalStockThreshold = freezed,
    Object? overstockThreshold = freezed,
    Object? expiryWarningDays = null,
    Object? lowStockEmailEnabled = null,
    Object? outOfStockEmailEnabled = null,
    Object? expiryEmailEnabled = null,
  }) {
    return _then(_value.copyWith(
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      productUuid: null == productUuid
          ? _value.productUuid
          : productUuid // ignore: cast_nullable_to_non_nullable
              as String,
      warehouseUuid: freezed == warehouseUuid
          ? _value.warehouseUuid
          : warehouseUuid // ignore: cast_nullable_to_non_nullable
              as String?,
      lowStockThreshold: freezed == lowStockThreshold
          ? _value.lowStockThreshold
          : lowStockThreshold // ignore: cast_nullable_to_non_nullable
              as double?,
      criticalStockThreshold: freezed == criticalStockThreshold
          ? _value.criticalStockThreshold
          : criticalStockThreshold // ignore: cast_nullable_to_non_nullable
              as double?,
      overstockThreshold: freezed == overstockThreshold
          ? _value.overstockThreshold
          : overstockThreshold // ignore: cast_nullable_to_non_nullable
              as double?,
      expiryWarningDays: null == expiryWarningDays
          ? _value.expiryWarningDays
          : expiryWarningDays // ignore: cast_nullable_to_non_nullable
              as int,
      lowStockEmailEnabled: null == lowStockEmailEnabled
          ? _value.lowStockEmailEnabled
          : lowStockEmailEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      outOfStockEmailEnabled: null == outOfStockEmailEnabled
          ? _value.outOfStockEmailEnabled
          : outOfStockEmailEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      expiryEmailEnabled: null == expiryEmailEnabled
          ? _value.expiryEmailEnabled
          : expiryEmailEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StockAlertConfigImplCopyWith<$Res>
    implements $StockAlertConfigCopyWith<$Res> {
  factory _$$StockAlertConfigImplCopyWith(_$StockAlertConfigImpl value,
          $Res Function(_$StockAlertConfigImpl) then) =
      __$$StockAlertConfigImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String uuid,
      String productUuid,
      String? warehouseUuid,
      double? lowStockThreshold,
      double? criticalStockThreshold,
      double? overstockThreshold,
      int expiryWarningDays,
      bool lowStockEmailEnabled,
      bool outOfStockEmailEnabled,
      bool expiryEmailEnabled});
}

/// @nodoc
class __$$StockAlertConfigImplCopyWithImpl<$Res>
    extends _$StockAlertConfigCopyWithImpl<$Res, _$StockAlertConfigImpl>
    implements _$$StockAlertConfigImplCopyWith<$Res> {
  __$$StockAlertConfigImplCopyWithImpl(_$StockAlertConfigImpl _value,
      $Res Function(_$StockAlertConfigImpl) _then)
      : super(_value, _then);

  /// Create a copy of StockAlertConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
    Object? productUuid = null,
    Object? warehouseUuid = freezed,
    Object? lowStockThreshold = freezed,
    Object? criticalStockThreshold = freezed,
    Object? overstockThreshold = freezed,
    Object? expiryWarningDays = null,
    Object? lowStockEmailEnabled = null,
    Object? outOfStockEmailEnabled = null,
    Object? expiryEmailEnabled = null,
  }) {
    return _then(_$StockAlertConfigImpl(
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      productUuid: null == productUuid
          ? _value.productUuid
          : productUuid // ignore: cast_nullable_to_non_nullable
              as String,
      warehouseUuid: freezed == warehouseUuid
          ? _value.warehouseUuid
          : warehouseUuid // ignore: cast_nullable_to_non_nullable
              as String?,
      lowStockThreshold: freezed == lowStockThreshold
          ? _value.lowStockThreshold
          : lowStockThreshold // ignore: cast_nullable_to_non_nullable
              as double?,
      criticalStockThreshold: freezed == criticalStockThreshold
          ? _value.criticalStockThreshold
          : criticalStockThreshold // ignore: cast_nullable_to_non_nullable
              as double?,
      overstockThreshold: freezed == overstockThreshold
          ? _value.overstockThreshold
          : overstockThreshold // ignore: cast_nullable_to_non_nullable
              as double?,
      expiryWarningDays: null == expiryWarningDays
          ? _value.expiryWarningDays
          : expiryWarningDays // ignore: cast_nullable_to_non_nullable
              as int,
      lowStockEmailEnabled: null == lowStockEmailEnabled
          ? _value.lowStockEmailEnabled
          : lowStockEmailEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      outOfStockEmailEnabled: null == outOfStockEmailEnabled
          ? _value.outOfStockEmailEnabled
          : outOfStockEmailEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      expiryEmailEnabled: null == expiryEmailEnabled
          ? _value.expiryEmailEnabled
          : expiryEmailEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StockAlertConfigImpl implements _StockAlertConfig {
  const _$StockAlertConfigImpl(
      {required this.uuid,
      required this.productUuid,
      this.warehouseUuid,
      this.lowStockThreshold,
      this.criticalStockThreshold,
      this.overstockThreshold,
      this.expiryWarningDays = 7,
      this.lowStockEmailEnabled = true,
      this.outOfStockEmailEnabled = true,
      this.expiryEmailEnabled = true});

  factory _$StockAlertConfigImpl.fromJson(Map<String, dynamic> json) =>
      _$$StockAlertConfigImplFromJson(json);

  @override
  final String uuid;
  @override
  final String productUuid;
  @override
  final String? warehouseUuid;
  @override
  final double? lowStockThreshold;
  @override
  final double? criticalStockThreshold;
  @override
  final double? overstockThreshold;
  @override
  @JsonKey()
  final int expiryWarningDays;
  @override
  @JsonKey()
  final bool lowStockEmailEnabled;
  @override
  @JsonKey()
  final bool outOfStockEmailEnabled;
  @override
  @JsonKey()
  final bool expiryEmailEnabled;

  @override
  String toString() {
    return 'StockAlertConfig(uuid: $uuid, productUuid: $productUuid, warehouseUuid: $warehouseUuid, lowStockThreshold: $lowStockThreshold, criticalStockThreshold: $criticalStockThreshold, overstockThreshold: $overstockThreshold, expiryWarningDays: $expiryWarningDays, lowStockEmailEnabled: $lowStockEmailEnabled, outOfStockEmailEnabled: $outOfStockEmailEnabled, expiryEmailEnabled: $expiryEmailEnabled)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StockAlertConfigImpl &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.productUuid, productUuid) ||
                other.productUuid == productUuid) &&
            (identical(other.warehouseUuid, warehouseUuid) ||
                other.warehouseUuid == warehouseUuid) &&
            (identical(other.lowStockThreshold, lowStockThreshold) ||
                other.lowStockThreshold == lowStockThreshold) &&
            (identical(other.criticalStockThreshold, criticalStockThreshold) ||
                other.criticalStockThreshold == criticalStockThreshold) &&
            (identical(other.overstockThreshold, overstockThreshold) ||
                other.overstockThreshold == overstockThreshold) &&
            (identical(other.expiryWarningDays, expiryWarningDays) ||
                other.expiryWarningDays == expiryWarningDays) &&
            (identical(other.lowStockEmailEnabled, lowStockEmailEnabled) ||
                other.lowStockEmailEnabled == lowStockEmailEnabled) &&
            (identical(other.outOfStockEmailEnabled, outOfStockEmailEnabled) ||
                other.outOfStockEmailEnabled == outOfStockEmailEnabled) &&
            (identical(other.expiryEmailEnabled, expiryEmailEnabled) ||
                other.expiryEmailEnabled == expiryEmailEnabled));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      uuid,
      productUuid,
      warehouseUuid,
      lowStockThreshold,
      criticalStockThreshold,
      overstockThreshold,
      expiryWarningDays,
      lowStockEmailEnabled,
      outOfStockEmailEnabled,
      expiryEmailEnabled);

  /// Create a copy of StockAlertConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StockAlertConfigImplCopyWith<_$StockAlertConfigImpl> get copyWith =>
      __$$StockAlertConfigImplCopyWithImpl<_$StockAlertConfigImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StockAlertConfigImplToJson(
      this,
    );
  }
}

abstract class _StockAlertConfig implements StockAlertConfig {
  const factory _StockAlertConfig(
      {required final String uuid,
      required final String productUuid,
      final String? warehouseUuid,
      final double? lowStockThreshold,
      final double? criticalStockThreshold,
      final double? overstockThreshold,
      final int expiryWarningDays,
      final bool lowStockEmailEnabled,
      final bool outOfStockEmailEnabled,
      final bool expiryEmailEnabled}) = _$StockAlertConfigImpl;

  factory _StockAlertConfig.fromJson(Map<String, dynamic> json) =
      _$StockAlertConfigImpl.fromJson;

  @override
  String get uuid;
  @override
  String get productUuid;
  @override
  String? get warehouseUuid;
  @override
  double? get lowStockThreshold;
  @override
  double? get criticalStockThreshold;
  @override
  double? get overstockThreshold;
  @override
  int get expiryWarningDays;
  @override
  bool get lowStockEmailEnabled;
  @override
  bool get outOfStockEmailEnabled;
  @override
  bool get expiryEmailEnabled;

  /// Create a copy of StockAlertConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StockAlertConfigImplCopyWith<_$StockAlertConfigImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AdvancedStockTransfer _$AdvancedStockTransferFromJson(
    Map<String, dynamic> json) {
  return _AdvancedStockTransfer.fromJson(json);
}

/// @nodoc
mixin _$AdvancedStockTransfer {
  String get uuid => throw _privateConstructorUsedError;
  String get transferNumber => throw _privateConstructorUsedError;
  String get sourceWarehouseUuid => throw _privateConstructorUsedError;
  String get sourceWarehouseName => throw _privateConstructorUsedError;
  String get targetWarehouseUuid => throw _privateConstructorUsedError;
  String get targetWarehouseName => throw _privateConstructorUsedError;
  TransferStatus get status => throw _privateConstructorUsedError;
  String get createdBy => throw _privateConstructorUsedError;
  String get createdByName => throw _privateConstructorUsedError;
  String? get approvedBy => throw _privateConstructorUsedError;
  DateTime? get approvedAt => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;
  double get totalValue => throw _privateConstructorUsedError;
  int get totalItems => throw _privateConstructorUsedError;
  DateTime? get expectedDeliveryAt => throw _privateConstructorUsedError;
  DateTime? get shippedAt => throw _privateConstructorUsedError;
  DateTime? get receivedAt => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  List<AdvancedStockTransferItem> get items =>
      throw _privateConstructorUsedError;

  /// Serializes this AdvancedStockTransfer to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AdvancedStockTransfer
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AdvancedStockTransferCopyWith<AdvancedStockTransfer> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AdvancedStockTransferCopyWith<$Res> {
  factory $AdvancedStockTransferCopyWith(AdvancedStockTransfer value,
          $Res Function(AdvancedStockTransfer) then) =
      _$AdvancedStockTransferCopyWithImpl<$Res, AdvancedStockTransfer>;
  @useResult
  $Res call(
      {String uuid,
      String transferNumber,
      String sourceWarehouseUuid,
      String sourceWarehouseName,
      String targetWarehouseUuid,
      String targetWarehouseName,
      TransferStatus status,
      String createdBy,
      String createdByName,
      String? approvedBy,
      DateTime? approvedAt,
      String? notes,
      double totalValue,
      int totalItems,
      DateTime? expectedDeliveryAt,
      DateTime? shippedAt,
      DateTime? receivedAt,
      DateTime? createdAt,
      List<AdvancedStockTransferItem> items});
}

/// @nodoc
class _$AdvancedStockTransferCopyWithImpl<$Res,
        $Val extends AdvancedStockTransfer>
    implements $AdvancedStockTransferCopyWith<$Res> {
  _$AdvancedStockTransferCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AdvancedStockTransfer
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
    Object? transferNumber = null,
    Object? sourceWarehouseUuid = null,
    Object? sourceWarehouseName = null,
    Object? targetWarehouseUuid = null,
    Object? targetWarehouseName = null,
    Object? status = null,
    Object? createdBy = null,
    Object? createdByName = null,
    Object? approvedBy = freezed,
    Object? approvedAt = freezed,
    Object? notes = freezed,
    Object? totalValue = null,
    Object? totalItems = null,
    Object? expectedDeliveryAt = freezed,
    Object? shippedAt = freezed,
    Object? receivedAt = freezed,
    Object? createdAt = freezed,
    Object? items = null,
  }) {
    return _then(_value.copyWith(
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      transferNumber: null == transferNumber
          ? _value.transferNumber
          : transferNumber // ignore: cast_nullable_to_non_nullable
              as String,
      sourceWarehouseUuid: null == sourceWarehouseUuid
          ? _value.sourceWarehouseUuid
          : sourceWarehouseUuid // ignore: cast_nullable_to_non_nullable
              as String,
      sourceWarehouseName: null == sourceWarehouseName
          ? _value.sourceWarehouseName
          : sourceWarehouseName // ignore: cast_nullable_to_non_nullable
              as String,
      targetWarehouseUuid: null == targetWarehouseUuid
          ? _value.targetWarehouseUuid
          : targetWarehouseUuid // ignore: cast_nullable_to_non_nullable
              as String,
      targetWarehouseName: null == targetWarehouseName
          ? _value.targetWarehouseName
          : targetWarehouseName // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as TransferStatus,
      createdBy: null == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String,
      createdByName: null == createdByName
          ? _value.createdByName
          : createdByName // ignore: cast_nullable_to_non_nullable
              as String,
      approvedBy: freezed == approvedBy
          ? _value.approvedBy
          : approvedBy // ignore: cast_nullable_to_non_nullable
              as String?,
      approvedAt: freezed == approvedAt
          ? _value.approvedAt
          : approvedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      totalValue: null == totalValue
          ? _value.totalValue
          : totalValue // ignore: cast_nullable_to_non_nullable
              as double,
      totalItems: null == totalItems
          ? _value.totalItems
          : totalItems // ignore: cast_nullable_to_non_nullable
              as int,
      expectedDeliveryAt: freezed == expectedDeliveryAt
          ? _value.expectedDeliveryAt
          : expectedDeliveryAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      shippedAt: freezed == shippedAt
          ? _value.shippedAt
          : shippedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      receivedAt: freezed == receivedAt
          ? _value.receivedAt
          : receivedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<AdvancedStockTransferItem>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AdvancedStockTransferImplCopyWith<$Res>
    implements $AdvancedStockTransferCopyWith<$Res> {
  factory _$$AdvancedStockTransferImplCopyWith(
          _$AdvancedStockTransferImpl value,
          $Res Function(_$AdvancedStockTransferImpl) then) =
      __$$AdvancedStockTransferImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String uuid,
      String transferNumber,
      String sourceWarehouseUuid,
      String sourceWarehouseName,
      String targetWarehouseUuid,
      String targetWarehouseName,
      TransferStatus status,
      String createdBy,
      String createdByName,
      String? approvedBy,
      DateTime? approvedAt,
      String? notes,
      double totalValue,
      int totalItems,
      DateTime? expectedDeliveryAt,
      DateTime? shippedAt,
      DateTime? receivedAt,
      DateTime? createdAt,
      List<AdvancedStockTransferItem> items});
}

/// @nodoc
class __$$AdvancedStockTransferImplCopyWithImpl<$Res>
    extends _$AdvancedStockTransferCopyWithImpl<$Res,
        _$AdvancedStockTransferImpl>
    implements _$$AdvancedStockTransferImplCopyWith<$Res> {
  __$$AdvancedStockTransferImplCopyWithImpl(_$AdvancedStockTransferImpl _value,
      $Res Function(_$AdvancedStockTransferImpl) _then)
      : super(_value, _then);

  /// Create a copy of AdvancedStockTransfer
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
    Object? transferNumber = null,
    Object? sourceWarehouseUuid = null,
    Object? sourceWarehouseName = null,
    Object? targetWarehouseUuid = null,
    Object? targetWarehouseName = null,
    Object? status = null,
    Object? createdBy = null,
    Object? createdByName = null,
    Object? approvedBy = freezed,
    Object? approvedAt = freezed,
    Object? notes = freezed,
    Object? totalValue = null,
    Object? totalItems = null,
    Object? expectedDeliveryAt = freezed,
    Object? shippedAt = freezed,
    Object? receivedAt = freezed,
    Object? createdAt = freezed,
    Object? items = null,
  }) {
    return _then(_$AdvancedStockTransferImpl(
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      transferNumber: null == transferNumber
          ? _value.transferNumber
          : transferNumber // ignore: cast_nullable_to_non_nullable
              as String,
      sourceWarehouseUuid: null == sourceWarehouseUuid
          ? _value.sourceWarehouseUuid
          : sourceWarehouseUuid // ignore: cast_nullable_to_non_nullable
              as String,
      sourceWarehouseName: null == sourceWarehouseName
          ? _value.sourceWarehouseName
          : sourceWarehouseName // ignore: cast_nullable_to_non_nullable
              as String,
      targetWarehouseUuid: null == targetWarehouseUuid
          ? _value.targetWarehouseUuid
          : targetWarehouseUuid // ignore: cast_nullable_to_non_nullable
              as String,
      targetWarehouseName: null == targetWarehouseName
          ? _value.targetWarehouseName
          : targetWarehouseName // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as TransferStatus,
      createdBy: null == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String,
      createdByName: null == createdByName
          ? _value.createdByName
          : createdByName // ignore: cast_nullable_to_non_nullable
              as String,
      approvedBy: freezed == approvedBy
          ? _value.approvedBy
          : approvedBy // ignore: cast_nullable_to_non_nullable
              as String?,
      approvedAt: freezed == approvedAt
          ? _value.approvedAt
          : approvedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      totalValue: null == totalValue
          ? _value.totalValue
          : totalValue // ignore: cast_nullable_to_non_nullable
              as double,
      totalItems: null == totalItems
          ? _value.totalItems
          : totalItems // ignore: cast_nullable_to_non_nullable
              as int,
      expectedDeliveryAt: freezed == expectedDeliveryAt
          ? _value.expectedDeliveryAt
          : expectedDeliveryAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      shippedAt: freezed == shippedAt
          ? _value.shippedAt
          : shippedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      receivedAt: freezed == receivedAt
          ? _value.receivedAt
          : receivedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<AdvancedStockTransferItem>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AdvancedStockTransferImpl implements _AdvancedStockTransfer {
  const _$AdvancedStockTransferImpl(
      {required this.uuid,
      required this.transferNumber,
      required this.sourceWarehouseUuid,
      required this.sourceWarehouseName,
      required this.targetWarehouseUuid,
      required this.targetWarehouseName,
      this.status = TransferStatus.draft,
      required this.createdBy,
      required this.createdByName,
      this.approvedBy,
      this.approvedAt,
      this.notes,
      this.totalValue = 0,
      this.totalItems = 0,
      this.expectedDeliveryAt,
      this.shippedAt,
      this.receivedAt,
      this.createdAt,
      final List<AdvancedStockTransferItem> items = const []})
      : _items = items;

  factory _$AdvancedStockTransferImpl.fromJson(Map<String, dynamic> json) =>
      _$$AdvancedStockTransferImplFromJson(json);

  @override
  final String uuid;
  @override
  final String transferNumber;
  @override
  final String sourceWarehouseUuid;
  @override
  final String sourceWarehouseName;
  @override
  final String targetWarehouseUuid;
  @override
  final String targetWarehouseName;
  @override
  @JsonKey()
  final TransferStatus status;
  @override
  final String createdBy;
  @override
  final String createdByName;
  @override
  final String? approvedBy;
  @override
  final DateTime? approvedAt;
  @override
  final String? notes;
  @override
  @JsonKey()
  final double totalValue;
  @override
  @JsonKey()
  final int totalItems;
  @override
  final DateTime? expectedDeliveryAt;
  @override
  final DateTime? shippedAt;
  @override
  final DateTime? receivedAt;
  @override
  final DateTime? createdAt;
  final List<AdvancedStockTransferItem> _items;
  @override
  @JsonKey()
  List<AdvancedStockTransferItem> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  String toString() {
    return 'AdvancedStockTransfer(uuid: $uuid, transferNumber: $transferNumber, sourceWarehouseUuid: $sourceWarehouseUuid, sourceWarehouseName: $sourceWarehouseName, targetWarehouseUuid: $targetWarehouseUuid, targetWarehouseName: $targetWarehouseName, status: $status, createdBy: $createdBy, createdByName: $createdByName, approvedBy: $approvedBy, approvedAt: $approvedAt, notes: $notes, totalValue: $totalValue, totalItems: $totalItems, expectedDeliveryAt: $expectedDeliveryAt, shippedAt: $shippedAt, receivedAt: $receivedAt, createdAt: $createdAt, items: $items)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AdvancedStockTransferImpl &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.transferNumber, transferNumber) ||
                other.transferNumber == transferNumber) &&
            (identical(other.sourceWarehouseUuid, sourceWarehouseUuid) ||
                other.sourceWarehouseUuid == sourceWarehouseUuid) &&
            (identical(other.sourceWarehouseName, sourceWarehouseName) ||
                other.sourceWarehouseName == sourceWarehouseName) &&
            (identical(other.targetWarehouseUuid, targetWarehouseUuid) ||
                other.targetWarehouseUuid == targetWarehouseUuid) &&
            (identical(other.targetWarehouseName, targetWarehouseName) ||
                other.targetWarehouseName == targetWarehouseName) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy) &&
            (identical(other.createdByName, createdByName) ||
                other.createdByName == createdByName) &&
            (identical(other.approvedBy, approvedBy) ||
                other.approvedBy == approvedBy) &&
            (identical(other.approvedAt, approvedAt) ||
                other.approvedAt == approvedAt) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.totalValue, totalValue) ||
                other.totalValue == totalValue) &&
            (identical(other.totalItems, totalItems) ||
                other.totalItems == totalItems) &&
            (identical(other.expectedDeliveryAt, expectedDeliveryAt) ||
                other.expectedDeliveryAt == expectedDeliveryAt) &&
            (identical(other.shippedAt, shippedAt) ||
                other.shippedAt == shippedAt) &&
            (identical(other.receivedAt, receivedAt) ||
                other.receivedAt == receivedAt) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        uuid,
        transferNumber,
        sourceWarehouseUuid,
        sourceWarehouseName,
        targetWarehouseUuid,
        targetWarehouseName,
        status,
        createdBy,
        createdByName,
        approvedBy,
        approvedAt,
        notes,
        totalValue,
        totalItems,
        expectedDeliveryAt,
        shippedAt,
        receivedAt,
        createdAt,
        const DeepCollectionEquality().hash(_items)
      ]);

  /// Create a copy of AdvancedStockTransfer
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AdvancedStockTransferImplCopyWith<_$AdvancedStockTransferImpl>
      get copyWith => __$$AdvancedStockTransferImplCopyWithImpl<
          _$AdvancedStockTransferImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AdvancedStockTransferImplToJson(
      this,
    );
  }
}

abstract class _AdvancedStockTransfer implements AdvancedStockTransfer {
  const factory _AdvancedStockTransfer(
          {required final String uuid,
          required final String transferNumber,
          required final String sourceWarehouseUuid,
          required final String sourceWarehouseName,
          required final String targetWarehouseUuid,
          required final String targetWarehouseName,
          final TransferStatus status,
          required final String createdBy,
          required final String createdByName,
          final String? approvedBy,
          final DateTime? approvedAt,
          final String? notes,
          final double totalValue,
          final int totalItems,
          final DateTime? expectedDeliveryAt,
          final DateTime? shippedAt,
          final DateTime? receivedAt,
          final DateTime? createdAt,
          final List<AdvancedStockTransferItem> items}) =
      _$AdvancedStockTransferImpl;

  factory _AdvancedStockTransfer.fromJson(Map<String, dynamic> json) =
      _$AdvancedStockTransferImpl.fromJson;

  @override
  String get uuid;
  @override
  String get transferNumber;
  @override
  String get sourceWarehouseUuid;
  @override
  String get sourceWarehouseName;
  @override
  String get targetWarehouseUuid;
  @override
  String get targetWarehouseName;
  @override
  TransferStatus get status;
  @override
  String get createdBy;
  @override
  String get createdByName;
  @override
  String? get approvedBy;
  @override
  DateTime? get approvedAt;
  @override
  String? get notes;
  @override
  double get totalValue;
  @override
  int get totalItems;
  @override
  DateTime? get expectedDeliveryAt;
  @override
  DateTime? get shippedAt;
  @override
  DateTime? get receivedAt;
  @override
  DateTime? get createdAt;
  @override
  List<AdvancedStockTransferItem> get items;

  /// Create a copy of AdvancedStockTransfer
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AdvancedStockTransferImplCopyWith<_$AdvancedStockTransferImpl>
      get copyWith => throw _privateConstructorUsedError;
}

AdvancedStockTransferItem _$AdvancedStockTransferItemFromJson(
    Map<String, dynamic> json) {
  return _AdvancedStockTransferItem.fromJson(json);
}

/// @nodoc
mixin _$AdvancedStockTransferItem {
  String get transferUuid => throw _privateConstructorUsedError;
  String get productUuid => throw _privateConstructorUsedError;
  String get productName => throw _privateConstructorUsedError;
  String? get batchUuid => throw _privateConstructorUsedError;
  double get quantityRequested => throw _privateConstructorUsedError;
  double get quantityShipped => throw _privateConstructorUsedError;
  double get quantityReceived => throw _privateConstructorUsedError;
  double get unitCost => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;

  /// Serializes this AdvancedStockTransferItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AdvancedStockTransferItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AdvancedStockTransferItemCopyWith<AdvancedStockTransferItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AdvancedStockTransferItemCopyWith<$Res> {
  factory $AdvancedStockTransferItemCopyWith(AdvancedStockTransferItem value,
          $Res Function(AdvancedStockTransferItem) then) =
      _$AdvancedStockTransferItemCopyWithImpl<$Res, AdvancedStockTransferItem>;
  @useResult
  $Res call(
      {String transferUuid,
      String productUuid,
      String productName,
      String? batchUuid,
      double quantityRequested,
      double quantityShipped,
      double quantityReceived,
      double unitCost,
      String? notes});
}

/// @nodoc
class _$AdvancedStockTransferItemCopyWithImpl<$Res,
        $Val extends AdvancedStockTransferItem>
    implements $AdvancedStockTransferItemCopyWith<$Res> {
  _$AdvancedStockTransferItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AdvancedStockTransferItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transferUuid = null,
    Object? productUuid = null,
    Object? productName = null,
    Object? batchUuid = freezed,
    Object? quantityRequested = null,
    Object? quantityShipped = null,
    Object? quantityReceived = null,
    Object? unitCost = null,
    Object? notes = freezed,
  }) {
    return _then(_value.copyWith(
      transferUuid: null == transferUuid
          ? _value.transferUuid
          : transferUuid // ignore: cast_nullable_to_non_nullable
              as String,
      productUuid: null == productUuid
          ? _value.productUuid
          : productUuid // ignore: cast_nullable_to_non_nullable
              as String,
      productName: null == productName
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String,
      batchUuid: freezed == batchUuid
          ? _value.batchUuid
          : batchUuid // ignore: cast_nullable_to_non_nullable
              as String?,
      quantityRequested: null == quantityRequested
          ? _value.quantityRequested
          : quantityRequested // ignore: cast_nullable_to_non_nullable
              as double,
      quantityShipped: null == quantityShipped
          ? _value.quantityShipped
          : quantityShipped // ignore: cast_nullable_to_non_nullable
              as double,
      quantityReceived: null == quantityReceived
          ? _value.quantityReceived
          : quantityReceived // ignore: cast_nullable_to_non_nullable
              as double,
      unitCost: null == unitCost
          ? _value.unitCost
          : unitCost // ignore: cast_nullable_to_non_nullable
              as double,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AdvancedStockTransferItemImplCopyWith<$Res>
    implements $AdvancedStockTransferItemCopyWith<$Res> {
  factory _$$AdvancedStockTransferItemImplCopyWith(
          _$AdvancedStockTransferItemImpl value,
          $Res Function(_$AdvancedStockTransferItemImpl) then) =
      __$$AdvancedStockTransferItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String transferUuid,
      String productUuid,
      String productName,
      String? batchUuid,
      double quantityRequested,
      double quantityShipped,
      double quantityReceived,
      double unitCost,
      String? notes});
}

/// @nodoc
class __$$AdvancedStockTransferItemImplCopyWithImpl<$Res>
    extends _$AdvancedStockTransferItemCopyWithImpl<$Res,
        _$AdvancedStockTransferItemImpl>
    implements _$$AdvancedStockTransferItemImplCopyWith<$Res> {
  __$$AdvancedStockTransferItemImplCopyWithImpl(
      _$AdvancedStockTransferItemImpl _value,
      $Res Function(_$AdvancedStockTransferItemImpl) _then)
      : super(_value, _then);

  /// Create a copy of AdvancedStockTransferItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transferUuid = null,
    Object? productUuid = null,
    Object? productName = null,
    Object? batchUuid = freezed,
    Object? quantityRequested = null,
    Object? quantityShipped = null,
    Object? quantityReceived = null,
    Object? unitCost = null,
    Object? notes = freezed,
  }) {
    return _then(_$AdvancedStockTransferItemImpl(
      transferUuid: null == transferUuid
          ? _value.transferUuid
          : transferUuid // ignore: cast_nullable_to_non_nullable
              as String,
      productUuid: null == productUuid
          ? _value.productUuid
          : productUuid // ignore: cast_nullable_to_non_nullable
              as String,
      productName: null == productName
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String,
      batchUuid: freezed == batchUuid
          ? _value.batchUuid
          : batchUuid // ignore: cast_nullable_to_non_nullable
              as String?,
      quantityRequested: null == quantityRequested
          ? _value.quantityRequested
          : quantityRequested // ignore: cast_nullable_to_non_nullable
              as double,
      quantityShipped: null == quantityShipped
          ? _value.quantityShipped
          : quantityShipped // ignore: cast_nullable_to_non_nullable
              as double,
      quantityReceived: null == quantityReceived
          ? _value.quantityReceived
          : quantityReceived // ignore: cast_nullable_to_non_nullable
              as double,
      unitCost: null == unitCost
          ? _value.unitCost
          : unitCost // ignore: cast_nullable_to_non_nullable
              as double,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AdvancedStockTransferItemImpl implements _AdvancedStockTransferItem {
  const _$AdvancedStockTransferItemImpl(
      {required this.transferUuid,
      required this.productUuid,
      required this.productName,
      this.batchUuid,
      required this.quantityRequested,
      this.quantityShipped = 0,
      this.quantityReceived = 0,
      required this.unitCost,
      this.notes});

  factory _$AdvancedStockTransferItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$AdvancedStockTransferItemImplFromJson(json);

  @override
  final String transferUuid;
  @override
  final String productUuid;
  @override
  final String productName;
  @override
  final String? batchUuid;
  @override
  final double quantityRequested;
  @override
  @JsonKey()
  final double quantityShipped;
  @override
  @JsonKey()
  final double quantityReceived;
  @override
  final double unitCost;
  @override
  final String? notes;

  @override
  String toString() {
    return 'AdvancedStockTransferItem(transferUuid: $transferUuid, productUuid: $productUuid, productName: $productName, batchUuid: $batchUuid, quantityRequested: $quantityRequested, quantityShipped: $quantityShipped, quantityReceived: $quantityReceived, unitCost: $unitCost, notes: $notes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AdvancedStockTransferItemImpl &&
            (identical(other.transferUuid, transferUuid) ||
                other.transferUuid == transferUuid) &&
            (identical(other.productUuid, productUuid) ||
                other.productUuid == productUuid) &&
            (identical(other.productName, productName) ||
                other.productName == productName) &&
            (identical(other.batchUuid, batchUuid) ||
                other.batchUuid == batchUuid) &&
            (identical(other.quantityRequested, quantityRequested) ||
                other.quantityRequested == quantityRequested) &&
            (identical(other.quantityShipped, quantityShipped) ||
                other.quantityShipped == quantityShipped) &&
            (identical(other.quantityReceived, quantityReceived) ||
                other.quantityReceived == quantityReceived) &&
            (identical(other.unitCost, unitCost) ||
                other.unitCost == unitCost) &&
            (identical(other.notes, notes) || other.notes == notes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      transferUuid,
      productUuid,
      productName,
      batchUuid,
      quantityRequested,
      quantityShipped,
      quantityReceived,
      unitCost,
      notes);

  /// Create a copy of AdvancedStockTransferItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AdvancedStockTransferItemImplCopyWith<_$AdvancedStockTransferItemImpl>
      get copyWith => __$$AdvancedStockTransferItemImplCopyWithImpl<
          _$AdvancedStockTransferItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AdvancedStockTransferItemImplToJson(
      this,
    );
  }
}

abstract class _AdvancedStockTransferItem implements AdvancedStockTransferItem {
  const factory _AdvancedStockTransferItem(
      {required final String transferUuid,
      required final String productUuid,
      required final String productName,
      final String? batchUuid,
      required final double quantityRequested,
      final double quantityShipped,
      final double quantityReceived,
      required final double unitCost,
      final String? notes}) = _$AdvancedStockTransferItemImpl;

  factory _AdvancedStockTransferItem.fromJson(Map<String, dynamic> json) =
      _$AdvancedStockTransferItemImpl.fromJson;

  @override
  String get transferUuid;
  @override
  String get productUuid;
  @override
  String get productName;
  @override
  String? get batchUuid;
  @override
  double get quantityRequested;
  @override
  double get quantityShipped;
  @override
  double get quantityReceived;
  @override
  double get unitCost;
  @override
  String? get notes;

  /// Create a copy of AdvancedStockTransferItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AdvancedStockTransferItemImplCopyWith<_$AdvancedStockTransferItemImpl>
      get copyWith => throw _privateConstructorUsedError;
}

StockMovement _$StockMovementFromJson(Map<String, dynamic> json) {
  return _StockMovement.fromJson(json);
}

/// @nodoc
mixin _$StockMovement {
  String get uuid => throw _privateConstructorUsedError;
  String get productUuid => throw _privateConstructorUsedError;
  String get productName => throw _privateConstructorUsedError;
  String get warehouseUuid => throw _privateConstructorUsedError;
  String? get warehouseName => throw _privateConstructorUsedError;
  String? get batchUuid => throw _privateConstructorUsedError;
  MovementType get movementType => throw _privateConstructorUsedError;
  double get quantityChange => throw _privateConstructorUsedError;
  double? get unitCost => throw _privateConstructorUsedError;
  double? get totalCost => throw _privateConstructorUsedError;
  String? get referenceType => throw _privateConstructorUsedError;
  String? get referenceUuid => throw _privateConstructorUsedError;
  String? get referenceNumber => throw _privateConstructorUsedError;
  String? get reasonCode => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;
  String get performedBy => throw _privateConstructorUsedError;
  String get performedByName => throw _privateConstructorUsedError;
  double get balanceBefore => throw _privateConstructorUsedError;
  double get balanceAfter => throw _privateConstructorUsedError;
  DateTime get timestamp => throw _privateConstructorUsedError;

  /// Serializes this StockMovement to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of StockMovement
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StockMovementCopyWith<StockMovement> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StockMovementCopyWith<$Res> {
  factory $StockMovementCopyWith(
          StockMovement value, $Res Function(StockMovement) then) =
      _$StockMovementCopyWithImpl<$Res, StockMovement>;
  @useResult
  $Res call(
      {String uuid,
      String productUuid,
      String productName,
      String warehouseUuid,
      String? warehouseName,
      String? batchUuid,
      MovementType movementType,
      double quantityChange,
      double? unitCost,
      double? totalCost,
      String? referenceType,
      String? referenceUuid,
      String? referenceNumber,
      String? reasonCode,
      String? notes,
      String performedBy,
      String performedByName,
      double balanceBefore,
      double balanceAfter,
      DateTime timestamp});
}

/// @nodoc
class _$StockMovementCopyWithImpl<$Res, $Val extends StockMovement>
    implements $StockMovementCopyWith<$Res> {
  _$StockMovementCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StockMovement
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
    Object? productUuid = null,
    Object? productName = null,
    Object? warehouseUuid = null,
    Object? warehouseName = freezed,
    Object? batchUuid = freezed,
    Object? movementType = null,
    Object? quantityChange = null,
    Object? unitCost = freezed,
    Object? totalCost = freezed,
    Object? referenceType = freezed,
    Object? referenceUuid = freezed,
    Object? referenceNumber = freezed,
    Object? reasonCode = freezed,
    Object? notes = freezed,
    Object? performedBy = null,
    Object? performedByName = null,
    Object? balanceBefore = null,
    Object? balanceAfter = null,
    Object? timestamp = null,
  }) {
    return _then(_value.copyWith(
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      productUuid: null == productUuid
          ? _value.productUuid
          : productUuid // ignore: cast_nullable_to_non_nullable
              as String,
      productName: null == productName
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String,
      warehouseUuid: null == warehouseUuid
          ? _value.warehouseUuid
          : warehouseUuid // ignore: cast_nullable_to_non_nullable
              as String,
      warehouseName: freezed == warehouseName
          ? _value.warehouseName
          : warehouseName // ignore: cast_nullable_to_non_nullable
              as String?,
      batchUuid: freezed == batchUuid
          ? _value.batchUuid
          : batchUuid // ignore: cast_nullable_to_non_nullable
              as String?,
      movementType: null == movementType
          ? _value.movementType
          : movementType // ignore: cast_nullable_to_non_nullable
              as MovementType,
      quantityChange: null == quantityChange
          ? _value.quantityChange
          : quantityChange // ignore: cast_nullable_to_non_nullable
              as double,
      unitCost: freezed == unitCost
          ? _value.unitCost
          : unitCost // ignore: cast_nullable_to_non_nullable
              as double?,
      totalCost: freezed == totalCost
          ? _value.totalCost
          : totalCost // ignore: cast_nullable_to_non_nullable
              as double?,
      referenceType: freezed == referenceType
          ? _value.referenceType
          : referenceType // ignore: cast_nullable_to_non_nullable
              as String?,
      referenceUuid: freezed == referenceUuid
          ? _value.referenceUuid
          : referenceUuid // ignore: cast_nullable_to_non_nullable
              as String?,
      referenceNumber: freezed == referenceNumber
          ? _value.referenceNumber
          : referenceNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      reasonCode: freezed == reasonCode
          ? _value.reasonCode
          : reasonCode // ignore: cast_nullable_to_non_nullable
              as String?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      performedBy: null == performedBy
          ? _value.performedBy
          : performedBy // ignore: cast_nullable_to_non_nullable
              as String,
      performedByName: null == performedByName
          ? _value.performedByName
          : performedByName // ignore: cast_nullable_to_non_nullable
              as String,
      balanceBefore: null == balanceBefore
          ? _value.balanceBefore
          : balanceBefore // ignore: cast_nullable_to_non_nullable
              as double,
      balanceAfter: null == balanceAfter
          ? _value.balanceAfter
          : balanceAfter // ignore: cast_nullable_to_non_nullable
              as double,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StockMovementImplCopyWith<$Res>
    implements $StockMovementCopyWith<$Res> {
  factory _$$StockMovementImplCopyWith(
          _$StockMovementImpl value, $Res Function(_$StockMovementImpl) then) =
      __$$StockMovementImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String uuid,
      String productUuid,
      String productName,
      String warehouseUuid,
      String? warehouseName,
      String? batchUuid,
      MovementType movementType,
      double quantityChange,
      double? unitCost,
      double? totalCost,
      String? referenceType,
      String? referenceUuid,
      String? referenceNumber,
      String? reasonCode,
      String? notes,
      String performedBy,
      String performedByName,
      double balanceBefore,
      double balanceAfter,
      DateTime timestamp});
}

/// @nodoc
class __$$StockMovementImplCopyWithImpl<$Res>
    extends _$StockMovementCopyWithImpl<$Res, _$StockMovementImpl>
    implements _$$StockMovementImplCopyWith<$Res> {
  __$$StockMovementImplCopyWithImpl(
      _$StockMovementImpl _value, $Res Function(_$StockMovementImpl) _then)
      : super(_value, _then);

  /// Create a copy of StockMovement
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
    Object? productUuid = null,
    Object? productName = null,
    Object? warehouseUuid = null,
    Object? warehouseName = freezed,
    Object? batchUuid = freezed,
    Object? movementType = null,
    Object? quantityChange = null,
    Object? unitCost = freezed,
    Object? totalCost = freezed,
    Object? referenceType = freezed,
    Object? referenceUuid = freezed,
    Object? referenceNumber = freezed,
    Object? reasonCode = freezed,
    Object? notes = freezed,
    Object? performedBy = null,
    Object? performedByName = null,
    Object? balanceBefore = null,
    Object? balanceAfter = null,
    Object? timestamp = null,
  }) {
    return _then(_$StockMovementImpl(
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      productUuid: null == productUuid
          ? _value.productUuid
          : productUuid // ignore: cast_nullable_to_non_nullable
              as String,
      productName: null == productName
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String,
      warehouseUuid: null == warehouseUuid
          ? _value.warehouseUuid
          : warehouseUuid // ignore: cast_nullable_to_non_nullable
              as String,
      warehouseName: freezed == warehouseName
          ? _value.warehouseName
          : warehouseName // ignore: cast_nullable_to_non_nullable
              as String?,
      batchUuid: freezed == batchUuid
          ? _value.batchUuid
          : batchUuid // ignore: cast_nullable_to_non_nullable
              as String?,
      movementType: null == movementType
          ? _value.movementType
          : movementType // ignore: cast_nullable_to_non_nullable
              as MovementType,
      quantityChange: null == quantityChange
          ? _value.quantityChange
          : quantityChange // ignore: cast_nullable_to_non_nullable
              as double,
      unitCost: freezed == unitCost
          ? _value.unitCost
          : unitCost // ignore: cast_nullable_to_non_nullable
              as double?,
      totalCost: freezed == totalCost
          ? _value.totalCost
          : totalCost // ignore: cast_nullable_to_non_nullable
              as double?,
      referenceType: freezed == referenceType
          ? _value.referenceType
          : referenceType // ignore: cast_nullable_to_non_nullable
              as String?,
      referenceUuid: freezed == referenceUuid
          ? _value.referenceUuid
          : referenceUuid // ignore: cast_nullable_to_non_nullable
              as String?,
      referenceNumber: freezed == referenceNumber
          ? _value.referenceNumber
          : referenceNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      reasonCode: freezed == reasonCode
          ? _value.reasonCode
          : reasonCode // ignore: cast_nullable_to_non_nullable
              as String?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      performedBy: null == performedBy
          ? _value.performedBy
          : performedBy // ignore: cast_nullable_to_non_nullable
              as String,
      performedByName: null == performedByName
          ? _value.performedByName
          : performedByName // ignore: cast_nullable_to_non_nullable
              as String,
      balanceBefore: null == balanceBefore
          ? _value.balanceBefore
          : balanceBefore // ignore: cast_nullable_to_non_nullable
              as double,
      balanceAfter: null == balanceAfter
          ? _value.balanceAfter
          : balanceAfter // ignore: cast_nullable_to_non_nullable
              as double,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StockMovementImpl implements _StockMovement {
  const _$StockMovementImpl(
      {required this.uuid,
      required this.productUuid,
      required this.productName,
      required this.warehouseUuid,
      this.warehouseName,
      this.batchUuid,
      required this.movementType,
      required this.quantityChange,
      this.unitCost,
      this.totalCost,
      this.referenceType,
      this.referenceUuid,
      this.referenceNumber,
      this.reasonCode,
      this.notes,
      required this.performedBy,
      required this.performedByName,
      required this.balanceBefore,
      required this.balanceAfter,
      required this.timestamp});

  factory _$StockMovementImpl.fromJson(Map<String, dynamic> json) =>
      _$$StockMovementImplFromJson(json);

  @override
  final String uuid;
  @override
  final String productUuid;
  @override
  final String productName;
  @override
  final String warehouseUuid;
  @override
  final String? warehouseName;
  @override
  final String? batchUuid;
  @override
  final MovementType movementType;
  @override
  final double quantityChange;
  @override
  final double? unitCost;
  @override
  final double? totalCost;
  @override
  final String? referenceType;
  @override
  final String? referenceUuid;
  @override
  final String? referenceNumber;
  @override
  final String? reasonCode;
  @override
  final String? notes;
  @override
  final String performedBy;
  @override
  final String performedByName;
  @override
  final double balanceBefore;
  @override
  final double balanceAfter;
  @override
  final DateTime timestamp;

  @override
  String toString() {
    return 'StockMovement(uuid: $uuid, productUuid: $productUuid, productName: $productName, warehouseUuid: $warehouseUuid, warehouseName: $warehouseName, batchUuid: $batchUuid, movementType: $movementType, quantityChange: $quantityChange, unitCost: $unitCost, totalCost: $totalCost, referenceType: $referenceType, referenceUuid: $referenceUuid, referenceNumber: $referenceNumber, reasonCode: $reasonCode, notes: $notes, performedBy: $performedBy, performedByName: $performedByName, balanceBefore: $balanceBefore, balanceAfter: $balanceAfter, timestamp: $timestamp)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StockMovementImpl &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.productUuid, productUuid) ||
                other.productUuid == productUuid) &&
            (identical(other.productName, productName) ||
                other.productName == productName) &&
            (identical(other.warehouseUuid, warehouseUuid) ||
                other.warehouseUuid == warehouseUuid) &&
            (identical(other.warehouseName, warehouseName) ||
                other.warehouseName == warehouseName) &&
            (identical(other.batchUuid, batchUuid) ||
                other.batchUuid == batchUuid) &&
            (identical(other.movementType, movementType) ||
                other.movementType == movementType) &&
            (identical(other.quantityChange, quantityChange) ||
                other.quantityChange == quantityChange) &&
            (identical(other.unitCost, unitCost) ||
                other.unitCost == unitCost) &&
            (identical(other.totalCost, totalCost) ||
                other.totalCost == totalCost) &&
            (identical(other.referenceType, referenceType) ||
                other.referenceType == referenceType) &&
            (identical(other.referenceUuid, referenceUuid) ||
                other.referenceUuid == referenceUuid) &&
            (identical(other.referenceNumber, referenceNumber) ||
                other.referenceNumber == referenceNumber) &&
            (identical(other.reasonCode, reasonCode) ||
                other.reasonCode == reasonCode) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.performedBy, performedBy) ||
                other.performedBy == performedBy) &&
            (identical(other.performedByName, performedByName) ||
                other.performedByName == performedByName) &&
            (identical(other.balanceBefore, balanceBefore) ||
                other.balanceBefore == balanceBefore) &&
            (identical(other.balanceAfter, balanceAfter) ||
                other.balanceAfter == balanceAfter) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        uuid,
        productUuid,
        productName,
        warehouseUuid,
        warehouseName,
        batchUuid,
        movementType,
        quantityChange,
        unitCost,
        totalCost,
        referenceType,
        referenceUuid,
        referenceNumber,
        reasonCode,
        notes,
        performedBy,
        performedByName,
        balanceBefore,
        balanceAfter,
        timestamp
      ]);

  /// Create a copy of StockMovement
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StockMovementImplCopyWith<_$StockMovementImpl> get copyWith =>
      __$$StockMovementImplCopyWithImpl<_$StockMovementImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StockMovementImplToJson(
      this,
    );
  }
}

abstract class _StockMovement implements StockMovement {
  const factory _StockMovement(
      {required final String uuid,
      required final String productUuid,
      required final String productName,
      required final String warehouseUuid,
      final String? warehouseName,
      final String? batchUuid,
      required final MovementType movementType,
      required final double quantityChange,
      final double? unitCost,
      final double? totalCost,
      final String? referenceType,
      final String? referenceUuid,
      final String? referenceNumber,
      final String? reasonCode,
      final String? notes,
      required final String performedBy,
      required final String performedByName,
      required final double balanceBefore,
      required final double balanceAfter,
      required final DateTime timestamp}) = _$StockMovementImpl;

  factory _StockMovement.fromJson(Map<String, dynamic> json) =
      _$StockMovementImpl.fromJson;

  @override
  String get uuid;
  @override
  String get productUuid;
  @override
  String get productName;
  @override
  String get warehouseUuid;
  @override
  String? get warehouseName;
  @override
  String? get batchUuid;
  @override
  MovementType get movementType;
  @override
  double get quantityChange;
  @override
  double? get unitCost;
  @override
  double? get totalCost;
  @override
  String? get referenceType;
  @override
  String? get referenceUuid;
  @override
  String? get referenceNumber;
  @override
  String? get reasonCode;
  @override
  String? get notes;
  @override
  String get performedBy;
  @override
  String get performedByName;
  @override
  double get balanceBefore;
  @override
  double get balanceAfter;
  @override
  DateTime get timestamp;

  /// Create a copy of StockMovement
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StockMovementImplCopyWith<_$StockMovementImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

InventoryInsight _$InventoryInsightFromJson(Map<String, dynamic> json) {
  return _InventoryInsight.fromJson(json);
}

/// @nodoc
mixin _$InventoryInsight {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get insightType =>
      throw _privateConstructorUsedError; // RESTOCK, OVERSTOCK, EXPIRING, SLOW_MOVING, POPULAR
  String get severity =>
      throw _privateConstructorUsedError; // INFO, WARNING, CRITICAL
  String? get productUuid => throw _privateConstructorUsedError;
  String? get productName => throw _privateConstructorUsedError;
  String? get warehouseUuid => throw _privateConstructorUsedError;
  double? get currentValue => throw _privateConstructorUsedError;
  double? get recommendedValue => throw _privateConstructorUsedError;
  String? get actionLabel => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;

  /// Serializes this InventoryInsight to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of InventoryInsight
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $InventoryInsightCopyWith<InventoryInsight> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InventoryInsightCopyWith<$Res> {
  factory $InventoryInsightCopyWith(
          InventoryInsight value, $Res Function(InventoryInsight) then) =
      _$InventoryInsightCopyWithImpl<$Res, InventoryInsight>;
  @useResult
  $Res call(
      {String id,
      String title,
      String description,
      String insightType,
      String severity,
      String? productUuid,
      String? productName,
      String? warehouseUuid,
      double? currentValue,
      double? recommendedValue,
      String? actionLabel,
      DateTime? createdAt});
}

/// @nodoc
class _$InventoryInsightCopyWithImpl<$Res, $Val extends InventoryInsight>
    implements $InventoryInsightCopyWith<$Res> {
  _$InventoryInsightCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of InventoryInsight
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? insightType = null,
    Object? severity = null,
    Object? productUuid = freezed,
    Object? productName = freezed,
    Object? warehouseUuid = freezed,
    Object? currentValue = freezed,
    Object? recommendedValue = freezed,
    Object? actionLabel = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      insightType: null == insightType
          ? _value.insightType
          : insightType // ignore: cast_nullable_to_non_nullable
              as String,
      severity: null == severity
          ? _value.severity
          : severity // ignore: cast_nullable_to_non_nullable
              as String,
      productUuid: freezed == productUuid
          ? _value.productUuid
          : productUuid // ignore: cast_nullable_to_non_nullable
              as String?,
      productName: freezed == productName
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String?,
      warehouseUuid: freezed == warehouseUuid
          ? _value.warehouseUuid
          : warehouseUuid // ignore: cast_nullable_to_non_nullable
              as String?,
      currentValue: freezed == currentValue
          ? _value.currentValue
          : currentValue // ignore: cast_nullable_to_non_nullable
              as double?,
      recommendedValue: freezed == recommendedValue
          ? _value.recommendedValue
          : recommendedValue // ignore: cast_nullable_to_non_nullable
              as double?,
      actionLabel: freezed == actionLabel
          ? _value.actionLabel
          : actionLabel // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InventoryInsightImplCopyWith<$Res>
    implements $InventoryInsightCopyWith<$Res> {
  factory _$$InventoryInsightImplCopyWith(_$InventoryInsightImpl value,
          $Res Function(_$InventoryInsightImpl) then) =
      __$$InventoryInsightImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      String description,
      String insightType,
      String severity,
      String? productUuid,
      String? productName,
      String? warehouseUuid,
      double? currentValue,
      double? recommendedValue,
      String? actionLabel,
      DateTime? createdAt});
}

/// @nodoc
class __$$InventoryInsightImplCopyWithImpl<$Res>
    extends _$InventoryInsightCopyWithImpl<$Res, _$InventoryInsightImpl>
    implements _$$InventoryInsightImplCopyWith<$Res> {
  __$$InventoryInsightImplCopyWithImpl(_$InventoryInsightImpl _value,
      $Res Function(_$InventoryInsightImpl) _then)
      : super(_value, _then);

  /// Create a copy of InventoryInsight
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? insightType = null,
    Object? severity = null,
    Object? productUuid = freezed,
    Object? productName = freezed,
    Object? warehouseUuid = freezed,
    Object? currentValue = freezed,
    Object? recommendedValue = freezed,
    Object? actionLabel = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_$InventoryInsightImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      insightType: null == insightType
          ? _value.insightType
          : insightType // ignore: cast_nullable_to_non_nullable
              as String,
      severity: null == severity
          ? _value.severity
          : severity // ignore: cast_nullable_to_non_nullable
              as String,
      productUuid: freezed == productUuid
          ? _value.productUuid
          : productUuid // ignore: cast_nullable_to_non_nullable
              as String?,
      productName: freezed == productName
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String?,
      warehouseUuid: freezed == warehouseUuid
          ? _value.warehouseUuid
          : warehouseUuid // ignore: cast_nullable_to_non_nullable
              as String?,
      currentValue: freezed == currentValue
          ? _value.currentValue
          : currentValue // ignore: cast_nullable_to_non_nullable
              as double?,
      recommendedValue: freezed == recommendedValue
          ? _value.recommendedValue
          : recommendedValue // ignore: cast_nullable_to_non_nullable
              as double?,
      actionLabel: freezed == actionLabel
          ? _value.actionLabel
          : actionLabel // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$InventoryInsightImpl implements _InventoryInsight {
  const _$InventoryInsightImpl(
      {required this.id,
      required this.title,
      required this.description,
      required this.insightType,
      required this.severity,
      this.productUuid,
      this.productName,
      this.warehouseUuid,
      this.currentValue,
      this.recommendedValue,
      this.actionLabel,
      this.createdAt});

  factory _$InventoryInsightImpl.fromJson(Map<String, dynamic> json) =>
      _$$InventoryInsightImplFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final String description;
  @override
  final String insightType;
// RESTOCK, OVERSTOCK, EXPIRING, SLOW_MOVING, POPULAR
  @override
  final String severity;
// INFO, WARNING, CRITICAL
  @override
  final String? productUuid;
  @override
  final String? productName;
  @override
  final String? warehouseUuid;
  @override
  final double? currentValue;
  @override
  final double? recommendedValue;
  @override
  final String? actionLabel;
  @override
  final DateTime? createdAt;

  @override
  String toString() {
    return 'InventoryInsight(id: $id, title: $title, description: $description, insightType: $insightType, severity: $severity, productUuid: $productUuid, productName: $productName, warehouseUuid: $warehouseUuid, currentValue: $currentValue, recommendedValue: $recommendedValue, actionLabel: $actionLabel, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InventoryInsightImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.insightType, insightType) ||
                other.insightType == insightType) &&
            (identical(other.severity, severity) ||
                other.severity == severity) &&
            (identical(other.productUuid, productUuid) ||
                other.productUuid == productUuid) &&
            (identical(other.productName, productName) ||
                other.productName == productName) &&
            (identical(other.warehouseUuid, warehouseUuid) ||
                other.warehouseUuid == warehouseUuid) &&
            (identical(other.currentValue, currentValue) ||
                other.currentValue == currentValue) &&
            (identical(other.recommendedValue, recommendedValue) ||
                other.recommendedValue == recommendedValue) &&
            (identical(other.actionLabel, actionLabel) ||
                other.actionLabel == actionLabel) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      description,
      insightType,
      severity,
      productUuid,
      productName,
      warehouseUuid,
      currentValue,
      recommendedValue,
      actionLabel,
      createdAt);

  /// Create a copy of InventoryInsight
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InventoryInsightImplCopyWith<_$InventoryInsightImpl> get copyWith =>
      __$$InventoryInsightImplCopyWithImpl<_$InventoryInsightImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$InventoryInsightImplToJson(
      this,
    );
  }
}

abstract class _InventoryInsight implements InventoryInsight {
  const factory _InventoryInsight(
      {required final String id,
      required final String title,
      required final String description,
      required final String insightType,
      required final String severity,
      final String? productUuid,
      final String? productName,
      final String? warehouseUuid,
      final double? currentValue,
      final double? recommendedValue,
      final String? actionLabel,
      final DateTime? createdAt}) = _$InventoryInsightImpl;

  factory _InventoryInsight.fromJson(Map<String, dynamic> json) =
      _$InventoryInsightImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  String get description;
  @override
  String get insightType; // RESTOCK, OVERSTOCK, EXPIRING, SLOW_MOVING, POPULAR
  @override
  String get severity; // INFO, WARNING, CRITICAL
  @override
  String? get productUuid;
  @override
  String? get productName;
  @override
  String? get warehouseUuid;
  @override
  double? get currentValue;
  @override
  double? get recommendedValue;
  @override
  String? get actionLabel;
  @override
  DateTime? get createdAt;

  /// Create a copy of InventoryInsight
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InventoryInsightImplCopyWith<_$InventoryInsightImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

InventoryDashboardStats _$InventoryDashboardStatsFromJson(
    Map<String, dynamic> json) {
  return _InventoryDashboardStats.fromJson(json);
}

/// @nodoc
mixin _$InventoryDashboardStats {
  int get totalProducts => throw _privateConstructorUsedError;
  int get totalWarehouses => throw _privateConstructorUsedError;
  double get totalStockValue => throw _privateConstructorUsedError;
  int get lowStockCount => throw _privateConstructorUsedError;
  int get outOfStockCount => throw _privateConstructorUsedError;
  int get expiringCount => throw _privateConstructorUsedError;
  int get alertsCount => throw _privateConstructorUsedError;
  int get pendingTransfers => throw _privateConstructorUsedError;
  int get pendingPurchaseOrders => throw _privateConstructorUsedError;
  double get averageTurnoverRate => throw _privateConstructorUsedError;
  List<StockAlert> get recentAlerts => throw _privateConstructorUsedError;
  List<InventoryInsight> get insights => throw _privateConstructorUsedError;

  /// Serializes this InventoryDashboardStats to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of InventoryDashboardStats
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $InventoryDashboardStatsCopyWith<InventoryDashboardStats> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InventoryDashboardStatsCopyWith<$Res> {
  factory $InventoryDashboardStatsCopyWith(InventoryDashboardStats value,
          $Res Function(InventoryDashboardStats) then) =
      _$InventoryDashboardStatsCopyWithImpl<$Res, InventoryDashboardStats>;
  @useResult
  $Res call(
      {int totalProducts,
      int totalWarehouses,
      double totalStockValue,
      int lowStockCount,
      int outOfStockCount,
      int expiringCount,
      int alertsCount,
      int pendingTransfers,
      int pendingPurchaseOrders,
      double averageTurnoverRate,
      List<StockAlert> recentAlerts,
      List<InventoryInsight> insights});
}

/// @nodoc
class _$InventoryDashboardStatsCopyWithImpl<$Res,
        $Val extends InventoryDashboardStats>
    implements $InventoryDashboardStatsCopyWith<$Res> {
  _$InventoryDashboardStatsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of InventoryDashboardStats
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalProducts = null,
    Object? totalWarehouses = null,
    Object? totalStockValue = null,
    Object? lowStockCount = null,
    Object? outOfStockCount = null,
    Object? expiringCount = null,
    Object? alertsCount = null,
    Object? pendingTransfers = null,
    Object? pendingPurchaseOrders = null,
    Object? averageTurnoverRate = null,
    Object? recentAlerts = null,
    Object? insights = null,
  }) {
    return _then(_value.copyWith(
      totalProducts: null == totalProducts
          ? _value.totalProducts
          : totalProducts // ignore: cast_nullable_to_non_nullable
              as int,
      totalWarehouses: null == totalWarehouses
          ? _value.totalWarehouses
          : totalWarehouses // ignore: cast_nullable_to_non_nullable
              as int,
      totalStockValue: null == totalStockValue
          ? _value.totalStockValue
          : totalStockValue // ignore: cast_nullable_to_non_nullable
              as double,
      lowStockCount: null == lowStockCount
          ? _value.lowStockCount
          : lowStockCount // ignore: cast_nullable_to_non_nullable
              as int,
      outOfStockCount: null == outOfStockCount
          ? _value.outOfStockCount
          : outOfStockCount // ignore: cast_nullable_to_non_nullable
              as int,
      expiringCount: null == expiringCount
          ? _value.expiringCount
          : expiringCount // ignore: cast_nullable_to_non_nullable
              as int,
      alertsCount: null == alertsCount
          ? _value.alertsCount
          : alertsCount // ignore: cast_nullable_to_non_nullable
              as int,
      pendingTransfers: null == pendingTransfers
          ? _value.pendingTransfers
          : pendingTransfers // ignore: cast_nullable_to_non_nullable
              as int,
      pendingPurchaseOrders: null == pendingPurchaseOrders
          ? _value.pendingPurchaseOrders
          : pendingPurchaseOrders // ignore: cast_nullable_to_non_nullable
              as int,
      averageTurnoverRate: null == averageTurnoverRate
          ? _value.averageTurnoverRate
          : averageTurnoverRate // ignore: cast_nullable_to_non_nullable
              as double,
      recentAlerts: null == recentAlerts
          ? _value.recentAlerts
          : recentAlerts // ignore: cast_nullable_to_non_nullable
              as List<StockAlert>,
      insights: null == insights
          ? _value.insights
          : insights // ignore: cast_nullable_to_non_nullable
              as List<InventoryInsight>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InventoryDashboardStatsImplCopyWith<$Res>
    implements $InventoryDashboardStatsCopyWith<$Res> {
  factory _$$InventoryDashboardStatsImplCopyWith(
          _$InventoryDashboardStatsImpl value,
          $Res Function(_$InventoryDashboardStatsImpl) then) =
      __$$InventoryDashboardStatsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int totalProducts,
      int totalWarehouses,
      double totalStockValue,
      int lowStockCount,
      int outOfStockCount,
      int expiringCount,
      int alertsCount,
      int pendingTransfers,
      int pendingPurchaseOrders,
      double averageTurnoverRate,
      List<StockAlert> recentAlerts,
      List<InventoryInsight> insights});
}

/// @nodoc
class __$$InventoryDashboardStatsImplCopyWithImpl<$Res>
    extends _$InventoryDashboardStatsCopyWithImpl<$Res,
        _$InventoryDashboardStatsImpl>
    implements _$$InventoryDashboardStatsImplCopyWith<$Res> {
  __$$InventoryDashboardStatsImplCopyWithImpl(
      _$InventoryDashboardStatsImpl _value,
      $Res Function(_$InventoryDashboardStatsImpl) _then)
      : super(_value, _then);

  /// Create a copy of InventoryDashboardStats
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalProducts = null,
    Object? totalWarehouses = null,
    Object? totalStockValue = null,
    Object? lowStockCount = null,
    Object? outOfStockCount = null,
    Object? expiringCount = null,
    Object? alertsCount = null,
    Object? pendingTransfers = null,
    Object? pendingPurchaseOrders = null,
    Object? averageTurnoverRate = null,
    Object? recentAlerts = null,
    Object? insights = null,
  }) {
    return _then(_$InventoryDashboardStatsImpl(
      totalProducts: null == totalProducts
          ? _value.totalProducts
          : totalProducts // ignore: cast_nullable_to_non_nullable
              as int,
      totalWarehouses: null == totalWarehouses
          ? _value.totalWarehouses
          : totalWarehouses // ignore: cast_nullable_to_non_nullable
              as int,
      totalStockValue: null == totalStockValue
          ? _value.totalStockValue
          : totalStockValue // ignore: cast_nullable_to_non_nullable
              as double,
      lowStockCount: null == lowStockCount
          ? _value.lowStockCount
          : lowStockCount // ignore: cast_nullable_to_non_nullable
              as int,
      outOfStockCount: null == outOfStockCount
          ? _value.outOfStockCount
          : outOfStockCount // ignore: cast_nullable_to_non_nullable
              as int,
      expiringCount: null == expiringCount
          ? _value.expiringCount
          : expiringCount // ignore: cast_nullable_to_non_nullable
              as int,
      alertsCount: null == alertsCount
          ? _value.alertsCount
          : alertsCount // ignore: cast_nullable_to_non_nullable
              as int,
      pendingTransfers: null == pendingTransfers
          ? _value.pendingTransfers
          : pendingTransfers // ignore: cast_nullable_to_non_nullable
              as int,
      pendingPurchaseOrders: null == pendingPurchaseOrders
          ? _value.pendingPurchaseOrders
          : pendingPurchaseOrders // ignore: cast_nullable_to_non_nullable
              as int,
      averageTurnoverRate: null == averageTurnoverRate
          ? _value.averageTurnoverRate
          : averageTurnoverRate // ignore: cast_nullable_to_non_nullable
              as double,
      recentAlerts: null == recentAlerts
          ? _value._recentAlerts
          : recentAlerts // ignore: cast_nullable_to_non_nullable
              as List<StockAlert>,
      insights: null == insights
          ? _value._insights
          : insights // ignore: cast_nullable_to_non_nullable
              as List<InventoryInsight>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$InventoryDashboardStatsImpl implements _InventoryDashboardStats {
  const _$InventoryDashboardStatsImpl(
      {this.totalProducts = 0,
      this.totalWarehouses = 0,
      this.totalStockValue = 0,
      this.lowStockCount = 0,
      this.outOfStockCount = 0,
      this.expiringCount = 0,
      this.alertsCount = 0,
      this.pendingTransfers = 0,
      this.pendingPurchaseOrders = 0,
      this.averageTurnoverRate = 0.0,
      final List<StockAlert> recentAlerts = const [],
      final List<InventoryInsight> insights = const []})
      : _recentAlerts = recentAlerts,
        _insights = insights;

  factory _$InventoryDashboardStatsImpl.fromJson(Map<String, dynamic> json) =>
      _$$InventoryDashboardStatsImplFromJson(json);

  @override
  @JsonKey()
  final int totalProducts;
  @override
  @JsonKey()
  final int totalWarehouses;
  @override
  @JsonKey()
  final double totalStockValue;
  @override
  @JsonKey()
  final int lowStockCount;
  @override
  @JsonKey()
  final int outOfStockCount;
  @override
  @JsonKey()
  final int expiringCount;
  @override
  @JsonKey()
  final int alertsCount;
  @override
  @JsonKey()
  final int pendingTransfers;
  @override
  @JsonKey()
  final int pendingPurchaseOrders;
  @override
  @JsonKey()
  final double averageTurnoverRate;
  final List<StockAlert> _recentAlerts;
  @override
  @JsonKey()
  List<StockAlert> get recentAlerts {
    if (_recentAlerts is EqualUnmodifiableListView) return _recentAlerts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_recentAlerts);
  }

  final List<InventoryInsight> _insights;
  @override
  @JsonKey()
  List<InventoryInsight> get insights {
    if (_insights is EqualUnmodifiableListView) return _insights;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_insights);
  }

  @override
  String toString() {
    return 'InventoryDashboardStats(totalProducts: $totalProducts, totalWarehouses: $totalWarehouses, totalStockValue: $totalStockValue, lowStockCount: $lowStockCount, outOfStockCount: $outOfStockCount, expiringCount: $expiringCount, alertsCount: $alertsCount, pendingTransfers: $pendingTransfers, pendingPurchaseOrders: $pendingPurchaseOrders, averageTurnoverRate: $averageTurnoverRate, recentAlerts: $recentAlerts, insights: $insights)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InventoryDashboardStatsImpl &&
            (identical(other.totalProducts, totalProducts) ||
                other.totalProducts == totalProducts) &&
            (identical(other.totalWarehouses, totalWarehouses) ||
                other.totalWarehouses == totalWarehouses) &&
            (identical(other.totalStockValue, totalStockValue) ||
                other.totalStockValue == totalStockValue) &&
            (identical(other.lowStockCount, lowStockCount) ||
                other.lowStockCount == lowStockCount) &&
            (identical(other.outOfStockCount, outOfStockCount) ||
                other.outOfStockCount == outOfStockCount) &&
            (identical(other.expiringCount, expiringCount) ||
                other.expiringCount == expiringCount) &&
            (identical(other.alertsCount, alertsCount) ||
                other.alertsCount == alertsCount) &&
            (identical(other.pendingTransfers, pendingTransfers) ||
                other.pendingTransfers == pendingTransfers) &&
            (identical(other.pendingPurchaseOrders, pendingPurchaseOrders) ||
                other.pendingPurchaseOrders == pendingPurchaseOrders) &&
            (identical(other.averageTurnoverRate, averageTurnoverRate) ||
                other.averageTurnoverRate == averageTurnoverRate) &&
            const DeepCollectionEquality()
                .equals(other._recentAlerts, _recentAlerts) &&
            const DeepCollectionEquality().equals(other._insights, _insights));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      totalProducts,
      totalWarehouses,
      totalStockValue,
      lowStockCount,
      outOfStockCount,
      expiringCount,
      alertsCount,
      pendingTransfers,
      pendingPurchaseOrders,
      averageTurnoverRate,
      const DeepCollectionEquality().hash(_recentAlerts),
      const DeepCollectionEquality().hash(_insights));

  /// Create a copy of InventoryDashboardStats
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InventoryDashboardStatsImplCopyWith<_$InventoryDashboardStatsImpl>
      get copyWith => __$$InventoryDashboardStatsImplCopyWithImpl<
          _$InventoryDashboardStatsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$InventoryDashboardStatsImplToJson(
      this,
    );
  }
}

abstract class _InventoryDashboardStats implements InventoryDashboardStats {
  const factory _InventoryDashboardStats(
      {final int totalProducts,
      final int totalWarehouses,
      final double totalStockValue,
      final int lowStockCount,
      final int outOfStockCount,
      final int expiringCount,
      final int alertsCount,
      final int pendingTransfers,
      final int pendingPurchaseOrders,
      final double averageTurnoverRate,
      final List<StockAlert> recentAlerts,
      final List<InventoryInsight> insights}) = _$InventoryDashboardStatsImpl;

  factory _InventoryDashboardStats.fromJson(Map<String, dynamic> json) =
      _$InventoryDashboardStatsImpl.fromJson;

  @override
  int get totalProducts;
  @override
  int get totalWarehouses;
  @override
  double get totalStockValue;
  @override
  int get lowStockCount;
  @override
  int get outOfStockCount;
  @override
  int get expiringCount;
  @override
  int get alertsCount;
  @override
  int get pendingTransfers;
  @override
  int get pendingPurchaseOrders;
  @override
  double get averageTurnoverRate;
  @override
  List<StockAlert> get recentAlerts;
  @override
  List<InventoryInsight> get insights;

  /// Create a copy of InventoryDashboardStats
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InventoryDashboardStatsImplCopyWith<_$InventoryDashboardStatsImpl>
      get copyWith => throw _privateConstructorUsedError;
}

VarianceReport _$VarianceReportFromJson(Map<String, dynamic> json) {
  return _VarianceReport.fromJson(json);
}

/// @nodoc
mixin _$VarianceReport {
  String get productUuid => throw _privateConstructorUsedError;
  String get productName => throw _privateConstructorUsedError;
  String get warehouseUuid => throw _privateConstructorUsedError;
  String get warehouseName => throw _privateConstructorUsedError;
  double get theoreticalStock =>
      throw _privateConstructorUsedError; // Based on transactions
  double get actualStock =>
      throw _privateConstructorUsedError; // From physical count
  double get variance =>
      throw _privateConstructorUsedError; // actual - theoretical
  double get variancePercentage => throw _privateConstructorUsedError;
  double get varianceCost => throw _privateConstructorUsedError;
  String? get possibleReason => throw _privateConstructorUsedError;
  DateTime? get countDate => throw _privateConstructorUsedError;

  /// Serializes this VarianceReport to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of VarianceReport
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VarianceReportCopyWith<VarianceReport> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VarianceReportCopyWith<$Res> {
  factory $VarianceReportCopyWith(
          VarianceReport value, $Res Function(VarianceReport) then) =
      _$VarianceReportCopyWithImpl<$Res, VarianceReport>;
  @useResult
  $Res call(
      {String productUuid,
      String productName,
      String warehouseUuid,
      String warehouseName,
      double theoreticalStock,
      double actualStock,
      double variance,
      double variancePercentage,
      double varianceCost,
      String? possibleReason,
      DateTime? countDate});
}

/// @nodoc
class _$VarianceReportCopyWithImpl<$Res, $Val extends VarianceReport>
    implements $VarianceReportCopyWith<$Res> {
  _$VarianceReportCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VarianceReport
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productUuid = null,
    Object? productName = null,
    Object? warehouseUuid = null,
    Object? warehouseName = null,
    Object? theoreticalStock = null,
    Object? actualStock = null,
    Object? variance = null,
    Object? variancePercentage = null,
    Object? varianceCost = null,
    Object? possibleReason = freezed,
    Object? countDate = freezed,
  }) {
    return _then(_value.copyWith(
      productUuid: null == productUuid
          ? _value.productUuid
          : productUuid // ignore: cast_nullable_to_non_nullable
              as String,
      productName: null == productName
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String,
      warehouseUuid: null == warehouseUuid
          ? _value.warehouseUuid
          : warehouseUuid // ignore: cast_nullable_to_non_nullable
              as String,
      warehouseName: null == warehouseName
          ? _value.warehouseName
          : warehouseName // ignore: cast_nullable_to_non_nullable
              as String,
      theoreticalStock: null == theoreticalStock
          ? _value.theoreticalStock
          : theoreticalStock // ignore: cast_nullable_to_non_nullable
              as double,
      actualStock: null == actualStock
          ? _value.actualStock
          : actualStock // ignore: cast_nullable_to_non_nullable
              as double,
      variance: null == variance
          ? _value.variance
          : variance // ignore: cast_nullable_to_non_nullable
              as double,
      variancePercentage: null == variancePercentage
          ? _value.variancePercentage
          : variancePercentage // ignore: cast_nullable_to_non_nullable
              as double,
      varianceCost: null == varianceCost
          ? _value.varianceCost
          : varianceCost // ignore: cast_nullable_to_non_nullable
              as double,
      possibleReason: freezed == possibleReason
          ? _value.possibleReason
          : possibleReason // ignore: cast_nullable_to_non_nullable
              as String?,
      countDate: freezed == countDate
          ? _value.countDate
          : countDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VarianceReportImplCopyWith<$Res>
    implements $VarianceReportCopyWith<$Res> {
  factory _$$VarianceReportImplCopyWith(_$VarianceReportImpl value,
          $Res Function(_$VarianceReportImpl) then) =
      __$$VarianceReportImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String productUuid,
      String productName,
      String warehouseUuid,
      String warehouseName,
      double theoreticalStock,
      double actualStock,
      double variance,
      double variancePercentage,
      double varianceCost,
      String? possibleReason,
      DateTime? countDate});
}

/// @nodoc
class __$$VarianceReportImplCopyWithImpl<$Res>
    extends _$VarianceReportCopyWithImpl<$Res, _$VarianceReportImpl>
    implements _$$VarianceReportImplCopyWith<$Res> {
  __$$VarianceReportImplCopyWithImpl(
      _$VarianceReportImpl _value, $Res Function(_$VarianceReportImpl) _then)
      : super(_value, _then);

  /// Create a copy of VarianceReport
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productUuid = null,
    Object? productName = null,
    Object? warehouseUuid = null,
    Object? warehouseName = null,
    Object? theoreticalStock = null,
    Object? actualStock = null,
    Object? variance = null,
    Object? variancePercentage = null,
    Object? varianceCost = null,
    Object? possibleReason = freezed,
    Object? countDate = freezed,
  }) {
    return _then(_$VarianceReportImpl(
      productUuid: null == productUuid
          ? _value.productUuid
          : productUuid // ignore: cast_nullable_to_non_nullable
              as String,
      productName: null == productName
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String,
      warehouseUuid: null == warehouseUuid
          ? _value.warehouseUuid
          : warehouseUuid // ignore: cast_nullable_to_non_nullable
              as String,
      warehouseName: null == warehouseName
          ? _value.warehouseName
          : warehouseName // ignore: cast_nullable_to_non_nullable
              as String,
      theoreticalStock: null == theoreticalStock
          ? _value.theoreticalStock
          : theoreticalStock // ignore: cast_nullable_to_non_nullable
              as double,
      actualStock: null == actualStock
          ? _value.actualStock
          : actualStock // ignore: cast_nullable_to_non_nullable
              as double,
      variance: null == variance
          ? _value.variance
          : variance // ignore: cast_nullable_to_non_nullable
              as double,
      variancePercentage: null == variancePercentage
          ? _value.variancePercentage
          : variancePercentage // ignore: cast_nullable_to_non_nullable
              as double,
      varianceCost: null == varianceCost
          ? _value.varianceCost
          : varianceCost // ignore: cast_nullable_to_non_nullable
              as double,
      possibleReason: freezed == possibleReason
          ? _value.possibleReason
          : possibleReason // ignore: cast_nullable_to_non_nullable
              as String?,
      countDate: freezed == countDate
          ? _value.countDate
          : countDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VarianceReportImpl implements _VarianceReport {
  const _$VarianceReportImpl(
      {required this.productUuid,
      required this.productName,
      required this.warehouseUuid,
      required this.warehouseName,
      required this.theoreticalStock,
      required this.actualStock,
      required this.variance,
      required this.variancePercentage,
      required this.varianceCost,
      this.possibleReason,
      this.countDate});

  factory _$VarianceReportImpl.fromJson(Map<String, dynamic> json) =>
      _$$VarianceReportImplFromJson(json);

  @override
  final String productUuid;
  @override
  final String productName;
  @override
  final String warehouseUuid;
  @override
  final String warehouseName;
  @override
  final double theoreticalStock;
// Based on transactions
  @override
  final double actualStock;
// From physical count
  @override
  final double variance;
// actual - theoretical
  @override
  final double variancePercentage;
  @override
  final double varianceCost;
  @override
  final String? possibleReason;
  @override
  final DateTime? countDate;

  @override
  String toString() {
    return 'VarianceReport(productUuid: $productUuid, productName: $productName, warehouseUuid: $warehouseUuid, warehouseName: $warehouseName, theoreticalStock: $theoreticalStock, actualStock: $actualStock, variance: $variance, variancePercentage: $variancePercentage, varianceCost: $varianceCost, possibleReason: $possibleReason, countDate: $countDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VarianceReportImpl &&
            (identical(other.productUuid, productUuid) ||
                other.productUuid == productUuid) &&
            (identical(other.productName, productName) ||
                other.productName == productName) &&
            (identical(other.warehouseUuid, warehouseUuid) ||
                other.warehouseUuid == warehouseUuid) &&
            (identical(other.warehouseName, warehouseName) ||
                other.warehouseName == warehouseName) &&
            (identical(other.theoreticalStock, theoreticalStock) ||
                other.theoreticalStock == theoreticalStock) &&
            (identical(other.actualStock, actualStock) ||
                other.actualStock == actualStock) &&
            (identical(other.variance, variance) ||
                other.variance == variance) &&
            (identical(other.variancePercentage, variancePercentage) ||
                other.variancePercentage == variancePercentage) &&
            (identical(other.varianceCost, varianceCost) ||
                other.varianceCost == varianceCost) &&
            (identical(other.possibleReason, possibleReason) ||
                other.possibleReason == possibleReason) &&
            (identical(other.countDate, countDate) ||
                other.countDate == countDate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      productUuid,
      productName,
      warehouseUuid,
      warehouseName,
      theoreticalStock,
      actualStock,
      variance,
      variancePercentage,
      varianceCost,
      possibleReason,
      countDate);

  /// Create a copy of VarianceReport
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VarianceReportImplCopyWith<_$VarianceReportImpl> get copyWith =>
      __$$VarianceReportImplCopyWithImpl<_$VarianceReportImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VarianceReportImplToJson(
      this,
    );
  }
}

abstract class _VarianceReport implements VarianceReport {
  const factory _VarianceReport(
      {required final String productUuid,
      required final String productName,
      required final String warehouseUuid,
      required final String warehouseName,
      required final double theoreticalStock,
      required final double actualStock,
      required final double variance,
      required final double variancePercentage,
      required final double varianceCost,
      final String? possibleReason,
      final DateTime? countDate}) = _$VarianceReportImpl;

  factory _VarianceReport.fromJson(Map<String, dynamic> json) =
      _$VarianceReportImpl.fromJson;

  @override
  String get productUuid;
  @override
  String get productName;
  @override
  String get warehouseUuid;
  @override
  String get warehouseName;
  @override
  double get theoreticalStock; // Based on transactions
  @override
  double get actualStock; // From physical count
  @override
  double get variance; // actual - theoretical
  @override
  double get variancePercentage;
  @override
  double get varianceCost;
  @override
  String? get possibleReason;
  @override
  DateTime? get countDate;

  /// Create a copy of VarianceReport
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VarianceReportImplCopyWith<_$VarianceReportImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
