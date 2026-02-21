// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'inventory_management_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$InventoryManagementEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            Product product, File? imageFile, List<String>? modifierGroupUuids)
        addProduct,
    required TResult Function(
            Product product, File? imageFile, List<String>? modifierGroupUuids)
        updateProduct,
    required TResult Function(String uuid) deleteProduct,
    required TResult Function(String uuid, int delta) updateStock,
    required TResult Function(String warehouseId) watchInventory,
    required TResult Function(List<ProductStock> inventory) inventoryUpdated,
    required TResult Function(
            String sourceWarehouseId,
            String targetWarehouseId,
            List<StockTransferItem> items,
            String referenceNote)
        stockTransferRequested,
    required TResult Function(String purchaseOrderUuid, String warehouseUuid,
            List<Map<String, dynamic>> items)
        receiveGoods,
    required TResult Function() fetchIncomingTransfers,
    required TResult Function(String transferUuid) receiveStockTransfer,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            Product product, File? imageFile, List<String>? modifierGroupUuids)?
        addProduct,
    TResult? Function(
            Product product, File? imageFile, List<String>? modifierGroupUuids)?
        updateProduct,
    TResult? Function(String uuid)? deleteProduct,
    TResult? Function(String uuid, int delta)? updateStock,
    TResult? Function(String warehouseId)? watchInventory,
    TResult? Function(List<ProductStock> inventory)? inventoryUpdated,
    TResult? Function(String sourceWarehouseId, String targetWarehouseId,
            List<StockTransferItem> items, String referenceNote)?
        stockTransferRequested,
    TResult? Function(String purchaseOrderUuid, String warehouseUuid,
            List<Map<String, dynamic>> items)?
        receiveGoods,
    TResult? Function()? fetchIncomingTransfers,
    TResult? Function(String transferUuid)? receiveStockTransfer,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            Product product, File? imageFile, List<String>? modifierGroupUuids)?
        addProduct,
    TResult Function(
            Product product, File? imageFile, List<String>? modifierGroupUuids)?
        updateProduct,
    TResult Function(String uuid)? deleteProduct,
    TResult Function(String uuid, int delta)? updateStock,
    TResult Function(String warehouseId)? watchInventory,
    TResult Function(List<ProductStock> inventory)? inventoryUpdated,
    TResult Function(String sourceWarehouseId, String targetWarehouseId,
            List<StockTransferItem> items, String referenceNote)?
        stockTransferRequested,
    TResult Function(String purchaseOrderUuid, String warehouseUuid,
            List<Map<String, dynamic>> items)?
        receiveGoods,
    TResult Function()? fetchIncomingTransfers,
    TResult Function(String transferUuid)? receiveStockTransfer,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AddProduct value) addProduct,
    required TResult Function(_UpdateProduct value) updateProduct,
    required TResult Function(_DeleteProduct value) deleteProduct,
    required TResult Function(_UpdateStock value) updateStock,
    required TResult Function(_WatchInventory value) watchInventory,
    required TResult Function(_InventoryUpdated value) inventoryUpdated,
    required TResult Function(_StockTransferRequested value)
        stockTransferRequested,
    required TResult Function(_ReceiveGoods value) receiveGoods,
    required TResult Function(_FetchIncomingTransfers value)
        fetchIncomingTransfers,
    required TResult Function(_ReceiveStockTransfer value) receiveStockTransfer,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AddProduct value)? addProduct,
    TResult? Function(_UpdateProduct value)? updateProduct,
    TResult? Function(_DeleteProduct value)? deleteProduct,
    TResult? Function(_UpdateStock value)? updateStock,
    TResult? Function(_WatchInventory value)? watchInventory,
    TResult? Function(_InventoryUpdated value)? inventoryUpdated,
    TResult? Function(_StockTransferRequested value)? stockTransferRequested,
    TResult? Function(_ReceiveGoods value)? receiveGoods,
    TResult? Function(_FetchIncomingTransfers value)? fetchIncomingTransfers,
    TResult? Function(_ReceiveStockTransfer value)? receiveStockTransfer,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AddProduct value)? addProduct,
    TResult Function(_UpdateProduct value)? updateProduct,
    TResult Function(_DeleteProduct value)? deleteProduct,
    TResult Function(_UpdateStock value)? updateStock,
    TResult Function(_WatchInventory value)? watchInventory,
    TResult Function(_InventoryUpdated value)? inventoryUpdated,
    TResult Function(_StockTransferRequested value)? stockTransferRequested,
    TResult Function(_ReceiveGoods value)? receiveGoods,
    TResult Function(_FetchIncomingTransfers value)? fetchIncomingTransfers,
    TResult Function(_ReceiveStockTransfer value)? receiveStockTransfer,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InventoryManagementEventCopyWith<$Res> {
  factory $InventoryManagementEventCopyWith(InventoryManagementEvent value,
          $Res Function(InventoryManagementEvent) then) =
      _$InventoryManagementEventCopyWithImpl<$Res, InventoryManagementEvent>;
}

/// @nodoc
class _$InventoryManagementEventCopyWithImpl<$Res,
        $Val extends InventoryManagementEvent>
    implements $InventoryManagementEventCopyWith<$Res> {
  _$InventoryManagementEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of InventoryManagementEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$AddProductImplCopyWith<$Res> {
  factory _$$AddProductImplCopyWith(
          _$AddProductImpl value, $Res Function(_$AddProductImpl) then) =
      __$$AddProductImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {Product product, File? imageFile, List<String>? modifierGroupUuids});
}

/// @nodoc
class __$$AddProductImplCopyWithImpl<$Res>
    extends _$InventoryManagementEventCopyWithImpl<$Res, _$AddProductImpl>
    implements _$$AddProductImplCopyWith<$Res> {
  __$$AddProductImplCopyWithImpl(
      _$AddProductImpl _value, $Res Function(_$AddProductImpl) _then)
      : super(_value, _then);

  /// Create a copy of InventoryManagementEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? product = null,
    Object? imageFile = freezed,
    Object? modifierGroupUuids = freezed,
  }) {
    return _then(_$AddProductImpl(
      null == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as Product,
      freezed == imageFile
          ? _value.imageFile
          : imageFile // ignore: cast_nullable_to_non_nullable
              as File?,
      modifierGroupUuids: freezed == modifierGroupUuids
          ? _value._modifierGroupUuids
          : modifierGroupUuids // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc

class _$AddProductImpl implements _AddProduct {
  const _$AddProductImpl(this.product, this.imageFile,
      {final List<String>? modifierGroupUuids})
      : _modifierGroupUuids = modifierGroupUuids;

  @override
  final Product product;
  @override
  final File? imageFile;
  final List<String>? _modifierGroupUuids;
  @override
  List<String>? get modifierGroupUuids {
    final value = _modifierGroupUuids;
    if (value == null) return null;
    if (_modifierGroupUuids is EqualUnmodifiableListView)
      return _modifierGroupUuids;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'InventoryManagementEvent.addProduct(product: $product, imageFile: $imageFile, modifierGroupUuids: $modifierGroupUuids)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddProductImpl &&
            (identical(other.product, product) || other.product == product) &&
            (identical(other.imageFile, imageFile) ||
                other.imageFile == imageFile) &&
            const DeepCollectionEquality()
                .equals(other._modifierGroupUuids, _modifierGroupUuids));
  }

  @override
  int get hashCode => Object.hash(runtimeType, product, imageFile,
      const DeepCollectionEquality().hash(_modifierGroupUuids));

  /// Create a copy of InventoryManagementEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AddProductImplCopyWith<_$AddProductImpl> get copyWith =>
      __$$AddProductImplCopyWithImpl<_$AddProductImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            Product product, File? imageFile, List<String>? modifierGroupUuids)
        addProduct,
    required TResult Function(
            Product product, File? imageFile, List<String>? modifierGroupUuids)
        updateProduct,
    required TResult Function(String uuid) deleteProduct,
    required TResult Function(String uuid, int delta) updateStock,
    required TResult Function(String warehouseId) watchInventory,
    required TResult Function(List<ProductStock> inventory) inventoryUpdated,
    required TResult Function(
            String sourceWarehouseId,
            String targetWarehouseId,
            List<StockTransferItem> items,
            String referenceNote)
        stockTransferRequested,
    required TResult Function(String purchaseOrderUuid, String warehouseUuid,
            List<Map<String, dynamic>> items)
        receiveGoods,
    required TResult Function() fetchIncomingTransfers,
    required TResult Function(String transferUuid) receiveStockTransfer,
  }) {
    return addProduct(product, imageFile, modifierGroupUuids);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            Product product, File? imageFile, List<String>? modifierGroupUuids)?
        addProduct,
    TResult? Function(
            Product product, File? imageFile, List<String>? modifierGroupUuids)?
        updateProduct,
    TResult? Function(String uuid)? deleteProduct,
    TResult? Function(String uuid, int delta)? updateStock,
    TResult? Function(String warehouseId)? watchInventory,
    TResult? Function(List<ProductStock> inventory)? inventoryUpdated,
    TResult? Function(String sourceWarehouseId, String targetWarehouseId,
            List<StockTransferItem> items, String referenceNote)?
        stockTransferRequested,
    TResult? Function(String purchaseOrderUuid, String warehouseUuid,
            List<Map<String, dynamic>> items)?
        receiveGoods,
    TResult? Function()? fetchIncomingTransfers,
    TResult? Function(String transferUuid)? receiveStockTransfer,
  }) {
    return addProduct?.call(product, imageFile, modifierGroupUuids);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            Product product, File? imageFile, List<String>? modifierGroupUuids)?
        addProduct,
    TResult Function(
            Product product, File? imageFile, List<String>? modifierGroupUuids)?
        updateProduct,
    TResult Function(String uuid)? deleteProduct,
    TResult Function(String uuid, int delta)? updateStock,
    TResult Function(String warehouseId)? watchInventory,
    TResult Function(List<ProductStock> inventory)? inventoryUpdated,
    TResult Function(String sourceWarehouseId, String targetWarehouseId,
            List<StockTransferItem> items, String referenceNote)?
        stockTransferRequested,
    TResult Function(String purchaseOrderUuid, String warehouseUuid,
            List<Map<String, dynamic>> items)?
        receiveGoods,
    TResult Function()? fetchIncomingTransfers,
    TResult Function(String transferUuid)? receiveStockTransfer,
    required TResult orElse(),
  }) {
    if (addProduct != null) {
      return addProduct(product, imageFile, modifierGroupUuids);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AddProduct value) addProduct,
    required TResult Function(_UpdateProduct value) updateProduct,
    required TResult Function(_DeleteProduct value) deleteProduct,
    required TResult Function(_UpdateStock value) updateStock,
    required TResult Function(_WatchInventory value) watchInventory,
    required TResult Function(_InventoryUpdated value) inventoryUpdated,
    required TResult Function(_StockTransferRequested value)
        stockTransferRequested,
    required TResult Function(_ReceiveGoods value) receiveGoods,
    required TResult Function(_FetchIncomingTransfers value)
        fetchIncomingTransfers,
    required TResult Function(_ReceiveStockTransfer value) receiveStockTransfer,
  }) {
    return addProduct(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AddProduct value)? addProduct,
    TResult? Function(_UpdateProduct value)? updateProduct,
    TResult? Function(_DeleteProduct value)? deleteProduct,
    TResult? Function(_UpdateStock value)? updateStock,
    TResult? Function(_WatchInventory value)? watchInventory,
    TResult? Function(_InventoryUpdated value)? inventoryUpdated,
    TResult? Function(_StockTransferRequested value)? stockTransferRequested,
    TResult? Function(_ReceiveGoods value)? receiveGoods,
    TResult? Function(_FetchIncomingTransfers value)? fetchIncomingTransfers,
    TResult? Function(_ReceiveStockTransfer value)? receiveStockTransfer,
  }) {
    return addProduct?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AddProduct value)? addProduct,
    TResult Function(_UpdateProduct value)? updateProduct,
    TResult Function(_DeleteProduct value)? deleteProduct,
    TResult Function(_UpdateStock value)? updateStock,
    TResult Function(_WatchInventory value)? watchInventory,
    TResult Function(_InventoryUpdated value)? inventoryUpdated,
    TResult Function(_StockTransferRequested value)? stockTransferRequested,
    TResult Function(_ReceiveGoods value)? receiveGoods,
    TResult Function(_FetchIncomingTransfers value)? fetchIncomingTransfers,
    TResult Function(_ReceiveStockTransfer value)? receiveStockTransfer,
    required TResult orElse(),
  }) {
    if (addProduct != null) {
      return addProduct(this);
    }
    return orElse();
  }
}

abstract class _AddProduct implements InventoryManagementEvent {
  const factory _AddProduct(final Product product, final File? imageFile,
      {final List<String>? modifierGroupUuids}) = _$AddProductImpl;

  Product get product;
  File? get imageFile;
  List<String>? get modifierGroupUuids;

  /// Create a copy of InventoryManagementEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AddProductImplCopyWith<_$AddProductImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateProductImplCopyWith<$Res> {
  factory _$$UpdateProductImplCopyWith(
          _$UpdateProductImpl value, $Res Function(_$UpdateProductImpl) then) =
      __$$UpdateProductImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {Product product, File? imageFile, List<String>? modifierGroupUuids});
}

/// @nodoc
class __$$UpdateProductImplCopyWithImpl<$Res>
    extends _$InventoryManagementEventCopyWithImpl<$Res, _$UpdateProductImpl>
    implements _$$UpdateProductImplCopyWith<$Res> {
  __$$UpdateProductImplCopyWithImpl(
      _$UpdateProductImpl _value, $Res Function(_$UpdateProductImpl) _then)
      : super(_value, _then);

  /// Create a copy of InventoryManagementEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? product = null,
    Object? imageFile = freezed,
    Object? modifierGroupUuids = freezed,
  }) {
    return _then(_$UpdateProductImpl(
      null == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as Product,
      freezed == imageFile
          ? _value.imageFile
          : imageFile // ignore: cast_nullable_to_non_nullable
              as File?,
      modifierGroupUuids: freezed == modifierGroupUuids
          ? _value._modifierGroupUuids
          : modifierGroupUuids // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc

class _$UpdateProductImpl implements _UpdateProduct {
  const _$UpdateProductImpl(this.product, this.imageFile,
      {final List<String>? modifierGroupUuids})
      : _modifierGroupUuids = modifierGroupUuids;

  @override
  final Product product;
  @override
  final File? imageFile;
  final List<String>? _modifierGroupUuids;
  @override
  List<String>? get modifierGroupUuids {
    final value = _modifierGroupUuids;
    if (value == null) return null;
    if (_modifierGroupUuids is EqualUnmodifiableListView)
      return _modifierGroupUuids;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'InventoryManagementEvent.updateProduct(product: $product, imageFile: $imageFile, modifierGroupUuids: $modifierGroupUuids)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateProductImpl &&
            (identical(other.product, product) || other.product == product) &&
            (identical(other.imageFile, imageFile) ||
                other.imageFile == imageFile) &&
            const DeepCollectionEquality()
                .equals(other._modifierGroupUuids, _modifierGroupUuids));
  }

  @override
  int get hashCode => Object.hash(runtimeType, product, imageFile,
      const DeepCollectionEquality().hash(_modifierGroupUuids));

  /// Create a copy of InventoryManagementEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateProductImplCopyWith<_$UpdateProductImpl> get copyWith =>
      __$$UpdateProductImplCopyWithImpl<_$UpdateProductImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            Product product, File? imageFile, List<String>? modifierGroupUuids)
        addProduct,
    required TResult Function(
            Product product, File? imageFile, List<String>? modifierGroupUuids)
        updateProduct,
    required TResult Function(String uuid) deleteProduct,
    required TResult Function(String uuid, int delta) updateStock,
    required TResult Function(String warehouseId) watchInventory,
    required TResult Function(List<ProductStock> inventory) inventoryUpdated,
    required TResult Function(
            String sourceWarehouseId,
            String targetWarehouseId,
            List<StockTransferItem> items,
            String referenceNote)
        stockTransferRequested,
    required TResult Function(String purchaseOrderUuid, String warehouseUuid,
            List<Map<String, dynamic>> items)
        receiveGoods,
    required TResult Function() fetchIncomingTransfers,
    required TResult Function(String transferUuid) receiveStockTransfer,
  }) {
    return updateProduct(product, imageFile, modifierGroupUuids);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            Product product, File? imageFile, List<String>? modifierGroupUuids)?
        addProduct,
    TResult? Function(
            Product product, File? imageFile, List<String>? modifierGroupUuids)?
        updateProduct,
    TResult? Function(String uuid)? deleteProduct,
    TResult? Function(String uuid, int delta)? updateStock,
    TResult? Function(String warehouseId)? watchInventory,
    TResult? Function(List<ProductStock> inventory)? inventoryUpdated,
    TResult? Function(String sourceWarehouseId, String targetWarehouseId,
            List<StockTransferItem> items, String referenceNote)?
        stockTransferRequested,
    TResult? Function(String purchaseOrderUuid, String warehouseUuid,
            List<Map<String, dynamic>> items)?
        receiveGoods,
    TResult? Function()? fetchIncomingTransfers,
    TResult? Function(String transferUuid)? receiveStockTransfer,
  }) {
    return updateProduct?.call(product, imageFile, modifierGroupUuids);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            Product product, File? imageFile, List<String>? modifierGroupUuids)?
        addProduct,
    TResult Function(
            Product product, File? imageFile, List<String>? modifierGroupUuids)?
        updateProduct,
    TResult Function(String uuid)? deleteProduct,
    TResult Function(String uuid, int delta)? updateStock,
    TResult Function(String warehouseId)? watchInventory,
    TResult Function(List<ProductStock> inventory)? inventoryUpdated,
    TResult Function(String sourceWarehouseId, String targetWarehouseId,
            List<StockTransferItem> items, String referenceNote)?
        stockTransferRequested,
    TResult Function(String purchaseOrderUuid, String warehouseUuid,
            List<Map<String, dynamic>> items)?
        receiveGoods,
    TResult Function()? fetchIncomingTransfers,
    TResult Function(String transferUuid)? receiveStockTransfer,
    required TResult orElse(),
  }) {
    if (updateProduct != null) {
      return updateProduct(product, imageFile, modifierGroupUuids);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AddProduct value) addProduct,
    required TResult Function(_UpdateProduct value) updateProduct,
    required TResult Function(_DeleteProduct value) deleteProduct,
    required TResult Function(_UpdateStock value) updateStock,
    required TResult Function(_WatchInventory value) watchInventory,
    required TResult Function(_InventoryUpdated value) inventoryUpdated,
    required TResult Function(_StockTransferRequested value)
        stockTransferRequested,
    required TResult Function(_ReceiveGoods value) receiveGoods,
    required TResult Function(_FetchIncomingTransfers value)
        fetchIncomingTransfers,
    required TResult Function(_ReceiveStockTransfer value) receiveStockTransfer,
  }) {
    return updateProduct(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AddProduct value)? addProduct,
    TResult? Function(_UpdateProduct value)? updateProduct,
    TResult? Function(_DeleteProduct value)? deleteProduct,
    TResult? Function(_UpdateStock value)? updateStock,
    TResult? Function(_WatchInventory value)? watchInventory,
    TResult? Function(_InventoryUpdated value)? inventoryUpdated,
    TResult? Function(_StockTransferRequested value)? stockTransferRequested,
    TResult? Function(_ReceiveGoods value)? receiveGoods,
    TResult? Function(_FetchIncomingTransfers value)? fetchIncomingTransfers,
    TResult? Function(_ReceiveStockTransfer value)? receiveStockTransfer,
  }) {
    return updateProduct?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AddProduct value)? addProduct,
    TResult Function(_UpdateProduct value)? updateProduct,
    TResult Function(_DeleteProduct value)? deleteProduct,
    TResult Function(_UpdateStock value)? updateStock,
    TResult Function(_WatchInventory value)? watchInventory,
    TResult Function(_InventoryUpdated value)? inventoryUpdated,
    TResult Function(_StockTransferRequested value)? stockTransferRequested,
    TResult Function(_ReceiveGoods value)? receiveGoods,
    TResult Function(_FetchIncomingTransfers value)? fetchIncomingTransfers,
    TResult Function(_ReceiveStockTransfer value)? receiveStockTransfer,
    required TResult orElse(),
  }) {
    if (updateProduct != null) {
      return updateProduct(this);
    }
    return orElse();
  }
}

abstract class _UpdateProduct implements InventoryManagementEvent {
  const factory _UpdateProduct(final Product product, final File? imageFile,
      {final List<String>? modifierGroupUuids}) = _$UpdateProductImpl;

  Product get product;
  File? get imageFile;
  List<String>? get modifierGroupUuids;

  /// Create a copy of InventoryManagementEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateProductImplCopyWith<_$UpdateProductImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeleteProductImplCopyWith<$Res> {
  factory _$$DeleteProductImplCopyWith(
          _$DeleteProductImpl value, $Res Function(_$DeleteProductImpl) then) =
      __$$DeleteProductImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String uuid});
}

/// @nodoc
class __$$DeleteProductImplCopyWithImpl<$Res>
    extends _$InventoryManagementEventCopyWithImpl<$Res, _$DeleteProductImpl>
    implements _$$DeleteProductImplCopyWith<$Res> {
  __$$DeleteProductImplCopyWithImpl(
      _$DeleteProductImpl _value, $Res Function(_$DeleteProductImpl) _then)
      : super(_value, _then);

  /// Create a copy of InventoryManagementEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
  }) {
    return _then(_$DeleteProductImpl(
      null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$DeleteProductImpl implements _DeleteProduct {
  const _$DeleteProductImpl(this.uuid);

  @override
  final String uuid;

  @override
  String toString() {
    return 'InventoryManagementEvent.deleteProduct(uuid: $uuid)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeleteProductImpl &&
            (identical(other.uuid, uuid) || other.uuid == uuid));
  }

  @override
  int get hashCode => Object.hash(runtimeType, uuid);

  /// Create a copy of InventoryManagementEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeleteProductImplCopyWith<_$DeleteProductImpl> get copyWith =>
      __$$DeleteProductImplCopyWithImpl<_$DeleteProductImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            Product product, File? imageFile, List<String>? modifierGroupUuids)
        addProduct,
    required TResult Function(
            Product product, File? imageFile, List<String>? modifierGroupUuids)
        updateProduct,
    required TResult Function(String uuid) deleteProduct,
    required TResult Function(String uuid, int delta) updateStock,
    required TResult Function(String warehouseId) watchInventory,
    required TResult Function(List<ProductStock> inventory) inventoryUpdated,
    required TResult Function(
            String sourceWarehouseId,
            String targetWarehouseId,
            List<StockTransferItem> items,
            String referenceNote)
        stockTransferRequested,
    required TResult Function(String purchaseOrderUuid, String warehouseUuid,
            List<Map<String, dynamic>> items)
        receiveGoods,
    required TResult Function() fetchIncomingTransfers,
    required TResult Function(String transferUuid) receiveStockTransfer,
  }) {
    return deleteProduct(uuid);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            Product product, File? imageFile, List<String>? modifierGroupUuids)?
        addProduct,
    TResult? Function(
            Product product, File? imageFile, List<String>? modifierGroupUuids)?
        updateProduct,
    TResult? Function(String uuid)? deleteProduct,
    TResult? Function(String uuid, int delta)? updateStock,
    TResult? Function(String warehouseId)? watchInventory,
    TResult? Function(List<ProductStock> inventory)? inventoryUpdated,
    TResult? Function(String sourceWarehouseId, String targetWarehouseId,
            List<StockTransferItem> items, String referenceNote)?
        stockTransferRequested,
    TResult? Function(String purchaseOrderUuid, String warehouseUuid,
            List<Map<String, dynamic>> items)?
        receiveGoods,
    TResult? Function()? fetchIncomingTransfers,
    TResult? Function(String transferUuid)? receiveStockTransfer,
  }) {
    return deleteProduct?.call(uuid);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            Product product, File? imageFile, List<String>? modifierGroupUuids)?
        addProduct,
    TResult Function(
            Product product, File? imageFile, List<String>? modifierGroupUuids)?
        updateProduct,
    TResult Function(String uuid)? deleteProduct,
    TResult Function(String uuid, int delta)? updateStock,
    TResult Function(String warehouseId)? watchInventory,
    TResult Function(List<ProductStock> inventory)? inventoryUpdated,
    TResult Function(String sourceWarehouseId, String targetWarehouseId,
            List<StockTransferItem> items, String referenceNote)?
        stockTransferRequested,
    TResult Function(String purchaseOrderUuid, String warehouseUuid,
            List<Map<String, dynamic>> items)?
        receiveGoods,
    TResult Function()? fetchIncomingTransfers,
    TResult Function(String transferUuid)? receiveStockTransfer,
    required TResult orElse(),
  }) {
    if (deleteProduct != null) {
      return deleteProduct(uuid);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AddProduct value) addProduct,
    required TResult Function(_UpdateProduct value) updateProduct,
    required TResult Function(_DeleteProduct value) deleteProduct,
    required TResult Function(_UpdateStock value) updateStock,
    required TResult Function(_WatchInventory value) watchInventory,
    required TResult Function(_InventoryUpdated value) inventoryUpdated,
    required TResult Function(_StockTransferRequested value)
        stockTransferRequested,
    required TResult Function(_ReceiveGoods value) receiveGoods,
    required TResult Function(_FetchIncomingTransfers value)
        fetchIncomingTransfers,
    required TResult Function(_ReceiveStockTransfer value) receiveStockTransfer,
  }) {
    return deleteProduct(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AddProduct value)? addProduct,
    TResult? Function(_UpdateProduct value)? updateProduct,
    TResult? Function(_DeleteProduct value)? deleteProduct,
    TResult? Function(_UpdateStock value)? updateStock,
    TResult? Function(_WatchInventory value)? watchInventory,
    TResult? Function(_InventoryUpdated value)? inventoryUpdated,
    TResult? Function(_StockTransferRequested value)? stockTransferRequested,
    TResult? Function(_ReceiveGoods value)? receiveGoods,
    TResult? Function(_FetchIncomingTransfers value)? fetchIncomingTransfers,
    TResult? Function(_ReceiveStockTransfer value)? receiveStockTransfer,
  }) {
    return deleteProduct?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AddProduct value)? addProduct,
    TResult Function(_UpdateProduct value)? updateProduct,
    TResult Function(_DeleteProduct value)? deleteProduct,
    TResult Function(_UpdateStock value)? updateStock,
    TResult Function(_WatchInventory value)? watchInventory,
    TResult Function(_InventoryUpdated value)? inventoryUpdated,
    TResult Function(_StockTransferRequested value)? stockTransferRequested,
    TResult Function(_ReceiveGoods value)? receiveGoods,
    TResult Function(_FetchIncomingTransfers value)? fetchIncomingTransfers,
    TResult Function(_ReceiveStockTransfer value)? receiveStockTransfer,
    required TResult orElse(),
  }) {
    if (deleteProduct != null) {
      return deleteProduct(this);
    }
    return orElse();
  }
}

abstract class _DeleteProduct implements InventoryManagementEvent {
  const factory _DeleteProduct(final String uuid) = _$DeleteProductImpl;

  String get uuid;

  /// Create a copy of InventoryManagementEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeleteProductImplCopyWith<_$DeleteProductImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateStockImplCopyWith<$Res> {
  factory _$$UpdateStockImplCopyWith(
          _$UpdateStockImpl value, $Res Function(_$UpdateStockImpl) then) =
      __$$UpdateStockImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String uuid, int delta});
}

/// @nodoc
class __$$UpdateStockImplCopyWithImpl<$Res>
    extends _$InventoryManagementEventCopyWithImpl<$Res, _$UpdateStockImpl>
    implements _$$UpdateStockImplCopyWith<$Res> {
  __$$UpdateStockImplCopyWithImpl(
      _$UpdateStockImpl _value, $Res Function(_$UpdateStockImpl) _then)
      : super(_value, _then);

  /// Create a copy of InventoryManagementEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
    Object? delta = null,
  }) {
    return _then(_$UpdateStockImpl(
      null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      null == delta
          ? _value.delta
          : delta // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$UpdateStockImpl implements _UpdateStock {
  const _$UpdateStockImpl(this.uuid, this.delta);

  @override
  final String uuid;
  @override
  final int delta;

  @override
  String toString() {
    return 'InventoryManagementEvent.updateStock(uuid: $uuid, delta: $delta)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateStockImpl &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.delta, delta) || other.delta == delta));
  }

  @override
  int get hashCode => Object.hash(runtimeType, uuid, delta);

  /// Create a copy of InventoryManagementEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateStockImplCopyWith<_$UpdateStockImpl> get copyWith =>
      __$$UpdateStockImplCopyWithImpl<_$UpdateStockImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            Product product, File? imageFile, List<String>? modifierGroupUuids)
        addProduct,
    required TResult Function(
            Product product, File? imageFile, List<String>? modifierGroupUuids)
        updateProduct,
    required TResult Function(String uuid) deleteProduct,
    required TResult Function(String uuid, int delta) updateStock,
    required TResult Function(String warehouseId) watchInventory,
    required TResult Function(List<ProductStock> inventory) inventoryUpdated,
    required TResult Function(
            String sourceWarehouseId,
            String targetWarehouseId,
            List<StockTransferItem> items,
            String referenceNote)
        stockTransferRequested,
    required TResult Function(String purchaseOrderUuid, String warehouseUuid,
            List<Map<String, dynamic>> items)
        receiveGoods,
    required TResult Function() fetchIncomingTransfers,
    required TResult Function(String transferUuid) receiveStockTransfer,
  }) {
    return updateStock(uuid, delta);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            Product product, File? imageFile, List<String>? modifierGroupUuids)?
        addProduct,
    TResult? Function(
            Product product, File? imageFile, List<String>? modifierGroupUuids)?
        updateProduct,
    TResult? Function(String uuid)? deleteProduct,
    TResult? Function(String uuid, int delta)? updateStock,
    TResult? Function(String warehouseId)? watchInventory,
    TResult? Function(List<ProductStock> inventory)? inventoryUpdated,
    TResult? Function(String sourceWarehouseId, String targetWarehouseId,
            List<StockTransferItem> items, String referenceNote)?
        stockTransferRequested,
    TResult? Function(String purchaseOrderUuid, String warehouseUuid,
            List<Map<String, dynamic>> items)?
        receiveGoods,
    TResult? Function()? fetchIncomingTransfers,
    TResult? Function(String transferUuid)? receiveStockTransfer,
  }) {
    return updateStock?.call(uuid, delta);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            Product product, File? imageFile, List<String>? modifierGroupUuids)?
        addProduct,
    TResult Function(
            Product product, File? imageFile, List<String>? modifierGroupUuids)?
        updateProduct,
    TResult Function(String uuid)? deleteProduct,
    TResult Function(String uuid, int delta)? updateStock,
    TResult Function(String warehouseId)? watchInventory,
    TResult Function(List<ProductStock> inventory)? inventoryUpdated,
    TResult Function(String sourceWarehouseId, String targetWarehouseId,
            List<StockTransferItem> items, String referenceNote)?
        stockTransferRequested,
    TResult Function(String purchaseOrderUuid, String warehouseUuid,
            List<Map<String, dynamic>> items)?
        receiveGoods,
    TResult Function()? fetchIncomingTransfers,
    TResult Function(String transferUuid)? receiveStockTransfer,
    required TResult orElse(),
  }) {
    if (updateStock != null) {
      return updateStock(uuid, delta);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AddProduct value) addProduct,
    required TResult Function(_UpdateProduct value) updateProduct,
    required TResult Function(_DeleteProduct value) deleteProduct,
    required TResult Function(_UpdateStock value) updateStock,
    required TResult Function(_WatchInventory value) watchInventory,
    required TResult Function(_InventoryUpdated value) inventoryUpdated,
    required TResult Function(_StockTransferRequested value)
        stockTransferRequested,
    required TResult Function(_ReceiveGoods value) receiveGoods,
    required TResult Function(_FetchIncomingTransfers value)
        fetchIncomingTransfers,
    required TResult Function(_ReceiveStockTransfer value) receiveStockTransfer,
  }) {
    return updateStock(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AddProduct value)? addProduct,
    TResult? Function(_UpdateProduct value)? updateProduct,
    TResult? Function(_DeleteProduct value)? deleteProduct,
    TResult? Function(_UpdateStock value)? updateStock,
    TResult? Function(_WatchInventory value)? watchInventory,
    TResult? Function(_InventoryUpdated value)? inventoryUpdated,
    TResult? Function(_StockTransferRequested value)? stockTransferRequested,
    TResult? Function(_ReceiveGoods value)? receiveGoods,
    TResult? Function(_FetchIncomingTransfers value)? fetchIncomingTransfers,
    TResult? Function(_ReceiveStockTransfer value)? receiveStockTransfer,
  }) {
    return updateStock?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AddProduct value)? addProduct,
    TResult Function(_UpdateProduct value)? updateProduct,
    TResult Function(_DeleteProduct value)? deleteProduct,
    TResult Function(_UpdateStock value)? updateStock,
    TResult Function(_WatchInventory value)? watchInventory,
    TResult Function(_InventoryUpdated value)? inventoryUpdated,
    TResult Function(_StockTransferRequested value)? stockTransferRequested,
    TResult Function(_ReceiveGoods value)? receiveGoods,
    TResult Function(_FetchIncomingTransfers value)? fetchIncomingTransfers,
    TResult Function(_ReceiveStockTransfer value)? receiveStockTransfer,
    required TResult orElse(),
  }) {
    if (updateStock != null) {
      return updateStock(this);
    }
    return orElse();
  }
}

abstract class _UpdateStock implements InventoryManagementEvent {
  const factory _UpdateStock(final String uuid, final int delta) =
      _$UpdateStockImpl;

  String get uuid;
  int get delta;

  /// Create a copy of InventoryManagementEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateStockImplCopyWith<_$UpdateStockImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$WatchInventoryImplCopyWith<$Res> {
  factory _$$WatchInventoryImplCopyWith(_$WatchInventoryImpl value,
          $Res Function(_$WatchInventoryImpl) then) =
      __$$WatchInventoryImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String warehouseId});
}

/// @nodoc
class __$$WatchInventoryImplCopyWithImpl<$Res>
    extends _$InventoryManagementEventCopyWithImpl<$Res, _$WatchInventoryImpl>
    implements _$$WatchInventoryImplCopyWith<$Res> {
  __$$WatchInventoryImplCopyWithImpl(
      _$WatchInventoryImpl _value, $Res Function(_$WatchInventoryImpl) _then)
      : super(_value, _then);

  /// Create a copy of InventoryManagementEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? warehouseId = null,
  }) {
    return _then(_$WatchInventoryImpl(
      null == warehouseId
          ? _value.warehouseId
          : warehouseId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$WatchInventoryImpl implements _WatchInventory {
  const _$WatchInventoryImpl(this.warehouseId);

  @override
  final String warehouseId;

  @override
  String toString() {
    return 'InventoryManagementEvent.watchInventory(warehouseId: $warehouseId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WatchInventoryImpl &&
            (identical(other.warehouseId, warehouseId) ||
                other.warehouseId == warehouseId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, warehouseId);

  /// Create a copy of InventoryManagementEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WatchInventoryImplCopyWith<_$WatchInventoryImpl> get copyWith =>
      __$$WatchInventoryImplCopyWithImpl<_$WatchInventoryImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            Product product, File? imageFile, List<String>? modifierGroupUuids)
        addProduct,
    required TResult Function(
            Product product, File? imageFile, List<String>? modifierGroupUuids)
        updateProduct,
    required TResult Function(String uuid) deleteProduct,
    required TResult Function(String uuid, int delta) updateStock,
    required TResult Function(String warehouseId) watchInventory,
    required TResult Function(List<ProductStock> inventory) inventoryUpdated,
    required TResult Function(
            String sourceWarehouseId,
            String targetWarehouseId,
            List<StockTransferItem> items,
            String referenceNote)
        stockTransferRequested,
    required TResult Function(String purchaseOrderUuid, String warehouseUuid,
            List<Map<String, dynamic>> items)
        receiveGoods,
    required TResult Function() fetchIncomingTransfers,
    required TResult Function(String transferUuid) receiveStockTransfer,
  }) {
    return watchInventory(warehouseId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            Product product, File? imageFile, List<String>? modifierGroupUuids)?
        addProduct,
    TResult? Function(
            Product product, File? imageFile, List<String>? modifierGroupUuids)?
        updateProduct,
    TResult? Function(String uuid)? deleteProduct,
    TResult? Function(String uuid, int delta)? updateStock,
    TResult? Function(String warehouseId)? watchInventory,
    TResult? Function(List<ProductStock> inventory)? inventoryUpdated,
    TResult? Function(String sourceWarehouseId, String targetWarehouseId,
            List<StockTransferItem> items, String referenceNote)?
        stockTransferRequested,
    TResult? Function(String purchaseOrderUuid, String warehouseUuid,
            List<Map<String, dynamic>> items)?
        receiveGoods,
    TResult? Function()? fetchIncomingTransfers,
    TResult? Function(String transferUuid)? receiveStockTransfer,
  }) {
    return watchInventory?.call(warehouseId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            Product product, File? imageFile, List<String>? modifierGroupUuids)?
        addProduct,
    TResult Function(
            Product product, File? imageFile, List<String>? modifierGroupUuids)?
        updateProduct,
    TResult Function(String uuid)? deleteProduct,
    TResult Function(String uuid, int delta)? updateStock,
    TResult Function(String warehouseId)? watchInventory,
    TResult Function(List<ProductStock> inventory)? inventoryUpdated,
    TResult Function(String sourceWarehouseId, String targetWarehouseId,
            List<StockTransferItem> items, String referenceNote)?
        stockTransferRequested,
    TResult Function(String purchaseOrderUuid, String warehouseUuid,
            List<Map<String, dynamic>> items)?
        receiveGoods,
    TResult Function()? fetchIncomingTransfers,
    TResult Function(String transferUuid)? receiveStockTransfer,
    required TResult orElse(),
  }) {
    if (watchInventory != null) {
      return watchInventory(warehouseId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AddProduct value) addProduct,
    required TResult Function(_UpdateProduct value) updateProduct,
    required TResult Function(_DeleteProduct value) deleteProduct,
    required TResult Function(_UpdateStock value) updateStock,
    required TResult Function(_WatchInventory value) watchInventory,
    required TResult Function(_InventoryUpdated value) inventoryUpdated,
    required TResult Function(_StockTransferRequested value)
        stockTransferRequested,
    required TResult Function(_ReceiveGoods value) receiveGoods,
    required TResult Function(_FetchIncomingTransfers value)
        fetchIncomingTransfers,
    required TResult Function(_ReceiveStockTransfer value) receiveStockTransfer,
  }) {
    return watchInventory(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AddProduct value)? addProduct,
    TResult? Function(_UpdateProduct value)? updateProduct,
    TResult? Function(_DeleteProduct value)? deleteProduct,
    TResult? Function(_UpdateStock value)? updateStock,
    TResult? Function(_WatchInventory value)? watchInventory,
    TResult? Function(_InventoryUpdated value)? inventoryUpdated,
    TResult? Function(_StockTransferRequested value)? stockTransferRequested,
    TResult? Function(_ReceiveGoods value)? receiveGoods,
    TResult? Function(_FetchIncomingTransfers value)? fetchIncomingTransfers,
    TResult? Function(_ReceiveStockTransfer value)? receiveStockTransfer,
  }) {
    return watchInventory?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AddProduct value)? addProduct,
    TResult Function(_UpdateProduct value)? updateProduct,
    TResult Function(_DeleteProduct value)? deleteProduct,
    TResult Function(_UpdateStock value)? updateStock,
    TResult Function(_WatchInventory value)? watchInventory,
    TResult Function(_InventoryUpdated value)? inventoryUpdated,
    TResult Function(_StockTransferRequested value)? stockTransferRequested,
    TResult Function(_ReceiveGoods value)? receiveGoods,
    TResult Function(_FetchIncomingTransfers value)? fetchIncomingTransfers,
    TResult Function(_ReceiveStockTransfer value)? receiveStockTransfer,
    required TResult orElse(),
  }) {
    if (watchInventory != null) {
      return watchInventory(this);
    }
    return orElse();
  }
}

abstract class _WatchInventory implements InventoryManagementEvent {
  const factory _WatchInventory(final String warehouseId) =
      _$WatchInventoryImpl;

  String get warehouseId;

  /// Create a copy of InventoryManagementEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WatchInventoryImplCopyWith<_$WatchInventoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$InventoryUpdatedImplCopyWith<$Res> {
  factory _$$InventoryUpdatedImplCopyWith(_$InventoryUpdatedImpl value,
          $Res Function(_$InventoryUpdatedImpl) then) =
      __$$InventoryUpdatedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<ProductStock> inventory});
}

/// @nodoc
class __$$InventoryUpdatedImplCopyWithImpl<$Res>
    extends _$InventoryManagementEventCopyWithImpl<$Res, _$InventoryUpdatedImpl>
    implements _$$InventoryUpdatedImplCopyWith<$Res> {
  __$$InventoryUpdatedImplCopyWithImpl(_$InventoryUpdatedImpl _value,
      $Res Function(_$InventoryUpdatedImpl) _then)
      : super(_value, _then);

  /// Create a copy of InventoryManagementEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? inventory = null,
  }) {
    return _then(_$InventoryUpdatedImpl(
      null == inventory
          ? _value._inventory
          : inventory // ignore: cast_nullable_to_non_nullable
              as List<ProductStock>,
    ));
  }
}

/// @nodoc

class _$InventoryUpdatedImpl implements _InventoryUpdated {
  const _$InventoryUpdatedImpl(final List<ProductStock> inventory)
      : _inventory = inventory;

  final List<ProductStock> _inventory;
  @override
  List<ProductStock> get inventory {
    if (_inventory is EqualUnmodifiableListView) return _inventory;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_inventory);
  }

  @override
  String toString() {
    return 'InventoryManagementEvent.inventoryUpdated(inventory: $inventory)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InventoryUpdatedImpl &&
            const DeepCollectionEquality()
                .equals(other._inventory, _inventory));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_inventory));

  /// Create a copy of InventoryManagementEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InventoryUpdatedImplCopyWith<_$InventoryUpdatedImpl> get copyWith =>
      __$$InventoryUpdatedImplCopyWithImpl<_$InventoryUpdatedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            Product product, File? imageFile, List<String>? modifierGroupUuids)
        addProduct,
    required TResult Function(
            Product product, File? imageFile, List<String>? modifierGroupUuids)
        updateProduct,
    required TResult Function(String uuid) deleteProduct,
    required TResult Function(String uuid, int delta) updateStock,
    required TResult Function(String warehouseId) watchInventory,
    required TResult Function(List<ProductStock> inventory) inventoryUpdated,
    required TResult Function(
            String sourceWarehouseId,
            String targetWarehouseId,
            List<StockTransferItem> items,
            String referenceNote)
        stockTransferRequested,
    required TResult Function(String purchaseOrderUuid, String warehouseUuid,
            List<Map<String, dynamic>> items)
        receiveGoods,
    required TResult Function() fetchIncomingTransfers,
    required TResult Function(String transferUuid) receiveStockTransfer,
  }) {
    return inventoryUpdated(inventory);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            Product product, File? imageFile, List<String>? modifierGroupUuids)?
        addProduct,
    TResult? Function(
            Product product, File? imageFile, List<String>? modifierGroupUuids)?
        updateProduct,
    TResult? Function(String uuid)? deleteProduct,
    TResult? Function(String uuid, int delta)? updateStock,
    TResult? Function(String warehouseId)? watchInventory,
    TResult? Function(List<ProductStock> inventory)? inventoryUpdated,
    TResult? Function(String sourceWarehouseId, String targetWarehouseId,
            List<StockTransferItem> items, String referenceNote)?
        stockTransferRequested,
    TResult? Function(String purchaseOrderUuid, String warehouseUuid,
            List<Map<String, dynamic>> items)?
        receiveGoods,
    TResult? Function()? fetchIncomingTransfers,
    TResult? Function(String transferUuid)? receiveStockTransfer,
  }) {
    return inventoryUpdated?.call(inventory);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            Product product, File? imageFile, List<String>? modifierGroupUuids)?
        addProduct,
    TResult Function(
            Product product, File? imageFile, List<String>? modifierGroupUuids)?
        updateProduct,
    TResult Function(String uuid)? deleteProduct,
    TResult Function(String uuid, int delta)? updateStock,
    TResult Function(String warehouseId)? watchInventory,
    TResult Function(List<ProductStock> inventory)? inventoryUpdated,
    TResult Function(String sourceWarehouseId, String targetWarehouseId,
            List<StockTransferItem> items, String referenceNote)?
        stockTransferRequested,
    TResult Function(String purchaseOrderUuid, String warehouseUuid,
            List<Map<String, dynamic>> items)?
        receiveGoods,
    TResult Function()? fetchIncomingTransfers,
    TResult Function(String transferUuid)? receiveStockTransfer,
    required TResult orElse(),
  }) {
    if (inventoryUpdated != null) {
      return inventoryUpdated(inventory);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AddProduct value) addProduct,
    required TResult Function(_UpdateProduct value) updateProduct,
    required TResult Function(_DeleteProduct value) deleteProduct,
    required TResult Function(_UpdateStock value) updateStock,
    required TResult Function(_WatchInventory value) watchInventory,
    required TResult Function(_InventoryUpdated value) inventoryUpdated,
    required TResult Function(_StockTransferRequested value)
        stockTransferRequested,
    required TResult Function(_ReceiveGoods value) receiveGoods,
    required TResult Function(_FetchIncomingTransfers value)
        fetchIncomingTransfers,
    required TResult Function(_ReceiveStockTransfer value) receiveStockTransfer,
  }) {
    return inventoryUpdated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AddProduct value)? addProduct,
    TResult? Function(_UpdateProduct value)? updateProduct,
    TResult? Function(_DeleteProduct value)? deleteProduct,
    TResult? Function(_UpdateStock value)? updateStock,
    TResult? Function(_WatchInventory value)? watchInventory,
    TResult? Function(_InventoryUpdated value)? inventoryUpdated,
    TResult? Function(_StockTransferRequested value)? stockTransferRequested,
    TResult? Function(_ReceiveGoods value)? receiveGoods,
    TResult? Function(_FetchIncomingTransfers value)? fetchIncomingTransfers,
    TResult? Function(_ReceiveStockTransfer value)? receiveStockTransfer,
  }) {
    return inventoryUpdated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AddProduct value)? addProduct,
    TResult Function(_UpdateProduct value)? updateProduct,
    TResult Function(_DeleteProduct value)? deleteProduct,
    TResult Function(_UpdateStock value)? updateStock,
    TResult Function(_WatchInventory value)? watchInventory,
    TResult Function(_InventoryUpdated value)? inventoryUpdated,
    TResult Function(_StockTransferRequested value)? stockTransferRequested,
    TResult Function(_ReceiveGoods value)? receiveGoods,
    TResult Function(_FetchIncomingTransfers value)? fetchIncomingTransfers,
    TResult Function(_ReceiveStockTransfer value)? receiveStockTransfer,
    required TResult orElse(),
  }) {
    if (inventoryUpdated != null) {
      return inventoryUpdated(this);
    }
    return orElse();
  }
}

abstract class _InventoryUpdated implements InventoryManagementEvent {
  const factory _InventoryUpdated(final List<ProductStock> inventory) =
      _$InventoryUpdatedImpl;

  List<ProductStock> get inventory;

  /// Create a copy of InventoryManagementEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InventoryUpdatedImplCopyWith<_$InventoryUpdatedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$StockTransferRequestedImplCopyWith<$Res> {
  factory _$$StockTransferRequestedImplCopyWith(
          _$StockTransferRequestedImpl value,
          $Res Function(_$StockTransferRequestedImpl) then) =
      __$$StockTransferRequestedImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {String sourceWarehouseId,
      String targetWarehouseId,
      List<StockTransferItem> items,
      String referenceNote});
}

/// @nodoc
class __$$StockTransferRequestedImplCopyWithImpl<$Res>
    extends _$InventoryManagementEventCopyWithImpl<$Res,
        _$StockTransferRequestedImpl>
    implements _$$StockTransferRequestedImplCopyWith<$Res> {
  __$$StockTransferRequestedImplCopyWithImpl(
      _$StockTransferRequestedImpl _value,
      $Res Function(_$StockTransferRequestedImpl) _then)
      : super(_value, _then);

  /// Create a copy of InventoryManagementEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sourceWarehouseId = null,
    Object? targetWarehouseId = null,
    Object? items = null,
    Object? referenceNote = null,
  }) {
    return _then(_$StockTransferRequestedImpl(
      sourceWarehouseId: null == sourceWarehouseId
          ? _value.sourceWarehouseId
          : sourceWarehouseId // ignore: cast_nullable_to_non_nullable
              as String,
      targetWarehouseId: null == targetWarehouseId
          ? _value.targetWarehouseId
          : targetWarehouseId // ignore: cast_nullable_to_non_nullable
              as String,
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<StockTransferItem>,
      referenceNote: null == referenceNote
          ? _value.referenceNote
          : referenceNote // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$StockTransferRequestedImpl implements _StockTransferRequested {
  const _$StockTransferRequestedImpl(
      {required this.sourceWarehouseId,
      required this.targetWarehouseId,
      required final List<StockTransferItem> items,
      required this.referenceNote})
      : _items = items;

  @override
  final String sourceWarehouseId;
  @override
  final String targetWarehouseId;
  final List<StockTransferItem> _items;
  @override
  List<StockTransferItem> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  final String referenceNote;

  @override
  String toString() {
    return 'InventoryManagementEvent.stockTransferRequested(sourceWarehouseId: $sourceWarehouseId, targetWarehouseId: $targetWarehouseId, items: $items, referenceNote: $referenceNote)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StockTransferRequestedImpl &&
            (identical(other.sourceWarehouseId, sourceWarehouseId) ||
                other.sourceWarehouseId == sourceWarehouseId) &&
            (identical(other.targetWarehouseId, targetWarehouseId) ||
                other.targetWarehouseId == targetWarehouseId) &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.referenceNote, referenceNote) ||
                other.referenceNote == referenceNote));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      sourceWarehouseId,
      targetWarehouseId,
      const DeepCollectionEquality().hash(_items),
      referenceNote);

  /// Create a copy of InventoryManagementEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StockTransferRequestedImplCopyWith<_$StockTransferRequestedImpl>
      get copyWith => __$$StockTransferRequestedImplCopyWithImpl<
          _$StockTransferRequestedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            Product product, File? imageFile, List<String>? modifierGroupUuids)
        addProduct,
    required TResult Function(
            Product product, File? imageFile, List<String>? modifierGroupUuids)
        updateProduct,
    required TResult Function(String uuid) deleteProduct,
    required TResult Function(String uuid, int delta) updateStock,
    required TResult Function(String warehouseId) watchInventory,
    required TResult Function(List<ProductStock> inventory) inventoryUpdated,
    required TResult Function(
            String sourceWarehouseId,
            String targetWarehouseId,
            List<StockTransferItem> items,
            String referenceNote)
        stockTransferRequested,
    required TResult Function(String purchaseOrderUuid, String warehouseUuid,
            List<Map<String, dynamic>> items)
        receiveGoods,
    required TResult Function() fetchIncomingTransfers,
    required TResult Function(String transferUuid) receiveStockTransfer,
  }) {
    return stockTransferRequested(
        sourceWarehouseId, targetWarehouseId, items, referenceNote);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            Product product, File? imageFile, List<String>? modifierGroupUuids)?
        addProduct,
    TResult? Function(
            Product product, File? imageFile, List<String>? modifierGroupUuids)?
        updateProduct,
    TResult? Function(String uuid)? deleteProduct,
    TResult? Function(String uuid, int delta)? updateStock,
    TResult? Function(String warehouseId)? watchInventory,
    TResult? Function(List<ProductStock> inventory)? inventoryUpdated,
    TResult? Function(String sourceWarehouseId, String targetWarehouseId,
            List<StockTransferItem> items, String referenceNote)?
        stockTransferRequested,
    TResult? Function(String purchaseOrderUuid, String warehouseUuid,
            List<Map<String, dynamic>> items)?
        receiveGoods,
    TResult? Function()? fetchIncomingTransfers,
    TResult? Function(String transferUuid)? receiveStockTransfer,
  }) {
    return stockTransferRequested?.call(
        sourceWarehouseId, targetWarehouseId, items, referenceNote);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            Product product, File? imageFile, List<String>? modifierGroupUuids)?
        addProduct,
    TResult Function(
            Product product, File? imageFile, List<String>? modifierGroupUuids)?
        updateProduct,
    TResult Function(String uuid)? deleteProduct,
    TResult Function(String uuid, int delta)? updateStock,
    TResult Function(String warehouseId)? watchInventory,
    TResult Function(List<ProductStock> inventory)? inventoryUpdated,
    TResult Function(String sourceWarehouseId, String targetWarehouseId,
            List<StockTransferItem> items, String referenceNote)?
        stockTransferRequested,
    TResult Function(String purchaseOrderUuid, String warehouseUuid,
            List<Map<String, dynamic>> items)?
        receiveGoods,
    TResult Function()? fetchIncomingTransfers,
    TResult Function(String transferUuid)? receiveStockTransfer,
    required TResult orElse(),
  }) {
    if (stockTransferRequested != null) {
      return stockTransferRequested(
          sourceWarehouseId, targetWarehouseId, items, referenceNote);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AddProduct value) addProduct,
    required TResult Function(_UpdateProduct value) updateProduct,
    required TResult Function(_DeleteProduct value) deleteProduct,
    required TResult Function(_UpdateStock value) updateStock,
    required TResult Function(_WatchInventory value) watchInventory,
    required TResult Function(_InventoryUpdated value) inventoryUpdated,
    required TResult Function(_StockTransferRequested value)
        stockTransferRequested,
    required TResult Function(_ReceiveGoods value) receiveGoods,
    required TResult Function(_FetchIncomingTransfers value)
        fetchIncomingTransfers,
    required TResult Function(_ReceiveStockTransfer value) receiveStockTransfer,
  }) {
    return stockTransferRequested(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AddProduct value)? addProduct,
    TResult? Function(_UpdateProduct value)? updateProduct,
    TResult? Function(_DeleteProduct value)? deleteProduct,
    TResult? Function(_UpdateStock value)? updateStock,
    TResult? Function(_WatchInventory value)? watchInventory,
    TResult? Function(_InventoryUpdated value)? inventoryUpdated,
    TResult? Function(_StockTransferRequested value)? stockTransferRequested,
    TResult? Function(_ReceiveGoods value)? receiveGoods,
    TResult? Function(_FetchIncomingTransfers value)? fetchIncomingTransfers,
    TResult? Function(_ReceiveStockTransfer value)? receiveStockTransfer,
  }) {
    return stockTransferRequested?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AddProduct value)? addProduct,
    TResult Function(_UpdateProduct value)? updateProduct,
    TResult Function(_DeleteProduct value)? deleteProduct,
    TResult Function(_UpdateStock value)? updateStock,
    TResult Function(_WatchInventory value)? watchInventory,
    TResult Function(_InventoryUpdated value)? inventoryUpdated,
    TResult Function(_StockTransferRequested value)? stockTransferRequested,
    TResult Function(_ReceiveGoods value)? receiveGoods,
    TResult Function(_FetchIncomingTransfers value)? fetchIncomingTransfers,
    TResult Function(_ReceiveStockTransfer value)? receiveStockTransfer,
    required TResult orElse(),
  }) {
    if (stockTransferRequested != null) {
      return stockTransferRequested(this);
    }
    return orElse();
  }
}

abstract class _StockTransferRequested implements InventoryManagementEvent {
  const factory _StockTransferRequested(
      {required final String sourceWarehouseId,
      required final String targetWarehouseId,
      required final List<StockTransferItem> items,
      required final String referenceNote}) = _$StockTransferRequestedImpl;

  String get sourceWarehouseId;
  String get targetWarehouseId;
  List<StockTransferItem> get items;
  String get referenceNote;

  /// Create a copy of InventoryManagementEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StockTransferRequestedImplCopyWith<_$StockTransferRequestedImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ReceiveGoodsImplCopyWith<$Res> {
  factory _$$ReceiveGoodsImplCopyWith(
          _$ReceiveGoodsImpl value, $Res Function(_$ReceiveGoodsImpl) then) =
      __$$ReceiveGoodsImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {String purchaseOrderUuid,
      String warehouseUuid,
      List<Map<String, dynamic>> items});
}

/// @nodoc
class __$$ReceiveGoodsImplCopyWithImpl<$Res>
    extends _$InventoryManagementEventCopyWithImpl<$Res, _$ReceiveGoodsImpl>
    implements _$$ReceiveGoodsImplCopyWith<$Res> {
  __$$ReceiveGoodsImplCopyWithImpl(
      _$ReceiveGoodsImpl _value, $Res Function(_$ReceiveGoodsImpl) _then)
      : super(_value, _then);

  /// Create a copy of InventoryManagementEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? purchaseOrderUuid = null,
    Object? warehouseUuid = null,
    Object? items = null,
  }) {
    return _then(_$ReceiveGoodsImpl(
      purchaseOrderUuid: null == purchaseOrderUuid
          ? _value.purchaseOrderUuid
          : purchaseOrderUuid // ignore: cast_nullable_to_non_nullable
              as String,
      warehouseUuid: null == warehouseUuid
          ? _value.warehouseUuid
          : warehouseUuid // ignore: cast_nullable_to_non_nullable
              as String,
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
    ));
  }
}

/// @nodoc

class _$ReceiveGoodsImpl implements _ReceiveGoods {
  const _$ReceiveGoodsImpl(
      {required this.purchaseOrderUuid,
      required this.warehouseUuid,
      required final List<Map<String, dynamic>> items})
      : _items = items;

  @override
  final String purchaseOrderUuid;
  @override
  final String warehouseUuid;
  final List<Map<String, dynamic>> _items;
  @override
  List<Map<String, dynamic>> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  String toString() {
    return 'InventoryManagementEvent.receiveGoods(purchaseOrderUuid: $purchaseOrderUuid, warehouseUuid: $warehouseUuid, items: $items)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReceiveGoodsImpl &&
            (identical(other.purchaseOrderUuid, purchaseOrderUuid) ||
                other.purchaseOrderUuid == purchaseOrderUuid) &&
            (identical(other.warehouseUuid, warehouseUuid) ||
                other.warehouseUuid == warehouseUuid) &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @override
  int get hashCode => Object.hash(runtimeType, purchaseOrderUuid, warehouseUuid,
      const DeepCollectionEquality().hash(_items));

  /// Create a copy of InventoryManagementEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReceiveGoodsImplCopyWith<_$ReceiveGoodsImpl> get copyWith =>
      __$$ReceiveGoodsImplCopyWithImpl<_$ReceiveGoodsImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            Product product, File? imageFile, List<String>? modifierGroupUuids)
        addProduct,
    required TResult Function(
            Product product, File? imageFile, List<String>? modifierGroupUuids)
        updateProduct,
    required TResult Function(String uuid) deleteProduct,
    required TResult Function(String uuid, int delta) updateStock,
    required TResult Function(String warehouseId) watchInventory,
    required TResult Function(List<ProductStock> inventory) inventoryUpdated,
    required TResult Function(
            String sourceWarehouseId,
            String targetWarehouseId,
            List<StockTransferItem> items,
            String referenceNote)
        stockTransferRequested,
    required TResult Function(String purchaseOrderUuid, String warehouseUuid,
            List<Map<String, dynamic>> items)
        receiveGoods,
    required TResult Function() fetchIncomingTransfers,
    required TResult Function(String transferUuid) receiveStockTransfer,
  }) {
    return receiveGoods(purchaseOrderUuid, warehouseUuid, items);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            Product product, File? imageFile, List<String>? modifierGroupUuids)?
        addProduct,
    TResult? Function(
            Product product, File? imageFile, List<String>? modifierGroupUuids)?
        updateProduct,
    TResult? Function(String uuid)? deleteProduct,
    TResult? Function(String uuid, int delta)? updateStock,
    TResult? Function(String warehouseId)? watchInventory,
    TResult? Function(List<ProductStock> inventory)? inventoryUpdated,
    TResult? Function(String sourceWarehouseId, String targetWarehouseId,
            List<StockTransferItem> items, String referenceNote)?
        stockTransferRequested,
    TResult? Function(String purchaseOrderUuid, String warehouseUuid,
            List<Map<String, dynamic>> items)?
        receiveGoods,
    TResult? Function()? fetchIncomingTransfers,
    TResult? Function(String transferUuid)? receiveStockTransfer,
  }) {
    return receiveGoods?.call(purchaseOrderUuid, warehouseUuid, items);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            Product product, File? imageFile, List<String>? modifierGroupUuids)?
        addProduct,
    TResult Function(
            Product product, File? imageFile, List<String>? modifierGroupUuids)?
        updateProduct,
    TResult Function(String uuid)? deleteProduct,
    TResult Function(String uuid, int delta)? updateStock,
    TResult Function(String warehouseId)? watchInventory,
    TResult Function(List<ProductStock> inventory)? inventoryUpdated,
    TResult Function(String sourceWarehouseId, String targetWarehouseId,
            List<StockTransferItem> items, String referenceNote)?
        stockTransferRequested,
    TResult Function(String purchaseOrderUuid, String warehouseUuid,
            List<Map<String, dynamic>> items)?
        receiveGoods,
    TResult Function()? fetchIncomingTransfers,
    TResult Function(String transferUuid)? receiveStockTransfer,
    required TResult orElse(),
  }) {
    if (receiveGoods != null) {
      return receiveGoods(purchaseOrderUuid, warehouseUuid, items);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AddProduct value) addProduct,
    required TResult Function(_UpdateProduct value) updateProduct,
    required TResult Function(_DeleteProduct value) deleteProduct,
    required TResult Function(_UpdateStock value) updateStock,
    required TResult Function(_WatchInventory value) watchInventory,
    required TResult Function(_InventoryUpdated value) inventoryUpdated,
    required TResult Function(_StockTransferRequested value)
        stockTransferRequested,
    required TResult Function(_ReceiveGoods value) receiveGoods,
    required TResult Function(_FetchIncomingTransfers value)
        fetchIncomingTransfers,
    required TResult Function(_ReceiveStockTransfer value) receiveStockTransfer,
  }) {
    return receiveGoods(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AddProduct value)? addProduct,
    TResult? Function(_UpdateProduct value)? updateProduct,
    TResult? Function(_DeleteProduct value)? deleteProduct,
    TResult? Function(_UpdateStock value)? updateStock,
    TResult? Function(_WatchInventory value)? watchInventory,
    TResult? Function(_InventoryUpdated value)? inventoryUpdated,
    TResult? Function(_StockTransferRequested value)? stockTransferRequested,
    TResult? Function(_ReceiveGoods value)? receiveGoods,
    TResult? Function(_FetchIncomingTransfers value)? fetchIncomingTransfers,
    TResult? Function(_ReceiveStockTransfer value)? receiveStockTransfer,
  }) {
    return receiveGoods?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AddProduct value)? addProduct,
    TResult Function(_UpdateProduct value)? updateProduct,
    TResult Function(_DeleteProduct value)? deleteProduct,
    TResult Function(_UpdateStock value)? updateStock,
    TResult Function(_WatchInventory value)? watchInventory,
    TResult Function(_InventoryUpdated value)? inventoryUpdated,
    TResult Function(_StockTransferRequested value)? stockTransferRequested,
    TResult Function(_ReceiveGoods value)? receiveGoods,
    TResult Function(_FetchIncomingTransfers value)? fetchIncomingTransfers,
    TResult Function(_ReceiveStockTransfer value)? receiveStockTransfer,
    required TResult orElse(),
  }) {
    if (receiveGoods != null) {
      return receiveGoods(this);
    }
    return orElse();
  }
}

abstract class _ReceiveGoods implements InventoryManagementEvent {
  const factory _ReceiveGoods(
      {required final String purchaseOrderUuid,
      required final String warehouseUuid,
      required final List<Map<String, dynamic>> items}) = _$ReceiveGoodsImpl;

  String get purchaseOrderUuid;
  String get warehouseUuid;
  List<Map<String, dynamic>> get items;

  /// Create a copy of InventoryManagementEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReceiveGoodsImplCopyWith<_$ReceiveGoodsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FetchIncomingTransfersImplCopyWith<$Res> {
  factory _$$FetchIncomingTransfersImplCopyWith(
          _$FetchIncomingTransfersImpl value,
          $Res Function(_$FetchIncomingTransfersImpl) then) =
      __$$FetchIncomingTransfersImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FetchIncomingTransfersImplCopyWithImpl<$Res>
    extends _$InventoryManagementEventCopyWithImpl<$Res,
        _$FetchIncomingTransfersImpl>
    implements _$$FetchIncomingTransfersImplCopyWith<$Res> {
  __$$FetchIncomingTransfersImplCopyWithImpl(
      _$FetchIncomingTransfersImpl _value,
      $Res Function(_$FetchIncomingTransfersImpl) _then)
      : super(_value, _then);

  /// Create a copy of InventoryManagementEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$FetchIncomingTransfersImpl implements _FetchIncomingTransfers {
  const _$FetchIncomingTransfersImpl();

  @override
  String toString() {
    return 'InventoryManagementEvent.fetchIncomingTransfers()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchIncomingTransfersImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            Product product, File? imageFile, List<String>? modifierGroupUuids)
        addProduct,
    required TResult Function(
            Product product, File? imageFile, List<String>? modifierGroupUuids)
        updateProduct,
    required TResult Function(String uuid) deleteProduct,
    required TResult Function(String uuid, int delta) updateStock,
    required TResult Function(String warehouseId) watchInventory,
    required TResult Function(List<ProductStock> inventory) inventoryUpdated,
    required TResult Function(
            String sourceWarehouseId,
            String targetWarehouseId,
            List<StockTransferItem> items,
            String referenceNote)
        stockTransferRequested,
    required TResult Function(String purchaseOrderUuid, String warehouseUuid,
            List<Map<String, dynamic>> items)
        receiveGoods,
    required TResult Function() fetchIncomingTransfers,
    required TResult Function(String transferUuid) receiveStockTransfer,
  }) {
    return fetchIncomingTransfers();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            Product product, File? imageFile, List<String>? modifierGroupUuids)?
        addProduct,
    TResult? Function(
            Product product, File? imageFile, List<String>? modifierGroupUuids)?
        updateProduct,
    TResult? Function(String uuid)? deleteProduct,
    TResult? Function(String uuid, int delta)? updateStock,
    TResult? Function(String warehouseId)? watchInventory,
    TResult? Function(List<ProductStock> inventory)? inventoryUpdated,
    TResult? Function(String sourceWarehouseId, String targetWarehouseId,
            List<StockTransferItem> items, String referenceNote)?
        stockTransferRequested,
    TResult? Function(String purchaseOrderUuid, String warehouseUuid,
            List<Map<String, dynamic>> items)?
        receiveGoods,
    TResult? Function()? fetchIncomingTransfers,
    TResult? Function(String transferUuid)? receiveStockTransfer,
  }) {
    return fetchIncomingTransfers?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            Product product, File? imageFile, List<String>? modifierGroupUuids)?
        addProduct,
    TResult Function(
            Product product, File? imageFile, List<String>? modifierGroupUuids)?
        updateProduct,
    TResult Function(String uuid)? deleteProduct,
    TResult Function(String uuid, int delta)? updateStock,
    TResult Function(String warehouseId)? watchInventory,
    TResult Function(List<ProductStock> inventory)? inventoryUpdated,
    TResult Function(String sourceWarehouseId, String targetWarehouseId,
            List<StockTransferItem> items, String referenceNote)?
        stockTransferRequested,
    TResult Function(String purchaseOrderUuid, String warehouseUuid,
            List<Map<String, dynamic>> items)?
        receiveGoods,
    TResult Function()? fetchIncomingTransfers,
    TResult Function(String transferUuid)? receiveStockTransfer,
    required TResult orElse(),
  }) {
    if (fetchIncomingTransfers != null) {
      return fetchIncomingTransfers();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AddProduct value) addProduct,
    required TResult Function(_UpdateProduct value) updateProduct,
    required TResult Function(_DeleteProduct value) deleteProduct,
    required TResult Function(_UpdateStock value) updateStock,
    required TResult Function(_WatchInventory value) watchInventory,
    required TResult Function(_InventoryUpdated value) inventoryUpdated,
    required TResult Function(_StockTransferRequested value)
        stockTransferRequested,
    required TResult Function(_ReceiveGoods value) receiveGoods,
    required TResult Function(_FetchIncomingTransfers value)
        fetchIncomingTransfers,
    required TResult Function(_ReceiveStockTransfer value) receiveStockTransfer,
  }) {
    return fetchIncomingTransfers(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AddProduct value)? addProduct,
    TResult? Function(_UpdateProduct value)? updateProduct,
    TResult? Function(_DeleteProduct value)? deleteProduct,
    TResult? Function(_UpdateStock value)? updateStock,
    TResult? Function(_WatchInventory value)? watchInventory,
    TResult? Function(_InventoryUpdated value)? inventoryUpdated,
    TResult? Function(_StockTransferRequested value)? stockTransferRequested,
    TResult? Function(_ReceiveGoods value)? receiveGoods,
    TResult? Function(_FetchIncomingTransfers value)? fetchIncomingTransfers,
    TResult? Function(_ReceiveStockTransfer value)? receiveStockTransfer,
  }) {
    return fetchIncomingTransfers?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AddProduct value)? addProduct,
    TResult Function(_UpdateProduct value)? updateProduct,
    TResult Function(_DeleteProduct value)? deleteProduct,
    TResult Function(_UpdateStock value)? updateStock,
    TResult Function(_WatchInventory value)? watchInventory,
    TResult Function(_InventoryUpdated value)? inventoryUpdated,
    TResult Function(_StockTransferRequested value)? stockTransferRequested,
    TResult Function(_ReceiveGoods value)? receiveGoods,
    TResult Function(_FetchIncomingTransfers value)? fetchIncomingTransfers,
    TResult Function(_ReceiveStockTransfer value)? receiveStockTransfer,
    required TResult orElse(),
  }) {
    if (fetchIncomingTransfers != null) {
      return fetchIncomingTransfers(this);
    }
    return orElse();
  }
}

abstract class _FetchIncomingTransfers implements InventoryManagementEvent {
  const factory _FetchIncomingTransfers() = _$FetchIncomingTransfersImpl;
}

/// @nodoc
abstract class _$$ReceiveStockTransferImplCopyWith<$Res> {
  factory _$$ReceiveStockTransferImplCopyWith(_$ReceiveStockTransferImpl value,
          $Res Function(_$ReceiveStockTransferImpl) then) =
      __$$ReceiveStockTransferImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String transferUuid});
}

/// @nodoc
class __$$ReceiveStockTransferImplCopyWithImpl<$Res>
    extends _$InventoryManagementEventCopyWithImpl<$Res,
        _$ReceiveStockTransferImpl>
    implements _$$ReceiveStockTransferImplCopyWith<$Res> {
  __$$ReceiveStockTransferImplCopyWithImpl(_$ReceiveStockTransferImpl _value,
      $Res Function(_$ReceiveStockTransferImpl) _then)
      : super(_value, _then);

  /// Create a copy of InventoryManagementEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transferUuid = null,
  }) {
    return _then(_$ReceiveStockTransferImpl(
      null == transferUuid
          ? _value.transferUuid
          : transferUuid // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ReceiveStockTransferImpl implements _ReceiveStockTransfer {
  const _$ReceiveStockTransferImpl(this.transferUuid);

  @override
  final String transferUuid;

  @override
  String toString() {
    return 'InventoryManagementEvent.receiveStockTransfer(transferUuid: $transferUuid)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReceiveStockTransferImpl &&
            (identical(other.transferUuid, transferUuid) ||
                other.transferUuid == transferUuid));
  }

  @override
  int get hashCode => Object.hash(runtimeType, transferUuid);

  /// Create a copy of InventoryManagementEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReceiveStockTransferImplCopyWith<_$ReceiveStockTransferImpl>
      get copyWith =>
          __$$ReceiveStockTransferImplCopyWithImpl<_$ReceiveStockTransferImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            Product product, File? imageFile, List<String>? modifierGroupUuids)
        addProduct,
    required TResult Function(
            Product product, File? imageFile, List<String>? modifierGroupUuids)
        updateProduct,
    required TResult Function(String uuid) deleteProduct,
    required TResult Function(String uuid, int delta) updateStock,
    required TResult Function(String warehouseId) watchInventory,
    required TResult Function(List<ProductStock> inventory) inventoryUpdated,
    required TResult Function(
            String sourceWarehouseId,
            String targetWarehouseId,
            List<StockTransferItem> items,
            String referenceNote)
        stockTransferRequested,
    required TResult Function(String purchaseOrderUuid, String warehouseUuid,
            List<Map<String, dynamic>> items)
        receiveGoods,
    required TResult Function() fetchIncomingTransfers,
    required TResult Function(String transferUuid) receiveStockTransfer,
  }) {
    return receiveStockTransfer(transferUuid);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            Product product, File? imageFile, List<String>? modifierGroupUuids)?
        addProduct,
    TResult? Function(
            Product product, File? imageFile, List<String>? modifierGroupUuids)?
        updateProduct,
    TResult? Function(String uuid)? deleteProduct,
    TResult? Function(String uuid, int delta)? updateStock,
    TResult? Function(String warehouseId)? watchInventory,
    TResult? Function(List<ProductStock> inventory)? inventoryUpdated,
    TResult? Function(String sourceWarehouseId, String targetWarehouseId,
            List<StockTransferItem> items, String referenceNote)?
        stockTransferRequested,
    TResult? Function(String purchaseOrderUuid, String warehouseUuid,
            List<Map<String, dynamic>> items)?
        receiveGoods,
    TResult? Function()? fetchIncomingTransfers,
    TResult? Function(String transferUuid)? receiveStockTransfer,
  }) {
    return receiveStockTransfer?.call(transferUuid);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            Product product, File? imageFile, List<String>? modifierGroupUuids)?
        addProduct,
    TResult Function(
            Product product, File? imageFile, List<String>? modifierGroupUuids)?
        updateProduct,
    TResult Function(String uuid)? deleteProduct,
    TResult Function(String uuid, int delta)? updateStock,
    TResult Function(String warehouseId)? watchInventory,
    TResult Function(List<ProductStock> inventory)? inventoryUpdated,
    TResult Function(String sourceWarehouseId, String targetWarehouseId,
            List<StockTransferItem> items, String referenceNote)?
        stockTransferRequested,
    TResult Function(String purchaseOrderUuid, String warehouseUuid,
            List<Map<String, dynamic>> items)?
        receiveGoods,
    TResult Function()? fetchIncomingTransfers,
    TResult Function(String transferUuid)? receiveStockTransfer,
    required TResult orElse(),
  }) {
    if (receiveStockTransfer != null) {
      return receiveStockTransfer(transferUuid);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AddProduct value) addProduct,
    required TResult Function(_UpdateProduct value) updateProduct,
    required TResult Function(_DeleteProduct value) deleteProduct,
    required TResult Function(_UpdateStock value) updateStock,
    required TResult Function(_WatchInventory value) watchInventory,
    required TResult Function(_InventoryUpdated value) inventoryUpdated,
    required TResult Function(_StockTransferRequested value)
        stockTransferRequested,
    required TResult Function(_ReceiveGoods value) receiveGoods,
    required TResult Function(_FetchIncomingTransfers value)
        fetchIncomingTransfers,
    required TResult Function(_ReceiveStockTransfer value) receiveStockTransfer,
  }) {
    return receiveStockTransfer(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AddProduct value)? addProduct,
    TResult? Function(_UpdateProduct value)? updateProduct,
    TResult? Function(_DeleteProduct value)? deleteProduct,
    TResult? Function(_UpdateStock value)? updateStock,
    TResult? Function(_WatchInventory value)? watchInventory,
    TResult? Function(_InventoryUpdated value)? inventoryUpdated,
    TResult? Function(_StockTransferRequested value)? stockTransferRequested,
    TResult? Function(_ReceiveGoods value)? receiveGoods,
    TResult? Function(_FetchIncomingTransfers value)? fetchIncomingTransfers,
    TResult? Function(_ReceiveStockTransfer value)? receiveStockTransfer,
  }) {
    return receiveStockTransfer?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AddProduct value)? addProduct,
    TResult Function(_UpdateProduct value)? updateProduct,
    TResult Function(_DeleteProduct value)? deleteProduct,
    TResult Function(_UpdateStock value)? updateStock,
    TResult Function(_WatchInventory value)? watchInventory,
    TResult Function(_InventoryUpdated value)? inventoryUpdated,
    TResult Function(_StockTransferRequested value)? stockTransferRequested,
    TResult Function(_ReceiveGoods value)? receiveGoods,
    TResult Function(_FetchIncomingTransfers value)? fetchIncomingTransfers,
    TResult Function(_ReceiveStockTransfer value)? receiveStockTransfer,
    required TResult orElse(),
  }) {
    if (receiveStockTransfer != null) {
      return receiveStockTransfer(this);
    }
    return orElse();
  }
}

abstract class _ReceiveStockTransfer implements InventoryManagementEvent {
  const factory _ReceiveStockTransfer(final String transferUuid) =
      _$ReceiveStockTransferImpl;

  String get transferUuid;

  /// Create a copy of InventoryManagementEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReceiveStockTransferImplCopyWith<_$ReceiveStockTransferImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$InventoryManagementState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(List<ProductStock> inventory) loaded,
    required TResult Function(List<StockTransfer> transfers)
        incomingTransfersLoaded,
    required TResult Function(String message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(List<ProductStock> inventory)? loaded,
    TResult? Function(List<StockTransfer> transfers)? incomingTransfersLoaded,
    TResult? Function(String message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(List<ProductStock> inventory)? loaded,
    TResult Function(List<StockTransfer> transfers)? incomingTransfersLoaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_IncomingTransfersLoaded value)
        incomingTransfersLoaded,
    required TResult Function(_Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_IncomingTransfersLoaded value)? incomingTransfersLoaded,
    TResult? Function(_Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_IncomingTransfersLoaded value)? incomingTransfersLoaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InventoryManagementStateCopyWith<$Res> {
  factory $InventoryManagementStateCopyWith(InventoryManagementState value,
          $Res Function(InventoryManagementState) then) =
      _$InventoryManagementStateCopyWithImpl<$Res, InventoryManagementState>;
}

/// @nodoc
class _$InventoryManagementStateCopyWithImpl<$Res,
        $Val extends InventoryManagementState>
    implements $InventoryManagementStateCopyWith<$Res> {
  _$InventoryManagementStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of InventoryManagementState
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
    extends _$InventoryManagementStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of InventoryManagementState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'InventoryManagementState.initial()';
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
    required TResult Function() success,
    required TResult Function(List<ProductStock> inventory) loaded,
    required TResult Function(List<StockTransfer> transfers)
        incomingTransfersLoaded,
    required TResult Function(String message) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(List<ProductStock> inventory)? loaded,
    TResult? Function(List<StockTransfer> transfers)? incomingTransfersLoaded,
    TResult? Function(String message)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(List<ProductStock> inventory)? loaded,
    TResult Function(List<StockTransfer> transfers)? incomingTransfersLoaded,
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
    required TResult Function(_Success value) success,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_IncomingTransfersLoaded value)
        incomingTransfersLoaded,
    required TResult Function(_Error value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_IncomingTransfersLoaded value)? incomingTransfersLoaded,
    TResult? Function(_Error value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_IncomingTransfersLoaded value)? incomingTransfersLoaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements InventoryManagementState {
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
    extends _$InventoryManagementStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of InventoryManagementState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'InventoryManagementState.loading()';
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
    required TResult Function() success,
    required TResult Function(List<ProductStock> inventory) loaded,
    required TResult Function(List<StockTransfer> transfers)
        incomingTransfersLoaded,
    required TResult Function(String message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(List<ProductStock> inventory)? loaded,
    TResult? Function(List<StockTransfer> transfers)? incomingTransfersLoaded,
    TResult? Function(String message)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(List<ProductStock> inventory)? loaded,
    TResult Function(List<StockTransfer> transfers)? incomingTransfersLoaded,
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
    required TResult Function(_Success value) success,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_IncomingTransfersLoaded value)
        incomingTransfersLoaded,
    required TResult Function(_Error value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_IncomingTransfersLoaded value)? incomingTransfersLoaded,
    TResult? Function(_Error value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_IncomingTransfersLoaded value)? incomingTransfersLoaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements InventoryManagementState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$SuccessImplCopyWith<$Res> {
  factory _$$SuccessImplCopyWith(
          _$SuccessImpl value, $Res Function(_$SuccessImpl) then) =
      __$$SuccessImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SuccessImplCopyWithImpl<$Res>
    extends _$InventoryManagementStateCopyWithImpl<$Res, _$SuccessImpl>
    implements _$$SuccessImplCopyWith<$Res> {
  __$$SuccessImplCopyWithImpl(
      _$SuccessImpl _value, $Res Function(_$SuccessImpl) _then)
      : super(_value, _then);

  /// Create a copy of InventoryManagementState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$SuccessImpl implements _Success {
  const _$SuccessImpl();

  @override
  String toString() {
    return 'InventoryManagementState.success()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SuccessImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(List<ProductStock> inventory) loaded,
    required TResult Function(List<StockTransfer> transfers)
        incomingTransfersLoaded,
    required TResult Function(String message) error,
  }) {
    return success();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(List<ProductStock> inventory)? loaded,
    TResult? Function(List<StockTransfer> transfers)? incomingTransfersLoaded,
    TResult? Function(String message)? error,
  }) {
    return success?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(List<ProductStock> inventory)? loaded,
    TResult Function(List<StockTransfer> transfers)? incomingTransfersLoaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_IncomingTransfersLoaded value)
        incomingTransfersLoaded,
    required TResult Function(_Error value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_IncomingTransfersLoaded value)? incomingTransfersLoaded,
    TResult? Function(_Error value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_IncomingTransfersLoaded value)? incomingTransfersLoaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _Success implements InventoryManagementState {
  const factory _Success() = _$SuccessImpl;
}

/// @nodoc
abstract class _$$LoadedImplCopyWith<$Res> {
  factory _$$LoadedImplCopyWith(
          _$LoadedImpl value, $Res Function(_$LoadedImpl) then) =
      __$$LoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<ProductStock> inventory});
}

/// @nodoc
class __$$LoadedImplCopyWithImpl<$Res>
    extends _$InventoryManagementStateCopyWithImpl<$Res, _$LoadedImpl>
    implements _$$LoadedImplCopyWith<$Res> {
  __$$LoadedImplCopyWithImpl(
      _$LoadedImpl _value, $Res Function(_$LoadedImpl) _then)
      : super(_value, _then);

  /// Create a copy of InventoryManagementState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? inventory = null,
  }) {
    return _then(_$LoadedImpl(
      null == inventory
          ? _value._inventory
          : inventory // ignore: cast_nullable_to_non_nullable
              as List<ProductStock>,
    ));
  }
}

/// @nodoc

class _$LoadedImpl implements _Loaded {
  const _$LoadedImpl(final List<ProductStock> inventory)
      : _inventory = inventory;

  final List<ProductStock> _inventory;
  @override
  List<ProductStock> get inventory {
    if (_inventory is EqualUnmodifiableListView) return _inventory;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_inventory);
  }

  @override
  String toString() {
    return 'InventoryManagementState.loaded(inventory: $inventory)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadedImpl &&
            const DeepCollectionEquality()
                .equals(other._inventory, _inventory));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_inventory));

  /// Create a copy of InventoryManagementState
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
    required TResult Function() success,
    required TResult Function(List<ProductStock> inventory) loaded,
    required TResult Function(List<StockTransfer> transfers)
        incomingTransfersLoaded,
    required TResult Function(String message) error,
  }) {
    return loaded(inventory);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(List<ProductStock> inventory)? loaded,
    TResult? Function(List<StockTransfer> transfers)? incomingTransfersLoaded,
    TResult? Function(String message)? error,
  }) {
    return loaded?.call(inventory);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(List<ProductStock> inventory)? loaded,
    TResult Function(List<StockTransfer> transfers)? incomingTransfersLoaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(inventory);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_IncomingTransfersLoaded value)
        incomingTransfersLoaded,
    required TResult Function(_Error value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_IncomingTransfersLoaded value)? incomingTransfersLoaded,
    TResult? Function(_Error value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_IncomingTransfersLoaded value)? incomingTransfersLoaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class _Loaded implements InventoryManagementState {
  const factory _Loaded(final List<ProductStock> inventory) = _$LoadedImpl;

  List<ProductStock> get inventory;

  /// Create a copy of InventoryManagementState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadedImplCopyWith<_$LoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$IncomingTransfersLoadedImplCopyWith<$Res> {
  factory _$$IncomingTransfersLoadedImplCopyWith(
          _$IncomingTransfersLoadedImpl value,
          $Res Function(_$IncomingTransfersLoadedImpl) then) =
      __$$IncomingTransfersLoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<StockTransfer> transfers});
}

/// @nodoc
class __$$IncomingTransfersLoadedImplCopyWithImpl<$Res>
    extends _$InventoryManagementStateCopyWithImpl<$Res,
        _$IncomingTransfersLoadedImpl>
    implements _$$IncomingTransfersLoadedImplCopyWith<$Res> {
  __$$IncomingTransfersLoadedImplCopyWithImpl(
      _$IncomingTransfersLoadedImpl _value,
      $Res Function(_$IncomingTransfersLoadedImpl) _then)
      : super(_value, _then);

  /// Create a copy of InventoryManagementState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transfers = null,
  }) {
    return _then(_$IncomingTransfersLoadedImpl(
      null == transfers
          ? _value._transfers
          : transfers // ignore: cast_nullable_to_non_nullable
              as List<StockTransfer>,
    ));
  }
}

/// @nodoc

class _$IncomingTransfersLoadedImpl implements _IncomingTransfersLoaded {
  const _$IncomingTransfersLoadedImpl(final List<StockTransfer> transfers)
      : _transfers = transfers;

  final List<StockTransfer> _transfers;
  @override
  List<StockTransfer> get transfers {
    if (_transfers is EqualUnmodifiableListView) return _transfers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_transfers);
  }

  @override
  String toString() {
    return 'InventoryManagementState.incomingTransfersLoaded(transfers: $transfers)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IncomingTransfersLoadedImpl &&
            const DeepCollectionEquality()
                .equals(other._transfers, _transfers));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_transfers));

  /// Create a copy of InventoryManagementState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$IncomingTransfersLoadedImplCopyWith<_$IncomingTransfersLoadedImpl>
      get copyWith => __$$IncomingTransfersLoadedImplCopyWithImpl<
          _$IncomingTransfersLoadedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(List<ProductStock> inventory) loaded,
    required TResult Function(List<StockTransfer> transfers)
        incomingTransfersLoaded,
    required TResult Function(String message) error,
  }) {
    return incomingTransfersLoaded(transfers);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(List<ProductStock> inventory)? loaded,
    TResult? Function(List<StockTransfer> transfers)? incomingTransfersLoaded,
    TResult? Function(String message)? error,
  }) {
    return incomingTransfersLoaded?.call(transfers);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(List<ProductStock> inventory)? loaded,
    TResult Function(List<StockTransfer> transfers)? incomingTransfersLoaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (incomingTransfersLoaded != null) {
      return incomingTransfersLoaded(transfers);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_IncomingTransfersLoaded value)
        incomingTransfersLoaded,
    required TResult Function(_Error value) error,
  }) {
    return incomingTransfersLoaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_IncomingTransfersLoaded value)? incomingTransfersLoaded,
    TResult? Function(_Error value)? error,
  }) {
    return incomingTransfersLoaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_IncomingTransfersLoaded value)? incomingTransfersLoaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (incomingTransfersLoaded != null) {
      return incomingTransfersLoaded(this);
    }
    return orElse();
  }
}

abstract class _IncomingTransfersLoaded implements InventoryManagementState {
  const factory _IncomingTransfersLoaded(final List<StockTransfer> transfers) =
      _$IncomingTransfersLoadedImpl;

  List<StockTransfer> get transfers;

  /// Create a copy of InventoryManagementState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$IncomingTransfersLoadedImplCopyWith<_$IncomingTransfersLoadedImpl>
      get copyWith => throw _privateConstructorUsedError;
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
    extends _$InventoryManagementStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of InventoryManagementState
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
    return 'InventoryManagementState.error(message: $message)';
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

  /// Create a copy of InventoryManagementState
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
    required TResult Function() success,
    required TResult Function(List<ProductStock> inventory) loaded,
    required TResult Function(List<StockTransfer> transfers)
        incomingTransfersLoaded,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(List<ProductStock> inventory)? loaded,
    TResult? Function(List<StockTransfer> transfers)? incomingTransfersLoaded,
    TResult? Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(List<ProductStock> inventory)? loaded,
    TResult Function(List<StockTransfer> transfers)? incomingTransfersLoaded,
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
    required TResult Function(_Success value) success,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_IncomingTransfersLoaded value)
        incomingTransfersLoaded,
    required TResult Function(_Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_IncomingTransfersLoaded value)? incomingTransfersLoaded,
    TResult? Function(_Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_IncomingTransfersLoaded value)? incomingTransfersLoaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements InventoryManagementState {
  const factory _Error(final String message) = _$ErrorImpl;

  String get message;

  /// Create a copy of InventoryManagementState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
