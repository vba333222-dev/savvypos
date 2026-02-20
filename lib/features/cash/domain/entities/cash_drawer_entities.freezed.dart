// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cash_drawer_entities.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CashDrawer _$CashDrawerFromJson(Map<String, dynamic> json) {
  return _CashDrawer.fromJson(json);
}

/// @nodoc
mixin _$CashDrawer {
  String get id => throw _privateConstructorUsedError;
  String get shiftUuid =>
      throw _privateConstructorUsedError; // Linked to ShiftSession
  String get employeeUuid => throw _privateConstructorUsedError;
  String get employeeName => throw _privateConstructorUsedError;
  double get startingBalance => throw _privateConstructorUsedError;
  double get currentBalance => throw _privateConstructorUsedError;
  double get expectedBalance =>
      throw _privateConstructorUsedError; // Calculated from transactions
  DrawerState get state => throw _privateConstructorUsedError;
  DateTime get openedAt => throw _privateConstructorUsedError;
  DateTime? get closedAt => throw _privateConstructorUsedError;
  double? get closingBalance =>
      throw _privateConstructorUsedError; // Actual count at close
  double? get variance => throw _privateConstructorUsedError;

  /// Serializes this CashDrawer to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CashDrawer
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CashDrawerCopyWith<CashDrawer> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CashDrawerCopyWith<$Res> {
  factory $CashDrawerCopyWith(
          CashDrawer value, $Res Function(CashDrawer) then) =
      _$CashDrawerCopyWithImpl<$Res, CashDrawer>;
  @useResult
  $Res call(
      {String id,
      String shiftUuid,
      String employeeUuid,
      String employeeName,
      double startingBalance,
      double currentBalance,
      double expectedBalance,
      DrawerState state,
      DateTime openedAt,
      DateTime? closedAt,
      double? closingBalance,
      double? variance});
}

/// @nodoc
class _$CashDrawerCopyWithImpl<$Res, $Val extends CashDrawer>
    implements $CashDrawerCopyWith<$Res> {
  _$CashDrawerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CashDrawer
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? shiftUuid = null,
    Object? employeeUuid = null,
    Object? employeeName = null,
    Object? startingBalance = null,
    Object? currentBalance = null,
    Object? expectedBalance = null,
    Object? state = null,
    Object? openedAt = null,
    Object? closedAt = freezed,
    Object? closingBalance = freezed,
    Object? variance = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      shiftUuid: null == shiftUuid
          ? _value.shiftUuid
          : shiftUuid // ignore: cast_nullable_to_non_nullable
              as String,
      employeeUuid: null == employeeUuid
          ? _value.employeeUuid
          : employeeUuid // ignore: cast_nullable_to_non_nullable
              as String,
      employeeName: null == employeeName
          ? _value.employeeName
          : employeeName // ignore: cast_nullable_to_non_nullable
              as String,
      startingBalance: null == startingBalance
          ? _value.startingBalance
          : startingBalance // ignore: cast_nullable_to_non_nullable
              as double,
      currentBalance: null == currentBalance
          ? _value.currentBalance
          : currentBalance // ignore: cast_nullable_to_non_nullable
              as double,
      expectedBalance: null == expectedBalance
          ? _value.expectedBalance
          : expectedBalance // ignore: cast_nullable_to_non_nullable
              as double,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as DrawerState,
      openedAt: null == openedAt
          ? _value.openedAt
          : openedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      closedAt: freezed == closedAt
          ? _value.closedAt
          : closedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      closingBalance: freezed == closingBalance
          ? _value.closingBalance
          : closingBalance // ignore: cast_nullable_to_non_nullable
              as double?,
      variance: freezed == variance
          ? _value.variance
          : variance // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CashDrawerImplCopyWith<$Res>
    implements $CashDrawerCopyWith<$Res> {
  factory _$$CashDrawerImplCopyWith(
          _$CashDrawerImpl value, $Res Function(_$CashDrawerImpl) then) =
      __$$CashDrawerImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String shiftUuid,
      String employeeUuid,
      String employeeName,
      double startingBalance,
      double currentBalance,
      double expectedBalance,
      DrawerState state,
      DateTime openedAt,
      DateTime? closedAt,
      double? closingBalance,
      double? variance});
}

/// @nodoc
class __$$CashDrawerImplCopyWithImpl<$Res>
    extends _$CashDrawerCopyWithImpl<$Res, _$CashDrawerImpl>
    implements _$$CashDrawerImplCopyWith<$Res> {
  __$$CashDrawerImplCopyWithImpl(
      _$CashDrawerImpl _value, $Res Function(_$CashDrawerImpl) _then)
      : super(_value, _then);

  /// Create a copy of CashDrawer
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? shiftUuid = null,
    Object? employeeUuid = null,
    Object? employeeName = null,
    Object? startingBalance = null,
    Object? currentBalance = null,
    Object? expectedBalance = null,
    Object? state = null,
    Object? openedAt = null,
    Object? closedAt = freezed,
    Object? closingBalance = freezed,
    Object? variance = freezed,
  }) {
    return _then(_$CashDrawerImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      shiftUuid: null == shiftUuid
          ? _value.shiftUuid
          : shiftUuid // ignore: cast_nullable_to_non_nullable
              as String,
      employeeUuid: null == employeeUuid
          ? _value.employeeUuid
          : employeeUuid // ignore: cast_nullable_to_non_nullable
              as String,
      employeeName: null == employeeName
          ? _value.employeeName
          : employeeName // ignore: cast_nullable_to_non_nullable
              as String,
      startingBalance: null == startingBalance
          ? _value.startingBalance
          : startingBalance // ignore: cast_nullable_to_non_nullable
              as double,
      currentBalance: null == currentBalance
          ? _value.currentBalance
          : currentBalance // ignore: cast_nullable_to_non_nullable
              as double,
      expectedBalance: null == expectedBalance
          ? _value.expectedBalance
          : expectedBalance // ignore: cast_nullable_to_non_nullable
              as double,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as DrawerState,
      openedAt: null == openedAt
          ? _value.openedAt
          : openedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      closedAt: freezed == closedAt
          ? _value.closedAt
          : closedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      closingBalance: freezed == closingBalance
          ? _value.closingBalance
          : closingBalance // ignore: cast_nullable_to_non_nullable
              as double?,
      variance: freezed == variance
          ? _value.variance
          : variance // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CashDrawerImpl implements _CashDrawer {
  const _$CashDrawerImpl(
      {required this.id,
      required this.shiftUuid,
      required this.employeeUuid,
      required this.employeeName,
      required this.startingBalance,
      required this.currentBalance,
      required this.expectedBalance,
      required this.state,
      required this.openedAt,
      this.closedAt,
      this.closingBalance,
      this.variance});

  factory _$CashDrawerImpl.fromJson(Map<String, dynamic> json) =>
      _$$CashDrawerImplFromJson(json);

  @override
  final String id;
  @override
  final String shiftUuid;
// Linked to ShiftSession
  @override
  final String employeeUuid;
  @override
  final String employeeName;
  @override
  final double startingBalance;
  @override
  final double currentBalance;
  @override
  final double expectedBalance;
// Calculated from transactions
  @override
  final DrawerState state;
  @override
  final DateTime openedAt;
  @override
  final DateTime? closedAt;
  @override
  final double? closingBalance;
// Actual count at close
  @override
  final double? variance;

  @override
  String toString() {
    return 'CashDrawer(id: $id, shiftUuid: $shiftUuid, employeeUuid: $employeeUuid, employeeName: $employeeName, startingBalance: $startingBalance, currentBalance: $currentBalance, expectedBalance: $expectedBalance, state: $state, openedAt: $openedAt, closedAt: $closedAt, closingBalance: $closingBalance, variance: $variance)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CashDrawerImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.shiftUuid, shiftUuid) ||
                other.shiftUuid == shiftUuid) &&
            (identical(other.employeeUuid, employeeUuid) ||
                other.employeeUuid == employeeUuid) &&
            (identical(other.employeeName, employeeName) ||
                other.employeeName == employeeName) &&
            (identical(other.startingBalance, startingBalance) ||
                other.startingBalance == startingBalance) &&
            (identical(other.currentBalance, currentBalance) ||
                other.currentBalance == currentBalance) &&
            (identical(other.expectedBalance, expectedBalance) ||
                other.expectedBalance == expectedBalance) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.openedAt, openedAt) ||
                other.openedAt == openedAt) &&
            (identical(other.closedAt, closedAt) ||
                other.closedAt == closedAt) &&
            (identical(other.closingBalance, closingBalance) ||
                other.closingBalance == closingBalance) &&
            (identical(other.variance, variance) ||
                other.variance == variance));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      shiftUuid,
      employeeUuid,
      employeeName,
      startingBalance,
      currentBalance,
      expectedBalance,
      state,
      openedAt,
      closedAt,
      closingBalance,
      variance);

  /// Create a copy of CashDrawer
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CashDrawerImplCopyWith<_$CashDrawerImpl> get copyWith =>
      __$$CashDrawerImplCopyWithImpl<_$CashDrawerImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CashDrawerImplToJson(
      this,
    );
  }
}

abstract class _CashDrawer implements CashDrawer {
  const factory _CashDrawer(
      {required final String id,
      required final String shiftUuid,
      required final String employeeUuid,
      required final String employeeName,
      required final double startingBalance,
      required final double currentBalance,
      required final double expectedBalance,
      required final DrawerState state,
      required final DateTime openedAt,
      final DateTime? closedAt,
      final double? closingBalance,
      final double? variance}) = _$CashDrawerImpl;

  factory _CashDrawer.fromJson(Map<String, dynamic> json) =
      _$CashDrawerImpl.fromJson;

  @override
  String get id;
  @override
  String get shiftUuid; // Linked to ShiftSession
  @override
  String get employeeUuid;
  @override
  String get employeeName;
  @override
  double get startingBalance;
  @override
  double get currentBalance;
  @override
  double get expectedBalance; // Calculated from transactions
  @override
  DrawerState get state;
  @override
  DateTime get openedAt;
  @override
  DateTime? get closedAt;
  @override
  double? get closingBalance; // Actual count at close
  @override
  double? get variance;

  /// Create a copy of CashDrawer
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CashDrawerImplCopyWith<_$CashDrawerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CashEvent _$CashEventFromJson(Map<String, dynamic> json) {
  return _CashEvent.fromJson(json);
}

/// @nodoc
mixin _$CashEvent {
  String get id => throw _privateConstructorUsedError;
  String get drawerUuid => throw _privateConstructorUsedError;
  CashEventType get type => throw _privateConstructorUsedError;
  double get amount => throw _privateConstructorUsedError;
  String get reason =>
      throw _privateConstructorUsedError; // 'tip_out', 'bank_deposit', 'change', etc.
  String? get comment => throw _privateConstructorUsedError;
  String? get performedBy => throw _privateConstructorUsedError;
  String? get orderUuid =>
      throw _privateConstructorUsedError; // For sale/refund
  DateTime get timestamp => throw _privateConstructorUsedError;

  /// Serializes this CashEvent to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CashEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CashEventCopyWith<CashEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CashEventCopyWith<$Res> {
  factory $CashEventCopyWith(CashEvent value, $Res Function(CashEvent) then) =
      _$CashEventCopyWithImpl<$Res, CashEvent>;
  @useResult
  $Res call(
      {String id,
      String drawerUuid,
      CashEventType type,
      double amount,
      String reason,
      String? comment,
      String? performedBy,
      String? orderUuid,
      DateTime timestamp});
}

/// @nodoc
class _$CashEventCopyWithImpl<$Res, $Val extends CashEvent>
    implements $CashEventCopyWith<$Res> {
  _$CashEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CashEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? drawerUuid = null,
    Object? type = null,
    Object? amount = null,
    Object? reason = null,
    Object? comment = freezed,
    Object? performedBy = freezed,
    Object? orderUuid = freezed,
    Object? timestamp = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      drawerUuid: null == drawerUuid
          ? _value.drawerUuid
          : drawerUuid // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as CashEventType,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      reason: null == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String,
      comment: freezed == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String?,
      performedBy: freezed == performedBy
          ? _value.performedBy
          : performedBy // ignore: cast_nullable_to_non_nullable
              as String?,
      orderUuid: freezed == orderUuid
          ? _value.orderUuid
          : orderUuid // ignore: cast_nullable_to_non_nullable
              as String?,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CashEventImplCopyWith<$Res>
    implements $CashEventCopyWith<$Res> {
  factory _$$CashEventImplCopyWith(
          _$CashEventImpl value, $Res Function(_$CashEventImpl) then) =
      __$$CashEventImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String drawerUuid,
      CashEventType type,
      double amount,
      String reason,
      String? comment,
      String? performedBy,
      String? orderUuid,
      DateTime timestamp});
}

/// @nodoc
class __$$CashEventImplCopyWithImpl<$Res>
    extends _$CashEventCopyWithImpl<$Res, _$CashEventImpl>
    implements _$$CashEventImplCopyWith<$Res> {
  __$$CashEventImplCopyWithImpl(
      _$CashEventImpl _value, $Res Function(_$CashEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of CashEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? drawerUuid = null,
    Object? type = null,
    Object? amount = null,
    Object? reason = null,
    Object? comment = freezed,
    Object? performedBy = freezed,
    Object? orderUuid = freezed,
    Object? timestamp = null,
  }) {
    return _then(_$CashEventImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      drawerUuid: null == drawerUuid
          ? _value.drawerUuid
          : drawerUuid // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as CashEventType,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      reason: null == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String,
      comment: freezed == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String?,
      performedBy: freezed == performedBy
          ? _value.performedBy
          : performedBy // ignore: cast_nullable_to_non_nullable
              as String?,
      orderUuid: freezed == orderUuid
          ? _value.orderUuid
          : orderUuid // ignore: cast_nullable_to_non_nullable
              as String?,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CashEventImpl implements _CashEvent {
  const _$CashEventImpl(
      {required this.id,
      required this.drawerUuid,
      required this.type,
      required this.amount,
      required this.reason,
      this.comment,
      this.performedBy,
      this.orderUuid,
      required this.timestamp});

  factory _$CashEventImpl.fromJson(Map<String, dynamic> json) =>
      _$$CashEventImplFromJson(json);

  @override
  final String id;
  @override
  final String drawerUuid;
  @override
  final CashEventType type;
  @override
  final double amount;
  @override
  final String reason;
// 'tip_out', 'bank_deposit', 'change', etc.
  @override
  final String? comment;
  @override
  final String? performedBy;
  @override
  final String? orderUuid;
// For sale/refund
  @override
  final DateTime timestamp;

  @override
  String toString() {
    return 'CashEvent(id: $id, drawerUuid: $drawerUuid, type: $type, amount: $amount, reason: $reason, comment: $comment, performedBy: $performedBy, orderUuid: $orderUuid, timestamp: $timestamp)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CashEventImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.drawerUuid, drawerUuid) ||
                other.drawerUuid == drawerUuid) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.reason, reason) || other.reason == reason) &&
            (identical(other.comment, comment) || other.comment == comment) &&
            (identical(other.performedBy, performedBy) ||
                other.performedBy == performedBy) &&
            (identical(other.orderUuid, orderUuid) ||
                other.orderUuid == orderUuid) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, drawerUuid, type, amount,
      reason, comment, performedBy, orderUuid, timestamp);

  /// Create a copy of CashEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CashEventImplCopyWith<_$CashEventImpl> get copyWith =>
      __$$CashEventImplCopyWithImpl<_$CashEventImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CashEventImplToJson(
      this,
    );
  }
}

abstract class _CashEvent implements CashEvent {
  const factory _CashEvent(
      {required final String id,
      required final String drawerUuid,
      required final CashEventType type,
      required final double amount,
      required final String reason,
      final String? comment,
      final String? performedBy,
      final String? orderUuid,
      required final DateTime timestamp}) = _$CashEventImpl;

  factory _CashEvent.fromJson(Map<String, dynamic> json) =
      _$CashEventImpl.fromJson;

  @override
  String get id;
  @override
  String get drawerUuid;
  @override
  CashEventType get type;
  @override
  double get amount;
  @override
  String get reason; // 'tip_out', 'bank_deposit', 'change', etc.
  @override
  String? get comment;
  @override
  String? get performedBy;
  @override
  String? get orderUuid; // For sale/refund
  @override
  DateTime get timestamp;

  /// Create a copy of CashEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CashEventImplCopyWith<_$CashEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CashDrawerSummary _$CashDrawerSummaryFromJson(Map<String, dynamic> json) {
  return _CashDrawerSummary.fromJson(json);
}

/// @nodoc
mixin _$CashDrawerSummary {
  double get totalCashIn => throw _privateConstructorUsedError;
  double get totalCashOut => throw _privateConstructorUsedError;
  double get totalSales => throw _privateConstructorUsedError;
  double get totalRefunds => throw _privateConstructorUsedError;
  double get totalDrops => throw _privateConstructorUsedError;
  int get noSaleCount => throw _privateConstructorUsedError;
  double get netCash => throw _privateConstructorUsedError;

  /// Serializes this CashDrawerSummary to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CashDrawerSummary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CashDrawerSummaryCopyWith<CashDrawerSummary> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CashDrawerSummaryCopyWith<$Res> {
  factory $CashDrawerSummaryCopyWith(
          CashDrawerSummary value, $Res Function(CashDrawerSummary) then) =
      _$CashDrawerSummaryCopyWithImpl<$Res, CashDrawerSummary>;
  @useResult
  $Res call(
      {double totalCashIn,
      double totalCashOut,
      double totalSales,
      double totalRefunds,
      double totalDrops,
      int noSaleCount,
      double netCash});
}

/// @nodoc
class _$CashDrawerSummaryCopyWithImpl<$Res, $Val extends CashDrawerSummary>
    implements $CashDrawerSummaryCopyWith<$Res> {
  _$CashDrawerSummaryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CashDrawerSummary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalCashIn = null,
    Object? totalCashOut = null,
    Object? totalSales = null,
    Object? totalRefunds = null,
    Object? totalDrops = null,
    Object? noSaleCount = null,
    Object? netCash = null,
  }) {
    return _then(_value.copyWith(
      totalCashIn: null == totalCashIn
          ? _value.totalCashIn
          : totalCashIn // ignore: cast_nullable_to_non_nullable
              as double,
      totalCashOut: null == totalCashOut
          ? _value.totalCashOut
          : totalCashOut // ignore: cast_nullable_to_non_nullable
              as double,
      totalSales: null == totalSales
          ? _value.totalSales
          : totalSales // ignore: cast_nullable_to_non_nullable
              as double,
      totalRefunds: null == totalRefunds
          ? _value.totalRefunds
          : totalRefunds // ignore: cast_nullable_to_non_nullable
              as double,
      totalDrops: null == totalDrops
          ? _value.totalDrops
          : totalDrops // ignore: cast_nullable_to_non_nullable
              as double,
      noSaleCount: null == noSaleCount
          ? _value.noSaleCount
          : noSaleCount // ignore: cast_nullable_to_non_nullable
              as int,
      netCash: null == netCash
          ? _value.netCash
          : netCash // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CashDrawerSummaryImplCopyWith<$Res>
    implements $CashDrawerSummaryCopyWith<$Res> {
  factory _$$CashDrawerSummaryImplCopyWith(_$CashDrawerSummaryImpl value,
          $Res Function(_$CashDrawerSummaryImpl) then) =
      __$$CashDrawerSummaryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double totalCashIn,
      double totalCashOut,
      double totalSales,
      double totalRefunds,
      double totalDrops,
      int noSaleCount,
      double netCash});
}

/// @nodoc
class __$$CashDrawerSummaryImplCopyWithImpl<$Res>
    extends _$CashDrawerSummaryCopyWithImpl<$Res, _$CashDrawerSummaryImpl>
    implements _$$CashDrawerSummaryImplCopyWith<$Res> {
  __$$CashDrawerSummaryImplCopyWithImpl(_$CashDrawerSummaryImpl _value,
      $Res Function(_$CashDrawerSummaryImpl) _then)
      : super(_value, _then);

  /// Create a copy of CashDrawerSummary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalCashIn = null,
    Object? totalCashOut = null,
    Object? totalSales = null,
    Object? totalRefunds = null,
    Object? totalDrops = null,
    Object? noSaleCount = null,
    Object? netCash = null,
  }) {
    return _then(_$CashDrawerSummaryImpl(
      totalCashIn: null == totalCashIn
          ? _value.totalCashIn
          : totalCashIn // ignore: cast_nullable_to_non_nullable
              as double,
      totalCashOut: null == totalCashOut
          ? _value.totalCashOut
          : totalCashOut // ignore: cast_nullable_to_non_nullable
              as double,
      totalSales: null == totalSales
          ? _value.totalSales
          : totalSales // ignore: cast_nullable_to_non_nullable
              as double,
      totalRefunds: null == totalRefunds
          ? _value.totalRefunds
          : totalRefunds // ignore: cast_nullable_to_non_nullable
              as double,
      totalDrops: null == totalDrops
          ? _value.totalDrops
          : totalDrops // ignore: cast_nullable_to_non_nullable
              as double,
      noSaleCount: null == noSaleCount
          ? _value.noSaleCount
          : noSaleCount // ignore: cast_nullable_to_non_nullable
              as int,
      netCash: null == netCash
          ? _value.netCash
          : netCash // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CashDrawerSummaryImpl implements _CashDrawerSummary {
  const _$CashDrawerSummaryImpl(
      {required this.totalCashIn,
      required this.totalCashOut,
      required this.totalSales,
      required this.totalRefunds,
      required this.totalDrops,
      required this.noSaleCount,
      required this.netCash});

  factory _$CashDrawerSummaryImpl.fromJson(Map<String, dynamic> json) =>
      _$$CashDrawerSummaryImplFromJson(json);

  @override
  final double totalCashIn;
  @override
  final double totalCashOut;
  @override
  final double totalSales;
  @override
  final double totalRefunds;
  @override
  final double totalDrops;
  @override
  final int noSaleCount;
  @override
  final double netCash;

  @override
  String toString() {
    return 'CashDrawerSummary(totalCashIn: $totalCashIn, totalCashOut: $totalCashOut, totalSales: $totalSales, totalRefunds: $totalRefunds, totalDrops: $totalDrops, noSaleCount: $noSaleCount, netCash: $netCash)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CashDrawerSummaryImpl &&
            (identical(other.totalCashIn, totalCashIn) ||
                other.totalCashIn == totalCashIn) &&
            (identical(other.totalCashOut, totalCashOut) ||
                other.totalCashOut == totalCashOut) &&
            (identical(other.totalSales, totalSales) ||
                other.totalSales == totalSales) &&
            (identical(other.totalRefunds, totalRefunds) ||
                other.totalRefunds == totalRefunds) &&
            (identical(other.totalDrops, totalDrops) ||
                other.totalDrops == totalDrops) &&
            (identical(other.noSaleCount, noSaleCount) ||
                other.noSaleCount == noSaleCount) &&
            (identical(other.netCash, netCash) || other.netCash == netCash));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, totalCashIn, totalCashOut,
      totalSales, totalRefunds, totalDrops, noSaleCount, netCash);

  /// Create a copy of CashDrawerSummary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CashDrawerSummaryImplCopyWith<_$CashDrawerSummaryImpl> get copyWith =>
      __$$CashDrawerSummaryImplCopyWithImpl<_$CashDrawerSummaryImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CashDrawerSummaryImplToJson(
      this,
    );
  }
}

abstract class _CashDrawerSummary implements CashDrawerSummary {
  const factory _CashDrawerSummary(
      {required final double totalCashIn,
      required final double totalCashOut,
      required final double totalSales,
      required final double totalRefunds,
      required final double totalDrops,
      required final int noSaleCount,
      required final double netCash}) = _$CashDrawerSummaryImpl;

  factory _CashDrawerSummary.fromJson(Map<String, dynamic> json) =
      _$CashDrawerSummaryImpl.fromJson;

  @override
  double get totalCashIn;
  @override
  double get totalCashOut;
  @override
  double get totalSales;
  @override
  double get totalRefunds;
  @override
  double get totalDrops;
  @override
  int get noSaleCount;
  @override
  double get netCash;

  /// Create a copy of CashDrawerSummary
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CashDrawerSummaryImplCopyWith<_$CashDrawerSummaryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
