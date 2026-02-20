// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'split_bill_entities.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SplitBill _$SplitBillFromJson(Map<String, dynamic> json) {
  return _SplitBill.fromJson(json);
}

/// @nodoc
mixin _$SplitBill {
  String get uuid => throw _privateConstructorUsedError;
  String get orderUuid => throw _privateConstructorUsedError;
  String get orderNumber => throw _privateConstructorUsedError;
  double get originalTotal => throw _privateConstructorUsedError;
  int get guestCount => throw _privateConstructorUsedError;
  SplitMode get mode => throw _privateConstructorUsedError;
  SplitBillStatus get status =>
      throw _privateConstructorUsedError; // Guest bills
  List<GuestBill> get guestBills =>
      throw _privateConstructorUsedError; // Tracking
  String get createdByUuid => throw _privateConstructorUsedError;
  String get createdByName => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime? get completedAt => throw _privateConstructorUsedError;

  /// Serializes this SplitBill to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SplitBill
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SplitBillCopyWith<SplitBill> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SplitBillCopyWith<$Res> {
  factory $SplitBillCopyWith(SplitBill value, $Res Function(SplitBill) then) =
      _$SplitBillCopyWithImpl<$Res, SplitBill>;
  @useResult
  $Res call(
      {String uuid,
      String orderUuid,
      String orderNumber,
      double originalTotal,
      int guestCount,
      SplitMode mode,
      SplitBillStatus status,
      List<GuestBill> guestBills,
      String createdByUuid,
      String createdByName,
      DateTime createdAt,
      DateTime? completedAt});
}

/// @nodoc
class _$SplitBillCopyWithImpl<$Res, $Val extends SplitBill>
    implements $SplitBillCopyWith<$Res> {
  _$SplitBillCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SplitBill
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
    Object? orderUuid = null,
    Object? orderNumber = null,
    Object? originalTotal = null,
    Object? guestCount = null,
    Object? mode = null,
    Object? status = null,
    Object? guestBills = null,
    Object? createdByUuid = null,
    Object? createdByName = null,
    Object? createdAt = null,
    Object? completedAt = freezed,
  }) {
    return _then(_value.copyWith(
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      orderUuid: null == orderUuid
          ? _value.orderUuid
          : orderUuid // ignore: cast_nullable_to_non_nullable
              as String,
      orderNumber: null == orderNumber
          ? _value.orderNumber
          : orderNumber // ignore: cast_nullable_to_non_nullable
              as String,
      originalTotal: null == originalTotal
          ? _value.originalTotal
          : originalTotal // ignore: cast_nullable_to_non_nullable
              as double,
      guestCount: null == guestCount
          ? _value.guestCount
          : guestCount // ignore: cast_nullable_to_non_nullable
              as int,
      mode: null == mode
          ? _value.mode
          : mode // ignore: cast_nullable_to_non_nullable
              as SplitMode,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as SplitBillStatus,
      guestBills: null == guestBills
          ? _value.guestBills
          : guestBills // ignore: cast_nullable_to_non_nullable
              as List<GuestBill>,
      createdByUuid: null == createdByUuid
          ? _value.createdByUuid
          : createdByUuid // ignore: cast_nullable_to_non_nullable
              as String,
      createdByName: null == createdByName
          ? _value.createdByName
          : createdByName // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      completedAt: freezed == completedAt
          ? _value.completedAt
          : completedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SplitBillImplCopyWith<$Res>
    implements $SplitBillCopyWith<$Res> {
  factory _$$SplitBillImplCopyWith(
          _$SplitBillImpl value, $Res Function(_$SplitBillImpl) then) =
      __$$SplitBillImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String uuid,
      String orderUuid,
      String orderNumber,
      double originalTotal,
      int guestCount,
      SplitMode mode,
      SplitBillStatus status,
      List<GuestBill> guestBills,
      String createdByUuid,
      String createdByName,
      DateTime createdAt,
      DateTime? completedAt});
}

/// @nodoc
class __$$SplitBillImplCopyWithImpl<$Res>
    extends _$SplitBillCopyWithImpl<$Res, _$SplitBillImpl>
    implements _$$SplitBillImplCopyWith<$Res> {
  __$$SplitBillImplCopyWithImpl(
      _$SplitBillImpl _value, $Res Function(_$SplitBillImpl) _then)
      : super(_value, _then);

  /// Create a copy of SplitBill
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
    Object? orderUuid = null,
    Object? orderNumber = null,
    Object? originalTotal = null,
    Object? guestCount = null,
    Object? mode = null,
    Object? status = null,
    Object? guestBills = null,
    Object? createdByUuid = null,
    Object? createdByName = null,
    Object? createdAt = null,
    Object? completedAt = freezed,
  }) {
    return _then(_$SplitBillImpl(
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      orderUuid: null == orderUuid
          ? _value.orderUuid
          : orderUuid // ignore: cast_nullable_to_non_nullable
              as String,
      orderNumber: null == orderNumber
          ? _value.orderNumber
          : orderNumber // ignore: cast_nullable_to_non_nullable
              as String,
      originalTotal: null == originalTotal
          ? _value.originalTotal
          : originalTotal // ignore: cast_nullable_to_non_nullable
              as double,
      guestCount: null == guestCount
          ? _value.guestCount
          : guestCount // ignore: cast_nullable_to_non_nullable
              as int,
      mode: null == mode
          ? _value.mode
          : mode // ignore: cast_nullable_to_non_nullable
              as SplitMode,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as SplitBillStatus,
      guestBills: null == guestBills
          ? _value._guestBills
          : guestBills // ignore: cast_nullable_to_non_nullable
              as List<GuestBill>,
      createdByUuid: null == createdByUuid
          ? _value.createdByUuid
          : createdByUuid // ignore: cast_nullable_to_non_nullable
              as String,
      createdByName: null == createdByName
          ? _value.createdByName
          : createdByName // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      completedAt: freezed == completedAt
          ? _value.completedAt
          : completedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SplitBillImpl extends _SplitBill {
  const _$SplitBillImpl(
      {required this.uuid,
      required this.orderUuid,
      required this.orderNumber,
      required this.originalTotal,
      required this.guestCount,
      required this.mode,
      this.status = SplitBillStatus.active,
      final List<GuestBill> guestBills = const [],
      required this.createdByUuid,
      required this.createdByName,
      required this.createdAt,
      this.completedAt})
      : _guestBills = guestBills,
        super._();

  factory _$SplitBillImpl.fromJson(Map<String, dynamic> json) =>
      _$$SplitBillImplFromJson(json);

  @override
  final String uuid;
  @override
  final String orderUuid;
  @override
  final String orderNumber;
  @override
  final double originalTotal;
  @override
  final int guestCount;
  @override
  final SplitMode mode;
  @override
  @JsonKey()
  final SplitBillStatus status;
// Guest bills
  final List<GuestBill> _guestBills;
// Guest bills
  @override
  @JsonKey()
  List<GuestBill> get guestBills {
    if (_guestBills is EqualUnmodifiableListView) return _guestBills;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_guestBills);
  }

// Tracking
  @override
  final String createdByUuid;
  @override
  final String createdByName;
  @override
  final DateTime createdAt;
  @override
  final DateTime? completedAt;

  @override
  String toString() {
    return 'SplitBill(uuid: $uuid, orderUuid: $orderUuid, orderNumber: $orderNumber, originalTotal: $originalTotal, guestCount: $guestCount, mode: $mode, status: $status, guestBills: $guestBills, createdByUuid: $createdByUuid, createdByName: $createdByName, createdAt: $createdAt, completedAt: $completedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SplitBillImpl &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.orderUuid, orderUuid) ||
                other.orderUuid == orderUuid) &&
            (identical(other.orderNumber, orderNumber) ||
                other.orderNumber == orderNumber) &&
            (identical(other.originalTotal, originalTotal) ||
                other.originalTotal == originalTotal) &&
            (identical(other.guestCount, guestCount) ||
                other.guestCount == guestCount) &&
            (identical(other.mode, mode) || other.mode == mode) &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality()
                .equals(other._guestBills, _guestBills) &&
            (identical(other.createdByUuid, createdByUuid) ||
                other.createdByUuid == createdByUuid) &&
            (identical(other.createdByName, createdByName) ||
                other.createdByName == createdByName) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.completedAt, completedAt) ||
                other.completedAt == completedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      uuid,
      orderUuid,
      orderNumber,
      originalTotal,
      guestCount,
      mode,
      status,
      const DeepCollectionEquality().hash(_guestBills),
      createdByUuid,
      createdByName,
      createdAt,
      completedAt);

  /// Create a copy of SplitBill
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SplitBillImplCopyWith<_$SplitBillImpl> get copyWith =>
      __$$SplitBillImplCopyWithImpl<_$SplitBillImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SplitBillImplToJson(
      this,
    );
  }
}

abstract class _SplitBill extends SplitBill {
  const factory _SplitBill(
      {required final String uuid,
      required final String orderUuid,
      required final String orderNumber,
      required final double originalTotal,
      required final int guestCount,
      required final SplitMode mode,
      final SplitBillStatus status,
      final List<GuestBill> guestBills,
      required final String createdByUuid,
      required final String createdByName,
      required final DateTime createdAt,
      final DateTime? completedAt}) = _$SplitBillImpl;
  const _SplitBill._() : super._();

  factory _SplitBill.fromJson(Map<String, dynamic> json) =
      _$SplitBillImpl.fromJson;

  @override
  String get uuid;
  @override
  String get orderUuid;
  @override
  String get orderNumber;
  @override
  double get originalTotal;
  @override
  int get guestCount;
  @override
  SplitMode get mode;
  @override
  SplitBillStatus get status; // Guest bills
  @override
  List<GuestBill> get guestBills; // Tracking
  @override
  String get createdByUuid;
  @override
  String get createdByName;
  @override
  DateTime get createdAt;
  @override
  DateTime? get completedAt;

  /// Create a copy of SplitBill
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SplitBillImplCopyWith<_$SplitBillImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

GuestBill _$GuestBillFromJson(Map<String, dynamic> json) {
  return _GuestBill.fromJson(json);
}

/// @nodoc
mixin _$GuestBill {
  String get uuid => throw _privateConstructorUsedError;
  String get splitBillUuid => throw _privateConstructorUsedError;
  int get guestNumber => throw _privateConstructorUsedError; // Guest 1, 2, 3...
  String? get guestName =>
      throw _privateConstructorUsedError; // Items assigned to this guest (for byItem/byGuest modes)
  List<SplitBillItem> get items =>
      throw _privateConstructorUsedError; // Amount (for equal/custom modes, or calculated from items)
  double get totalAmount => throw _privateConstructorUsedError;
  double? get tipAmount => throw _privateConstructorUsedError; // Payment status
  bool get isPaid => throw _privateConstructorUsedError;
  String? get paymentMethod =>
      throw _privateConstructorUsedError; // cash, card, etc.
  String? get paymentTransactionUuid => throw _privateConstructorUsedError;
  DateTime? get paidAt => throw _privateConstructorUsedError;

  /// Serializes this GuestBill to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GuestBill
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GuestBillCopyWith<GuestBill> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GuestBillCopyWith<$Res> {
  factory $GuestBillCopyWith(GuestBill value, $Res Function(GuestBill) then) =
      _$GuestBillCopyWithImpl<$Res, GuestBill>;
  @useResult
  $Res call(
      {String uuid,
      String splitBillUuid,
      int guestNumber,
      String? guestName,
      List<SplitBillItem> items,
      double totalAmount,
      double? tipAmount,
      bool isPaid,
      String? paymentMethod,
      String? paymentTransactionUuid,
      DateTime? paidAt});
}

/// @nodoc
class _$GuestBillCopyWithImpl<$Res, $Val extends GuestBill>
    implements $GuestBillCopyWith<$Res> {
  _$GuestBillCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GuestBill
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
    Object? splitBillUuid = null,
    Object? guestNumber = null,
    Object? guestName = freezed,
    Object? items = null,
    Object? totalAmount = null,
    Object? tipAmount = freezed,
    Object? isPaid = null,
    Object? paymentMethod = freezed,
    Object? paymentTransactionUuid = freezed,
    Object? paidAt = freezed,
  }) {
    return _then(_value.copyWith(
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      splitBillUuid: null == splitBillUuid
          ? _value.splitBillUuid
          : splitBillUuid // ignore: cast_nullable_to_non_nullable
              as String,
      guestNumber: null == guestNumber
          ? _value.guestNumber
          : guestNumber // ignore: cast_nullable_to_non_nullable
              as int,
      guestName: freezed == guestName
          ? _value.guestName
          : guestName // ignore: cast_nullable_to_non_nullable
              as String?,
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<SplitBillItem>,
      totalAmount: null == totalAmount
          ? _value.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as double,
      tipAmount: freezed == tipAmount
          ? _value.tipAmount
          : tipAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      isPaid: null == isPaid
          ? _value.isPaid
          : isPaid // ignore: cast_nullable_to_non_nullable
              as bool,
      paymentMethod: freezed == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentTransactionUuid: freezed == paymentTransactionUuid
          ? _value.paymentTransactionUuid
          : paymentTransactionUuid // ignore: cast_nullable_to_non_nullable
              as String?,
      paidAt: freezed == paidAt
          ? _value.paidAt
          : paidAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GuestBillImplCopyWith<$Res>
    implements $GuestBillCopyWith<$Res> {
  factory _$$GuestBillImplCopyWith(
          _$GuestBillImpl value, $Res Function(_$GuestBillImpl) then) =
      __$$GuestBillImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String uuid,
      String splitBillUuid,
      int guestNumber,
      String? guestName,
      List<SplitBillItem> items,
      double totalAmount,
      double? tipAmount,
      bool isPaid,
      String? paymentMethod,
      String? paymentTransactionUuid,
      DateTime? paidAt});
}

/// @nodoc
class __$$GuestBillImplCopyWithImpl<$Res>
    extends _$GuestBillCopyWithImpl<$Res, _$GuestBillImpl>
    implements _$$GuestBillImplCopyWith<$Res> {
  __$$GuestBillImplCopyWithImpl(
      _$GuestBillImpl _value, $Res Function(_$GuestBillImpl) _then)
      : super(_value, _then);

  /// Create a copy of GuestBill
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
    Object? splitBillUuid = null,
    Object? guestNumber = null,
    Object? guestName = freezed,
    Object? items = null,
    Object? totalAmount = null,
    Object? tipAmount = freezed,
    Object? isPaid = null,
    Object? paymentMethod = freezed,
    Object? paymentTransactionUuid = freezed,
    Object? paidAt = freezed,
  }) {
    return _then(_$GuestBillImpl(
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      splitBillUuid: null == splitBillUuid
          ? _value.splitBillUuid
          : splitBillUuid // ignore: cast_nullable_to_non_nullable
              as String,
      guestNumber: null == guestNumber
          ? _value.guestNumber
          : guestNumber // ignore: cast_nullable_to_non_nullable
              as int,
      guestName: freezed == guestName
          ? _value.guestName
          : guestName // ignore: cast_nullable_to_non_nullable
              as String?,
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<SplitBillItem>,
      totalAmount: null == totalAmount
          ? _value.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as double,
      tipAmount: freezed == tipAmount
          ? _value.tipAmount
          : tipAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      isPaid: null == isPaid
          ? _value.isPaid
          : isPaid // ignore: cast_nullable_to_non_nullable
              as bool,
      paymentMethod: freezed == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentTransactionUuid: freezed == paymentTransactionUuid
          ? _value.paymentTransactionUuid
          : paymentTransactionUuid // ignore: cast_nullable_to_non_nullable
              as String?,
      paidAt: freezed == paidAt
          ? _value.paidAt
          : paidAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GuestBillImpl extends _GuestBill {
  const _$GuestBillImpl(
      {required this.uuid,
      required this.splitBillUuid,
      required this.guestNumber,
      this.guestName,
      final List<SplitBillItem> items = const [],
      required this.totalAmount,
      this.tipAmount,
      this.isPaid = false,
      this.paymentMethod,
      this.paymentTransactionUuid,
      this.paidAt})
      : _items = items,
        super._();

  factory _$GuestBillImpl.fromJson(Map<String, dynamic> json) =>
      _$$GuestBillImplFromJson(json);

  @override
  final String uuid;
  @override
  final String splitBillUuid;
  @override
  final int guestNumber;
// Guest 1, 2, 3...
  @override
  final String? guestName;
// Items assigned to this guest (for byItem/byGuest modes)
  final List<SplitBillItem> _items;
// Items assigned to this guest (for byItem/byGuest modes)
  @override
  @JsonKey()
  List<SplitBillItem> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

// Amount (for equal/custom modes, or calculated from items)
  @override
  final double totalAmount;
  @override
  final double? tipAmount;
// Payment status
  @override
  @JsonKey()
  final bool isPaid;
  @override
  final String? paymentMethod;
// cash, card, etc.
  @override
  final String? paymentTransactionUuid;
  @override
  final DateTime? paidAt;

  @override
  String toString() {
    return 'GuestBill(uuid: $uuid, splitBillUuid: $splitBillUuid, guestNumber: $guestNumber, guestName: $guestName, items: $items, totalAmount: $totalAmount, tipAmount: $tipAmount, isPaid: $isPaid, paymentMethod: $paymentMethod, paymentTransactionUuid: $paymentTransactionUuid, paidAt: $paidAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GuestBillImpl &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.splitBillUuid, splitBillUuid) ||
                other.splitBillUuid == splitBillUuid) &&
            (identical(other.guestNumber, guestNumber) ||
                other.guestNumber == guestNumber) &&
            (identical(other.guestName, guestName) ||
                other.guestName == guestName) &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.totalAmount, totalAmount) ||
                other.totalAmount == totalAmount) &&
            (identical(other.tipAmount, tipAmount) ||
                other.tipAmount == tipAmount) &&
            (identical(other.isPaid, isPaid) || other.isPaid == isPaid) &&
            (identical(other.paymentMethod, paymentMethod) ||
                other.paymentMethod == paymentMethod) &&
            (identical(other.paymentTransactionUuid, paymentTransactionUuid) ||
                other.paymentTransactionUuid == paymentTransactionUuid) &&
            (identical(other.paidAt, paidAt) || other.paidAt == paidAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      uuid,
      splitBillUuid,
      guestNumber,
      guestName,
      const DeepCollectionEquality().hash(_items),
      totalAmount,
      tipAmount,
      isPaid,
      paymentMethod,
      paymentTransactionUuid,
      paidAt);

  /// Create a copy of GuestBill
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GuestBillImplCopyWith<_$GuestBillImpl> get copyWith =>
      __$$GuestBillImplCopyWithImpl<_$GuestBillImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GuestBillImplToJson(
      this,
    );
  }
}

abstract class _GuestBill extends GuestBill {
  const factory _GuestBill(
      {required final String uuid,
      required final String splitBillUuid,
      required final int guestNumber,
      final String? guestName,
      final List<SplitBillItem> items,
      required final double totalAmount,
      final double? tipAmount,
      final bool isPaid,
      final String? paymentMethod,
      final String? paymentTransactionUuid,
      final DateTime? paidAt}) = _$GuestBillImpl;
  const _GuestBill._() : super._();

  factory _GuestBill.fromJson(Map<String, dynamic> json) =
      _$GuestBillImpl.fromJson;

  @override
  String get uuid;
  @override
  String get splitBillUuid;
  @override
  int get guestNumber; // Guest 1, 2, 3...
  @override
  String?
      get guestName; // Items assigned to this guest (for byItem/byGuest modes)
  @override
  List<SplitBillItem>
      get items; // Amount (for equal/custom modes, or calculated from items)
  @override
  double get totalAmount;
  @override
  double? get tipAmount; // Payment status
  @override
  bool get isPaid;
  @override
  String? get paymentMethod; // cash, card, etc.
  @override
  String? get paymentTransactionUuid;
  @override
  DateTime? get paidAt;

  /// Create a copy of GuestBill
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GuestBillImplCopyWith<_$GuestBillImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SplitBillItem _$SplitBillItemFromJson(Map<String, dynamic> json) {
  return _SplitBillItem.fromJson(json);
}

/// @nodoc
mixin _$SplitBillItem {
  String get uuid => throw _privateConstructorUsedError;
  String get orderItemUuid => throw _privateConstructorUsedError;
  String get productName => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;
  int get quantity =>
      throw _privateConstructorUsedError; // Share info (for partial item splitting)
  int get shareCount =>
      throw _privateConstructorUsedError; // Split among how many guests
  int get shareIndex => throw _privateConstructorUsedError;

  /// Serializes this SplitBillItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SplitBillItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SplitBillItemCopyWith<SplitBillItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SplitBillItemCopyWith<$Res> {
  factory $SplitBillItemCopyWith(
          SplitBillItem value, $Res Function(SplitBillItem) then) =
      _$SplitBillItemCopyWithImpl<$Res, SplitBillItem>;
  @useResult
  $Res call(
      {String uuid,
      String orderItemUuid,
      String productName,
      double price,
      int quantity,
      int shareCount,
      int shareIndex});
}

/// @nodoc
class _$SplitBillItemCopyWithImpl<$Res, $Val extends SplitBillItem>
    implements $SplitBillItemCopyWith<$Res> {
  _$SplitBillItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SplitBillItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
    Object? orderItemUuid = null,
    Object? productName = null,
    Object? price = null,
    Object? quantity = null,
    Object? shareCount = null,
    Object? shareIndex = null,
  }) {
    return _then(_value.copyWith(
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      orderItemUuid: null == orderItemUuid
          ? _value.orderItemUuid
          : orderItemUuid // ignore: cast_nullable_to_non_nullable
              as String,
      productName: null == productName
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      shareCount: null == shareCount
          ? _value.shareCount
          : shareCount // ignore: cast_nullable_to_non_nullable
              as int,
      shareIndex: null == shareIndex
          ? _value.shareIndex
          : shareIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SplitBillItemImplCopyWith<$Res>
    implements $SplitBillItemCopyWith<$Res> {
  factory _$$SplitBillItemImplCopyWith(
          _$SplitBillItemImpl value, $Res Function(_$SplitBillItemImpl) then) =
      __$$SplitBillItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String uuid,
      String orderItemUuid,
      String productName,
      double price,
      int quantity,
      int shareCount,
      int shareIndex});
}

/// @nodoc
class __$$SplitBillItemImplCopyWithImpl<$Res>
    extends _$SplitBillItemCopyWithImpl<$Res, _$SplitBillItemImpl>
    implements _$$SplitBillItemImplCopyWith<$Res> {
  __$$SplitBillItemImplCopyWithImpl(
      _$SplitBillItemImpl _value, $Res Function(_$SplitBillItemImpl) _then)
      : super(_value, _then);

  /// Create a copy of SplitBillItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
    Object? orderItemUuid = null,
    Object? productName = null,
    Object? price = null,
    Object? quantity = null,
    Object? shareCount = null,
    Object? shareIndex = null,
  }) {
    return _then(_$SplitBillItemImpl(
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      orderItemUuid: null == orderItemUuid
          ? _value.orderItemUuid
          : orderItemUuid // ignore: cast_nullable_to_non_nullable
              as String,
      productName: null == productName
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      shareCount: null == shareCount
          ? _value.shareCount
          : shareCount // ignore: cast_nullable_to_non_nullable
              as int,
      shareIndex: null == shareIndex
          ? _value.shareIndex
          : shareIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SplitBillItemImpl extends _SplitBillItem {
  const _$SplitBillItemImpl(
      {required this.uuid,
      required this.orderItemUuid,
      required this.productName,
      required this.price,
      required this.quantity,
      this.shareCount = 1,
      this.shareIndex = 1})
      : super._();

  factory _$SplitBillItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$SplitBillItemImplFromJson(json);

  @override
  final String uuid;
  @override
  final String orderItemUuid;
  @override
  final String productName;
  @override
  final double price;
  @override
  final int quantity;
// Share info (for partial item splitting)
  @override
  @JsonKey()
  final int shareCount;
// Split among how many guests
  @override
  @JsonKey()
  final int shareIndex;

  @override
  String toString() {
    return 'SplitBillItem(uuid: $uuid, orderItemUuid: $orderItemUuid, productName: $productName, price: $price, quantity: $quantity, shareCount: $shareCount, shareIndex: $shareIndex)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SplitBillItemImpl &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.orderItemUuid, orderItemUuid) ||
                other.orderItemUuid == orderItemUuid) &&
            (identical(other.productName, productName) ||
                other.productName == productName) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.shareCount, shareCount) ||
                other.shareCount == shareCount) &&
            (identical(other.shareIndex, shareIndex) ||
                other.shareIndex == shareIndex));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, uuid, orderItemUuid, productName,
      price, quantity, shareCount, shareIndex);

  /// Create a copy of SplitBillItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SplitBillItemImplCopyWith<_$SplitBillItemImpl> get copyWith =>
      __$$SplitBillItemImplCopyWithImpl<_$SplitBillItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SplitBillItemImplToJson(
      this,
    );
  }
}

abstract class _SplitBillItem extends SplitBillItem {
  const factory _SplitBillItem(
      {required final String uuid,
      required final String orderItemUuid,
      required final String productName,
      required final double price,
      required final int quantity,
      final int shareCount,
      final int shareIndex}) = _$SplitBillItemImpl;
  const _SplitBillItem._() : super._();

  factory _SplitBillItem.fromJson(Map<String, dynamic> json) =
      _$SplitBillItemImpl.fromJson;

  @override
  String get uuid;
  @override
  String get orderItemUuid;
  @override
  String get productName;
  @override
  double get price;
  @override
  int get quantity; // Share info (for partial item splitting)
  @override
  int get shareCount; // Split among how many guests
  @override
  int get shareIndex;

  /// Create a copy of SplitBillItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SplitBillItemImplCopyWith<_$SplitBillItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SplitPreset _$SplitPresetFromJson(Map<String, dynamic> json) {
  return _SplitPreset.fromJson(json);
}

/// @nodoc
mixin _$SplitPreset {
  String get label => throw _privateConstructorUsedError;
  int get guestCount => throw _privateConstructorUsedError;
  SplitMode get mode => throw _privateConstructorUsedError;

  /// Serializes this SplitPreset to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SplitPreset
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SplitPresetCopyWith<SplitPreset> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SplitPresetCopyWith<$Res> {
  factory $SplitPresetCopyWith(
          SplitPreset value, $Res Function(SplitPreset) then) =
      _$SplitPresetCopyWithImpl<$Res, SplitPreset>;
  @useResult
  $Res call({String label, int guestCount, SplitMode mode});
}

/// @nodoc
class _$SplitPresetCopyWithImpl<$Res, $Val extends SplitPreset>
    implements $SplitPresetCopyWith<$Res> {
  _$SplitPresetCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SplitPreset
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? label = null,
    Object? guestCount = null,
    Object? mode = null,
  }) {
    return _then(_value.copyWith(
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      guestCount: null == guestCount
          ? _value.guestCount
          : guestCount // ignore: cast_nullable_to_non_nullable
              as int,
      mode: null == mode
          ? _value.mode
          : mode // ignore: cast_nullable_to_non_nullable
              as SplitMode,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SplitPresetImplCopyWith<$Res>
    implements $SplitPresetCopyWith<$Res> {
  factory _$$SplitPresetImplCopyWith(
          _$SplitPresetImpl value, $Res Function(_$SplitPresetImpl) then) =
      __$$SplitPresetImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String label, int guestCount, SplitMode mode});
}

/// @nodoc
class __$$SplitPresetImplCopyWithImpl<$Res>
    extends _$SplitPresetCopyWithImpl<$Res, _$SplitPresetImpl>
    implements _$$SplitPresetImplCopyWith<$Res> {
  __$$SplitPresetImplCopyWithImpl(
      _$SplitPresetImpl _value, $Res Function(_$SplitPresetImpl) _then)
      : super(_value, _then);

  /// Create a copy of SplitPreset
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? label = null,
    Object? guestCount = null,
    Object? mode = null,
  }) {
    return _then(_$SplitPresetImpl(
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      guestCount: null == guestCount
          ? _value.guestCount
          : guestCount // ignore: cast_nullable_to_non_nullable
              as int,
      mode: null == mode
          ? _value.mode
          : mode // ignore: cast_nullable_to_non_nullable
              as SplitMode,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SplitPresetImpl implements _SplitPreset {
  const _$SplitPresetImpl(
      {required this.label, required this.guestCount, required this.mode});

  factory _$SplitPresetImpl.fromJson(Map<String, dynamic> json) =>
      _$$SplitPresetImplFromJson(json);

  @override
  final String label;
  @override
  final int guestCount;
  @override
  final SplitMode mode;

  @override
  String toString() {
    return 'SplitPreset(label: $label, guestCount: $guestCount, mode: $mode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SplitPresetImpl &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.guestCount, guestCount) ||
                other.guestCount == guestCount) &&
            (identical(other.mode, mode) || other.mode == mode));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, label, guestCount, mode);

  /// Create a copy of SplitPreset
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SplitPresetImplCopyWith<_$SplitPresetImpl> get copyWith =>
      __$$SplitPresetImplCopyWithImpl<_$SplitPresetImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SplitPresetImplToJson(
      this,
    );
  }
}

abstract class _SplitPreset implements SplitPreset {
  const factory _SplitPreset(
      {required final String label,
      required final int guestCount,
      required final SplitMode mode}) = _$SplitPresetImpl;

  factory _SplitPreset.fromJson(Map<String, dynamic> json) =
      _$SplitPresetImpl.fromJson;

  @override
  String get label;
  @override
  int get guestCount;
  @override
  SplitMode get mode;

  /// Create a copy of SplitPreset
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SplitPresetImplCopyWith<_$SplitPresetImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
