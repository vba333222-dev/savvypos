// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'waste_record.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

WasteRecord _$WasteRecordFromJson(Map<String, dynamic> json) {
  return _WasteRecord.fromJson(json);
}

/// @nodoc
mixin _$WasteRecord {
  String get id => throw _privateConstructorUsedError;
  String get itemId => throw _privateConstructorUsedError;
  WasteItemType get itemType => throw _privateConstructorUsedError;
  double get quantity => throw _privateConstructorUsedError;
  WasteReason get reason => throw _privateConstructorUsedError;
  DateTime get recordedAt => throw _privateConstructorUsedError;
  String get staffId => throw _privateConstructorUsedError;
  String get warehouseId =>
      throw _privateConstructorUsedError; // Added for location tracking
  double get costLoss => throw _privateConstructorUsedError;
  String? get note => throw _privateConstructorUsedError;
  String? get itemName =>
      throw _privateConstructorUsedError; // Denormalized for easier display
  String? get unit => throw _privateConstructorUsedError;

  /// Serializes this WasteRecord to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WasteRecord
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WasteRecordCopyWith<WasteRecord> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WasteRecordCopyWith<$Res> {
  factory $WasteRecordCopyWith(
          WasteRecord value, $Res Function(WasteRecord) then) =
      _$WasteRecordCopyWithImpl<$Res, WasteRecord>;
  @useResult
  $Res call(
      {String id,
      String itemId,
      WasteItemType itemType,
      double quantity,
      WasteReason reason,
      DateTime recordedAt,
      String staffId,
      String warehouseId,
      double costLoss,
      String? note,
      String? itemName,
      String? unit});
}

/// @nodoc
class _$WasteRecordCopyWithImpl<$Res, $Val extends WasteRecord>
    implements $WasteRecordCopyWith<$Res> {
  _$WasteRecordCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WasteRecord
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? itemId = null,
    Object? itemType = null,
    Object? quantity = null,
    Object? reason = null,
    Object? recordedAt = null,
    Object? staffId = null,
    Object? warehouseId = null,
    Object? costLoss = null,
    Object? note = freezed,
    Object? itemName = freezed,
    Object? unit = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      itemId: null == itemId
          ? _value.itemId
          : itemId // ignore: cast_nullable_to_non_nullable
              as String,
      itemType: null == itemType
          ? _value.itemType
          : itemType // ignore: cast_nullable_to_non_nullable
              as WasteItemType,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as double,
      reason: null == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as WasteReason,
      recordedAt: null == recordedAt
          ? _value.recordedAt
          : recordedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      staffId: null == staffId
          ? _value.staffId
          : staffId // ignore: cast_nullable_to_non_nullable
              as String,
      warehouseId: null == warehouseId
          ? _value.warehouseId
          : warehouseId // ignore: cast_nullable_to_non_nullable
              as String,
      costLoss: null == costLoss
          ? _value.costLoss
          : costLoss // ignore: cast_nullable_to_non_nullable
              as double,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      itemName: freezed == itemName
          ? _value.itemName
          : itemName // ignore: cast_nullable_to_non_nullable
              as String?,
      unit: freezed == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WasteRecordImplCopyWith<$Res>
    implements $WasteRecordCopyWith<$Res> {
  factory _$$WasteRecordImplCopyWith(
          _$WasteRecordImpl value, $Res Function(_$WasteRecordImpl) then) =
      __$$WasteRecordImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String itemId,
      WasteItemType itemType,
      double quantity,
      WasteReason reason,
      DateTime recordedAt,
      String staffId,
      String warehouseId,
      double costLoss,
      String? note,
      String? itemName,
      String? unit});
}

/// @nodoc
class __$$WasteRecordImplCopyWithImpl<$Res>
    extends _$WasteRecordCopyWithImpl<$Res, _$WasteRecordImpl>
    implements _$$WasteRecordImplCopyWith<$Res> {
  __$$WasteRecordImplCopyWithImpl(
      _$WasteRecordImpl _value, $Res Function(_$WasteRecordImpl) _then)
      : super(_value, _then);

  /// Create a copy of WasteRecord
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? itemId = null,
    Object? itemType = null,
    Object? quantity = null,
    Object? reason = null,
    Object? recordedAt = null,
    Object? staffId = null,
    Object? warehouseId = null,
    Object? costLoss = null,
    Object? note = freezed,
    Object? itemName = freezed,
    Object? unit = freezed,
  }) {
    return _then(_$WasteRecordImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      itemId: null == itemId
          ? _value.itemId
          : itemId // ignore: cast_nullable_to_non_nullable
              as String,
      itemType: null == itemType
          ? _value.itemType
          : itemType // ignore: cast_nullable_to_non_nullable
              as WasteItemType,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as double,
      reason: null == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as WasteReason,
      recordedAt: null == recordedAt
          ? _value.recordedAt
          : recordedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      staffId: null == staffId
          ? _value.staffId
          : staffId // ignore: cast_nullable_to_non_nullable
              as String,
      warehouseId: null == warehouseId
          ? _value.warehouseId
          : warehouseId // ignore: cast_nullable_to_non_nullable
              as String,
      costLoss: null == costLoss
          ? _value.costLoss
          : costLoss // ignore: cast_nullable_to_non_nullable
              as double,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      itemName: freezed == itemName
          ? _value.itemName
          : itemName // ignore: cast_nullable_to_non_nullable
              as String?,
      unit: freezed == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WasteRecordImpl implements _WasteRecord {
  const _$WasteRecordImpl(
      {required this.id,
      required this.itemId,
      required this.itemType,
      required this.quantity,
      required this.reason,
      required this.recordedAt,
      required this.staffId,
      required this.warehouseId,
      required this.costLoss,
      this.note,
      this.itemName,
      this.unit});

  factory _$WasteRecordImpl.fromJson(Map<String, dynamic> json) =>
      _$$WasteRecordImplFromJson(json);

  @override
  final String id;
  @override
  final String itemId;
  @override
  final WasteItemType itemType;
  @override
  final double quantity;
  @override
  final WasteReason reason;
  @override
  final DateTime recordedAt;
  @override
  final String staffId;
  @override
  final String warehouseId;
// Added for location tracking
  @override
  final double costLoss;
  @override
  final String? note;
  @override
  final String? itemName;
// Denormalized for easier display
  @override
  final String? unit;

  @override
  String toString() {
    return 'WasteRecord(id: $id, itemId: $itemId, itemType: $itemType, quantity: $quantity, reason: $reason, recordedAt: $recordedAt, staffId: $staffId, warehouseId: $warehouseId, costLoss: $costLoss, note: $note, itemName: $itemName, unit: $unit)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WasteRecordImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.itemId, itemId) || other.itemId == itemId) &&
            (identical(other.itemType, itemType) ||
                other.itemType == itemType) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.reason, reason) || other.reason == reason) &&
            (identical(other.recordedAt, recordedAt) ||
                other.recordedAt == recordedAt) &&
            (identical(other.staffId, staffId) || other.staffId == staffId) &&
            (identical(other.warehouseId, warehouseId) ||
                other.warehouseId == warehouseId) &&
            (identical(other.costLoss, costLoss) ||
                other.costLoss == costLoss) &&
            (identical(other.note, note) || other.note == note) &&
            (identical(other.itemName, itemName) ||
                other.itemName == itemName) &&
            (identical(other.unit, unit) || other.unit == unit));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, itemId, itemType, quantity,
      reason, recordedAt, staffId, warehouseId, costLoss, note, itemName, unit);

  /// Create a copy of WasteRecord
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WasteRecordImplCopyWith<_$WasteRecordImpl> get copyWith =>
      __$$WasteRecordImplCopyWithImpl<_$WasteRecordImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WasteRecordImplToJson(
      this,
    );
  }
}

abstract class _WasteRecord implements WasteRecord {
  const factory _WasteRecord(
      {required final String id,
      required final String itemId,
      required final WasteItemType itemType,
      required final double quantity,
      required final WasteReason reason,
      required final DateTime recordedAt,
      required final String staffId,
      required final String warehouseId,
      required final double costLoss,
      final String? note,
      final String? itemName,
      final String? unit}) = _$WasteRecordImpl;

  factory _WasteRecord.fromJson(Map<String, dynamic> json) =
      _$WasteRecordImpl.fromJson;

  @override
  String get id;
  @override
  String get itemId;
  @override
  WasteItemType get itemType;
  @override
  double get quantity;
  @override
  WasteReason get reason;
  @override
  DateTime get recordedAt;
  @override
  String get staffId;
  @override
  String get warehouseId; // Added for location tracking
  @override
  double get costLoss;
  @override
  String? get note;
  @override
  String? get itemName; // Denormalized for easier display
  @override
  String? get unit;

  /// Create a copy of WasteRecord
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WasteRecordImplCopyWith<_$WasteRecordImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
