// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'waitlist_entities.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

WaitlistEntry _$WaitlistEntryFromJson(Map<String, dynamic> json) {
  return _WaitlistEntry.fromJson(json);
}

/// @nodoc
mixin _$WaitlistEntry {
  String get uuid => throw _privateConstructorUsedError;
  String get guestName => throw _privateConstructorUsedError;
  String get phoneNumber => throw _privateConstructorUsedError;
  int get partySize => throw _privateConstructorUsedError; // Preferences
  String? get specialRequests => throw _privateConstructorUsedError;
  bool get highchairNeeded => throw _privateConstructorUsedError;
  bool get wheelchairAccessible => throw _privateConstructorUsedError;
  String? get tablePreference =>
      throw _privateConstructorUsedError; // indoor, outdoor, bar, etc.
// Status tracking
  WaitlistStatus get status => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime? get quotedWaitTime =>
      throw _privateConstructorUsedError; // When we expect to seat them
  DateTime? get notifiedAt =>
      throw _privateConstructorUsedError; // When SMS was sent
  DateTime? get seatedAt => throw _privateConstructorUsedError;
  String? get seatedTableUuid =>
      throw _privateConstructorUsedError; // Queue position
  int? get queuePosition => throw _privateConstructorUsedError;

  /// Serializes this WaitlistEntry to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WaitlistEntry
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WaitlistEntryCopyWith<WaitlistEntry> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WaitlistEntryCopyWith<$Res> {
  factory $WaitlistEntryCopyWith(
          WaitlistEntry value, $Res Function(WaitlistEntry) then) =
      _$WaitlistEntryCopyWithImpl<$Res, WaitlistEntry>;
  @useResult
  $Res call(
      {String uuid,
      String guestName,
      String phoneNumber,
      int partySize,
      String? specialRequests,
      bool highchairNeeded,
      bool wheelchairAccessible,
      String? tablePreference,
      WaitlistStatus status,
      DateTime createdAt,
      DateTime? quotedWaitTime,
      DateTime? notifiedAt,
      DateTime? seatedAt,
      String? seatedTableUuid,
      int? queuePosition});
}

/// @nodoc
class _$WaitlistEntryCopyWithImpl<$Res, $Val extends WaitlistEntry>
    implements $WaitlistEntryCopyWith<$Res> {
  _$WaitlistEntryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WaitlistEntry
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
    Object? guestName = null,
    Object? phoneNumber = null,
    Object? partySize = null,
    Object? specialRequests = freezed,
    Object? highchairNeeded = null,
    Object? wheelchairAccessible = null,
    Object? tablePreference = freezed,
    Object? status = null,
    Object? createdAt = null,
    Object? quotedWaitTime = freezed,
    Object? notifiedAt = freezed,
    Object? seatedAt = freezed,
    Object? seatedTableUuid = freezed,
    Object? queuePosition = freezed,
  }) {
    return _then(_value.copyWith(
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      guestName: null == guestName
          ? _value.guestName
          : guestName // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      partySize: null == partySize
          ? _value.partySize
          : partySize // ignore: cast_nullable_to_non_nullable
              as int,
      specialRequests: freezed == specialRequests
          ? _value.specialRequests
          : specialRequests // ignore: cast_nullable_to_non_nullable
              as String?,
      highchairNeeded: null == highchairNeeded
          ? _value.highchairNeeded
          : highchairNeeded // ignore: cast_nullable_to_non_nullable
              as bool,
      wheelchairAccessible: null == wheelchairAccessible
          ? _value.wheelchairAccessible
          : wheelchairAccessible // ignore: cast_nullable_to_non_nullable
              as bool,
      tablePreference: freezed == tablePreference
          ? _value.tablePreference
          : tablePreference // ignore: cast_nullable_to_non_nullable
              as String?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as WaitlistStatus,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      quotedWaitTime: freezed == quotedWaitTime
          ? _value.quotedWaitTime
          : quotedWaitTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      notifiedAt: freezed == notifiedAt
          ? _value.notifiedAt
          : notifiedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      seatedAt: freezed == seatedAt
          ? _value.seatedAt
          : seatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      seatedTableUuid: freezed == seatedTableUuid
          ? _value.seatedTableUuid
          : seatedTableUuid // ignore: cast_nullable_to_non_nullable
              as String?,
      queuePosition: freezed == queuePosition
          ? _value.queuePosition
          : queuePosition // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WaitlistEntryImplCopyWith<$Res>
    implements $WaitlistEntryCopyWith<$Res> {
  factory _$$WaitlistEntryImplCopyWith(
          _$WaitlistEntryImpl value, $Res Function(_$WaitlistEntryImpl) then) =
      __$$WaitlistEntryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String uuid,
      String guestName,
      String phoneNumber,
      int partySize,
      String? specialRequests,
      bool highchairNeeded,
      bool wheelchairAccessible,
      String? tablePreference,
      WaitlistStatus status,
      DateTime createdAt,
      DateTime? quotedWaitTime,
      DateTime? notifiedAt,
      DateTime? seatedAt,
      String? seatedTableUuid,
      int? queuePosition});
}

/// @nodoc
class __$$WaitlistEntryImplCopyWithImpl<$Res>
    extends _$WaitlistEntryCopyWithImpl<$Res, _$WaitlistEntryImpl>
    implements _$$WaitlistEntryImplCopyWith<$Res> {
  __$$WaitlistEntryImplCopyWithImpl(
      _$WaitlistEntryImpl _value, $Res Function(_$WaitlistEntryImpl) _then)
      : super(_value, _then);

  /// Create a copy of WaitlistEntry
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
    Object? guestName = null,
    Object? phoneNumber = null,
    Object? partySize = null,
    Object? specialRequests = freezed,
    Object? highchairNeeded = null,
    Object? wheelchairAccessible = null,
    Object? tablePreference = freezed,
    Object? status = null,
    Object? createdAt = null,
    Object? quotedWaitTime = freezed,
    Object? notifiedAt = freezed,
    Object? seatedAt = freezed,
    Object? seatedTableUuid = freezed,
    Object? queuePosition = freezed,
  }) {
    return _then(_$WaitlistEntryImpl(
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      guestName: null == guestName
          ? _value.guestName
          : guestName // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      partySize: null == partySize
          ? _value.partySize
          : partySize // ignore: cast_nullable_to_non_nullable
              as int,
      specialRequests: freezed == specialRequests
          ? _value.specialRequests
          : specialRequests // ignore: cast_nullable_to_non_nullable
              as String?,
      highchairNeeded: null == highchairNeeded
          ? _value.highchairNeeded
          : highchairNeeded // ignore: cast_nullable_to_non_nullable
              as bool,
      wheelchairAccessible: null == wheelchairAccessible
          ? _value.wheelchairAccessible
          : wheelchairAccessible // ignore: cast_nullable_to_non_nullable
              as bool,
      tablePreference: freezed == tablePreference
          ? _value.tablePreference
          : tablePreference // ignore: cast_nullable_to_non_nullable
              as String?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as WaitlistStatus,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      quotedWaitTime: freezed == quotedWaitTime
          ? _value.quotedWaitTime
          : quotedWaitTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      notifiedAt: freezed == notifiedAt
          ? _value.notifiedAt
          : notifiedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      seatedAt: freezed == seatedAt
          ? _value.seatedAt
          : seatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      seatedTableUuid: freezed == seatedTableUuid
          ? _value.seatedTableUuid
          : seatedTableUuid // ignore: cast_nullable_to_non_nullable
              as String?,
      queuePosition: freezed == queuePosition
          ? _value.queuePosition
          : queuePosition // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WaitlistEntryImpl extends _WaitlistEntry {
  const _$WaitlistEntryImpl(
      {required this.uuid,
      required this.guestName,
      required this.phoneNumber,
      required this.partySize,
      this.specialRequests,
      this.highchairNeeded = false,
      this.wheelchairAccessible = false,
      this.tablePreference,
      this.status = WaitlistStatus.waiting,
      required this.createdAt,
      this.quotedWaitTime,
      this.notifiedAt,
      this.seatedAt,
      this.seatedTableUuid,
      this.queuePosition})
      : super._();

  factory _$WaitlistEntryImpl.fromJson(Map<String, dynamic> json) =>
      _$$WaitlistEntryImplFromJson(json);

  @override
  final String uuid;
  @override
  final String guestName;
  @override
  final String phoneNumber;
  @override
  final int partySize;
// Preferences
  @override
  final String? specialRequests;
  @override
  @JsonKey()
  final bool highchairNeeded;
  @override
  @JsonKey()
  final bool wheelchairAccessible;
  @override
  final String? tablePreference;
// indoor, outdoor, bar, etc.
// Status tracking
  @override
  @JsonKey()
  final WaitlistStatus status;
  @override
  final DateTime createdAt;
  @override
  final DateTime? quotedWaitTime;
// When we expect to seat them
  @override
  final DateTime? notifiedAt;
// When SMS was sent
  @override
  final DateTime? seatedAt;
  @override
  final String? seatedTableUuid;
// Queue position
  @override
  final int? queuePosition;

  @override
  String toString() {
    return 'WaitlistEntry(uuid: $uuid, guestName: $guestName, phoneNumber: $phoneNumber, partySize: $partySize, specialRequests: $specialRequests, highchairNeeded: $highchairNeeded, wheelchairAccessible: $wheelchairAccessible, tablePreference: $tablePreference, status: $status, createdAt: $createdAt, quotedWaitTime: $quotedWaitTime, notifiedAt: $notifiedAt, seatedAt: $seatedAt, seatedTableUuid: $seatedTableUuid, queuePosition: $queuePosition)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WaitlistEntryImpl &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.guestName, guestName) ||
                other.guestName == guestName) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.partySize, partySize) ||
                other.partySize == partySize) &&
            (identical(other.specialRequests, specialRequests) ||
                other.specialRequests == specialRequests) &&
            (identical(other.highchairNeeded, highchairNeeded) ||
                other.highchairNeeded == highchairNeeded) &&
            (identical(other.wheelchairAccessible, wheelchairAccessible) ||
                other.wheelchairAccessible == wheelchairAccessible) &&
            (identical(other.tablePreference, tablePreference) ||
                other.tablePreference == tablePreference) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.quotedWaitTime, quotedWaitTime) ||
                other.quotedWaitTime == quotedWaitTime) &&
            (identical(other.notifiedAt, notifiedAt) ||
                other.notifiedAt == notifiedAt) &&
            (identical(other.seatedAt, seatedAt) ||
                other.seatedAt == seatedAt) &&
            (identical(other.seatedTableUuid, seatedTableUuid) ||
                other.seatedTableUuid == seatedTableUuid) &&
            (identical(other.queuePosition, queuePosition) ||
                other.queuePosition == queuePosition));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      uuid,
      guestName,
      phoneNumber,
      partySize,
      specialRequests,
      highchairNeeded,
      wheelchairAccessible,
      tablePreference,
      status,
      createdAt,
      quotedWaitTime,
      notifiedAt,
      seatedAt,
      seatedTableUuid,
      queuePosition);

  /// Create a copy of WaitlistEntry
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WaitlistEntryImplCopyWith<_$WaitlistEntryImpl> get copyWith =>
      __$$WaitlistEntryImplCopyWithImpl<_$WaitlistEntryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WaitlistEntryImplToJson(
      this,
    );
  }
}

abstract class _WaitlistEntry extends WaitlistEntry {
  const factory _WaitlistEntry(
      {required final String uuid,
      required final String guestName,
      required final String phoneNumber,
      required final int partySize,
      final String? specialRequests,
      final bool highchairNeeded,
      final bool wheelchairAccessible,
      final String? tablePreference,
      final WaitlistStatus status,
      required final DateTime createdAt,
      final DateTime? quotedWaitTime,
      final DateTime? notifiedAt,
      final DateTime? seatedAt,
      final String? seatedTableUuid,
      final int? queuePosition}) = _$WaitlistEntryImpl;
  const _WaitlistEntry._() : super._();

  factory _WaitlistEntry.fromJson(Map<String, dynamic> json) =
      _$WaitlistEntryImpl.fromJson;

  @override
  String get uuid;
  @override
  String get guestName;
  @override
  String get phoneNumber;
  @override
  int get partySize; // Preferences
  @override
  String? get specialRequests;
  @override
  bool get highchairNeeded;
  @override
  bool get wheelchairAccessible;
  @override
  String? get tablePreference; // indoor, outdoor, bar, etc.
// Status tracking
  @override
  WaitlistStatus get status;
  @override
  DateTime get createdAt;
  @override
  DateTime? get quotedWaitTime; // When we expect to seat them
  @override
  DateTime? get notifiedAt; // When SMS was sent
  @override
  DateTime? get seatedAt;
  @override
  String? get seatedTableUuid; // Queue position
  @override
  int? get queuePosition;

  /// Create a copy of WaitlistEntry
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WaitlistEntryImplCopyWith<_$WaitlistEntryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

WaitlistSummary _$WaitlistSummaryFromJson(Map<String, dynamic> json) {
  return _WaitlistSummary.fromJson(json);
}

/// @nodoc
mixin _$WaitlistSummary {
  int get totalWaiting => throw _privateConstructorUsedError;
  int get avgWaitMinutes => throw _privateConstructorUsedError;
  int get longestWaitMinutes => throw _privateConstructorUsedError;
  Map<int, int> get partySizeDistribution => throw _privateConstructorUsedError;

  /// Serializes this WaitlistSummary to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WaitlistSummary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WaitlistSummaryCopyWith<WaitlistSummary> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WaitlistSummaryCopyWith<$Res> {
  factory $WaitlistSummaryCopyWith(
          WaitlistSummary value, $Res Function(WaitlistSummary) then) =
      _$WaitlistSummaryCopyWithImpl<$Res, WaitlistSummary>;
  @useResult
  $Res call(
      {int totalWaiting,
      int avgWaitMinutes,
      int longestWaitMinutes,
      Map<int, int> partySizeDistribution});
}

/// @nodoc
class _$WaitlistSummaryCopyWithImpl<$Res, $Val extends WaitlistSummary>
    implements $WaitlistSummaryCopyWith<$Res> {
  _$WaitlistSummaryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WaitlistSummary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalWaiting = null,
    Object? avgWaitMinutes = null,
    Object? longestWaitMinutes = null,
    Object? partySizeDistribution = null,
  }) {
    return _then(_value.copyWith(
      totalWaiting: null == totalWaiting
          ? _value.totalWaiting
          : totalWaiting // ignore: cast_nullable_to_non_nullable
              as int,
      avgWaitMinutes: null == avgWaitMinutes
          ? _value.avgWaitMinutes
          : avgWaitMinutes // ignore: cast_nullable_to_non_nullable
              as int,
      longestWaitMinutes: null == longestWaitMinutes
          ? _value.longestWaitMinutes
          : longestWaitMinutes // ignore: cast_nullable_to_non_nullable
              as int,
      partySizeDistribution: null == partySizeDistribution
          ? _value.partySizeDistribution
          : partySizeDistribution // ignore: cast_nullable_to_non_nullable
              as Map<int, int>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WaitlistSummaryImplCopyWith<$Res>
    implements $WaitlistSummaryCopyWith<$Res> {
  factory _$$WaitlistSummaryImplCopyWith(_$WaitlistSummaryImpl value,
          $Res Function(_$WaitlistSummaryImpl) then) =
      __$$WaitlistSummaryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int totalWaiting,
      int avgWaitMinutes,
      int longestWaitMinutes,
      Map<int, int> partySizeDistribution});
}

/// @nodoc
class __$$WaitlistSummaryImplCopyWithImpl<$Res>
    extends _$WaitlistSummaryCopyWithImpl<$Res, _$WaitlistSummaryImpl>
    implements _$$WaitlistSummaryImplCopyWith<$Res> {
  __$$WaitlistSummaryImplCopyWithImpl(
      _$WaitlistSummaryImpl _value, $Res Function(_$WaitlistSummaryImpl) _then)
      : super(_value, _then);

  /// Create a copy of WaitlistSummary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalWaiting = null,
    Object? avgWaitMinutes = null,
    Object? longestWaitMinutes = null,
    Object? partySizeDistribution = null,
  }) {
    return _then(_$WaitlistSummaryImpl(
      totalWaiting: null == totalWaiting
          ? _value.totalWaiting
          : totalWaiting // ignore: cast_nullable_to_non_nullable
              as int,
      avgWaitMinutes: null == avgWaitMinutes
          ? _value.avgWaitMinutes
          : avgWaitMinutes // ignore: cast_nullable_to_non_nullable
              as int,
      longestWaitMinutes: null == longestWaitMinutes
          ? _value.longestWaitMinutes
          : longestWaitMinutes // ignore: cast_nullable_to_non_nullable
              as int,
      partySizeDistribution: null == partySizeDistribution
          ? _value._partySizeDistribution
          : partySizeDistribution // ignore: cast_nullable_to_non_nullable
              as Map<int, int>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WaitlistSummaryImpl implements _WaitlistSummary {
  const _$WaitlistSummaryImpl(
      {required this.totalWaiting,
      required this.avgWaitMinutes,
      required this.longestWaitMinutes,
      required final Map<int, int> partySizeDistribution})
      : _partySizeDistribution = partySizeDistribution;

  factory _$WaitlistSummaryImpl.fromJson(Map<String, dynamic> json) =>
      _$$WaitlistSummaryImplFromJson(json);

  @override
  final int totalWaiting;
  @override
  final int avgWaitMinutes;
  @override
  final int longestWaitMinutes;
  final Map<int, int> _partySizeDistribution;
  @override
  Map<int, int> get partySizeDistribution {
    if (_partySizeDistribution is EqualUnmodifiableMapView)
      return _partySizeDistribution;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_partySizeDistribution);
  }

  @override
  String toString() {
    return 'WaitlistSummary(totalWaiting: $totalWaiting, avgWaitMinutes: $avgWaitMinutes, longestWaitMinutes: $longestWaitMinutes, partySizeDistribution: $partySizeDistribution)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WaitlistSummaryImpl &&
            (identical(other.totalWaiting, totalWaiting) ||
                other.totalWaiting == totalWaiting) &&
            (identical(other.avgWaitMinutes, avgWaitMinutes) ||
                other.avgWaitMinutes == avgWaitMinutes) &&
            (identical(other.longestWaitMinutes, longestWaitMinutes) ||
                other.longestWaitMinutes == longestWaitMinutes) &&
            const DeepCollectionEquality()
                .equals(other._partySizeDistribution, _partySizeDistribution));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      totalWaiting,
      avgWaitMinutes,
      longestWaitMinutes,
      const DeepCollectionEquality().hash(_partySizeDistribution));

  /// Create a copy of WaitlistSummary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WaitlistSummaryImplCopyWith<_$WaitlistSummaryImpl> get copyWith =>
      __$$WaitlistSummaryImplCopyWithImpl<_$WaitlistSummaryImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WaitlistSummaryImplToJson(
      this,
    );
  }
}

abstract class _WaitlistSummary implements WaitlistSummary {
  const factory _WaitlistSummary(
          {required final int totalWaiting,
          required final int avgWaitMinutes,
          required final int longestWaitMinutes,
          required final Map<int, int> partySizeDistribution}) =
      _$WaitlistSummaryImpl;

  factory _WaitlistSummary.fromJson(Map<String, dynamic> json) =
      _$WaitlistSummaryImpl.fromJson;

  @override
  int get totalWaiting;
  @override
  int get avgWaitMinutes;
  @override
  int get longestWaitMinutes;
  @override
  Map<int, int> get partySizeDistribution;

  /// Create a copy of WaitlistSummary
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WaitlistSummaryImplCopyWith<_$WaitlistSummaryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
