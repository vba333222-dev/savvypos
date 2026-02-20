// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'gift_card.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GiftCard _$GiftCardFromJson(Map<String, dynamic> json) {
  return _GiftCard.fromJson(json);
}

/// @nodoc
mixin _$GiftCard {
  String get uuid => throw _privateConstructorUsedError;
  String get cardNumber =>
      throw _privateConstructorUsedError; // Unique 16-digit number
  String? get barcode =>
      throw _privateConstructorUsedError; // QR/Barcode for scanning
// Value tracking
  double get initialValue => throw _privateConstructorUsedError;
  double get currentBalance =>
      throw _privateConstructorUsedError; // Owner info (optional - can be anonymous)
  String? get customerUuid => throw _privateConstructorUsedError;
  String? get customerName => throw _privateConstructorUsedError;
  String? get customerEmail => throw _privateConstructorUsedError;
  String? get customerPhone =>
      throw _privateConstructorUsedError; // Status & dates
  GiftCardStatus get status => throw _privateConstructorUsedError;
  DateTime get activatedAt => throw _privateConstructorUsedError;
  DateTime? get expiresAt => throw _privateConstructorUsedError;
  DateTime? get lastUsedAt => throw _privateConstructorUsedError; // Security
  String? get pin =>
      throw _privateConstructorUsedError; // Optional PIN for redemption
// Tracking
  String? get activatedByEmployeeUuid => throw _privateConstructorUsedError;
  String? get activatedByEmployeeName => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this GiftCard to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GiftCard
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GiftCardCopyWith<GiftCard> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GiftCardCopyWith<$Res> {
  factory $GiftCardCopyWith(GiftCard value, $Res Function(GiftCard) then) =
      _$GiftCardCopyWithImpl<$Res, GiftCard>;
  @useResult
  $Res call(
      {String uuid,
      String cardNumber,
      String? barcode,
      double initialValue,
      double currentBalance,
      String? customerUuid,
      String? customerName,
      String? customerEmail,
      String? customerPhone,
      GiftCardStatus status,
      DateTime activatedAt,
      DateTime? expiresAt,
      DateTime? lastUsedAt,
      String? pin,
      String? activatedByEmployeeUuid,
      String? activatedByEmployeeName,
      String? notes,
      DateTime? createdAt,
      DateTime? updatedAt});
}

/// @nodoc
class _$GiftCardCopyWithImpl<$Res, $Val extends GiftCard>
    implements $GiftCardCopyWith<$Res> {
  _$GiftCardCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GiftCard
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
    Object? cardNumber = null,
    Object? barcode = freezed,
    Object? initialValue = null,
    Object? currentBalance = null,
    Object? customerUuid = freezed,
    Object? customerName = freezed,
    Object? customerEmail = freezed,
    Object? customerPhone = freezed,
    Object? status = null,
    Object? activatedAt = null,
    Object? expiresAt = freezed,
    Object? lastUsedAt = freezed,
    Object? pin = freezed,
    Object? activatedByEmployeeUuid = freezed,
    Object? activatedByEmployeeName = freezed,
    Object? notes = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      cardNumber: null == cardNumber
          ? _value.cardNumber
          : cardNumber // ignore: cast_nullable_to_non_nullable
              as String,
      barcode: freezed == barcode
          ? _value.barcode
          : barcode // ignore: cast_nullable_to_non_nullable
              as String?,
      initialValue: null == initialValue
          ? _value.initialValue
          : initialValue // ignore: cast_nullable_to_non_nullable
              as double,
      currentBalance: null == currentBalance
          ? _value.currentBalance
          : currentBalance // ignore: cast_nullable_to_non_nullable
              as double,
      customerUuid: freezed == customerUuid
          ? _value.customerUuid
          : customerUuid // ignore: cast_nullable_to_non_nullable
              as String?,
      customerName: freezed == customerName
          ? _value.customerName
          : customerName // ignore: cast_nullable_to_non_nullable
              as String?,
      customerEmail: freezed == customerEmail
          ? _value.customerEmail
          : customerEmail // ignore: cast_nullable_to_non_nullable
              as String?,
      customerPhone: freezed == customerPhone
          ? _value.customerPhone
          : customerPhone // ignore: cast_nullable_to_non_nullable
              as String?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as GiftCardStatus,
      activatedAt: null == activatedAt
          ? _value.activatedAt
          : activatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      expiresAt: freezed == expiresAt
          ? _value.expiresAt
          : expiresAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      lastUsedAt: freezed == lastUsedAt
          ? _value.lastUsedAt
          : lastUsedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      pin: freezed == pin
          ? _value.pin
          : pin // ignore: cast_nullable_to_non_nullable
              as String?,
      activatedByEmployeeUuid: freezed == activatedByEmployeeUuid
          ? _value.activatedByEmployeeUuid
          : activatedByEmployeeUuid // ignore: cast_nullable_to_non_nullable
              as String?,
      activatedByEmployeeName: freezed == activatedByEmployeeName
          ? _value.activatedByEmployeeName
          : activatedByEmployeeName // ignore: cast_nullable_to_non_nullable
              as String?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
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
abstract class _$$GiftCardImplCopyWith<$Res>
    implements $GiftCardCopyWith<$Res> {
  factory _$$GiftCardImplCopyWith(
          _$GiftCardImpl value, $Res Function(_$GiftCardImpl) then) =
      __$$GiftCardImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String uuid,
      String cardNumber,
      String? barcode,
      double initialValue,
      double currentBalance,
      String? customerUuid,
      String? customerName,
      String? customerEmail,
      String? customerPhone,
      GiftCardStatus status,
      DateTime activatedAt,
      DateTime? expiresAt,
      DateTime? lastUsedAt,
      String? pin,
      String? activatedByEmployeeUuid,
      String? activatedByEmployeeName,
      String? notes,
      DateTime? createdAt,
      DateTime? updatedAt});
}

/// @nodoc
class __$$GiftCardImplCopyWithImpl<$Res>
    extends _$GiftCardCopyWithImpl<$Res, _$GiftCardImpl>
    implements _$$GiftCardImplCopyWith<$Res> {
  __$$GiftCardImplCopyWithImpl(
      _$GiftCardImpl _value, $Res Function(_$GiftCardImpl) _then)
      : super(_value, _then);

  /// Create a copy of GiftCard
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
    Object? cardNumber = null,
    Object? barcode = freezed,
    Object? initialValue = null,
    Object? currentBalance = null,
    Object? customerUuid = freezed,
    Object? customerName = freezed,
    Object? customerEmail = freezed,
    Object? customerPhone = freezed,
    Object? status = null,
    Object? activatedAt = null,
    Object? expiresAt = freezed,
    Object? lastUsedAt = freezed,
    Object? pin = freezed,
    Object? activatedByEmployeeUuid = freezed,
    Object? activatedByEmployeeName = freezed,
    Object? notes = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$GiftCardImpl(
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      cardNumber: null == cardNumber
          ? _value.cardNumber
          : cardNumber // ignore: cast_nullable_to_non_nullable
              as String,
      barcode: freezed == barcode
          ? _value.barcode
          : barcode // ignore: cast_nullable_to_non_nullable
              as String?,
      initialValue: null == initialValue
          ? _value.initialValue
          : initialValue // ignore: cast_nullable_to_non_nullable
              as double,
      currentBalance: null == currentBalance
          ? _value.currentBalance
          : currentBalance // ignore: cast_nullable_to_non_nullable
              as double,
      customerUuid: freezed == customerUuid
          ? _value.customerUuid
          : customerUuid // ignore: cast_nullable_to_non_nullable
              as String?,
      customerName: freezed == customerName
          ? _value.customerName
          : customerName // ignore: cast_nullable_to_non_nullable
              as String?,
      customerEmail: freezed == customerEmail
          ? _value.customerEmail
          : customerEmail // ignore: cast_nullable_to_non_nullable
              as String?,
      customerPhone: freezed == customerPhone
          ? _value.customerPhone
          : customerPhone // ignore: cast_nullable_to_non_nullable
              as String?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as GiftCardStatus,
      activatedAt: null == activatedAt
          ? _value.activatedAt
          : activatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      expiresAt: freezed == expiresAt
          ? _value.expiresAt
          : expiresAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      lastUsedAt: freezed == lastUsedAt
          ? _value.lastUsedAt
          : lastUsedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      pin: freezed == pin
          ? _value.pin
          : pin // ignore: cast_nullable_to_non_nullable
              as String?,
      activatedByEmployeeUuid: freezed == activatedByEmployeeUuid
          ? _value.activatedByEmployeeUuid
          : activatedByEmployeeUuid // ignore: cast_nullable_to_non_nullable
              as String?,
      activatedByEmployeeName: freezed == activatedByEmployeeName
          ? _value.activatedByEmployeeName
          : activatedByEmployeeName // ignore: cast_nullable_to_non_nullable
              as String?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
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
class _$GiftCardImpl extends _GiftCard {
  const _$GiftCardImpl(
      {required this.uuid,
      required this.cardNumber,
      this.barcode,
      required this.initialValue,
      required this.currentBalance,
      this.customerUuid,
      this.customerName,
      this.customerEmail,
      this.customerPhone,
      this.status = GiftCardStatus.active,
      required this.activatedAt,
      this.expiresAt,
      this.lastUsedAt,
      this.pin,
      this.activatedByEmployeeUuid,
      this.activatedByEmployeeName,
      this.notes,
      this.createdAt,
      this.updatedAt})
      : super._();

  factory _$GiftCardImpl.fromJson(Map<String, dynamic> json) =>
      _$$GiftCardImplFromJson(json);

  @override
  final String uuid;
  @override
  final String cardNumber;
// Unique 16-digit number
  @override
  final String? barcode;
// QR/Barcode for scanning
// Value tracking
  @override
  final double initialValue;
  @override
  final double currentBalance;
// Owner info (optional - can be anonymous)
  @override
  final String? customerUuid;
  @override
  final String? customerName;
  @override
  final String? customerEmail;
  @override
  final String? customerPhone;
// Status & dates
  @override
  @JsonKey()
  final GiftCardStatus status;
  @override
  final DateTime activatedAt;
  @override
  final DateTime? expiresAt;
  @override
  final DateTime? lastUsedAt;
// Security
  @override
  final String? pin;
// Optional PIN for redemption
// Tracking
  @override
  final String? activatedByEmployeeUuid;
  @override
  final String? activatedByEmployeeName;
  @override
  final String? notes;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'GiftCard(uuid: $uuid, cardNumber: $cardNumber, barcode: $barcode, initialValue: $initialValue, currentBalance: $currentBalance, customerUuid: $customerUuid, customerName: $customerName, customerEmail: $customerEmail, customerPhone: $customerPhone, status: $status, activatedAt: $activatedAt, expiresAt: $expiresAt, lastUsedAt: $lastUsedAt, pin: $pin, activatedByEmployeeUuid: $activatedByEmployeeUuid, activatedByEmployeeName: $activatedByEmployeeName, notes: $notes, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GiftCardImpl &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.cardNumber, cardNumber) ||
                other.cardNumber == cardNumber) &&
            (identical(other.barcode, barcode) || other.barcode == barcode) &&
            (identical(other.initialValue, initialValue) ||
                other.initialValue == initialValue) &&
            (identical(other.currentBalance, currentBalance) ||
                other.currentBalance == currentBalance) &&
            (identical(other.customerUuid, customerUuid) ||
                other.customerUuid == customerUuid) &&
            (identical(other.customerName, customerName) ||
                other.customerName == customerName) &&
            (identical(other.customerEmail, customerEmail) ||
                other.customerEmail == customerEmail) &&
            (identical(other.customerPhone, customerPhone) ||
                other.customerPhone == customerPhone) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.activatedAt, activatedAt) ||
                other.activatedAt == activatedAt) &&
            (identical(other.expiresAt, expiresAt) ||
                other.expiresAt == expiresAt) &&
            (identical(other.lastUsedAt, lastUsedAt) ||
                other.lastUsedAt == lastUsedAt) &&
            (identical(other.pin, pin) || other.pin == pin) &&
            (identical(
                    other.activatedByEmployeeUuid, activatedByEmployeeUuid) ||
                other.activatedByEmployeeUuid == activatedByEmployeeUuid) &&
            (identical(
                    other.activatedByEmployeeName, activatedByEmployeeName) ||
                other.activatedByEmployeeName == activatedByEmployeeName) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        uuid,
        cardNumber,
        barcode,
        initialValue,
        currentBalance,
        customerUuid,
        customerName,
        customerEmail,
        customerPhone,
        status,
        activatedAt,
        expiresAt,
        lastUsedAt,
        pin,
        activatedByEmployeeUuid,
        activatedByEmployeeName,
        notes,
        createdAt,
        updatedAt
      ]);

  /// Create a copy of GiftCard
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GiftCardImplCopyWith<_$GiftCardImpl> get copyWith =>
      __$$GiftCardImplCopyWithImpl<_$GiftCardImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GiftCardImplToJson(
      this,
    );
  }
}

abstract class _GiftCard extends GiftCard {
  const factory _GiftCard(
      {required final String uuid,
      required final String cardNumber,
      final String? barcode,
      required final double initialValue,
      required final double currentBalance,
      final String? customerUuid,
      final String? customerName,
      final String? customerEmail,
      final String? customerPhone,
      final GiftCardStatus status,
      required final DateTime activatedAt,
      final DateTime? expiresAt,
      final DateTime? lastUsedAt,
      final String? pin,
      final String? activatedByEmployeeUuid,
      final String? activatedByEmployeeName,
      final String? notes,
      final DateTime? createdAt,
      final DateTime? updatedAt}) = _$GiftCardImpl;
  const _GiftCard._() : super._();

  factory _GiftCard.fromJson(Map<String, dynamic> json) =
      _$GiftCardImpl.fromJson;

  @override
  String get uuid;
  @override
  String get cardNumber; // Unique 16-digit number
  @override
  String? get barcode; // QR/Barcode for scanning
// Value tracking
  @override
  double get initialValue;
  @override
  double get currentBalance; // Owner info (optional - can be anonymous)
  @override
  String? get customerUuid;
  @override
  String? get customerName;
  @override
  String? get customerEmail;
  @override
  String? get customerPhone; // Status & dates
  @override
  GiftCardStatus get status;
  @override
  DateTime get activatedAt;
  @override
  DateTime? get expiresAt;
  @override
  DateTime? get lastUsedAt; // Security
  @override
  String? get pin; // Optional PIN for redemption
// Tracking
  @override
  String? get activatedByEmployeeUuid;
  @override
  String? get activatedByEmployeeName;
  @override
  String? get notes;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;

  /// Create a copy of GiftCard
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GiftCardImplCopyWith<_$GiftCardImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

GiftCardTransaction _$GiftCardTransactionFromJson(Map<String, dynamic> json) {
  return _GiftCardTransaction.fromJson(json);
}

/// @nodoc
mixin _$GiftCardTransaction {
  String get uuid => throw _privateConstructorUsedError;
  String get giftCardUuid => throw _privateConstructorUsedError;
  GiftCardTransactionType get type => throw _privateConstructorUsedError;
  double get amount =>
      throw _privateConstructorUsedError; // Positive for loads, negative for redemptions
  double get balanceAfter =>
      throw _privateConstructorUsedError; // If redemption, link to order
  String? get orderUuid => throw _privateConstructorUsedError;
  String? get orderNumber =>
      throw _privateConstructorUsedError; // Performer info
  String get performedByUuid => throw _privateConstructorUsedError;
  String get performedByName => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;
  DateTime get timestamp => throw _privateConstructorUsedError;

  /// Serializes this GiftCardTransaction to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GiftCardTransaction
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GiftCardTransactionCopyWith<GiftCardTransaction> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GiftCardTransactionCopyWith<$Res> {
  factory $GiftCardTransactionCopyWith(
          GiftCardTransaction value, $Res Function(GiftCardTransaction) then) =
      _$GiftCardTransactionCopyWithImpl<$Res, GiftCardTransaction>;
  @useResult
  $Res call(
      {String uuid,
      String giftCardUuid,
      GiftCardTransactionType type,
      double amount,
      double balanceAfter,
      String? orderUuid,
      String? orderNumber,
      String performedByUuid,
      String performedByName,
      String? notes,
      DateTime timestamp});
}

/// @nodoc
class _$GiftCardTransactionCopyWithImpl<$Res, $Val extends GiftCardTransaction>
    implements $GiftCardTransactionCopyWith<$Res> {
  _$GiftCardTransactionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GiftCardTransaction
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
    Object? giftCardUuid = null,
    Object? type = null,
    Object? amount = null,
    Object? balanceAfter = null,
    Object? orderUuid = freezed,
    Object? orderNumber = freezed,
    Object? performedByUuid = null,
    Object? performedByName = null,
    Object? notes = freezed,
    Object? timestamp = null,
  }) {
    return _then(_value.copyWith(
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      giftCardUuid: null == giftCardUuid
          ? _value.giftCardUuid
          : giftCardUuid // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as GiftCardTransactionType,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      balanceAfter: null == balanceAfter
          ? _value.balanceAfter
          : balanceAfter // ignore: cast_nullable_to_non_nullable
              as double,
      orderUuid: freezed == orderUuid
          ? _value.orderUuid
          : orderUuid // ignore: cast_nullable_to_non_nullable
              as String?,
      orderNumber: freezed == orderNumber
          ? _value.orderNumber
          : orderNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      performedByUuid: null == performedByUuid
          ? _value.performedByUuid
          : performedByUuid // ignore: cast_nullable_to_non_nullable
              as String,
      performedByName: null == performedByName
          ? _value.performedByName
          : performedByName // ignore: cast_nullable_to_non_nullable
              as String,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GiftCardTransactionImplCopyWith<$Res>
    implements $GiftCardTransactionCopyWith<$Res> {
  factory _$$GiftCardTransactionImplCopyWith(_$GiftCardTransactionImpl value,
          $Res Function(_$GiftCardTransactionImpl) then) =
      __$$GiftCardTransactionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String uuid,
      String giftCardUuid,
      GiftCardTransactionType type,
      double amount,
      double balanceAfter,
      String? orderUuid,
      String? orderNumber,
      String performedByUuid,
      String performedByName,
      String? notes,
      DateTime timestamp});
}

/// @nodoc
class __$$GiftCardTransactionImplCopyWithImpl<$Res>
    extends _$GiftCardTransactionCopyWithImpl<$Res, _$GiftCardTransactionImpl>
    implements _$$GiftCardTransactionImplCopyWith<$Res> {
  __$$GiftCardTransactionImplCopyWithImpl(_$GiftCardTransactionImpl _value,
      $Res Function(_$GiftCardTransactionImpl) _then)
      : super(_value, _then);

  /// Create a copy of GiftCardTransaction
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
    Object? giftCardUuid = null,
    Object? type = null,
    Object? amount = null,
    Object? balanceAfter = null,
    Object? orderUuid = freezed,
    Object? orderNumber = freezed,
    Object? performedByUuid = null,
    Object? performedByName = null,
    Object? notes = freezed,
    Object? timestamp = null,
  }) {
    return _then(_$GiftCardTransactionImpl(
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      giftCardUuid: null == giftCardUuid
          ? _value.giftCardUuid
          : giftCardUuid // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as GiftCardTransactionType,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      balanceAfter: null == balanceAfter
          ? _value.balanceAfter
          : balanceAfter // ignore: cast_nullable_to_non_nullable
              as double,
      orderUuid: freezed == orderUuid
          ? _value.orderUuid
          : orderUuid // ignore: cast_nullable_to_non_nullable
              as String?,
      orderNumber: freezed == orderNumber
          ? _value.orderNumber
          : orderNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      performedByUuid: null == performedByUuid
          ? _value.performedByUuid
          : performedByUuid // ignore: cast_nullable_to_non_nullable
              as String,
      performedByName: null == performedByName
          ? _value.performedByName
          : performedByName // ignore: cast_nullable_to_non_nullable
              as String,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
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
class _$GiftCardTransactionImpl implements _GiftCardTransaction {
  const _$GiftCardTransactionImpl(
      {required this.uuid,
      required this.giftCardUuid,
      required this.type,
      required this.amount,
      required this.balanceAfter,
      this.orderUuid,
      this.orderNumber,
      required this.performedByUuid,
      required this.performedByName,
      this.notes,
      required this.timestamp});

  factory _$GiftCardTransactionImpl.fromJson(Map<String, dynamic> json) =>
      _$$GiftCardTransactionImplFromJson(json);

  @override
  final String uuid;
  @override
  final String giftCardUuid;
  @override
  final GiftCardTransactionType type;
  @override
  final double amount;
// Positive for loads, negative for redemptions
  @override
  final double balanceAfter;
// If redemption, link to order
  @override
  final String? orderUuid;
  @override
  final String? orderNumber;
// Performer info
  @override
  final String performedByUuid;
  @override
  final String performedByName;
  @override
  final String? notes;
  @override
  final DateTime timestamp;

  @override
  String toString() {
    return 'GiftCardTransaction(uuid: $uuid, giftCardUuid: $giftCardUuid, type: $type, amount: $amount, balanceAfter: $balanceAfter, orderUuid: $orderUuid, orderNumber: $orderNumber, performedByUuid: $performedByUuid, performedByName: $performedByName, notes: $notes, timestamp: $timestamp)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GiftCardTransactionImpl &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.giftCardUuid, giftCardUuid) ||
                other.giftCardUuid == giftCardUuid) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.balanceAfter, balanceAfter) ||
                other.balanceAfter == balanceAfter) &&
            (identical(other.orderUuid, orderUuid) ||
                other.orderUuid == orderUuid) &&
            (identical(other.orderNumber, orderNumber) ||
                other.orderNumber == orderNumber) &&
            (identical(other.performedByUuid, performedByUuid) ||
                other.performedByUuid == performedByUuid) &&
            (identical(other.performedByName, performedByName) ||
                other.performedByName == performedByName) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      uuid,
      giftCardUuid,
      type,
      amount,
      balanceAfter,
      orderUuid,
      orderNumber,
      performedByUuid,
      performedByName,
      notes,
      timestamp);

  /// Create a copy of GiftCardTransaction
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GiftCardTransactionImplCopyWith<_$GiftCardTransactionImpl> get copyWith =>
      __$$GiftCardTransactionImplCopyWithImpl<_$GiftCardTransactionImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GiftCardTransactionImplToJson(
      this,
    );
  }
}

abstract class _GiftCardTransaction implements GiftCardTransaction {
  const factory _GiftCardTransaction(
      {required final String uuid,
      required final String giftCardUuid,
      required final GiftCardTransactionType type,
      required final double amount,
      required final double balanceAfter,
      final String? orderUuid,
      final String? orderNumber,
      required final String performedByUuid,
      required final String performedByName,
      final String? notes,
      required final DateTime timestamp}) = _$GiftCardTransactionImpl;

  factory _GiftCardTransaction.fromJson(Map<String, dynamic> json) =
      _$GiftCardTransactionImpl.fromJson;

  @override
  String get uuid;
  @override
  String get giftCardUuid;
  @override
  GiftCardTransactionType get type;
  @override
  double get amount; // Positive for loads, negative for redemptions
  @override
  double get balanceAfter; // If redemption, link to order
  @override
  String? get orderUuid;
  @override
  String? get orderNumber; // Performer info
  @override
  String get performedByUuid;
  @override
  String get performedByName;
  @override
  String? get notes;
  @override
  DateTime get timestamp;

  /// Create a copy of GiftCardTransaction
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GiftCardTransactionImplCopyWith<_$GiftCardTransactionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

GiftCardSummary _$GiftCardSummaryFromJson(Map<String, dynamic> json) {
  return _GiftCardSummary.fromJson(json);
}

/// @nodoc
mixin _$GiftCardSummary {
  int get totalCardsIssued => throw _privateConstructorUsedError;
  int get activeCards => throw _privateConstructorUsedError;
  double get totalValueIssued => throw _privateConstructorUsedError;
  double get totalRedemptions => throw _privateConstructorUsedError;
  double get outstandingLiability =>
      throw _privateConstructorUsedError; // Total unredeemed balance
  double get expiredValue => throw _privateConstructorUsedError;
  DateTime? get periodStart => throw _privateConstructorUsedError;
  DateTime? get periodEnd => throw _privateConstructorUsedError;

  /// Serializes this GiftCardSummary to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GiftCardSummary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GiftCardSummaryCopyWith<GiftCardSummary> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GiftCardSummaryCopyWith<$Res> {
  factory $GiftCardSummaryCopyWith(
          GiftCardSummary value, $Res Function(GiftCardSummary) then) =
      _$GiftCardSummaryCopyWithImpl<$Res, GiftCardSummary>;
  @useResult
  $Res call(
      {int totalCardsIssued,
      int activeCards,
      double totalValueIssued,
      double totalRedemptions,
      double outstandingLiability,
      double expiredValue,
      DateTime? periodStart,
      DateTime? periodEnd});
}

/// @nodoc
class _$GiftCardSummaryCopyWithImpl<$Res, $Val extends GiftCardSummary>
    implements $GiftCardSummaryCopyWith<$Res> {
  _$GiftCardSummaryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GiftCardSummary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalCardsIssued = null,
    Object? activeCards = null,
    Object? totalValueIssued = null,
    Object? totalRedemptions = null,
    Object? outstandingLiability = null,
    Object? expiredValue = null,
    Object? periodStart = freezed,
    Object? periodEnd = freezed,
  }) {
    return _then(_value.copyWith(
      totalCardsIssued: null == totalCardsIssued
          ? _value.totalCardsIssued
          : totalCardsIssued // ignore: cast_nullable_to_non_nullable
              as int,
      activeCards: null == activeCards
          ? _value.activeCards
          : activeCards // ignore: cast_nullable_to_non_nullable
              as int,
      totalValueIssued: null == totalValueIssued
          ? _value.totalValueIssued
          : totalValueIssued // ignore: cast_nullable_to_non_nullable
              as double,
      totalRedemptions: null == totalRedemptions
          ? _value.totalRedemptions
          : totalRedemptions // ignore: cast_nullable_to_non_nullable
              as double,
      outstandingLiability: null == outstandingLiability
          ? _value.outstandingLiability
          : outstandingLiability // ignore: cast_nullable_to_non_nullable
              as double,
      expiredValue: null == expiredValue
          ? _value.expiredValue
          : expiredValue // ignore: cast_nullable_to_non_nullable
              as double,
      periodStart: freezed == periodStart
          ? _value.periodStart
          : periodStart // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      periodEnd: freezed == periodEnd
          ? _value.periodEnd
          : periodEnd // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GiftCardSummaryImplCopyWith<$Res>
    implements $GiftCardSummaryCopyWith<$Res> {
  factory _$$GiftCardSummaryImplCopyWith(_$GiftCardSummaryImpl value,
          $Res Function(_$GiftCardSummaryImpl) then) =
      __$$GiftCardSummaryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int totalCardsIssued,
      int activeCards,
      double totalValueIssued,
      double totalRedemptions,
      double outstandingLiability,
      double expiredValue,
      DateTime? periodStart,
      DateTime? periodEnd});
}

/// @nodoc
class __$$GiftCardSummaryImplCopyWithImpl<$Res>
    extends _$GiftCardSummaryCopyWithImpl<$Res, _$GiftCardSummaryImpl>
    implements _$$GiftCardSummaryImplCopyWith<$Res> {
  __$$GiftCardSummaryImplCopyWithImpl(
      _$GiftCardSummaryImpl _value, $Res Function(_$GiftCardSummaryImpl) _then)
      : super(_value, _then);

  /// Create a copy of GiftCardSummary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalCardsIssued = null,
    Object? activeCards = null,
    Object? totalValueIssued = null,
    Object? totalRedemptions = null,
    Object? outstandingLiability = null,
    Object? expiredValue = null,
    Object? periodStart = freezed,
    Object? periodEnd = freezed,
  }) {
    return _then(_$GiftCardSummaryImpl(
      totalCardsIssued: null == totalCardsIssued
          ? _value.totalCardsIssued
          : totalCardsIssued // ignore: cast_nullable_to_non_nullable
              as int,
      activeCards: null == activeCards
          ? _value.activeCards
          : activeCards // ignore: cast_nullable_to_non_nullable
              as int,
      totalValueIssued: null == totalValueIssued
          ? _value.totalValueIssued
          : totalValueIssued // ignore: cast_nullable_to_non_nullable
              as double,
      totalRedemptions: null == totalRedemptions
          ? _value.totalRedemptions
          : totalRedemptions // ignore: cast_nullable_to_non_nullable
              as double,
      outstandingLiability: null == outstandingLiability
          ? _value.outstandingLiability
          : outstandingLiability // ignore: cast_nullable_to_non_nullable
              as double,
      expiredValue: null == expiredValue
          ? _value.expiredValue
          : expiredValue // ignore: cast_nullable_to_non_nullable
              as double,
      periodStart: freezed == periodStart
          ? _value.periodStart
          : periodStart // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      periodEnd: freezed == periodEnd
          ? _value.periodEnd
          : periodEnd // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GiftCardSummaryImpl implements _GiftCardSummary {
  const _$GiftCardSummaryImpl(
      {required this.totalCardsIssued,
      required this.activeCards,
      required this.totalValueIssued,
      required this.totalRedemptions,
      required this.outstandingLiability,
      required this.expiredValue,
      this.periodStart,
      this.periodEnd});

  factory _$GiftCardSummaryImpl.fromJson(Map<String, dynamic> json) =>
      _$$GiftCardSummaryImplFromJson(json);

  @override
  final int totalCardsIssued;
  @override
  final int activeCards;
  @override
  final double totalValueIssued;
  @override
  final double totalRedemptions;
  @override
  final double outstandingLiability;
// Total unredeemed balance
  @override
  final double expiredValue;
  @override
  final DateTime? periodStart;
  @override
  final DateTime? periodEnd;

  @override
  String toString() {
    return 'GiftCardSummary(totalCardsIssued: $totalCardsIssued, activeCards: $activeCards, totalValueIssued: $totalValueIssued, totalRedemptions: $totalRedemptions, outstandingLiability: $outstandingLiability, expiredValue: $expiredValue, periodStart: $periodStart, periodEnd: $periodEnd)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GiftCardSummaryImpl &&
            (identical(other.totalCardsIssued, totalCardsIssued) ||
                other.totalCardsIssued == totalCardsIssued) &&
            (identical(other.activeCards, activeCards) ||
                other.activeCards == activeCards) &&
            (identical(other.totalValueIssued, totalValueIssued) ||
                other.totalValueIssued == totalValueIssued) &&
            (identical(other.totalRedemptions, totalRedemptions) ||
                other.totalRedemptions == totalRedemptions) &&
            (identical(other.outstandingLiability, outstandingLiability) ||
                other.outstandingLiability == outstandingLiability) &&
            (identical(other.expiredValue, expiredValue) ||
                other.expiredValue == expiredValue) &&
            (identical(other.periodStart, periodStart) ||
                other.periodStart == periodStart) &&
            (identical(other.periodEnd, periodEnd) ||
                other.periodEnd == periodEnd));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      totalCardsIssued,
      activeCards,
      totalValueIssued,
      totalRedemptions,
      outstandingLiability,
      expiredValue,
      periodStart,
      periodEnd);

  /// Create a copy of GiftCardSummary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GiftCardSummaryImplCopyWith<_$GiftCardSummaryImpl> get copyWith =>
      __$$GiftCardSummaryImplCopyWithImpl<_$GiftCardSummaryImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GiftCardSummaryImplToJson(
      this,
    );
  }
}

abstract class _GiftCardSummary implements GiftCardSummary {
  const factory _GiftCardSummary(
      {required final int totalCardsIssued,
      required final int activeCards,
      required final double totalValueIssued,
      required final double totalRedemptions,
      required final double outstandingLiability,
      required final double expiredValue,
      final DateTime? periodStart,
      final DateTime? periodEnd}) = _$GiftCardSummaryImpl;

  factory _GiftCardSummary.fromJson(Map<String, dynamic> json) =
      _$GiftCardSummaryImpl.fromJson;

  @override
  int get totalCardsIssued;
  @override
  int get activeCards;
  @override
  double get totalValueIssued;
  @override
  double get totalRedemptions;
  @override
  double get outstandingLiability; // Total unredeemed balance
  @override
  double get expiredValue;
  @override
  DateTime? get periodStart;
  @override
  DateTime? get periodEnd;

  /// Create a copy of GiftCardSummary
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GiftCardSummaryImplCopyWith<_$GiftCardSummaryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
