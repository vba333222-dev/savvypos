// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'advanced_inventory_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AdvancedInventoryEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? warehouseUuid) loadDashboard,
    required TResult Function() refreshDashboard,
    required TResult Function() loadWarehouses,
    required TResult Function(String? uuid) selectWarehouse,
    required TResult Function(Warehouse warehouse) createWarehouse,
    required TResult Function(Warehouse warehouse) updateWarehouse,
    required TResult Function(String? warehouseUuid, String? categoryUuid,
            String? searchQuery, bool? lowStockOnly, bool? outOfStockOnly)
        loadStockLevels,
    required TResult Function(String productUuid, String warehouseUuid,
            double quantityChange, String reason, String? notes)
        adjustStock,
    required TResult Function(String? productUuid, String? warehouseUuid,
            DateTime? startDate, DateTime? endDate)
        loadMovements,
    required TResult Function(
            String? productUuid, String? warehouseUuid, bool? expiringOnly)
        loadBatches,
    required TResult Function(AlertSeverity? severity) loadAlerts,
    required TResult Function(String uuid) acknowledgeAlert,
    required TResult Function(String uuid, String action) resolveAlert,
    required TResult Function() generateAlerts,
    required TResult Function(TransferStatus? status) loadTransfers,
    required TResult Function(AdvancedStockTransfer transfer) createTransfer,
    required TResult Function(String uuid) approveTransfer,
    required TResult Function(
            String uuid, List<AdvancedStockTransferItem> items)
        shipTransfer,
    required TResult Function(
            String uuid, List<AdvancedStockTransferItem> items)
        receiveTransfer,
    required TResult Function() loadInsights,
    required TResult Function(String warehouseUuid) startPhysicalCount,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? warehouseUuid)? loadDashboard,
    TResult? Function()? refreshDashboard,
    TResult? Function()? loadWarehouses,
    TResult? Function(String? uuid)? selectWarehouse,
    TResult? Function(Warehouse warehouse)? createWarehouse,
    TResult? Function(Warehouse warehouse)? updateWarehouse,
    TResult? Function(String? warehouseUuid, String? categoryUuid,
            String? searchQuery, bool? lowStockOnly, bool? outOfStockOnly)?
        loadStockLevels,
    TResult? Function(String productUuid, String warehouseUuid,
            double quantityChange, String reason, String? notes)?
        adjustStock,
    TResult? Function(String? productUuid, String? warehouseUuid,
            DateTime? startDate, DateTime? endDate)?
        loadMovements,
    TResult? Function(
            String? productUuid, String? warehouseUuid, bool? expiringOnly)?
        loadBatches,
    TResult? Function(AlertSeverity? severity)? loadAlerts,
    TResult? Function(String uuid)? acknowledgeAlert,
    TResult? Function(String uuid, String action)? resolveAlert,
    TResult? Function()? generateAlerts,
    TResult? Function(TransferStatus? status)? loadTransfers,
    TResult? Function(AdvancedStockTransfer transfer)? createTransfer,
    TResult? Function(String uuid)? approveTransfer,
    TResult? Function(String uuid, List<AdvancedStockTransferItem> items)?
        shipTransfer,
    TResult? Function(String uuid, List<AdvancedStockTransferItem> items)?
        receiveTransfer,
    TResult? Function()? loadInsights,
    TResult? Function(String warehouseUuid)? startPhysicalCount,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? warehouseUuid)? loadDashboard,
    TResult Function()? refreshDashboard,
    TResult Function()? loadWarehouses,
    TResult Function(String? uuid)? selectWarehouse,
    TResult Function(Warehouse warehouse)? createWarehouse,
    TResult Function(Warehouse warehouse)? updateWarehouse,
    TResult Function(String? warehouseUuid, String? categoryUuid,
            String? searchQuery, bool? lowStockOnly, bool? outOfStockOnly)?
        loadStockLevels,
    TResult Function(String productUuid, String warehouseUuid,
            double quantityChange, String reason, String? notes)?
        adjustStock,
    TResult Function(String? productUuid, String? warehouseUuid,
            DateTime? startDate, DateTime? endDate)?
        loadMovements,
    TResult Function(
            String? productUuid, String? warehouseUuid, bool? expiringOnly)?
        loadBatches,
    TResult Function(AlertSeverity? severity)? loadAlerts,
    TResult Function(String uuid)? acknowledgeAlert,
    TResult Function(String uuid, String action)? resolveAlert,
    TResult Function()? generateAlerts,
    TResult Function(TransferStatus? status)? loadTransfers,
    TResult Function(AdvancedStockTransfer transfer)? createTransfer,
    TResult Function(String uuid)? approveTransfer,
    TResult Function(String uuid, List<AdvancedStockTransferItem> items)?
        shipTransfer,
    TResult Function(String uuid, List<AdvancedStockTransferItem> items)?
        receiveTransfer,
    TResult Function()? loadInsights,
    TResult Function(String warehouseUuid)? startPhysicalCount,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadDashboard value) loadDashboard,
    required TResult Function(_RefreshDashboard value) refreshDashboard,
    required TResult Function(_LoadWarehouses value) loadWarehouses,
    required TResult Function(_SelectWarehouse value) selectWarehouse,
    required TResult Function(_CreateWarehouse value) createWarehouse,
    required TResult Function(_UpdateWarehouse value) updateWarehouse,
    required TResult Function(_LoadStockLevels value) loadStockLevels,
    required TResult Function(_AdjustStock value) adjustStock,
    required TResult Function(_LoadMovements value) loadMovements,
    required TResult Function(_LoadBatches value) loadBatches,
    required TResult Function(_LoadAlerts value) loadAlerts,
    required TResult Function(_AcknowledgeAlert value) acknowledgeAlert,
    required TResult Function(_ResolveAlert value) resolveAlert,
    required TResult Function(_GenerateAlerts value) generateAlerts,
    required TResult Function(_LoadTransfers value) loadTransfers,
    required TResult Function(_CreateTransfer value) createTransfer,
    required TResult Function(_ApproveTransfer value) approveTransfer,
    required TResult Function(_ShipTransfer value) shipTransfer,
    required TResult Function(_ReceiveTransfer value) receiveTransfer,
    required TResult Function(_LoadInsights value) loadInsights,
    required TResult Function(_StartPhysicalCount value) startPhysicalCount,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadDashboard value)? loadDashboard,
    TResult? Function(_RefreshDashboard value)? refreshDashboard,
    TResult? Function(_LoadWarehouses value)? loadWarehouses,
    TResult? Function(_SelectWarehouse value)? selectWarehouse,
    TResult? Function(_CreateWarehouse value)? createWarehouse,
    TResult? Function(_UpdateWarehouse value)? updateWarehouse,
    TResult? Function(_LoadStockLevels value)? loadStockLevels,
    TResult? Function(_AdjustStock value)? adjustStock,
    TResult? Function(_LoadMovements value)? loadMovements,
    TResult? Function(_LoadBatches value)? loadBatches,
    TResult? Function(_LoadAlerts value)? loadAlerts,
    TResult? Function(_AcknowledgeAlert value)? acknowledgeAlert,
    TResult? Function(_ResolveAlert value)? resolveAlert,
    TResult? Function(_GenerateAlerts value)? generateAlerts,
    TResult? Function(_LoadTransfers value)? loadTransfers,
    TResult? Function(_CreateTransfer value)? createTransfer,
    TResult? Function(_ApproveTransfer value)? approveTransfer,
    TResult? Function(_ShipTransfer value)? shipTransfer,
    TResult? Function(_ReceiveTransfer value)? receiveTransfer,
    TResult? Function(_LoadInsights value)? loadInsights,
    TResult? Function(_StartPhysicalCount value)? startPhysicalCount,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadDashboard value)? loadDashboard,
    TResult Function(_RefreshDashboard value)? refreshDashboard,
    TResult Function(_LoadWarehouses value)? loadWarehouses,
    TResult Function(_SelectWarehouse value)? selectWarehouse,
    TResult Function(_CreateWarehouse value)? createWarehouse,
    TResult Function(_UpdateWarehouse value)? updateWarehouse,
    TResult Function(_LoadStockLevels value)? loadStockLevels,
    TResult Function(_AdjustStock value)? adjustStock,
    TResult Function(_LoadMovements value)? loadMovements,
    TResult Function(_LoadBatches value)? loadBatches,
    TResult Function(_LoadAlerts value)? loadAlerts,
    TResult Function(_AcknowledgeAlert value)? acknowledgeAlert,
    TResult Function(_ResolveAlert value)? resolveAlert,
    TResult Function(_GenerateAlerts value)? generateAlerts,
    TResult Function(_LoadTransfers value)? loadTransfers,
    TResult Function(_CreateTransfer value)? createTransfer,
    TResult Function(_ApproveTransfer value)? approveTransfer,
    TResult Function(_ShipTransfer value)? shipTransfer,
    TResult Function(_ReceiveTransfer value)? receiveTransfer,
    TResult Function(_LoadInsights value)? loadInsights,
    TResult Function(_StartPhysicalCount value)? startPhysicalCount,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AdvancedInventoryEventCopyWith<$Res> {
  factory $AdvancedInventoryEventCopyWith(AdvancedInventoryEvent value,
          $Res Function(AdvancedInventoryEvent) then) =
      _$AdvancedInventoryEventCopyWithImpl<$Res, AdvancedInventoryEvent>;
}

/// @nodoc
class _$AdvancedInventoryEventCopyWithImpl<$Res,
        $Val extends AdvancedInventoryEvent>
    implements $AdvancedInventoryEventCopyWith<$Res> {
  _$AdvancedInventoryEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AdvancedInventoryEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$LoadDashboardImplCopyWith<$Res> {
  factory _$$LoadDashboardImplCopyWith(
          _$LoadDashboardImpl value, $Res Function(_$LoadDashboardImpl) then) =
      __$$LoadDashboardImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String? warehouseUuid});
}

/// @nodoc
class __$$LoadDashboardImplCopyWithImpl<$Res>
    extends _$AdvancedInventoryEventCopyWithImpl<$Res, _$LoadDashboardImpl>
    implements _$$LoadDashboardImplCopyWith<$Res> {
  __$$LoadDashboardImplCopyWithImpl(
      _$LoadDashboardImpl _value, $Res Function(_$LoadDashboardImpl) _then)
      : super(_value, _then);

  /// Create a copy of AdvancedInventoryEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? warehouseUuid = freezed,
  }) {
    return _then(_$LoadDashboardImpl(
      warehouseUuid: freezed == warehouseUuid
          ? _value.warehouseUuid
          : warehouseUuid // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$LoadDashboardImpl implements _LoadDashboard {
  const _$LoadDashboardImpl({this.warehouseUuid});

  @override
  final String? warehouseUuid;

  @override
  String toString() {
    return 'AdvancedInventoryEvent.loadDashboard(warehouseUuid: $warehouseUuid)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadDashboardImpl &&
            (identical(other.warehouseUuid, warehouseUuid) ||
                other.warehouseUuid == warehouseUuid));
  }

  @override
  int get hashCode => Object.hash(runtimeType, warehouseUuid);

  /// Create a copy of AdvancedInventoryEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadDashboardImplCopyWith<_$LoadDashboardImpl> get copyWith =>
      __$$LoadDashboardImplCopyWithImpl<_$LoadDashboardImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? warehouseUuid) loadDashboard,
    required TResult Function() refreshDashboard,
    required TResult Function() loadWarehouses,
    required TResult Function(String? uuid) selectWarehouse,
    required TResult Function(Warehouse warehouse) createWarehouse,
    required TResult Function(Warehouse warehouse) updateWarehouse,
    required TResult Function(String? warehouseUuid, String? categoryUuid,
            String? searchQuery, bool? lowStockOnly, bool? outOfStockOnly)
        loadStockLevels,
    required TResult Function(String productUuid, String warehouseUuid,
            double quantityChange, String reason, String? notes)
        adjustStock,
    required TResult Function(String? productUuid, String? warehouseUuid,
            DateTime? startDate, DateTime? endDate)
        loadMovements,
    required TResult Function(
            String? productUuid, String? warehouseUuid, bool? expiringOnly)
        loadBatches,
    required TResult Function(AlertSeverity? severity) loadAlerts,
    required TResult Function(String uuid) acknowledgeAlert,
    required TResult Function(String uuid, String action) resolveAlert,
    required TResult Function() generateAlerts,
    required TResult Function(TransferStatus? status) loadTransfers,
    required TResult Function(AdvancedStockTransfer transfer) createTransfer,
    required TResult Function(String uuid) approveTransfer,
    required TResult Function(
            String uuid, List<AdvancedStockTransferItem> items)
        shipTransfer,
    required TResult Function(
            String uuid, List<AdvancedStockTransferItem> items)
        receiveTransfer,
    required TResult Function() loadInsights,
    required TResult Function(String warehouseUuid) startPhysicalCount,
  }) {
    return loadDashboard(warehouseUuid);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? warehouseUuid)? loadDashboard,
    TResult? Function()? refreshDashboard,
    TResult? Function()? loadWarehouses,
    TResult? Function(String? uuid)? selectWarehouse,
    TResult? Function(Warehouse warehouse)? createWarehouse,
    TResult? Function(Warehouse warehouse)? updateWarehouse,
    TResult? Function(String? warehouseUuid, String? categoryUuid,
            String? searchQuery, bool? lowStockOnly, bool? outOfStockOnly)?
        loadStockLevels,
    TResult? Function(String productUuid, String warehouseUuid,
            double quantityChange, String reason, String? notes)?
        adjustStock,
    TResult? Function(String? productUuid, String? warehouseUuid,
            DateTime? startDate, DateTime? endDate)?
        loadMovements,
    TResult? Function(
            String? productUuid, String? warehouseUuid, bool? expiringOnly)?
        loadBatches,
    TResult? Function(AlertSeverity? severity)? loadAlerts,
    TResult? Function(String uuid)? acknowledgeAlert,
    TResult? Function(String uuid, String action)? resolveAlert,
    TResult? Function()? generateAlerts,
    TResult? Function(TransferStatus? status)? loadTransfers,
    TResult? Function(AdvancedStockTransfer transfer)? createTransfer,
    TResult? Function(String uuid)? approveTransfer,
    TResult? Function(String uuid, List<AdvancedStockTransferItem> items)?
        shipTransfer,
    TResult? Function(String uuid, List<AdvancedStockTransferItem> items)?
        receiveTransfer,
    TResult? Function()? loadInsights,
    TResult? Function(String warehouseUuid)? startPhysicalCount,
  }) {
    return loadDashboard?.call(warehouseUuid);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? warehouseUuid)? loadDashboard,
    TResult Function()? refreshDashboard,
    TResult Function()? loadWarehouses,
    TResult Function(String? uuid)? selectWarehouse,
    TResult Function(Warehouse warehouse)? createWarehouse,
    TResult Function(Warehouse warehouse)? updateWarehouse,
    TResult Function(String? warehouseUuid, String? categoryUuid,
            String? searchQuery, bool? lowStockOnly, bool? outOfStockOnly)?
        loadStockLevels,
    TResult Function(String productUuid, String warehouseUuid,
            double quantityChange, String reason, String? notes)?
        adjustStock,
    TResult Function(String? productUuid, String? warehouseUuid,
            DateTime? startDate, DateTime? endDate)?
        loadMovements,
    TResult Function(
            String? productUuid, String? warehouseUuid, bool? expiringOnly)?
        loadBatches,
    TResult Function(AlertSeverity? severity)? loadAlerts,
    TResult Function(String uuid)? acknowledgeAlert,
    TResult Function(String uuid, String action)? resolveAlert,
    TResult Function()? generateAlerts,
    TResult Function(TransferStatus? status)? loadTransfers,
    TResult Function(AdvancedStockTransfer transfer)? createTransfer,
    TResult Function(String uuid)? approveTransfer,
    TResult Function(String uuid, List<AdvancedStockTransferItem> items)?
        shipTransfer,
    TResult Function(String uuid, List<AdvancedStockTransferItem> items)?
        receiveTransfer,
    TResult Function()? loadInsights,
    TResult Function(String warehouseUuid)? startPhysicalCount,
    required TResult orElse(),
  }) {
    if (loadDashboard != null) {
      return loadDashboard(warehouseUuid);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadDashboard value) loadDashboard,
    required TResult Function(_RefreshDashboard value) refreshDashboard,
    required TResult Function(_LoadWarehouses value) loadWarehouses,
    required TResult Function(_SelectWarehouse value) selectWarehouse,
    required TResult Function(_CreateWarehouse value) createWarehouse,
    required TResult Function(_UpdateWarehouse value) updateWarehouse,
    required TResult Function(_LoadStockLevels value) loadStockLevels,
    required TResult Function(_AdjustStock value) adjustStock,
    required TResult Function(_LoadMovements value) loadMovements,
    required TResult Function(_LoadBatches value) loadBatches,
    required TResult Function(_LoadAlerts value) loadAlerts,
    required TResult Function(_AcknowledgeAlert value) acknowledgeAlert,
    required TResult Function(_ResolveAlert value) resolveAlert,
    required TResult Function(_GenerateAlerts value) generateAlerts,
    required TResult Function(_LoadTransfers value) loadTransfers,
    required TResult Function(_CreateTransfer value) createTransfer,
    required TResult Function(_ApproveTransfer value) approveTransfer,
    required TResult Function(_ShipTransfer value) shipTransfer,
    required TResult Function(_ReceiveTransfer value) receiveTransfer,
    required TResult Function(_LoadInsights value) loadInsights,
    required TResult Function(_StartPhysicalCount value) startPhysicalCount,
  }) {
    return loadDashboard(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadDashboard value)? loadDashboard,
    TResult? Function(_RefreshDashboard value)? refreshDashboard,
    TResult? Function(_LoadWarehouses value)? loadWarehouses,
    TResult? Function(_SelectWarehouse value)? selectWarehouse,
    TResult? Function(_CreateWarehouse value)? createWarehouse,
    TResult? Function(_UpdateWarehouse value)? updateWarehouse,
    TResult? Function(_LoadStockLevels value)? loadStockLevels,
    TResult? Function(_AdjustStock value)? adjustStock,
    TResult? Function(_LoadMovements value)? loadMovements,
    TResult? Function(_LoadBatches value)? loadBatches,
    TResult? Function(_LoadAlerts value)? loadAlerts,
    TResult? Function(_AcknowledgeAlert value)? acknowledgeAlert,
    TResult? Function(_ResolveAlert value)? resolveAlert,
    TResult? Function(_GenerateAlerts value)? generateAlerts,
    TResult? Function(_LoadTransfers value)? loadTransfers,
    TResult? Function(_CreateTransfer value)? createTransfer,
    TResult? Function(_ApproveTransfer value)? approveTransfer,
    TResult? Function(_ShipTransfer value)? shipTransfer,
    TResult? Function(_ReceiveTransfer value)? receiveTransfer,
    TResult? Function(_LoadInsights value)? loadInsights,
    TResult? Function(_StartPhysicalCount value)? startPhysicalCount,
  }) {
    return loadDashboard?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadDashboard value)? loadDashboard,
    TResult Function(_RefreshDashboard value)? refreshDashboard,
    TResult Function(_LoadWarehouses value)? loadWarehouses,
    TResult Function(_SelectWarehouse value)? selectWarehouse,
    TResult Function(_CreateWarehouse value)? createWarehouse,
    TResult Function(_UpdateWarehouse value)? updateWarehouse,
    TResult Function(_LoadStockLevels value)? loadStockLevels,
    TResult Function(_AdjustStock value)? adjustStock,
    TResult Function(_LoadMovements value)? loadMovements,
    TResult Function(_LoadBatches value)? loadBatches,
    TResult Function(_LoadAlerts value)? loadAlerts,
    TResult Function(_AcknowledgeAlert value)? acknowledgeAlert,
    TResult Function(_ResolveAlert value)? resolveAlert,
    TResult Function(_GenerateAlerts value)? generateAlerts,
    TResult Function(_LoadTransfers value)? loadTransfers,
    TResult Function(_CreateTransfer value)? createTransfer,
    TResult Function(_ApproveTransfer value)? approveTransfer,
    TResult Function(_ShipTransfer value)? shipTransfer,
    TResult Function(_ReceiveTransfer value)? receiveTransfer,
    TResult Function(_LoadInsights value)? loadInsights,
    TResult Function(_StartPhysicalCount value)? startPhysicalCount,
    required TResult orElse(),
  }) {
    if (loadDashboard != null) {
      return loadDashboard(this);
    }
    return orElse();
  }
}

abstract class _LoadDashboard implements AdvancedInventoryEvent {
  const factory _LoadDashboard({final String? warehouseUuid}) =
      _$LoadDashboardImpl;

  String? get warehouseUuid;

  /// Create a copy of AdvancedInventoryEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadDashboardImplCopyWith<_$LoadDashboardImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RefreshDashboardImplCopyWith<$Res> {
  factory _$$RefreshDashboardImplCopyWith(_$RefreshDashboardImpl value,
          $Res Function(_$RefreshDashboardImpl) then) =
      __$$RefreshDashboardImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RefreshDashboardImplCopyWithImpl<$Res>
    extends _$AdvancedInventoryEventCopyWithImpl<$Res, _$RefreshDashboardImpl>
    implements _$$RefreshDashboardImplCopyWith<$Res> {
  __$$RefreshDashboardImplCopyWithImpl(_$RefreshDashboardImpl _value,
      $Res Function(_$RefreshDashboardImpl) _then)
      : super(_value, _then);

  /// Create a copy of AdvancedInventoryEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$RefreshDashboardImpl implements _RefreshDashboard {
  const _$RefreshDashboardImpl();

  @override
  String toString() {
    return 'AdvancedInventoryEvent.refreshDashboard()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$RefreshDashboardImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? warehouseUuid) loadDashboard,
    required TResult Function() refreshDashboard,
    required TResult Function() loadWarehouses,
    required TResult Function(String? uuid) selectWarehouse,
    required TResult Function(Warehouse warehouse) createWarehouse,
    required TResult Function(Warehouse warehouse) updateWarehouse,
    required TResult Function(String? warehouseUuid, String? categoryUuid,
            String? searchQuery, bool? lowStockOnly, bool? outOfStockOnly)
        loadStockLevels,
    required TResult Function(String productUuid, String warehouseUuid,
            double quantityChange, String reason, String? notes)
        adjustStock,
    required TResult Function(String? productUuid, String? warehouseUuid,
            DateTime? startDate, DateTime? endDate)
        loadMovements,
    required TResult Function(
            String? productUuid, String? warehouseUuid, bool? expiringOnly)
        loadBatches,
    required TResult Function(AlertSeverity? severity) loadAlerts,
    required TResult Function(String uuid) acknowledgeAlert,
    required TResult Function(String uuid, String action) resolveAlert,
    required TResult Function() generateAlerts,
    required TResult Function(TransferStatus? status) loadTransfers,
    required TResult Function(AdvancedStockTransfer transfer) createTransfer,
    required TResult Function(String uuid) approveTransfer,
    required TResult Function(
            String uuid, List<AdvancedStockTransferItem> items)
        shipTransfer,
    required TResult Function(
            String uuid, List<AdvancedStockTransferItem> items)
        receiveTransfer,
    required TResult Function() loadInsights,
    required TResult Function(String warehouseUuid) startPhysicalCount,
  }) {
    return refreshDashboard();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? warehouseUuid)? loadDashboard,
    TResult? Function()? refreshDashboard,
    TResult? Function()? loadWarehouses,
    TResult? Function(String? uuid)? selectWarehouse,
    TResult? Function(Warehouse warehouse)? createWarehouse,
    TResult? Function(Warehouse warehouse)? updateWarehouse,
    TResult? Function(String? warehouseUuid, String? categoryUuid,
            String? searchQuery, bool? lowStockOnly, bool? outOfStockOnly)?
        loadStockLevels,
    TResult? Function(String productUuid, String warehouseUuid,
            double quantityChange, String reason, String? notes)?
        adjustStock,
    TResult? Function(String? productUuid, String? warehouseUuid,
            DateTime? startDate, DateTime? endDate)?
        loadMovements,
    TResult? Function(
            String? productUuid, String? warehouseUuid, bool? expiringOnly)?
        loadBatches,
    TResult? Function(AlertSeverity? severity)? loadAlerts,
    TResult? Function(String uuid)? acknowledgeAlert,
    TResult? Function(String uuid, String action)? resolveAlert,
    TResult? Function()? generateAlerts,
    TResult? Function(TransferStatus? status)? loadTransfers,
    TResult? Function(AdvancedStockTransfer transfer)? createTransfer,
    TResult? Function(String uuid)? approveTransfer,
    TResult? Function(String uuid, List<AdvancedStockTransferItem> items)?
        shipTransfer,
    TResult? Function(String uuid, List<AdvancedStockTransferItem> items)?
        receiveTransfer,
    TResult? Function()? loadInsights,
    TResult? Function(String warehouseUuid)? startPhysicalCount,
  }) {
    return refreshDashboard?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? warehouseUuid)? loadDashboard,
    TResult Function()? refreshDashboard,
    TResult Function()? loadWarehouses,
    TResult Function(String? uuid)? selectWarehouse,
    TResult Function(Warehouse warehouse)? createWarehouse,
    TResult Function(Warehouse warehouse)? updateWarehouse,
    TResult Function(String? warehouseUuid, String? categoryUuid,
            String? searchQuery, bool? lowStockOnly, bool? outOfStockOnly)?
        loadStockLevels,
    TResult Function(String productUuid, String warehouseUuid,
            double quantityChange, String reason, String? notes)?
        adjustStock,
    TResult Function(String? productUuid, String? warehouseUuid,
            DateTime? startDate, DateTime? endDate)?
        loadMovements,
    TResult Function(
            String? productUuid, String? warehouseUuid, bool? expiringOnly)?
        loadBatches,
    TResult Function(AlertSeverity? severity)? loadAlerts,
    TResult Function(String uuid)? acknowledgeAlert,
    TResult Function(String uuid, String action)? resolveAlert,
    TResult Function()? generateAlerts,
    TResult Function(TransferStatus? status)? loadTransfers,
    TResult Function(AdvancedStockTransfer transfer)? createTransfer,
    TResult Function(String uuid)? approveTransfer,
    TResult Function(String uuid, List<AdvancedStockTransferItem> items)?
        shipTransfer,
    TResult Function(String uuid, List<AdvancedStockTransferItem> items)?
        receiveTransfer,
    TResult Function()? loadInsights,
    TResult Function(String warehouseUuid)? startPhysicalCount,
    required TResult orElse(),
  }) {
    if (refreshDashboard != null) {
      return refreshDashboard();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadDashboard value) loadDashboard,
    required TResult Function(_RefreshDashboard value) refreshDashboard,
    required TResult Function(_LoadWarehouses value) loadWarehouses,
    required TResult Function(_SelectWarehouse value) selectWarehouse,
    required TResult Function(_CreateWarehouse value) createWarehouse,
    required TResult Function(_UpdateWarehouse value) updateWarehouse,
    required TResult Function(_LoadStockLevels value) loadStockLevels,
    required TResult Function(_AdjustStock value) adjustStock,
    required TResult Function(_LoadMovements value) loadMovements,
    required TResult Function(_LoadBatches value) loadBatches,
    required TResult Function(_LoadAlerts value) loadAlerts,
    required TResult Function(_AcknowledgeAlert value) acknowledgeAlert,
    required TResult Function(_ResolveAlert value) resolveAlert,
    required TResult Function(_GenerateAlerts value) generateAlerts,
    required TResult Function(_LoadTransfers value) loadTransfers,
    required TResult Function(_CreateTransfer value) createTransfer,
    required TResult Function(_ApproveTransfer value) approveTransfer,
    required TResult Function(_ShipTransfer value) shipTransfer,
    required TResult Function(_ReceiveTransfer value) receiveTransfer,
    required TResult Function(_LoadInsights value) loadInsights,
    required TResult Function(_StartPhysicalCount value) startPhysicalCount,
  }) {
    return refreshDashboard(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadDashboard value)? loadDashboard,
    TResult? Function(_RefreshDashboard value)? refreshDashboard,
    TResult? Function(_LoadWarehouses value)? loadWarehouses,
    TResult? Function(_SelectWarehouse value)? selectWarehouse,
    TResult? Function(_CreateWarehouse value)? createWarehouse,
    TResult? Function(_UpdateWarehouse value)? updateWarehouse,
    TResult? Function(_LoadStockLevels value)? loadStockLevels,
    TResult? Function(_AdjustStock value)? adjustStock,
    TResult? Function(_LoadMovements value)? loadMovements,
    TResult? Function(_LoadBatches value)? loadBatches,
    TResult? Function(_LoadAlerts value)? loadAlerts,
    TResult? Function(_AcknowledgeAlert value)? acknowledgeAlert,
    TResult? Function(_ResolveAlert value)? resolveAlert,
    TResult? Function(_GenerateAlerts value)? generateAlerts,
    TResult? Function(_LoadTransfers value)? loadTransfers,
    TResult? Function(_CreateTransfer value)? createTransfer,
    TResult? Function(_ApproveTransfer value)? approveTransfer,
    TResult? Function(_ShipTransfer value)? shipTransfer,
    TResult? Function(_ReceiveTransfer value)? receiveTransfer,
    TResult? Function(_LoadInsights value)? loadInsights,
    TResult? Function(_StartPhysicalCount value)? startPhysicalCount,
  }) {
    return refreshDashboard?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadDashboard value)? loadDashboard,
    TResult Function(_RefreshDashboard value)? refreshDashboard,
    TResult Function(_LoadWarehouses value)? loadWarehouses,
    TResult Function(_SelectWarehouse value)? selectWarehouse,
    TResult Function(_CreateWarehouse value)? createWarehouse,
    TResult Function(_UpdateWarehouse value)? updateWarehouse,
    TResult Function(_LoadStockLevels value)? loadStockLevels,
    TResult Function(_AdjustStock value)? adjustStock,
    TResult Function(_LoadMovements value)? loadMovements,
    TResult Function(_LoadBatches value)? loadBatches,
    TResult Function(_LoadAlerts value)? loadAlerts,
    TResult Function(_AcknowledgeAlert value)? acknowledgeAlert,
    TResult Function(_ResolveAlert value)? resolveAlert,
    TResult Function(_GenerateAlerts value)? generateAlerts,
    TResult Function(_LoadTransfers value)? loadTransfers,
    TResult Function(_CreateTransfer value)? createTransfer,
    TResult Function(_ApproveTransfer value)? approveTransfer,
    TResult Function(_ShipTransfer value)? shipTransfer,
    TResult Function(_ReceiveTransfer value)? receiveTransfer,
    TResult Function(_LoadInsights value)? loadInsights,
    TResult Function(_StartPhysicalCount value)? startPhysicalCount,
    required TResult orElse(),
  }) {
    if (refreshDashboard != null) {
      return refreshDashboard(this);
    }
    return orElse();
  }
}

abstract class _RefreshDashboard implements AdvancedInventoryEvent {
  const factory _RefreshDashboard() = _$RefreshDashboardImpl;
}

/// @nodoc
abstract class _$$LoadWarehousesImplCopyWith<$Res> {
  factory _$$LoadWarehousesImplCopyWith(_$LoadWarehousesImpl value,
          $Res Function(_$LoadWarehousesImpl) then) =
      __$$LoadWarehousesImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadWarehousesImplCopyWithImpl<$Res>
    extends _$AdvancedInventoryEventCopyWithImpl<$Res, _$LoadWarehousesImpl>
    implements _$$LoadWarehousesImplCopyWith<$Res> {
  __$$LoadWarehousesImplCopyWithImpl(
      _$LoadWarehousesImpl _value, $Res Function(_$LoadWarehousesImpl) _then)
      : super(_value, _then);

  /// Create a copy of AdvancedInventoryEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadWarehousesImpl implements _LoadWarehouses {
  const _$LoadWarehousesImpl();

  @override
  String toString() {
    return 'AdvancedInventoryEvent.loadWarehouses()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadWarehousesImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? warehouseUuid) loadDashboard,
    required TResult Function() refreshDashboard,
    required TResult Function() loadWarehouses,
    required TResult Function(String? uuid) selectWarehouse,
    required TResult Function(Warehouse warehouse) createWarehouse,
    required TResult Function(Warehouse warehouse) updateWarehouse,
    required TResult Function(String? warehouseUuid, String? categoryUuid,
            String? searchQuery, bool? lowStockOnly, bool? outOfStockOnly)
        loadStockLevels,
    required TResult Function(String productUuid, String warehouseUuid,
            double quantityChange, String reason, String? notes)
        adjustStock,
    required TResult Function(String? productUuid, String? warehouseUuid,
            DateTime? startDate, DateTime? endDate)
        loadMovements,
    required TResult Function(
            String? productUuid, String? warehouseUuid, bool? expiringOnly)
        loadBatches,
    required TResult Function(AlertSeverity? severity) loadAlerts,
    required TResult Function(String uuid) acknowledgeAlert,
    required TResult Function(String uuid, String action) resolveAlert,
    required TResult Function() generateAlerts,
    required TResult Function(TransferStatus? status) loadTransfers,
    required TResult Function(AdvancedStockTransfer transfer) createTransfer,
    required TResult Function(String uuid) approveTransfer,
    required TResult Function(
            String uuid, List<AdvancedStockTransferItem> items)
        shipTransfer,
    required TResult Function(
            String uuid, List<AdvancedStockTransferItem> items)
        receiveTransfer,
    required TResult Function() loadInsights,
    required TResult Function(String warehouseUuid) startPhysicalCount,
  }) {
    return loadWarehouses();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? warehouseUuid)? loadDashboard,
    TResult? Function()? refreshDashboard,
    TResult? Function()? loadWarehouses,
    TResult? Function(String? uuid)? selectWarehouse,
    TResult? Function(Warehouse warehouse)? createWarehouse,
    TResult? Function(Warehouse warehouse)? updateWarehouse,
    TResult? Function(String? warehouseUuid, String? categoryUuid,
            String? searchQuery, bool? lowStockOnly, bool? outOfStockOnly)?
        loadStockLevels,
    TResult? Function(String productUuid, String warehouseUuid,
            double quantityChange, String reason, String? notes)?
        adjustStock,
    TResult? Function(String? productUuid, String? warehouseUuid,
            DateTime? startDate, DateTime? endDate)?
        loadMovements,
    TResult? Function(
            String? productUuid, String? warehouseUuid, bool? expiringOnly)?
        loadBatches,
    TResult? Function(AlertSeverity? severity)? loadAlerts,
    TResult? Function(String uuid)? acknowledgeAlert,
    TResult? Function(String uuid, String action)? resolveAlert,
    TResult? Function()? generateAlerts,
    TResult? Function(TransferStatus? status)? loadTransfers,
    TResult? Function(AdvancedStockTransfer transfer)? createTransfer,
    TResult? Function(String uuid)? approveTransfer,
    TResult? Function(String uuid, List<AdvancedStockTransferItem> items)?
        shipTransfer,
    TResult? Function(String uuid, List<AdvancedStockTransferItem> items)?
        receiveTransfer,
    TResult? Function()? loadInsights,
    TResult? Function(String warehouseUuid)? startPhysicalCount,
  }) {
    return loadWarehouses?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? warehouseUuid)? loadDashboard,
    TResult Function()? refreshDashboard,
    TResult Function()? loadWarehouses,
    TResult Function(String? uuid)? selectWarehouse,
    TResult Function(Warehouse warehouse)? createWarehouse,
    TResult Function(Warehouse warehouse)? updateWarehouse,
    TResult Function(String? warehouseUuid, String? categoryUuid,
            String? searchQuery, bool? lowStockOnly, bool? outOfStockOnly)?
        loadStockLevels,
    TResult Function(String productUuid, String warehouseUuid,
            double quantityChange, String reason, String? notes)?
        adjustStock,
    TResult Function(String? productUuid, String? warehouseUuid,
            DateTime? startDate, DateTime? endDate)?
        loadMovements,
    TResult Function(
            String? productUuid, String? warehouseUuid, bool? expiringOnly)?
        loadBatches,
    TResult Function(AlertSeverity? severity)? loadAlerts,
    TResult Function(String uuid)? acknowledgeAlert,
    TResult Function(String uuid, String action)? resolveAlert,
    TResult Function()? generateAlerts,
    TResult Function(TransferStatus? status)? loadTransfers,
    TResult Function(AdvancedStockTransfer transfer)? createTransfer,
    TResult Function(String uuid)? approveTransfer,
    TResult Function(String uuid, List<AdvancedStockTransferItem> items)?
        shipTransfer,
    TResult Function(String uuid, List<AdvancedStockTransferItem> items)?
        receiveTransfer,
    TResult Function()? loadInsights,
    TResult Function(String warehouseUuid)? startPhysicalCount,
    required TResult orElse(),
  }) {
    if (loadWarehouses != null) {
      return loadWarehouses();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadDashboard value) loadDashboard,
    required TResult Function(_RefreshDashboard value) refreshDashboard,
    required TResult Function(_LoadWarehouses value) loadWarehouses,
    required TResult Function(_SelectWarehouse value) selectWarehouse,
    required TResult Function(_CreateWarehouse value) createWarehouse,
    required TResult Function(_UpdateWarehouse value) updateWarehouse,
    required TResult Function(_LoadStockLevels value) loadStockLevels,
    required TResult Function(_AdjustStock value) adjustStock,
    required TResult Function(_LoadMovements value) loadMovements,
    required TResult Function(_LoadBatches value) loadBatches,
    required TResult Function(_LoadAlerts value) loadAlerts,
    required TResult Function(_AcknowledgeAlert value) acknowledgeAlert,
    required TResult Function(_ResolveAlert value) resolveAlert,
    required TResult Function(_GenerateAlerts value) generateAlerts,
    required TResult Function(_LoadTransfers value) loadTransfers,
    required TResult Function(_CreateTransfer value) createTransfer,
    required TResult Function(_ApproveTransfer value) approveTransfer,
    required TResult Function(_ShipTransfer value) shipTransfer,
    required TResult Function(_ReceiveTransfer value) receiveTransfer,
    required TResult Function(_LoadInsights value) loadInsights,
    required TResult Function(_StartPhysicalCount value) startPhysicalCount,
  }) {
    return loadWarehouses(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadDashboard value)? loadDashboard,
    TResult? Function(_RefreshDashboard value)? refreshDashboard,
    TResult? Function(_LoadWarehouses value)? loadWarehouses,
    TResult? Function(_SelectWarehouse value)? selectWarehouse,
    TResult? Function(_CreateWarehouse value)? createWarehouse,
    TResult? Function(_UpdateWarehouse value)? updateWarehouse,
    TResult? Function(_LoadStockLevels value)? loadStockLevels,
    TResult? Function(_AdjustStock value)? adjustStock,
    TResult? Function(_LoadMovements value)? loadMovements,
    TResult? Function(_LoadBatches value)? loadBatches,
    TResult? Function(_LoadAlerts value)? loadAlerts,
    TResult? Function(_AcknowledgeAlert value)? acknowledgeAlert,
    TResult? Function(_ResolveAlert value)? resolveAlert,
    TResult? Function(_GenerateAlerts value)? generateAlerts,
    TResult? Function(_LoadTransfers value)? loadTransfers,
    TResult? Function(_CreateTransfer value)? createTransfer,
    TResult? Function(_ApproveTransfer value)? approveTransfer,
    TResult? Function(_ShipTransfer value)? shipTransfer,
    TResult? Function(_ReceiveTransfer value)? receiveTransfer,
    TResult? Function(_LoadInsights value)? loadInsights,
    TResult? Function(_StartPhysicalCount value)? startPhysicalCount,
  }) {
    return loadWarehouses?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadDashboard value)? loadDashboard,
    TResult Function(_RefreshDashboard value)? refreshDashboard,
    TResult Function(_LoadWarehouses value)? loadWarehouses,
    TResult Function(_SelectWarehouse value)? selectWarehouse,
    TResult Function(_CreateWarehouse value)? createWarehouse,
    TResult Function(_UpdateWarehouse value)? updateWarehouse,
    TResult Function(_LoadStockLevels value)? loadStockLevels,
    TResult Function(_AdjustStock value)? adjustStock,
    TResult Function(_LoadMovements value)? loadMovements,
    TResult Function(_LoadBatches value)? loadBatches,
    TResult Function(_LoadAlerts value)? loadAlerts,
    TResult Function(_AcknowledgeAlert value)? acknowledgeAlert,
    TResult Function(_ResolveAlert value)? resolveAlert,
    TResult Function(_GenerateAlerts value)? generateAlerts,
    TResult Function(_LoadTransfers value)? loadTransfers,
    TResult Function(_CreateTransfer value)? createTransfer,
    TResult Function(_ApproveTransfer value)? approveTransfer,
    TResult Function(_ShipTransfer value)? shipTransfer,
    TResult Function(_ReceiveTransfer value)? receiveTransfer,
    TResult Function(_LoadInsights value)? loadInsights,
    TResult Function(_StartPhysicalCount value)? startPhysicalCount,
    required TResult orElse(),
  }) {
    if (loadWarehouses != null) {
      return loadWarehouses(this);
    }
    return orElse();
  }
}

abstract class _LoadWarehouses implements AdvancedInventoryEvent {
  const factory _LoadWarehouses() = _$LoadWarehousesImpl;
}

/// @nodoc
abstract class _$$SelectWarehouseImplCopyWith<$Res> {
  factory _$$SelectWarehouseImplCopyWith(_$SelectWarehouseImpl value,
          $Res Function(_$SelectWarehouseImpl) then) =
      __$$SelectWarehouseImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String? uuid});
}

/// @nodoc
class __$$SelectWarehouseImplCopyWithImpl<$Res>
    extends _$AdvancedInventoryEventCopyWithImpl<$Res, _$SelectWarehouseImpl>
    implements _$$SelectWarehouseImplCopyWith<$Res> {
  __$$SelectWarehouseImplCopyWithImpl(
      _$SelectWarehouseImpl _value, $Res Function(_$SelectWarehouseImpl) _then)
      : super(_value, _then);

  /// Create a copy of AdvancedInventoryEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = freezed,
  }) {
    return _then(_$SelectWarehouseImpl(
      freezed == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$SelectWarehouseImpl implements _SelectWarehouse {
  const _$SelectWarehouseImpl(this.uuid);

  @override
  final String? uuid;

  @override
  String toString() {
    return 'AdvancedInventoryEvent.selectWarehouse(uuid: $uuid)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SelectWarehouseImpl &&
            (identical(other.uuid, uuid) || other.uuid == uuid));
  }

  @override
  int get hashCode => Object.hash(runtimeType, uuid);

  /// Create a copy of AdvancedInventoryEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SelectWarehouseImplCopyWith<_$SelectWarehouseImpl> get copyWith =>
      __$$SelectWarehouseImplCopyWithImpl<_$SelectWarehouseImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? warehouseUuid) loadDashboard,
    required TResult Function() refreshDashboard,
    required TResult Function() loadWarehouses,
    required TResult Function(String? uuid) selectWarehouse,
    required TResult Function(Warehouse warehouse) createWarehouse,
    required TResult Function(Warehouse warehouse) updateWarehouse,
    required TResult Function(String? warehouseUuid, String? categoryUuid,
            String? searchQuery, bool? lowStockOnly, bool? outOfStockOnly)
        loadStockLevels,
    required TResult Function(String productUuid, String warehouseUuid,
            double quantityChange, String reason, String? notes)
        adjustStock,
    required TResult Function(String? productUuid, String? warehouseUuid,
            DateTime? startDate, DateTime? endDate)
        loadMovements,
    required TResult Function(
            String? productUuid, String? warehouseUuid, bool? expiringOnly)
        loadBatches,
    required TResult Function(AlertSeverity? severity) loadAlerts,
    required TResult Function(String uuid) acknowledgeAlert,
    required TResult Function(String uuid, String action) resolveAlert,
    required TResult Function() generateAlerts,
    required TResult Function(TransferStatus? status) loadTransfers,
    required TResult Function(AdvancedStockTransfer transfer) createTransfer,
    required TResult Function(String uuid) approveTransfer,
    required TResult Function(
            String uuid, List<AdvancedStockTransferItem> items)
        shipTransfer,
    required TResult Function(
            String uuid, List<AdvancedStockTransferItem> items)
        receiveTransfer,
    required TResult Function() loadInsights,
    required TResult Function(String warehouseUuid) startPhysicalCount,
  }) {
    return selectWarehouse(uuid);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? warehouseUuid)? loadDashboard,
    TResult? Function()? refreshDashboard,
    TResult? Function()? loadWarehouses,
    TResult? Function(String? uuid)? selectWarehouse,
    TResult? Function(Warehouse warehouse)? createWarehouse,
    TResult? Function(Warehouse warehouse)? updateWarehouse,
    TResult? Function(String? warehouseUuid, String? categoryUuid,
            String? searchQuery, bool? lowStockOnly, bool? outOfStockOnly)?
        loadStockLevels,
    TResult? Function(String productUuid, String warehouseUuid,
            double quantityChange, String reason, String? notes)?
        adjustStock,
    TResult? Function(String? productUuid, String? warehouseUuid,
            DateTime? startDate, DateTime? endDate)?
        loadMovements,
    TResult? Function(
            String? productUuid, String? warehouseUuid, bool? expiringOnly)?
        loadBatches,
    TResult? Function(AlertSeverity? severity)? loadAlerts,
    TResult? Function(String uuid)? acknowledgeAlert,
    TResult? Function(String uuid, String action)? resolveAlert,
    TResult? Function()? generateAlerts,
    TResult? Function(TransferStatus? status)? loadTransfers,
    TResult? Function(AdvancedStockTransfer transfer)? createTransfer,
    TResult? Function(String uuid)? approveTransfer,
    TResult? Function(String uuid, List<AdvancedStockTransferItem> items)?
        shipTransfer,
    TResult? Function(String uuid, List<AdvancedStockTransferItem> items)?
        receiveTransfer,
    TResult? Function()? loadInsights,
    TResult? Function(String warehouseUuid)? startPhysicalCount,
  }) {
    return selectWarehouse?.call(uuid);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? warehouseUuid)? loadDashboard,
    TResult Function()? refreshDashboard,
    TResult Function()? loadWarehouses,
    TResult Function(String? uuid)? selectWarehouse,
    TResult Function(Warehouse warehouse)? createWarehouse,
    TResult Function(Warehouse warehouse)? updateWarehouse,
    TResult Function(String? warehouseUuid, String? categoryUuid,
            String? searchQuery, bool? lowStockOnly, bool? outOfStockOnly)?
        loadStockLevels,
    TResult Function(String productUuid, String warehouseUuid,
            double quantityChange, String reason, String? notes)?
        adjustStock,
    TResult Function(String? productUuid, String? warehouseUuid,
            DateTime? startDate, DateTime? endDate)?
        loadMovements,
    TResult Function(
            String? productUuid, String? warehouseUuid, bool? expiringOnly)?
        loadBatches,
    TResult Function(AlertSeverity? severity)? loadAlerts,
    TResult Function(String uuid)? acknowledgeAlert,
    TResult Function(String uuid, String action)? resolveAlert,
    TResult Function()? generateAlerts,
    TResult Function(TransferStatus? status)? loadTransfers,
    TResult Function(AdvancedStockTransfer transfer)? createTransfer,
    TResult Function(String uuid)? approveTransfer,
    TResult Function(String uuid, List<AdvancedStockTransferItem> items)?
        shipTransfer,
    TResult Function(String uuid, List<AdvancedStockTransferItem> items)?
        receiveTransfer,
    TResult Function()? loadInsights,
    TResult Function(String warehouseUuid)? startPhysicalCount,
    required TResult orElse(),
  }) {
    if (selectWarehouse != null) {
      return selectWarehouse(uuid);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadDashboard value) loadDashboard,
    required TResult Function(_RefreshDashboard value) refreshDashboard,
    required TResult Function(_LoadWarehouses value) loadWarehouses,
    required TResult Function(_SelectWarehouse value) selectWarehouse,
    required TResult Function(_CreateWarehouse value) createWarehouse,
    required TResult Function(_UpdateWarehouse value) updateWarehouse,
    required TResult Function(_LoadStockLevels value) loadStockLevels,
    required TResult Function(_AdjustStock value) adjustStock,
    required TResult Function(_LoadMovements value) loadMovements,
    required TResult Function(_LoadBatches value) loadBatches,
    required TResult Function(_LoadAlerts value) loadAlerts,
    required TResult Function(_AcknowledgeAlert value) acknowledgeAlert,
    required TResult Function(_ResolveAlert value) resolveAlert,
    required TResult Function(_GenerateAlerts value) generateAlerts,
    required TResult Function(_LoadTransfers value) loadTransfers,
    required TResult Function(_CreateTransfer value) createTransfer,
    required TResult Function(_ApproveTransfer value) approveTransfer,
    required TResult Function(_ShipTransfer value) shipTransfer,
    required TResult Function(_ReceiveTransfer value) receiveTransfer,
    required TResult Function(_LoadInsights value) loadInsights,
    required TResult Function(_StartPhysicalCount value) startPhysicalCount,
  }) {
    return selectWarehouse(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadDashboard value)? loadDashboard,
    TResult? Function(_RefreshDashboard value)? refreshDashboard,
    TResult? Function(_LoadWarehouses value)? loadWarehouses,
    TResult? Function(_SelectWarehouse value)? selectWarehouse,
    TResult? Function(_CreateWarehouse value)? createWarehouse,
    TResult? Function(_UpdateWarehouse value)? updateWarehouse,
    TResult? Function(_LoadStockLevels value)? loadStockLevels,
    TResult? Function(_AdjustStock value)? adjustStock,
    TResult? Function(_LoadMovements value)? loadMovements,
    TResult? Function(_LoadBatches value)? loadBatches,
    TResult? Function(_LoadAlerts value)? loadAlerts,
    TResult? Function(_AcknowledgeAlert value)? acknowledgeAlert,
    TResult? Function(_ResolveAlert value)? resolveAlert,
    TResult? Function(_GenerateAlerts value)? generateAlerts,
    TResult? Function(_LoadTransfers value)? loadTransfers,
    TResult? Function(_CreateTransfer value)? createTransfer,
    TResult? Function(_ApproveTransfer value)? approveTransfer,
    TResult? Function(_ShipTransfer value)? shipTransfer,
    TResult? Function(_ReceiveTransfer value)? receiveTransfer,
    TResult? Function(_LoadInsights value)? loadInsights,
    TResult? Function(_StartPhysicalCount value)? startPhysicalCount,
  }) {
    return selectWarehouse?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadDashboard value)? loadDashboard,
    TResult Function(_RefreshDashboard value)? refreshDashboard,
    TResult Function(_LoadWarehouses value)? loadWarehouses,
    TResult Function(_SelectWarehouse value)? selectWarehouse,
    TResult Function(_CreateWarehouse value)? createWarehouse,
    TResult Function(_UpdateWarehouse value)? updateWarehouse,
    TResult Function(_LoadStockLevels value)? loadStockLevels,
    TResult Function(_AdjustStock value)? adjustStock,
    TResult Function(_LoadMovements value)? loadMovements,
    TResult Function(_LoadBatches value)? loadBatches,
    TResult Function(_LoadAlerts value)? loadAlerts,
    TResult Function(_AcknowledgeAlert value)? acknowledgeAlert,
    TResult Function(_ResolveAlert value)? resolveAlert,
    TResult Function(_GenerateAlerts value)? generateAlerts,
    TResult Function(_LoadTransfers value)? loadTransfers,
    TResult Function(_CreateTransfer value)? createTransfer,
    TResult Function(_ApproveTransfer value)? approveTransfer,
    TResult Function(_ShipTransfer value)? shipTransfer,
    TResult Function(_ReceiveTransfer value)? receiveTransfer,
    TResult Function(_LoadInsights value)? loadInsights,
    TResult Function(_StartPhysicalCount value)? startPhysicalCount,
    required TResult orElse(),
  }) {
    if (selectWarehouse != null) {
      return selectWarehouse(this);
    }
    return orElse();
  }
}

abstract class _SelectWarehouse implements AdvancedInventoryEvent {
  const factory _SelectWarehouse(final String? uuid) = _$SelectWarehouseImpl;

  String? get uuid;

  /// Create a copy of AdvancedInventoryEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SelectWarehouseImplCopyWith<_$SelectWarehouseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CreateWarehouseImplCopyWith<$Res> {
  factory _$$CreateWarehouseImplCopyWith(_$CreateWarehouseImpl value,
          $Res Function(_$CreateWarehouseImpl) then) =
      __$$CreateWarehouseImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Warehouse warehouse});

  $WarehouseCopyWith<$Res> get warehouse;
}

/// @nodoc
class __$$CreateWarehouseImplCopyWithImpl<$Res>
    extends _$AdvancedInventoryEventCopyWithImpl<$Res, _$CreateWarehouseImpl>
    implements _$$CreateWarehouseImplCopyWith<$Res> {
  __$$CreateWarehouseImplCopyWithImpl(
      _$CreateWarehouseImpl _value, $Res Function(_$CreateWarehouseImpl) _then)
      : super(_value, _then);

  /// Create a copy of AdvancedInventoryEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? warehouse = null,
  }) {
    return _then(_$CreateWarehouseImpl(
      null == warehouse
          ? _value.warehouse
          : warehouse // ignore: cast_nullable_to_non_nullable
              as Warehouse,
    ));
  }

  /// Create a copy of AdvancedInventoryEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $WarehouseCopyWith<$Res> get warehouse {
    return $WarehouseCopyWith<$Res>(_value.warehouse, (value) {
      return _then(_value.copyWith(warehouse: value));
    });
  }
}

/// @nodoc

class _$CreateWarehouseImpl implements _CreateWarehouse {
  const _$CreateWarehouseImpl(this.warehouse);

  @override
  final Warehouse warehouse;

  @override
  String toString() {
    return 'AdvancedInventoryEvent.createWarehouse(warehouse: $warehouse)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateWarehouseImpl &&
            (identical(other.warehouse, warehouse) ||
                other.warehouse == warehouse));
  }

  @override
  int get hashCode => Object.hash(runtimeType, warehouse);

  /// Create a copy of AdvancedInventoryEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateWarehouseImplCopyWith<_$CreateWarehouseImpl> get copyWith =>
      __$$CreateWarehouseImplCopyWithImpl<_$CreateWarehouseImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? warehouseUuid) loadDashboard,
    required TResult Function() refreshDashboard,
    required TResult Function() loadWarehouses,
    required TResult Function(String? uuid) selectWarehouse,
    required TResult Function(Warehouse warehouse) createWarehouse,
    required TResult Function(Warehouse warehouse) updateWarehouse,
    required TResult Function(String? warehouseUuid, String? categoryUuid,
            String? searchQuery, bool? lowStockOnly, bool? outOfStockOnly)
        loadStockLevels,
    required TResult Function(String productUuid, String warehouseUuid,
            double quantityChange, String reason, String? notes)
        adjustStock,
    required TResult Function(String? productUuid, String? warehouseUuid,
            DateTime? startDate, DateTime? endDate)
        loadMovements,
    required TResult Function(
            String? productUuid, String? warehouseUuid, bool? expiringOnly)
        loadBatches,
    required TResult Function(AlertSeverity? severity) loadAlerts,
    required TResult Function(String uuid) acknowledgeAlert,
    required TResult Function(String uuid, String action) resolveAlert,
    required TResult Function() generateAlerts,
    required TResult Function(TransferStatus? status) loadTransfers,
    required TResult Function(AdvancedStockTransfer transfer) createTransfer,
    required TResult Function(String uuid) approveTransfer,
    required TResult Function(
            String uuid, List<AdvancedStockTransferItem> items)
        shipTransfer,
    required TResult Function(
            String uuid, List<AdvancedStockTransferItem> items)
        receiveTransfer,
    required TResult Function() loadInsights,
    required TResult Function(String warehouseUuid) startPhysicalCount,
  }) {
    return createWarehouse(warehouse);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? warehouseUuid)? loadDashboard,
    TResult? Function()? refreshDashboard,
    TResult? Function()? loadWarehouses,
    TResult? Function(String? uuid)? selectWarehouse,
    TResult? Function(Warehouse warehouse)? createWarehouse,
    TResult? Function(Warehouse warehouse)? updateWarehouse,
    TResult? Function(String? warehouseUuid, String? categoryUuid,
            String? searchQuery, bool? lowStockOnly, bool? outOfStockOnly)?
        loadStockLevels,
    TResult? Function(String productUuid, String warehouseUuid,
            double quantityChange, String reason, String? notes)?
        adjustStock,
    TResult? Function(String? productUuid, String? warehouseUuid,
            DateTime? startDate, DateTime? endDate)?
        loadMovements,
    TResult? Function(
            String? productUuid, String? warehouseUuid, bool? expiringOnly)?
        loadBatches,
    TResult? Function(AlertSeverity? severity)? loadAlerts,
    TResult? Function(String uuid)? acknowledgeAlert,
    TResult? Function(String uuid, String action)? resolveAlert,
    TResult? Function()? generateAlerts,
    TResult? Function(TransferStatus? status)? loadTransfers,
    TResult? Function(AdvancedStockTransfer transfer)? createTransfer,
    TResult? Function(String uuid)? approveTransfer,
    TResult? Function(String uuid, List<AdvancedStockTransferItem> items)?
        shipTransfer,
    TResult? Function(String uuid, List<AdvancedStockTransferItem> items)?
        receiveTransfer,
    TResult? Function()? loadInsights,
    TResult? Function(String warehouseUuid)? startPhysicalCount,
  }) {
    return createWarehouse?.call(warehouse);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? warehouseUuid)? loadDashboard,
    TResult Function()? refreshDashboard,
    TResult Function()? loadWarehouses,
    TResult Function(String? uuid)? selectWarehouse,
    TResult Function(Warehouse warehouse)? createWarehouse,
    TResult Function(Warehouse warehouse)? updateWarehouse,
    TResult Function(String? warehouseUuid, String? categoryUuid,
            String? searchQuery, bool? lowStockOnly, bool? outOfStockOnly)?
        loadStockLevels,
    TResult Function(String productUuid, String warehouseUuid,
            double quantityChange, String reason, String? notes)?
        adjustStock,
    TResult Function(String? productUuid, String? warehouseUuid,
            DateTime? startDate, DateTime? endDate)?
        loadMovements,
    TResult Function(
            String? productUuid, String? warehouseUuid, bool? expiringOnly)?
        loadBatches,
    TResult Function(AlertSeverity? severity)? loadAlerts,
    TResult Function(String uuid)? acknowledgeAlert,
    TResult Function(String uuid, String action)? resolveAlert,
    TResult Function()? generateAlerts,
    TResult Function(TransferStatus? status)? loadTransfers,
    TResult Function(AdvancedStockTransfer transfer)? createTransfer,
    TResult Function(String uuid)? approveTransfer,
    TResult Function(String uuid, List<AdvancedStockTransferItem> items)?
        shipTransfer,
    TResult Function(String uuid, List<AdvancedStockTransferItem> items)?
        receiveTransfer,
    TResult Function()? loadInsights,
    TResult Function(String warehouseUuid)? startPhysicalCount,
    required TResult orElse(),
  }) {
    if (createWarehouse != null) {
      return createWarehouse(warehouse);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadDashboard value) loadDashboard,
    required TResult Function(_RefreshDashboard value) refreshDashboard,
    required TResult Function(_LoadWarehouses value) loadWarehouses,
    required TResult Function(_SelectWarehouse value) selectWarehouse,
    required TResult Function(_CreateWarehouse value) createWarehouse,
    required TResult Function(_UpdateWarehouse value) updateWarehouse,
    required TResult Function(_LoadStockLevels value) loadStockLevels,
    required TResult Function(_AdjustStock value) adjustStock,
    required TResult Function(_LoadMovements value) loadMovements,
    required TResult Function(_LoadBatches value) loadBatches,
    required TResult Function(_LoadAlerts value) loadAlerts,
    required TResult Function(_AcknowledgeAlert value) acknowledgeAlert,
    required TResult Function(_ResolveAlert value) resolveAlert,
    required TResult Function(_GenerateAlerts value) generateAlerts,
    required TResult Function(_LoadTransfers value) loadTransfers,
    required TResult Function(_CreateTransfer value) createTransfer,
    required TResult Function(_ApproveTransfer value) approveTransfer,
    required TResult Function(_ShipTransfer value) shipTransfer,
    required TResult Function(_ReceiveTransfer value) receiveTransfer,
    required TResult Function(_LoadInsights value) loadInsights,
    required TResult Function(_StartPhysicalCount value) startPhysicalCount,
  }) {
    return createWarehouse(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadDashboard value)? loadDashboard,
    TResult? Function(_RefreshDashboard value)? refreshDashboard,
    TResult? Function(_LoadWarehouses value)? loadWarehouses,
    TResult? Function(_SelectWarehouse value)? selectWarehouse,
    TResult? Function(_CreateWarehouse value)? createWarehouse,
    TResult? Function(_UpdateWarehouse value)? updateWarehouse,
    TResult? Function(_LoadStockLevels value)? loadStockLevels,
    TResult? Function(_AdjustStock value)? adjustStock,
    TResult? Function(_LoadMovements value)? loadMovements,
    TResult? Function(_LoadBatches value)? loadBatches,
    TResult? Function(_LoadAlerts value)? loadAlerts,
    TResult? Function(_AcknowledgeAlert value)? acknowledgeAlert,
    TResult? Function(_ResolveAlert value)? resolveAlert,
    TResult? Function(_GenerateAlerts value)? generateAlerts,
    TResult? Function(_LoadTransfers value)? loadTransfers,
    TResult? Function(_CreateTransfer value)? createTransfer,
    TResult? Function(_ApproveTransfer value)? approveTransfer,
    TResult? Function(_ShipTransfer value)? shipTransfer,
    TResult? Function(_ReceiveTransfer value)? receiveTransfer,
    TResult? Function(_LoadInsights value)? loadInsights,
    TResult? Function(_StartPhysicalCount value)? startPhysicalCount,
  }) {
    return createWarehouse?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadDashboard value)? loadDashboard,
    TResult Function(_RefreshDashboard value)? refreshDashboard,
    TResult Function(_LoadWarehouses value)? loadWarehouses,
    TResult Function(_SelectWarehouse value)? selectWarehouse,
    TResult Function(_CreateWarehouse value)? createWarehouse,
    TResult Function(_UpdateWarehouse value)? updateWarehouse,
    TResult Function(_LoadStockLevels value)? loadStockLevels,
    TResult Function(_AdjustStock value)? adjustStock,
    TResult Function(_LoadMovements value)? loadMovements,
    TResult Function(_LoadBatches value)? loadBatches,
    TResult Function(_LoadAlerts value)? loadAlerts,
    TResult Function(_AcknowledgeAlert value)? acknowledgeAlert,
    TResult Function(_ResolveAlert value)? resolveAlert,
    TResult Function(_GenerateAlerts value)? generateAlerts,
    TResult Function(_LoadTransfers value)? loadTransfers,
    TResult Function(_CreateTransfer value)? createTransfer,
    TResult Function(_ApproveTransfer value)? approveTransfer,
    TResult Function(_ShipTransfer value)? shipTransfer,
    TResult Function(_ReceiveTransfer value)? receiveTransfer,
    TResult Function(_LoadInsights value)? loadInsights,
    TResult Function(_StartPhysicalCount value)? startPhysicalCount,
    required TResult orElse(),
  }) {
    if (createWarehouse != null) {
      return createWarehouse(this);
    }
    return orElse();
  }
}

abstract class _CreateWarehouse implements AdvancedInventoryEvent {
  const factory _CreateWarehouse(final Warehouse warehouse) =
      _$CreateWarehouseImpl;

  Warehouse get warehouse;

  /// Create a copy of AdvancedInventoryEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateWarehouseImplCopyWith<_$CreateWarehouseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateWarehouseImplCopyWith<$Res> {
  factory _$$UpdateWarehouseImplCopyWith(_$UpdateWarehouseImpl value,
          $Res Function(_$UpdateWarehouseImpl) then) =
      __$$UpdateWarehouseImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Warehouse warehouse});

  $WarehouseCopyWith<$Res> get warehouse;
}

/// @nodoc
class __$$UpdateWarehouseImplCopyWithImpl<$Res>
    extends _$AdvancedInventoryEventCopyWithImpl<$Res, _$UpdateWarehouseImpl>
    implements _$$UpdateWarehouseImplCopyWith<$Res> {
  __$$UpdateWarehouseImplCopyWithImpl(
      _$UpdateWarehouseImpl _value, $Res Function(_$UpdateWarehouseImpl) _then)
      : super(_value, _then);

  /// Create a copy of AdvancedInventoryEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? warehouse = null,
  }) {
    return _then(_$UpdateWarehouseImpl(
      null == warehouse
          ? _value.warehouse
          : warehouse // ignore: cast_nullable_to_non_nullable
              as Warehouse,
    ));
  }

  /// Create a copy of AdvancedInventoryEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $WarehouseCopyWith<$Res> get warehouse {
    return $WarehouseCopyWith<$Res>(_value.warehouse, (value) {
      return _then(_value.copyWith(warehouse: value));
    });
  }
}

/// @nodoc

class _$UpdateWarehouseImpl implements _UpdateWarehouse {
  const _$UpdateWarehouseImpl(this.warehouse);

  @override
  final Warehouse warehouse;

  @override
  String toString() {
    return 'AdvancedInventoryEvent.updateWarehouse(warehouse: $warehouse)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateWarehouseImpl &&
            (identical(other.warehouse, warehouse) ||
                other.warehouse == warehouse));
  }

  @override
  int get hashCode => Object.hash(runtimeType, warehouse);

  /// Create a copy of AdvancedInventoryEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateWarehouseImplCopyWith<_$UpdateWarehouseImpl> get copyWith =>
      __$$UpdateWarehouseImplCopyWithImpl<_$UpdateWarehouseImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? warehouseUuid) loadDashboard,
    required TResult Function() refreshDashboard,
    required TResult Function() loadWarehouses,
    required TResult Function(String? uuid) selectWarehouse,
    required TResult Function(Warehouse warehouse) createWarehouse,
    required TResult Function(Warehouse warehouse) updateWarehouse,
    required TResult Function(String? warehouseUuid, String? categoryUuid,
            String? searchQuery, bool? lowStockOnly, bool? outOfStockOnly)
        loadStockLevels,
    required TResult Function(String productUuid, String warehouseUuid,
            double quantityChange, String reason, String? notes)
        adjustStock,
    required TResult Function(String? productUuid, String? warehouseUuid,
            DateTime? startDate, DateTime? endDate)
        loadMovements,
    required TResult Function(
            String? productUuid, String? warehouseUuid, bool? expiringOnly)
        loadBatches,
    required TResult Function(AlertSeverity? severity) loadAlerts,
    required TResult Function(String uuid) acknowledgeAlert,
    required TResult Function(String uuid, String action) resolveAlert,
    required TResult Function() generateAlerts,
    required TResult Function(TransferStatus? status) loadTransfers,
    required TResult Function(AdvancedStockTransfer transfer) createTransfer,
    required TResult Function(String uuid) approveTransfer,
    required TResult Function(
            String uuid, List<AdvancedStockTransferItem> items)
        shipTransfer,
    required TResult Function(
            String uuid, List<AdvancedStockTransferItem> items)
        receiveTransfer,
    required TResult Function() loadInsights,
    required TResult Function(String warehouseUuid) startPhysicalCount,
  }) {
    return updateWarehouse(warehouse);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? warehouseUuid)? loadDashboard,
    TResult? Function()? refreshDashboard,
    TResult? Function()? loadWarehouses,
    TResult? Function(String? uuid)? selectWarehouse,
    TResult? Function(Warehouse warehouse)? createWarehouse,
    TResult? Function(Warehouse warehouse)? updateWarehouse,
    TResult? Function(String? warehouseUuid, String? categoryUuid,
            String? searchQuery, bool? lowStockOnly, bool? outOfStockOnly)?
        loadStockLevels,
    TResult? Function(String productUuid, String warehouseUuid,
            double quantityChange, String reason, String? notes)?
        adjustStock,
    TResult? Function(String? productUuid, String? warehouseUuid,
            DateTime? startDate, DateTime? endDate)?
        loadMovements,
    TResult? Function(
            String? productUuid, String? warehouseUuid, bool? expiringOnly)?
        loadBatches,
    TResult? Function(AlertSeverity? severity)? loadAlerts,
    TResult? Function(String uuid)? acknowledgeAlert,
    TResult? Function(String uuid, String action)? resolveAlert,
    TResult? Function()? generateAlerts,
    TResult? Function(TransferStatus? status)? loadTransfers,
    TResult? Function(AdvancedStockTransfer transfer)? createTransfer,
    TResult? Function(String uuid)? approveTransfer,
    TResult? Function(String uuid, List<AdvancedStockTransferItem> items)?
        shipTransfer,
    TResult? Function(String uuid, List<AdvancedStockTransferItem> items)?
        receiveTransfer,
    TResult? Function()? loadInsights,
    TResult? Function(String warehouseUuid)? startPhysicalCount,
  }) {
    return updateWarehouse?.call(warehouse);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? warehouseUuid)? loadDashboard,
    TResult Function()? refreshDashboard,
    TResult Function()? loadWarehouses,
    TResult Function(String? uuid)? selectWarehouse,
    TResult Function(Warehouse warehouse)? createWarehouse,
    TResult Function(Warehouse warehouse)? updateWarehouse,
    TResult Function(String? warehouseUuid, String? categoryUuid,
            String? searchQuery, bool? lowStockOnly, bool? outOfStockOnly)?
        loadStockLevels,
    TResult Function(String productUuid, String warehouseUuid,
            double quantityChange, String reason, String? notes)?
        adjustStock,
    TResult Function(String? productUuid, String? warehouseUuid,
            DateTime? startDate, DateTime? endDate)?
        loadMovements,
    TResult Function(
            String? productUuid, String? warehouseUuid, bool? expiringOnly)?
        loadBatches,
    TResult Function(AlertSeverity? severity)? loadAlerts,
    TResult Function(String uuid)? acknowledgeAlert,
    TResult Function(String uuid, String action)? resolveAlert,
    TResult Function()? generateAlerts,
    TResult Function(TransferStatus? status)? loadTransfers,
    TResult Function(AdvancedStockTransfer transfer)? createTransfer,
    TResult Function(String uuid)? approveTransfer,
    TResult Function(String uuid, List<AdvancedStockTransferItem> items)?
        shipTransfer,
    TResult Function(String uuid, List<AdvancedStockTransferItem> items)?
        receiveTransfer,
    TResult Function()? loadInsights,
    TResult Function(String warehouseUuid)? startPhysicalCount,
    required TResult orElse(),
  }) {
    if (updateWarehouse != null) {
      return updateWarehouse(warehouse);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadDashboard value) loadDashboard,
    required TResult Function(_RefreshDashboard value) refreshDashboard,
    required TResult Function(_LoadWarehouses value) loadWarehouses,
    required TResult Function(_SelectWarehouse value) selectWarehouse,
    required TResult Function(_CreateWarehouse value) createWarehouse,
    required TResult Function(_UpdateWarehouse value) updateWarehouse,
    required TResult Function(_LoadStockLevels value) loadStockLevels,
    required TResult Function(_AdjustStock value) adjustStock,
    required TResult Function(_LoadMovements value) loadMovements,
    required TResult Function(_LoadBatches value) loadBatches,
    required TResult Function(_LoadAlerts value) loadAlerts,
    required TResult Function(_AcknowledgeAlert value) acknowledgeAlert,
    required TResult Function(_ResolveAlert value) resolveAlert,
    required TResult Function(_GenerateAlerts value) generateAlerts,
    required TResult Function(_LoadTransfers value) loadTransfers,
    required TResult Function(_CreateTransfer value) createTransfer,
    required TResult Function(_ApproveTransfer value) approveTransfer,
    required TResult Function(_ShipTransfer value) shipTransfer,
    required TResult Function(_ReceiveTransfer value) receiveTransfer,
    required TResult Function(_LoadInsights value) loadInsights,
    required TResult Function(_StartPhysicalCount value) startPhysicalCount,
  }) {
    return updateWarehouse(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadDashboard value)? loadDashboard,
    TResult? Function(_RefreshDashboard value)? refreshDashboard,
    TResult? Function(_LoadWarehouses value)? loadWarehouses,
    TResult? Function(_SelectWarehouse value)? selectWarehouse,
    TResult? Function(_CreateWarehouse value)? createWarehouse,
    TResult? Function(_UpdateWarehouse value)? updateWarehouse,
    TResult? Function(_LoadStockLevels value)? loadStockLevels,
    TResult? Function(_AdjustStock value)? adjustStock,
    TResult? Function(_LoadMovements value)? loadMovements,
    TResult? Function(_LoadBatches value)? loadBatches,
    TResult? Function(_LoadAlerts value)? loadAlerts,
    TResult? Function(_AcknowledgeAlert value)? acknowledgeAlert,
    TResult? Function(_ResolveAlert value)? resolveAlert,
    TResult? Function(_GenerateAlerts value)? generateAlerts,
    TResult? Function(_LoadTransfers value)? loadTransfers,
    TResult? Function(_CreateTransfer value)? createTransfer,
    TResult? Function(_ApproveTransfer value)? approveTransfer,
    TResult? Function(_ShipTransfer value)? shipTransfer,
    TResult? Function(_ReceiveTransfer value)? receiveTransfer,
    TResult? Function(_LoadInsights value)? loadInsights,
    TResult? Function(_StartPhysicalCount value)? startPhysicalCount,
  }) {
    return updateWarehouse?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadDashboard value)? loadDashboard,
    TResult Function(_RefreshDashboard value)? refreshDashboard,
    TResult Function(_LoadWarehouses value)? loadWarehouses,
    TResult Function(_SelectWarehouse value)? selectWarehouse,
    TResult Function(_CreateWarehouse value)? createWarehouse,
    TResult Function(_UpdateWarehouse value)? updateWarehouse,
    TResult Function(_LoadStockLevels value)? loadStockLevels,
    TResult Function(_AdjustStock value)? adjustStock,
    TResult Function(_LoadMovements value)? loadMovements,
    TResult Function(_LoadBatches value)? loadBatches,
    TResult Function(_LoadAlerts value)? loadAlerts,
    TResult Function(_AcknowledgeAlert value)? acknowledgeAlert,
    TResult Function(_ResolveAlert value)? resolveAlert,
    TResult Function(_GenerateAlerts value)? generateAlerts,
    TResult Function(_LoadTransfers value)? loadTransfers,
    TResult Function(_CreateTransfer value)? createTransfer,
    TResult Function(_ApproveTransfer value)? approveTransfer,
    TResult Function(_ShipTransfer value)? shipTransfer,
    TResult Function(_ReceiveTransfer value)? receiveTransfer,
    TResult Function(_LoadInsights value)? loadInsights,
    TResult Function(_StartPhysicalCount value)? startPhysicalCount,
    required TResult orElse(),
  }) {
    if (updateWarehouse != null) {
      return updateWarehouse(this);
    }
    return orElse();
  }
}

abstract class _UpdateWarehouse implements AdvancedInventoryEvent {
  const factory _UpdateWarehouse(final Warehouse warehouse) =
      _$UpdateWarehouseImpl;

  Warehouse get warehouse;

  /// Create a copy of AdvancedInventoryEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateWarehouseImplCopyWith<_$UpdateWarehouseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadStockLevelsImplCopyWith<$Res> {
  factory _$$LoadStockLevelsImplCopyWith(_$LoadStockLevelsImpl value,
          $Res Function(_$LoadStockLevelsImpl) then) =
      __$$LoadStockLevelsImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {String? warehouseUuid,
      String? categoryUuid,
      String? searchQuery,
      bool? lowStockOnly,
      bool? outOfStockOnly});
}

/// @nodoc
class __$$LoadStockLevelsImplCopyWithImpl<$Res>
    extends _$AdvancedInventoryEventCopyWithImpl<$Res, _$LoadStockLevelsImpl>
    implements _$$LoadStockLevelsImplCopyWith<$Res> {
  __$$LoadStockLevelsImplCopyWithImpl(
      _$LoadStockLevelsImpl _value, $Res Function(_$LoadStockLevelsImpl) _then)
      : super(_value, _then);

  /// Create a copy of AdvancedInventoryEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? warehouseUuid = freezed,
    Object? categoryUuid = freezed,
    Object? searchQuery = freezed,
    Object? lowStockOnly = freezed,
    Object? outOfStockOnly = freezed,
  }) {
    return _then(_$LoadStockLevelsImpl(
      warehouseUuid: freezed == warehouseUuid
          ? _value.warehouseUuid
          : warehouseUuid // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryUuid: freezed == categoryUuid
          ? _value.categoryUuid
          : categoryUuid // ignore: cast_nullable_to_non_nullable
              as String?,
      searchQuery: freezed == searchQuery
          ? _value.searchQuery
          : searchQuery // ignore: cast_nullable_to_non_nullable
              as String?,
      lowStockOnly: freezed == lowStockOnly
          ? _value.lowStockOnly
          : lowStockOnly // ignore: cast_nullable_to_non_nullable
              as bool?,
      outOfStockOnly: freezed == outOfStockOnly
          ? _value.outOfStockOnly
          : outOfStockOnly // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc

class _$LoadStockLevelsImpl implements _LoadStockLevels {
  const _$LoadStockLevelsImpl(
      {this.warehouseUuid,
      this.categoryUuid,
      this.searchQuery,
      this.lowStockOnly,
      this.outOfStockOnly});

  @override
  final String? warehouseUuid;
  @override
  final String? categoryUuid;
  @override
  final String? searchQuery;
  @override
  final bool? lowStockOnly;
  @override
  final bool? outOfStockOnly;

  @override
  String toString() {
    return 'AdvancedInventoryEvent.loadStockLevels(warehouseUuid: $warehouseUuid, categoryUuid: $categoryUuid, searchQuery: $searchQuery, lowStockOnly: $lowStockOnly, outOfStockOnly: $outOfStockOnly)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadStockLevelsImpl &&
            (identical(other.warehouseUuid, warehouseUuid) ||
                other.warehouseUuid == warehouseUuid) &&
            (identical(other.categoryUuid, categoryUuid) ||
                other.categoryUuid == categoryUuid) &&
            (identical(other.searchQuery, searchQuery) ||
                other.searchQuery == searchQuery) &&
            (identical(other.lowStockOnly, lowStockOnly) ||
                other.lowStockOnly == lowStockOnly) &&
            (identical(other.outOfStockOnly, outOfStockOnly) ||
                other.outOfStockOnly == outOfStockOnly));
  }

  @override
  int get hashCode => Object.hash(runtimeType, warehouseUuid, categoryUuid,
      searchQuery, lowStockOnly, outOfStockOnly);

  /// Create a copy of AdvancedInventoryEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadStockLevelsImplCopyWith<_$LoadStockLevelsImpl> get copyWith =>
      __$$LoadStockLevelsImplCopyWithImpl<_$LoadStockLevelsImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? warehouseUuid) loadDashboard,
    required TResult Function() refreshDashboard,
    required TResult Function() loadWarehouses,
    required TResult Function(String? uuid) selectWarehouse,
    required TResult Function(Warehouse warehouse) createWarehouse,
    required TResult Function(Warehouse warehouse) updateWarehouse,
    required TResult Function(String? warehouseUuid, String? categoryUuid,
            String? searchQuery, bool? lowStockOnly, bool? outOfStockOnly)
        loadStockLevels,
    required TResult Function(String productUuid, String warehouseUuid,
            double quantityChange, String reason, String? notes)
        adjustStock,
    required TResult Function(String? productUuid, String? warehouseUuid,
            DateTime? startDate, DateTime? endDate)
        loadMovements,
    required TResult Function(
            String? productUuid, String? warehouseUuid, bool? expiringOnly)
        loadBatches,
    required TResult Function(AlertSeverity? severity) loadAlerts,
    required TResult Function(String uuid) acknowledgeAlert,
    required TResult Function(String uuid, String action) resolveAlert,
    required TResult Function() generateAlerts,
    required TResult Function(TransferStatus? status) loadTransfers,
    required TResult Function(AdvancedStockTransfer transfer) createTransfer,
    required TResult Function(String uuid) approveTransfer,
    required TResult Function(
            String uuid, List<AdvancedStockTransferItem> items)
        shipTransfer,
    required TResult Function(
            String uuid, List<AdvancedStockTransferItem> items)
        receiveTransfer,
    required TResult Function() loadInsights,
    required TResult Function(String warehouseUuid) startPhysicalCount,
  }) {
    return loadStockLevels(
        warehouseUuid, categoryUuid, searchQuery, lowStockOnly, outOfStockOnly);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? warehouseUuid)? loadDashboard,
    TResult? Function()? refreshDashboard,
    TResult? Function()? loadWarehouses,
    TResult? Function(String? uuid)? selectWarehouse,
    TResult? Function(Warehouse warehouse)? createWarehouse,
    TResult? Function(Warehouse warehouse)? updateWarehouse,
    TResult? Function(String? warehouseUuid, String? categoryUuid,
            String? searchQuery, bool? lowStockOnly, bool? outOfStockOnly)?
        loadStockLevels,
    TResult? Function(String productUuid, String warehouseUuid,
            double quantityChange, String reason, String? notes)?
        adjustStock,
    TResult? Function(String? productUuid, String? warehouseUuid,
            DateTime? startDate, DateTime? endDate)?
        loadMovements,
    TResult? Function(
            String? productUuid, String? warehouseUuid, bool? expiringOnly)?
        loadBatches,
    TResult? Function(AlertSeverity? severity)? loadAlerts,
    TResult? Function(String uuid)? acknowledgeAlert,
    TResult? Function(String uuid, String action)? resolveAlert,
    TResult? Function()? generateAlerts,
    TResult? Function(TransferStatus? status)? loadTransfers,
    TResult? Function(AdvancedStockTransfer transfer)? createTransfer,
    TResult? Function(String uuid)? approveTransfer,
    TResult? Function(String uuid, List<AdvancedStockTransferItem> items)?
        shipTransfer,
    TResult? Function(String uuid, List<AdvancedStockTransferItem> items)?
        receiveTransfer,
    TResult? Function()? loadInsights,
    TResult? Function(String warehouseUuid)? startPhysicalCount,
  }) {
    return loadStockLevels?.call(
        warehouseUuid, categoryUuid, searchQuery, lowStockOnly, outOfStockOnly);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? warehouseUuid)? loadDashboard,
    TResult Function()? refreshDashboard,
    TResult Function()? loadWarehouses,
    TResult Function(String? uuid)? selectWarehouse,
    TResult Function(Warehouse warehouse)? createWarehouse,
    TResult Function(Warehouse warehouse)? updateWarehouse,
    TResult Function(String? warehouseUuid, String? categoryUuid,
            String? searchQuery, bool? lowStockOnly, bool? outOfStockOnly)?
        loadStockLevels,
    TResult Function(String productUuid, String warehouseUuid,
            double quantityChange, String reason, String? notes)?
        adjustStock,
    TResult Function(String? productUuid, String? warehouseUuid,
            DateTime? startDate, DateTime? endDate)?
        loadMovements,
    TResult Function(
            String? productUuid, String? warehouseUuid, bool? expiringOnly)?
        loadBatches,
    TResult Function(AlertSeverity? severity)? loadAlerts,
    TResult Function(String uuid)? acknowledgeAlert,
    TResult Function(String uuid, String action)? resolveAlert,
    TResult Function()? generateAlerts,
    TResult Function(TransferStatus? status)? loadTransfers,
    TResult Function(AdvancedStockTransfer transfer)? createTransfer,
    TResult Function(String uuid)? approveTransfer,
    TResult Function(String uuid, List<AdvancedStockTransferItem> items)?
        shipTransfer,
    TResult Function(String uuid, List<AdvancedStockTransferItem> items)?
        receiveTransfer,
    TResult Function()? loadInsights,
    TResult Function(String warehouseUuid)? startPhysicalCount,
    required TResult orElse(),
  }) {
    if (loadStockLevels != null) {
      return loadStockLevels(warehouseUuid, categoryUuid, searchQuery,
          lowStockOnly, outOfStockOnly);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadDashboard value) loadDashboard,
    required TResult Function(_RefreshDashboard value) refreshDashboard,
    required TResult Function(_LoadWarehouses value) loadWarehouses,
    required TResult Function(_SelectWarehouse value) selectWarehouse,
    required TResult Function(_CreateWarehouse value) createWarehouse,
    required TResult Function(_UpdateWarehouse value) updateWarehouse,
    required TResult Function(_LoadStockLevels value) loadStockLevels,
    required TResult Function(_AdjustStock value) adjustStock,
    required TResult Function(_LoadMovements value) loadMovements,
    required TResult Function(_LoadBatches value) loadBatches,
    required TResult Function(_LoadAlerts value) loadAlerts,
    required TResult Function(_AcknowledgeAlert value) acknowledgeAlert,
    required TResult Function(_ResolveAlert value) resolveAlert,
    required TResult Function(_GenerateAlerts value) generateAlerts,
    required TResult Function(_LoadTransfers value) loadTransfers,
    required TResult Function(_CreateTransfer value) createTransfer,
    required TResult Function(_ApproveTransfer value) approveTransfer,
    required TResult Function(_ShipTransfer value) shipTransfer,
    required TResult Function(_ReceiveTransfer value) receiveTransfer,
    required TResult Function(_LoadInsights value) loadInsights,
    required TResult Function(_StartPhysicalCount value) startPhysicalCount,
  }) {
    return loadStockLevels(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadDashboard value)? loadDashboard,
    TResult? Function(_RefreshDashboard value)? refreshDashboard,
    TResult? Function(_LoadWarehouses value)? loadWarehouses,
    TResult? Function(_SelectWarehouse value)? selectWarehouse,
    TResult? Function(_CreateWarehouse value)? createWarehouse,
    TResult? Function(_UpdateWarehouse value)? updateWarehouse,
    TResult? Function(_LoadStockLevels value)? loadStockLevels,
    TResult? Function(_AdjustStock value)? adjustStock,
    TResult? Function(_LoadMovements value)? loadMovements,
    TResult? Function(_LoadBatches value)? loadBatches,
    TResult? Function(_LoadAlerts value)? loadAlerts,
    TResult? Function(_AcknowledgeAlert value)? acknowledgeAlert,
    TResult? Function(_ResolveAlert value)? resolveAlert,
    TResult? Function(_GenerateAlerts value)? generateAlerts,
    TResult? Function(_LoadTransfers value)? loadTransfers,
    TResult? Function(_CreateTransfer value)? createTransfer,
    TResult? Function(_ApproveTransfer value)? approveTransfer,
    TResult? Function(_ShipTransfer value)? shipTransfer,
    TResult? Function(_ReceiveTransfer value)? receiveTransfer,
    TResult? Function(_LoadInsights value)? loadInsights,
    TResult? Function(_StartPhysicalCount value)? startPhysicalCount,
  }) {
    return loadStockLevels?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadDashboard value)? loadDashboard,
    TResult Function(_RefreshDashboard value)? refreshDashboard,
    TResult Function(_LoadWarehouses value)? loadWarehouses,
    TResult Function(_SelectWarehouse value)? selectWarehouse,
    TResult Function(_CreateWarehouse value)? createWarehouse,
    TResult Function(_UpdateWarehouse value)? updateWarehouse,
    TResult Function(_LoadStockLevels value)? loadStockLevels,
    TResult Function(_AdjustStock value)? adjustStock,
    TResult Function(_LoadMovements value)? loadMovements,
    TResult Function(_LoadBatches value)? loadBatches,
    TResult Function(_LoadAlerts value)? loadAlerts,
    TResult Function(_AcknowledgeAlert value)? acknowledgeAlert,
    TResult Function(_ResolveAlert value)? resolveAlert,
    TResult Function(_GenerateAlerts value)? generateAlerts,
    TResult Function(_LoadTransfers value)? loadTransfers,
    TResult Function(_CreateTransfer value)? createTransfer,
    TResult Function(_ApproveTransfer value)? approveTransfer,
    TResult Function(_ShipTransfer value)? shipTransfer,
    TResult Function(_ReceiveTransfer value)? receiveTransfer,
    TResult Function(_LoadInsights value)? loadInsights,
    TResult Function(_StartPhysicalCount value)? startPhysicalCount,
    required TResult orElse(),
  }) {
    if (loadStockLevels != null) {
      return loadStockLevels(this);
    }
    return orElse();
  }
}

abstract class _LoadStockLevels implements AdvancedInventoryEvent {
  const factory _LoadStockLevels(
      {final String? warehouseUuid,
      final String? categoryUuid,
      final String? searchQuery,
      final bool? lowStockOnly,
      final bool? outOfStockOnly}) = _$LoadStockLevelsImpl;

  String? get warehouseUuid;
  String? get categoryUuid;
  String? get searchQuery;
  bool? get lowStockOnly;
  bool? get outOfStockOnly;

  /// Create a copy of AdvancedInventoryEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadStockLevelsImplCopyWith<_$LoadStockLevelsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AdjustStockImplCopyWith<$Res> {
  factory _$$AdjustStockImplCopyWith(
          _$AdjustStockImpl value, $Res Function(_$AdjustStockImpl) then) =
      __$$AdjustStockImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {String productUuid,
      String warehouseUuid,
      double quantityChange,
      String reason,
      String? notes});
}

/// @nodoc
class __$$AdjustStockImplCopyWithImpl<$Res>
    extends _$AdvancedInventoryEventCopyWithImpl<$Res, _$AdjustStockImpl>
    implements _$$AdjustStockImplCopyWith<$Res> {
  __$$AdjustStockImplCopyWithImpl(
      _$AdjustStockImpl _value, $Res Function(_$AdjustStockImpl) _then)
      : super(_value, _then);

  /// Create a copy of AdvancedInventoryEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productUuid = null,
    Object? warehouseUuid = null,
    Object? quantityChange = null,
    Object? reason = null,
    Object? notes = freezed,
  }) {
    return _then(_$AdjustStockImpl(
      productUuid: null == productUuid
          ? _value.productUuid
          : productUuid // ignore: cast_nullable_to_non_nullable
              as String,
      warehouseUuid: null == warehouseUuid
          ? _value.warehouseUuid
          : warehouseUuid // ignore: cast_nullable_to_non_nullable
              as String,
      quantityChange: null == quantityChange
          ? _value.quantityChange
          : quantityChange // ignore: cast_nullable_to_non_nullable
              as double,
      reason: null == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$AdjustStockImpl implements _AdjustStock {
  const _$AdjustStockImpl(
      {required this.productUuid,
      required this.warehouseUuid,
      required this.quantityChange,
      required this.reason,
      this.notes});

  @override
  final String productUuid;
  @override
  final String warehouseUuid;
  @override
  final double quantityChange;
  @override
  final String reason;
  @override
  final String? notes;

  @override
  String toString() {
    return 'AdvancedInventoryEvent.adjustStock(productUuid: $productUuid, warehouseUuid: $warehouseUuid, quantityChange: $quantityChange, reason: $reason, notes: $notes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AdjustStockImpl &&
            (identical(other.productUuid, productUuid) ||
                other.productUuid == productUuid) &&
            (identical(other.warehouseUuid, warehouseUuid) ||
                other.warehouseUuid == warehouseUuid) &&
            (identical(other.quantityChange, quantityChange) ||
                other.quantityChange == quantityChange) &&
            (identical(other.reason, reason) || other.reason == reason) &&
            (identical(other.notes, notes) || other.notes == notes));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, productUuid, warehouseUuid, quantityChange, reason, notes);

  /// Create a copy of AdvancedInventoryEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AdjustStockImplCopyWith<_$AdjustStockImpl> get copyWith =>
      __$$AdjustStockImplCopyWithImpl<_$AdjustStockImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? warehouseUuid) loadDashboard,
    required TResult Function() refreshDashboard,
    required TResult Function() loadWarehouses,
    required TResult Function(String? uuid) selectWarehouse,
    required TResult Function(Warehouse warehouse) createWarehouse,
    required TResult Function(Warehouse warehouse) updateWarehouse,
    required TResult Function(String? warehouseUuid, String? categoryUuid,
            String? searchQuery, bool? lowStockOnly, bool? outOfStockOnly)
        loadStockLevels,
    required TResult Function(String productUuid, String warehouseUuid,
            double quantityChange, String reason, String? notes)
        adjustStock,
    required TResult Function(String? productUuid, String? warehouseUuid,
            DateTime? startDate, DateTime? endDate)
        loadMovements,
    required TResult Function(
            String? productUuid, String? warehouseUuid, bool? expiringOnly)
        loadBatches,
    required TResult Function(AlertSeverity? severity) loadAlerts,
    required TResult Function(String uuid) acknowledgeAlert,
    required TResult Function(String uuid, String action) resolveAlert,
    required TResult Function() generateAlerts,
    required TResult Function(TransferStatus? status) loadTransfers,
    required TResult Function(AdvancedStockTransfer transfer) createTransfer,
    required TResult Function(String uuid) approveTransfer,
    required TResult Function(
            String uuid, List<AdvancedStockTransferItem> items)
        shipTransfer,
    required TResult Function(
            String uuid, List<AdvancedStockTransferItem> items)
        receiveTransfer,
    required TResult Function() loadInsights,
    required TResult Function(String warehouseUuid) startPhysicalCount,
  }) {
    return adjustStock(
        productUuid, warehouseUuid, quantityChange, reason, notes);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? warehouseUuid)? loadDashboard,
    TResult? Function()? refreshDashboard,
    TResult? Function()? loadWarehouses,
    TResult? Function(String? uuid)? selectWarehouse,
    TResult? Function(Warehouse warehouse)? createWarehouse,
    TResult? Function(Warehouse warehouse)? updateWarehouse,
    TResult? Function(String? warehouseUuid, String? categoryUuid,
            String? searchQuery, bool? lowStockOnly, bool? outOfStockOnly)?
        loadStockLevels,
    TResult? Function(String productUuid, String warehouseUuid,
            double quantityChange, String reason, String? notes)?
        adjustStock,
    TResult? Function(String? productUuid, String? warehouseUuid,
            DateTime? startDate, DateTime? endDate)?
        loadMovements,
    TResult? Function(
            String? productUuid, String? warehouseUuid, bool? expiringOnly)?
        loadBatches,
    TResult? Function(AlertSeverity? severity)? loadAlerts,
    TResult? Function(String uuid)? acknowledgeAlert,
    TResult? Function(String uuid, String action)? resolveAlert,
    TResult? Function()? generateAlerts,
    TResult? Function(TransferStatus? status)? loadTransfers,
    TResult? Function(AdvancedStockTransfer transfer)? createTransfer,
    TResult? Function(String uuid)? approveTransfer,
    TResult? Function(String uuid, List<AdvancedStockTransferItem> items)?
        shipTransfer,
    TResult? Function(String uuid, List<AdvancedStockTransferItem> items)?
        receiveTransfer,
    TResult? Function()? loadInsights,
    TResult? Function(String warehouseUuid)? startPhysicalCount,
  }) {
    return adjustStock?.call(
        productUuid, warehouseUuid, quantityChange, reason, notes);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? warehouseUuid)? loadDashboard,
    TResult Function()? refreshDashboard,
    TResult Function()? loadWarehouses,
    TResult Function(String? uuid)? selectWarehouse,
    TResult Function(Warehouse warehouse)? createWarehouse,
    TResult Function(Warehouse warehouse)? updateWarehouse,
    TResult Function(String? warehouseUuid, String? categoryUuid,
            String? searchQuery, bool? lowStockOnly, bool? outOfStockOnly)?
        loadStockLevels,
    TResult Function(String productUuid, String warehouseUuid,
            double quantityChange, String reason, String? notes)?
        adjustStock,
    TResult Function(String? productUuid, String? warehouseUuid,
            DateTime? startDate, DateTime? endDate)?
        loadMovements,
    TResult Function(
            String? productUuid, String? warehouseUuid, bool? expiringOnly)?
        loadBatches,
    TResult Function(AlertSeverity? severity)? loadAlerts,
    TResult Function(String uuid)? acknowledgeAlert,
    TResult Function(String uuid, String action)? resolveAlert,
    TResult Function()? generateAlerts,
    TResult Function(TransferStatus? status)? loadTransfers,
    TResult Function(AdvancedStockTransfer transfer)? createTransfer,
    TResult Function(String uuid)? approveTransfer,
    TResult Function(String uuid, List<AdvancedStockTransferItem> items)?
        shipTransfer,
    TResult Function(String uuid, List<AdvancedStockTransferItem> items)?
        receiveTransfer,
    TResult Function()? loadInsights,
    TResult Function(String warehouseUuid)? startPhysicalCount,
    required TResult orElse(),
  }) {
    if (adjustStock != null) {
      return adjustStock(
          productUuid, warehouseUuid, quantityChange, reason, notes);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadDashboard value) loadDashboard,
    required TResult Function(_RefreshDashboard value) refreshDashboard,
    required TResult Function(_LoadWarehouses value) loadWarehouses,
    required TResult Function(_SelectWarehouse value) selectWarehouse,
    required TResult Function(_CreateWarehouse value) createWarehouse,
    required TResult Function(_UpdateWarehouse value) updateWarehouse,
    required TResult Function(_LoadStockLevels value) loadStockLevels,
    required TResult Function(_AdjustStock value) adjustStock,
    required TResult Function(_LoadMovements value) loadMovements,
    required TResult Function(_LoadBatches value) loadBatches,
    required TResult Function(_LoadAlerts value) loadAlerts,
    required TResult Function(_AcknowledgeAlert value) acknowledgeAlert,
    required TResult Function(_ResolveAlert value) resolveAlert,
    required TResult Function(_GenerateAlerts value) generateAlerts,
    required TResult Function(_LoadTransfers value) loadTransfers,
    required TResult Function(_CreateTransfer value) createTransfer,
    required TResult Function(_ApproveTransfer value) approveTransfer,
    required TResult Function(_ShipTransfer value) shipTransfer,
    required TResult Function(_ReceiveTransfer value) receiveTransfer,
    required TResult Function(_LoadInsights value) loadInsights,
    required TResult Function(_StartPhysicalCount value) startPhysicalCount,
  }) {
    return adjustStock(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadDashboard value)? loadDashboard,
    TResult? Function(_RefreshDashboard value)? refreshDashboard,
    TResult? Function(_LoadWarehouses value)? loadWarehouses,
    TResult? Function(_SelectWarehouse value)? selectWarehouse,
    TResult? Function(_CreateWarehouse value)? createWarehouse,
    TResult? Function(_UpdateWarehouse value)? updateWarehouse,
    TResult? Function(_LoadStockLevels value)? loadStockLevels,
    TResult? Function(_AdjustStock value)? adjustStock,
    TResult? Function(_LoadMovements value)? loadMovements,
    TResult? Function(_LoadBatches value)? loadBatches,
    TResult? Function(_LoadAlerts value)? loadAlerts,
    TResult? Function(_AcknowledgeAlert value)? acknowledgeAlert,
    TResult? Function(_ResolveAlert value)? resolveAlert,
    TResult? Function(_GenerateAlerts value)? generateAlerts,
    TResult? Function(_LoadTransfers value)? loadTransfers,
    TResult? Function(_CreateTransfer value)? createTransfer,
    TResult? Function(_ApproveTransfer value)? approveTransfer,
    TResult? Function(_ShipTransfer value)? shipTransfer,
    TResult? Function(_ReceiveTransfer value)? receiveTransfer,
    TResult? Function(_LoadInsights value)? loadInsights,
    TResult? Function(_StartPhysicalCount value)? startPhysicalCount,
  }) {
    return adjustStock?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadDashboard value)? loadDashboard,
    TResult Function(_RefreshDashboard value)? refreshDashboard,
    TResult Function(_LoadWarehouses value)? loadWarehouses,
    TResult Function(_SelectWarehouse value)? selectWarehouse,
    TResult Function(_CreateWarehouse value)? createWarehouse,
    TResult Function(_UpdateWarehouse value)? updateWarehouse,
    TResult Function(_LoadStockLevels value)? loadStockLevels,
    TResult Function(_AdjustStock value)? adjustStock,
    TResult Function(_LoadMovements value)? loadMovements,
    TResult Function(_LoadBatches value)? loadBatches,
    TResult Function(_LoadAlerts value)? loadAlerts,
    TResult Function(_AcknowledgeAlert value)? acknowledgeAlert,
    TResult Function(_ResolveAlert value)? resolveAlert,
    TResult Function(_GenerateAlerts value)? generateAlerts,
    TResult Function(_LoadTransfers value)? loadTransfers,
    TResult Function(_CreateTransfer value)? createTransfer,
    TResult Function(_ApproveTransfer value)? approveTransfer,
    TResult Function(_ShipTransfer value)? shipTransfer,
    TResult Function(_ReceiveTransfer value)? receiveTransfer,
    TResult Function(_LoadInsights value)? loadInsights,
    TResult Function(_StartPhysicalCount value)? startPhysicalCount,
    required TResult orElse(),
  }) {
    if (adjustStock != null) {
      return adjustStock(this);
    }
    return orElse();
  }
}

abstract class _AdjustStock implements AdvancedInventoryEvent {
  const factory _AdjustStock(
      {required final String productUuid,
      required final String warehouseUuid,
      required final double quantityChange,
      required final String reason,
      final String? notes}) = _$AdjustStockImpl;

  String get productUuid;
  String get warehouseUuid;
  double get quantityChange;
  String get reason;
  String? get notes;

  /// Create a copy of AdvancedInventoryEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AdjustStockImplCopyWith<_$AdjustStockImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadMovementsImplCopyWith<$Res> {
  factory _$$LoadMovementsImplCopyWith(
          _$LoadMovementsImpl value, $Res Function(_$LoadMovementsImpl) then) =
      __$$LoadMovementsImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {String? productUuid,
      String? warehouseUuid,
      DateTime? startDate,
      DateTime? endDate});
}

/// @nodoc
class __$$LoadMovementsImplCopyWithImpl<$Res>
    extends _$AdvancedInventoryEventCopyWithImpl<$Res, _$LoadMovementsImpl>
    implements _$$LoadMovementsImplCopyWith<$Res> {
  __$$LoadMovementsImplCopyWithImpl(
      _$LoadMovementsImpl _value, $Res Function(_$LoadMovementsImpl) _then)
      : super(_value, _then);

  /// Create a copy of AdvancedInventoryEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productUuid = freezed,
    Object? warehouseUuid = freezed,
    Object? startDate = freezed,
    Object? endDate = freezed,
  }) {
    return _then(_$LoadMovementsImpl(
      productUuid: freezed == productUuid
          ? _value.productUuid
          : productUuid // ignore: cast_nullable_to_non_nullable
              as String?,
      warehouseUuid: freezed == warehouseUuid
          ? _value.warehouseUuid
          : warehouseUuid // ignore: cast_nullable_to_non_nullable
              as String?,
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc

class _$LoadMovementsImpl implements _LoadMovements {
  const _$LoadMovementsImpl(
      {this.productUuid, this.warehouseUuid, this.startDate, this.endDate});

  @override
  final String? productUuid;
  @override
  final String? warehouseUuid;
  @override
  final DateTime? startDate;
  @override
  final DateTime? endDate;

  @override
  String toString() {
    return 'AdvancedInventoryEvent.loadMovements(productUuid: $productUuid, warehouseUuid: $warehouseUuid, startDate: $startDate, endDate: $endDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadMovementsImpl &&
            (identical(other.productUuid, productUuid) ||
                other.productUuid == productUuid) &&
            (identical(other.warehouseUuid, warehouseUuid) ||
                other.warehouseUuid == warehouseUuid) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, productUuid, warehouseUuid, startDate, endDate);

  /// Create a copy of AdvancedInventoryEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadMovementsImplCopyWith<_$LoadMovementsImpl> get copyWith =>
      __$$LoadMovementsImplCopyWithImpl<_$LoadMovementsImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? warehouseUuid) loadDashboard,
    required TResult Function() refreshDashboard,
    required TResult Function() loadWarehouses,
    required TResult Function(String? uuid) selectWarehouse,
    required TResult Function(Warehouse warehouse) createWarehouse,
    required TResult Function(Warehouse warehouse) updateWarehouse,
    required TResult Function(String? warehouseUuid, String? categoryUuid,
            String? searchQuery, bool? lowStockOnly, bool? outOfStockOnly)
        loadStockLevels,
    required TResult Function(String productUuid, String warehouseUuid,
            double quantityChange, String reason, String? notes)
        adjustStock,
    required TResult Function(String? productUuid, String? warehouseUuid,
            DateTime? startDate, DateTime? endDate)
        loadMovements,
    required TResult Function(
            String? productUuid, String? warehouseUuid, bool? expiringOnly)
        loadBatches,
    required TResult Function(AlertSeverity? severity) loadAlerts,
    required TResult Function(String uuid) acknowledgeAlert,
    required TResult Function(String uuid, String action) resolveAlert,
    required TResult Function() generateAlerts,
    required TResult Function(TransferStatus? status) loadTransfers,
    required TResult Function(AdvancedStockTransfer transfer) createTransfer,
    required TResult Function(String uuid) approveTransfer,
    required TResult Function(
            String uuid, List<AdvancedStockTransferItem> items)
        shipTransfer,
    required TResult Function(
            String uuid, List<AdvancedStockTransferItem> items)
        receiveTransfer,
    required TResult Function() loadInsights,
    required TResult Function(String warehouseUuid) startPhysicalCount,
  }) {
    return loadMovements(productUuid, warehouseUuid, startDate, endDate);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? warehouseUuid)? loadDashboard,
    TResult? Function()? refreshDashboard,
    TResult? Function()? loadWarehouses,
    TResult? Function(String? uuid)? selectWarehouse,
    TResult? Function(Warehouse warehouse)? createWarehouse,
    TResult? Function(Warehouse warehouse)? updateWarehouse,
    TResult? Function(String? warehouseUuid, String? categoryUuid,
            String? searchQuery, bool? lowStockOnly, bool? outOfStockOnly)?
        loadStockLevels,
    TResult? Function(String productUuid, String warehouseUuid,
            double quantityChange, String reason, String? notes)?
        adjustStock,
    TResult? Function(String? productUuid, String? warehouseUuid,
            DateTime? startDate, DateTime? endDate)?
        loadMovements,
    TResult? Function(
            String? productUuid, String? warehouseUuid, bool? expiringOnly)?
        loadBatches,
    TResult? Function(AlertSeverity? severity)? loadAlerts,
    TResult? Function(String uuid)? acknowledgeAlert,
    TResult? Function(String uuid, String action)? resolveAlert,
    TResult? Function()? generateAlerts,
    TResult? Function(TransferStatus? status)? loadTransfers,
    TResult? Function(AdvancedStockTransfer transfer)? createTransfer,
    TResult? Function(String uuid)? approveTransfer,
    TResult? Function(String uuid, List<AdvancedStockTransferItem> items)?
        shipTransfer,
    TResult? Function(String uuid, List<AdvancedStockTransferItem> items)?
        receiveTransfer,
    TResult? Function()? loadInsights,
    TResult? Function(String warehouseUuid)? startPhysicalCount,
  }) {
    return loadMovements?.call(productUuid, warehouseUuid, startDate, endDate);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? warehouseUuid)? loadDashboard,
    TResult Function()? refreshDashboard,
    TResult Function()? loadWarehouses,
    TResult Function(String? uuid)? selectWarehouse,
    TResult Function(Warehouse warehouse)? createWarehouse,
    TResult Function(Warehouse warehouse)? updateWarehouse,
    TResult Function(String? warehouseUuid, String? categoryUuid,
            String? searchQuery, bool? lowStockOnly, bool? outOfStockOnly)?
        loadStockLevels,
    TResult Function(String productUuid, String warehouseUuid,
            double quantityChange, String reason, String? notes)?
        adjustStock,
    TResult Function(String? productUuid, String? warehouseUuid,
            DateTime? startDate, DateTime? endDate)?
        loadMovements,
    TResult Function(
            String? productUuid, String? warehouseUuid, bool? expiringOnly)?
        loadBatches,
    TResult Function(AlertSeverity? severity)? loadAlerts,
    TResult Function(String uuid)? acknowledgeAlert,
    TResult Function(String uuid, String action)? resolveAlert,
    TResult Function()? generateAlerts,
    TResult Function(TransferStatus? status)? loadTransfers,
    TResult Function(AdvancedStockTransfer transfer)? createTransfer,
    TResult Function(String uuid)? approveTransfer,
    TResult Function(String uuid, List<AdvancedStockTransferItem> items)?
        shipTransfer,
    TResult Function(String uuid, List<AdvancedStockTransferItem> items)?
        receiveTransfer,
    TResult Function()? loadInsights,
    TResult Function(String warehouseUuid)? startPhysicalCount,
    required TResult orElse(),
  }) {
    if (loadMovements != null) {
      return loadMovements(productUuid, warehouseUuid, startDate, endDate);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadDashboard value) loadDashboard,
    required TResult Function(_RefreshDashboard value) refreshDashboard,
    required TResult Function(_LoadWarehouses value) loadWarehouses,
    required TResult Function(_SelectWarehouse value) selectWarehouse,
    required TResult Function(_CreateWarehouse value) createWarehouse,
    required TResult Function(_UpdateWarehouse value) updateWarehouse,
    required TResult Function(_LoadStockLevels value) loadStockLevels,
    required TResult Function(_AdjustStock value) adjustStock,
    required TResult Function(_LoadMovements value) loadMovements,
    required TResult Function(_LoadBatches value) loadBatches,
    required TResult Function(_LoadAlerts value) loadAlerts,
    required TResult Function(_AcknowledgeAlert value) acknowledgeAlert,
    required TResult Function(_ResolveAlert value) resolveAlert,
    required TResult Function(_GenerateAlerts value) generateAlerts,
    required TResult Function(_LoadTransfers value) loadTransfers,
    required TResult Function(_CreateTransfer value) createTransfer,
    required TResult Function(_ApproveTransfer value) approveTransfer,
    required TResult Function(_ShipTransfer value) shipTransfer,
    required TResult Function(_ReceiveTransfer value) receiveTransfer,
    required TResult Function(_LoadInsights value) loadInsights,
    required TResult Function(_StartPhysicalCount value) startPhysicalCount,
  }) {
    return loadMovements(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadDashboard value)? loadDashboard,
    TResult? Function(_RefreshDashboard value)? refreshDashboard,
    TResult? Function(_LoadWarehouses value)? loadWarehouses,
    TResult? Function(_SelectWarehouse value)? selectWarehouse,
    TResult? Function(_CreateWarehouse value)? createWarehouse,
    TResult? Function(_UpdateWarehouse value)? updateWarehouse,
    TResult? Function(_LoadStockLevels value)? loadStockLevels,
    TResult? Function(_AdjustStock value)? adjustStock,
    TResult? Function(_LoadMovements value)? loadMovements,
    TResult? Function(_LoadBatches value)? loadBatches,
    TResult? Function(_LoadAlerts value)? loadAlerts,
    TResult? Function(_AcknowledgeAlert value)? acknowledgeAlert,
    TResult? Function(_ResolveAlert value)? resolveAlert,
    TResult? Function(_GenerateAlerts value)? generateAlerts,
    TResult? Function(_LoadTransfers value)? loadTransfers,
    TResult? Function(_CreateTransfer value)? createTransfer,
    TResult? Function(_ApproveTransfer value)? approveTransfer,
    TResult? Function(_ShipTransfer value)? shipTransfer,
    TResult? Function(_ReceiveTransfer value)? receiveTransfer,
    TResult? Function(_LoadInsights value)? loadInsights,
    TResult? Function(_StartPhysicalCount value)? startPhysicalCount,
  }) {
    return loadMovements?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadDashboard value)? loadDashboard,
    TResult Function(_RefreshDashboard value)? refreshDashboard,
    TResult Function(_LoadWarehouses value)? loadWarehouses,
    TResult Function(_SelectWarehouse value)? selectWarehouse,
    TResult Function(_CreateWarehouse value)? createWarehouse,
    TResult Function(_UpdateWarehouse value)? updateWarehouse,
    TResult Function(_LoadStockLevels value)? loadStockLevels,
    TResult Function(_AdjustStock value)? adjustStock,
    TResult Function(_LoadMovements value)? loadMovements,
    TResult Function(_LoadBatches value)? loadBatches,
    TResult Function(_LoadAlerts value)? loadAlerts,
    TResult Function(_AcknowledgeAlert value)? acknowledgeAlert,
    TResult Function(_ResolveAlert value)? resolveAlert,
    TResult Function(_GenerateAlerts value)? generateAlerts,
    TResult Function(_LoadTransfers value)? loadTransfers,
    TResult Function(_CreateTransfer value)? createTransfer,
    TResult Function(_ApproveTransfer value)? approveTransfer,
    TResult Function(_ShipTransfer value)? shipTransfer,
    TResult Function(_ReceiveTransfer value)? receiveTransfer,
    TResult Function(_LoadInsights value)? loadInsights,
    TResult Function(_StartPhysicalCount value)? startPhysicalCount,
    required TResult orElse(),
  }) {
    if (loadMovements != null) {
      return loadMovements(this);
    }
    return orElse();
  }
}

abstract class _LoadMovements implements AdvancedInventoryEvent {
  const factory _LoadMovements(
      {final String? productUuid,
      final String? warehouseUuid,
      final DateTime? startDate,
      final DateTime? endDate}) = _$LoadMovementsImpl;

  String? get productUuid;
  String? get warehouseUuid;
  DateTime? get startDate;
  DateTime? get endDate;

  /// Create a copy of AdvancedInventoryEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadMovementsImplCopyWith<_$LoadMovementsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadBatchesImplCopyWith<$Res> {
  factory _$$LoadBatchesImplCopyWith(
          _$LoadBatchesImpl value, $Res Function(_$LoadBatchesImpl) then) =
      __$$LoadBatchesImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String? productUuid, String? warehouseUuid, bool? expiringOnly});
}

/// @nodoc
class __$$LoadBatchesImplCopyWithImpl<$Res>
    extends _$AdvancedInventoryEventCopyWithImpl<$Res, _$LoadBatchesImpl>
    implements _$$LoadBatchesImplCopyWith<$Res> {
  __$$LoadBatchesImplCopyWithImpl(
      _$LoadBatchesImpl _value, $Res Function(_$LoadBatchesImpl) _then)
      : super(_value, _then);

  /// Create a copy of AdvancedInventoryEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productUuid = freezed,
    Object? warehouseUuid = freezed,
    Object? expiringOnly = freezed,
  }) {
    return _then(_$LoadBatchesImpl(
      productUuid: freezed == productUuid
          ? _value.productUuid
          : productUuid // ignore: cast_nullable_to_non_nullable
              as String?,
      warehouseUuid: freezed == warehouseUuid
          ? _value.warehouseUuid
          : warehouseUuid // ignore: cast_nullable_to_non_nullable
              as String?,
      expiringOnly: freezed == expiringOnly
          ? _value.expiringOnly
          : expiringOnly // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc

class _$LoadBatchesImpl implements _LoadBatches {
  const _$LoadBatchesImpl(
      {this.productUuid, this.warehouseUuid, this.expiringOnly});

  @override
  final String? productUuid;
  @override
  final String? warehouseUuid;
  @override
  final bool? expiringOnly;

  @override
  String toString() {
    return 'AdvancedInventoryEvent.loadBatches(productUuid: $productUuid, warehouseUuid: $warehouseUuid, expiringOnly: $expiringOnly)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadBatchesImpl &&
            (identical(other.productUuid, productUuid) ||
                other.productUuid == productUuid) &&
            (identical(other.warehouseUuid, warehouseUuid) ||
                other.warehouseUuid == warehouseUuid) &&
            (identical(other.expiringOnly, expiringOnly) ||
                other.expiringOnly == expiringOnly));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, productUuid, warehouseUuid, expiringOnly);

  /// Create a copy of AdvancedInventoryEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadBatchesImplCopyWith<_$LoadBatchesImpl> get copyWith =>
      __$$LoadBatchesImplCopyWithImpl<_$LoadBatchesImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? warehouseUuid) loadDashboard,
    required TResult Function() refreshDashboard,
    required TResult Function() loadWarehouses,
    required TResult Function(String? uuid) selectWarehouse,
    required TResult Function(Warehouse warehouse) createWarehouse,
    required TResult Function(Warehouse warehouse) updateWarehouse,
    required TResult Function(String? warehouseUuid, String? categoryUuid,
            String? searchQuery, bool? lowStockOnly, bool? outOfStockOnly)
        loadStockLevels,
    required TResult Function(String productUuid, String warehouseUuid,
            double quantityChange, String reason, String? notes)
        adjustStock,
    required TResult Function(String? productUuid, String? warehouseUuid,
            DateTime? startDate, DateTime? endDate)
        loadMovements,
    required TResult Function(
            String? productUuid, String? warehouseUuid, bool? expiringOnly)
        loadBatches,
    required TResult Function(AlertSeverity? severity) loadAlerts,
    required TResult Function(String uuid) acknowledgeAlert,
    required TResult Function(String uuid, String action) resolveAlert,
    required TResult Function() generateAlerts,
    required TResult Function(TransferStatus? status) loadTransfers,
    required TResult Function(AdvancedStockTransfer transfer) createTransfer,
    required TResult Function(String uuid) approveTransfer,
    required TResult Function(
            String uuid, List<AdvancedStockTransferItem> items)
        shipTransfer,
    required TResult Function(
            String uuid, List<AdvancedStockTransferItem> items)
        receiveTransfer,
    required TResult Function() loadInsights,
    required TResult Function(String warehouseUuid) startPhysicalCount,
  }) {
    return loadBatches(productUuid, warehouseUuid, expiringOnly);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? warehouseUuid)? loadDashboard,
    TResult? Function()? refreshDashboard,
    TResult? Function()? loadWarehouses,
    TResult? Function(String? uuid)? selectWarehouse,
    TResult? Function(Warehouse warehouse)? createWarehouse,
    TResult? Function(Warehouse warehouse)? updateWarehouse,
    TResult? Function(String? warehouseUuid, String? categoryUuid,
            String? searchQuery, bool? lowStockOnly, bool? outOfStockOnly)?
        loadStockLevels,
    TResult? Function(String productUuid, String warehouseUuid,
            double quantityChange, String reason, String? notes)?
        adjustStock,
    TResult? Function(String? productUuid, String? warehouseUuid,
            DateTime? startDate, DateTime? endDate)?
        loadMovements,
    TResult? Function(
            String? productUuid, String? warehouseUuid, bool? expiringOnly)?
        loadBatches,
    TResult? Function(AlertSeverity? severity)? loadAlerts,
    TResult? Function(String uuid)? acknowledgeAlert,
    TResult? Function(String uuid, String action)? resolveAlert,
    TResult? Function()? generateAlerts,
    TResult? Function(TransferStatus? status)? loadTransfers,
    TResult? Function(AdvancedStockTransfer transfer)? createTransfer,
    TResult? Function(String uuid)? approveTransfer,
    TResult? Function(String uuid, List<AdvancedStockTransferItem> items)?
        shipTransfer,
    TResult? Function(String uuid, List<AdvancedStockTransferItem> items)?
        receiveTransfer,
    TResult? Function()? loadInsights,
    TResult? Function(String warehouseUuid)? startPhysicalCount,
  }) {
    return loadBatches?.call(productUuid, warehouseUuid, expiringOnly);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? warehouseUuid)? loadDashboard,
    TResult Function()? refreshDashboard,
    TResult Function()? loadWarehouses,
    TResult Function(String? uuid)? selectWarehouse,
    TResult Function(Warehouse warehouse)? createWarehouse,
    TResult Function(Warehouse warehouse)? updateWarehouse,
    TResult Function(String? warehouseUuid, String? categoryUuid,
            String? searchQuery, bool? lowStockOnly, bool? outOfStockOnly)?
        loadStockLevels,
    TResult Function(String productUuid, String warehouseUuid,
            double quantityChange, String reason, String? notes)?
        adjustStock,
    TResult Function(String? productUuid, String? warehouseUuid,
            DateTime? startDate, DateTime? endDate)?
        loadMovements,
    TResult Function(
            String? productUuid, String? warehouseUuid, bool? expiringOnly)?
        loadBatches,
    TResult Function(AlertSeverity? severity)? loadAlerts,
    TResult Function(String uuid)? acknowledgeAlert,
    TResult Function(String uuid, String action)? resolveAlert,
    TResult Function()? generateAlerts,
    TResult Function(TransferStatus? status)? loadTransfers,
    TResult Function(AdvancedStockTransfer transfer)? createTransfer,
    TResult Function(String uuid)? approveTransfer,
    TResult Function(String uuid, List<AdvancedStockTransferItem> items)?
        shipTransfer,
    TResult Function(String uuid, List<AdvancedStockTransferItem> items)?
        receiveTransfer,
    TResult Function()? loadInsights,
    TResult Function(String warehouseUuid)? startPhysicalCount,
    required TResult orElse(),
  }) {
    if (loadBatches != null) {
      return loadBatches(productUuid, warehouseUuid, expiringOnly);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadDashboard value) loadDashboard,
    required TResult Function(_RefreshDashboard value) refreshDashboard,
    required TResult Function(_LoadWarehouses value) loadWarehouses,
    required TResult Function(_SelectWarehouse value) selectWarehouse,
    required TResult Function(_CreateWarehouse value) createWarehouse,
    required TResult Function(_UpdateWarehouse value) updateWarehouse,
    required TResult Function(_LoadStockLevels value) loadStockLevels,
    required TResult Function(_AdjustStock value) adjustStock,
    required TResult Function(_LoadMovements value) loadMovements,
    required TResult Function(_LoadBatches value) loadBatches,
    required TResult Function(_LoadAlerts value) loadAlerts,
    required TResult Function(_AcknowledgeAlert value) acknowledgeAlert,
    required TResult Function(_ResolveAlert value) resolveAlert,
    required TResult Function(_GenerateAlerts value) generateAlerts,
    required TResult Function(_LoadTransfers value) loadTransfers,
    required TResult Function(_CreateTransfer value) createTransfer,
    required TResult Function(_ApproveTransfer value) approveTransfer,
    required TResult Function(_ShipTransfer value) shipTransfer,
    required TResult Function(_ReceiveTransfer value) receiveTransfer,
    required TResult Function(_LoadInsights value) loadInsights,
    required TResult Function(_StartPhysicalCount value) startPhysicalCount,
  }) {
    return loadBatches(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadDashboard value)? loadDashboard,
    TResult? Function(_RefreshDashboard value)? refreshDashboard,
    TResult? Function(_LoadWarehouses value)? loadWarehouses,
    TResult? Function(_SelectWarehouse value)? selectWarehouse,
    TResult? Function(_CreateWarehouse value)? createWarehouse,
    TResult? Function(_UpdateWarehouse value)? updateWarehouse,
    TResult? Function(_LoadStockLevels value)? loadStockLevels,
    TResult? Function(_AdjustStock value)? adjustStock,
    TResult? Function(_LoadMovements value)? loadMovements,
    TResult? Function(_LoadBatches value)? loadBatches,
    TResult? Function(_LoadAlerts value)? loadAlerts,
    TResult? Function(_AcknowledgeAlert value)? acknowledgeAlert,
    TResult? Function(_ResolveAlert value)? resolveAlert,
    TResult? Function(_GenerateAlerts value)? generateAlerts,
    TResult? Function(_LoadTransfers value)? loadTransfers,
    TResult? Function(_CreateTransfer value)? createTransfer,
    TResult? Function(_ApproveTransfer value)? approveTransfer,
    TResult? Function(_ShipTransfer value)? shipTransfer,
    TResult? Function(_ReceiveTransfer value)? receiveTransfer,
    TResult? Function(_LoadInsights value)? loadInsights,
    TResult? Function(_StartPhysicalCount value)? startPhysicalCount,
  }) {
    return loadBatches?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadDashboard value)? loadDashboard,
    TResult Function(_RefreshDashboard value)? refreshDashboard,
    TResult Function(_LoadWarehouses value)? loadWarehouses,
    TResult Function(_SelectWarehouse value)? selectWarehouse,
    TResult Function(_CreateWarehouse value)? createWarehouse,
    TResult Function(_UpdateWarehouse value)? updateWarehouse,
    TResult Function(_LoadStockLevels value)? loadStockLevels,
    TResult Function(_AdjustStock value)? adjustStock,
    TResult Function(_LoadMovements value)? loadMovements,
    TResult Function(_LoadBatches value)? loadBatches,
    TResult Function(_LoadAlerts value)? loadAlerts,
    TResult Function(_AcknowledgeAlert value)? acknowledgeAlert,
    TResult Function(_ResolveAlert value)? resolveAlert,
    TResult Function(_GenerateAlerts value)? generateAlerts,
    TResult Function(_LoadTransfers value)? loadTransfers,
    TResult Function(_CreateTransfer value)? createTransfer,
    TResult Function(_ApproveTransfer value)? approveTransfer,
    TResult Function(_ShipTransfer value)? shipTransfer,
    TResult Function(_ReceiveTransfer value)? receiveTransfer,
    TResult Function(_LoadInsights value)? loadInsights,
    TResult Function(_StartPhysicalCount value)? startPhysicalCount,
    required TResult orElse(),
  }) {
    if (loadBatches != null) {
      return loadBatches(this);
    }
    return orElse();
  }
}

abstract class _LoadBatches implements AdvancedInventoryEvent {
  const factory _LoadBatches(
      {final String? productUuid,
      final String? warehouseUuid,
      final bool? expiringOnly}) = _$LoadBatchesImpl;

  String? get productUuid;
  String? get warehouseUuid;
  bool? get expiringOnly;

  /// Create a copy of AdvancedInventoryEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadBatchesImplCopyWith<_$LoadBatchesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadAlertsImplCopyWith<$Res> {
  factory _$$LoadAlertsImplCopyWith(
          _$LoadAlertsImpl value, $Res Function(_$LoadAlertsImpl) then) =
      __$$LoadAlertsImplCopyWithImpl<$Res>;
  @useResult
  $Res call({AlertSeverity? severity});
}

/// @nodoc
class __$$LoadAlertsImplCopyWithImpl<$Res>
    extends _$AdvancedInventoryEventCopyWithImpl<$Res, _$LoadAlertsImpl>
    implements _$$LoadAlertsImplCopyWith<$Res> {
  __$$LoadAlertsImplCopyWithImpl(
      _$LoadAlertsImpl _value, $Res Function(_$LoadAlertsImpl) _then)
      : super(_value, _then);

  /// Create a copy of AdvancedInventoryEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? severity = freezed,
  }) {
    return _then(_$LoadAlertsImpl(
      severity: freezed == severity
          ? _value.severity
          : severity // ignore: cast_nullable_to_non_nullable
              as AlertSeverity?,
    ));
  }
}

/// @nodoc

class _$LoadAlertsImpl implements _LoadAlerts {
  const _$LoadAlertsImpl({this.severity});

  @override
  final AlertSeverity? severity;

  @override
  String toString() {
    return 'AdvancedInventoryEvent.loadAlerts(severity: $severity)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadAlertsImpl &&
            (identical(other.severity, severity) ||
                other.severity == severity));
  }

  @override
  int get hashCode => Object.hash(runtimeType, severity);

  /// Create a copy of AdvancedInventoryEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadAlertsImplCopyWith<_$LoadAlertsImpl> get copyWith =>
      __$$LoadAlertsImplCopyWithImpl<_$LoadAlertsImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? warehouseUuid) loadDashboard,
    required TResult Function() refreshDashboard,
    required TResult Function() loadWarehouses,
    required TResult Function(String? uuid) selectWarehouse,
    required TResult Function(Warehouse warehouse) createWarehouse,
    required TResult Function(Warehouse warehouse) updateWarehouse,
    required TResult Function(String? warehouseUuid, String? categoryUuid,
            String? searchQuery, bool? lowStockOnly, bool? outOfStockOnly)
        loadStockLevels,
    required TResult Function(String productUuid, String warehouseUuid,
            double quantityChange, String reason, String? notes)
        adjustStock,
    required TResult Function(String? productUuid, String? warehouseUuid,
            DateTime? startDate, DateTime? endDate)
        loadMovements,
    required TResult Function(
            String? productUuid, String? warehouseUuid, bool? expiringOnly)
        loadBatches,
    required TResult Function(AlertSeverity? severity) loadAlerts,
    required TResult Function(String uuid) acknowledgeAlert,
    required TResult Function(String uuid, String action) resolveAlert,
    required TResult Function() generateAlerts,
    required TResult Function(TransferStatus? status) loadTransfers,
    required TResult Function(AdvancedStockTransfer transfer) createTransfer,
    required TResult Function(String uuid) approveTransfer,
    required TResult Function(
            String uuid, List<AdvancedStockTransferItem> items)
        shipTransfer,
    required TResult Function(
            String uuid, List<AdvancedStockTransferItem> items)
        receiveTransfer,
    required TResult Function() loadInsights,
    required TResult Function(String warehouseUuid) startPhysicalCount,
  }) {
    return loadAlerts(severity);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? warehouseUuid)? loadDashboard,
    TResult? Function()? refreshDashboard,
    TResult? Function()? loadWarehouses,
    TResult? Function(String? uuid)? selectWarehouse,
    TResult? Function(Warehouse warehouse)? createWarehouse,
    TResult? Function(Warehouse warehouse)? updateWarehouse,
    TResult? Function(String? warehouseUuid, String? categoryUuid,
            String? searchQuery, bool? lowStockOnly, bool? outOfStockOnly)?
        loadStockLevels,
    TResult? Function(String productUuid, String warehouseUuid,
            double quantityChange, String reason, String? notes)?
        adjustStock,
    TResult? Function(String? productUuid, String? warehouseUuid,
            DateTime? startDate, DateTime? endDate)?
        loadMovements,
    TResult? Function(
            String? productUuid, String? warehouseUuid, bool? expiringOnly)?
        loadBatches,
    TResult? Function(AlertSeverity? severity)? loadAlerts,
    TResult? Function(String uuid)? acknowledgeAlert,
    TResult? Function(String uuid, String action)? resolveAlert,
    TResult? Function()? generateAlerts,
    TResult? Function(TransferStatus? status)? loadTransfers,
    TResult? Function(AdvancedStockTransfer transfer)? createTransfer,
    TResult? Function(String uuid)? approveTransfer,
    TResult? Function(String uuid, List<AdvancedStockTransferItem> items)?
        shipTransfer,
    TResult? Function(String uuid, List<AdvancedStockTransferItem> items)?
        receiveTransfer,
    TResult? Function()? loadInsights,
    TResult? Function(String warehouseUuid)? startPhysicalCount,
  }) {
    return loadAlerts?.call(severity);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? warehouseUuid)? loadDashboard,
    TResult Function()? refreshDashboard,
    TResult Function()? loadWarehouses,
    TResult Function(String? uuid)? selectWarehouse,
    TResult Function(Warehouse warehouse)? createWarehouse,
    TResult Function(Warehouse warehouse)? updateWarehouse,
    TResult Function(String? warehouseUuid, String? categoryUuid,
            String? searchQuery, bool? lowStockOnly, bool? outOfStockOnly)?
        loadStockLevels,
    TResult Function(String productUuid, String warehouseUuid,
            double quantityChange, String reason, String? notes)?
        adjustStock,
    TResult Function(String? productUuid, String? warehouseUuid,
            DateTime? startDate, DateTime? endDate)?
        loadMovements,
    TResult Function(
            String? productUuid, String? warehouseUuid, bool? expiringOnly)?
        loadBatches,
    TResult Function(AlertSeverity? severity)? loadAlerts,
    TResult Function(String uuid)? acknowledgeAlert,
    TResult Function(String uuid, String action)? resolveAlert,
    TResult Function()? generateAlerts,
    TResult Function(TransferStatus? status)? loadTransfers,
    TResult Function(AdvancedStockTransfer transfer)? createTransfer,
    TResult Function(String uuid)? approveTransfer,
    TResult Function(String uuid, List<AdvancedStockTransferItem> items)?
        shipTransfer,
    TResult Function(String uuid, List<AdvancedStockTransferItem> items)?
        receiveTransfer,
    TResult Function()? loadInsights,
    TResult Function(String warehouseUuid)? startPhysicalCount,
    required TResult orElse(),
  }) {
    if (loadAlerts != null) {
      return loadAlerts(severity);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadDashboard value) loadDashboard,
    required TResult Function(_RefreshDashboard value) refreshDashboard,
    required TResult Function(_LoadWarehouses value) loadWarehouses,
    required TResult Function(_SelectWarehouse value) selectWarehouse,
    required TResult Function(_CreateWarehouse value) createWarehouse,
    required TResult Function(_UpdateWarehouse value) updateWarehouse,
    required TResult Function(_LoadStockLevels value) loadStockLevels,
    required TResult Function(_AdjustStock value) adjustStock,
    required TResult Function(_LoadMovements value) loadMovements,
    required TResult Function(_LoadBatches value) loadBatches,
    required TResult Function(_LoadAlerts value) loadAlerts,
    required TResult Function(_AcknowledgeAlert value) acknowledgeAlert,
    required TResult Function(_ResolveAlert value) resolveAlert,
    required TResult Function(_GenerateAlerts value) generateAlerts,
    required TResult Function(_LoadTransfers value) loadTransfers,
    required TResult Function(_CreateTransfer value) createTransfer,
    required TResult Function(_ApproveTransfer value) approveTransfer,
    required TResult Function(_ShipTransfer value) shipTransfer,
    required TResult Function(_ReceiveTransfer value) receiveTransfer,
    required TResult Function(_LoadInsights value) loadInsights,
    required TResult Function(_StartPhysicalCount value) startPhysicalCount,
  }) {
    return loadAlerts(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadDashboard value)? loadDashboard,
    TResult? Function(_RefreshDashboard value)? refreshDashboard,
    TResult? Function(_LoadWarehouses value)? loadWarehouses,
    TResult? Function(_SelectWarehouse value)? selectWarehouse,
    TResult? Function(_CreateWarehouse value)? createWarehouse,
    TResult? Function(_UpdateWarehouse value)? updateWarehouse,
    TResult? Function(_LoadStockLevels value)? loadStockLevels,
    TResult? Function(_AdjustStock value)? adjustStock,
    TResult? Function(_LoadMovements value)? loadMovements,
    TResult? Function(_LoadBatches value)? loadBatches,
    TResult? Function(_LoadAlerts value)? loadAlerts,
    TResult? Function(_AcknowledgeAlert value)? acknowledgeAlert,
    TResult? Function(_ResolveAlert value)? resolveAlert,
    TResult? Function(_GenerateAlerts value)? generateAlerts,
    TResult? Function(_LoadTransfers value)? loadTransfers,
    TResult? Function(_CreateTransfer value)? createTransfer,
    TResult? Function(_ApproveTransfer value)? approveTransfer,
    TResult? Function(_ShipTransfer value)? shipTransfer,
    TResult? Function(_ReceiveTransfer value)? receiveTransfer,
    TResult? Function(_LoadInsights value)? loadInsights,
    TResult? Function(_StartPhysicalCount value)? startPhysicalCount,
  }) {
    return loadAlerts?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadDashboard value)? loadDashboard,
    TResult Function(_RefreshDashboard value)? refreshDashboard,
    TResult Function(_LoadWarehouses value)? loadWarehouses,
    TResult Function(_SelectWarehouse value)? selectWarehouse,
    TResult Function(_CreateWarehouse value)? createWarehouse,
    TResult Function(_UpdateWarehouse value)? updateWarehouse,
    TResult Function(_LoadStockLevels value)? loadStockLevels,
    TResult Function(_AdjustStock value)? adjustStock,
    TResult Function(_LoadMovements value)? loadMovements,
    TResult Function(_LoadBatches value)? loadBatches,
    TResult Function(_LoadAlerts value)? loadAlerts,
    TResult Function(_AcknowledgeAlert value)? acknowledgeAlert,
    TResult Function(_ResolveAlert value)? resolveAlert,
    TResult Function(_GenerateAlerts value)? generateAlerts,
    TResult Function(_LoadTransfers value)? loadTransfers,
    TResult Function(_CreateTransfer value)? createTransfer,
    TResult Function(_ApproveTransfer value)? approveTransfer,
    TResult Function(_ShipTransfer value)? shipTransfer,
    TResult Function(_ReceiveTransfer value)? receiveTransfer,
    TResult Function(_LoadInsights value)? loadInsights,
    TResult Function(_StartPhysicalCount value)? startPhysicalCount,
    required TResult orElse(),
  }) {
    if (loadAlerts != null) {
      return loadAlerts(this);
    }
    return orElse();
  }
}

abstract class _LoadAlerts implements AdvancedInventoryEvent {
  const factory _LoadAlerts({final AlertSeverity? severity}) = _$LoadAlertsImpl;

  AlertSeverity? get severity;

  /// Create a copy of AdvancedInventoryEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadAlertsImplCopyWith<_$LoadAlertsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AcknowledgeAlertImplCopyWith<$Res> {
  factory _$$AcknowledgeAlertImplCopyWith(_$AcknowledgeAlertImpl value,
          $Res Function(_$AcknowledgeAlertImpl) then) =
      __$$AcknowledgeAlertImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String uuid});
}

/// @nodoc
class __$$AcknowledgeAlertImplCopyWithImpl<$Res>
    extends _$AdvancedInventoryEventCopyWithImpl<$Res, _$AcknowledgeAlertImpl>
    implements _$$AcknowledgeAlertImplCopyWith<$Res> {
  __$$AcknowledgeAlertImplCopyWithImpl(_$AcknowledgeAlertImpl _value,
      $Res Function(_$AcknowledgeAlertImpl) _then)
      : super(_value, _then);

  /// Create a copy of AdvancedInventoryEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
  }) {
    return _then(_$AcknowledgeAlertImpl(
      null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$AcknowledgeAlertImpl implements _AcknowledgeAlert {
  const _$AcknowledgeAlertImpl(this.uuid);

  @override
  final String uuid;

  @override
  String toString() {
    return 'AdvancedInventoryEvent.acknowledgeAlert(uuid: $uuid)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AcknowledgeAlertImpl &&
            (identical(other.uuid, uuid) || other.uuid == uuid));
  }

  @override
  int get hashCode => Object.hash(runtimeType, uuid);

  /// Create a copy of AdvancedInventoryEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AcknowledgeAlertImplCopyWith<_$AcknowledgeAlertImpl> get copyWith =>
      __$$AcknowledgeAlertImplCopyWithImpl<_$AcknowledgeAlertImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? warehouseUuid) loadDashboard,
    required TResult Function() refreshDashboard,
    required TResult Function() loadWarehouses,
    required TResult Function(String? uuid) selectWarehouse,
    required TResult Function(Warehouse warehouse) createWarehouse,
    required TResult Function(Warehouse warehouse) updateWarehouse,
    required TResult Function(String? warehouseUuid, String? categoryUuid,
            String? searchQuery, bool? lowStockOnly, bool? outOfStockOnly)
        loadStockLevels,
    required TResult Function(String productUuid, String warehouseUuid,
            double quantityChange, String reason, String? notes)
        adjustStock,
    required TResult Function(String? productUuid, String? warehouseUuid,
            DateTime? startDate, DateTime? endDate)
        loadMovements,
    required TResult Function(
            String? productUuid, String? warehouseUuid, bool? expiringOnly)
        loadBatches,
    required TResult Function(AlertSeverity? severity) loadAlerts,
    required TResult Function(String uuid) acknowledgeAlert,
    required TResult Function(String uuid, String action) resolveAlert,
    required TResult Function() generateAlerts,
    required TResult Function(TransferStatus? status) loadTransfers,
    required TResult Function(AdvancedStockTransfer transfer) createTransfer,
    required TResult Function(String uuid) approveTransfer,
    required TResult Function(
            String uuid, List<AdvancedStockTransferItem> items)
        shipTransfer,
    required TResult Function(
            String uuid, List<AdvancedStockTransferItem> items)
        receiveTransfer,
    required TResult Function() loadInsights,
    required TResult Function(String warehouseUuid) startPhysicalCount,
  }) {
    return acknowledgeAlert(uuid);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? warehouseUuid)? loadDashboard,
    TResult? Function()? refreshDashboard,
    TResult? Function()? loadWarehouses,
    TResult? Function(String? uuid)? selectWarehouse,
    TResult? Function(Warehouse warehouse)? createWarehouse,
    TResult? Function(Warehouse warehouse)? updateWarehouse,
    TResult? Function(String? warehouseUuid, String? categoryUuid,
            String? searchQuery, bool? lowStockOnly, bool? outOfStockOnly)?
        loadStockLevels,
    TResult? Function(String productUuid, String warehouseUuid,
            double quantityChange, String reason, String? notes)?
        adjustStock,
    TResult? Function(String? productUuid, String? warehouseUuid,
            DateTime? startDate, DateTime? endDate)?
        loadMovements,
    TResult? Function(
            String? productUuid, String? warehouseUuid, bool? expiringOnly)?
        loadBatches,
    TResult? Function(AlertSeverity? severity)? loadAlerts,
    TResult? Function(String uuid)? acknowledgeAlert,
    TResult? Function(String uuid, String action)? resolveAlert,
    TResult? Function()? generateAlerts,
    TResult? Function(TransferStatus? status)? loadTransfers,
    TResult? Function(AdvancedStockTransfer transfer)? createTransfer,
    TResult? Function(String uuid)? approveTransfer,
    TResult? Function(String uuid, List<AdvancedStockTransferItem> items)?
        shipTransfer,
    TResult? Function(String uuid, List<AdvancedStockTransferItem> items)?
        receiveTransfer,
    TResult? Function()? loadInsights,
    TResult? Function(String warehouseUuid)? startPhysicalCount,
  }) {
    return acknowledgeAlert?.call(uuid);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? warehouseUuid)? loadDashboard,
    TResult Function()? refreshDashboard,
    TResult Function()? loadWarehouses,
    TResult Function(String? uuid)? selectWarehouse,
    TResult Function(Warehouse warehouse)? createWarehouse,
    TResult Function(Warehouse warehouse)? updateWarehouse,
    TResult Function(String? warehouseUuid, String? categoryUuid,
            String? searchQuery, bool? lowStockOnly, bool? outOfStockOnly)?
        loadStockLevels,
    TResult Function(String productUuid, String warehouseUuid,
            double quantityChange, String reason, String? notes)?
        adjustStock,
    TResult Function(String? productUuid, String? warehouseUuid,
            DateTime? startDate, DateTime? endDate)?
        loadMovements,
    TResult Function(
            String? productUuid, String? warehouseUuid, bool? expiringOnly)?
        loadBatches,
    TResult Function(AlertSeverity? severity)? loadAlerts,
    TResult Function(String uuid)? acknowledgeAlert,
    TResult Function(String uuid, String action)? resolveAlert,
    TResult Function()? generateAlerts,
    TResult Function(TransferStatus? status)? loadTransfers,
    TResult Function(AdvancedStockTransfer transfer)? createTransfer,
    TResult Function(String uuid)? approveTransfer,
    TResult Function(String uuid, List<AdvancedStockTransferItem> items)?
        shipTransfer,
    TResult Function(String uuid, List<AdvancedStockTransferItem> items)?
        receiveTransfer,
    TResult Function()? loadInsights,
    TResult Function(String warehouseUuid)? startPhysicalCount,
    required TResult orElse(),
  }) {
    if (acknowledgeAlert != null) {
      return acknowledgeAlert(uuid);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadDashboard value) loadDashboard,
    required TResult Function(_RefreshDashboard value) refreshDashboard,
    required TResult Function(_LoadWarehouses value) loadWarehouses,
    required TResult Function(_SelectWarehouse value) selectWarehouse,
    required TResult Function(_CreateWarehouse value) createWarehouse,
    required TResult Function(_UpdateWarehouse value) updateWarehouse,
    required TResult Function(_LoadStockLevels value) loadStockLevels,
    required TResult Function(_AdjustStock value) adjustStock,
    required TResult Function(_LoadMovements value) loadMovements,
    required TResult Function(_LoadBatches value) loadBatches,
    required TResult Function(_LoadAlerts value) loadAlerts,
    required TResult Function(_AcknowledgeAlert value) acknowledgeAlert,
    required TResult Function(_ResolveAlert value) resolveAlert,
    required TResult Function(_GenerateAlerts value) generateAlerts,
    required TResult Function(_LoadTransfers value) loadTransfers,
    required TResult Function(_CreateTransfer value) createTransfer,
    required TResult Function(_ApproveTransfer value) approveTransfer,
    required TResult Function(_ShipTransfer value) shipTransfer,
    required TResult Function(_ReceiveTransfer value) receiveTransfer,
    required TResult Function(_LoadInsights value) loadInsights,
    required TResult Function(_StartPhysicalCount value) startPhysicalCount,
  }) {
    return acknowledgeAlert(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadDashboard value)? loadDashboard,
    TResult? Function(_RefreshDashboard value)? refreshDashboard,
    TResult? Function(_LoadWarehouses value)? loadWarehouses,
    TResult? Function(_SelectWarehouse value)? selectWarehouse,
    TResult? Function(_CreateWarehouse value)? createWarehouse,
    TResult? Function(_UpdateWarehouse value)? updateWarehouse,
    TResult? Function(_LoadStockLevels value)? loadStockLevels,
    TResult? Function(_AdjustStock value)? adjustStock,
    TResult? Function(_LoadMovements value)? loadMovements,
    TResult? Function(_LoadBatches value)? loadBatches,
    TResult? Function(_LoadAlerts value)? loadAlerts,
    TResult? Function(_AcknowledgeAlert value)? acknowledgeAlert,
    TResult? Function(_ResolveAlert value)? resolveAlert,
    TResult? Function(_GenerateAlerts value)? generateAlerts,
    TResult? Function(_LoadTransfers value)? loadTransfers,
    TResult? Function(_CreateTransfer value)? createTransfer,
    TResult? Function(_ApproveTransfer value)? approveTransfer,
    TResult? Function(_ShipTransfer value)? shipTransfer,
    TResult? Function(_ReceiveTransfer value)? receiveTransfer,
    TResult? Function(_LoadInsights value)? loadInsights,
    TResult? Function(_StartPhysicalCount value)? startPhysicalCount,
  }) {
    return acknowledgeAlert?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadDashboard value)? loadDashboard,
    TResult Function(_RefreshDashboard value)? refreshDashboard,
    TResult Function(_LoadWarehouses value)? loadWarehouses,
    TResult Function(_SelectWarehouse value)? selectWarehouse,
    TResult Function(_CreateWarehouse value)? createWarehouse,
    TResult Function(_UpdateWarehouse value)? updateWarehouse,
    TResult Function(_LoadStockLevels value)? loadStockLevels,
    TResult Function(_AdjustStock value)? adjustStock,
    TResult Function(_LoadMovements value)? loadMovements,
    TResult Function(_LoadBatches value)? loadBatches,
    TResult Function(_LoadAlerts value)? loadAlerts,
    TResult Function(_AcknowledgeAlert value)? acknowledgeAlert,
    TResult Function(_ResolveAlert value)? resolveAlert,
    TResult Function(_GenerateAlerts value)? generateAlerts,
    TResult Function(_LoadTransfers value)? loadTransfers,
    TResult Function(_CreateTransfer value)? createTransfer,
    TResult Function(_ApproveTransfer value)? approveTransfer,
    TResult Function(_ShipTransfer value)? shipTransfer,
    TResult Function(_ReceiveTransfer value)? receiveTransfer,
    TResult Function(_LoadInsights value)? loadInsights,
    TResult Function(_StartPhysicalCount value)? startPhysicalCount,
    required TResult orElse(),
  }) {
    if (acknowledgeAlert != null) {
      return acknowledgeAlert(this);
    }
    return orElse();
  }
}

abstract class _AcknowledgeAlert implements AdvancedInventoryEvent {
  const factory _AcknowledgeAlert(final String uuid) = _$AcknowledgeAlertImpl;

  String get uuid;

  /// Create a copy of AdvancedInventoryEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AcknowledgeAlertImplCopyWith<_$AcknowledgeAlertImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ResolveAlertImplCopyWith<$Res> {
  factory _$$ResolveAlertImplCopyWith(
          _$ResolveAlertImpl value, $Res Function(_$ResolveAlertImpl) then) =
      __$$ResolveAlertImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String uuid, String action});
}

/// @nodoc
class __$$ResolveAlertImplCopyWithImpl<$Res>
    extends _$AdvancedInventoryEventCopyWithImpl<$Res, _$ResolveAlertImpl>
    implements _$$ResolveAlertImplCopyWith<$Res> {
  __$$ResolveAlertImplCopyWithImpl(
      _$ResolveAlertImpl _value, $Res Function(_$ResolveAlertImpl) _then)
      : super(_value, _then);

  /// Create a copy of AdvancedInventoryEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
    Object? action = null,
  }) {
    return _then(_$ResolveAlertImpl(
      null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      null == action
          ? _value.action
          : action // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ResolveAlertImpl implements _ResolveAlert {
  const _$ResolveAlertImpl(this.uuid, this.action);

  @override
  final String uuid;
  @override
  final String action;

  @override
  String toString() {
    return 'AdvancedInventoryEvent.resolveAlert(uuid: $uuid, action: $action)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResolveAlertImpl &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.action, action) || other.action == action));
  }

  @override
  int get hashCode => Object.hash(runtimeType, uuid, action);

  /// Create a copy of AdvancedInventoryEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ResolveAlertImplCopyWith<_$ResolveAlertImpl> get copyWith =>
      __$$ResolveAlertImplCopyWithImpl<_$ResolveAlertImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? warehouseUuid) loadDashboard,
    required TResult Function() refreshDashboard,
    required TResult Function() loadWarehouses,
    required TResult Function(String? uuid) selectWarehouse,
    required TResult Function(Warehouse warehouse) createWarehouse,
    required TResult Function(Warehouse warehouse) updateWarehouse,
    required TResult Function(String? warehouseUuid, String? categoryUuid,
            String? searchQuery, bool? lowStockOnly, bool? outOfStockOnly)
        loadStockLevels,
    required TResult Function(String productUuid, String warehouseUuid,
            double quantityChange, String reason, String? notes)
        adjustStock,
    required TResult Function(String? productUuid, String? warehouseUuid,
            DateTime? startDate, DateTime? endDate)
        loadMovements,
    required TResult Function(
            String? productUuid, String? warehouseUuid, bool? expiringOnly)
        loadBatches,
    required TResult Function(AlertSeverity? severity) loadAlerts,
    required TResult Function(String uuid) acknowledgeAlert,
    required TResult Function(String uuid, String action) resolveAlert,
    required TResult Function() generateAlerts,
    required TResult Function(TransferStatus? status) loadTransfers,
    required TResult Function(AdvancedStockTransfer transfer) createTransfer,
    required TResult Function(String uuid) approveTransfer,
    required TResult Function(
            String uuid, List<AdvancedStockTransferItem> items)
        shipTransfer,
    required TResult Function(
            String uuid, List<AdvancedStockTransferItem> items)
        receiveTransfer,
    required TResult Function() loadInsights,
    required TResult Function(String warehouseUuid) startPhysicalCount,
  }) {
    return resolveAlert(uuid, action);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? warehouseUuid)? loadDashboard,
    TResult? Function()? refreshDashboard,
    TResult? Function()? loadWarehouses,
    TResult? Function(String? uuid)? selectWarehouse,
    TResult? Function(Warehouse warehouse)? createWarehouse,
    TResult? Function(Warehouse warehouse)? updateWarehouse,
    TResult? Function(String? warehouseUuid, String? categoryUuid,
            String? searchQuery, bool? lowStockOnly, bool? outOfStockOnly)?
        loadStockLevels,
    TResult? Function(String productUuid, String warehouseUuid,
            double quantityChange, String reason, String? notes)?
        adjustStock,
    TResult? Function(String? productUuid, String? warehouseUuid,
            DateTime? startDate, DateTime? endDate)?
        loadMovements,
    TResult? Function(
            String? productUuid, String? warehouseUuid, bool? expiringOnly)?
        loadBatches,
    TResult? Function(AlertSeverity? severity)? loadAlerts,
    TResult? Function(String uuid)? acknowledgeAlert,
    TResult? Function(String uuid, String action)? resolveAlert,
    TResult? Function()? generateAlerts,
    TResult? Function(TransferStatus? status)? loadTransfers,
    TResult? Function(AdvancedStockTransfer transfer)? createTransfer,
    TResult? Function(String uuid)? approveTransfer,
    TResult? Function(String uuid, List<AdvancedStockTransferItem> items)?
        shipTransfer,
    TResult? Function(String uuid, List<AdvancedStockTransferItem> items)?
        receiveTransfer,
    TResult? Function()? loadInsights,
    TResult? Function(String warehouseUuid)? startPhysicalCount,
  }) {
    return resolveAlert?.call(uuid, action);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? warehouseUuid)? loadDashboard,
    TResult Function()? refreshDashboard,
    TResult Function()? loadWarehouses,
    TResult Function(String? uuid)? selectWarehouse,
    TResult Function(Warehouse warehouse)? createWarehouse,
    TResult Function(Warehouse warehouse)? updateWarehouse,
    TResult Function(String? warehouseUuid, String? categoryUuid,
            String? searchQuery, bool? lowStockOnly, bool? outOfStockOnly)?
        loadStockLevels,
    TResult Function(String productUuid, String warehouseUuid,
            double quantityChange, String reason, String? notes)?
        adjustStock,
    TResult Function(String? productUuid, String? warehouseUuid,
            DateTime? startDate, DateTime? endDate)?
        loadMovements,
    TResult Function(
            String? productUuid, String? warehouseUuid, bool? expiringOnly)?
        loadBatches,
    TResult Function(AlertSeverity? severity)? loadAlerts,
    TResult Function(String uuid)? acknowledgeAlert,
    TResult Function(String uuid, String action)? resolveAlert,
    TResult Function()? generateAlerts,
    TResult Function(TransferStatus? status)? loadTransfers,
    TResult Function(AdvancedStockTransfer transfer)? createTransfer,
    TResult Function(String uuid)? approveTransfer,
    TResult Function(String uuid, List<AdvancedStockTransferItem> items)?
        shipTransfer,
    TResult Function(String uuid, List<AdvancedStockTransferItem> items)?
        receiveTransfer,
    TResult Function()? loadInsights,
    TResult Function(String warehouseUuid)? startPhysicalCount,
    required TResult orElse(),
  }) {
    if (resolveAlert != null) {
      return resolveAlert(uuid, action);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadDashboard value) loadDashboard,
    required TResult Function(_RefreshDashboard value) refreshDashboard,
    required TResult Function(_LoadWarehouses value) loadWarehouses,
    required TResult Function(_SelectWarehouse value) selectWarehouse,
    required TResult Function(_CreateWarehouse value) createWarehouse,
    required TResult Function(_UpdateWarehouse value) updateWarehouse,
    required TResult Function(_LoadStockLevels value) loadStockLevels,
    required TResult Function(_AdjustStock value) adjustStock,
    required TResult Function(_LoadMovements value) loadMovements,
    required TResult Function(_LoadBatches value) loadBatches,
    required TResult Function(_LoadAlerts value) loadAlerts,
    required TResult Function(_AcknowledgeAlert value) acknowledgeAlert,
    required TResult Function(_ResolveAlert value) resolveAlert,
    required TResult Function(_GenerateAlerts value) generateAlerts,
    required TResult Function(_LoadTransfers value) loadTransfers,
    required TResult Function(_CreateTransfer value) createTransfer,
    required TResult Function(_ApproveTransfer value) approveTransfer,
    required TResult Function(_ShipTransfer value) shipTransfer,
    required TResult Function(_ReceiveTransfer value) receiveTransfer,
    required TResult Function(_LoadInsights value) loadInsights,
    required TResult Function(_StartPhysicalCount value) startPhysicalCount,
  }) {
    return resolveAlert(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadDashboard value)? loadDashboard,
    TResult? Function(_RefreshDashboard value)? refreshDashboard,
    TResult? Function(_LoadWarehouses value)? loadWarehouses,
    TResult? Function(_SelectWarehouse value)? selectWarehouse,
    TResult? Function(_CreateWarehouse value)? createWarehouse,
    TResult? Function(_UpdateWarehouse value)? updateWarehouse,
    TResult? Function(_LoadStockLevels value)? loadStockLevels,
    TResult? Function(_AdjustStock value)? adjustStock,
    TResult? Function(_LoadMovements value)? loadMovements,
    TResult? Function(_LoadBatches value)? loadBatches,
    TResult? Function(_LoadAlerts value)? loadAlerts,
    TResult? Function(_AcknowledgeAlert value)? acknowledgeAlert,
    TResult? Function(_ResolveAlert value)? resolveAlert,
    TResult? Function(_GenerateAlerts value)? generateAlerts,
    TResult? Function(_LoadTransfers value)? loadTransfers,
    TResult? Function(_CreateTransfer value)? createTransfer,
    TResult? Function(_ApproveTransfer value)? approveTransfer,
    TResult? Function(_ShipTransfer value)? shipTransfer,
    TResult? Function(_ReceiveTransfer value)? receiveTransfer,
    TResult? Function(_LoadInsights value)? loadInsights,
    TResult? Function(_StartPhysicalCount value)? startPhysicalCount,
  }) {
    return resolveAlert?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadDashboard value)? loadDashboard,
    TResult Function(_RefreshDashboard value)? refreshDashboard,
    TResult Function(_LoadWarehouses value)? loadWarehouses,
    TResult Function(_SelectWarehouse value)? selectWarehouse,
    TResult Function(_CreateWarehouse value)? createWarehouse,
    TResult Function(_UpdateWarehouse value)? updateWarehouse,
    TResult Function(_LoadStockLevels value)? loadStockLevels,
    TResult Function(_AdjustStock value)? adjustStock,
    TResult Function(_LoadMovements value)? loadMovements,
    TResult Function(_LoadBatches value)? loadBatches,
    TResult Function(_LoadAlerts value)? loadAlerts,
    TResult Function(_AcknowledgeAlert value)? acknowledgeAlert,
    TResult Function(_ResolveAlert value)? resolveAlert,
    TResult Function(_GenerateAlerts value)? generateAlerts,
    TResult Function(_LoadTransfers value)? loadTransfers,
    TResult Function(_CreateTransfer value)? createTransfer,
    TResult Function(_ApproveTransfer value)? approveTransfer,
    TResult Function(_ShipTransfer value)? shipTransfer,
    TResult Function(_ReceiveTransfer value)? receiveTransfer,
    TResult Function(_LoadInsights value)? loadInsights,
    TResult Function(_StartPhysicalCount value)? startPhysicalCount,
    required TResult orElse(),
  }) {
    if (resolveAlert != null) {
      return resolveAlert(this);
    }
    return orElse();
  }
}

abstract class _ResolveAlert implements AdvancedInventoryEvent {
  const factory _ResolveAlert(final String uuid, final String action) =
      _$ResolveAlertImpl;

  String get uuid;
  String get action;

  /// Create a copy of AdvancedInventoryEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ResolveAlertImplCopyWith<_$ResolveAlertImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GenerateAlertsImplCopyWith<$Res> {
  factory _$$GenerateAlertsImplCopyWith(_$GenerateAlertsImpl value,
          $Res Function(_$GenerateAlertsImpl) then) =
      __$$GenerateAlertsImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GenerateAlertsImplCopyWithImpl<$Res>
    extends _$AdvancedInventoryEventCopyWithImpl<$Res, _$GenerateAlertsImpl>
    implements _$$GenerateAlertsImplCopyWith<$Res> {
  __$$GenerateAlertsImplCopyWithImpl(
      _$GenerateAlertsImpl _value, $Res Function(_$GenerateAlertsImpl) _then)
      : super(_value, _then);

  /// Create a copy of AdvancedInventoryEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$GenerateAlertsImpl implements _GenerateAlerts {
  const _$GenerateAlertsImpl();

  @override
  String toString() {
    return 'AdvancedInventoryEvent.generateAlerts()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GenerateAlertsImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? warehouseUuid) loadDashboard,
    required TResult Function() refreshDashboard,
    required TResult Function() loadWarehouses,
    required TResult Function(String? uuid) selectWarehouse,
    required TResult Function(Warehouse warehouse) createWarehouse,
    required TResult Function(Warehouse warehouse) updateWarehouse,
    required TResult Function(String? warehouseUuid, String? categoryUuid,
            String? searchQuery, bool? lowStockOnly, bool? outOfStockOnly)
        loadStockLevels,
    required TResult Function(String productUuid, String warehouseUuid,
            double quantityChange, String reason, String? notes)
        adjustStock,
    required TResult Function(String? productUuid, String? warehouseUuid,
            DateTime? startDate, DateTime? endDate)
        loadMovements,
    required TResult Function(
            String? productUuid, String? warehouseUuid, bool? expiringOnly)
        loadBatches,
    required TResult Function(AlertSeverity? severity) loadAlerts,
    required TResult Function(String uuid) acknowledgeAlert,
    required TResult Function(String uuid, String action) resolveAlert,
    required TResult Function() generateAlerts,
    required TResult Function(TransferStatus? status) loadTransfers,
    required TResult Function(AdvancedStockTransfer transfer) createTransfer,
    required TResult Function(String uuid) approveTransfer,
    required TResult Function(
            String uuid, List<AdvancedStockTransferItem> items)
        shipTransfer,
    required TResult Function(
            String uuid, List<AdvancedStockTransferItem> items)
        receiveTransfer,
    required TResult Function() loadInsights,
    required TResult Function(String warehouseUuid) startPhysicalCount,
  }) {
    return generateAlerts();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? warehouseUuid)? loadDashboard,
    TResult? Function()? refreshDashboard,
    TResult? Function()? loadWarehouses,
    TResult? Function(String? uuid)? selectWarehouse,
    TResult? Function(Warehouse warehouse)? createWarehouse,
    TResult? Function(Warehouse warehouse)? updateWarehouse,
    TResult? Function(String? warehouseUuid, String? categoryUuid,
            String? searchQuery, bool? lowStockOnly, bool? outOfStockOnly)?
        loadStockLevels,
    TResult? Function(String productUuid, String warehouseUuid,
            double quantityChange, String reason, String? notes)?
        adjustStock,
    TResult? Function(String? productUuid, String? warehouseUuid,
            DateTime? startDate, DateTime? endDate)?
        loadMovements,
    TResult? Function(
            String? productUuid, String? warehouseUuid, bool? expiringOnly)?
        loadBatches,
    TResult? Function(AlertSeverity? severity)? loadAlerts,
    TResult? Function(String uuid)? acknowledgeAlert,
    TResult? Function(String uuid, String action)? resolveAlert,
    TResult? Function()? generateAlerts,
    TResult? Function(TransferStatus? status)? loadTransfers,
    TResult? Function(AdvancedStockTransfer transfer)? createTransfer,
    TResult? Function(String uuid)? approveTransfer,
    TResult? Function(String uuid, List<AdvancedStockTransferItem> items)?
        shipTransfer,
    TResult? Function(String uuid, List<AdvancedStockTransferItem> items)?
        receiveTransfer,
    TResult? Function()? loadInsights,
    TResult? Function(String warehouseUuid)? startPhysicalCount,
  }) {
    return generateAlerts?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? warehouseUuid)? loadDashboard,
    TResult Function()? refreshDashboard,
    TResult Function()? loadWarehouses,
    TResult Function(String? uuid)? selectWarehouse,
    TResult Function(Warehouse warehouse)? createWarehouse,
    TResult Function(Warehouse warehouse)? updateWarehouse,
    TResult Function(String? warehouseUuid, String? categoryUuid,
            String? searchQuery, bool? lowStockOnly, bool? outOfStockOnly)?
        loadStockLevels,
    TResult Function(String productUuid, String warehouseUuid,
            double quantityChange, String reason, String? notes)?
        adjustStock,
    TResult Function(String? productUuid, String? warehouseUuid,
            DateTime? startDate, DateTime? endDate)?
        loadMovements,
    TResult Function(
            String? productUuid, String? warehouseUuid, bool? expiringOnly)?
        loadBatches,
    TResult Function(AlertSeverity? severity)? loadAlerts,
    TResult Function(String uuid)? acknowledgeAlert,
    TResult Function(String uuid, String action)? resolveAlert,
    TResult Function()? generateAlerts,
    TResult Function(TransferStatus? status)? loadTransfers,
    TResult Function(AdvancedStockTransfer transfer)? createTransfer,
    TResult Function(String uuid)? approveTransfer,
    TResult Function(String uuid, List<AdvancedStockTransferItem> items)?
        shipTransfer,
    TResult Function(String uuid, List<AdvancedStockTransferItem> items)?
        receiveTransfer,
    TResult Function()? loadInsights,
    TResult Function(String warehouseUuid)? startPhysicalCount,
    required TResult orElse(),
  }) {
    if (generateAlerts != null) {
      return generateAlerts();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadDashboard value) loadDashboard,
    required TResult Function(_RefreshDashboard value) refreshDashboard,
    required TResult Function(_LoadWarehouses value) loadWarehouses,
    required TResult Function(_SelectWarehouse value) selectWarehouse,
    required TResult Function(_CreateWarehouse value) createWarehouse,
    required TResult Function(_UpdateWarehouse value) updateWarehouse,
    required TResult Function(_LoadStockLevels value) loadStockLevels,
    required TResult Function(_AdjustStock value) adjustStock,
    required TResult Function(_LoadMovements value) loadMovements,
    required TResult Function(_LoadBatches value) loadBatches,
    required TResult Function(_LoadAlerts value) loadAlerts,
    required TResult Function(_AcknowledgeAlert value) acknowledgeAlert,
    required TResult Function(_ResolveAlert value) resolveAlert,
    required TResult Function(_GenerateAlerts value) generateAlerts,
    required TResult Function(_LoadTransfers value) loadTransfers,
    required TResult Function(_CreateTransfer value) createTransfer,
    required TResult Function(_ApproveTransfer value) approveTransfer,
    required TResult Function(_ShipTransfer value) shipTransfer,
    required TResult Function(_ReceiveTransfer value) receiveTransfer,
    required TResult Function(_LoadInsights value) loadInsights,
    required TResult Function(_StartPhysicalCount value) startPhysicalCount,
  }) {
    return generateAlerts(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadDashboard value)? loadDashboard,
    TResult? Function(_RefreshDashboard value)? refreshDashboard,
    TResult? Function(_LoadWarehouses value)? loadWarehouses,
    TResult? Function(_SelectWarehouse value)? selectWarehouse,
    TResult? Function(_CreateWarehouse value)? createWarehouse,
    TResult? Function(_UpdateWarehouse value)? updateWarehouse,
    TResult? Function(_LoadStockLevels value)? loadStockLevels,
    TResult? Function(_AdjustStock value)? adjustStock,
    TResult? Function(_LoadMovements value)? loadMovements,
    TResult? Function(_LoadBatches value)? loadBatches,
    TResult? Function(_LoadAlerts value)? loadAlerts,
    TResult? Function(_AcknowledgeAlert value)? acknowledgeAlert,
    TResult? Function(_ResolveAlert value)? resolveAlert,
    TResult? Function(_GenerateAlerts value)? generateAlerts,
    TResult? Function(_LoadTransfers value)? loadTransfers,
    TResult? Function(_CreateTransfer value)? createTransfer,
    TResult? Function(_ApproveTransfer value)? approveTransfer,
    TResult? Function(_ShipTransfer value)? shipTransfer,
    TResult? Function(_ReceiveTransfer value)? receiveTransfer,
    TResult? Function(_LoadInsights value)? loadInsights,
    TResult? Function(_StartPhysicalCount value)? startPhysicalCount,
  }) {
    return generateAlerts?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadDashboard value)? loadDashboard,
    TResult Function(_RefreshDashboard value)? refreshDashboard,
    TResult Function(_LoadWarehouses value)? loadWarehouses,
    TResult Function(_SelectWarehouse value)? selectWarehouse,
    TResult Function(_CreateWarehouse value)? createWarehouse,
    TResult Function(_UpdateWarehouse value)? updateWarehouse,
    TResult Function(_LoadStockLevels value)? loadStockLevels,
    TResult Function(_AdjustStock value)? adjustStock,
    TResult Function(_LoadMovements value)? loadMovements,
    TResult Function(_LoadBatches value)? loadBatches,
    TResult Function(_LoadAlerts value)? loadAlerts,
    TResult Function(_AcknowledgeAlert value)? acknowledgeAlert,
    TResult Function(_ResolveAlert value)? resolveAlert,
    TResult Function(_GenerateAlerts value)? generateAlerts,
    TResult Function(_LoadTransfers value)? loadTransfers,
    TResult Function(_CreateTransfer value)? createTransfer,
    TResult Function(_ApproveTransfer value)? approveTransfer,
    TResult Function(_ShipTransfer value)? shipTransfer,
    TResult Function(_ReceiveTransfer value)? receiveTransfer,
    TResult Function(_LoadInsights value)? loadInsights,
    TResult Function(_StartPhysicalCount value)? startPhysicalCount,
    required TResult orElse(),
  }) {
    if (generateAlerts != null) {
      return generateAlerts(this);
    }
    return orElse();
  }
}

abstract class _GenerateAlerts implements AdvancedInventoryEvent {
  const factory _GenerateAlerts() = _$GenerateAlertsImpl;
}

/// @nodoc
abstract class _$$LoadTransfersImplCopyWith<$Res> {
  factory _$$LoadTransfersImplCopyWith(
          _$LoadTransfersImpl value, $Res Function(_$LoadTransfersImpl) then) =
      __$$LoadTransfersImplCopyWithImpl<$Res>;
  @useResult
  $Res call({TransferStatus? status});
}

/// @nodoc
class __$$LoadTransfersImplCopyWithImpl<$Res>
    extends _$AdvancedInventoryEventCopyWithImpl<$Res, _$LoadTransfersImpl>
    implements _$$LoadTransfersImplCopyWith<$Res> {
  __$$LoadTransfersImplCopyWithImpl(
      _$LoadTransfersImpl _value, $Res Function(_$LoadTransfersImpl) _then)
      : super(_value, _then);

  /// Create a copy of AdvancedInventoryEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
  }) {
    return _then(_$LoadTransfersImpl(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as TransferStatus?,
    ));
  }
}

/// @nodoc

class _$LoadTransfersImpl implements _LoadTransfers {
  const _$LoadTransfersImpl({this.status});

  @override
  final TransferStatus? status;

  @override
  String toString() {
    return 'AdvancedInventoryEvent.loadTransfers(status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadTransfersImpl &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status);

  /// Create a copy of AdvancedInventoryEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadTransfersImplCopyWith<_$LoadTransfersImpl> get copyWith =>
      __$$LoadTransfersImplCopyWithImpl<_$LoadTransfersImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? warehouseUuid) loadDashboard,
    required TResult Function() refreshDashboard,
    required TResult Function() loadWarehouses,
    required TResult Function(String? uuid) selectWarehouse,
    required TResult Function(Warehouse warehouse) createWarehouse,
    required TResult Function(Warehouse warehouse) updateWarehouse,
    required TResult Function(String? warehouseUuid, String? categoryUuid,
            String? searchQuery, bool? lowStockOnly, bool? outOfStockOnly)
        loadStockLevels,
    required TResult Function(String productUuid, String warehouseUuid,
            double quantityChange, String reason, String? notes)
        adjustStock,
    required TResult Function(String? productUuid, String? warehouseUuid,
            DateTime? startDate, DateTime? endDate)
        loadMovements,
    required TResult Function(
            String? productUuid, String? warehouseUuid, bool? expiringOnly)
        loadBatches,
    required TResult Function(AlertSeverity? severity) loadAlerts,
    required TResult Function(String uuid) acknowledgeAlert,
    required TResult Function(String uuid, String action) resolveAlert,
    required TResult Function() generateAlerts,
    required TResult Function(TransferStatus? status) loadTransfers,
    required TResult Function(AdvancedStockTransfer transfer) createTransfer,
    required TResult Function(String uuid) approveTransfer,
    required TResult Function(
            String uuid, List<AdvancedStockTransferItem> items)
        shipTransfer,
    required TResult Function(
            String uuid, List<AdvancedStockTransferItem> items)
        receiveTransfer,
    required TResult Function() loadInsights,
    required TResult Function(String warehouseUuid) startPhysicalCount,
  }) {
    return loadTransfers(status);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? warehouseUuid)? loadDashboard,
    TResult? Function()? refreshDashboard,
    TResult? Function()? loadWarehouses,
    TResult? Function(String? uuid)? selectWarehouse,
    TResult? Function(Warehouse warehouse)? createWarehouse,
    TResult? Function(Warehouse warehouse)? updateWarehouse,
    TResult? Function(String? warehouseUuid, String? categoryUuid,
            String? searchQuery, bool? lowStockOnly, bool? outOfStockOnly)?
        loadStockLevels,
    TResult? Function(String productUuid, String warehouseUuid,
            double quantityChange, String reason, String? notes)?
        adjustStock,
    TResult? Function(String? productUuid, String? warehouseUuid,
            DateTime? startDate, DateTime? endDate)?
        loadMovements,
    TResult? Function(
            String? productUuid, String? warehouseUuid, bool? expiringOnly)?
        loadBatches,
    TResult? Function(AlertSeverity? severity)? loadAlerts,
    TResult? Function(String uuid)? acknowledgeAlert,
    TResult? Function(String uuid, String action)? resolveAlert,
    TResult? Function()? generateAlerts,
    TResult? Function(TransferStatus? status)? loadTransfers,
    TResult? Function(AdvancedStockTransfer transfer)? createTransfer,
    TResult? Function(String uuid)? approveTransfer,
    TResult? Function(String uuid, List<AdvancedStockTransferItem> items)?
        shipTransfer,
    TResult? Function(String uuid, List<AdvancedStockTransferItem> items)?
        receiveTransfer,
    TResult? Function()? loadInsights,
    TResult? Function(String warehouseUuid)? startPhysicalCount,
  }) {
    return loadTransfers?.call(status);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? warehouseUuid)? loadDashboard,
    TResult Function()? refreshDashboard,
    TResult Function()? loadWarehouses,
    TResult Function(String? uuid)? selectWarehouse,
    TResult Function(Warehouse warehouse)? createWarehouse,
    TResult Function(Warehouse warehouse)? updateWarehouse,
    TResult Function(String? warehouseUuid, String? categoryUuid,
            String? searchQuery, bool? lowStockOnly, bool? outOfStockOnly)?
        loadStockLevels,
    TResult Function(String productUuid, String warehouseUuid,
            double quantityChange, String reason, String? notes)?
        adjustStock,
    TResult Function(String? productUuid, String? warehouseUuid,
            DateTime? startDate, DateTime? endDate)?
        loadMovements,
    TResult Function(
            String? productUuid, String? warehouseUuid, bool? expiringOnly)?
        loadBatches,
    TResult Function(AlertSeverity? severity)? loadAlerts,
    TResult Function(String uuid)? acknowledgeAlert,
    TResult Function(String uuid, String action)? resolveAlert,
    TResult Function()? generateAlerts,
    TResult Function(TransferStatus? status)? loadTransfers,
    TResult Function(AdvancedStockTransfer transfer)? createTransfer,
    TResult Function(String uuid)? approveTransfer,
    TResult Function(String uuid, List<AdvancedStockTransferItem> items)?
        shipTransfer,
    TResult Function(String uuid, List<AdvancedStockTransferItem> items)?
        receiveTransfer,
    TResult Function()? loadInsights,
    TResult Function(String warehouseUuid)? startPhysicalCount,
    required TResult orElse(),
  }) {
    if (loadTransfers != null) {
      return loadTransfers(status);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadDashboard value) loadDashboard,
    required TResult Function(_RefreshDashboard value) refreshDashboard,
    required TResult Function(_LoadWarehouses value) loadWarehouses,
    required TResult Function(_SelectWarehouse value) selectWarehouse,
    required TResult Function(_CreateWarehouse value) createWarehouse,
    required TResult Function(_UpdateWarehouse value) updateWarehouse,
    required TResult Function(_LoadStockLevels value) loadStockLevels,
    required TResult Function(_AdjustStock value) adjustStock,
    required TResult Function(_LoadMovements value) loadMovements,
    required TResult Function(_LoadBatches value) loadBatches,
    required TResult Function(_LoadAlerts value) loadAlerts,
    required TResult Function(_AcknowledgeAlert value) acknowledgeAlert,
    required TResult Function(_ResolveAlert value) resolveAlert,
    required TResult Function(_GenerateAlerts value) generateAlerts,
    required TResult Function(_LoadTransfers value) loadTransfers,
    required TResult Function(_CreateTransfer value) createTransfer,
    required TResult Function(_ApproveTransfer value) approveTransfer,
    required TResult Function(_ShipTransfer value) shipTransfer,
    required TResult Function(_ReceiveTransfer value) receiveTransfer,
    required TResult Function(_LoadInsights value) loadInsights,
    required TResult Function(_StartPhysicalCount value) startPhysicalCount,
  }) {
    return loadTransfers(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadDashboard value)? loadDashboard,
    TResult? Function(_RefreshDashboard value)? refreshDashboard,
    TResult? Function(_LoadWarehouses value)? loadWarehouses,
    TResult? Function(_SelectWarehouse value)? selectWarehouse,
    TResult? Function(_CreateWarehouse value)? createWarehouse,
    TResult? Function(_UpdateWarehouse value)? updateWarehouse,
    TResult? Function(_LoadStockLevels value)? loadStockLevels,
    TResult? Function(_AdjustStock value)? adjustStock,
    TResult? Function(_LoadMovements value)? loadMovements,
    TResult? Function(_LoadBatches value)? loadBatches,
    TResult? Function(_LoadAlerts value)? loadAlerts,
    TResult? Function(_AcknowledgeAlert value)? acknowledgeAlert,
    TResult? Function(_ResolveAlert value)? resolveAlert,
    TResult? Function(_GenerateAlerts value)? generateAlerts,
    TResult? Function(_LoadTransfers value)? loadTransfers,
    TResult? Function(_CreateTransfer value)? createTransfer,
    TResult? Function(_ApproveTransfer value)? approveTransfer,
    TResult? Function(_ShipTransfer value)? shipTransfer,
    TResult? Function(_ReceiveTransfer value)? receiveTransfer,
    TResult? Function(_LoadInsights value)? loadInsights,
    TResult? Function(_StartPhysicalCount value)? startPhysicalCount,
  }) {
    return loadTransfers?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadDashboard value)? loadDashboard,
    TResult Function(_RefreshDashboard value)? refreshDashboard,
    TResult Function(_LoadWarehouses value)? loadWarehouses,
    TResult Function(_SelectWarehouse value)? selectWarehouse,
    TResult Function(_CreateWarehouse value)? createWarehouse,
    TResult Function(_UpdateWarehouse value)? updateWarehouse,
    TResult Function(_LoadStockLevels value)? loadStockLevels,
    TResult Function(_AdjustStock value)? adjustStock,
    TResult Function(_LoadMovements value)? loadMovements,
    TResult Function(_LoadBatches value)? loadBatches,
    TResult Function(_LoadAlerts value)? loadAlerts,
    TResult Function(_AcknowledgeAlert value)? acknowledgeAlert,
    TResult Function(_ResolveAlert value)? resolveAlert,
    TResult Function(_GenerateAlerts value)? generateAlerts,
    TResult Function(_LoadTransfers value)? loadTransfers,
    TResult Function(_CreateTransfer value)? createTransfer,
    TResult Function(_ApproveTransfer value)? approveTransfer,
    TResult Function(_ShipTransfer value)? shipTransfer,
    TResult Function(_ReceiveTransfer value)? receiveTransfer,
    TResult Function(_LoadInsights value)? loadInsights,
    TResult Function(_StartPhysicalCount value)? startPhysicalCount,
    required TResult orElse(),
  }) {
    if (loadTransfers != null) {
      return loadTransfers(this);
    }
    return orElse();
  }
}

abstract class _LoadTransfers implements AdvancedInventoryEvent {
  const factory _LoadTransfers({final TransferStatus? status}) =
      _$LoadTransfersImpl;

  TransferStatus? get status;

  /// Create a copy of AdvancedInventoryEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadTransfersImplCopyWith<_$LoadTransfersImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CreateTransferImplCopyWith<$Res> {
  factory _$$CreateTransferImplCopyWith(_$CreateTransferImpl value,
          $Res Function(_$CreateTransferImpl) then) =
      __$$CreateTransferImplCopyWithImpl<$Res>;
  @useResult
  $Res call({AdvancedStockTransfer transfer});

  $AdvancedStockTransferCopyWith<$Res> get transfer;
}

/// @nodoc
class __$$CreateTransferImplCopyWithImpl<$Res>
    extends _$AdvancedInventoryEventCopyWithImpl<$Res, _$CreateTransferImpl>
    implements _$$CreateTransferImplCopyWith<$Res> {
  __$$CreateTransferImplCopyWithImpl(
      _$CreateTransferImpl _value, $Res Function(_$CreateTransferImpl) _then)
      : super(_value, _then);

  /// Create a copy of AdvancedInventoryEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transfer = null,
  }) {
    return _then(_$CreateTransferImpl(
      null == transfer
          ? _value.transfer
          : transfer // ignore: cast_nullable_to_non_nullable
              as AdvancedStockTransfer,
    ));
  }

  /// Create a copy of AdvancedInventoryEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AdvancedStockTransferCopyWith<$Res> get transfer {
    return $AdvancedStockTransferCopyWith<$Res>(_value.transfer, (value) {
      return _then(_value.copyWith(transfer: value));
    });
  }
}

/// @nodoc

class _$CreateTransferImpl implements _CreateTransfer {
  const _$CreateTransferImpl(this.transfer);

  @override
  final AdvancedStockTransfer transfer;

  @override
  String toString() {
    return 'AdvancedInventoryEvent.createTransfer(transfer: $transfer)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateTransferImpl &&
            (identical(other.transfer, transfer) ||
                other.transfer == transfer));
  }

  @override
  int get hashCode => Object.hash(runtimeType, transfer);

  /// Create a copy of AdvancedInventoryEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateTransferImplCopyWith<_$CreateTransferImpl> get copyWith =>
      __$$CreateTransferImplCopyWithImpl<_$CreateTransferImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? warehouseUuid) loadDashboard,
    required TResult Function() refreshDashboard,
    required TResult Function() loadWarehouses,
    required TResult Function(String? uuid) selectWarehouse,
    required TResult Function(Warehouse warehouse) createWarehouse,
    required TResult Function(Warehouse warehouse) updateWarehouse,
    required TResult Function(String? warehouseUuid, String? categoryUuid,
            String? searchQuery, bool? lowStockOnly, bool? outOfStockOnly)
        loadStockLevels,
    required TResult Function(String productUuid, String warehouseUuid,
            double quantityChange, String reason, String? notes)
        adjustStock,
    required TResult Function(String? productUuid, String? warehouseUuid,
            DateTime? startDate, DateTime? endDate)
        loadMovements,
    required TResult Function(
            String? productUuid, String? warehouseUuid, bool? expiringOnly)
        loadBatches,
    required TResult Function(AlertSeverity? severity) loadAlerts,
    required TResult Function(String uuid) acknowledgeAlert,
    required TResult Function(String uuid, String action) resolveAlert,
    required TResult Function() generateAlerts,
    required TResult Function(TransferStatus? status) loadTransfers,
    required TResult Function(AdvancedStockTransfer transfer) createTransfer,
    required TResult Function(String uuid) approveTransfer,
    required TResult Function(
            String uuid, List<AdvancedStockTransferItem> items)
        shipTransfer,
    required TResult Function(
            String uuid, List<AdvancedStockTransferItem> items)
        receiveTransfer,
    required TResult Function() loadInsights,
    required TResult Function(String warehouseUuid) startPhysicalCount,
  }) {
    return createTransfer(transfer);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? warehouseUuid)? loadDashboard,
    TResult? Function()? refreshDashboard,
    TResult? Function()? loadWarehouses,
    TResult? Function(String? uuid)? selectWarehouse,
    TResult? Function(Warehouse warehouse)? createWarehouse,
    TResult? Function(Warehouse warehouse)? updateWarehouse,
    TResult? Function(String? warehouseUuid, String? categoryUuid,
            String? searchQuery, bool? lowStockOnly, bool? outOfStockOnly)?
        loadStockLevels,
    TResult? Function(String productUuid, String warehouseUuid,
            double quantityChange, String reason, String? notes)?
        adjustStock,
    TResult? Function(String? productUuid, String? warehouseUuid,
            DateTime? startDate, DateTime? endDate)?
        loadMovements,
    TResult? Function(
            String? productUuid, String? warehouseUuid, bool? expiringOnly)?
        loadBatches,
    TResult? Function(AlertSeverity? severity)? loadAlerts,
    TResult? Function(String uuid)? acknowledgeAlert,
    TResult? Function(String uuid, String action)? resolveAlert,
    TResult? Function()? generateAlerts,
    TResult? Function(TransferStatus? status)? loadTransfers,
    TResult? Function(AdvancedStockTransfer transfer)? createTransfer,
    TResult? Function(String uuid)? approveTransfer,
    TResult? Function(String uuid, List<AdvancedStockTransferItem> items)?
        shipTransfer,
    TResult? Function(String uuid, List<AdvancedStockTransferItem> items)?
        receiveTransfer,
    TResult? Function()? loadInsights,
    TResult? Function(String warehouseUuid)? startPhysicalCount,
  }) {
    return createTransfer?.call(transfer);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? warehouseUuid)? loadDashboard,
    TResult Function()? refreshDashboard,
    TResult Function()? loadWarehouses,
    TResult Function(String? uuid)? selectWarehouse,
    TResult Function(Warehouse warehouse)? createWarehouse,
    TResult Function(Warehouse warehouse)? updateWarehouse,
    TResult Function(String? warehouseUuid, String? categoryUuid,
            String? searchQuery, bool? lowStockOnly, bool? outOfStockOnly)?
        loadStockLevels,
    TResult Function(String productUuid, String warehouseUuid,
            double quantityChange, String reason, String? notes)?
        adjustStock,
    TResult Function(String? productUuid, String? warehouseUuid,
            DateTime? startDate, DateTime? endDate)?
        loadMovements,
    TResult Function(
            String? productUuid, String? warehouseUuid, bool? expiringOnly)?
        loadBatches,
    TResult Function(AlertSeverity? severity)? loadAlerts,
    TResult Function(String uuid)? acknowledgeAlert,
    TResult Function(String uuid, String action)? resolveAlert,
    TResult Function()? generateAlerts,
    TResult Function(TransferStatus? status)? loadTransfers,
    TResult Function(AdvancedStockTransfer transfer)? createTransfer,
    TResult Function(String uuid)? approveTransfer,
    TResult Function(String uuid, List<AdvancedStockTransferItem> items)?
        shipTransfer,
    TResult Function(String uuid, List<AdvancedStockTransferItem> items)?
        receiveTransfer,
    TResult Function()? loadInsights,
    TResult Function(String warehouseUuid)? startPhysicalCount,
    required TResult orElse(),
  }) {
    if (createTransfer != null) {
      return createTransfer(transfer);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadDashboard value) loadDashboard,
    required TResult Function(_RefreshDashboard value) refreshDashboard,
    required TResult Function(_LoadWarehouses value) loadWarehouses,
    required TResult Function(_SelectWarehouse value) selectWarehouse,
    required TResult Function(_CreateWarehouse value) createWarehouse,
    required TResult Function(_UpdateWarehouse value) updateWarehouse,
    required TResult Function(_LoadStockLevels value) loadStockLevels,
    required TResult Function(_AdjustStock value) adjustStock,
    required TResult Function(_LoadMovements value) loadMovements,
    required TResult Function(_LoadBatches value) loadBatches,
    required TResult Function(_LoadAlerts value) loadAlerts,
    required TResult Function(_AcknowledgeAlert value) acknowledgeAlert,
    required TResult Function(_ResolveAlert value) resolveAlert,
    required TResult Function(_GenerateAlerts value) generateAlerts,
    required TResult Function(_LoadTransfers value) loadTransfers,
    required TResult Function(_CreateTransfer value) createTransfer,
    required TResult Function(_ApproveTransfer value) approveTransfer,
    required TResult Function(_ShipTransfer value) shipTransfer,
    required TResult Function(_ReceiveTransfer value) receiveTransfer,
    required TResult Function(_LoadInsights value) loadInsights,
    required TResult Function(_StartPhysicalCount value) startPhysicalCount,
  }) {
    return createTransfer(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadDashboard value)? loadDashboard,
    TResult? Function(_RefreshDashboard value)? refreshDashboard,
    TResult? Function(_LoadWarehouses value)? loadWarehouses,
    TResult? Function(_SelectWarehouse value)? selectWarehouse,
    TResult? Function(_CreateWarehouse value)? createWarehouse,
    TResult? Function(_UpdateWarehouse value)? updateWarehouse,
    TResult? Function(_LoadStockLevels value)? loadStockLevels,
    TResult? Function(_AdjustStock value)? adjustStock,
    TResult? Function(_LoadMovements value)? loadMovements,
    TResult? Function(_LoadBatches value)? loadBatches,
    TResult? Function(_LoadAlerts value)? loadAlerts,
    TResult? Function(_AcknowledgeAlert value)? acknowledgeAlert,
    TResult? Function(_ResolveAlert value)? resolveAlert,
    TResult? Function(_GenerateAlerts value)? generateAlerts,
    TResult? Function(_LoadTransfers value)? loadTransfers,
    TResult? Function(_CreateTransfer value)? createTransfer,
    TResult? Function(_ApproveTransfer value)? approveTransfer,
    TResult? Function(_ShipTransfer value)? shipTransfer,
    TResult? Function(_ReceiveTransfer value)? receiveTransfer,
    TResult? Function(_LoadInsights value)? loadInsights,
    TResult? Function(_StartPhysicalCount value)? startPhysicalCount,
  }) {
    return createTransfer?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadDashboard value)? loadDashboard,
    TResult Function(_RefreshDashboard value)? refreshDashboard,
    TResult Function(_LoadWarehouses value)? loadWarehouses,
    TResult Function(_SelectWarehouse value)? selectWarehouse,
    TResult Function(_CreateWarehouse value)? createWarehouse,
    TResult Function(_UpdateWarehouse value)? updateWarehouse,
    TResult Function(_LoadStockLevels value)? loadStockLevels,
    TResult Function(_AdjustStock value)? adjustStock,
    TResult Function(_LoadMovements value)? loadMovements,
    TResult Function(_LoadBatches value)? loadBatches,
    TResult Function(_LoadAlerts value)? loadAlerts,
    TResult Function(_AcknowledgeAlert value)? acknowledgeAlert,
    TResult Function(_ResolveAlert value)? resolveAlert,
    TResult Function(_GenerateAlerts value)? generateAlerts,
    TResult Function(_LoadTransfers value)? loadTransfers,
    TResult Function(_CreateTransfer value)? createTransfer,
    TResult Function(_ApproveTransfer value)? approveTransfer,
    TResult Function(_ShipTransfer value)? shipTransfer,
    TResult Function(_ReceiveTransfer value)? receiveTransfer,
    TResult Function(_LoadInsights value)? loadInsights,
    TResult Function(_StartPhysicalCount value)? startPhysicalCount,
    required TResult orElse(),
  }) {
    if (createTransfer != null) {
      return createTransfer(this);
    }
    return orElse();
  }
}

abstract class _CreateTransfer implements AdvancedInventoryEvent {
  const factory _CreateTransfer(final AdvancedStockTransfer transfer) =
      _$CreateTransferImpl;

  AdvancedStockTransfer get transfer;

  /// Create a copy of AdvancedInventoryEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateTransferImplCopyWith<_$CreateTransferImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ApproveTransferImplCopyWith<$Res> {
  factory _$$ApproveTransferImplCopyWith(_$ApproveTransferImpl value,
          $Res Function(_$ApproveTransferImpl) then) =
      __$$ApproveTransferImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String uuid});
}

/// @nodoc
class __$$ApproveTransferImplCopyWithImpl<$Res>
    extends _$AdvancedInventoryEventCopyWithImpl<$Res, _$ApproveTransferImpl>
    implements _$$ApproveTransferImplCopyWith<$Res> {
  __$$ApproveTransferImplCopyWithImpl(
      _$ApproveTransferImpl _value, $Res Function(_$ApproveTransferImpl) _then)
      : super(_value, _then);

  /// Create a copy of AdvancedInventoryEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
  }) {
    return _then(_$ApproveTransferImpl(
      null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ApproveTransferImpl implements _ApproveTransfer {
  const _$ApproveTransferImpl(this.uuid);

  @override
  final String uuid;

  @override
  String toString() {
    return 'AdvancedInventoryEvent.approveTransfer(uuid: $uuid)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApproveTransferImpl &&
            (identical(other.uuid, uuid) || other.uuid == uuid));
  }

  @override
  int get hashCode => Object.hash(runtimeType, uuid);

  /// Create a copy of AdvancedInventoryEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ApproveTransferImplCopyWith<_$ApproveTransferImpl> get copyWith =>
      __$$ApproveTransferImplCopyWithImpl<_$ApproveTransferImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? warehouseUuid) loadDashboard,
    required TResult Function() refreshDashboard,
    required TResult Function() loadWarehouses,
    required TResult Function(String? uuid) selectWarehouse,
    required TResult Function(Warehouse warehouse) createWarehouse,
    required TResult Function(Warehouse warehouse) updateWarehouse,
    required TResult Function(String? warehouseUuid, String? categoryUuid,
            String? searchQuery, bool? lowStockOnly, bool? outOfStockOnly)
        loadStockLevels,
    required TResult Function(String productUuid, String warehouseUuid,
            double quantityChange, String reason, String? notes)
        adjustStock,
    required TResult Function(String? productUuid, String? warehouseUuid,
            DateTime? startDate, DateTime? endDate)
        loadMovements,
    required TResult Function(
            String? productUuid, String? warehouseUuid, bool? expiringOnly)
        loadBatches,
    required TResult Function(AlertSeverity? severity) loadAlerts,
    required TResult Function(String uuid) acknowledgeAlert,
    required TResult Function(String uuid, String action) resolveAlert,
    required TResult Function() generateAlerts,
    required TResult Function(TransferStatus? status) loadTransfers,
    required TResult Function(AdvancedStockTransfer transfer) createTransfer,
    required TResult Function(String uuid) approveTransfer,
    required TResult Function(
            String uuid, List<AdvancedStockTransferItem> items)
        shipTransfer,
    required TResult Function(
            String uuid, List<AdvancedStockTransferItem> items)
        receiveTransfer,
    required TResult Function() loadInsights,
    required TResult Function(String warehouseUuid) startPhysicalCount,
  }) {
    return approveTransfer(uuid);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? warehouseUuid)? loadDashboard,
    TResult? Function()? refreshDashboard,
    TResult? Function()? loadWarehouses,
    TResult? Function(String? uuid)? selectWarehouse,
    TResult? Function(Warehouse warehouse)? createWarehouse,
    TResult? Function(Warehouse warehouse)? updateWarehouse,
    TResult? Function(String? warehouseUuid, String? categoryUuid,
            String? searchQuery, bool? lowStockOnly, bool? outOfStockOnly)?
        loadStockLevels,
    TResult? Function(String productUuid, String warehouseUuid,
            double quantityChange, String reason, String? notes)?
        adjustStock,
    TResult? Function(String? productUuid, String? warehouseUuid,
            DateTime? startDate, DateTime? endDate)?
        loadMovements,
    TResult? Function(
            String? productUuid, String? warehouseUuid, bool? expiringOnly)?
        loadBatches,
    TResult? Function(AlertSeverity? severity)? loadAlerts,
    TResult? Function(String uuid)? acknowledgeAlert,
    TResult? Function(String uuid, String action)? resolveAlert,
    TResult? Function()? generateAlerts,
    TResult? Function(TransferStatus? status)? loadTransfers,
    TResult? Function(AdvancedStockTransfer transfer)? createTransfer,
    TResult? Function(String uuid)? approveTransfer,
    TResult? Function(String uuid, List<AdvancedStockTransferItem> items)?
        shipTransfer,
    TResult? Function(String uuid, List<AdvancedStockTransferItem> items)?
        receiveTransfer,
    TResult? Function()? loadInsights,
    TResult? Function(String warehouseUuid)? startPhysicalCount,
  }) {
    return approveTransfer?.call(uuid);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? warehouseUuid)? loadDashboard,
    TResult Function()? refreshDashboard,
    TResult Function()? loadWarehouses,
    TResult Function(String? uuid)? selectWarehouse,
    TResult Function(Warehouse warehouse)? createWarehouse,
    TResult Function(Warehouse warehouse)? updateWarehouse,
    TResult Function(String? warehouseUuid, String? categoryUuid,
            String? searchQuery, bool? lowStockOnly, bool? outOfStockOnly)?
        loadStockLevels,
    TResult Function(String productUuid, String warehouseUuid,
            double quantityChange, String reason, String? notes)?
        adjustStock,
    TResult Function(String? productUuid, String? warehouseUuid,
            DateTime? startDate, DateTime? endDate)?
        loadMovements,
    TResult Function(
            String? productUuid, String? warehouseUuid, bool? expiringOnly)?
        loadBatches,
    TResult Function(AlertSeverity? severity)? loadAlerts,
    TResult Function(String uuid)? acknowledgeAlert,
    TResult Function(String uuid, String action)? resolveAlert,
    TResult Function()? generateAlerts,
    TResult Function(TransferStatus? status)? loadTransfers,
    TResult Function(AdvancedStockTransfer transfer)? createTransfer,
    TResult Function(String uuid)? approveTransfer,
    TResult Function(String uuid, List<AdvancedStockTransferItem> items)?
        shipTransfer,
    TResult Function(String uuid, List<AdvancedStockTransferItem> items)?
        receiveTransfer,
    TResult Function()? loadInsights,
    TResult Function(String warehouseUuid)? startPhysicalCount,
    required TResult orElse(),
  }) {
    if (approveTransfer != null) {
      return approveTransfer(uuid);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadDashboard value) loadDashboard,
    required TResult Function(_RefreshDashboard value) refreshDashboard,
    required TResult Function(_LoadWarehouses value) loadWarehouses,
    required TResult Function(_SelectWarehouse value) selectWarehouse,
    required TResult Function(_CreateWarehouse value) createWarehouse,
    required TResult Function(_UpdateWarehouse value) updateWarehouse,
    required TResult Function(_LoadStockLevels value) loadStockLevels,
    required TResult Function(_AdjustStock value) adjustStock,
    required TResult Function(_LoadMovements value) loadMovements,
    required TResult Function(_LoadBatches value) loadBatches,
    required TResult Function(_LoadAlerts value) loadAlerts,
    required TResult Function(_AcknowledgeAlert value) acknowledgeAlert,
    required TResult Function(_ResolveAlert value) resolveAlert,
    required TResult Function(_GenerateAlerts value) generateAlerts,
    required TResult Function(_LoadTransfers value) loadTransfers,
    required TResult Function(_CreateTransfer value) createTransfer,
    required TResult Function(_ApproveTransfer value) approveTransfer,
    required TResult Function(_ShipTransfer value) shipTransfer,
    required TResult Function(_ReceiveTransfer value) receiveTransfer,
    required TResult Function(_LoadInsights value) loadInsights,
    required TResult Function(_StartPhysicalCount value) startPhysicalCount,
  }) {
    return approveTransfer(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadDashboard value)? loadDashboard,
    TResult? Function(_RefreshDashboard value)? refreshDashboard,
    TResult? Function(_LoadWarehouses value)? loadWarehouses,
    TResult? Function(_SelectWarehouse value)? selectWarehouse,
    TResult? Function(_CreateWarehouse value)? createWarehouse,
    TResult? Function(_UpdateWarehouse value)? updateWarehouse,
    TResult? Function(_LoadStockLevels value)? loadStockLevels,
    TResult? Function(_AdjustStock value)? adjustStock,
    TResult? Function(_LoadMovements value)? loadMovements,
    TResult? Function(_LoadBatches value)? loadBatches,
    TResult? Function(_LoadAlerts value)? loadAlerts,
    TResult? Function(_AcknowledgeAlert value)? acknowledgeAlert,
    TResult? Function(_ResolveAlert value)? resolveAlert,
    TResult? Function(_GenerateAlerts value)? generateAlerts,
    TResult? Function(_LoadTransfers value)? loadTransfers,
    TResult? Function(_CreateTransfer value)? createTransfer,
    TResult? Function(_ApproveTransfer value)? approveTransfer,
    TResult? Function(_ShipTransfer value)? shipTransfer,
    TResult? Function(_ReceiveTransfer value)? receiveTransfer,
    TResult? Function(_LoadInsights value)? loadInsights,
    TResult? Function(_StartPhysicalCount value)? startPhysicalCount,
  }) {
    return approveTransfer?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadDashboard value)? loadDashboard,
    TResult Function(_RefreshDashboard value)? refreshDashboard,
    TResult Function(_LoadWarehouses value)? loadWarehouses,
    TResult Function(_SelectWarehouse value)? selectWarehouse,
    TResult Function(_CreateWarehouse value)? createWarehouse,
    TResult Function(_UpdateWarehouse value)? updateWarehouse,
    TResult Function(_LoadStockLevels value)? loadStockLevels,
    TResult Function(_AdjustStock value)? adjustStock,
    TResult Function(_LoadMovements value)? loadMovements,
    TResult Function(_LoadBatches value)? loadBatches,
    TResult Function(_LoadAlerts value)? loadAlerts,
    TResult Function(_AcknowledgeAlert value)? acknowledgeAlert,
    TResult Function(_ResolveAlert value)? resolveAlert,
    TResult Function(_GenerateAlerts value)? generateAlerts,
    TResult Function(_LoadTransfers value)? loadTransfers,
    TResult Function(_CreateTransfer value)? createTransfer,
    TResult Function(_ApproveTransfer value)? approveTransfer,
    TResult Function(_ShipTransfer value)? shipTransfer,
    TResult Function(_ReceiveTransfer value)? receiveTransfer,
    TResult Function(_LoadInsights value)? loadInsights,
    TResult Function(_StartPhysicalCount value)? startPhysicalCount,
    required TResult orElse(),
  }) {
    if (approveTransfer != null) {
      return approveTransfer(this);
    }
    return orElse();
  }
}

abstract class _ApproveTransfer implements AdvancedInventoryEvent {
  const factory _ApproveTransfer(final String uuid) = _$ApproveTransferImpl;

  String get uuid;

  /// Create a copy of AdvancedInventoryEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ApproveTransferImplCopyWith<_$ApproveTransferImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ShipTransferImplCopyWith<$Res> {
  factory _$$ShipTransferImplCopyWith(
          _$ShipTransferImpl value, $Res Function(_$ShipTransferImpl) then) =
      __$$ShipTransferImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String uuid, List<AdvancedStockTransferItem> items});
}

/// @nodoc
class __$$ShipTransferImplCopyWithImpl<$Res>
    extends _$AdvancedInventoryEventCopyWithImpl<$Res, _$ShipTransferImpl>
    implements _$$ShipTransferImplCopyWith<$Res> {
  __$$ShipTransferImplCopyWithImpl(
      _$ShipTransferImpl _value, $Res Function(_$ShipTransferImpl) _then)
      : super(_value, _then);

  /// Create a copy of AdvancedInventoryEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
    Object? items = null,
  }) {
    return _then(_$ShipTransferImpl(
      null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<AdvancedStockTransferItem>,
    ));
  }
}

/// @nodoc

class _$ShipTransferImpl implements _ShipTransfer {
  const _$ShipTransferImpl(
      this.uuid, final List<AdvancedStockTransferItem> items)
      : _items = items;

  @override
  final String uuid;
  final List<AdvancedStockTransferItem> _items;
  @override
  List<AdvancedStockTransferItem> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  String toString() {
    return 'AdvancedInventoryEvent.shipTransfer(uuid: $uuid, items: $items)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShipTransferImpl &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, uuid, const DeepCollectionEquality().hash(_items));

  /// Create a copy of AdvancedInventoryEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ShipTransferImplCopyWith<_$ShipTransferImpl> get copyWith =>
      __$$ShipTransferImplCopyWithImpl<_$ShipTransferImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? warehouseUuid) loadDashboard,
    required TResult Function() refreshDashboard,
    required TResult Function() loadWarehouses,
    required TResult Function(String? uuid) selectWarehouse,
    required TResult Function(Warehouse warehouse) createWarehouse,
    required TResult Function(Warehouse warehouse) updateWarehouse,
    required TResult Function(String? warehouseUuid, String? categoryUuid,
            String? searchQuery, bool? lowStockOnly, bool? outOfStockOnly)
        loadStockLevels,
    required TResult Function(String productUuid, String warehouseUuid,
            double quantityChange, String reason, String? notes)
        adjustStock,
    required TResult Function(String? productUuid, String? warehouseUuid,
            DateTime? startDate, DateTime? endDate)
        loadMovements,
    required TResult Function(
            String? productUuid, String? warehouseUuid, bool? expiringOnly)
        loadBatches,
    required TResult Function(AlertSeverity? severity) loadAlerts,
    required TResult Function(String uuid) acknowledgeAlert,
    required TResult Function(String uuid, String action) resolveAlert,
    required TResult Function() generateAlerts,
    required TResult Function(TransferStatus? status) loadTransfers,
    required TResult Function(AdvancedStockTransfer transfer) createTransfer,
    required TResult Function(String uuid) approveTransfer,
    required TResult Function(
            String uuid, List<AdvancedStockTransferItem> items)
        shipTransfer,
    required TResult Function(
            String uuid, List<AdvancedStockTransferItem> items)
        receiveTransfer,
    required TResult Function() loadInsights,
    required TResult Function(String warehouseUuid) startPhysicalCount,
  }) {
    return shipTransfer(uuid, items);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? warehouseUuid)? loadDashboard,
    TResult? Function()? refreshDashboard,
    TResult? Function()? loadWarehouses,
    TResult? Function(String? uuid)? selectWarehouse,
    TResult? Function(Warehouse warehouse)? createWarehouse,
    TResult? Function(Warehouse warehouse)? updateWarehouse,
    TResult? Function(String? warehouseUuid, String? categoryUuid,
            String? searchQuery, bool? lowStockOnly, bool? outOfStockOnly)?
        loadStockLevels,
    TResult? Function(String productUuid, String warehouseUuid,
            double quantityChange, String reason, String? notes)?
        adjustStock,
    TResult? Function(String? productUuid, String? warehouseUuid,
            DateTime? startDate, DateTime? endDate)?
        loadMovements,
    TResult? Function(
            String? productUuid, String? warehouseUuid, bool? expiringOnly)?
        loadBatches,
    TResult? Function(AlertSeverity? severity)? loadAlerts,
    TResult? Function(String uuid)? acknowledgeAlert,
    TResult? Function(String uuid, String action)? resolveAlert,
    TResult? Function()? generateAlerts,
    TResult? Function(TransferStatus? status)? loadTransfers,
    TResult? Function(AdvancedStockTransfer transfer)? createTransfer,
    TResult? Function(String uuid)? approveTransfer,
    TResult? Function(String uuid, List<AdvancedStockTransferItem> items)?
        shipTransfer,
    TResult? Function(String uuid, List<AdvancedStockTransferItem> items)?
        receiveTransfer,
    TResult? Function()? loadInsights,
    TResult? Function(String warehouseUuid)? startPhysicalCount,
  }) {
    return shipTransfer?.call(uuid, items);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? warehouseUuid)? loadDashboard,
    TResult Function()? refreshDashboard,
    TResult Function()? loadWarehouses,
    TResult Function(String? uuid)? selectWarehouse,
    TResult Function(Warehouse warehouse)? createWarehouse,
    TResult Function(Warehouse warehouse)? updateWarehouse,
    TResult Function(String? warehouseUuid, String? categoryUuid,
            String? searchQuery, bool? lowStockOnly, bool? outOfStockOnly)?
        loadStockLevels,
    TResult Function(String productUuid, String warehouseUuid,
            double quantityChange, String reason, String? notes)?
        adjustStock,
    TResult Function(String? productUuid, String? warehouseUuid,
            DateTime? startDate, DateTime? endDate)?
        loadMovements,
    TResult Function(
            String? productUuid, String? warehouseUuid, bool? expiringOnly)?
        loadBatches,
    TResult Function(AlertSeverity? severity)? loadAlerts,
    TResult Function(String uuid)? acknowledgeAlert,
    TResult Function(String uuid, String action)? resolveAlert,
    TResult Function()? generateAlerts,
    TResult Function(TransferStatus? status)? loadTransfers,
    TResult Function(AdvancedStockTransfer transfer)? createTransfer,
    TResult Function(String uuid)? approveTransfer,
    TResult Function(String uuid, List<AdvancedStockTransferItem> items)?
        shipTransfer,
    TResult Function(String uuid, List<AdvancedStockTransferItem> items)?
        receiveTransfer,
    TResult Function()? loadInsights,
    TResult Function(String warehouseUuid)? startPhysicalCount,
    required TResult orElse(),
  }) {
    if (shipTransfer != null) {
      return shipTransfer(uuid, items);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadDashboard value) loadDashboard,
    required TResult Function(_RefreshDashboard value) refreshDashboard,
    required TResult Function(_LoadWarehouses value) loadWarehouses,
    required TResult Function(_SelectWarehouse value) selectWarehouse,
    required TResult Function(_CreateWarehouse value) createWarehouse,
    required TResult Function(_UpdateWarehouse value) updateWarehouse,
    required TResult Function(_LoadStockLevels value) loadStockLevels,
    required TResult Function(_AdjustStock value) adjustStock,
    required TResult Function(_LoadMovements value) loadMovements,
    required TResult Function(_LoadBatches value) loadBatches,
    required TResult Function(_LoadAlerts value) loadAlerts,
    required TResult Function(_AcknowledgeAlert value) acknowledgeAlert,
    required TResult Function(_ResolveAlert value) resolveAlert,
    required TResult Function(_GenerateAlerts value) generateAlerts,
    required TResult Function(_LoadTransfers value) loadTransfers,
    required TResult Function(_CreateTransfer value) createTransfer,
    required TResult Function(_ApproveTransfer value) approveTransfer,
    required TResult Function(_ShipTransfer value) shipTransfer,
    required TResult Function(_ReceiveTransfer value) receiveTransfer,
    required TResult Function(_LoadInsights value) loadInsights,
    required TResult Function(_StartPhysicalCount value) startPhysicalCount,
  }) {
    return shipTransfer(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadDashboard value)? loadDashboard,
    TResult? Function(_RefreshDashboard value)? refreshDashboard,
    TResult? Function(_LoadWarehouses value)? loadWarehouses,
    TResult? Function(_SelectWarehouse value)? selectWarehouse,
    TResult? Function(_CreateWarehouse value)? createWarehouse,
    TResult? Function(_UpdateWarehouse value)? updateWarehouse,
    TResult? Function(_LoadStockLevels value)? loadStockLevels,
    TResult? Function(_AdjustStock value)? adjustStock,
    TResult? Function(_LoadMovements value)? loadMovements,
    TResult? Function(_LoadBatches value)? loadBatches,
    TResult? Function(_LoadAlerts value)? loadAlerts,
    TResult? Function(_AcknowledgeAlert value)? acknowledgeAlert,
    TResult? Function(_ResolveAlert value)? resolveAlert,
    TResult? Function(_GenerateAlerts value)? generateAlerts,
    TResult? Function(_LoadTransfers value)? loadTransfers,
    TResult? Function(_CreateTransfer value)? createTransfer,
    TResult? Function(_ApproveTransfer value)? approveTransfer,
    TResult? Function(_ShipTransfer value)? shipTransfer,
    TResult? Function(_ReceiveTransfer value)? receiveTransfer,
    TResult? Function(_LoadInsights value)? loadInsights,
    TResult? Function(_StartPhysicalCount value)? startPhysicalCount,
  }) {
    return shipTransfer?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadDashboard value)? loadDashboard,
    TResult Function(_RefreshDashboard value)? refreshDashboard,
    TResult Function(_LoadWarehouses value)? loadWarehouses,
    TResult Function(_SelectWarehouse value)? selectWarehouse,
    TResult Function(_CreateWarehouse value)? createWarehouse,
    TResult Function(_UpdateWarehouse value)? updateWarehouse,
    TResult Function(_LoadStockLevels value)? loadStockLevels,
    TResult Function(_AdjustStock value)? adjustStock,
    TResult Function(_LoadMovements value)? loadMovements,
    TResult Function(_LoadBatches value)? loadBatches,
    TResult Function(_LoadAlerts value)? loadAlerts,
    TResult Function(_AcknowledgeAlert value)? acknowledgeAlert,
    TResult Function(_ResolveAlert value)? resolveAlert,
    TResult Function(_GenerateAlerts value)? generateAlerts,
    TResult Function(_LoadTransfers value)? loadTransfers,
    TResult Function(_CreateTransfer value)? createTransfer,
    TResult Function(_ApproveTransfer value)? approveTransfer,
    TResult Function(_ShipTransfer value)? shipTransfer,
    TResult Function(_ReceiveTransfer value)? receiveTransfer,
    TResult Function(_LoadInsights value)? loadInsights,
    TResult Function(_StartPhysicalCount value)? startPhysicalCount,
    required TResult orElse(),
  }) {
    if (shipTransfer != null) {
      return shipTransfer(this);
    }
    return orElse();
  }
}

abstract class _ShipTransfer implements AdvancedInventoryEvent {
  const factory _ShipTransfer(
          final String uuid, final List<AdvancedStockTransferItem> items) =
      _$ShipTransferImpl;

  String get uuid;
  List<AdvancedStockTransferItem> get items;

  /// Create a copy of AdvancedInventoryEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ShipTransferImplCopyWith<_$ShipTransferImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ReceiveTransferImplCopyWith<$Res> {
  factory _$$ReceiveTransferImplCopyWith(_$ReceiveTransferImpl value,
          $Res Function(_$ReceiveTransferImpl) then) =
      __$$ReceiveTransferImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String uuid, List<AdvancedStockTransferItem> items});
}

/// @nodoc
class __$$ReceiveTransferImplCopyWithImpl<$Res>
    extends _$AdvancedInventoryEventCopyWithImpl<$Res, _$ReceiveTransferImpl>
    implements _$$ReceiveTransferImplCopyWith<$Res> {
  __$$ReceiveTransferImplCopyWithImpl(
      _$ReceiveTransferImpl _value, $Res Function(_$ReceiveTransferImpl) _then)
      : super(_value, _then);

  /// Create a copy of AdvancedInventoryEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
    Object? items = null,
  }) {
    return _then(_$ReceiveTransferImpl(
      null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<AdvancedStockTransferItem>,
    ));
  }
}

/// @nodoc

class _$ReceiveTransferImpl implements _ReceiveTransfer {
  const _$ReceiveTransferImpl(
      this.uuid, final List<AdvancedStockTransferItem> items)
      : _items = items;

  @override
  final String uuid;
  final List<AdvancedStockTransferItem> _items;
  @override
  List<AdvancedStockTransferItem> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  String toString() {
    return 'AdvancedInventoryEvent.receiveTransfer(uuid: $uuid, items: $items)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReceiveTransferImpl &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, uuid, const DeepCollectionEquality().hash(_items));

  /// Create a copy of AdvancedInventoryEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReceiveTransferImplCopyWith<_$ReceiveTransferImpl> get copyWith =>
      __$$ReceiveTransferImplCopyWithImpl<_$ReceiveTransferImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? warehouseUuid) loadDashboard,
    required TResult Function() refreshDashboard,
    required TResult Function() loadWarehouses,
    required TResult Function(String? uuid) selectWarehouse,
    required TResult Function(Warehouse warehouse) createWarehouse,
    required TResult Function(Warehouse warehouse) updateWarehouse,
    required TResult Function(String? warehouseUuid, String? categoryUuid,
            String? searchQuery, bool? lowStockOnly, bool? outOfStockOnly)
        loadStockLevels,
    required TResult Function(String productUuid, String warehouseUuid,
            double quantityChange, String reason, String? notes)
        adjustStock,
    required TResult Function(String? productUuid, String? warehouseUuid,
            DateTime? startDate, DateTime? endDate)
        loadMovements,
    required TResult Function(
            String? productUuid, String? warehouseUuid, bool? expiringOnly)
        loadBatches,
    required TResult Function(AlertSeverity? severity) loadAlerts,
    required TResult Function(String uuid) acknowledgeAlert,
    required TResult Function(String uuid, String action) resolveAlert,
    required TResult Function() generateAlerts,
    required TResult Function(TransferStatus? status) loadTransfers,
    required TResult Function(AdvancedStockTransfer transfer) createTransfer,
    required TResult Function(String uuid) approveTransfer,
    required TResult Function(
            String uuid, List<AdvancedStockTransferItem> items)
        shipTransfer,
    required TResult Function(
            String uuid, List<AdvancedStockTransferItem> items)
        receiveTransfer,
    required TResult Function() loadInsights,
    required TResult Function(String warehouseUuid) startPhysicalCount,
  }) {
    return receiveTransfer(uuid, items);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? warehouseUuid)? loadDashboard,
    TResult? Function()? refreshDashboard,
    TResult? Function()? loadWarehouses,
    TResult? Function(String? uuid)? selectWarehouse,
    TResult? Function(Warehouse warehouse)? createWarehouse,
    TResult? Function(Warehouse warehouse)? updateWarehouse,
    TResult? Function(String? warehouseUuid, String? categoryUuid,
            String? searchQuery, bool? lowStockOnly, bool? outOfStockOnly)?
        loadStockLevels,
    TResult? Function(String productUuid, String warehouseUuid,
            double quantityChange, String reason, String? notes)?
        adjustStock,
    TResult? Function(String? productUuid, String? warehouseUuid,
            DateTime? startDate, DateTime? endDate)?
        loadMovements,
    TResult? Function(
            String? productUuid, String? warehouseUuid, bool? expiringOnly)?
        loadBatches,
    TResult? Function(AlertSeverity? severity)? loadAlerts,
    TResult? Function(String uuid)? acknowledgeAlert,
    TResult? Function(String uuid, String action)? resolveAlert,
    TResult? Function()? generateAlerts,
    TResult? Function(TransferStatus? status)? loadTransfers,
    TResult? Function(AdvancedStockTransfer transfer)? createTransfer,
    TResult? Function(String uuid)? approveTransfer,
    TResult? Function(String uuid, List<AdvancedStockTransferItem> items)?
        shipTransfer,
    TResult? Function(String uuid, List<AdvancedStockTransferItem> items)?
        receiveTransfer,
    TResult? Function()? loadInsights,
    TResult? Function(String warehouseUuid)? startPhysicalCount,
  }) {
    return receiveTransfer?.call(uuid, items);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? warehouseUuid)? loadDashboard,
    TResult Function()? refreshDashboard,
    TResult Function()? loadWarehouses,
    TResult Function(String? uuid)? selectWarehouse,
    TResult Function(Warehouse warehouse)? createWarehouse,
    TResult Function(Warehouse warehouse)? updateWarehouse,
    TResult Function(String? warehouseUuid, String? categoryUuid,
            String? searchQuery, bool? lowStockOnly, bool? outOfStockOnly)?
        loadStockLevels,
    TResult Function(String productUuid, String warehouseUuid,
            double quantityChange, String reason, String? notes)?
        adjustStock,
    TResult Function(String? productUuid, String? warehouseUuid,
            DateTime? startDate, DateTime? endDate)?
        loadMovements,
    TResult Function(
            String? productUuid, String? warehouseUuid, bool? expiringOnly)?
        loadBatches,
    TResult Function(AlertSeverity? severity)? loadAlerts,
    TResult Function(String uuid)? acknowledgeAlert,
    TResult Function(String uuid, String action)? resolveAlert,
    TResult Function()? generateAlerts,
    TResult Function(TransferStatus? status)? loadTransfers,
    TResult Function(AdvancedStockTransfer transfer)? createTransfer,
    TResult Function(String uuid)? approveTransfer,
    TResult Function(String uuid, List<AdvancedStockTransferItem> items)?
        shipTransfer,
    TResult Function(String uuid, List<AdvancedStockTransferItem> items)?
        receiveTransfer,
    TResult Function()? loadInsights,
    TResult Function(String warehouseUuid)? startPhysicalCount,
    required TResult orElse(),
  }) {
    if (receiveTransfer != null) {
      return receiveTransfer(uuid, items);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadDashboard value) loadDashboard,
    required TResult Function(_RefreshDashboard value) refreshDashboard,
    required TResult Function(_LoadWarehouses value) loadWarehouses,
    required TResult Function(_SelectWarehouse value) selectWarehouse,
    required TResult Function(_CreateWarehouse value) createWarehouse,
    required TResult Function(_UpdateWarehouse value) updateWarehouse,
    required TResult Function(_LoadStockLevels value) loadStockLevels,
    required TResult Function(_AdjustStock value) adjustStock,
    required TResult Function(_LoadMovements value) loadMovements,
    required TResult Function(_LoadBatches value) loadBatches,
    required TResult Function(_LoadAlerts value) loadAlerts,
    required TResult Function(_AcknowledgeAlert value) acknowledgeAlert,
    required TResult Function(_ResolveAlert value) resolveAlert,
    required TResult Function(_GenerateAlerts value) generateAlerts,
    required TResult Function(_LoadTransfers value) loadTransfers,
    required TResult Function(_CreateTransfer value) createTransfer,
    required TResult Function(_ApproveTransfer value) approveTransfer,
    required TResult Function(_ShipTransfer value) shipTransfer,
    required TResult Function(_ReceiveTransfer value) receiveTransfer,
    required TResult Function(_LoadInsights value) loadInsights,
    required TResult Function(_StartPhysicalCount value) startPhysicalCount,
  }) {
    return receiveTransfer(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadDashboard value)? loadDashboard,
    TResult? Function(_RefreshDashboard value)? refreshDashboard,
    TResult? Function(_LoadWarehouses value)? loadWarehouses,
    TResult? Function(_SelectWarehouse value)? selectWarehouse,
    TResult? Function(_CreateWarehouse value)? createWarehouse,
    TResult? Function(_UpdateWarehouse value)? updateWarehouse,
    TResult? Function(_LoadStockLevels value)? loadStockLevels,
    TResult? Function(_AdjustStock value)? adjustStock,
    TResult? Function(_LoadMovements value)? loadMovements,
    TResult? Function(_LoadBatches value)? loadBatches,
    TResult? Function(_LoadAlerts value)? loadAlerts,
    TResult? Function(_AcknowledgeAlert value)? acknowledgeAlert,
    TResult? Function(_ResolveAlert value)? resolveAlert,
    TResult? Function(_GenerateAlerts value)? generateAlerts,
    TResult? Function(_LoadTransfers value)? loadTransfers,
    TResult? Function(_CreateTransfer value)? createTransfer,
    TResult? Function(_ApproveTransfer value)? approveTransfer,
    TResult? Function(_ShipTransfer value)? shipTransfer,
    TResult? Function(_ReceiveTransfer value)? receiveTransfer,
    TResult? Function(_LoadInsights value)? loadInsights,
    TResult? Function(_StartPhysicalCount value)? startPhysicalCount,
  }) {
    return receiveTransfer?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadDashboard value)? loadDashboard,
    TResult Function(_RefreshDashboard value)? refreshDashboard,
    TResult Function(_LoadWarehouses value)? loadWarehouses,
    TResult Function(_SelectWarehouse value)? selectWarehouse,
    TResult Function(_CreateWarehouse value)? createWarehouse,
    TResult Function(_UpdateWarehouse value)? updateWarehouse,
    TResult Function(_LoadStockLevels value)? loadStockLevels,
    TResult Function(_AdjustStock value)? adjustStock,
    TResult Function(_LoadMovements value)? loadMovements,
    TResult Function(_LoadBatches value)? loadBatches,
    TResult Function(_LoadAlerts value)? loadAlerts,
    TResult Function(_AcknowledgeAlert value)? acknowledgeAlert,
    TResult Function(_ResolveAlert value)? resolveAlert,
    TResult Function(_GenerateAlerts value)? generateAlerts,
    TResult Function(_LoadTransfers value)? loadTransfers,
    TResult Function(_CreateTransfer value)? createTransfer,
    TResult Function(_ApproveTransfer value)? approveTransfer,
    TResult Function(_ShipTransfer value)? shipTransfer,
    TResult Function(_ReceiveTransfer value)? receiveTransfer,
    TResult Function(_LoadInsights value)? loadInsights,
    TResult Function(_StartPhysicalCount value)? startPhysicalCount,
    required TResult orElse(),
  }) {
    if (receiveTransfer != null) {
      return receiveTransfer(this);
    }
    return orElse();
  }
}

abstract class _ReceiveTransfer implements AdvancedInventoryEvent {
  const factory _ReceiveTransfer(
          final String uuid, final List<AdvancedStockTransferItem> items) =
      _$ReceiveTransferImpl;

  String get uuid;
  List<AdvancedStockTransferItem> get items;

  /// Create a copy of AdvancedInventoryEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReceiveTransferImplCopyWith<_$ReceiveTransferImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadInsightsImplCopyWith<$Res> {
  factory _$$LoadInsightsImplCopyWith(
          _$LoadInsightsImpl value, $Res Function(_$LoadInsightsImpl) then) =
      __$$LoadInsightsImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadInsightsImplCopyWithImpl<$Res>
    extends _$AdvancedInventoryEventCopyWithImpl<$Res, _$LoadInsightsImpl>
    implements _$$LoadInsightsImplCopyWith<$Res> {
  __$$LoadInsightsImplCopyWithImpl(
      _$LoadInsightsImpl _value, $Res Function(_$LoadInsightsImpl) _then)
      : super(_value, _then);

  /// Create a copy of AdvancedInventoryEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadInsightsImpl implements _LoadInsights {
  const _$LoadInsightsImpl();

  @override
  String toString() {
    return 'AdvancedInventoryEvent.loadInsights()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadInsightsImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? warehouseUuid) loadDashboard,
    required TResult Function() refreshDashboard,
    required TResult Function() loadWarehouses,
    required TResult Function(String? uuid) selectWarehouse,
    required TResult Function(Warehouse warehouse) createWarehouse,
    required TResult Function(Warehouse warehouse) updateWarehouse,
    required TResult Function(String? warehouseUuid, String? categoryUuid,
            String? searchQuery, bool? lowStockOnly, bool? outOfStockOnly)
        loadStockLevels,
    required TResult Function(String productUuid, String warehouseUuid,
            double quantityChange, String reason, String? notes)
        adjustStock,
    required TResult Function(String? productUuid, String? warehouseUuid,
            DateTime? startDate, DateTime? endDate)
        loadMovements,
    required TResult Function(
            String? productUuid, String? warehouseUuid, bool? expiringOnly)
        loadBatches,
    required TResult Function(AlertSeverity? severity) loadAlerts,
    required TResult Function(String uuid) acknowledgeAlert,
    required TResult Function(String uuid, String action) resolveAlert,
    required TResult Function() generateAlerts,
    required TResult Function(TransferStatus? status) loadTransfers,
    required TResult Function(AdvancedStockTransfer transfer) createTransfer,
    required TResult Function(String uuid) approveTransfer,
    required TResult Function(
            String uuid, List<AdvancedStockTransferItem> items)
        shipTransfer,
    required TResult Function(
            String uuid, List<AdvancedStockTransferItem> items)
        receiveTransfer,
    required TResult Function() loadInsights,
    required TResult Function(String warehouseUuid) startPhysicalCount,
  }) {
    return loadInsights();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? warehouseUuid)? loadDashboard,
    TResult? Function()? refreshDashboard,
    TResult? Function()? loadWarehouses,
    TResult? Function(String? uuid)? selectWarehouse,
    TResult? Function(Warehouse warehouse)? createWarehouse,
    TResult? Function(Warehouse warehouse)? updateWarehouse,
    TResult? Function(String? warehouseUuid, String? categoryUuid,
            String? searchQuery, bool? lowStockOnly, bool? outOfStockOnly)?
        loadStockLevels,
    TResult? Function(String productUuid, String warehouseUuid,
            double quantityChange, String reason, String? notes)?
        adjustStock,
    TResult? Function(String? productUuid, String? warehouseUuid,
            DateTime? startDate, DateTime? endDate)?
        loadMovements,
    TResult? Function(
            String? productUuid, String? warehouseUuid, bool? expiringOnly)?
        loadBatches,
    TResult? Function(AlertSeverity? severity)? loadAlerts,
    TResult? Function(String uuid)? acknowledgeAlert,
    TResult? Function(String uuid, String action)? resolveAlert,
    TResult? Function()? generateAlerts,
    TResult? Function(TransferStatus? status)? loadTransfers,
    TResult? Function(AdvancedStockTransfer transfer)? createTransfer,
    TResult? Function(String uuid)? approveTransfer,
    TResult? Function(String uuid, List<AdvancedStockTransferItem> items)?
        shipTransfer,
    TResult? Function(String uuid, List<AdvancedStockTransferItem> items)?
        receiveTransfer,
    TResult? Function()? loadInsights,
    TResult? Function(String warehouseUuid)? startPhysicalCount,
  }) {
    return loadInsights?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? warehouseUuid)? loadDashboard,
    TResult Function()? refreshDashboard,
    TResult Function()? loadWarehouses,
    TResult Function(String? uuid)? selectWarehouse,
    TResult Function(Warehouse warehouse)? createWarehouse,
    TResult Function(Warehouse warehouse)? updateWarehouse,
    TResult Function(String? warehouseUuid, String? categoryUuid,
            String? searchQuery, bool? lowStockOnly, bool? outOfStockOnly)?
        loadStockLevels,
    TResult Function(String productUuid, String warehouseUuid,
            double quantityChange, String reason, String? notes)?
        adjustStock,
    TResult Function(String? productUuid, String? warehouseUuid,
            DateTime? startDate, DateTime? endDate)?
        loadMovements,
    TResult Function(
            String? productUuid, String? warehouseUuid, bool? expiringOnly)?
        loadBatches,
    TResult Function(AlertSeverity? severity)? loadAlerts,
    TResult Function(String uuid)? acknowledgeAlert,
    TResult Function(String uuid, String action)? resolveAlert,
    TResult Function()? generateAlerts,
    TResult Function(TransferStatus? status)? loadTransfers,
    TResult Function(AdvancedStockTransfer transfer)? createTransfer,
    TResult Function(String uuid)? approveTransfer,
    TResult Function(String uuid, List<AdvancedStockTransferItem> items)?
        shipTransfer,
    TResult Function(String uuid, List<AdvancedStockTransferItem> items)?
        receiveTransfer,
    TResult Function()? loadInsights,
    TResult Function(String warehouseUuid)? startPhysicalCount,
    required TResult orElse(),
  }) {
    if (loadInsights != null) {
      return loadInsights();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadDashboard value) loadDashboard,
    required TResult Function(_RefreshDashboard value) refreshDashboard,
    required TResult Function(_LoadWarehouses value) loadWarehouses,
    required TResult Function(_SelectWarehouse value) selectWarehouse,
    required TResult Function(_CreateWarehouse value) createWarehouse,
    required TResult Function(_UpdateWarehouse value) updateWarehouse,
    required TResult Function(_LoadStockLevels value) loadStockLevels,
    required TResult Function(_AdjustStock value) adjustStock,
    required TResult Function(_LoadMovements value) loadMovements,
    required TResult Function(_LoadBatches value) loadBatches,
    required TResult Function(_LoadAlerts value) loadAlerts,
    required TResult Function(_AcknowledgeAlert value) acknowledgeAlert,
    required TResult Function(_ResolveAlert value) resolveAlert,
    required TResult Function(_GenerateAlerts value) generateAlerts,
    required TResult Function(_LoadTransfers value) loadTransfers,
    required TResult Function(_CreateTransfer value) createTransfer,
    required TResult Function(_ApproveTransfer value) approveTransfer,
    required TResult Function(_ShipTransfer value) shipTransfer,
    required TResult Function(_ReceiveTransfer value) receiveTransfer,
    required TResult Function(_LoadInsights value) loadInsights,
    required TResult Function(_StartPhysicalCount value) startPhysicalCount,
  }) {
    return loadInsights(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadDashboard value)? loadDashboard,
    TResult? Function(_RefreshDashboard value)? refreshDashboard,
    TResult? Function(_LoadWarehouses value)? loadWarehouses,
    TResult? Function(_SelectWarehouse value)? selectWarehouse,
    TResult? Function(_CreateWarehouse value)? createWarehouse,
    TResult? Function(_UpdateWarehouse value)? updateWarehouse,
    TResult? Function(_LoadStockLevels value)? loadStockLevels,
    TResult? Function(_AdjustStock value)? adjustStock,
    TResult? Function(_LoadMovements value)? loadMovements,
    TResult? Function(_LoadBatches value)? loadBatches,
    TResult? Function(_LoadAlerts value)? loadAlerts,
    TResult? Function(_AcknowledgeAlert value)? acknowledgeAlert,
    TResult? Function(_ResolveAlert value)? resolveAlert,
    TResult? Function(_GenerateAlerts value)? generateAlerts,
    TResult? Function(_LoadTransfers value)? loadTransfers,
    TResult? Function(_CreateTransfer value)? createTransfer,
    TResult? Function(_ApproveTransfer value)? approveTransfer,
    TResult? Function(_ShipTransfer value)? shipTransfer,
    TResult? Function(_ReceiveTransfer value)? receiveTransfer,
    TResult? Function(_LoadInsights value)? loadInsights,
    TResult? Function(_StartPhysicalCount value)? startPhysicalCount,
  }) {
    return loadInsights?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadDashboard value)? loadDashboard,
    TResult Function(_RefreshDashboard value)? refreshDashboard,
    TResult Function(_LoadWarehouses value)? loadWarehouses,
    TResult Function(_SelectWarehouse value)? selectWarehouse,
    TResult Function(_CreateWarehouse value)? createWarehouse,
    TResult Function(_UpdateWarehouse value)? updateWarehouse,
    TResult Function(_LoadStockLevels value)? loadStockLevels,
    TResult Function(_AdjustStock value)? adjustStock,
    TResult Function(_LoadMovements value)? loadMovements,
    TResult Function(_LoadBatches value)? loadBatches,
    TResult Function(_LoadAlerts value)? loadAlerts,
    TResult Function(_AcknowledgeAlert value)? acknowledgeAlert,
    TResult Function(_ResolveAlert value)? resolveAlert,
    TResult Function(_GenerateAlerts value)? generateAlerts,
    TResult Function(_LoadTransfers value)? loadTransfers,
    TResult Function(_CreateTransfer value)? createTransfer,
    TResult Function(_ApproveTransfer value)? approveTransfer,
    TResult Function(_ShipTransfer value)? shipTransfer,
    TResult Function(_ReceiveTransfer value)? receiveTransfer,
    TResult Function(_LoadInsights value)? loadInsights,
    TResult Function(_StartPhysicalCount value)? startPhysicalCount,
    required TResult orElse(),
  }) {
    if (loadInsights != null) {
      return loadInsights(this);
    }
    return orElse();
  }
}

abstract class _LoadInsights implements AdvancedInventoryEvent {
  const factory _LoadInsights() = _$LoadInsightsImpl;
}

/// @nodoc
abstract class _$$StartPhysicalCountImplCopyWith<$Res> {
  factory _$$StartPhysicalCountImplCopyWith(_$StartPhysicalCountImpl value,
          $Res Function(_$StartPhysicalCountImpl) then) =
      __$$StartPhysicalCountImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String warehouseUuid});
}

/// @nodoc
class __$$StartPhysicalCountImplCopyWithImpl<$Res>
    extends _$AdvancedInventoryEventCopyWithImpl<$Res, _$StartPhysicalCountImpl>
    implements _$$StartPhysicalCountImplCopyWith<$Res> {
  __$$StartPhysicalCountImplCopyWithImpl(_$StartPhysicalCountImpl _value,
      $Res Function(_$StartPhysicalCountImpl) _then)
      : super(_value, _then);

  /// Create a copy of AdvancedInventoryEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? warehouseUuid = null,
  }) {
    return _then(_$StartPhysicalCountImpl(
      null == warehouseUuid
          ? _value.warehouseUuid
          : warehouseUuid // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$StartPhysicalCountImpl implements _StartPhysicalCount {
  const _$StartPhysicalCountImpl(this.warehouseUuid);

  @override
  final String warehouseUuid;

  @override
  String toString() {
    return 'AdvancedInventoryEvent.startPhysicalCount(warehouseUuid: $warehouseUuid)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StartPhysicalCountImpl &&
            (identical(other.warehouseUuid, warehouseUuid) ||
                other.warehouseUuid == warehouseUuid));
  }

  @override
  int get hashCode => Object.hash(runtimeType, warehouseUuid);

  /// Create a copy of AdvancedInventoryEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StartPhysicalCountImplCopyWith<_$StartPhysicalCountImpl> get copyWith =>
      __$$StartPhysicalCountImplCopyWithImpl<_$StartPhysicalCountImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? warehouseUuid) loadDashboard,
    required TResult Function() refreshDashboard,
    required TResult Function() loadWarehouses,
    required TResult Function(String? uuid) selectWarehouse,
    required TResult Function(Warehouse warehouse) createWarehouse,
    required TResult Function(Warehouse warehouse) updateWarehouse,
    required TResult Function(String? warehouseUuid, String? categoryUuid,
            String? searchQuery, bool? lowStockOnly, bool? outOfStockOnly)
        loadStockLevels,
    required TResult Function(String productUuid, String warehouseUuid,
            double quantityChange, String reason, String? notes)
        adjustStock,
    required TResult Function(String? productUuid, String? warehouseUuid,
            DateTime? startDate, DateTime? endDate)
        loadMovements,
    required TResult Function(
            String? productUuid, String? warehouseUuid, bool? expiringOnly)
        loadBatches,
    required TResult Function(AlertSeverity? severity) loadAlerts,
    required TResult Function(String uuid) acknowledgeAlert,
    required TResult Function(String uuid, String action) resolveAlert,
    required TResult Function() generateAlerts,
    required TResult Function(TransferStatus? status) loadTransfers,
    required TResult Function(AdvancedStockTransfer transfer) createTransfer,
    required TResult Function(String uuid) approveTransfer,
    required TResult Function(
            String uuid, List<AdvancedStockTransferItem> items)
        shipTransfer,
    required TResult Function(
            String uuid, List<AdvancedStockTransferItem> items)
        receiveTransfer,
    required TResult Function() loadInsights,
    required TResult Function(String warehouseUuid) startPhysicalCount,
  }) {
    return startPhysicalCount(warehouseUuid);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? warehouseUuid)? loadDashboard,
    TResult? Function()? refreshDashboard,
    TResult? Function()? loadWarehouses,
    TResult? Function(String? uuid)? selectWarehouse,
    TResult? Function(Warehouse warehouse)? createWarehouse,
    TResult? Function(Warehouse warehouse)? updateWarehouse,
    TResult? Function(String? warehouseUuid, String? categoryUuid,
            String? searchQuery, bool? lowStockOnly, bool? outOfStockOnly)?
        loadStockLevels,
    TResult? Function(String productUuid, String warehouseUuid,
            double quantityChange, String reason, String? notes)?
        adjustStock,
    TResult? Function(String? productUuid, String? warehouseUuid,
            DateTime? startDate, DateTime? endDate)?
        loadMovements,
    TResult? Function(
            String? productUuid, String? warehouseUuid, bool? expiringOnly)?
        loadBatches,
    TResult? Function(AlertSeverity? severity)? loadAlerts,
    TResult? Function(String uuid)? acknowledgeAlert,
    TResult? Function(String uuid, String action)? resolveAlert,
    TResult? Function()? generateAlerts,
    TResult? Function(TransferStatus? status)? loadTransfers,
    TResult? Function(AdvancedStockTransfer transfer)? createTransfer,
    TResult? Function(String uuid)? approveTransfer,
    TResult? Function(String uuid, List<AdvancedStockTransferItem> items)?
        shipTransfer,
    TResult? Function(String uuid, List<AdvancedStockTransferItem> items)?
        receiveTransfer,
    TResult? Function()? loadInsights,
    TResult? Function(String warehouseUuid)? startPhysicalCount,
  }) {
    return startPhysicalCount?.call(warehouseUuid);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? warehouseUuid)? loadDashboard,
    TResult Function()? refreshDashboard,
    TResult Function()? loadWarehouses,
    TResult Function(String? uuid)? selectWarehouse,
    TResult Function(Warehouse warehouse)? createWarehouse,
    TResult Function(Warehouse warehouse)? updateWarehouse,
    TResult Function(String? warehouseUuid, String? categoryUuid,
            String? searchQuery, bool? lowStockOnly, bool? outOfStockOnly)?
        loadStockLevels,
    TResult Function(String productUuid, String warehouseUuid,
            double quantityChange, String reason, String? notes)?
        adjustStock,
    TResult Function(String? productUuid, String? warehouseUuid,
            DateTime? startDate, DateTime? endDate)?
        loadMovements,
    TResult Function(
            String? productUuid, String? warehouseUuid, bool? expiringOnly)?
        loadBatches,
    TResult Function(AlertSeverity? severity)? loadAlerts,
    TResult Function(String uuid)? acknowledgeAlert,
    TResult Function(String uuid, String action)? resolveAlert,
    TResult Function()? generateAlerts,
    TResult Function(TransferStatus? status)? loadTransfers,
    TResult Function(AdvancedStockTransfer transfer)? createTransfer,
    TResult Function(String uuid)? approveTransfer,
    TResult Function(String uuid, List<AdvancedStockTransferItem> items)?
        shipTransfer,
    TResult Function(String uuid, List<AdvancedStockTransferItem> items)?
        receiveTransfer,
    TResult Function()? loadInsights,
    TResult Function(String warehouseUuid)? startPhysicalCount,
    required TResult orElse(),
  }) {
    if (startPhysicalCount != null) {
      return startPhysicalCount(warehouseUuid);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadDashboard value) loadDashboard,
    required TResult Function(_RefreshDashboard value) refreshDashboard,
    required TResult Function(_LoadWarehouses value) loadWarehouses,
    required TResult Function(_SelectWarehouse value) selectWarehouse,
    required TResult Function(_CreateWarehouse value) createWarehouse,
    required TResult Function(_UpdateWarehouse value) updateWarehouse,
    required TResult Function(_LoadStockLevels value) loadStockLevels,
    required TResult Function(_AdjustStock value) adjustStock,
    required TResult Function(_LoadMovements value) loadMovements,
    required TResult Function(_LoadBatches value) loadBatches,
    required TResult Function(_LoadAlerts value) loadAlerts,
    required TResult Function(_AcknowledgeAlert value) acknowledgeAlert,
    required TResult Function(_ResolveAlert value) resolveAlert,
    required TResult Function(_GenerateAlerts value) generateAlerts,
    required TResult Function(_LoadTransfers value) loadTransfers,
    required TResult Function(_CreateTransfer value) createTransfer,
    required TResult Function(_ApproveTransfer value) approveTransfer,
    required TResult Function(_ShipTransfer value) shipTransfer,
    required TResult Function(_ReceiveTransfer value) receiveTransfer,
    required TResult Function(_LoadInsights value) loadInsights,
    required TResult Function(_StartPhysicalCount value) startPhysicalCount,
  }) {
    return startPhysicalCount(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadDashboard value)? loadDashboard,
    TResult? Function(_RefreshDashboard value)? refreshDashboard,
    TResult? Function(_LoadWarehouses value)? loadWarehouses,
    TResult? Function(_SelectWarehouse value)? selectWarehouse,
    TResult? Function(_CreateWarehouse value)? createWarehouse,
    TResult? Function(_UpdateWarehouse value)? updateWarehouse,
    TResult? Function(_LoadStockLevels value)? loadStockLevels,
    TResult? Function(_AdjustStock value)? adjustStock,
    TResult? Function(_LoadMovements value)? loadMovements,
    TResult? Function(_LoadBatches value)? loadBatches,
    TResult? Function(_LoadAlerts value)? loadAlerts,
    TResult? Function(_AcknowledgeAlert value)? acknowledgeAlert,
    TResult? Function(_ResolveAlert value)? resolveAlert,
    TResult? Function(_GenerateAlerts value)? generateAlerts,
    TResult? Function(_LoadTransfers value)? loadTransfers,
    TResult? Function(_CreateTransfer value)? createTransfer,
    TResult? Function(_ApproveTransfer value)? approveTransfer,
    TResult? Function(_ShipTransfer value)? shipTransfer,
    TResult? Function(_ReceiveTransfer value)? receiveTransfer,
    TResult? Function(_LoadInsights value)? loadInsights,
    TResult? Function(_StartPhysicalCount value)? startPhysicalCount,
  }) {
    return startPhysicalCount?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadDashboard value)? loadDashboard,
    TResult Function(_RefreshDashboard value)? refreshDashboard,
    TResult Function(_LoadWarehouses value)? loadWarehouses,
    TResult Function(_SelectWarehouse value)? selectWarehouse,
    TResult Function(_CreateWarehouse value)? createWarehouse,
    TResult Function(_UpdateWarehouse value)? updateWarehouse,
    TResult Function(_LoadStockLevels value)? loadStockLevels,
    TResult Function(_AdjustStock value)? adjustStock,
    TResult Function(_LoadMovements value)? loadMovements,
    TResult Function(_LoadBatches value)? loadBatches,
    TResult Function(_LoadAlerts value)? loadAlerts,
    TResult Function(_AcknowledgeAlert value)? acknowledgeAlert,
    TResult Function(_ResolveAlert value)? resolveAlert,
    TResult Function(_GenerateAlerts value)? generateAlerts,
    TResult Function(_LoadTransfers value)? loadTransfers,
    TResult Function(_CreateTransfer value)? createTransfer,
    TResult Function(_ApproveTransfer value)? approveTransfer,
    TResult Function(_ShipTransfer value)? shipTransfer,
    TResult Function(_ReceiveTransfer value)? receiveTransfer,
    TResult Function(_LoadInsights value)? loadInsights,
    TResult Function(_StartPhysicalCount value)? startPhysicalCount,
    required TResult orElse(),
  }) {
    if (startPhysicalCount != null) {
      return startPhysicalCount(this);
    }
    return orElse();
  }
}

abstract class _StartPhysicalCount implements AdvancedInventoryEvent {
  const factory _StartPhysicalCount(final String warehouseUuid) =
      _$StartPhysicalCountImpl;

  String get warehouseUuid;

  /// Create a copy of AdvancedInventoryEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StartPhysicalCountImplCopyWith<_$StartPhysicalCountImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$AdvancedInventoryState {
// Loading states
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isRefreshing => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError; // Dashboard
  InventoryDashboardStats? get dashboardStats =>
      throw _privateConstructorUsedError; // Warehouses
  List<Warehouse> get warehouses => throw _privateConstructorUsedError;
  String? get selectedWarehouseUuid =>
      throw _privateConstructorUsedError; // Stock Levels
  List<StockLevel> get stockLevels => throw _privateConstructorUsedError;
  bool get isLoadingStock => throw _privateConstructorUsedError; // Movements
  List<StockMovement> get movements => throw _privateConstructorUsedError;
  bool get isLoadingMovements => throw _privateConstructorUsedError; // Batches
  List<Batch> get batches => throw _privateConstructorUsedError;
  bool get isLoadingBatches => throw _privateConstructorUsedError; // Alerts
  List<StockAlert> get alerts => throw _privateConstructorUsedError;
  int get unacknowledgedAlertCount =>
      throw _privateConstructorUsedError; // Transfers
  List<AdvancedStockTransfer> get transfers =>
      throw _privateConstructorUsedError;
  bool get isLoadingTransfers => throw _privateConstructorUsedError; // Insights
  List<InventoryInsight> get insights =>
      throw _privateConstructorUsedError; // Physical Count
  String? get activeCountSessionUuid =>
      throw _privateConstructorUsedError; // Operation success/failure
  String? get successMessage => throw _privateConstructorUsedError;

  /// Create a copy of AdvancedInventoryState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AdvancedInventoryStateCopyWith<AdvancedInventoryState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AdvancedInventoryStateCopyWith<$Res> {
  factory $AdvancedInventoryStateCopyWith(AdvancedInventoryState value,
          $Res Function(AdvancedInventoryState) then) =
      _$AdvancedInventoryStateCopyWithImpl<$Res, AdvancedInventoryState>;
  @useResult
  $Res call(
      {bool isLoading,
      bool isRefreshing,
      String? error,
      InventoryDashboardStats? dashboardStats,
      List<Warehouse> warehouses,
      String? selectedWarehouseUuid,
      List<StockLevel> stockLevels,
      bool isLoadingStock,
      List<StockMovement> movements,
      bool isLoadingMovements,
      List<Batch> batches,
      bool isLoadingBatches,
      List<StockAlert> alerts,
      int unacknowledgedAlertCount,
      List<AdvancedStockTransfer> transfers,
      bool isLoadingTransfers,
      List<InventoryInsight> insights,
      String? activeCountSessionUuid,
      String? successMessage});

  $InventoryDashboardStatsCopyWith<$Res>? get dashboardStats;
}

/// @nodoc
class _$AdvancedInventoryStateCopyWithImpl<$Res,
        $Val extends AdvancedInventoryState>
    implements $AdvancedInventoryStateCopyWith<$Res> {
  _$AdvancedInventoryStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AdvancedInventoryState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isRefreshing = null,
    Object? error = freezed,
    Object? dashboardStats = freezed,
    Object? warehouses = null,
    Object? selectedWarehouseUuid = freezed,
    Object? stockLevels = null,
    Object? isLoadingStock = null,
    Object? movements = null,
    Object? isLoadingMovements = null,
    Object? batches = null,
    Object? isLoadingBatches = null,
    Object? alerts = null,
    Object? unacknowledgedAlertCount = null,
    Object? transfers = null,
    Object? isLoadingTransfers = null,
    Object? insights = null,
    Object? activeCountSessionUuid = freezed,
    Object? successMessage = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isRefreshing: null == isRefreshing
          ? _value.isRefreshing
          : isRefreshing // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      dashboardStats: freezed == dashboardStats
          ? _value.dashboardStats
          : dashboardStats // ignore: cast_nullable_to_non_nullable
              as InventoryDashboardStats?,
      warehouses: null == warehouses
          ? _value.warehouses
          : warehouses // ignore: cast_nullable_to_non_nullable
              as List<Warehouse>,
      selectedWarehouseUuid: freezed == selectedWarehouseUuid
          ? _value.selectedWarehouseUuid
          : selectedWarehouseUuid // ignore: cast_nullable_to_non_nullable
              as String?,
      stockLevels: null == stockLevels
          ? _value.stockLevels
          : stockLevels // ignore: cast_nullable_to_non_nullable
              as List<StockLevel>,
      isLoadingStock: null == isLoadingStock
          ? _value.isLoadingStock
          : isLoadingStock // ignore: cast_nullable_to_non_nullable
              as bool,
      movements: null == movements
          ? _value.movements
          : movements // ignore: cast_nullable_to_non_nullable
              as List<StockMovement>,
      isLoadingMovements: null == isLoadingMovements
          ? _value.isLoadingMovements
          : isLoadingMovements // ignore: cast_nullable_to_non_nullable
              as bool,
      batches: null == batches
          ? _value.batches
          : batches // ignore: cast_nullable_to_non_nullable
              as List<Batch>,
      isLoadingBatches: null == isLoadingBatches
          ? _value.isLoadingBatches
          : isLoadingBatches // ignore: cast_nullable_to_non_nullable
              as bool,
      alerts: null == alerts
          ? _value.alerts
          : alerts // ignore: cast_nullable_to_non_nullable
              as List<StockAlert>,
      unacknowledgedAlertCount: null == unacknowledgedAlertCount
          ? _value.unacknowledgedAlertCount
          : unacknowledgedAlertCount // ignore: cast_nullable_to_non_nullable
              as int,
      transfers: null == transfers
          ? _value.transfers
          : transfers // ignore: cast_nullable_to_non_nullable
              as List<AdvancedStockTransfer>,
      isLoadingTransfers: null == isLoadingTransfers
          ? _value.isLoadingTransfers
          : isLoadingTransfers // ignore: cast_nullable_to_non_nullable
              as bool,
      insights: null == insights
          ? _value.insights
          : insights // ignore: cast_nullable_to_non_nullable
              as List<InventoryInsight>,
      activeCountSessionUuid: freezed == activeCountSessionUuid
          ? _value.activeCountSessionUuid
          : activeCountSessionUuid // ignore: cast_nullable_to_non_nullable
              as String?,
      successMessage: freezed == successMessage
          ? _value.successMessage
          : successMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  /// Create a copy of AdvancedInventoryState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $InventoryDashboardStatsCopyWith<$Res>? get dashboardStats {
    if (_value.dashboardStats == null) {
      return null;
    }

    return $InventoryDashboardStatsCopyWith<$Res>(_value.dashboardStats!,
        (value) {
      return _then(_value.copyWith(dashboardStats: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AdvancedInventoryStateImplCopyWith<$Res>
    implements $AdvancedInventoryStateCopyWith<$Res> {
  factory _$$AdvancedInventoryStateImplCopyWith(
          _$AdvancedInventoryStateImpl value,
          $Res Function(_$AdvancedInventoryStateImpl) then) =
      __$$AdvancedInventoryStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      bool isRefreshing,
      String? error,
      InventoryDashboardStats? dashboardStats,
      List<Warehouse> warehouses,
      String? selectedWarehouseUuid,
      List<StockLevel> stockLevels,
      bool isLoadingStock,
      List<StockMovement> movements,
      bool isLoadingMovements,
      List<Batch> batches,
      bool isLoadingBatches,
      List<StockAlert> alerts,
      int unacknowledgedAlertCount,
      List<AdvancedStockTransfer> transfers,
      bool isLoadingTransfers,
      List<InventoryInsight> insights,
      String? activeCountSessionUuid,
      String? successMessage});

  @override
  $InventoryDashboardStatsCopyWith<$Res>? get dashboardStats;
}

/// @nodoc
class __$$AdvancedInventoryStateImplCopyWithImpl<$Res>
    extends _$AdvancedInventoryStateCopyWithImpl<$Res,
        _$AdvancedInventoryStateImpl>
    implements _$$AdvancedInventoryStateImplCopyWith<$Res> {
  __$$AdvancedInventoryStateImplCopyWithImpl(
      _$AdvancedInventoryStateImpl _value,
      $Res Function(_$AdvancedInventoryStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of AdvancedInventoryState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isRefreshing = null,
    Object? error = freezed,
    Object? dashboardStats = freezed,
    Object? warehouses = null,
    Object? selectedWarehouseUuid = freezed,
    Object? stockLevels = null,
    Object? isLoadingStock = null,
    Object? movements = null,
    Object? isLoadingMovements = null,
    Object? batches = null,
    Object? isLoadingBatches = null,
    Object? alerts = null,
    Object? unacknowledgedAlertCount = null,
    Object? transfers = null,
    Object? isLoadingTransfers = null,
    Object? insights = null,
    Object? activeCountSessionUuid = freezed,
    Object? successMessage = freezed,
  }) {
    return _then(_$AdvancedInventoryStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isRefreshing: null == isRefreshing
          ? _value.isRefreshing
          : isRefreshing // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      dashboardStats: freezed == dashboardStats
          ? _value.dashboardStats
          : dashboardStats // ignore: cast_nullable_to_non_nullable
              as InventoryDashboardStats?,
      warehouses: null == warehouses
          ? _value._warehouses
          : warehouses // ignore: cast_nullable_to_non_nullable
              as List<Warehouse>,
      selectedWarehouseUuid: freezed == selectedWarehouseUuid
          ? _value.selectedWarehouseUuid
          : selectedWarehouseUuid // ignore: cast_nullable_to_non_nullable
              as String?,
      stockLevels: null == stockLevels
          ? _value._stockLevels
          : stockLevels // ignore: cast_nullable_to_non_nullable
              as List<StockLevel>,
      isLoadingStock: null == isLoadingStock
          ? _value.isLoadingStock
          : isLoadingStock // ignore: cast_nullable_to_non_nullable
              as bool,
      movements: null == movements
          ? _value._movements
          : movements // ignore: cast_nullable_to_non_nullable
              as List<StockMovement>,
      isLoadingMovements: null == isLoadingMovements
          ? _value.isLoadingMovements
          : isLoadingMovements // ignore: cast_nullable_to_non_nullable
              as bool,
      batches: null == batches
          ? _value._batches
          : batches // ignore: cast_nullable_to_non_nullable
              as List<Batch>,
      isLoadingBatches: null == isLoadingBatches
          ? _value.isLoadingBatches
          : isLoadingBatches // ignore: cast_nullable_to_non_nullable
              as bool,
      alerts: null == alerts
          ? _value._alerts
          : alerts // ignore: cast_nullable_to_non_nullable
              as List<StockAlert>,
      unacknowledgedAlertCount: null == unacknowledgedAlertCount
          ? _value.unacknowledgedAlertCount
          : unacknowledgedAlertCount // ignore: cast_nullable_to_non_nullable
              as int,
      transfers: null == transfers
          ? _value._transfers
          : transfers // ignore: cast_nullable_to_non_nullable
              as List<AdvancedStockTransfer>,
      isLoadingTransfers: null == isLoadingTransfers
          ? _value.isLoadingTransfers
          : isLoadingTransfers // ignore: cast_nullable_to_non_nullable
              as bool,
      insights: null == insights
          ? _value._insights
          : insights // ignore: cast_nullable_to_non_nullable
              as List<InventoryInsight>,
      activeCountSessionUuid: freezed == activeCountSessionUuid
          ? _value.activeCountSessionUuid
          : activeCountSessionUuid // ignore: cast_nullable_to_non_nullable
              as String?,
      successMessage: freezed == successMessage
          ? _value.successMessage
          : successMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$AdvancedInventoryStateImpl implements _AdvancedInventoryState {
  const _$AdvancedInventoryStateImpl(
      {this.isLoading = false,
      this.isRefreshing = false,
      this.error,
      this.dashboardStats,
      final List<Warehouse> warehouses = const [],
      this.selectedWarehouseUuid,
      final List<StockLevel> stockLevels = const [],
      this.isLoadingStock = false,
      final List<StockMovement> movements = const [],
      this.isLoadingMovements = false,
      final List<Batch> batches = const [],
      this.isLoadingBatches = false,
      final List<StockAlert> alerts = const [],
      this.unacknowledgedAlertCount = 0,
      final List<AdvancedStockTransfer> transfers = const [],
      this.isLoadingTransfers = false,
      final List<InventoryInsight> insights = const [],
      this.activeCountSessionUuid,
      this.successMessage})
      : _warehouses = warehouses,
        _stockLevels = stockLevels,
        _movements = movements,
        _batches = batches,
        _alerts = alerts,
        _transfers = transfers,
        _insights = insights;

// Loading states
  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isRefreshing;
  @override
  final String? error;
// Dashboard
  @override
  final InventoryDashboardStats? dashboardStats;
// Warehouses
  final List<Warehouse> _warehouses;
// Warehouses
  @override
  @JsonKey()
  List<Warehouse> get warehouses {
    if (_warehouses is EqualUnmodifiableListView) return _warehouses;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_warehouses);
  }

  @override
  final String? selectedWarehouseUuid;
// Stock Levels
  final List<StockLevel> _stockLevels;
// Stock Levels
  @override
  @JsonKey()
  List<StockLevel> get stockLevels {
    if (_stockLevels is EqualUnmodifiableListView) return _stockLevels;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_stockLevels);
  }

  @override
  @JsonKey()
  final bool isLoadingStock;
// Movements
  final List<StockMovement> _movements;
// Movements
  @override
  @JsonKey()
  List<StockMovement> get movements {
    if (_movements is EqualUnmodifiableListView) return _movements;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_movements);
  }

  @override
  @JsonKey()
  final bool isLoadingMovements;
// Batches
  final List<Batch> _batches;
// Batches
  @override
  @JsonKey()
  List<Batch> get batches {
    if (_batches is EqualUnmodifiableListView) return _batches;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_batches);
  }

  @override
  @JsonKey()
  final bool isLoadingBatches;
// Alerts
  final List<StockAlert> _alerts;
// Alerts
  @override
  @JsonKey()
  List<StockAlert> get alerts {
    if (_alerts is EqualUnmodifiableListView) return _alerts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_alerts);
  }

  @override
  @JsonKey()
  final int unacknowledgedAlertCount;
// Transfers
  final List<AdvancedStockTransfer> _transfers;
// Transfers
  @override
  @JsonKey()
  List<AdvancedStockTransfer> get transfers {
    if (_transfers is EqualUnmodifiableListView) return _transfers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_transfers);
  }

  @override
  @JsonKey()
  final bool isLoadingTransfers;
// Insights
  final List<InventoryInsight> _insights;
// Insights
  @override
  @JsonKey()
  List<InventoryInsight> get insights {
    if (_insights is EqualUnmodifiableListView) return _insights;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_insights);
  }

// Physical Count
  @override
  final String? activeCountSessionUuid;
// Operation success/failure
  @override
  final String? successMessage;

  @override
  String toString() {
    return 'AdvancedInventoryState(isLoading: $isLoading, isRefreshing: $isRefreshing, error: $error, dashboardStats: $dashboardStats, warehouses: $warehouses, selectedWarehouseUuid: $selectedWarehouseUuid, stockLevels: $stockLevels, isLoadingStock: $isLoadingStock, movements: $movements, isLoadingMovements: $isLoadingMovements, batches: $batches, isLoadingBatches: $isLoadingBatches, alerts: $alerts, unacknowledgedAlertCount: $unacknowledgedAlertCount, transfers: $transfers, isLoadingTransfers: $isLoadingTransfers, insights: $insights, activeCountSessionUuid: $activeCountSessionUuid, successMessage: $successMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AdvancedInventoryStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isRefreshing, isRefreshing) ||
                other.isRefreshing == isRefreshing) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.dashboardStats, dashboardStats) ||
                other.dashboardStats == dashboardStats) &&
            const DeepCollectionEquality()
                .equals(other._warehouses, _warehouses) &&
            (identical(other.selectedWarehouseUuid, selectedWarehouseUuid) ||
                other.selectedWarehouseUuid == selectedWarehouseUuid) &&
            const DeepCollectionEquality()
                .equals(other._stockLevels, _stockLevels) &&
            (identical(other.isLoadingStock, isLoadingStock) ||
                other.isLoadingStock == isLoadingStock) &&
            const DeepCollectionEquality()
                .equals(other._movements, _movements) &&
            (identical(other.isLoadingMovements, isLoadingMovements) ||
                other.isLoadingMovements == isLoadingMovements) &&
            const DeepCollectionEquality().equals(other._batches, _batches) &&
            (identical(other.isLoadingBatches, isLoadingBatches) ||
                other.isLoadingBatches == isLoadingBatches) &&
            const DeepCollectionEquality().equals(other._alerts, _alerts) &&
            (identical(
                    other.unacknowledgedAlertCount, unacknowledgedAlertCount) ||
                other.unacknowledgedAlertCount == unacknowledgedAlertCount) &&
            const DeepCollectionEquality()
                .equals(other._transfers, _transfers) &&
            (identical(other.isLoadingTransfers, isLoadingTransfers) ||
                other.isLoadingTransfers == isLoadingTransfers) &&
            const DeepCollectionEquality().equals(other._insights, _insights) &&
            (identical(other.activeCountSessionUuid, activeCountSessionUuid) ||
                other.activeCountSessionUuid == activeCountSessionUuid) &&
            (identical(other.successMessage, successMessage) ||
                other.successMessage == successMessage));
  }

  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        isLoading,
        isRefreshing,
        error,
        dashboardStats,
        const DeepCollectionEquality().hash(_warehouses),
        selectedWarehouseUuid,
        const DeepCollectionEquality().hash(_stockLevels),
        isLoadingStock,
        const DeepCollectionEquality().hash(_movements),
        isLoadingMovements,
        const DeepCollectionEquality().hash(_batches),
        isLoadingBatches,
        const DeepCollectionEquality().hash(_alerts),
        unacknowledgedAlertCount,
        const DeepCollectionEquality().hash(_transfers),
        isLoadingTransfers,
        const DeepCollectionEquality().hash(_insights),
        activeCountSessionUuid,
        successMessage
      ]);

  /// Create a copy of AdvancedInventoryState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AdvancedInventoryStateImplCopyWith<_$AdvancedInventoryStateImpl>
      get copyWith => __$$AdvancedInventoryStateImplCopyWithImpl<
          _$AdvancedInventoryStateImpl>(this, _$identity);
}

abstract class _AdvancedInventoryState implements AdvancedInventoryState {
  const factory _AdvancedInventoryState(
      {final bool isLoading,
      final bool isRefreshing,
      final String? error,
      final InventoryDashboardStats? dashboardStats,
      final List<Warehouse> warehouses,
      final String? selectedWarehouseUuid,
      final List<StockLevel> stockLevels,
      final bool isLoadingStock,
      final List<StockMovement> movements,
      final bool isLoadingMovements,
      final List<Batch> batches,
      final bool isLoadingBatches,
      final List<StockAlert> alerts,
      final int unacknowledgedAlertCount,
      final List<AdvancedStockTransfer> transfers,
      final bool isLoadingTransfers,
      final List<InventoryInsight> insights,
      final String? activeCountSessionUuid,
      final String? successMessage}) = _$AdvancedInventoryStateImpl;

// Loading states
  @override
  bool get isLoading;
  @override
  bool get isRefreshing;
  @override
  String? get error; // Dashboard
  @override
  InventoryDashboardStats? get dashboardStats; // Warehouses
  @override
  List<Warehouse> get warehouses;
  @override
  String? get selectedWarehouseUuid; // Stock Levels
  @override
  List<StockLevel> get stockLevels;
  @override
  bool get isLoadingStock; // Movements
  @override
  List<StockMovement> get movements;
  @override
  bool get isLoadingMovements; // Batches
  @override
  List<Batch> get batches;
  @override
  bool get isLoadingBatches; // Alerts
  @override
  List<StockAlert> get alerts;
  @override
  int get unacknowledgedAlertCount; // Transfers
  @override
  List<AdvancedStockTransfer> get transfers;
  @override
  bool get isLoadingTransfers; // Insights
  @override
  List<InventoryInsight> get insights; // Physical Count
  @override
  String? get activeCountSessionUuid; // Operation success/failure
  @override
  String? get successMessage;

  /// Create a copy of AdvancedInventoryState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AdvancedInventoryStateImplCopyWith<_$AdvancedInventoryStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
