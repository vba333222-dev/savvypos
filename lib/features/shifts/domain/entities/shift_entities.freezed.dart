// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shift_entities.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ShiftSession _$ShiftSessionFromJson(Map<String, dynamic> json) {
  return _ShiftSession.fromJson(json);
}

/// @nodoc
mixin _$ShiftSession {
  String get id => throw _privateConstructorUsedError;
  String get employeeUuid => throw _privateConstructorUsedError;
  String get employeeName => throw _privateConstructorUsedError;
  DateTime get startTime => throw _privateConstructorUsedError;
  DateTime? get endTime => throw _privateConstructorUsedError;
  int get breakMinutes => throw _privateConstructorUsedError;
  double get tipsDeclared => throw _privateConstructorUsedError;
  double get startCash => throw _privateConstructorUsedError;
  double get expectedCash => throw _privateConstructorUsedError;
  double get actualCash => throw _privateConstructorUsedError;
  double get variance => throw _privateConstructorUsedError; // Over/Short
  String? get varianceReason =>
      throw _privateConstructorUsedError; // Audit log for miscounts
  ShiftStatus get status => throw _privateConstructorUsedError;

  /// Serializes this ShiftSession to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ShiftSession
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ShiftSessionCopyWith<ShiftSession> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShiftSessionCopyWith<$Res> {
  factory $ShiftSessionCopyWith(
          ShiftSession value, $Res Function(ShiftSession) then) =
      _$ShiftSessionCopyWithImpl<$Res, ShiftSession>;
  @useResult
  $Res call(
      {String id,
      String employeeUuid,
      String employeeName,
      DateTime startTime,
      DateTime? endTime,
      int breakMinutes,
      double tipsDeclared,
      double startCash,
      double expectedCash,
      double actualCash,
      double variance,
      String? varianceReason,
      ShiftStatus status});
}

/// @nodoc
class _$ShiftSessionCopyWithImpl<$Res, $Val extends ShiftSession>
    implements $ShiftSessionCopyWith<$Res> {
  _$ShiftSessionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ShiftSession
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? employeeUuid = null,
    Object? employeeName = null,
    Object? startTime = null,
    Object? endTime = freezed,
    Object? breakMinutes = null,
    Object? tipsDeclared = null,
    Object? startCash = null,
    Object? expectedCash = null,
    Object? actualCash = null,
    Object? variance = null,
    Object? varianceReason = freezed,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      employeeUuid: null == employeeUuid
          ? _value.employeeUuid
          : employeeUuid // ignore: cast_nullable_to_non_nullable
              as String,
      employeeName: null == employeeName
          ? _value.employeeName
          : employeeName // ignore: cast_nullable_to_non_nullable
              as String,
      startTime: null == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endTime: freezed == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      breakMinutes: null == breakMinutes
          ? _value.breakMinutes
          : breakMinutes // ignore: cast_nullable_to_non_nullable
              as int,
      tipsDeclared: null == tipsDeclared
          ? _value.tipsDeclared
          : tipsDeclared // ignore: cast_nullable_to_non_nullable
              as double,
      startCash: null == startCash
          ? _value.startCash
          : startCash // ignore: cast_nullable_to_non_nullable
              as double,
      expectedCash: null == expectedCash
          ? _value.expectedCash
          : expectedCash // ignore: cast_nullable_to_non_nullable
              as double,
      actualCash: null == actualCash
          ? _value.actualCash
          : actualCash // ignore: cast_nullable_to_non_nullable
              as double,
      variance: null == variance
          ? _value.variance
          : variance // ignore: cast_nullable_to_non_nullable
              as double,
      varianceReason: freezed == varianceReason
          ? _value.varianceReason
          : varianceReason // ignore: cast_nullable_to_non_nullable
              as String?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ShiftStatus,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ShiftSessionImplCopyWith<$Res>
    implements $ShiftSessionCopyWith<$Res> {
  factory _$$ShiftSessionImplCopyWith(
          _$ShiftSessionImpl value, $Res Function(_$ShiftSessionImpl) then) =
      __$$ShiftSessionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String employeeUuid,
      String employeeName,
      DateTime startTime,
      DateTime? endTime,
      int breakMinutes,
      double tipsDeclared,
      double startCash,
      double expectedCash,
      double actualCash,
      double variance,
      String? varianceReason,
      ShiftStatus status});
}

/// @nodoc
class __$$ShiftSessionImplCopyWithImpl<$Res>
    extends _$ShiftSessionCopyWithImpl<$Res, _$ShiftSessionImpl>
    implements _$$ShiftSessionImplCopyWith<$Res> {
  __$$ShiftSessionImplCopyWithImpl(
      _$ShiftSessionImpl _value, $Res Function(_$ShiftSessionImpl) _then)
      : super(_value, _then);

  /// Create a copy of ShiftSession
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? employeeUuid = null,
    Object? employeeName = null,
    Object? startTime = null,
    Object? endTime = freezed,
    Object? breakMinutes = null,
    Object? tipsDeclared = null,
    Object? startCash = null,
    Object? expectedCash = null,
    Object? actualCash = null,
    Object? variance = null,
    Object? varianceReason = freezed,
    Object? status = null,
  }) {
    return _then(_$ShiftSessionImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      employeeUuid: null == employeeUuid
          ? _value.employeeUuid
          : employeeUuid // ignore: cast_nullable_to_non_nullable
              as String,
      employeeName: null == employeeName
          ? _value.employeeName
          : employeeName // ignore: cast_nullable_to_non_nullable
              as String,
      startTime: null == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endTime: freezed == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      breakMinutes: null == breakMinutes
          ? _value.breakMinutes
          : breakMinutes // ignore: cast_nullable_to_non_nullable
              as int,
      tipsDeclared: null == tipsDeclared
          ? _value.tipsDeclared
          : tipsDeclared // ignore: cast_nullable_to_non_nullable
              as double,
      startCash: null == startCash
          ? _value.startCash
          : startCash // ignore: cast_nullable_to_non_nullable
              as double,
      expectedCash: null == expectedCash
          ? _value.expectedCash
          : expectedCash // ignore: cast_nullable_to_non_nullable
              as double,
      actualCash: null == actualCash
          ? _value.actualCash
          : actualCash // ignore: cast_nullable_to_non_nullable
              as double,
      variance: null == variance
          ? _value.variance
          : variance // ignore: cast_nullable_to_non_nullable
              as double,
      varianceReason: freezed == varianceReason
          ? _value.varianceReason
          : varianceReason // ignore: cast_nullable_to_non_nullable
              as String?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ShiftStatus,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ShiftSessionImpl implements _ShiftSession {
  const _$ShiftSessionImpl(
      {required this.id,
      required this.employeeUuid,
      required this.employeeName,
      required this.startTime,
      this.endTime,
      this.breakMinutes = 0,
      this.tipsDeclared = 0.0,
      this.startCash = 0.0,
      this.expectedCash = 0.0,
      this.actualCash = 0.0,
      this.variance = 0.0,
      this.varianceReason,
      this.status = ShiftStatus.active});

  factory _$ShiftSessionImpl.fromJson(Map<String, dynamic> json) =>
      _$$ShiftSessionImplFromJson(json);

  @override
  final String id;
  @override
  final String employeeUuid;
  @override
  final String employeeName;
  @override
  final DateTime startTime;
  @override
  final DateTime? endTime;
  @override
  @JsonKey()
  final int breakMinutes;
  @override
  @JsonKey()
  final double tipsDeclared;
  @override
  @JsonKey()
  final double startCash;
  @override
  @JsonKey()
  final double expectedCash;
  @override
  @JsonKey()
  final double actualCash;
  @override
  @JsonKey()
  final double variance;
// Over/Short
  @override
  final String? varianceReason;
// Audit log for miscounts
  @override
  @JsonKey()
  final ShiftStatus status;

  @override
  String toString() {
    return 'ShiftSession(id: $id, employeeUuid: $employeeUuid, employeeName: $employeeName, startTime: $startTime, endTime: $endTime, breakMinutes: $breakMinutes, tipsDeclared: $tipsDeclared, startCash: $startCash, expectedCash: $expectedCash, actualCash: $actualCash, variance: $variance, varianceReason: $varianceReason, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShiftSessionImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.employeeUuid, employeeUuid) ||
                other.employeeUuid == employeeUuid) &&
            (identical(other.employeeName, employeeName) ||
                other.employeeName == employeeName) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime) &&
            (identical(other.breakMinutes, breakMinutes) ||
                other.breakMinutes == breakMinutes) &&
            (identical(other.tipsDeclared, tipsDeclared) ||
                other.tipsDeclared == tipsDeclared) &&
            (identical(other.startCash, startCash) ||
                other.startCash == startCash) &&
            (identical(other.expectedCash, expectedCash) ||
                other.expectedCash == expectedCash) &&
            (identical(other.actualCash, actualCash) ||
                other.actualCash == actualCash) &&
            (identical(other.variance, variance) ||
                other.variance == variance) &&
            (identical(other.varianceReason, varianceReason) ||
                other.varianceReason == varianceReason) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      employeeUuid,
      employeeName,
      startTime,
      endTime,
      breakMinutes,
      tipsDeclared,
      startCash,
      expectedCash,
      actualCash,
      variance,
      varianceReason,
      status);

  /// Create a copy of ShiftSession
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ShiftSessionImplCopyWith<_$ShiftSessionImpl> get copyWith =>
      __$$ShiftSessionImplCopyWithImpl<_$ShiftSessionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ShiftSessionImplToJson(
      this,
    );
  }
}

abstract class _ShiftSession implements ShiftSession {
  const factory _ShiftSession(
      {required final String id,
      required final String employeeUuid,
      required final String employeeName,
      required final DateTime startTime,
      final DateTime? endTime,
      final int breakMinutes,
      final double tipsDeclared,
      final double startCash,
      final double expectedCash,
      final double actualCash,
      final double variance,
      final String? varianceReason,
      final ShiftStatus status}) = _$ShiftSessionImpl;

  factory _ShiftSession.fromJson(Map<String, dynamic> json) =
      _$ShiftSessionImpl.fromJson;

  @override
  String get id;
  @override
  String get employeeUuid;
  @override
  String get employeeName;
  @override
  DateTime get startTime;
  @override
  DateTime? get endTime;
  @override
  int get breakMinutes;
  @override
  double get tipsDeclared;
  @override
  double get startCash;
  @override
  double get expectedCash;
  @override
  double get actualCash;
  @override
  double get variance; // Over/Short
  @override
  String? get varianceReason; // Audit log for miscounts
  @override
  ShiftStatus get status;

  /// Create a copy of ShiftSession
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ShiftSessionImplCopyWith<_$ShiftSessionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

EmployeeShiftSummary _$EmployeeShiftSummaryFromJson(Map<String, dynamic> json) {
  return _EmployeeShiftSummary.fromJson(json);
}

/// @nodoc
mixin _$EmployeeShiftSummary {
  String get employeeUuid => throw _privateConstructorUsedError;
  String get employeeName => throw _privateConstructorUsedError;
  double get totalHours => throw _privateConstructorUsedError;
  double get regularHours => throw _privateConstructorUsedError;
  double get overtimeHours => throw _privateConstructorUsedError;
  double get totalTips => throw _privateConstructorUsedError;
  int get shiftCount => throw _privateConstructorUsedError;

  /// Serializes this EmployeeShiftSummary to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of EmployeeShiftSummary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EmployeeShiftSummaryCopyWith<EmployeeShiftSummary> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EmployeeShiftSummaryCopyWith<$Res> {
  factory $EmployeeShiftSummaryCopyWith(EmployeeShiftSummary value,
          $Res Function(EmployeeShiftSummary) then) =
      _$EmployeeShiftSummaryCopyWithImpl<$Res, EmployeeShiftSummary>;
  @useResult
  $Res call(
      {String employeeUuid,
      String employeeName,
      double totalHours,
      double regularHours,
      double overtimeHours,
      double totalTips,
      int shiftCount});
}

/// @nodoc
class _$EmployeeShiftSummaryCopyWithImpl<$Res,
        $Val extends EmployeeShiftSummary>
    implements $EmployeeShiftSummaryCopyWith<$Res> {
  _$EmployeeShiftSummaryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EmployeeShiftSummary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? employeeUuid = null,
    Object? employeeName = null,
    Object? totalHours = null,
    Object? regularHours = null,
    Object? overtimeHours = null,
    Object? totalTips = null,
    Object? shiftCount = null,
  }) {
    return _then(_value.copyWith(
      employeeUuid: null == employeeUuid
          ? _value.employeeUuid
          : employeeUuid // ignore: cast_nullable_to_non_nullable
              as String,
      employeeName: null == employeeName
          ? _value.employeeName
          : employeeName // ignore: cast_nullable_to_non_nullable
              as String,
      totalHours: null == totalHours
          ? _value.totalHours
          : totalHours // ignore: cast_nullable_to_non_nullable
              as double,
      regularHours: null == regularHours
          ? _value.regularHours
          : regularHours // ignore: cast_nullable_to_non_nullable
              as double,
      overtimeHours: null == overtimeHours
          ? _value.overtimeHours
          : overtimeHours // ignore: cast_nullable_to_non_nullable
              as double,
      totalTips: null == totalTips
          ? _value.totalTips
          : totalTips // ignore: cast_nullable_to_non_nullable
              as double,
      shiftCount: null == shiftCount
          ? _value.shiftCount
          : shiftCount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EmployeeShiftSummaryImplCopyWith<$Res>
    implements $EmployeeShiftSummaryCopyWith<$Res> {
  factory _$$EmployeeShiftSummaryImplCopyWith(_$EmployeeShiftSummaryImpl value,
          $Res Function(_$EmployeeShiftSummaryImpl) then) =
      __$$EmployeeShiftSummaryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String employeeUuid,
      String employeeName,
      double totalHours,
      double regularHours,
      double overtimeHours,
      double totalTips,
      int shiftCount});
}

/// @nodoc
class __$$EmployeeShiftSummaryImplCopyWithImpl<$Res>
    extends _$EmployeeShiftSummaryCopyWithImpl<$Res, _$EmployeeShiftSummaryImpl>
    implements _$$EmployeeShiftSummaryImplCopyWith<$Res> {
  __$$EmployeeShiftSummaryImplCopyWithImpl(_$EmployeeShiftSummaryImpl _value,
      $Res Function(_$EmployeeShiftSummaryImpl) _then)
      : super(_value, _then);

  /// Create a copy of EmployeeShiftSummary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? employeeUuid = null,
    Object? employeeName = null,
    Object? totalHours = null,
    Object? regularHours = null,
    Object? overtimeHours = null,
    Object? totalTips = null,
    Object? shiftCount = null,
  }) {
    return _then(_$EmployeeShiftSummaryImpl(
      employeeUuid: null == employeeUuid
          ? _value.employeeUuid
          : employeeUuid // ignore: cast_nullable_to_non_nullable
              as String,
      employeeName: null == employeeName
          ? _value.employeeName
          : employeeName // ignore: cast_nullable_to_non_nullable
              as String,
      totalHours: null == totalHours
          ? _value.totalHours
          : totalHours // ignore: cast_nullable_to_non_nullable
              as double,
      regularHours: null == regularHours
          ? _value.regularHours
          : regularHours // ignore: cast_nullable_to_non_nullable
              as double,
      overtimeHours: null == overtimeHours
          ? _value.overtimeHours
          : overtimeHours // ignore: cast_nullable_to_non_nullable
              as double,
      totalTips: null == totalTips
          ? _value.totalTips
          : totalTips // ignore: cast_nullable_to_non_nullable
              as double,
      shiftCount: null == shiftCount
          ? _value.shiftCount
          : shiftCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EmployeeShiftSummaryImpl implements _EmployeeShiftSummary {
  const _$EmployeeShiftSummaryImpl(
      {required this.employeeUuid,
      required this.employeeName,
      required this.totalHours,
      required this.regularHours,
      required this.overtimeHours,
      required this.totalTips,
      required this.shiftCount});

  factory _$EmployeeShiftSummaryImpl.fromJson(Map<String, dynamic> json) =>
      _$$EmployeeShiftSummaryImplFromJson(json);

  @override
  final String employeeUuid;
  @override
  final String employeeName;
  @override
  final double totalHours;
  @override
  final double regularHours;
  @override
  final double overtimeHours;
  @override
  final double totalTips;
  @override
  final int shiftCount;

  @override
  String toString() {
    return 'EmployeeShiftSummary(employeeUuid: $employeeUuid, employeeName: $employeeName, totalHours: $totalHours, regularHours: $regularHours, overtimeHours: $overtimeHours, totalTips: $totalTips, shiftCount: $shiftCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EmployeeShiftSummaryImpl &&
            (identical(other.employeeUuid, employeeUuid) ||
                other.employeeUuid == employeeUuid) &&
            (identical(other.employeeName, employeeName) ||
                other.employeeName == employeeName) &&
            (identical(other.totalHours, totalHours) ||
                other.totalHours == totalHours) &&
            (identical(other.regularHours, regularHours) ||
                other.regularHours == regularHours) &&
            (identical(other.overtimeHours, overtimeHours) ||
                other.overtimeHours == overtimeHours) &&
            (identical(other.totalTips, totalTips) ||
                other.totalTips == totalTips) &&
            (identical(other.shiftCount, shiftCount) ||
                other.shiftCount == shiftCount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, employeeUuid, employeeName,
      totalHours, regularHours, overtimeHours, totalTips, shiftCount);

  /// Create a copy of EmployeeShiftSummary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EmployeeShiftSummaryImplCopyWith<_$EmployeeShiftSummaryImpl>
      get copyWith =>
          __$$EmployeeShiftSummaryImplCopyWithImpl<_$EmployeeShiftSummaryImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EmployeeShiftSummaryImplToJson(
      this,
    );
  }
}

abstract class _EmployeeShiftSummary implements EmployeeShiftSummary {
  const factory _EmployeeShiftSummary(
      {required final String employeeUuid,
      required final String employeeName,
      required final double totalHours,
      required final double regularHours,
      required final double overtimeHours,
      required final double totalTips,
      required final int shiftCount}) = _$EmployeeShiftSummaryImpl;

  factory _EmployeeShiftSummary.fromJson(Map<String, dynamic> json) =
      _$EmployeeShiftSummaryImpl.fromJson;

  @override
  String get employeeUuid;
  @override
  String get employeeName;
  @override
  double get totalHours;
  @override
  double get regularHours;
  @override
  double get overtimeHours;
  @override
  double get totalTips;
  @override
  int get shiftCount;

  /// Create a copy of EmployeeShiftSummary
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EmployeeShiftSummaryImplCopyWith<_$EmployeeShiftSummaryImpl>
      get copyWith => throw _privateConstructorUsedError;
}
