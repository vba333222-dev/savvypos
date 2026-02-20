// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'kds_entities.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

KDSTicket _$KDSTicketFromJson(Map<String, dynamic> json) {
  return _KDSTicket.fromJson(json);
}

/// @nodoc
mixin _$KDSTicket {
  String get uuid => throw _privateConstructorUsedError;
  String get orderUuid => throw _privateConstructorUsedError;
  String get orderNumber => throw _privateConstructorUsedError;
  String? get tableUuid => throw _privateConstructorUsedError;
  String? get tableName => throw _privateConstructorUsedError;
  String? get serverName =>
      throw _privateConstructorUsedError; // Items in this ticket
  List<KDSItem> get items =>
      throw _privateConstructorUsedError; // Status & Timing
  KDSTicketStatus get status => throw _privateConstructorUsedError;
  DateTime get firedAt => throw _privateConstructorUsedError;
  DateTime? get startedAt => throw _privateConstructorUsedError;
  DateTime? get completedAt =>
      throw _privateConstructorUsedError; // Target completion time (based on longest item prep time)
  DateTime? get targetTime => throw _privateConstructorUsedError; // Notes
  String? get note => throw _privateConstructorUsedError;
  bool get isRush => throw _privateConstructorUsedError;

  /// Serializes this KDSTicket to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of KDSTicket
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $KDSTicketCopyWith<KDSTicket> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $KDSTicketCopyWith<$Res> {
  factory $KDSTicketCopyWith(KDSTicket value, $Res Function(KDSTicket) then) =
      _$KDSTicketCopyWithImpl<$Res, KDSTicket>;
  @useResult
  $Res call(
      {String uuid,
      String orderUuid,
      String orderNumber,
      String? tableUuid,
      String? tableName,
      String? serverName,
      List<KDSItem> items,
      KDSTicketStatus status,
      DateTime firedAt,
      DateTime? startedAt,
      DateTime? completedAt,
      DateTime? targetTime,
      String? note,
      bool isRush});
}

/// @nodoc
class _$KDSTicketCopyWithImpl<$Res, $Val extends KDSTicket>
    implements $KDSTicketCopyWith<$Res> {
  _$KDSTicketCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of KDSTicket
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
    Object? orderUuid = null,
    Object? orderNumber = null,
    Object? tableUuid = freezed,
    Object? tableName = freezed,
    Object? serverName = freezed,
    Object? items = null,
    Object? status = null,
    Object? firedAt = null,
    Object? startedAt = freezed,
    Object? completedAt = freezed,
    Object? targetTime = freezed,
    Object? note = freezed,
    Object? isRush = null,
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
      tableUuid: freezed == tableUuid
          ? _value.tableUuid
          : tableUuid // ignore: cast_nullable_to_non_nullable
              as String?,
      tableName: freezed == tableName
          ? _value.tableName
          : tableName // ignore: cast_nullable_to_non_nullable
              as String?,
      serverName: freezed == serverName
          ? _value.serverName
          : serverName // ignore: cast_nullable_to_non_nullable
              as String?,
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<KDSItem>,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as KDSTicketStatus,
      firedAt: null == firedAt
          ? _value.firedAt
          : firedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      startedAt: freezed == startedAt
          ? _value.startedAt
          : startedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      completedAt: freezed == completedAt
          ? _value.completedAt
          : completedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      targetTime: freezed == targetTime
          ? _value.targetTime
          : targetTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      isRush: null == isRush
          ? _value.isRush
          : isRush // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$KDSTicketImplCopyWith<$Res>
    implements $KDSTicketCopyWith<$Res> {
  factory _$$KDSTicketImplCopyWith(
          _$KDSTicketImpl value, $Res Function(_$KDSTicketImpl) then) =
      __$$KDSTicketImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String uuid,
      String orderUuid,
      String orderNumber,
      String? tableUuid,
      String? tableName,
      String? serverName,
      List<KDSItem> items,
      KDSTicketStatus status,
      DateTime firedAt,
      DateTime? startedAt,
      DateTime? completedAt,
      DateTime? targetTime,
      String? note,
      bool isRush});
}

/// @nodoc
class __$$KDSTicketImplCopyWithImpl<$Res>
    extends _$KDSTicketCopyWithImpl<$Res, _$KDSTicketImpl>
    implements _$$KDSTicketImplCopyWith<$Res> {
  __$$KDSTicketImplCopyWithImpl(
      _$KDSTicketImpl _value, $Res Function(_$KDSTicketImpl) _then)
      : super(_value, _then);

  /// Create a copy of KDSTicket
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
    Object? orderUuid = null,
    Object? orderNumber = null,
    Object? tableUuid = freezed,
    Object? tableName = freezed,
    Object? serverName = freezed,
    Object? items = null,
    Object? status = null,
    Object? firedAt = null,
    Object? startedAt = freezed,
    Object? completedAt = freezed,
    Object? targetTime = freezed,
    Object? note = freezed,
    Object? isRush = null,
  }) {
    return _then(_$KDSTicketImpl(
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
      tableUuid: freezed == tableUuid
          ? _value.tableUuid
          : tableUuid // ignore: cast_nullable_to_non_nullable
              as String?,
      tableName: freezed == tableName
          ? _value.tableName
          : tableName // ignore: cast_nullable_to_non_nullable
              as String?,
      serverName: freezed == serverName
          ? _value.serverName
          : serverName // ignore: cast_nullable_to_non_nullable
              as String?,
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<KDSItem>,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as KDSTicketStatus,
      firedAt: null == firedAt
          ? _value.firedAt
          : firedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      startedAt: freezed == startedAt
          ? _value.startedAt
          : startedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      completedAt: freezed == completedAt
          ? _value.completedAt
          : completedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      targetTime: freezed == targetTime
          ? _value.targetTime
          : targetTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      isRush: null == isRush
          ? _value.isRush
          : isRush // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$KDSTicketImpl extends _KDSTicket {
  const _$KDSTicketImpl(
      {required this.uuid,
      required this.orderUuid,
      required this.orderNumber,
      required this.tableUuid,
      required this.tableName,
      required this.serverName,
      final List<KDSItem> items = const [],
      this.status = KDSTicketStatus.fired,
      required this.firedAt,
      this.startedAt,
      this.completedAt,
      this.targetTime,
      this.note,
      this.isRush = false})
      : _items = items,
        super._();

  factory _$KDSTicketImpl.fromJson(Map<String, dynamic> json) =>
      _$$KDSTicketImplFromJson(json);

  @override
  final String uuid;
  @override
  final String orderUuid;
  @override
  final String orderNumber;
  @override
  final String? tableUuid;
  @override
  final String? tableName;
  @override
  final String? serverName;
// Items in this ticket
  final List<KDSItem> _items;
// Items in this ticket
  @override
  @JsonKey()
  List<KDSItem> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

// Status & Timing
  @override
  @JsonKey()
  final KDSTicketStatus status;
  @override
  final DateTime firedAt;
  @override
  final DateTime? startedAt;
  @override
  final DateTime? completedAt;
// Target completion time (based on longest item prep time)
  @override
  final DateTime? targetTime;
// Notes
  @override
  final String? note;
  @override
  @JsonKey()
  final bool isRush;

  @override
  String toString() {
    return 'KDSTicket(uuid: $uuid, orderUuid: $orderUuid, orderNumber: $orderNumber, tableUuid: $tableUuid, tableName: $tableName, serverName: $serverName, items: $items, status: $status, firedAt: $firedAt, startedAt: $startedAt, completedAt: $completedAt, targetTime: $targetTime, note: $note, isRush: $isRush)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$KDSTicketImpl &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.orderUuid, orderUuid) ||
                other.orderUuid == orderUuid) &&
            (identical(other.orderNumber, orderNumber) ||
                other.orderNumber == orderNumber) &&
            (identical(other.tableUuid, tableUuid) ||
                other.tableUuid == tableUuid) &&
            (identical(other.tableName, tableName) ||
                other.tableName == tableName) &&
            (identical(other.serverName, serverName) ||
                other.serverName == serverName) &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.firedAt, firedAt) || other.firedAt == firedAt) &&
            (identical(other.startedAt, startedAt) ||
                other.startedAt == startedAt) &&
            (identical(other.completedAt, completedAt) ||
                other.completedAt == completedAt) &&
            (identical(other.targetTime, targetTime) ||
                other.targetTime == targetTime) &&
            (identical(other.note, note) || other.note == note) &&
            (identical(other.isRush, isRush) || other.isRush == isRush));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      uuid,
      orderUuid,
      orderNumber,
      tableUuid,
      tableName,
      serverName,
      const DeepCollectionEquality().hash(_items),
      status,
      firedAt,
      startedAt,
      completedAt,
      targetTime,
      note,
      isRush);

  /// Create a copy of KDSTicket
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$KDSTicketImplCopyWith<_$KDSTicketImpl> get copyWith =>
      __$$KDSTicketImplCopyWithImpl<_$KDSTicketImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$KDSTicketImplToJson(
      this,
    );
  }
}

abstract class _KDSTicket extends KDSTicket {
  const factory _KDSTicket(
      {required final String uuid,
      required final String orderUuid,
      required final String orderNumber,
      required final String? tableUuid,
      required final String? tableName,
      required final String? serverName,
      final List<KDSItem> items,
      final KDSTicketStatus status,
      required final DateTime firedAt,
      final DateTime? startedAt,
      final DateTime? completedAt,
      final DateTime? targetTime,
      final String? note,
      final bool isRush}) = _$KDSTicketImpl;
  const _KDSTicket._() : super._();

  factory _KDSTicket.fromJson(Map<String, dynamic> json) =
      _$KDSTicketImpl.fromJson;

  @override
  String get uuid;
  @override
  String get orderUuid;
  @override
  String get orderNumber;
  @override
  String? get tableUuid;
  @override
  String? get tableName;
  @override
  String? get serverName; // Items in this ticket
  @override
  List<KDSItem> get items; // Status & Timing
  @override
  KDSTicketStatus get status;
  @override
  DateTime get firedAt;
  @override
  DateTime? get startedAt;
  @override
  DateTime?
      get completedAt; // Target completion time (based on longest item prep time)
  @override
  DateTime? get targetTime; // Notes
  @override
  String? get note;
  @override
  bool get isRush;

  /// Create a copy of KDSTicket
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$KDSTicketImplCopyWith<_$KDSTicketImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

KDSItem _$KDSItemFromJson(Map<String, dynamic> json) {
  return _KDSItem.fromJson(json);
}

/// @nodoc
mixin _$KDSItem {
  String get uuid => throw _privateConstructorUsedError;
  String get ticketUuid => throw _privateConstructorUsedError;
  String get orderItemUuid => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  int get quantity =>
      throw _privateConstructorUsedError; // Modifiers/Variations
  List<String> get modifiers => throw _privateConstructorUsedError;
  String? get note => throw _privateConstructorUsedError; // Coursing
  KDSCourse get course =>
      throw _privateConstructorUsedError; // Item specific status (e.g. if one item is done before others)
  KDSTicketStatus get status => throw _privateConstructorUsedError;

  /// Serializes this KDSItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of KDSItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $KDSItemCopyWith<KDSItem> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $KDSItemCopyWith<$Res> {
  factory $KDSItemCopyWith(KDSItem value, $Res Function(KDSItem) then) =
      _$KDSItemCopyWithImpl<$Res, KDSItem>;
  @useResult
  $Res call(
      {String uuid,
      String ticketUuid,
      String orderItemUuid,
      String name,
      int quantity,
      List<String> modifiers,
      String? note,
      KDSCourse course,
      KDSTicketStatus status});
}

/// @nodoc
class _$KDSItemCopyWithImpl<$Res, $Val extends KDSItem>
    implements $KDSItemCopyWith<$Res> {
  _$KDSItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of KDSItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
    Object? ticketUuid = null,
    Object? orderItemUuid = null,
    Object? name = null,
    Object? quantity = null,
    Object? modifiers = null,
    Object? note = freezed,
    Object? course = null,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      ticketUuid: null == ticketUuid
          ? _value.ticketUuid
          : ticketUuid // ignore: cast_nullable_to_non_nullable
              as String,
      orderItemUuid: null == orderItemUuid
          ? _value.orderItemUuid
          : orderItemUuid // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      modifiers: null == modifiers
          ? _value.modifiers
          : modifiers // ignore: cast_nullable_to_non_nullable
              as List<String>,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      course: null == course
          ? _value.course
          : course // ignore: cast_nullable_to_non_nullable
              as KDSCourse,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as KDSTicketStatus,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$KDSItemImplCopyWith<$Res> implements $KDSItemCopyWith<$Res> {
  factory _$$KDSItemImplCopyWith(
          _$KDSItemImpl value, $Res Function(_$KDSItemImpl) then) =
      __$$KDSItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String uuid,
      String ticketUuid,
      String orderItemUuid,
      String name,
      int quantity,
      List<String> modifiers,
      String? note,
      KDSCourse course,
      KDSTicketStatus status});
}

/// @nodoc
class __$$KDSItemImplCopyWithImpl<$Res>
    extends _$KDSItemCopyWithImpl<$Res, _$KDSItemImpl>
    implements _$$KDSItemImplCopyWith<$Res> {
  __$$KDSItemImplCopyWithImpl(
      _$KDSItemImpl _value, $Res Function(_$KDSItemImpl) _then)
      : super(_value, _then);

  /// Create a copy of KDSItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
    Object? ticketUuid = null,
    Object? orderItemUuid = null,
    Object? name = null,
    Object? quantity = null,
    Object? modifiers = null,
    Object? note = freezed,
    Object? course = null,
    Object? status = null,
  }) {
    return _then(_$KDSItemImpl(
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      ticketUuid: null == ticketUuid
          ? _value.ticketUuid
          : ticketUuid // ignore: cast_nullable_to_non_nullable
              as String,
      orderItemUuid: null == orderItemUuid
          ? _value.orderItemUuid
          : orderItemUuid // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      modifiers: null == modifiers
          ? _value._modifiers
          : modifiers // ignore: cast_nullable_to_non_nullable
              as List<String>,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      course: null == course
          ? _value.course
          : course // ignore: cast_nullable_to_non_nullable
              as KDSCourse,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as KDSTicketStatus,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$KDSItemImpl implements _KDSItem {
  const _$KDSItemImpl(
      {required this.uuid,
      required this.ticketUuid,
      required this.orderItemUuid,
      required this.name,
      required this.quantity,
      final List<String> modifiers = const [],
      this.note,
      this.course = KDSCourse.main,
      this.status = KDSTicketStatus.fired})
      : _modifiers = modifiers;

  factory _$KDSItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$KDSItemImplFromJson(json);

  @override
  final String uuid;
  @override
  final String ticketUuid;
  @override
  final String orderItemUuid;
  @override
  final String name;
  @override
  final int quantity;
// Modifiers/Variations
  final List<String> _modifiers;
// Modifiers/Variations
  @override
  @JsonKey()
  List<String> get modifiers {
    if (_modifiers is EqualUnmodifiableListView) return _modifiers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_modifiers);
  }

  @override
  final String? note;
// Coursing
  @override
  @JsonKey()
  final KDSCourse course;
// Item specific status (e.g. if one item is done before others)
  @override
  @JsonKey()
  final KDSTicketStatus status;

  @override
  String toString() {
    return 'KDSItem(uuid: $uuid, ticketUuid: $ticketUuid, orderItemUuid: $orderItemUuid, name: $name, quantity: $quantity, modifiers: $modifiers, note: $note, course: $course, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$KDSItemImpl &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.ticketUuid, ticketUuid) ||
                other.ticketUuid == ticketUuid) &&
            (identical(other.orderItemUuid, orderItemUuid) ||
                other.orderItemUuid == orderItemUuid) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            const DeepCollectionEquality()
                .equals(other._modifiers, _modifiers) &&
            (identical(other.note, note) || other.note == note) &&
            (identical(other.course, course) || other.course == course) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      uuid,
      ticketUuid,
      orderItemUuid,
      name,
      quantity,
      const DeepCollectionEquality().hash(_modifiers),
      note,
      course,
      status);

  /// Create a copy of KDSItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$KDSItemImplCopyWith<_$KDSItemImpl> get copyWith =>
      __$$KDSItemImplCopyWithImpl<_$KDSItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$KDSItemImplToJson(
      this,
    );
  }
}

abstract class _KDSItem implements KDSItem {
  const factory _KDSItem(
      {required final String uuid,
      required final String ticketUuid,
      required final String orderItemUuid,
      required final String name,
      required final int quantity,
      final List<String> modifiers,
      final String? note,
      final KDSCourse course,
      final KDSTicketStatus status}) = _$KDSItemImpl;

  factory _KDSItem.fromJson(Map<String, dynamic> json) = _$KDSItemImpl.fromJson;

  @override
  String get uuid;
  @override
  String get ticketUuid;
  @override
  String get orderItemUuid;
  @override
  String get name;
  @override
  int get quantity; // Modifiers/Variations
  @override
  List<String> get modifiers;
  @override
  String? get note; // Coursing
  @override
  KDSCourse
      get course; // Item specific status (e.g. if one item is done before others)
  @override
  KDSTicketStatus get status;

  /// Create a copy of KDSItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$KDSItemImplCopyWith<_$KDSItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

KDSExpoSummary _$KDSExpoSummaryFromJson(Map<String, dynamic> json) {
  return _KDSExpoSummary.fromJson(json);
}

/// @nodoc
mixin _$KDSExpoSummary {
  int get totalActiveTickets => throw _privateConstructorUsedError;
  int get itemsInPrep => throw _privateConstructorUsedError;
  int get itemsReady => throw _privateConstructorUsedError;
  double get avgPrepTimeMinutes =>
      throw _privateConstructorUsedError; // Aggregated counts by item (e.g. "We need 5 Burgers total right now")
  Map<String, int> get activeItemCounts => throw _privateConstructorUsedError;

  /// Serializes this KDSExpoSummary to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of KDSExpoSummary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $KDSExpoSummaryCopyWith<KDSExpoSummary> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $KDSExpoSummaryCopyWith<$Res> {
  factory $KDSExpoSummaryCopyWith(
          KDSExpoSummary value, $Res Function(KDSExpoSummary) then) =
      _$KDSExpoSummaryCopyWithImpl<$Res, KDSExpoSummary>;
  @useResult
  $Res call(
      {int totalActiveTickets,
      int itemsInPrep,
      int itemsReady,
      double avgPrepTimeMinutes,
      Map<String, int> activeItemCounts});
}

/// @nodoc
class _$KDSExpoSummaryCopyWithImpl<$Res, $Val extends KDSExpoSummary>
    implements $KDSExpoSummaryCopyWith<$Res> {
  _$KDSExpoSummaryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of KDSExpoSummary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalActiveTickets = null,
    Object? itemsInPrep = null,
    Object? itemsReady = null,
    Object? avgPrepTimeMinutes = null,
    Object? activeItemCounts = null,
  }) {
    return _then(_value.copyWith(
      totalActiveTickets: null == totalActiveTickets
          ? _value.totalActiveTickets
          : totalActiveTickets // ignore: cast_nullable_to_non_nullable
              as int,
      itemsInPrep: null == itemsInPrep
          ? _value.itemsInPrep
          : itemsInPrep // ignore: cast_nullable_to_non_nullable
              as int,
      itemsReady: null == itemsReady
          ? _value.itemsReady
          : itemsReady // ignore: cast_nullable_to_non_nullable
              as int,
      avgPrepTimeMinutes: null == avgPrepTimeMinutes
          ? _value.avgPrepTimeMinutes
          : avgPrepTimeMinutes // ignore: cast_nullable_to_non_nullable
              as double,
      activeItemCounts: null == activeItemCounts
          ? _value.activeItemCounts
          : activeItemCounts // ignore: cast_nullable_to_non_nullable
              as Map<String, int>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$KDSExpoSummaryImplCopyWith<$Res>
    implements $KDSExpoSummaryCopyWith<$Res> {
  factory _$$KDSExpoSummaryImplCopyWith(_$KDSExpoSummaryImpl value,
          $Res Function(_$KDSExpoSummaryImpl) then) =
      __$$KDSExpoSummaryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int totalActiveTickets,
      int itemsInPrep,
      int itemsReady,
      double avgPrepTimeMinutes,
      Map<String, int> activeItemCounts});
}

/// @nodoc
class __$$KDSExpoSummaryImplCopyWithImpl<$Res>
    extends _$KDSExpoSummaryCopyWithImpl<$Res, _$KDSExpoSummaryImpl>
    implements _$$KDSExpoSummaryImplCopyWith<$Res> {
  __$$KDSExpoSummaryImplCopyWithImpl(
      _$KDSExpoSummaryImpl _value, $Res Function(_$KDSExpoSummaryImpl) _then)
      : super(_value, _then);

  /// Create a copy of KDSExpoSummary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalActiveTickets = null,
    Object? itemsInPrep = null,
    Object? itemsReady = null,
    Object? avgPrepTimeMinutes = null,
    Object? activeItemCounts = null,
  }) {
    return _then(_$KDSExpoSummaryImpl(
      totalActiveTickets: null == totalActiveTickets
          ? _value.totalActiveTickets
          : totalActiveTickets // ignore: cast_nullable_to_non_nullable
              as int,
      itemsInPrep: null == itemsInPrep
          ? _value.itemsInPrep
          : itemsInPrep // ignore: cast_nullable_to_non_nullable
              as int,
      itemsReady: null == itemsReady
          ? _value.itemsReady
          : itemsReady // ignore: cast_nullable_to_non_nullable
              as int,
      avgPrepTimeMinutes: null == avgPrepTimeMinutes
          ? _value.avgPrepTimeMinutes
          : avgPrepTimeMinutes // ignore: cast_nullable_to_non_nullable
              as double,
      activeItemCounts: null == activeItemCounts
          ? _value._activeItemCounts
          : activeItemCounts // ignore: cast_nullable_to_non_nullable
              as Map<String, int>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$KDSExpoSummaryImpl implements _KDSExpoSummary {
  const _$KDSExpoSummaryImpl(
      {required this.totalActiveTickets,
      required this.itemsInPrep,
      required this.itemsReady,
      required this.avgPrepTimeMinutes,
      required final Map<String, int> activeItemCounts})
      : _activeItemCounts = activeItemCounts;

  factory _$KDSExpoSummaryImpl.fromJson(Map<String, dynamic> json) =>
      _$$KDSExpoSummaryImplFromJson(json);

  @override
  final int totalActiveTickets;
  @override
  final int itemsInPrep;
  @override
  final int itemsReady;
  @override
  final double avgPrepTimeMinutes;
// Aggregated counts by item (e.g. "We need 5 Burgers total right now")
  final Map<String, int> _activeItemCounts;
// Aggregated counts by item (e.g. "We need 5 Burgers total right now")
  @override
  Map<String, int> get activeItemCounts {
    if (_activeItemCounts is EqualUnmodifiableMapView) return _activeItemCounts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_activeItemCounts);
  }

  @override
  String toString() {
    return 'KDSExpoSummary(totalActiveTickets: $totalActiveTickets, itemsInPrep: $itemsInPrep, itemsReady: $itemsReady, avgPrepTimeMinutes: $avgPrepTimeMinutes, activeItemCounts: $activeItemCounts)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$KDSExpoSummaryImpl &&
            (identical(other.totalActiveTickets, totalActiveTickets) ||
                other.totalActiveTickets == totalActiveTickets) &&
            (identical(other.itemsInPrep, itemsInPrep) ||
                other.itemsInPrep == itemsInPrep) &&
            (identical(other.itemsReady, itemsReady) ||
                other.itemsReady == itemsReady) &&
            (identical(other.avgPrepTimeMinutes, avgPrepTimeMinutes) ||
                other.avgPrepTimeMinutes == avgPrepTimeMinutes) &&
            const DeepCollectionEquality()
                .equals(other._activeItemCounts, _activeItemCounts));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      totalActiveTickets,
      itemsInPrep,
      itemsReady,
      avgPrepTimeMinutes,
      const DeepCollectionEquality().hash(_activeItemCounts));

  /// Create a copy of KDSExpoSummary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$KDSExpoSummaryImplCopyWith<_$KDSExpoSummaryImpl> get copyWith =>
      __$$KDSExpoSummaryImplCopyWithImpl<_$KDSExpoSummaryImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$KDSExpoSummaryImplToJson(
      this,
    );
  }
}

abstract class _KDSExpoSummary implements KDSExpoSummary {
  const factory _KDSExpoSummary(
      {required final int totalActiveTickets,
      required final int itemsInPrep,
      required final int itemsReady,
      required final double avgPrepTimeMinutes,
      required final Map<String, int> activeItemCounts}) = _$KDSExpoSummaryImpl;

  factory _KDSExpoSummary.fromJson(Map<String, dynamic> json) =
      _$KDSExpoSummaryImpl.fromJson;

  @override
  int get totalActiveTickets;
  @override
  int get itemsInPrep;
  @override
  int get itemsReady;
  @override
  double
      get avgPrepTimeMinutes; // Aggregated counts by item (e.g. "We need 5 Burgers total right now")
  @override
  Map<String, int> get activeItemCounts;

  /// Create a copy of KDSExpoSummary
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$KDSExpoSummaryImplCopyWith<_$KDSExpoSummaryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
