// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'employee.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Employee _$EmployeeFromJson(Map<String, dynamic> json) {
  return _Employee.fromJson(json);
}

/// @nodoc
mixin _$Employee {
  String get uuid => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get pin => throw _privateConstructorUsedError; // Hashed for security
  EmployeeRole get role => throw _privateConstructorUsedError;
  String? get phone => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get avatarUrl =>
      throw _privateConstructorUsedError; // Employment details
  EmploymentStatus get status => throw _privateConstructorUsedError;
  PayType get payType => throw _privateConstructorUsedError;
  double get hourlyRate => throw _privateConstructorUsedError;
  double get salary => throw _privateConstructorUsedError;
  DateTime? get hireDate => throw _privateConstructorUsedError;
  DateTime? get terminationDate =>
      throw _privateConstructorUsedError; // Time & Attendance
  bool get isClockedIn => throw _privateConstructorUsedError;
  DateTime? get lastClockIn => throw _privateConstructorUsedError;
  DateTime? get lastClockOut =>
      throw _privateConstructorUsedError; // Permissions (for RBAC)
  List<String> get permissions =>
      throw _privateConstructorUsedError; // Metadata
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this Employee to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Employee
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EmployeeCopyWith<Employee> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EmployeeCopyWith<$Res> {
  factory $EmployeeCopyWith(Employee value, $Res Function(Employee) then) =
      _$EmployeeCopyWithImpl<$Res, Employee>;
  @useResult
  $Res call(
      {String uuid,
      String name,
      String pin,
      EmployeeRole role,
      String? phone,
      String? email,
      String? avatarUrl,
      EmploymentStatus status,
      PayType payType,
      double hourlyRate,
      double salary,
      DateTime? hireDate,
      DateTime? terminationDate,
      bool isClockedIn,
      DateTime? lastClockIn,
      DateTime? lastClockOut,
      List<String> permissions,
      DateTime? createdAt,
      DateTime? updatedAt});
}

/// @nodoc
class _$EmployeeCopyWithImpl<$Res, $Val extends Employee>
    implements $EmployeeCopyWith<$Res> {
  _$EmployeeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Employee
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
    Object? name = null,
    Object? pin = null,
    Object? role = null,
    Object? phone = freezed,
    Object? email = freezed,
    Object? avatarUrl = freezed,
    Object? status = null,
    Object? payType = null,
    Object? hourlyRate = null,
    Object? salary = null,
    Object? hireDate = freezed,
    Object? terminationDate = freezed,
    Object? isClockedIn = null,
    Object? lastClockIn = freezed,
    Object? lastClockOut = freezed,
    Object? permissions = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
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
      pin: null == pin
          ? _value.pin
          : pin // ignore: cast_nullable_to_non_nullable
              as String,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as EmployeeRole,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      avatarUrl: freezed == avatarUrl
          ? _value.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as EmploymentStatus,
      payType: null == payType
          ? _value.payType
          : payType // ignore: cast_nullable_to_non_nullable
              as PayType,
      hourlyRate: null == hourlyRate
          ? _value.hourlyRate
          : hourlyRate // ignore: cast_nullable_to_non_nullable
              as double,
      salary: null == salary
          ? _value.salary
          : salary // ignore: cast_nullable_to_non_nullable
              as double,
      hireDate: freezed == hireDate
          ? _value.hireDate
          : hireDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      terminationDate: freezed == terminationDate
          ? _value.terminationDate
          : terminationDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isClockedIn: null == isClockedIn
          ? _value.isClockedIn
          : isClockedIn // ignore: cast_nullable_to_non_nullable
              as bool,
      lastClockIn: freezed == lastClockIn
          ? _value.lastClockIn
          : lastClockIn // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      lastClockOut: freezed == lastClockOut
          ? _value.lastClockOut
          : lastClockOut // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      permissions: null == permissions
          ? _value.permissions
          : permissions // ignore: cast_nullable_to_non_nullable
              as List<String>,
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
abstract class _$$EmployeeImplCopyWith<$Res>
    implements $EmployeeCopyWith<$Res> {
  factory _$$EmployeeImplCopyWith(
          _$EmployeeImpl value, $Res Function(_$EmployeeImpl) then) =
      __$$EmployeeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String uuid,
      String name,
      String pin,
      EmployeeRole role,
      String? phone,
      String? email,
      String? avatarUrl,
      EmploymentStatus status,
      PayType payType,
      double hourlyRate,
      double salary,
      DateTime? hireDate,
      DateTime? terminationDate,
      bool isClockedIn,
      DateTime? lastClockIn,
      DateTime? lastClockOut,
      List<String> permissions,
      DateTime? createdAt,
      DateTime? updatedAt});
}

/// @nodoc
class __$$EmployeeImplCopyWithImpl<$Res>
    extends _$EmployeeCopyWithImpl<$Res, _$EmployeeImpl>
    implements _$$EmployeeImplCopyWith<$Res> {
  __$$EmployeeImplCopyWithImpl(
      _$EmployeeImpl _value, $Res Function(_$EmployeeImpl) _then)
      : super(_value, _then);

  /// Create a copy of Employee
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
    Object? name = null,
    Object? pin = null,
    Object? role = null,
    Object? phone = freezed,
    Object? email = freezed,
    Object? avatarUrl = freezed,
    Object? status = null,
    Object? payType = null,
    Object? hourlyRate = null,
    Object? salary = null,
    Object? hireDate = freezed,
    Object? terminationDate = freezed,
    Object? isClockedIn = null,
    Object? lastClockIn = freezed,
    Object? lastClockOut = freezed,
    Object? permissions = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$EmployeeImpl(
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      pin: null == pin
          ? _value.pin
          : pin // ignore: cast_nullable_to_non_nullable
              as String,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as EmployeeRole,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      avatarUrl: freezed == avatarUrl
          ? _value.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as EmploymentStatus,
      payType: null == payType
          ? _value.payType
          : payType // ignore: cast_nullable_to_non_nullable
              as PayType,
      hourlyRate: null == hourlyRate
          ? _value.hourlyRate
          : hourlyRate // ignore: cast_nullable_to_non_nullable
              as double,
      salary: null == salary
          ? _value.salary
          : salary // ignore: cast_nullable_to_non_nullable
              as double,
      hireDate: freezed == hireDate
          ? _value.hireDate
          : hireDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      terminationDate: freezed == terminationDate
          ? _value.terminationDate
          : terminationDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isClockedIn: null == isClockedIn
          ? _value.isClockedIn
          : isClockedIn // ignore: cast_nullable_to_non_nullable
              as bool,
      lastClockIn: freezed == lastClockIn
          ? _value.lastClockIn
          : lastClockIn // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      lastClockOut: freezed == lastClockOut
          ? _value.lastClockOut
          : lastClockOut // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      permissions: null == permissions
          ? _value._permissions
          : permissions // ignore: cast_nullable_to_non_nullable
              as List<String>,
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
class _$EmployeeImpl implements _Employee {
  const _$EmployeeImpl(
      {required this.uuid,
      required this.name,
      required this.pin,
      required this.role,
      this.phone,
      this.email,
      this.avatarUrl,
      this.status = EmploymentStatus.active,
      this.payType = PayType.hourly,
      this.hourlyRate = 0.0,
      this.salary = 0.0,
      this.hireDate,
      this.terminationDate,
      this.isClockedIn = false,
      this.lastClockIn,
      this.lastClockOut,
      final List<String> permissions = const [],
      this.createdAt,
      this.updatedAt})
      : _permissions = permissions;

  factory _$EmployeeImpl.fromJson(Map<String, dynamic> json) =>
      _$$EmployeeImplFromJson(json);

  @override
  final String uuid;
  @override
  final String name;
  @override
  final String pin;
// Hashed for security
  @override
  final EmployeeRole role;
  @override
  final String? phone;
  @override
  final String? email;
  @override
  final String? avatarUrl;
// Employment details
  @override
  @JsonKey()
  final EmploymentStatus status;
  @override
  @JsonKey()
  final PayType payType;
  @override
  @JsonKey()
  final double hourlyRate;
  @override
  @JsonKey()
  final double salary;
  @override
  final DateTime? hireDate;
  @override
  final DateTime? terminationDate;
// Time & Attendance
  @override
  @JsonKey()
  final bool isClockedIn;
  @override
  final DateTime? lastClockIn;
  @override
  final DateTime? lastClockOut;
// Permissions (for RBAC)
  final List<String> _permissions;
// Permissions (for RBAC)
  @override
  @JsonKey()
  List<String> get permissions {
    if (_permissions is EqualUnmodifiableListView) return _permissions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_permissions);
  }

// Metadata
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'Employee(uuid: $uuid, name: $name, pin: $pin, role: $role, phone: $phone, email: $email, avatarUrl: $avatarUrl, status: $status, payType: $payType, hourlyRate: $hourlyRate, salary: $salary, hireDate: $hireDate, terminationDate: $terminationDate, isClockedIn: $isClockedIn, lastClockIn: $lastClockIn, lastClockOut: $lastClockOut, permissions: $permissions, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EmployeeImpl &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.pin, pin) || other.pin == pin) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.avatarUrl, avatarUrl) ||
                other.avatarUrl == avatarUrl) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.payType, payType) || other.payType == payType) &&
            (identical(other.hourlyRate, hourlyRate) ||
                other.hourlyRate == hourlyRate) &&
            (identical(other.salary, salary) || other.salary == salary) &&
            (identical(other.hireDate, hireDate) ||
                other.hireDate == hireDate) &&
            (identical(other.terminationDate, terminationDate) ||
                other.terminationDate == terminationDate) &&
            (identical(other.isClockedIn, isClockedIn) ||
                other.isClockedIn == isClockedIn) &&
            (identical(other.lastClockIn, lastClockIn) ||
                other.lastClockIn == lastClockIn) &&
            (identical(other.lastClockOut, lastClockOut) ||
                other.lastClockOut == lastClockOut) &&
            const DeepCollectionEquality()
                .equals(other._permissions, _permissions) &&
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
        name,
        pin,
        role,
        phone,
        email,
        avatarUrl,
        status,
        payType,
        hourlyRate,
        salary,
        hireDate,
        terminationDate,
        isClockedIn,
        lastClockIn,
        lastClockOut,
        const DeepCollectionEquality().hash(_permissions),
        createdAt,
        updatedAt
      ]);

  /// Create a copy of Employee
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EmployeeImplCopyWith<_$EmployeeImpl> get copyWith =>
      __$$EmployeeImplCopyWithImpl<_$EmployeeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EmployeeImplToJson(
      this,
    );
  }
}

abstract class _Employee implements Employee {
  const factory _Employee(
      {required final String uuid,
      required final String name,
      required final String pin,
      required final EmployeeRole role,
      final String? phone,
      final String? email,
      final String? avatarUrl,
      final EmploymentStatus status,
      final PayType payType,
      final double hourlyRate,
      final double salary,
      final DateTime? hireDate,
      final DateTime? terminationDate,
      final bool isClockedIn,
      final DateTime? lastClockIn,
      final DateTime? lastClockOut,
      final List<String> permissions,
      final DateTime? createdAt,
      final DateTime? updatedAt}) = _$EmployeeImpl;

  factory _Employee.fromJson(Map<String, dynamic> json) =
      _$EmployeeImpl.fromJson;

  @override
  String get uuid;
  @override
  String get name;
  @override
  String get pin; // Hashed for security
  @override
  EmployeeRole get role;
  @override
  String? get phone;
  @override
  String? get email;
  @override
  String? get avatarUrl; // Employment details
  @override
  EmploymentStatus get status;
  @override
  PayType get payType;
  @override
  double get hourlyRate;
  @override
  double get salary;
  @override
  DateTime? get hireDate;
  @override
  DateTime? get terminationDate; // Time & Attendance
  @override
  bool get isClockedIn;
  @override
  DateTime? get lastClockIn;
  @override
  DateTime? get lastClockOut; // Permissions (for RBAC)
  @override
  List<String> get permissions; // Metadata
  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;

  /// Create a copy of Employee
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EmployeeImplCopyWith<_$EmployeeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TimeEntry _$TimeEntryFromJson(Map<String, dynamic> json) {
  return _TimeEntry.fromJson(json);
}

/// @nodoc
mixin _$TimeEntry {
  String get uuid => throw _privateConstructorUsedError;
  String get employeeUuid => throw _privateConstructorUsedError;
  DateTime get clockIn => throw _privateConstructorUsedError;
  DateTime? get clockOut => throw _privateConstructorUsedError;
  DateTime? get breakStart => throw _privateConstructorUsedError;
  DateTime? get breakEnd =>
      throw _privateConstructorUsedError; // Calculated (can be computed or stored)
  double get regularHours => throw _privateConstructorUsedError;
  double get overtimeHours => throw _privateConstructorUsedError;
  double get breakMinutes =>
      throw _privateConstructorUsedError; // Tips for the shift
  double get cashTips => throw _privateConstructorUsedError;
  double get cardTips => throw _privateConstructorUsedError;
  String? get shiftUuid =>
      throw _privateConstructorUsedError; // Link to shift session if applicable
  String? get notes =>
      throw _privateConstructorUsedError; // Auto-approved or needs manager review
  bool get isApproved => throw _privateConstructorUsedError;
  String? get approvedBy => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;

  /// Serializes this TimeEntry to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TimeEntry
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TimeEntryCopyWith<TimeEntry> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TimeEntryCopyWith<$Res> {
  factory $TimeEntryCopyWith(TimeEntry value, $Res Function(TimeEntry) then) =
      _$TimeEntryCopyWithImpl<$Res, TimeEntry>;
  @useResult
  $Res call(
      {String uuid,
      String employeeUuid,
      DateTime clockIn,
      DateTime? clockOut,
      DateTime? breakStart,
      DateTime? breakEnd,
      double regularHours,
      double overtimeHours,
      double breakMinutes,
      double cashTips,
      double cardTips,
      String? shiftUuid,
      String? notes,
      bool isApproved,
      String? approvedBy,
      DateTime? createdAt});
}

/// @nodoc
class _$TimeEntryCopyWithImpl<$Res, $Val extends TimeEntry>
    implements $TimeEntryCopyWith<$Res> {
  _$TimeEntryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TimeEntry
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
    Object? employeeUuid = null,
    Object? clockIn = null,
    Object? clockOut = freezed,
    Object? breakStart = freezed,
    Object? breakEnd = freezed,
    Object? regularHours = null,
    Object? overtimeHours = null,
    Object? breakMinutes = null,
    Object? cashTips = null,
    Object? cardTips = null,
    Object? shiftUuid = freezed,
    Object? notes = freezed,
    Object? isApproved = null,
    Object? approvedBy = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_value.copyWith(
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      employeeUuid: null == employeeUuid
          ? _value.employeeUuid
          : employeeUuid // ignore: cast_nullable_to_non_nullable
              as String,
      clockIn: null == clockIn
          ? _value.clockIn
          : clockIn // ignore: cast_nullable_to_non_nullable
              as DateTime,
      clockOut: freezed == clockOut
          ? _value.clockOut
          : clockOut // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      breakStart: freezed == breakStart
          ? _value.breakStart
          : breakStart // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      breakEnd: freezed == breakEnd
          ? _value.breakEnd
          : breakEnd // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      regularHours: null == regularHours
          ? _value.regularHours
          : regularHours // ignore: cast_nullable_to_non_nullable
              as double,
      overtimeHours: null == overtimeHours
          ? _value.overtimeHours
          : overtimeHours // ignore: cast_nullable_to_non_nullable
              as double,
      breakMinutes: null == breakMinutes
          ? _value.breakMinutes
          : breakMinutes // ignore: cast_nullable_to_non_nullable
              as double,
      cashTips: null == cashTips
          ? _value.cashTips
          : cashTips // ignore: cast_nullable_to_non_nullable
              as double,
      cardTips: null == cardTips
          ? _value.cardTips
          : cardTips // ignore: cast_nullable_to_non_nullable
              as double,
      shiftUuid: freezed == shiftUuid
          ? _value.shiftUuid
          : shiftUuid // ignore: cast_nullable_to_non_nullable
              as String?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      isApproved: null == isApproved
          ? _value.isApproved
          : isApproved // ignore: cast_nullable_to_non_nullable
              as bool,
      approvedBy: freezed == approvedBy
          ? _value.approvedBy
          : approvedBy // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TimeEntryImplCopyWith<$Res>
    implements $TimeEntryCopyWith<$Res> {
  factory _$$TimeEntryImplCopyWith(
          _$TimeEntryImpl value, $Res Function(_$TimeEntryImpl) then) =
      __$$TimeEntryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String uuid,
      String employeeUuid,
      DateTime clockIn,
      DateTime? clockOut,
      DateTime? breakStart,
      DateTime? breakEnd,
      double regularHours,
      double overtimeHours,
      double breakMinutes,
      double cashTips,
      double cardTips,
      String? shiftUuid,
      String? notes,
      bool isApproved,
      String? approvedBy,
      DateTime? createdAt});
}

/// @nodoc
class __$$TimeEntryImplCopyWithImpl<$Res>
    extends _$TimeEntryCopyWithImpl<$Res, _$TimeEntryImpl>
    implements _$$TimeEntryImplCopyWith<$Res> {
  __$$TimeEntryImplCopyWithImpl(
      _$TimeEntryImpl _value, $Res Function(_$TimeEntryImpl) _then)
      : super(_value, _then);

  /// Create a copy of TimeEntry
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
    Object? employeeUuid = null,
    Object? clockIn = null,
    Object? clockOut = freezed,
    Object? breakStart = freezed,
    Object? breakEnd = freezed,
    Object? regularHours = null,
    Object? overtimeHours = null,
    Object? breakMinutes = null,
    Object? cashTips = null,
    Object? cardTips = null,
    Object? shiftUuid = freezed,
    Object? notes = freezed,
    Object? isApproved = null,
    Object? approvedBy = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_$TimeEntryImpl(
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      employeeUuid: null == employeeUuid
          ? _value.employeeUuid
          : employeeUuid // ignore: cast_nullable_to_non_nullable
              as String,
      clockIn: null == clockIn
          ? _value.clockIn
          : clockIn // ignore: cast_nullable_to_non_nullable
              as DateTime,
      clockOut: freezed == clockOut
          ? _value.clockOut
          : clockOut // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      breakStart: freezed == breakStart
          ? _value.breakStart
          : breakStart // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      breakEnd: freezed == breakEnd
          ? _value.breakEnd
          : breakEnd // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      regularHours: null == regularHours
          ? _value.regularHours
          : regularHours // ignore: cast_nullable_to_non_nullable
              as double,
      overtimeHours: null == overtimeHours
          ? _value.overtimeHours
          : overtimeHours // ignore: cast_nullable_to_non_nullable
              as double,
      breakMinutes: null == breakMinutes
          ? _value.breakMinutes
          : breakMinutes // ignore: cast_nullable_to_non_nullable
              as double,
      cashTips: null == cashTips
          ? _value.cashTips
          : cashTips // ignore: cast_nullable_to_non_nullable
              as double,
      cardTips: null == cardTips
          ? _value.cardTips
          : cardTips // ignore: cast_nullable_to_non_nullable
              as double,
      shiftUuid: freezed == shiftUuid
          ? _value.shiftUuid
          : shiftUuid // ignore: cast_nullable_to_non_nullable
              as String?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      isApproved: null == isApproved
          ? _value.isApproved
          : isApproved // ignore: cast_nullable_to_non_nullable
              as bool,
      approvedBy: freezed == approvedBy
          ? _value.approvedBy
          : approvedBy // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TimeEntryImpl extends _TimeEntry {
  const _$TimeEntryImpl(
      {required this.uuid,
      required this.employeeUuid,
      required this.clockIn,
      this.clockOut,
      this.breakStart,
      this.breakEnd,
      this.regularHours = 0.0,
      this.overtimeHours = 0.0,
      this.breakMinutes = 0.0,
      this.cashTips = 0.0,
      this.cardTips = 0.0,
      this.shiftUuid,
      this.notes,
      this.isApproved = false,
      this.approvedBy,
      this.createdAt})
      : super._();

  factory _$TimeEntryImpl.fromJson(Map<String, dynamic> json) =>
      _$$TimeEntryImplFromJson(json);

  @override
  final String uuid;
  @override
  final String employeeUuid;
  @override
  final DateTime clockIn;
  @override
  final DateTime? clockOut;
  @override
  final DateTime? breakStart;
  @override
  final DateTime? breakEnd;
// Calculated (can be computed or stored)
  @override
  @JsonKey()
  final double regularHours;
  @override
  @JsonKey()
  final double overtimeHours;
  @override
  @JsonKey()
  final double breakMinutes;
// Tips for the shift
  @override
  @JsonKey()
  final double cashTips;
  @override
  @JsonKey()
  final double cardTips;
  @override
  final String? shiftUuid;
// Link to shift session if applicable
  @override
  final String? notes;
// Auto-approved or needs manager review
  @override
  @JsonKey()
  final bool isApproved;
  @override
  final String? approvedBy;
  @override
  final DateTime? createdAt;

  @override
  String toString() {
    return 'TimeEntry(uuid: $uuid, employeeUuid: $employeeUuid, clockIn: $clockIn, clockOut: $clockOut, breakStart: $breakStart, breakEnd: $breakEnd, regularHours: $regularHours, overtimeHours: $overtimeHours, breakMinutes: $breakMinutes, cashTips: $cashTips, cardTips: $cardTips, shiftUuid: $shiftUuid, notes: $notes, isApproved: $isApproved, approvedBy: $approvedBy, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TimeEntryImpl &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.employeeUuid, employeeUuid) ||
                other.employeeUuid == employeeUuid) &&
            (identical(other.clockIn, clockIn) || other.clockIn == clockIn) &&
            (identical(other.clockOut, clockOut) ||
                other.clockOut == clockOut) &&
            (identical(other.breakStart, breakStart) ||
                other.breakStart == breakStart) &&
            (identical(other.breakEnd, breakEnd) ||
                other.breakEnd == breakEnd) &&
            (identical(other.regularHours, regularHours) ||
                other.regularHours == regularHours) &&
            (identical(other.overtimeHours, overtimeHours) ||
                other.overtimeHours == overtimeHours) &&
            (identical(other.breakMinutes, breakMinutes) ||
                other.breakMinutes == breakMinutes) &&
            (identical(other.cashTips, cashTips) ||
                other.cashTips == cashTips) &&
            (identical(other.cardTips, cardTips) ||
                other.cardTips == cardTips) &&
            (identical(other.shiftUuid, shiftUuid) ||
                other.shiftUuid == shiftUuid) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.isApproved, isApproved) ||
                other.isApproved == isApproved) &&
            (identical(other.approvedBy, approvedBy) ||
                other.approvedBy == approvedBy) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      uuid,
      employeeUuid,
      clockIn,
      clockOut,
      breakStart,
      breakEnd,
      regularHours,
      overtimeHours,
      breakMinutes,
      cashTips,
      cardTips,
      shiftUuid,
      notes,
      isApproved,
      approvedBy,
      createdAt);

  /// Create a copy of TimeEntry
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TimeEntryImplCopyWith<_$TimeEntryImpl> get copyWith =>
      __$$TimeEntryImplCopyWithImpl<_$TimeEntryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TimeEntryImplToJson(
      this,
    );
  }
}

abstract class _TimeEntry extends TimeEntry {
  const factory _TimeEntry(
      {required final String uuid,
      required final String employeeUuid,
      required final DateTime clockIn,
      final DateTime? clockOut,
      final DateTime? breakStart,
      final DateTime? breakEnd,
      final double regularHours,
      final double overtimeHours,
      final double breakMinutes,
      final double cashTips,
      final double cardTips,
      final String? shiftUuid,
      final String? notes,
      final bool isApproved,
      final String? approvedBy,
      final DateTime? createdAt}) = _$TimeEntryImpl;
  const _TimeEntry._() : super._();

  factory _TimeEntry.fromJson(Map<String, dynamic> json) =
      _$TimeEntryImpl.fromJson;

  @override
  String get uuid;
  @override
  String get employeeUuid;
  @override
  DateTime get clockIn;
  @override
  DateTime? get clockOut;
  @override
  DateTime? get breakStart;
  @override
  DateTime? get breakEnd; // Calculated (can be computed or stored)
  @override
  double get regularHours;
  @override
  double get overtimeHours;
  @override
  double get breakMinutes; // Tips for the shift
  @override
  double get cashTips;
  @override
  double get cardTips;
  @override
  String? get shiftUuid; // Link to shift session if applicable
  @override
  String? get notes; // Auto-approved or needs manager review
  @override
  bool get isApproved;
  @override
  String? get approvedBy;
  @override
  DateTime? get createdAt;

  /// Create a copy of TimeEntry
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TimeEntryImplCopyWith<_$TimeEntryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ScheduledShift _$ScheduledShiftFromJson(Map<String, dynamic> json) {
  return _ScheduledShift.fromJson(json);
}

/// @nodoc
mixin _$ScheduledShift {
  String get uuid => throw _privateConstructorUsedError;
  String get employeeUuid => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;
  DateTime get startTime => throw _privateConstructorUsedError;
  DateTime get endTime => throw _privateConstructorUsedError;
  String? get position =>
      throw _privateConstructorUsedError; // e.g., "Cashier", "Bar", "Floor"
  String? get notes => throw _privateConstructorUsedError;
  bool get isPublished => throw _privateConstructorUsedError;
  bool get isAcknowledged => throw _privateConstructorUsedError; // Swap request
  String? get swapRequestedWith =>
      throw _privateConstructorUsedError; // Another employee's UUID
  bool get isSwapPending => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this ScheduledShift to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ScheduledShift
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ScheduledShiftCopyWith<ScheduledShift> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScheduledShiftCopyWith<$Res> {
  factory $ScheduledShiftCopyWith(
          ScheduledShift value, $Res Function(ScheduledShift) then) =
      _$ScheduledShiftCopyWithImpl<$Res, ScheduledShift>;
  @useResult
  $Res call(
      {String uuid,
      String employeeUuid,
      DateTime date,
      DateTime startTime,
      DateTime endTime,
      String? position,
      String? notes,
      bool isPublished,
      bool isAcknowledged,
      String? swapRequestedWith,
      bool isSwapPending,
      DateTime? createdAt,
      DateTime? updatedAt});
}

/// @nodoc
class _$ScheduledShiftCopyWithImpl<$Res, $Val extends ScheduledShift>
    implements $ScheduledShiftCopyWith<$Res> {
  _$ScheduledShiftCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ScheduledShift
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
    Object? employeeUuid = null,
    Object? date = null,
    Object? startTime = null,
    Object? endTime = null,
    Object? position = freezed,
    Object? notes = freezed,
    Object? isPublished = null,
    Object? isAcknowledged = null,
    Object? swapRequestedWith = freezed,
    Object? isSwapPending = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      employeeUuid: null == employeeUuid
          ? _value.employeeUuid
          : employeeUuid // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      startTime: null == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endTime: null == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      position: freezed == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as String?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      isPublished: null == isPublished
          ? _value.isPublished
          : isPublished // ignore: cast_nullable_to_non_nullable
              as bool,
      isAcknowledged: null == isAcknowledged
          ? _value.isAcknowledged
          : isAcknowledged // ignore: cast_nullable_to_non_nullable
              as bool,
      swapRequestedWith: freezed == swapRequestedWith
          ? _value.swapRequestedWith
          : swapRequestedWith // ignore: cast_nullable_to_non_nullable
              as String?,
      isSwapPending: null == isSwapPending
          ? _value.isSwapPending
          : isSwapPending // ignore: cast_nullable_to_non_nullable
              as bool,
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
abstract class _$$ScheduledShiftImplCopyWith<$Res>
    implements $ScheduledShiftCopyWith<$Res> {
  factory _$$ScheduledShiftImplCopyWith(_$ScheduledShiftImpl value,
          $Res Function(_$ScheduledShiftImpl) then) =
      __$$ScheduledShiftImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String uuid,
      String employeeUuid,
      DateTime date,
      DateTime startTime,
      DateTime endTime,
      String? position,
      String? notes,
      bool isPublished,
      bool isAcknowledged,
      String? swapRequestedWith,
      bool isSwapPending,
      DateTime? createdAt,
      DateTime? updatedAt});
}

/// @nodoc
class __$$ScheduledShiftImplCopyWithImpl<$Res>
    extends _$ScheduledShiftCopyWithImpl<$Res, _$ScheduledShiftImpl>
    implements _$$ScheduledShiftImplCopyWith<$Res> {
  __$$ScheduledShiftImplCopyWithImpl(
      _$ScheduledShiftImpl _value, $Res Function(_$ScheduledShiftImpl) _then)
      : super(_value, _then);

  /// Create a copy of ScheduledShift
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
    Object? employeeUuid = null,
    Object? date = null,
    Object? startTime = null,
    Object? endTime = null,
    Object? position = freezed,
    Object? notes = freezed,
    Object? isPublished = null,
    Object? isAcknowledged = null,
    Object? swapRequestedWith = freezed,
    Object? isSwapPending = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$ScheduledShiftImpl(
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      employeeUuid: null == employeeUuid
          ? _value.employeeUuid
          : employeeUuid // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      startTime: null == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endTime: null == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      position: freezed == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as String?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      isPublished: null == isPublished
          ? _value.isPublished
          : isPublished // ignore: cast_nullable_to_non_nullable
              as bool,
      isAcknowledged: null == isAcknowledged
          ? _value.isAcknowledged
          : isAcknowledged // ignore: cast_nullable_to_non_nullable
              as bool,
      swapRequestedWith: freezed == swapRequestedWith
          ? _value.swapRequestedWith
          : swapRequestedWith // ignore: cast_nullable_to_non_nullable
              as String?,
      isSwapPending: null == isSwapPending
          ? _value.isSwapPending
          : isSwapPending // ignore: cast_nullable_to_non_nullable
              as bool,
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
class _$ScheduledShiftImpl extends _ScheduledShift {
  const _$ScheduledShiftImpl(
      {required this.uuid,
      required this.employeeUuid,
      required this.date,
      required this.startTime,
      required this.endTime,
      this.position,
      this.notes,
      this.isPublished = false,
      this.isAcknowledged = false,
      this.swapRequestedWith,
      this.isSwapPending = false,
      this.createdAt,
      this.updatedAt})
      : super._();

  factory _$ScheduledShiftImpl.fromJson(Map<String, dynamic> json) =>
      _$$ScheduledShiftImplFromJson(json);

  @override
  final String uuid;
  @override
  final String employeeUuid;
  @override
  final DateTime date;
  @override
  final DateTime startTime;
  @override
  final DateTime endTime;
  @override
  final String? position;
// e.g., "Cashier", "Bar", "Floor"
  @override
  final String? notes;
  @override
  @JsonKey()
  final bool isPublished;
  @override
  @JsonKey()
  final bool isAcknowledged;
// Swap request
  @override
  final String? swapRequestedWith;
// Another employee's UUID
  @override
  @JsonKey()
  final bool isSwapPending;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'ScheduledShift(uuid: $uuid, employeeUuid: $employeeUuid, date: $date, startTime: $startTime, endTime: $endTime, position: $position, notes: $notes, isPublished: $isPublished, isAcknowledged: $isAcknowledged, swapRequestedWith: $swapRequestedWith, isSwapPending: $isSwapPending, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ScheduledShiftImpl &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.employeeUuid, employeeUuid) ||
                other.employeeUuid == employeeUuid) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime) &&
            (identical(other.position, position) ||
                other.position == position) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.isPublished, isPublished) ||
                other.isPublished == isPublished) &&
            (identical(other.isAcknowledged, isAcknowledged) ||
                other.isAcknowledged == isAcknowledged) &&
            (identical(other.swapRequestedWith, swapRequestedWith) ||
                other.swapRequestedWith == swapRequestedWith) &&
            (identical(other.isSwapPending, isSwapPending) ||
                other.isSwapPending == isSwapPending) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      uuid,
      employeeUuid,
      date,
      startTime,
      endTime,
      position,
      notes,
      isPublished,
      isAcknowledged,
      swapRequestedWith,
      isSwapPending,
      createdAt,
      updatedAt);

  /// Create a copy of ScheduledShift
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ScheduledShiftImplCopyWith<_$ScheduledShiftImpl> get copyWith =>
      __$$ScheduledShiftImplCopyWithImpl<_$ScheduledShiftImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ScheduledShiftImplToJson(
      this,
    );
  }
}

abstract class _ScheduledShift extends ScheduledShift {
  const factory _ScheduledShift(
      {required final String uuid,
      required final String employeeUuid,
      required final DateTime date,
      required final DateTime startTime,
      required final DateTime endTime,
      final String? position,
      final String? notes,
      final bool isPublished,
      final bool isAcknowledged,
      final String? swapRequestedWith,
      final bool isSwapPending,
      final DateTime? createdAt,
      final DateTime? updatedAt}) = _$ScheduledShiftImpl;
  const _ScheduledShift._() : super._();

  factory _ScheduledShift.fromJson(Map<String, dynamic> json) =
      _$ScheduledShiftImpl.fromJson;

  @override
  String get uuid;
  @override
  String get employeeUuid;
  @override
  DateTime get date;
  @override
  DateTime get startTime;
  @override
  DateTime get endTime;
  @override
  String? get position; // e.g., "Cashier", "Bar", "Floor"
  @override
  String? get notes;
  @override
  bool get isPublished;
  @override
  bool get isAcknowledged; // Swap request
  @override
  String? get swapRequestedWith; // Another employee's UUID
  @override
  bool get isSwapPending;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;

  /// Create a copy of ScheduledShift
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ScheduledShiftImplCopyWith<_$ScheduledShiftImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

LaborSummary _$LaborSummaryFromJson(Map<String, dynamic> json) {
  return _LaborSummary.fromJson(json);
}

/// @nodoc
mixin _$LaborSummary {
  String get employeeUuid => throw _privateConstructorUsedError;
  String get employeeName => throw _privateConstructorUsedError;
  double get totalHours => throw _privateConstructorUsedError;
  double get regularHours => throw _privateConstructorUsedError;
  double get overtimeHours => throw _privateConstructorUsedError;
  double get laborCost => throw _privateConstructorUsedError;
  double get tipTotal => throw _privateConstructorUsedError;
  int get shiftsWorked => throw _privateConstructorUsedError;
  DateTime? get periodStart => throw _privateConstructorUsedError;
  DateTime? get periodEnd => throw _privateConstructorUsedError;

  /// Serializes this LaborSummary to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LaborSummary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LaborSummaryCopyWith<LaborSummary> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LaborSummaryCopyWith<$Res> {
  factory $LaborSummaryCopyWith(
          LaborSummary value, $Res Function(LaborSummary) then) =
      _$LaborSummaryCopyWithImpl<$Res, LaborSummary>;
  @useResult
  $Res call(
      {String employeeUuid,
      String employeeName,
      double totalHours,
      double regularHours,
      double overtimeHours,
      double laborCost,
      double tipTotal,
      int shiftsWorked,
      DateTime? periodStart,
      DateTime? periodEnd});
}

/// @nodoc
class _$LaborSummaryCopyWithImpl<$Res, $Val extends LaborSummary>
    implements $LaborSummaryCopyWith<$Res> {
  _$LaborSummaryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LaborSummary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? employeeUuid = null,
    Object? employeeName = null,
    Object? totalHours = null,
    Object? regularHours = null,
    Object? overtimeHours = null,
    Object? laborCost = null,
    Object? tipTotal = null,
    Object? shiftsWorked = null,
    Object? periodStart = freezed,
    Object? periodEnd = freezed,
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
      laborCost: null == laborCost
          ? _value.laborCost
          : laborCost // ignore: cast_nullable_to_non_nullable
              as double,
      tipTotal: null == tipTotal
          ? _value.tipTotal
          : tipTotal // ignore: cast_nullable_to_non_nullable
              as double,
      shiftsWorked: null == shiftsWorked
          ? _value.shiftsWorked
          : shiftsWorked // ignore: cast_nullable_to_non_nullable
              as int,
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
abstract class _$$LaborSummaryImplCopyWith<$Res>
    implements $LaborSummaryCopyWith<$Res> {
  factory _$$LaborSummaryImplCopyWith(
          _$LaborSummaryImpl value, $Res Function(_$LaborSummaryImpl) then) =
      __$$LaborSummaryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String employeeUuid,
      String employeeName,
      double totalHours,
      double regularHours,
      double overtimeHours,
      double laborCost,
      double tipTotal,
      int shiftsWorked,
      DateTime? periodStart,
      DateTime? periodEnd});
}

/// @nodoc
class __$$LaborSummaryImplCopyWithImpl<$Res>
    extends _$LaborSummaryCopyWithImpl<$Res, _$LaborSummaryImpl>
    implements _$$LaborSummaryImplCopyWith<$Res> {
  __$$LaborSummaryImplCopyWithImpl(
      _$LaborSummaryImpl _value, $Res Function(_$LaborSummaryImpl) _then)
      : super(_value, _then);

  /// Create a copy of LaborSummary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? employeeUuid = null,
    Object? employeeName = null,
    Object? totalHours = null,
    Object? regularHours = null,
    Object? overtimeHours = null,
    Object? laborCost = null,
    Object? tipTotal = null,
    Object? shiftsWorked = null,
    Object? periodStart = freezed,
    Object? periodEnd = freezed,
  }) {
    return _then(_$LaborSummaryImpl(
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
      laborCost: null == laborCost
          ? _value.laborCost
          : laborCost // ignore: cast_nullable_to_non_nullable
              as double,
      tipTotal: null == tipTotal
          ? _value.tipTotal
          : tipTotal // ignore: cast_nullable_to_non_nullable
              as double,
      shiftsWorked: null == shiftsWorked
          ? _value.shiftsWorked
          : shiftsWorked // ignore: cast_nullable_to_non_nullable
              as int,
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
class _$LaborSummaryImpl implements _LaborSummary {
  const _$LaborSummaryImpl(
      {required this.employeeUuid,
      required this.employeeName,
      required this.totalHours,
      required this.regularHours,
      required this.overtimeHours,
      required this.laborCost,
      required this.tipTotal,
      this.shiftsWorked = 0,
      this.periodStart,
      this.periodEnd});

  factory _$LaborSummaryImpl.fromJson(Map<String, dynamic> json) =>
      _$$LaborSummaryImplFromJson(json);

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
  final double laborCost;
  @override
  final double tipTotal;
  @override
  @JsonKey()
  final int shiftsWorked;
  @override
  final DateTime? periodStart;
  @override
  final DateTime? periodEnd;

  @override
  String toString() {
    return 'LaborSummary(employeeUuid: $employeeUuid, employeeName: $employeeName, totalHours: $totalHours, regularHours: $regularHours, overtimeHours: $overtimeHours, laborCost: $laborCost, tipTotal: $tipTotal, shiftsWorked: $shiftsWorked, periodStart: $periodStart, periodEnd: $periodEnd)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LaborSummaryImpl &&
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
            (identical(other.laborCost, laborCost) ||
                other.laborCost == laborCost) &&
            (identical(other.tipTotal, tipTotal) ||
                other.tipTotal == tipTotal) &&
            (identical(other.shiftsWorked, shiftsWorked) ||
                other.shiftsWorked == shiftsWorked) &&
            (identical(other.periodStart, periodStart) ||
                other.periodStart == periodStart) &&
            (identical(other.periodEnd, periodEnd) ||
                other.periodEnd == periodEnd));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      employeeUuid,
      employeeName,
      totalHours,
      regularHours,
      overtimeHours,
      laborCost,
      tipTotal,
      shiftsWorked,
      periodStart,
      periodEnd);

  /// Create a copy of LaborSummary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LaborSummaryImplCopyWith<_$LaborSummaryImpl> get copyWith =>
      __$$LaborSummaryImplCopyWithImpl<_$LaborSummaryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LaborSummaryImplToJson(
      this,
    );
  }
}

abstract class _LaborSummary implements LaborSummary {
  const factory _LaborSummary(
      {required final String employeeUuid,
      required final String employeeName,
      required final double totalHours,
      required final double regularHours,
      required final double overtimeHours,
      required final double laborCost,
      required final double tipTotal,
      final int shiftsWorked,
      final DateTime? periodStart,
      final DateTime? periodEnd}) = _$LaborSummaryImpl;

  factory _LaborSummary.fromJson(Map<String, dynamic> json) =
      _$LaborSummaryImpl.fromJson;

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
  double get laborCost;
  @override
  double get tipTotal;
  @override
  int get shiftsWorked;
  @override
  DateTime? get periodStart;
  @override
  DateTime? get periodEnd;

  /// Create a copy of LaborSummary
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LaborSummaryImplCopyWith<_$LaborSummaryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
