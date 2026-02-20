// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'customer_profile.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CustomerProfile _$CustomerProfileFromJson(Map<String, dynamic> json) {
  return _CustomerProfile.fromJson(json);
}

/// @nodoc
mixin _$CustomerProfile {
  String get uuid => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get phoneNumber => throw _privateConstructorUsedError;
  DateTime? get birthday => throw _privateConstructorUsedError;
  int get visitCount => throw _privateConstructorUsedError;
  double get totalSpent => throw _privateConstructorUsedError;
  double get averageOrderValue => throw _privateConstructorUsedError;
  DateTime? get firstVisit => throw _privateConstructorUsedError;
  DateTime? get lastVisit => throw _privateConstructorUsedError;
  List<String> get tags =>
      throw _privateConstructorUsedError; // ['VIP', 'Allergies', 'Birthday']
  List<CustomerNote> get notes => throw _privateConstructorUsedError;
  CustomerSegment get segment => throw _privateConstructorUsedError;

  /// Serializes this CustomerProfile to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CustomerProfile
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CustomerProfileCopyWith<CustomerProfile> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomerProfileCopyWith<$Res> {
  factory $CustomerProfileCopyWith(
          CustomerProfile value, $Res Function(CustomerProfile) then) =
      _$CustomerProfileCopyWithImpl<$Res, CustomerProfile>;
  @useResult
  $Res call(
      {String uuid,
      String name,
      String? email,
      String? phoneNumber,
      DateTime? birthday,
      int visitCount,
      double totalSpent,
      double averageOrderValue,
      DateTime? firstVisit,
      DateTime? lastVisit,
      List<String> tags,
      List<CustomerNote> notes,
      CustomerSegment segment});
}

/// @nodoc
class _$CustomerProfileCopyWithImpl<$Res, $Val extends CustomerProfile>
    implements $CustomerProfileCopyWith<$Res> {
  _$CustomerProfileCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CustomerProfile
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
    Object? name = null,
    Object? email = freezed,
    Object? phoneNumber = freezed,
    Object? birthday = freezed,
    Object? visitCount = null,
    Object? totalSpent = null,
    Object? averageOrderValue = null,
    Object? firstVisit = freezed,
    Object? lastVisit = freezed,
    Object? tags = null,
    Object? notes = null,
    Object? segment = null,
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
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      birthday: freezed == birthday
          ? _value.birthday
          : birthday // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      visitCount: null == visitCount
          ? _value.visitCount
          : visitCount // ignore: cast_nullable_to_non_nullable
              as int,
      totalSpent: null == totalSpent
          ? _value.totalSpent
          : totalSpent // ignore: cast_nullable_to_non_nullable
              as double,
      averageOrderValue: null == averageOrderValue
          ? _value.averageOrderValue
          : averageOrderValue // ignore: cast_nullable_to_non_nullable
              as double,
      firstVisit: freezed == firstVisit
          ? _value.firstVisit
          : firstVisit // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      lastVisit: freezed == lastVisit
          ? _value.lastVisit
          : lastVisit // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      tags: null == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      notes: null == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as List<CustomerNote>,
      segment: null == segment
          ? _value.segment
          : segment // ignore: cast_nullable_to_non_nullable
              as CustomerSegment,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CustomerProfileImplCopyWith<$Res>
    implements $CustomerProfileCopyWith<$Res> {
  factory _$$CustomerProfileImplCopyWith(_$CustomerProfileImpl value,
          $Res Function(_$CustomerProfileImpl) then) =
      __$$CustomerProfileImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String uuid,
      String name,
      String? email,
      String? phoneNumber,
      DateTime? birthday,
      int visitCount,
      double totalSpent,
      double averageOrderValue,
      DateTime? firstVisit,
      DateTime? lastVisit,
      List<String> tags,
      List<CustomerNote> notes,
      CustomerSegment segment});
}

/// @nodoc
class __$$CustomerProfileImplCopyWithImpl<$Res>
    extends _$CustomerProfileCopyWithImpl<$Res, _$CustomerProfileImpl>
    implements _$$CustomerProfileImplCopyWith<$Res> {
  __$$CustomerProfileImplCopyWithImpl(
      _$CustomerProfileImpl _value, $Res Function(_$CustomerProfileImpl) _then)
      : super(_value, _then);

  /// Create a copy of CustomerProfile
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
    Object? name = null,
    Object? email = freezed,
    Object? phoneNumber = freezed,
    Object? birthday = freezed,
    Object? visitCount = null,
    Object? totalSpent = null,
    Object? averageOrderValue = null,
    Object? firstVisit = freezed,
    Object? lastVisit = freezed,
    Object? tags = null,
    Object? notes = null,
    Object? segment = null,
  }) {
    return _then(_$CustomerProfileImpl(
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
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      birthday: freezed == birthday
          ? _value.birthday
          : birthday // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      visitCount: null == visitCount
          ? _value.visitCount
          : visitCount // ignore: cast_nullable_to_non_nullable
              as int,
      totalSpent: null == totalSpent
          ? _value.totalSpent
          : totalSpent // ignore: cast_nullable_to_non_nullable
              as double,
      averageOrderValue: null == averageOrderValue
          ? _value.averageOrderValue
          : averageOrderValue // ignore: cast_nullable_to_non_nullable
              as double,
      firstVisit: freezed == firstVisit
          ? _value.firstVisit
          : firstVisit // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      lastVisit: freezed == lastVisit
          ? _value.lastVisit
          : lastVisit // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      tags: null == tags
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      notes: null == notes
          ? _value._notes
          : notes // ignore: cast_nullable_to_non_nullable
              as List<CustomerNote>,
      segment: null == segment
          ? _value.segment
          : segment // ignore: cast_nullable_to_non_nullable
              as CustomerSegment,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CustomerProfileImpl implements _CustomerProfile {
  const _$CustomerProfileImpl(
      {required this.uuid,
      required this.name,
      this.email,
      this.phoneNumber,
      this.birthday,
      this.visitCount = 0,
      this.totalSpent = 0.0,
      this.averageOrderValue = 0.0,
      this.firstVisit,
      this.lastVisit,
      final List<String> tags = const [],
      final List<CustomerNote> notes = const [],
      this.segment = CustomerSegment.newGuest})
      : _tags = tags,
        _notes = notes;

  factory _$CustomerProfileImpl.fromJson(Map<String, dynamic> json) =>
      _$$CustomerProfileImplFromJson(json);

  @override
  final String uuid;
  @override
  final String name;
  @override
  final String? email;
  @override
  final String? phoneNumber;
  @override
  final DateTime? birthday;
  @override
  @JsonKey()
  final int visitCount;
  @override
  @JsonKey()
  final double totalSpent;
  @override
  @JsonKey()
  final double averageOrderValue;
  @override
  final DateTime? firstVisit;
  @override
  final DateTime? lastVisit;
  final List<String> _tags;
  @override
  @JsonKey()
  List<String> get tags {
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tags);
  }

// ['VIP', 'Allergies', 'Birthday']
  final List<CustomerNote> _notes;
// ['VIP', 'Allergies', 'Birthday']
  @override
  @JsonKey()
  List<CustomerNote> get notes {
    if (_notes is EqualUnmodifiableListView) return _notes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_notes);
  }

  @override
  @JsonKey()
  final CustomerSegment segment;

  @override
  String toString() {
    return 'CustomerProfile(uuid: $uuid, name: $name, email: $email, phoneNumber: $phoneNumber, birthday: $birthday, visitCount: $visitCount, totalSpent: $totalSpent, averageOrderValue: $averageOrderValue, firstVisit: $firstVisit, lastVisit: $lastVisit, tags: $tags, notes: $notes, segment: $segment)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CustomerProfileImpl &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.birthday, birthday) ||
                other.birthday == birthday) &&
            (identical(other.visitCount, visitCount) ||
                other.visitCount == visitCount) &&
            (identical(other.totalSpent, totalSpent) ||
                other.totalSpent == totalSpent) &&
            (identical(other.averageOrderValue, averageOrderValue) ||
                other.averageOrderValue == averageOrderValue) &&
            (identical(other.firstVisit, firstVisit) ||
                other.firstVisit == firstVisit) &&
            (identical(other.lastVisit, lastVisit) ||
                other.lastVisit == lastVisit) &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            const DeepCollectionEquality().equals(other._notes, _notes) &&
            (identical(other.segment, segment) || other.segment == segment));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      uuid,
      name,
      email,
      phoneNumber,
      birthday,
      visitCount,
      totalSpent,
      averageOrderValue,
      firstVisit,
      lastVisit,
      const DeepCollectionEquality().hash(_tags),
      const DeepCollectionEquality().hash(_notes),
      segment);

  /// Create a copy of CustomerProfile
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CustomerProfileImplCopyWith<_$CustomerProfileImpl> get copyWith =>
      __$$CustomerProfileImplCopyWithImpl<_$CustomerProfileImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CustomerProfileImplToJson(
      this,
    );
  }
}

abstract class _CustomerProfile implements CustomerProfile {
  const factory _CustomerProfile(
      {required final String uuid,
      required final String name,
      final String? email,
      final String? phoneNumber,
      final DateTime? birthday,
      final int visitCount,
      final double totalSpent,
      final double averageOrderValue,
      final DateTime? firstVisit,
      final DateTime? lastVisit,
      final List<String> tags,
      final List<CustomerNote> notes,
      final CustomerSegment segment}) = _$CustomerProfileImpl;

  factory _CustomerProfile.fromJson(Map<String, dynamic> json) =
      _$CustomerProfileImpl.fromJson;

  @override
  String get uuid;
  @override
  String get name;
  @override
  String? get email;
  @override
  String? get phoneNumber;
  @override
  DateTime? get birthday;
  @override
  int get visitCount;
  @override
  double get totalSpent;
  @override
  double get averageOrderValue;
  @override
  DateTime? get firstVisit;
  @override
  DateTime? get lastVisit;
  @override
  List<String> get tags; // ['VIP', 'Allergies', 'Birthday']
  @override
  List<CustomerNote> get notes;
  @override
  CustomerSegment get segment;

  /// Create a copy of CustomerProfile
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CustomerProfileImplCopyWith<_$CustomerProfileImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CustomerNote _$CustomerNoteFromJson(Map<String, dynamic> json) {
  return _CustomerNote.fromJson(json);
}

/// @nodoc
mixin _$CustomerNote {
  String get id => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  String get createdBy => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  bool get isCritical => throw _privateConstructorUsedError;

  /// Serializes this CustomerNote to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CustomerNote
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CustomerNoteCopyWith<CustomerNote> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomerNoteCopyWith<$Res> {
  factory $CustomerNoteCopyWith(
          CustomerNote value, $Res Function(CustomerNote) then) =
      _$CustomerNoteCopyWithImpl<$Res, CustomerNote>;
  @useResult
  $Res call(
      {String id,
      String content,
      String createdBy,
      DateTime createdAt,
      bool isCritical});
}

/// @nodoc
class _$CustomerNoteCopyWithImpl<$Res, $Val extends CustomerNote>
    implements $CustomerNoteCopyWith<$Res> {
  _$CustomerNoteCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CustomerNote
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? content = null,
    Object? createdBy = null,
    Object? createdAt = null,
    Object? isCritical = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      createdBy: null == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isCritical: null == isCritical
          ? _value.isCritical
          : isCritical // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CustomerNoteImplCopyWith<$Res>
    implements $CustomerNoteCopyWith<$Res> {
  factory _$$CustomerNoteImplCopyWith(
          _$CustomerNoteImpl value, $Res Function(_$CustomerNoteImpl) then) =
      __$$CustomerNoteImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String content,
      String createdBy,
      DateTime createdAt,
      bool isCritical});
}

/// @nodoc
class __$$CustomerNoteImplCopyWithImpl<$Res>
    extends _$CustomerNoteCopyWithImpl<$Res, _$CustomerNoteImpl>
    implements _$$CustomerNoteImplCopyWith<$Res> {
  __$$CustomerNoteImplCopyWithImpl(
      _$CustomerNoteImpl _value, $Res Function(_$CustomerNoteImpl) _then)
      : super(_value, _then);

  /// Create a copy of CustomerNote
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? content = null,
    Object? createdBy = null,
    Object? createdAt = null,
    Object? isCritical = null,
  }) {
    return _then(_$CustomerNoteImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      createdBy: null == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isCritical: null == isCritical
          ? _value.isCritical
          : isCritical // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CustomerNoteImpl implements _CustomerNote {
  const _$CustomerNoteImpl(
      {required this.id,
      required this.content,
      required this.createdBy,
      required this.createdAt,
      this.isCritical = false});

  factory _$CustomerNoteImpl.fromJson(Map<String, dynamic> json) =>
      _$$CustomerNoteImplFromJson(json);

  @override
  final String id;
  @override
  final String content;
  @override
  final String createdBy;
  @override
  final DateTime createdAt;
  @override
  @JsonKey()
  final bool isCritical;

  @override
  String toString() {
    return 'CustomerNote(id: $id, content: $content, createdBy: $createdBy, createdAt: $createdAt, isCritical: $isCritical)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CustomerNoteImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.isCritical, isCritical) ||
                other.isCritical == isCritical));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, content, createdBy, createdAt, isCritical);

  /// Create a copy of CustomerNote
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CustomerNoteImplCopyWith<_$CustomerNoteImpl> get copyWith =>
      __$$CustomerNoteImplCopyWithImpl<_$CustomerNoteImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CustomerNoteImplToJson(
      this,
    );
  }
}

abstract class _CustomerNote implements CustomerNote {
  const factory _CustomerNote(
      {required final String id,
      required final String content,
      required final String createdBy,
      required final DateTime createdAt,
      final bool isCritical}) = _$CustomerNoteImpl;

  factory _CustomerNote.fromJson(Map<String, dynamic> json) =
      _$CustomerNoteImpl.fromJson;

  @override
  String get id;
  @override
  String get content;
  @override
  String get createdBy;
  @override
  DateTime get createdAt;
  @override
  bool get isCritical;

  /// Create a copy of CustomerNote
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CustomerNoteImplCopyWith<_$CustomerNoteImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

OrderHistoryItem _$OrderHistoryItemFromJson(Map<String, dynamic> json) {
  return _OrderHistoryItem.fromJson(json);
}

/// @nodoc
mixin _$OrderHistoryItem {
  String get orderUuid => throw _privateConstructorUsedError;
  DateTime get orderDate => throw _privateConstructorUsedError;
  double get total => throw _privateConstructorUsedError;
  int get itemCount => throw _privateConstructorUsedError;
  String get paymentMethod => throw _privateConstructorUsedError;
  String? get channel => throw _privateConstructorUsedError;

  /// Serializes this OrderHistoryItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OrderHistoryItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OrderHistoryItemCopyWith<OrderHistoryItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderHistoryItemCopyWith<$Res> {
  factory $OrderHistoryItemCopyWith(
          OrderHistoryItem value, $Res Function(OrderHistoryItem) then) =
      _$OrderHistoryItemCopyWithImpl<$Res, OrderHistoryItem>;
  @useResult
  $Res call(
      {String orderUuid,
      DateTime orderDate,
      double total,
      int itemCount,
      String paymentMethod,
      String? channel});
}

/// @nodoc
class _$OrderHistoryItemCopyWithImpl<$Res, $Val extends OrderHistoryItem>
    implements $OrderHistoryItemCopyWith<$Res> {
  _$OrderHistoryItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OrderHistoryItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderUuid = null,
    Object? orderDate = null,
    Object? total = null,
    Object? itemCount = null,
    Object? paymentMethod = null,
    Object? channel = freezed,
  }) {
    return _then(_value.copyWith(
      orderUuid: null == orderUuid
          ? _value.orderUuid
          : orderUuid // ignore: cast_nullable_to_non_nullable
              as String,
      orderDate: null == orderDate
          ? _value.orderDate
          : orderDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as double,
      itemCount: null == itemCount
          ? _value.itemCount
          : itemCount // ignore: cast_nullable_to_non_nullable
              as int,
      paymentMethod: null == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as String,
      channel: freezed == channel
          ? _value.channel
          : channel // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OrderHistoryItemImplCopyWith<$Res>
    implements $OrderHistoryItemCopyWith<$Res> {
  factory _$$OrderHistoryItemImplCopyWith(_$OrderHistoryItemImpl value,
          $Res Function(_$OrderHistoryItemImpl) then) =
      __$$OrderHistoryItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String orderUuid,
      DateTime orderDate,
      double total,
      int itemCount,
      String paymentMethod,
      String? channel});
}

/// @nodoc
class __$$OrderHistoryItemImplCopyWithImpl<$Res>
    extends _$OrderHistoryItemCopyWithImpl<$Res, _$OrderHistoryItemImpl>
    implements _$$OrderHistoryItemImplCopyWith<$Res> {
  __$$OrderHistoryItemImplCopyWithImpl(_$OrderHistoryItemImpl _value,
      $Res Function(_$OrderHistoryItemImpl) _then)
      : super(_value, _then);

  /// Create a copy of OrderHistoryItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderUuid = null,
    Object? orderDate = null,
    Object? total = null,
    Object? itemCount = null,
    Object? paymentMethod = null,
    Object? channel = freezed,
  }) {
    return _then(_$OrderHistoryItemImpl(
      orderUuid: null == orderUuid
          ? _value.orderUuid
          : orderUuid // ignore: cast_nullable_to_non_nullable
              as String,
      orderDate: null == orderDate
          ? _value.orderDate
          : orderDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as double,
      itemCount: null == itemCount
          ? _value.itemCount
          : itemCount // ignore: cast_nullable_to_non_nullable
              as int,
      paymentMethod: null == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as String,
      channel: freezed == channel
          ? _value.channel
          : channel // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OrderHistoryItemImpl implements _OrderHistoryItem {
  const _$OrderHistoryItemImpl(
      {required this.orderUuid,
      required this.orderDate,
      required this.total,
      required this.itemCount,
      required this.paymentMethod,
      this.channel});

  factory _$OrderHistoryItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderHistoryItemImplFromJson(json);

  @override
  final String orderUuid;
  @override
  final DateTime orderDate;
  @override
  final double total;
  @override
  final int itemCount;
  @override
  final String paymentMethod;
  @override
  final String? channel;

  @override
  String toString() {
    return 'OrderHistoryItem(orderUuid: $orderUuid, orderDate: $orderDate, total: $total, itemCount: $itemCount, paymentMethod: $paymentMethod, channel: $channel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderHistoryItemImpl &&
            (identical(other.orderUuid, orderUuid) ||
                other.orderUuid == orderUuid) &&
            (identical(other.orderDate, orderDate) ||
                other.orderDate == orderDate) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.itemCount, itemCount) ||
                other.itemCount == itemCount) &&
            (identical(other.paymentMethod, paymentMethod) ||
                other.paymentMethod == paymentMethod) &&
            (identical(other.channel, channel) || other.channel == channel));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, orderUuid, orderDate, total,
      itemCount, paymentMethod, channel);

  /// Create a copy of OrderHistoryItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderHistoryItemImplCopyWith<_$OrderHistoryItemImpl> get copyWith =>
      __$$OrderHistoryItemImplCopyWithImpl<_$OrderHistoryItemImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderHistoryItemImplToJson(
      this,
    );
  }
}

abstract class _OrderHistoryItem implements OrderHistoryItem {
  const factory _OrderHistoryItem(
      {required final String orderUuid,
      required final DateTime orderDate,
      required final double total,
      required final int itemCount,
      required final String paymentMethod,
      final String? channel}) = _$OrderHistoryItemImpl;

  factory _OrderHistoryItem.fromJson(Map<String, dynamic> json) =
      _$OrderHistoryItemImpl.fromJson;

  @override
  String get orderUuid;
  @override
  DateTime get orderDate;
  @override
  double get total;
  @override
  int get itemCount;
  @override
  String get paymentMethod;
  @override
  String? get channel;

  /// Create a copy of OrderHistoryItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OrderHistoryItemImplCopyWith<_$OrderHistoryItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CustomerInsights _$CustomerInsightsFromJson(Map<String, dynamic> json) {
  return _CustomerInsights.fromJson(json);
}

/// @nodoc
mixin _$CustomerInsights {
  int get totalNewGuests => throw _privateConstructorUsedError;
  int get totalReturning => throw _privateConstructorUsedError;
  int get totalLapsed => throw _privateConstructorUsedError;
  double get averageSpendAll => throw _privateConstructorUsedError;
  String get topItem =>
      throw _privateConstructorUsedError; // Most ordered item by this customer
  String? get lastOrderChannel => throw _privateConstructorUsedError;

  /// Serializes this CustomerInsights to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CustomerInsights
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CustomerInsightsCopyWith<CustomerInsights> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomerInsightsCopyWith<$Res> {
  factory $CustomerInsightsCopyWith(
          CustomerInsights value, $Res Function(CustomerInsights) then) =
      _$CustomerInsightsCopyWithImpl<$Res, CustomerInsights>;
  @useResult
  $Res call(
      {int totalNewGuests,
      int totalReturning,
      int totalLapsed,
      double averageSpendAll,
      String topItem,
      String? lastOrderChannel});
}

/// @nodoc
class _$CustomerInsightsCopyWithImpl<$Res, $Val extends CustomerInsights>
    implements $CustomerInsightsCopyWith<$Res> {
  _$CustomerInsightsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CustomerInsights
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalNewGuests = null,
    Object? totalReturning = null,
    Object? totalLapsed = null,
    Object? averageSpendAll = null,
    Object? topItem = null,
    Object? lastOrderChannel = freezed,
  }) {
    return _then(_value.copyWith(
      totalNewGuests: null == totalNewGuests
          ? _value.totalNewGuests
          : totalNewGuests // ignore: cast_nullable_to_non_nullable
              as int,
      totalReturning: null == totalReturning
          ? _value.totalReturning
          : totalReturning // ignore: cast_nullable_to_non_nullable
              as int,
      totalLapsed: null == totalLapsed
          ? _value.totalLapsed
          : totalLapsed // ignore: cast_nullable_to_non_nullable
              as int,
      averageSpendAll: null == averageSpendAll
          ? _value.averageSpendAll
          : averageSpendAll // ignore: cast_nullable_to_non_nullable
              as double,
      topItem: null == topItem
          ? _value.topItem
          : topItem // ignore: cast_nullable_to_non_nullable
              as String,
      lastOrderChannel: freezed == lastOrderChannel
          ? _value.lastOrderChannel
          : lastOrderChannel // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CustomerInsightsImplCopyWith<$Res>
    implements $CustomerInsightsCopyWith<$Res> {
  factory _$$CustomerInsightsImplCopyWith(_$CustomerInsightsImpl value,
          $Res Function(_$CustomerInsightsImpl) then) =
      __$$CustomerInsightsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int totalNewGuests,
      int totalReturning,
      int totalLapsed,
      double averageSpendAll,
      String topItem,
      String? lastOrderChannel});
}

/// @nodoc
class __$$CustomerInsightsImplCopyWithImpl<$Res>
    extends _$CustomerInsightsCopyWithImpl<$Res, _$CustomerInsightsImpl>
    implements _$$CustomerInsightsImplCopyWith<$Res> {
  __$$CustomerInsightsImplCopyWithImpl(_$CustomerInsightsImpl _value,
      $Res Function(_$CustomerInsightsImpl) _then)
      : super(_value, _then);

  /// Create a copy of CustomerInsights
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalNewGuests = null,
    Object? totalReturning = null,
    Object? totalLapsed = null,
    Object? averageSpendAll = null,
    Object? topItem = null,
    Object? lastOrderChannel = freezed,
  }) {
    return _then(_$CustomerInsightsImpl(
      totalNewGuests: null == totalNewGuests
          ? _value.totalNewGuests
          : totalNewGuests // ignore: cast_nullable_to_non_nullable
              as int,
      totalReturning: null == totalReturning
          ? _value.totalReturning
          : totalReturning // ignore: cast_nullable_to_non_nullable
              as int,
      totalLapsed: null == totalLapsed
          ? _value.totalLapsed
          : totalLapsed // ignore: cast_nullable_to_non_nullable
              as int,
      averageSpendAll: null == averageSpendAll
          ? _value.averageSpendAll
          : averageSpendAll // ignore: cast_nullable_to_non_nullable
              as double,
      topItem: null == topItem
          ? _value.topItem
          : topItem // ignore: cast_nullable_to_non_nullable
              as String,
      lastOrderChannel: freezed == lastOrderChannel
          ? _value.lastOrderChannel
          : lastOrderChannel // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CustomerInsightsImpl implements _CustomerInsights {
  const _$CustomerInsightsImpl(
      {required this.totalNewGuests,
      required this.totalReturning,
      required this.totalLapsed,
      required this.averageSpendAll,
      required this.topItem,
      this.lastOrderChannel});

  factory _$CustomerInsightsImpl.fromJson(Map<String, dynamic> json) =>
      _$$CustomerInsightsImplFromJson(json);

  @override
  final int totalNewGuests;
  @override
  final int totalReturning;
  @override
  final int totalLapsed;
  @override
  final double averageSpendAll;
  @override
  final String topItem;
// Most ordered item by this customer
  @override
  final String? lastOrderChannel;

  @override
  String toString() {
    return 'CustomerInsights(totalNewGuests: $totalNewGuests, totalReturning: $totalReturning, totalLapsed: $totalLapsed, averageSpendAll: $averageSpendAll, topItem: $topItem, lastOrderChannel: $lastOrderChannel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CustomerInsightsImpl &&
            (identical(other.totalNewGuests, totalNewGuests) ||
                other.totalNewGuests == totalNewGuests) &&
            (identical(other.totalReturning, totalReturning) ||
                other.totalReturning == totalReturning) &&
            (identical(other.totalLapsed, totalLapsed) ||
                other.totalLapsed == totalLapsed) &&
            (identical(other.averageSpendAll, averageSpendAll) ||
                other.averageSpendAll == averageSpendAll) &&
            (identical(other.topItem, topItem) || other.topItem == topItem) &&
            (identical(other.lastOrderChannel, lastOrderChannel) ||
                other.lastOrderChannel == lastOrderChannel));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, totalNewGuests, totalReturning,
      totalLapsed, averageSpendAll, topItem, lastOrderChannel);

  /// Create a copy of CustomerInsights
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CustomerInsightsImplCopyWith<_$CustomerInsightsImpl> get copyWith =>
      __$$CustomerInsightsImplCopyWithImpl<_$CustomerInsightsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CustomerInsightsImplToJson(
      this,
    );
  }
}

abstract class _CustomerInsights implements CustomerInsights {
  const factory _CustomerInsights(
      {required final int totalNewGuests,
      required final int totalReturning,
      required final int totalLapsed,
      required final double averageSpendAll,
      required final String topItem,
      final String? lastOrderChannel}) = _$CustomerInsightsImpl;

  factory _CustomerInsights.fromJson(Map<String, dynamic> json) =
      _$CustomerInsightsImpl.fromJson;

  @override
  int get totalNewGuests;
  @override
  int get totalReturning;
  @override
  int get totalLapsed;
  @override
  double get averageSpendAll;
  @override
  String get topItem; // Most ordered item by this customer
  @override
  String? get lastOrderChannel;

  /// Create a copy of CustomerInsights
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CustomerInsightsImplCopyWith<_$CustomerInsightsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
