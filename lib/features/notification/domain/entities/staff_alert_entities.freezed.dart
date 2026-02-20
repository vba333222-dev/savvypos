// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'staff_alert_entities.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

StaffAlert _$StaffAlertFromJson(Map<String, dynamic> json) {
  return _StaffAlert.fromJson(json);
}

/// @nodoc
mixin _$StaffAlert {
  String get uuid => throw _privateConstructorUsedError;
  AlertType get type => throw _privateConstructorUsedError;
  AlertPriority get priority => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  AlertStatus get status => throw _privateConstructorUsedError; // Targeting
  List<String> get targetRoles =>
      throw _privateConstructorUsedError; // server, manager, kitchen, etc.
  List<String> get targetUserUuids =>
      throw _privateConstructorUsedError; // Specific users
  bool get broadcastToAll => throw _privateConstructorUsedError; // All staff
// Context
  String? get relatedOrderUuid => throw _privateConstructorUsedError;
  String? get relatedTableUuid => throw _privateConstructorUsedError;
  String? get relatedCustomerUuid =>
      throw _privateConstructorUsedError; // Action
  String? get actionLabel =>
      throw _privateConstructorUsedError; // "View Order", "Go to Table", etc.
  String? get actionRoute =>
      throw _privateConstructorUsedError; // Navigation route
// Timing
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime? get expiresAt => throw _privateConstructorUsedError;
  DateTime? get acknowledgedAt => throw _privateConstructorUsedError;
  String? get acknowledgedByUuid => throw _privateConstructorUsedError;
  DateTime? get resolvedAt => throw _privateConstructorUsedError;
  String? get resolvedByUuid =>
      throw _privateConstructorUsedError; // Sound/Vibration
  bool get playSound => throw _privateConstructorUsedError;
  bool get vibrate => throw _privateConstructorUsedError;

  /// Serializes this StaffAlert to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of StaffAlert
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StaffAlertCopyWith<StaffAlert> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StaffAlertCopyWith<$Res> {
  factory $StaffAlertCopyWith(
          StaffAlert value, $Res Function(StaffAlert) then) =
      _$StaffAlertCopyWithImpl<$Res, StaffAlert>;
  @useResult
  $Res call(
      {String uuid,
      AlertType type,
      AlertPriority priority,
      String title,
      String message,
      AlertStatus status,
      List<String> targetRoles,
      List<String> targetUserUuids,
      bool broadcastToAll,
      String? relatedOrderUuid,
      String? relatedTableUuid,
      String? relatedCustomerUuid,
      String? actionLabel,
      String? actionRoute,
      DateTime createdAt,
      DateTime? expiresAt,
      DateTime? acknowledgedAt,
      String? acknowledgedByUuid,
      DateTime? resolvedAt,
      String? resolvedByUuid,
      bool playSound,
      bool vibrate});
}

/// @nodoc
class _$StaffAlertCopyWithImpl<$Res, $Val extends StaffAlert>
    implements $StaffAlertCopyWith<$Res> {
  _$StaffAlertCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StaffAlert
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
    Object? type = null,
    Object? priority = null,
    Object? title = null,
    Object? message = null,
    Object? status = null,
    Object? targetRoles = null,
    Object? targetUserUuids = null,
    Object? broadcastToAll = null,
    Object? relatedOrderUuid = freezed,
    Object? relatedTableUuid = freezed,
    Object? relatedCustomerUuid = freezed,
    Object? actionLabel = freezed,
    Object? actionRoute = freezed,
    Object? createdAt = null,
    Object? expiresAt = freezed,
    Object? acknowledgedAt = freezed,
    Object? acknowledgedByUuid = freezed,
    Object? resolvedAt = freezed,
    Object? resolvedByUuid = freezed,
    Object? playSound = null,
    Object? vibrate = null,
  }) {
    return _then(_value.copyWith(
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as AlertType,
      priority: null == priority
          ? _value.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as AlertPriority,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as AlertStatus,
      targetRoles: null == targetRoles
          ? _value.targetRoles
          : targetRoles // ignore: cast_nullable_to_non_nullable
              as List<String>,
      targetUserUuids: null == targetUserUuids
          ? _value.targetUserUuids
          : targetUserUuids // ignore: cast_nullable_to_non_nullable
              as List<String>,
      broadcastToAll: null == broadcastToAll
          ? _value.broadcastToAll
          : broadcastToAll // ignore: cast_nullable_to_non_nullable
              as bool,
      relatedOrderUuid: freezed == relatedOrderUuid
          ? _value.relatedOrderUuid
          : relatedOrderUuid // ignore: cast_nullable_to_non_nullable
              as String?,
      relatedTableUuid: freezed == relatedTableUuid
          ? _value.relatedTableUuid
          : relatedTableUuid // ignore: cast_nullable_to_non_nullable
              as String?,
      relatedCustomerUuid: freezed == relatedCustomerUuid
          ? _value.relatedCustomerUuid
          : relatedCustomerUuid // ignore: cast_nullable_to_non_nullable
              as String?,
      actionLabel: freezed == actionLabel
          ? _value.actionLabel
          : actionLabel // ignore: cast_nullable_to_non_nullable
              as String?,
      actionRoute: freezed == actionRoute
          ? _value.actionRoute
          : actionRoute // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      expiresAt: freezed == expiresAt
          ? _value.expiresAt
          : expiresAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      acknowledgedAt: freezed == acknowledgedAt
          ? _value.acknowledgedAt
          : acknowledgedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      acknowledgedByUuid: freezed == acknowledgedByUuid
          ? _value.acknowledgedByUuid
          : acknowledgedByUuid // ignore: cast_nullable_to_non_nullable
              as String?,
      resolvedAt: freezed == resolvedAt
          ? _value.resolvedAt
          : resolvedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      resolvedByUuid: freezed == resolvedByUuid
          ? _value.resolvedByUuid
          : resolvedByUuid // ignore: cast_nullable_to_non_nullable
              as String?,
      playSound: null == playSound
          ? _value.playSound
          : playSound // ignore: cast_nullable_to_non_nullable
              as bool,
      vibrate: null == vibrate
          ? _value.vibrate
          : vibrate // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StaffAlertImplCopyWith<$Res>
    implements $StaffAlertCopyWith<$Res> {
  factory _$$StaffAlertImplCopyWith(
          _$StaffAlertImpl value, $Res Function(_$StaffAlertImpl) then) =
      __$$StaffAlertImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String uuid,
      AlertType type,
      AlertPriority priority,
      String title,
      String message,
      AlertStatus status,
      List<String> targetRoles,
      List<String> targetUserUuids,
      bool broadcastToAll,
      String? relatedOrderUuid,
      String? relatedTableUuid,
      String? relatedCustomerUuid,
      String? actionLabel,
      String? actionRoute,
      DateTime createdAt,
      DateTime? expiresAt,
      DateTime? acknowledgedAt,
      String? acknowledgedByUuid,
      DateTime? resolvedAt,
      String? resolvedByUuid,
      bool playSound,
      bool vibrate});
}

/// @nodoc
class __$$StaffAlertImplCopyWithImpl<$Res>
    extends _$StaffAlertCopyWithImpl<$Res, _$StaffAlertImpl>
    implements _$$StaffAlertImplCopyWith<$Res> {
  __$$StaffAlertImplCopyWithImpl(
      _$StaffAlertImpl _value, $Res Function(_$StaffAlertImpl) _then)
      : super(_value, _then);

  /// Create a copy of StaffAlert
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
    Object? type = null,
    Object? priority = null,
    Object? title = null,
    Object? message = null,
    Object? status = null,
    Object? targetRoles = null,
    Object? targetUserUuids = null,
    Object? broadcastToAll = null,
    Object? relatedOrderUuid = freezed,
    Object? relatedTableUuid = freezed,
    Object? relatedCustomerUuid = freezed,
    Object? actionLabel = freezed,
    Object? actionRoute = freezed,
    Object? createdAt = null,
    Object? expiresAt = freezed,
    Object? acknowledgedAt = freezed,
    Object? acknowledgedByUuid = freezed,
    Object? resolvedAt = freezed,
    Object? resolvedByUuid = freezed,
    Object? playSound = null,
    Object? vibrate = null,
  }) {
    return _then(_$StaffAlertImpl(
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as AlertType,
      priority: null == priority
          ? _value.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as AlertPriority,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as AlertStatus,
      targetRoles: null == targetRoles
          ? _value._targetRoles
          : targetRoles // ignore: cast_nullable_to_non_nullable
              as List<String>,
      targetUserUuids: null == targetUserUuids
          ? _value._targetUserUuids
          : targetUserUuids // ignore: cast_nullable_to_non_nullable
              as List<String>,
      broadcastToAll: null == broadcastToAll
          ? _value.broadcastToAll
          : broadcastToAll // ignore: cast_nullable_to_non_nullable
              as bool,
      relatedOrderUuid: freezed == relatedOrderUuid
          ? _value.relatedOrderUuid
          : relatedOrderUuid // ignore: cast_nullable_to_non_nullable
              as String?,
      relatedTableUuid: freezed == relatedTableUuid
          ? _value.relatedTableUuid
          : relatedTableUuid // ignore: cast_nullable_to_non_nullable
              as String?,
      relatedCustomerUuid: freezed == relatedCustomerUuid
          ? _value.relatedCustomerUuid
          : relatedCustomerUuid // ignore: cast_nullable_to_non_nullable
              as String?,
      actionLabel: freezed == actionLabel
          ? _value.actionLabel
          : actionLabel // ignore: cast_nullable_to_non_nullable
              as String?,
      actionRoute: freezed == actionRoute
          ? _value.actionRoute
          : actionRoute // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      expiresAt: freezed == expiresAt
          ? _value.expiresAt
          : expiresAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      acknowledgedAt: freezed == acknowledgedAt
          ? _value.acknowledgedAt
          : acknowledgedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      acknowledgedByUuid: freezed == acknowledgedByUuid
          ? _value.acknowledgedByUuid
          : acknowledgedByUuid // ignore: cast_nullable_to_non_nullable
              as String?,
      resolvedAt: freezed == resolvedAt
          ? _value.resolvedAt
          : resolvedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      resolvedByUuid: freezed == resolvedByUuid
          ? _value.resolvedByUuid
          : resolvedByUuid // ignore: cast_nullable_to_non_nullable
              as String?,
      playSound: null == playSound
          ? _value.playSound
          : playSound // ignore: cast_nullable_to_non_nullable
              as bool,
      vibrate: null == vibrate
          ? _value.vibrate
          : vibrate // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StaffAlertImpl extends _StaffAlert {
  const _$StaffAlertImpl(
      {required this.uuid,
      required this.type,
      required this.priority,
      required this.title,
      required this.message,
      this.status = AlertStatus.active,
      final List<String> targetRoles = const [],
      final List<String> targetUserUuids = const [],
      this.broadcastToAll = true,
      this.relatedOrderUuid,
      this.relatedTableUuid,
      this.relatedCustomerUuid,
      this.actionLabel,
      this.actionRoute,
      required this.createdAt,
      this.expiresAt,
      this.acknowledgedAt,
      this.acknowledgedByUuid,
      this.resolvedAt,
      this.resolvedByUuid,
      this.playSound = true,
      this.vibrate = true})
      : _targetRoles = targetRoles,
        _targetUserUuids = targetUserUuids,
        super._();

  factory _$StaffAlertImpl.fromJson(Map<String, dynamic> json) =>
      _$$StaffAlertImplFromJson(json);

  @override
  final String uuid;
  @override
  final AlertType type;
  @override
  final AlertPriority priority;
  @override
  final String title;
  @override
  final String message;
  @override
  @JsonKey()
  final AlertStatus status;
// Targeting
  final List<String> _targetRoles;
// Targeting
  @override
  @JsonKey()
  List<String> get targetRoles {
    if (_targetRoles is EqualUnmodifiableListView) return _targetRoles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_targetRoles);
  }

// server, manager, kitchen, etc.
  final List<String> _targetUserUuids;
// server, manager, kitchen, etc.
  @override
  @JsonKey()
  List<String> get targetUserUuids {
    if (_targetUserUuids is EqualUnmodifiableListView) return _targetUserUuids;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_targetUserUuids);
  }

// Specific users
  @override
  @JsonKey()
  final bool broadcastToAll;
// All staff
// Context
  @override
  final String? relatedOrderUuid;
  @override
  final String? relatedTableUuid;
  @override
  final String? relatedCustomerUuid;
// Action
  @override
  final String? actionLabel;
// "View Order", "Go to Table", etc.
  @override
  final String? actionRoute;
// Navigation route
// Timing
  @override
  final DateTime createdAt;
  @override
  final DateTime? expiresAt;
  @override
  final DateTime? acknowledgedAt;
  @override
  final String? acknowledgedByUuid;
  @override
  final DateTime? resolvedAt;
  @override
  final String? resolvedByUuid;
// Sound/Vibration
  @override
  @JsonKey()
  final bool playSound;
  @override
  @JsonKey()
  final bool vibrate;

  @override
  String toString() {
    return 'StaffAlert(uuid: $uuid, type: $type, priority: $priority, title: $title, message: $message, status: $status, targetRoles: $targetRoles, targetUserUuids: $targetUserUuids, broadcastToAll: $broadcastToAll, relatedOrderUuid: $relatedOrderUuid, relatedTableUuid: $relatedTableUuid, relatedCustomerUuid: $relatedCustomerUuid, actionLabel: $actionLabel, actionRoute: $actionRoute, createdAt: $createdAt, expiresAt: $expiresAt, acknowledgedAt: $acknowledgedAt, acknowledgedByUuid: $acknowledgedByUuid, resolvedAt: $resolvedAt, resolvedByUuid: $resolvedByUuid, playSound: $playSound, vibrate: $vibrate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StaffAlertImpl &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.priority, priority) ||
                other.priority == priority) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality()
                .equals(other._targetRoles, _targetRoles) &&
            const DeepCollectionEquality()
                .equals(other._targetUserUuids, _targetUserUuids) &&
            (identical(other.broadcastToAll, broadcastToAll) ||
                other.broadcastToAll == broadcastToAll) &&
            (identical(other.relatedOrderUuid, relatedOrderUuid) ||
                other.relatedOrderUuid == relatedOrderUuid) &&
            (identical(other.relatedTableUuid, relatedTableUuid) ||
                other.relatedTableUuid == relatedTableUuid) &&
            (identical(other.relatedCustomerUuid, relatedCustomerUuid) ||
                other.relatedCustomerUuid == relatedCustomerUuid) &&
            (identical(other.actionLabel, actionLabel) ||
                other.actionLabel == actionLabel) &&
            (identical(other.actionRoute, actionRoute) ||
                other.actionRoute == actionRoute) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.expiresAt, expiresAt) ||
                other.expiresAt == expiresAt) &&
            (identical(other.acknowledgedAt, acknowledgedAt) ||
                other.acknowledgedAt == acknowledgedAt) &&
            (identical(other.acknowledgedByUuid, acknowledgedByUuid) ||
                other.acknowledgedByUuid == acknowledgedByUuid) &&
            (identical(other.resolvedAt, resolvedAt) ||
                other.resolvedAt == resolvedAt) &&
            (identical(other.resolvedByUuid, resolvedByUuid) ||
                other.resolvedByUuid == resolvedByUuid) &&
            (identical(other.playSound, playSound) ||
                other.playSound == playSound) &&
            (identical(other.vibrate, vibrate) || other.vibrate == vibrate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        uuid,
        type,
        priority,
        title,
        message,
        status,
        const DeepCollectionEquality().hash(_targetRoles),
        const DeepCollectionEquality().hash(_targetUserUuids),
        broadcastToAll,
        relatedOrderUuid,
        relatedTableUuid,
        relatedCustomerUuid,
        actionLabel,
        actionRoute,
        createdAt,
        expiresAt,
        acknowledgedAt,
        acknowledgedByUuid,
        resolvedAt,
        resolvedByUuid,
        playSound,
        vibrate
      ]);

  /// Create a copy of StaffAlert
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StaffAlertImplCopyWith<_$StaffAlertImpl> get copyWith =>
      __$$StaffAlertImplCopyWithImpl<_$StaffAlertImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StaffAlertImplToJson(
      this,
    );
  }
}

abstract class _StaffAlert extends StaffAlert {
  const factory _StaffAlert(
      {required final String uuid,
      required final AlertType type,
      required final AlertPriority priority,
      required final String title,
      required final String message,
      final AlertStatus status,
      final List<String> targetRoles,
      final List<String> targetUserUuids,
      final bool broadcastToAll,
      final String? relatedOrderUuid,
      final String? relatedTableUuid,
      final String? relatedCustomerUuid,
      final String? actionLabel,
      final String? actionRoute,
      required final DateTime createdAt,
      final DateTime? expiresAt,
      final DateTime? acknowledgedAt,
      final String? acknowledgedByUuid,
      final DateTime? resolvedAt,
      final String? resolvedByUuid,
      final bool playSound,
      final bool vibrate}) = _$StaffAlertImpl;
  const _StaffAlert._() : super._();

  factory _StaffAlert.fromJson(Map<String, dynamic> json) =
      _$StaffAlertImpl.fromJson;

  @override
  String get uuid;
  @override
  AlertType get type;
  @override
  AlertPriority get priority;
  @override
  String get title;
  @override
  String get message;
  @override
  AlertStatus get status; // Targeting
  @override
  List<String> get targetRoles; // server, manager, kitchen, etc.
  @override
  List<String> get targetUserUuids; // Specific users
  @override
  bool get broadcastToAll; // All staff
// Context
  @override
  String? get relatedOrderUuid;
  @override
  String? get relatedTableUuid;
  @override
  String? get relatedCustomerUuid; // Action
  @override
  String? get actionLabel; // "View Order", "Go to Table", etc.
  @override
  String? get actionRoute; // Navigation route
// Timing
  @override
  DateTime get createdAt;
  @override
  DateTime? get expiresAt;
  @override
  DateTime? get acknowledgedAt;
  @override
  String? get acknowledgedByUuid;
  @override
  DateTime? get resolvedAt;
  @override
  String? get resolvedByUuid; // Sound/Vibration
  @override
  bool get playSound;
  @override
  bool get vibrate;

  /// Create a copy of StaffAlert
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StaffAlertImplCopyWith<_$StaffAlertImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AlertTemplate _$AlertTemplateFromJson(Map<String, dynamic> json) {
  return _AlertTemplate.fromJson(json);
}

/// @nodoc
mixin _$AlertTemplate {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  AlertType get type => throw _privateConstructorUsedError;
  AlertPriority get priority => throw _privateConstructorUsedError;
  String get messageTemplate => throw _privateConstructorUsedError;

  /// Serializes this AlertTemplate to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AlertTemplate
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AlertTemplateCopyWith<AlertTemplate> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AlertTemplateCopyWith<$Res> {
  factory $AlertTemplateCopyWith(
          AlertTemplate value, $Res Function(AlertTemplate) then) =
      _$AlertTemplateCopyWithImpl<$Res, AlertTemplate>;
  @useResult
  $Res call(
      {String id,
      String name,
      AlertType type,
      AlertPriority priority,
      String messageTemplate});
}

/// @nodoc
class _$AlertTemplateCopyWithImpl<$Res, $Val extends AlertTemplate>
    implements $AlertTemplateCopyWith<$Res> {
  _$AlertTemplateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AlertTemplate
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? type = null,
    Object? priority = null,
    Object? messageTemplate = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as AlertType,
      priority: null == priority
          ? _value.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as AlertPriority,
      messageTemplate: null == messageTemplate
          ? _value.messageTemplate
          : messageTemplate // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AlertTemplateImplCopyWith<$Res>
    implements $AlertTemplateCopyWith<$Res> {
  factory _$$AlertTemplateImplCopyWith(
          _$AlertTemplateImpl value, $Res Function(_$AlertTemplateImpl) then) =
      __$$AlertTemplateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      AlertType type,
      AlertPriority priority,
      String messageTemplate});
}

/// @nodoc
class __$$AlertTemplateImplCopyWithImpl<$Res>
    extends _$AlertTemplateCopyWithImpl<$Res, _$AlertTemplateImpl>
    implements _$$AlertTemplateImplCopyWith<$Res> {
  __$$AlertTemplateImplCopyWithImpl(
      _$AlertTemplateImpl _value, $Res Function(_$AlertTemplateImpl) _then)
      : super(_value, _then);

  /// Create a copy of AlertTemplate
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? type = null,
    Object? priority = null,
    Object? messageTemplate = null,
  }) {
    return _then(_$AlertTemplateImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as AlertType,
      priority: null == priority
          ? _value.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as AlertPriority,
      messageTemplate: null == messageTemplate
          ? _value.messageTemplate
          : messageTemplate // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AlertTemplateImpl implements _AlertTemplate {
  const _$AlertTemplateImpl(
      {required this.id,
      required this.name,
      required this.type,
      required this.priority,
      required this.messageTemplate});

  factory _$AlertTemplateImpl.fromJson(Map<String, dynamic> json) =>
      _$$AlertTemplateImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final AlertType type;
  @override
  final AlertPriority priority;
  @override
  final String messageTemplate;

  @override
  String toString() {
    return 'AlertTemplate(id: $id, name: $name, type: $type, priority: $priority, messageTemplate: $messageTemplate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AlertTemplateImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.priority, priority) ||
                other.priority == priority) &&
            (identical(other.messageTemplate, messageTemplate) ||
                other.messageTemplate == messageTemplate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, type, priority, messageTemplate);

  /// Create a copy of AlertTemplate
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AlertTemplateImplCopyWith<_$AlertTemplateImpl> get copyWith =>
      __$$AlertTemplateImplCopyWithImpl<_$AlertTemplateImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AlertTemplateImplToJson(
      this,
    );
  }
}

abstract class _AlertTemplate implements AlertTemplate {
  const factory _AlertTemplate(
      {required final String id,
      required final String name,
      required final AlertType type,
      required final AlertPriority priority,
      required final String messageTemplate}) = _$AlertTemplateImpl;

  factory _AlertTemplate.fromJson(Map<String, dynamic> json) =
      _$AlertTemplateImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  AlertType get type;
  @override
  AlertPriority get priority;
  @override
  String get messageTemplate;

  /// Create a copy of AlertTemplate
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AlertTemplateImplCopyWith<_$AlertTemplateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
