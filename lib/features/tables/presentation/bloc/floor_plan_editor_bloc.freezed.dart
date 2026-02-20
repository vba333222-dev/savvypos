// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'floor_plan_editor_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$FloorPlanEditorEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String? zoneId) zoneSelected,
    required TResult Function(Zone zone) zoneSaved,
    required TResult Function(String zoneId) zoneDeleted,
    required TResult Function(SavvyTable table) tableSaved,
    required TResult Function(String tableId) tableDeleted,
    required TResult Function(List<Zone> zones) zonesUpdated,
    required TResult Function(List<SavvyTable> tables) tablesUpdated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String? zoneId)? zoneSelected,
    TResult? Function(Zone zone)? zoneSaved,
    TResult? Function(String zoneId)? zoneDeleted,
    TResult? Function(SavvyTable table)? tableSaved,
    TResult? Function(String tableId)? tableDeleted,
    TResult? Function(List<Zone> zones)? zonesUpdated,
    TResult? Function(List<SavvyTable> tables)? tablesUpdated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String? zoneId)? zoneSelected,
    TResult Function(Zone zone)? zoneSaved,
    TResult Function(String zoneId)? zoneDeleted,
    TResult Function(SavvyTable table)? tableSaved,
    TResult Function(String tableId)? tableDeleted,
    TResult Function(List<Zone> zones)? zonesUpdated,
    TResult Function(List<SavvyTable> tables)? tablesUpdated,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_ZoneSelected value) zoneSelected,
    required TResult Function(_ZoneSaved value) zoneSaved,
    required TResult Function(_ZoneDeleted value) zoneDeleted,
    required TResult Function(_TableSaved value) tableSaved,
    required TResult Function(_TableDeleted value) tableDeleted,
    required TResult Function(_ZonesUpdated value) zonesUpdated,
    required TResult Function(_TablesUpdated value) tablesUpdated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_ZoneSelected value)? zoneSelected,
    TResult? Function(_ZoneSaved value)? zoneSaved,
    TResult? Function(_ZoneDeleted value)? zoneDeleted,
    TResult? Function(_TableSaved value)? tableSaved,
    TResult? Function(_TableDeleted value)? tableDeleted,
    TResult? Function(_ZonesUpdated value)? zonesUpdated,
    TResult? Function(_TablesUpdated value)? tablesUpdated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_ZoneSelected value)? zoneSelected,
    TResult Function(_ZoneSaved value)? zoneSaved,
    TResult Function(_ZoneDeleted value)? zoneDeleted,
    TResult Function(_TableSaved value)? tableSaved,
    TResult Function(_TableDeleted value)? tableDeleted,
    TResult Function(_ZonesUpdated value)? zonesUpdated,
    TResult Function(_TablesUpdated value)? tablesUpdated,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FloorPlanEditorEventCopyWith<$Res> {
  factory $FloorPlanEditorEventCopyWith(FloorPlanEditorEvent value,
          $Res Function(FloorPlanEditorEvent) then) =
      _$FloorPlanEditorEventCopyWithImpl<$Res, FloorPlanEditorEvent>;
}

/// @nodoc
class _$FloorPlanEditorEventCopyWithImpl<$Res,
        $Val extends FloorPlanEditorEvent>
    implements $FloorPlanEditorEventCopyWith<$Res> {
  _$FloorPlanEditorEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FloorPlanEditorEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$StartedImplCopyWith<$Res> {
  factory _$$StartedImplCopyWith(
          _$StartedImpl value, $Res Function(_$StartedImpl) then) =
      __$$StartedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$StartedImplCopyWithImpl<$Res>
    extends _$FloorPlanEditorEventCopyWithImpl<$Res, _$StartedImpl>
    implements _$$StartedImplCopyWith<$Res> {
  __$$StartedImplCopyWithImpl(
      _$StartedImpl _value, $Res Function(_$StartedImpl) _then)
      : super(_value, _then);

  /// Create a copy of FloorPlanEditorEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$StartedImpl implements _Started {
  const _$StartedImpl();

  @override
  String toString() {
    return 'FloorPlanEditorEvent.started()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$StartedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String? zoneId) zoneSelected,
    required TResult Function(Zone zone) zoneSaved,
    required TResult Function(String zoneId) zoneDeleted,
    required TResult Function(SavvyTable table) tableSaved,
    required TResult Function(String tableId) tableDeleted,
    required TResult Function(List<Zone> zones) zonesUpdated,
    required TResult Function(List<SavvyTable> tables) tablesUpdated,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String? zoneId)? zoneSelected,
    TResult? Function(Zone zone)? zoneSaved,
    TResult? Function(String zoneId)? zoneDeleted,
    TResult? Function(SavvyTable table)? tableSaved,
    TResult? Function(String tableId)? tableDeleted,
    TResult? Function(List<Zone> zones)? zonesUpdated,
    TResult? Function(List<SavvyTable> tables)? tablesUpdated,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String? zoneId)? zoneSelected,
    TResult Function(Zone zone)? zoneSaved,
    TResult Function(String zoneId)? zoneDeleted,
    TResult Function(SavvyTable table)? tableSaved,
    TResult Function(String tableId)? tableDeleted,
    TResult Function(List<Zone> zones)? zonesUpdated,
    TResult Function(List<SavvyTable> tables)? tablesUpdated,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_ZoneSelected value) zoneSelected,
    required TResult Function(_ZoneSaved value) zoneSaved,
    required TResult Function(_ZoneDeleted value) zoneDeleted,
    required TResult Function(_TableSaved value) tableSaved,
    required TResult Function(_TableDeleted value) tableDeleted,
    required TResult Function(_ZonesUpdated value) zonesUpdated,
    required TResult Function(_TablesUpdated value) tablesUpdated,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_ZoneSelected value)? zoneSelected,
    TResult? Function(_ZoneSaved value)? zoneSaved,
    TResult? Function(_ZoneDeleted value)? zoneDeleted,
    TResult? Function(_TableSaved value)? tableSaved,
    TResult? Function(_TableDeleted value)? tableDeleted,
    TResult? Function(_ZonesUpdated value)? zonesUpdated,
    TResult? Function(_TablesUpdated value)? tablesUpdated,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_ZoneSelected value)? zoneSelected,
    TResult Function(_ZoneSaved value)? zoneSaved,
    TResult Function(_ZoneDeleted value)? zoneDeleted,
    TResult Function(_TableSaved value)? tableSaved,
    TResult Function(_TableDeleted value)? tableDeleted,
    TResult Function(_ZonesUpdated value)? zonesUpdated,
    TResult Function(_TablesUpdated value)? tablesUpdated,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements FloorPlanEditorEvent {
  const factory _Started() = _$StartedImpl;
}

/// @nodoc
abstract class _$$ZoneSelectedImplCopyWith<$Res> {
  factory _$$ZoneSelectedImplCopyWith(
          _$ZoneSelectedImpl value, $Res Function(_$ZoneSelectedImpl) then) =
      __$$ZoneSelectedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String? zoneId});
}

/// @nodoc
class __$$ZoneSelectedImplCopyWithImpl<$Res>
    extends _$FloorPlanEditorEventCopyWithImpl<$Res, _$ZoneSelectedImpl>
    implements _$$ZoneSelectedImplCopyWith<$Res> {
  __$$ZoneSelectedImplCopyWithImpl(
      _$ZoneSelectedImpl _value, $Res Function(_$ZoneSelectedImpl) _then)
      : super(_value, _then);

  /// Create a copy of FloorPlanEditorEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? zoneId = freezed,
  }) {
    return _then(_$ZoneSelectedImpl(
      freezed == zoneId
          ? _value.zoneId
          : zoneId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$ZoneSelectedImpl implements _ZoneSelected {
  const _$ZoneSelectedImpl(this.zoneId);

  @override
  final String? zoneId;

  @override
  String toString() {
    return 'FloorPlanEditorEvent.zoneSelected(zoneId: $zoneId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ZoneSelectedImpl &&
            (identical(other.zoneId, zoneId) || other.zoneId == zoneId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, zoneId);

  /// Create a copy of FloorPlanEditorEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ZoneSelectedImplCopyWith<_$ZoneSelectedImpl> get copyWith =>
      __$$ZoneSelectedImplCopyWithImpl<_$ZoneSelectedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String? zoneId) zoneSelected,
    required TResult Function(Zone zone) zoneSaved,
    required TResult Function(String zoneId) zoneDeleted,
    required TResult Function(SavvyTable table) tableSaved,
    required TResult Function(String tableId) tableDeleted,
    required TResult Function(List<Zone> zones) zonesUpdated,
    required TResult Function(List<SavvyTable> tables) tablesUpdated,
  }) {
    return zoneSelected(zoneId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String? zoneId)? zoneSelected,
    TResult? Function(Zone zone)? zoneSaved,
    TResult? Function(String zoneId)? zoneDeleted,
    TResult? Function(SavvyTable table)? tableSaved,
    TResult? Function(String tableId)? tableDeleted,
    TResult? Function(List<Zone> zones)? zonesUpdated,
    TResult? Function(List<SavvyTable> tables)? tablesUpdated,
  }) {
    return zoneSelected?.call(zoneId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String? zoneId)? zoneSelected,
    TResult Function(Zone zone)? zoneSaved,
    TResult Function(String zoneId)? zoneDeleted,
    TResult Function(SavvyTable table)? tableSaved,
    TResult Function(String tableId)? tableDeleted,
    TResult Function(List<Zone> zones)? zonesUpdated,
    TResult Function(List<SavvyTable> tables)? tablesUpdated,
    required TResult orElse(),
  }) {
    if (zoneSelected != null) {
      return zoneSelected(zoneId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_ZoneSelected value) zoneSelected,
    required TResult Function(_ZoneSaved value) zoneSaved,
    required TResult Function(_ZoneDeleted value) zoneDeleted,
    required TResult Function(_TableSaved value) tableSaved,
    required TResult Function(_TableDeleted value) tableDeleted,
    required TResult Function(_ZonesUpdated value) zonesUpdated,
    required TResult Function(_TablesUpdated value) tablesUpdated,
  }) {
    return zoneSelected(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_ZoneSelected value)? zoneSelected,
    TResult? Function(_ZoneSaved value)? zoneSaved,
    TResult? Function(_ZoneDeleted value)? zoneDeleted,
    TResult? Function(_TableSaved value)? tableSaved,
    TResult? Function(_TableDeleted value)? tableDeleted,
    TResult? Function(_ZonesUpdated value)? zonesUpdated,
    TResult? Function(_TablesUpdated value)? tablesUpdated,
  }) {
    return zoneSelected?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_ZoneSelected value)? zoneSelected,
    TResult Function(_ZoneSaved value)? zoneSaved,
    TResult Function(_ZoneDeleted value)? zoneDeleted,
    TResult Function(_TableSaved value)? tableSaved,
    TResult Function(_TableDeleted value)? tableDeleted,
    TResult Function(_ZonesUpdated value)? zonesUpdated,
    TResult Function(_TablesUpdated value)? tablesUpdated,
    required TResult orElse(),
  }) {
    if (zoneSelected != null) {
      return zoneSelected(this);
    }
    return orElse();
  }
}

abstract class _ZoneSelected implements FloorPlanEditorEvent {
  const factory _ZoneSelected(final String? zoneId) = _$ZoneSelectedImpl;

  String? get zoneId;

  /// Create a copy of FloorPlanEditorEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ZoneSelectedImplCopyWith<_$ZoneSelectedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ZoneSavedImplCopyWith<$Res> {
  factory _$$ZoneSavedImplCopyWith(
          _$ZoneSavedImpl value, $Res Function(_$ZoneSavedImpl) then) =
      __$$ZoneSavedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Zone zone});
}

/// @nodoc
class __$$ZoneSavedImplCopyWithImpl<$Res>
    extends _$FloorPlanEditorEventCopyWithImpl<$Res, _$ZoneSavedImpl>
    implements _$$ZoneSavedImplCopyWith<$Res> {
  __$$ZoneSavedImplCopyWithImpl(
      _$ZoneSavedImpl _value, $Res Function(_$ZoneSavedImpl) _then)
      : super(_value, _then);

  /// Create a copy of FloorPlanEditorEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? zone = null,
  }) {
    return _then(_$ZoneSavedImpl(
      null == zone
          ? _value.zone
          : zone // ignore: cast_nullable_to_non_nullable
              as Zone,
    ));
  }
}

/// @nodoc

class _$ZoneSavedImpl implements _ZoneSaved {
  const _$ZoneSavedImpl(this.zone);

  @override
  final Zone zone;

  @override
  String toString() {
    return 'FloorPlanEditorEvent.zoneSaved(zone: $zone)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ZoneSavedImpl &&
            (identical(other.zone, zone) || other.zone == zone));
  }

  @override
  int get hashCode => Object.hash(runtimeType, zone);

  /// Create a copy of FloorPlanEditorEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ZoneSavedImplCopyWith<_$ZoneSavedImpl> get copyWith =>
      __$$ZoneSavedImplCopyWithImpl<_$ZoneSavedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String? zoneId) zoneSelected,
    required TResult Function(Zone zone) zoneSaved,
    required TResult Function(String zoneId) zoneDeleted,
    required TResult Function(SavvyTable table) tableSaved,
    required TResult Function(String tableId) tableDeleted,
    required TResult Function(List<Zone> zones) zonesUpdated,
    required TResult Function(List<SavvyTable> tables) tablesUpdated,
  }) {
    return zoneSaved(zone);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String? zoneId)? zoneSelected,
    TResult? Function(Zone zone)? zoneSaved,
    TResult? Function(String zoneId)? zoneDeleted,
    TResult? Function(SavvyTable table)? tableSaved,
    TResult? Function(String tableId)? tableDeleted,
    TResult? Function(List<Zone> zones)? zonesUpdated,
    TResult? Function(List<SavvyTable> tables)? tablesUpdated,
  }) {
    return zoneSaved?.call(zone);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String? zoneId)? zoneSelected,
    TResult Function(Zone zone)? zoneSaved,
    TResult Function(String zoneId)? zoneDeleted,
    TResult Function(SavvyTable table)? tableSaved,
    TResult Function(String tableId)? tableDeleted,
    TResult Function(List<Zone> zones)? zonesUpdated,
    TResult Function(List<SavvyTable> tables)? tablesUpdated,
    required TResult orElse(),
  }) {
    if (zoneSaved != null) {
      return zoneSaved(zone);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_ZoneSelected value) zoneSelected,
    required TResult Function(_ZoneSaved value) zoneSaved,
    required TResult Function(_ZoneDeleted value) zoneDeleted,
    required TResult Function(_TableSaved value) tableSaved,
    required TResult Function(_TableDeleted value) tableDeleted,
    required TResult Function(_ZonesUpdated value) zonesUpdated,
    required TResult Function(_TablesUpdated value) tablesUpdated,
  }) {
    return zoneSaved(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_ZoneSelected value)? zoneSelected,
    TResult? Function(_ZoneSaved value)? zoneSaved,
    TResult? Function(_ZoneDeleted value)? zoneDeleted,
    TResult? Function(_TableSaved value)? tableSaved,
    TResult? Function(_TableDeleted value)? tableDeleted,
    TResult? Function(_ZonesUpdated value)? zonesUpdated,
    TResult? Function(_TablesUpdated value)? tablesUpdated,
  }) {
    return zoneSaved?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_ZoneSelected value)? zoneSelected,
    TResult Function(_ZoneSaved value)? zoneSaved,
    TResult Function(_ZoneDeleted value)? zoneDeleted,
    TResult Function(_TableSaved value)? tableSaved,
    TResult Function(_TableDeleted value)? tableDeleted,
    TResult Function(_ZonesUpdated value)? zonesUpdated,
    TResult Function(_TablesUpdated value)? tablesUpdated,
    required TResult orElse(),
  }) {
    if (zoneSaved != null) {
      return zoneSaved(this);
    }
    return orElse();
  }
}

abstract class _ZoneSaved implements FloorPlanEditorEvent {
  const factory _ZoneSaved(final Zone zone) = _$ZoneSavedImpl;

  Zone get zone;

  /// Create a copy of FloorPlanEditorEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ZoneSavedImplCopyWith<_$ZoneSavedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ZoneDeletedImplCopyWith<$Res> {
  factory _$$ZoneDeletedImplCopyWith(
          _$ZoneDeletedImpl value, $Res Function(_$ZoneDeletedImpl) then) =
      __$$ZoneDeletedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String zoneId});
}

/// @nodoc
class __$$ZoneDeletedImplCopyWithImpl<$Res>
    extends _$FloorPlanEditorEventCopyWithImpl<$Res, _$ZoneDeletedImpl>
    implements _$$ZoneDeletedImplCopyWith<$Res> {
  __$$ZoneDeletedImplCopyWithImpl(
      _$ZoneDeletedImpl _value, $Res Function(_$ZoneDeletedImpl) _then)
      : super(_value, _then);

  /// Create a copy of FloorPlanEditorEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? zoneId = null,
  }) {
    return _then(_$ZoneDeletedImpl(
      null == zoneId
          ? _value.zoneId
          : zoneId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ZoneDeletedImpl implements _ZoneDeleted {
  const _$ZoneDeletedImpl(this.zoneId);

  @override
  final String zoneId;

  @override
  String toString() {
    return 'FloorPlanEditorEvent.zoneDeleted(zoneId: $zoneId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ZoneDeletedImpl &&
            (identical(other.zoneId, zoneId) || other.zoneId == zoneId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, zoneId);

  /// Create a copy of FloorPlanEditorEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ZoneDeletedImplCopyWith<_$ZoneDeletedImpl> get copyWith =>
      __$$ZoneDeletedImplCopyWithImpl<_$ZoneDeletedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String? zoneId) zoneSelected,
    required TResult Function(Zone zone) zoneSaved,
    required TResult Function(String zoneId) zoneDeleted,
    required TResult Function(SavvyTable table) tableSaved,
    required TResult Function(String tableId) tableDeleted,
    required TResult Function(List<Zone> zones) zonesUpdated,
    required TResult Function(List<SavvyTable> tables) tablesUpdated,
  }) {
    return zoneDeleted(zoneId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String? zoneId)? zoneSelected,
    TResult? Function(Zone zone)? zoneSaved,
    TResult? Function(String zoneId)? zoneDeleted,
    TResult? Function(SavvyTable table)? tableSaved,
    TResult? Function(String tableId)? tableDeleted,
    TResult? Function(List<Zone> zones)? zonesUpdated,
    TResult? Function(List<SavvyTable> tables)? tablesUpdated,
  }) {
    return zoneDeleted?.call(zoneId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String? zoneId)? zoneSelected,
    TResult Function(Zone zone)? zoneSaved,
    TResult Function(String zoneId)? zoneDeleted,
    TResult Function(SavvyTable table)? tableSaved,
    TResult Function(String tableId)? tableDeleted,
    TResult Function(List<Zone> zones)? zonesUpdated,
    TResult Function(List<SavvyTable> tables)? tablesUpdated,
    required TResult orElse(),
  }) {
    if (zoneDeleted != null) {
      return zoneDeleted(zoneId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_ZoneSelected value) zoneSelected,
    required TResult Function(_ZoneSaved value) zoneSaved,
    required TResult Function(_ZoneDeleted value) zoneDeleted,
    required TResult Function(_TableSaved value) tableSaved,
    required TResult Function(_TableDeleted value) tableDeleted,
    required TResult Function(_ZonesUpdated value) zonesUpdated,
    required TResult Function(_TablesUpdated value) tablesUpdated,
  }) {
    return zoneDeleted(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_ZoneSelected value)? zoneSelected,
    TResult? Function(_ZoneSaved value)? zoneSaved,
    TResult? Function(_ZoneDeleted value)? zoneDeleted,
    TResult? Function(_TableSaved value)? tableSaved,
    TResult? Function(_TableDeleted value)? tableDeleted,
    TResult? Function(_ZonesUpdated value)? zonesUpdated,
    TResult? Function(_TablesUpdated value)? tablesUpdated,
  }) {
    return zoneDeleted?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_ZoneSelected value)? zoneSelected,
    TResult Function(_ZoneSaved value)? zoneSaved,
    TResult Function(_ZoneDeleted value)? zoneDeleted,
    TResult Function(_TableSaved value)? tableSaved,
    TResult Function(_TableDeleted value)? tableDeleted,
    TResult Function(_ZonesUpdated value)? zonesUpdated,
    TResult Function(_TablesUpdated value)? tablesUpdated,
    required TResult orElse(),
  }) {
    if (zoneDeleted != null) {
      return zoneDeleted(this);
    }
    return orElse();
  }
}

abstract class _ZoneDeleted implements FloorPlanEditorEvent {
  const factory _ZoneDeleted(final String zoneId) = _$ZoneDeletedImpl;

  String get zoneId;

  /// Create a copy of FloorPlanEditorEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ZoneDeletedImplCopyWith<_$ZoneDeletedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TableSavedImplCopyWith<$Res> {
  factory _$$TableSavedImplCopyWith(
          _$TableSavedImpl value, $Res Function(_$TableSavedImpl) then) =
      __$$TableSavedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({SavvyTable table});
}

/// @nodoc
class __$$TableSavedImplCopyWithImpl<$Res>
    extends _$FloorPlanEditorEventCopyWithImpl<$Res, _$TableSavedImpl>
    implements _$$TableSavedImplCopyWith<$Res> {
  __$$TableSavedImplCopyWithImpl(
      _$TableSavedImpl _value, $Res Function(_$TableSavedImpl) _then)
      : super(_value, _then);

  /// Create a copy of FloorPlanEditorEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? table = null,
  }) {
    return _then(_$TableSavedImpl(
      null == table
          ? _value.table
          : table // ignore: cast_nullable_to_non_nullable
              as SavvyTable,
    ));
  }
}

/// @nodoc

class _$TableSavedImpl implements _TableSaved {
  const _$TableSavedImpl(this.table);

  @override
  final SavvyTable table;

  @override
  String toString() {
    return 'FloorPlanEditorEvent.tableSaved(table: $table)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TableSavedImpl &&
            (identical(other.table, table) || other.table == table));
  }

  @override
  int get hashCode => Object.hash(runtimeType, table);

  /// Create a copy of FloorPlanEditorEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TableSavedImplCopyWith<_$TableSavedImpl> get copyWith =>
      __$$TableSavedImplCopyWithImpl<_$TableSavedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String? zoneId) zoneSelected,
    required TResult Function(Zone zone) zoneSaved,
    required TResult Function(String zoneId) zoneDeleted,
    required TResult Function(SavvyTable table) tableSaved,
    required TResult Function(String tableId) tableDeleted,
    required TResult Function(List<Zone> zones) zonesUpdated,
    required TResult Function(List<SavvyTable> tables) tablesUpdated,
  }) {
    return tableSaved(table);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String? zoneId)? zoneSelected,
    TResult? Function(Zone zone)? zoneSaved,
    TResult? Function(String zoneId)? zoneDeleted,
    TResult? Function(SavvyTable table)? tableSaved,
    TResult? Function(String tableId)? tableDeleted,
    TResult? Function(List<Zone> zones)? zonesUpdated,
    TResult? Function(List<SavvyTable> tables)? tablesUpdated,
  }) {
    return tableSaved?.call(table);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String? zoneId)? zoneSelected,
    TResult Function(Zone zone)? zoneSaved,
    TResult Function(String zoneId)? zoneDeleted,
    TResult Function(SavvyTable table)? tableSaved,
    TResult Function(String tableId)? tableDeleted,
    TResult Function(List<Zone> zones)? zonesUpdated,
    TResult Function(List<SavvyTable> tables)? tablesUpdated,
    required TResult orElse(),
  }) {
    if (tableSaved != null) {
      return tableSaved(table);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_ZoneSelected value) zoneSelected,
    required TResult Function(_ZoneSaved value) zoneSaved,
    required TResult Function(_ZoneDeleted value) zoneDeleted,
    required TResult Function(_TableSaved value) tableSaved,
    required TResult Function(_TableDeleted value) tableDeleted,
    required TResult Function(_ZonesUpdated value) zonesUpdated,
    required TResult Function(_TablesUpdated value) tablesUpdated,
  }) {
    return tableSaved(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_ZoneSelected value)? zoneSelected,
    TResult? Function(_ZoneSaved value)? zoneSaved,
    TResult? Function(_ZoneDeleted value)? zoneDeleted,
    TResult? Function(_TableSaved value)? tableSaved,
    TResult? Function(_TableDeleted value)? tableDeleted,
    TResult? Function(_ZonesUpdated value)? zonesUpdated,
    TResult? Function(_TablesUpdated value)? tablesUpdated,
  }) {
    return tableSaved?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_ZoneSelected value)? zoneSelected,
    TResult Function(_ZoneSaved value)? zoneSaved,
    TResult Function(_ZoneDeleted value)? zoneDeleted,
    TResult Function(_TableSaved value)? tableSaved,
    TResult Function(_TableDeleted value)? tableDeleted,
    TResult Function(_ZonesUpdated value)? zonesUpdated,
    TResult Function(_TablesUpdated value)? tablesUpdated,
    required TResult orElse(),
  }) {
    if (tableSaved != null) {
      return tableSaved(this);
    }
    return orElse();
  }
}

abstract class _TableSaved implements FloorPlanEditorEvent {
  const factory _TableSaved(final SavvyTable table) = _$TableSavedImpl;

  SavvyTable get table;

  /// Create a copy of FloorPlanEditorEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TableSavedImplCopyWith<_$TableSavedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TableDeletedImplCopyWith<$Res> {
  factory _$$TableDeletedImplCopyWith(
          _$TableDeletedImpl value, $Res Function(_$TableDeletedImpl) then) =
      __$$TableDeletedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String tableId});
}

/// @nodoc
class __$$TableDeletedImplCopyWithImpl<$Res>
    extends _$FloorPlanEditorEventCopyWithImpl<$Res, _$TableDeletedImpl>
    implements _$$TableDeletedImplCopyWith<$Res> {
  __$$TableDeletedImplCopyWithImpl(
      _$TableDeletedImpl _value, $Res Function(_$TableDeletedImpl) _then)
      : super(_value, _then);

  /// Create a copy of FloorPlanEditorEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tableId = null,
  }) {
    return _then(_$TableDeletedImpl(
      null == tableId
          ? _value.tableId
          : tableId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$TableDeletedImpl implements _TableDeleted {
  const _$TableDeletedImpl(this.tableId);

  @override
  final String tableId;

  @override
  String toString() {
    return 'FloorPlanEditorEvent.tableDeleted(tableId: $tableId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TableDeletedImpl &&
            (identical(other.tableId, tableId) || other.tableId == tableId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, tableId);

  /// Create a copy of FloorPlanEditorEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TableDeletedImplCopyWith<_$TableDeletedImpl> get copyWith =>
      __$$TableDeletedImplCopyWithImpl<_$TableDeletedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String? zoneId) zoneSelected,
    required TResult Function(Zone zone) zoneSaved,
    required TResult Function(String zoneId) zoneDeleted,
    required TResult Function(SavvyTable table) tableSaved,
    required TResult Function(String tableId) tableDeleted,
    required TResult Function(List<Zone> zones) zonesUpdated,
    required TResult Function(List<SavvyTable> tables) tablesUpdated,
  }) {
    return tableDeleted(tableId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String? zoneId)? zoneSelected,
    TResult? Function(Zone zone)? zoneSaved,
    TResult? Function(String zoneId)? zoneDeleted,
    TResult? Function(SavvyTable table)? tableSaved,
    TResult? Function(String tableId)? tableDeleted,
    TResult? Function(List<Zone> zones)? zonesUpdated,
    TResult? Function(List<SavvyTable> tables)? tablesUpdated,
  }) {
    return tableDeleted?.call(tableId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String? zoneId)? zoneSelected,
    TResult Function(Zone zone)? zoneSaved,
    TResult Function(String zoneId)? zoneDeleted,
    TResult Function(SavvyTable table)? tableSaved,
    TResult Function(String tableId)? tableDeleted,
    TResult Function(List<Zone> zones)? zonesUpdated,
    TResult Function(List<SavvyTable> tables)? tablesUpdated,
    required TResult orElse(),
  }) {
    if (tableDeleted != null) {
      return tableDeleted(tableId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_ZoneSelected value) zoneSelected,
    required TResult Function(_ZoneSaved value) zoneSaved,
    required TResult Function(_ZoneDeleted value) zoneDeleted,
    required TResult Function(_TableSaved value) tableSaved,
    required TResult Function(_TableDeleted value) tableDeleted,
    required TResult Function(_ZonesUpdated value) zonesUpdated,
    required TResult Function(_TablesUpdated value) tablesUpdated,
  }) {
    return tableDeleted(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_ZoneSelected value)? zoneSelected,
    TResult? Function(_ZoneSaved value)? zoneSaved,
    TResult? Function(_ZoneDeleted value)? zoneDeleted,
    TResult? Function(_TableSaved value)? tableSaved,
    TResult? Function(_TableDeleted value)? tableDeleted,
    TResult? Function(_ZonesUpdated value)? zonesUpdated,
    TResult? Function(_TablesUpdated value)? tablesUpdated,
  }) {
    return tableDeleted?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_ZoneSelected value)? zoneSelected,
    TResult Function(_ZoneSaved value)? zoneSaved,
    TResult Function(_ZoneDeleted value)? zoneDeleted,
    TResult Function(_TableSaved value)? tableSaved,
    TResult Function(_TableDeleted value)? tableDeleted,
    TResult Function(_ZonesUpdated value)? zonesUpdated,
    TResult Function(_TablesUpdated value)? tablesUpdated,
    required TResult orElse(),
  }) {
    if (tableDeleted != null) {
      return tableDeleted(this);
    }
    return orElse();
  }
}

abstract class _TableDeleted implements FloorPlanEditorEvent {
  const factory _TableDeleted(final String tableId) = _$TableDeletedImpl;

  String get tableId;

  /// Create a copy of FloorPlanEditorEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TableDeletedImplCopyWith<_$TableDeletedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ZonesUpdatedImplCopyWith<$Res> {
  factory _$$ZonesUpdatedImplCopyWith(
          _$ZonesUpdatedImpl value, $Res Function(_$ZonesUpdatedImpl) then) =
      __$$ZonesUpdatedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Zone> zones});
}

/// @nodoc
class __$$ZonesUpdatedImplCopyWithImpl<$Res>
    extends _$FloorPlanEditorEventCopyWithImpl<$Res, _$ZonesUpdatedImpl>
    implements _$$ZonesUpdatedImplCopyWith<$Res> {
  __$$ZonesUpdatedImplCopyWithImpl(
      _$ZonesUpdatedImpl _value, $Res Function(_$ZonesUpdatedImpl) _then)
      : super(_value, _then);

  /// Create a copy of FloorPlanEditorEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? zones = null,
  }) {
    return _then(_$ZonesUpdatedImpl(
      null == zones
          ? _value._zones
          : zones // ignore: cast_nullable_to_non_nullable
              as List<Zone>,
    ));
  }
}

/// @nodoc

class _$ZonesUpdatedImpl implements _ZonesUpdated {
  const _$ZonesUpdatedImpl(final List<Zone> zones) : _zones = zones;

  final List<Zone> _zones;
  @override
  List<Zone> get zones {
    if (_zones is EqualUnmodifiableListView) return _zones;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_zones);
  }

  @override
  String toString() {
    return 'FloorPlanEditorEvent.zonesUpdated(zones: $zones)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ZonesUpdatedImpl &&
            const DeepCollectionEquality().equals(other._zones, _zones));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_zones));

  /// Create a copy of FloorPlanEditorEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ZonesUpdatedImplCopyWith<_$ZonesUpdatedImpl> get copyWith =>
      __$$ZonesUpdatedImplCopyWithImpl<_$ZonesUpdatedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String? zoneId) zoneSelected,
    required TResult Function(Zone zone) zoneSaved,
    required TResult Function(String zoneId) zoneDeleted,
    required TResult Function(SavvyTable table) tableSaved,
    required TResult Function(String tableId) tableDeleted,
    required TResult Function(List<Zone> zones) zonesUpdated,
    required TResult Function(List<SavvyTable> tables) tablesUpdated,
  }) {
    return zonesUpdated(zones);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String? zoneId)? zoneSelected,
    TResult? Function(Zone zone)? zoneSaved,
    TResult? Function(String zoneId)? zoneDeleted,
    TResult? Function(SavvyTable table)? tableSaved,
    TResult? Function(String tableId)? tableDeleted,
    TResult? Function(List<Zone> zones)? zonesUpdated,
    TResult? Function(List<SavvyTable> tables)? tablesUpdated,
  }) {
    return zonesUpdated?.call(zones);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String? zoneId)? zoneSelected,
    TResult Function(Zone zone)? zoneSaved,
    TResult Function(String zoneId)? zoneDeleted,
    TResult Function(SavvyTable table)? tableSaved,
    TResult Function(String tableId)? tableDeleted,
    TResult Function(List<Zone> zones)? zonesUpdated,
    TResult Function(List<SavvyTable> tables)? tablesUpdated,
    required TResult orElse(),
  }) {
    if (zonesUpdated != null) {
      return zonesUpdated(zones);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_ZoneSelected value) zoneSelected,
    required TResult Function(_ZoneSaved value) zoneSaved,
    required TResult Function(_ZoneDeleted value) zoneDeleted,
    required TResult Function(_TableSaved value) tableSaved,
    required TResult Function(_TableDeleted value) tableDeleted,
    required TResult Function(_ZonesUpdated value) zonesUpdated,
    required TResult Function(_TablesUpdated value) tablesUpdated,
  }) {
    return zonesUpdated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_ZoneSelected value)? zoneSelected,
    TResult? Function(_ZoneSaved value)? zoneSaved,
    TResult? Function(_ZoneDeleted value)? zoneDeleted,
    TResult? Function(_TableSaved value)? tableSaved,
    TResult? Function(_TableDeleted value)? tableDeleted,
    TResult? Function(_ZonesUpdated value)? zonesUpdated,
    TResult? Function(_TablesUpdated value)? tablesUpdated,
  }) {
    return zonesUpdated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_ZoneSelected value)? zoneSelected,
    TResult Function(_ZoneSaved value)? zoneSaved,
    TResult Function(_ZoneDeleted value)? zoneDeleted,
    TResult Function(_TableSaved value)? tableSaved,
    TResult Function(_TableDeleted value)? tableDeleted,
    TResult Function(_ZonesUpdated value)? zonesUpdated,
    TResult Function(_TablesUpdated value)? tablesUpdated,
    required TResult orElse(),
  }) {
    if (zonesUpdated != null) {
      return zonesUpdated(this);
    }
    return orElse();
  }
}

abstract class _ZonesUpdated implements FloorPlanEditorEvent {
  const factory _ZonesUpdated(final List<Zone> zones) = _$ZonesUpdatedImpl;

  List<Zone> get zones;

  /// Create a copy of FloorPlanEditorEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ZonesUpdatedImplCopyWith<_$ZonesUpdatedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TablesUpdatedImplCopyWith<$Res> {
  factory _$$TablesUpdatedImplCopyWith(
          _$TablesUpdatedImpl value, $Res Function(_$TablesUpdatedImpl) then) =
      __$$TablesUpdatedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<SavvyTable> tables});
}

/// @nodoc
class __$$TablesUpdatedImplCopyWithImpl<$Res>
    extends _$FloorPlanEditorEventCopyWithImpl<$Res, _$TablesUpdatedImpl>
    implements _$$TablesUpdatedImplCopyWith<$Res> {
  __$$TablesUpdatedImplCopyWithImpl(
      _$TablesUpdatedImpl _value, $Res Function(_$TablesUpdatedImpl) _then)
      : super(_value, _then);

  /// Create a copy of FloorPlanEditorEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tables = null,
  }) {
    return _then(_$TablesUpdatedImpl(
      null == tables
          ? _value._tables
          : tables // ignore: cast_nullable_to_non_nullable
              as List<SavvyTable>,
    ));
  }
}

/// @nodoc

class _$TablesUpdatedImpl implements _TablesUpdated {
  const _$TablesUpdatedImpl(final List<SavvyTable> tables) : _tables = tables;

  final List<SavvyTable> _tables;
  @override
  List<SavvyTable> get tables {
    if (_tables is EqualUnmodifiableListView) return _tables;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tables);
  }

  @override
  String toString() {
    return 'FloorPlanEditorEvent.tablesUpdated(tables: $tables)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TablesUpdatedImpl &&
            const DeepCollectionEquality().equals(other._tables, _tables));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_tables));

  /// Create a copy of FloorPlanEditorEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TablesUpdatedImplCopyWith<_$TablesUpdatedImpl> get copyWith =>
      __$$TablesUpdatedImplCopyWithImpl<_$TablesUpdatedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String? zoneId) zoneSelected,
    required TResult Function(Zone zone) zoneSaved,
    required TResult Function(String zoneId) zoneDeleted,
    required TResult Function(SavvyTable table) tableSaved,
    required TResult Function(String tableId) tableDeleted,
    required TResult Function(List<Zone> zones) zonesUpdated,
    required TResult Function(List<SavvyTable> tables) tablesUpdated,
  }) {
    return tablesUpdated(tables);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String? zoneId)? zoneSelected,
    TResult? Function(Zone zone)? zoneSaved,
    TResult? Function(String zoneId)? zoneDeleted,
    TResult? Function(SavvyTable table)? tableSaved,
    TResult? Function(String tableId)? tableDeleted,
    TResult? Function(List<Zone> zones)? zonesUpdated,
    TResult? Function(List<SavvyTable> tables)? tablesUpdated,
  }) {
    return tablesUpdated?.call(tables);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String? zoneId)? zoneSelected,
    TResult Function(Zone zone)? zoneSaved,
    TResult Function(String zoneId)? zoneDeleted,
    TResult Function(SavvyTable table)? tableSaved,
    TResult Function(String tableId)? tableDeleted,
    TResult Function(List<Zone> zones)? zonesUpdated,
    TResult Function(List<SavvyTable> tables)? tablesUpdated,
    required TResult orElse(),
  }) {
    if (tablesUpdated != null) {
      return tablesUpdated(tables);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_ZoneSelected value) zoneSelected,
    required TResult Function(_ZoneSaved value) zoneSaved,
    required TResult Function(_ZoneDeleted value) zoneDeleted,
    required TResult Function(_TableSaved value) tableSaved,
    required TResult Function(_TableDeleted value) tableDeleted,
    required TResult Function(_ZonesUpdated value) zonesUpdated,
    required TResult Function(_TablesUpdated value) tablesUpdated,
  }) {
    return tablesUpdated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_ZoneSelected value)? zoneSelected,
    TResult? Function(_ZoneSaved value)? zoneSaved,
    TResult? Function(_ZoneDeleted value)? zoneDeleted,
    TResult? Function(_TableSaved value)? tableSaved,
    TResult? Function(_TableDeleted value)? tableDeleted,
    TResult? Function(_ZonesUpdated value)? zonesUpdated,
    TResult? Function(_TablesUpdated value)? tablesUpdated,
  }) {
    return tablesUpdated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_ZoneSelected value)? zoneSelected,
    TResult Function(_ZoneSaved value)? zoneSaved,
    TResult Function(_ZoneDeleted value)? zoneDeleted,
    TResult Function(_TableSaved value)? tableSaved,
    TResult Function(_TableDeleted value)? tableDeleted,
    TResult Function(_ZonesUpdated value)? zonesUpdated,
    TResult Function(_TablesUpdated value)? tablesUpdated,
    required TResult orElse(),
  }) {
    if (tablesUpdated != null) {
      return tablesUpdated(this);
    }
    return orElse();
  }
}

abstract class _TablesUpdated implements FloorPlanEditorEvent {
  const factory _TablesUpdated(final List<SavvyTable> tables) =
      _$TablesUpdatedImpl;

  List<SavvyTable> get tables;

  /// Create a copy of FloorPlanEditorEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TablesUpdatedImplCopyWith<_$TablesUpdatedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$FloorPlanEditorState {
  bool get isLoading => throw _privateConstructorUsedError;
  List<Zone> get zones => throw _privateConstructorUsedError;
  List<SavvyTable> get tables => throw _privateConstructorUsedError;
  String? get selectedZoneId => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  /// Create a copy of FloorPlanEditorState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FloorPlanEditorStateCopyWith<FloorPlanEditorState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FloorPlanEditorStateCopyWith<$Res> {
  factory $FloorPlanEditorStateCopyWith(FloorPlanEditorState value,
          $Res Function(FloorPlanEditorState) then) =
      _$FloorPlanEditorStateCopyWithImpl<$Res, FloorPlanEditorState>;
  @useResult
  $Res call(
      {bool isLoading,
      List<Zone> zones,
      List<SavvyTable> tables,
      String? selectedZoneId,
      String? errorMessage});
}

/// @nodoc
class _$FloorPlanEditorStateCopyWithImpl<$Res,
        $Val extends FloorPlanEditorState>
    implements $FloorPlanEditorStateCopyWith<$Res> {
  _$FloorPlanEditorStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FloorPlanEditorState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? zones = null,
    Object? tables = null,
    Object? selectedZoneId = freezed,
    Object? errorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      zones: null == zones
          ? _value.zones
          : zones // ignore: cast_nullable_to_non_nullable
              as List<Zone>,
      tables: null == tables
          ? _value.tables
          : tables // ignore: cast_nullable_to_non_nullable
              as List<SavvyTable>,
      selectedZoneId: freezed == selectedZoneId
          ? _value.selectedZoneId
          : selectedZoneId // ignore: cast_nullable_to_non_nullable
              as String?,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FloorPlanEditorStateImplCopyWith<$Res>
    implements $FloorPlanEditorStateCopyWith<$Res> {
  factory _$$FloorPlanEditorStateImplCopyWith(_$FloorPlanEditorStateImpl value,
          $Res Function(_$FloorPlanEditorStateImpl) then) =
      __$$FloorPlanEditorStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      List<Zone> zones,
      List<SavvyTable> tables,
      String? selectedZoneId,
      String? errorMessage});
}

/// @nodoc
class __$$FloorPlanEditorStateImplCopyWithImpl<$Res>
    extends _$FloorPlanEditorStateCopyWithImpl<$Res, _$FloorPlanEditorStateImpl>
    implements _$$FloorPlanEditorStateImplCopyWith<$Res> {
  __$$FloorPlanEditorStateImplCopyWithImpl(_$FloorPlanEditorStateImpl _value,
      $Res Function(_$FloorPlanEditorStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of FloorPlanEditorState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? zones = null,
    Object? tables = null,
    Object? selectedZoneId = freezed,
    Object? errorMessage = freezed,
  }) {
    return _then(_$FloorPlanEditorStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      zones: null == zones
          ? _value._zones
          : zones // ignore: cast_nullable_to_non_nullable
              as List<Zone>,
      tables: null == tables
          ? _value._tables
          : tables // ignore: cast_nullable_to_non_nullable
              as List<SavvyTable>,
      selectedZoneId: freezed == selectedZoneId
          ? _value.selectedZoneId
          : selectedZoneId // ignore: cast_nullable_to_non_nullable
              as String?,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$FloorPlanEditorStateImpl implements _FloorPlanEditorState {
  const _$FloorPlanEditorStateImpl(
      {this.isLoading = false,
      final List<Zone> zones = const [],
      final List<SavvyTable> tables = const [],
      this.selectedZoneId,
      this.errorMessage})
      : _zones = zones,
        _tables = tables;

  @override
  @JsonKey()
  final bool isLoading;
  final List<Zone> _zones;
  @override
  @JsonKey()
  List<Zone> get zones {
    if (_zones is EqualUnmodifiableListView) return _zones;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_zones);
  }

  final List<SavvyTable> _tables;
  @override
  @JsonKey()
  List<SavvyTable> get tables {
    if (_tables is EqualUnmodifiableListView) return _tables;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tables);
  }

  @override
  final String? selectedZoneId;
  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'FloorPlanEditorState(isLoading: $isLoading, zones: $zones, tables: $tables, selectedZoneId: $selectedZoneId, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FloorPlanEditorStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            const DeepCollectionEquality().equals(other._zones, _zones) &&
            const DeepCollectionEquality().equals(other._tables, _tables) &&
            (identical(other.selectedZoneId, selectedZoneId) ||
                other.selectedZoneId == selectedZoneId) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      const DeepCollectionEquality().hash(_zones),
      const DeepCollectionEquality().hash(_tables),
      selectedZoneId,
      errorMessage);

  /// Create a copy of FloorPlanEditorState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FloorPlanEditorStateImplCopyWith<_$FloorPlanEditorStateImpl>
      get copyWith =>
          __$$FloorPlanEditorStateImplCopyWithImpl<_$FloorPlanEditorStateImpl>(
              this, _$identity);
}

abstract class _FloorPlanEditorState implements FloorPlanEditorState {
  const factory _FloorPlanEditorState(
      {final bool isLoading,
      final List<Zone> zones,
      final List<SavvyTable> tables,
      final String? selectedZoneId,
      final String? errorMessage}) = _$FloorPlanEditorStateImpl;

  @override
  bool get isLoading;
  @override
  List<Zone> get zones;
  @override
  List<SavvyTable> get tables;
  @override
  String? get selectedZoneId;
  @override
  String? get errorMessage;

  /// Create a copy of FloorPlanEditorState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FloorPlanEditorStateImplCopyWith<_$FloorPlanEditorStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
