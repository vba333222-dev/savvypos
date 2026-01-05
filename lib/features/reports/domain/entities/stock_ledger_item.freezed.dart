// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stock_ledger_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$StockLedgerItem {
  DateTime get date => throw _privateConstructorUsedError;
  String get type =>
      throw _privateConstructorUsedError; // 'SALE', 'RESTOCK', 'ADJUSTMENT'
  double get quantityChange => throw _privateConstructorUsedError;
  String get referenceId =>
      throw _privateConstructorUsedError; // Order # or PO #
  double get newStockLevel => throw _privateConstructorUsedError;

  /// Create a copy of StockLedgerItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StockLedgerItemCopyWith<StockLedgerItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StockLedgerItemCopyWith<$Res> {
  factory $StockLedgerItemCopyWith(
          StockLedgerItem value, $Res Function(StockLedgerItem) then) =
      _$StockLedgerItemCopyWithImpl<$Res, StockLedgerItem>;
  @useResult
  $Res call(
      {DateTime date,
      String type,
      double quantityChange,
      String referenceId,
      double newStockLevel});
}

/// @nodoc
class _$StockLedgerItemCopyWithImpl<$Res, $Val extends StockLedgerItem>
    implements $StockLedgerItemCopyWith<$Res> {
  _$StockLedgerItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StockLedgerItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? type = null,
    Object? quantityChange = null,
    Object? referenceId = null,
    Object? newStockLevel = null,
  }) {
    return _then(_value.copyWith(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      quantityChange: null == quantityChange
          ? _value.quantityChange
          : quantityChange // ignore: cast_nullable_to_non_nullable
              as double,
      referenceId: null == referenceId
          ? _value.referenceId
          : referenceId // ignore: cast_nullable_to_non_nullable
              as String,
      newStockLevel: null == newStockLevel
          ? _value.newStockLevel
          : newStockLevel // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StockLedgerItemImplCopyWith<$Res>
    implements $StockLedgerItemCopyWith<$Res> {
  factory _$$StockLedgerItemImplCopyWith(_$StockLedgerItemImpl value,
          $Res Function(_$StockLedgerItemImpl) then) =
      __$$StockLedgerItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DateTime date,
      String type,
      double quantityChange,
      String referenceId,
      double newStockLevel});
}

/// @nodoc
class __$$StockLedgerItemImplCopyWithImpl<$Res>
    extends _$StockLedgerItemCopyWithImpl<$Res, _$StockLedgerItemImpl>
    implements _$$StockLedgerItemImplCopyWith<$Res> {
  __$$StockLedgerItemImplCopyWithImpl(
      _$StockLedgerItemImpl _value, $Res Function(_$StockLedgerItemImpl) _then)
      : super(_value, _then);

  /// Create a copy of StockLedgerItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? type = null,
    Object? quantityChange = null,
    Object? referenceId = null,
    Object? newStockLevel = null,
  }) {
    return _then(_$StockLedgerItemImpl(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      quantityChange: null == quantityChange
          ? _value.quantityChange
          : quantityChange // ignore: cast_nullable_to_non_nullable
              as double,
      referenceId: null == referenceId
          ? _value.referenceId
          : referenceId // ignore: cast_nullable_to_non_nullable
              as String,
      newStockLevel: null == newStockLevel
          ? _value.newStockLevel
          : newStockLevel // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$StockLedgerItemImpl implements _StockLedgerItem {
  const _$StockLedgerItemImpl(
      {required this.date,
      required this.type,
      required this.quantityChange,
      required this.referenceId,
      required this.newStockLevel});

  @override
  final DateTime date;
  @override
  final String type;
// 'SALE', 'RESTOCK', 'ADJUSTMENT'
  @override
  final double quantityChange;
  @override
  final String referenceId;
// Order # or PO #
  @override
  final double newStockLevel;

  @override
  String toString() {
    return 'StockLedgerItem(date: $date, type: $type, quantityChange: $quantityChange, referenceId: $referenceId, newStockLevel: $newStockLevel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StockLedgerItemImpl &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.quantityChange, quantityChange) ||
                other.quantityChange == quantityChange) &&
            (identical(other.referenceId, referenceId) ||
                other.referenceId == referenceId) &&
            (identical(other.newStockLevel, newStockLevel) ||
                other.newStockLevel == newStockLevel));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, date, type, quantityChange, referenceId, newStockLevel);

  /// Create a copy of StockLedgerItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StockLedgerItemImplCopyWith<_$StockLedgerItemImpl> get copyWith =>
      __$$StockLedgerItemImplCopyWithImpl<_$StockLedgerItemImpl>(
          this, _$identity);
}

abstract class _StockLedgerItem implements StockLedgerItem {
  const factory _StockLedgerItem(
      {required final DateTime date,
      required final String type,
      required final double quantityChange,
      required final String referenceId,
      required final double newStockLevel}) = _$StockLedgerItemImpl;

  @override
  DateTime get date;
  @override
  String get type; // 'SALE', 'RESTOCK', 'ADJUSTMENT'
  @override
  double get quantityChange;
  @override
  String get referenceId; // Order # or PO #
  @override
  double get newStockLevel;

  /// Create a copy of StockLedgerItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StockLedgerItemImplCopyWith<_$StockLedgerItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
