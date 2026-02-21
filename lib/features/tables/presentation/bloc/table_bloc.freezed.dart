// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'table_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TableEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadTables,
    required TResult Function(List<SavvyTable> tables) tablesUpdated,
    required TResult Function(String name, double x, double y) addTable,
    required TResult Function(String uuid, double x, double y) moveTable,
    required TResult Function(String uuid) deleteTable,
    required TResult Function(String uuid, bool isOccupied) toggleOccupied,
    required TResult Function(String sourceUuid, String targetUuid)
        transferTable,
    required TResult Function(String sourceUuid, String targetUuid) mergeTables,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadTables,
    TResult? Function(List<SavvyTable> tables)? tablesUpdated,
    TResult? Function(String name, double x, double y)? addTable,
    TResult? Function(String uuid, double x, double y)? moveTable,
    TResult? Function(String uuid)? deleteTable,
    TResult? Function(String uuid, bool isOccupied)? toggleOccupied,
    TResult? Function(String sourceUuid, String targetUuid)? transferTable,
    TResult? Function(String sourceUuid, String targetUuid)? mergeTables,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadTables,
    TResult Function(List<SavvyTable> tables)? tablesUpdated,
    TResult Function(String name, double x, double y)? addTable,
    TResult Function(String uuid, double x, double y)? moveTable,
    TResult Function(String uuid)? deleteTable,
    TResult Function(String uuid, bool isOccupied)? toggleOccupied,
    TResult Function(String sourceUuid, String targetUuid)? transferTable,
    TResult Function(String sourceUuid, String targetUuid)? mergeTables,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadTables value) loadTables,
    required TResult Function(_TablesUpdated value) tablesUpdated,
    required TResult Function(_AddTable value) addTable,
    required TResult Function(_MoveTable value) moveTable,
    required TResult Function(_DeleteTable value) deleteTable,
    required TResult Function(_ToggleOccupied value) toggleOccupied,
    required TResult Function(_TransferTable value) transferTable,
    required TResult Function(_MergeTables value) mergeTables,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadTables value)? loadTables,
    TResult? Function(_TablesUpdated value)? tablesUpdated,
    TResult? Function(_AddTable value)? addTable,
    TResult? Function(_MoveTable value)? moveTable,
    TResult? Function(_DeleteTable value)? deleteTable,
    TResult? Function(_ToggleOccupied value)? toggleOccupied,
    TResult? Function(_TransferTable value)? transferTable,
    TResult? Function(_MergeTables value)? mergeTables,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadTables value)? loadTables,
    TResult Function(_TablesUpdated value)? tablesUpdated,
    TResult Function(_AddTable value)? addTable,
    TResult Function(_MoveTable value)? moveTable,
    TResult Function(_DeleteTable value)? deleteTable,
    TResult Function(_ToggleOccupied value)? toggleOccupied,
    TResult Function(_TransferTable value)? transferTable,
    TResult Function(_MergeTables value)? mergeTables,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TableEventCopyWith<$Res> {
  factory $TableEventCopyWith(
          TableEvent value, $Res Function(TableEvent) then) =
      _$TableEventCopyWithImpl<$Res, TableEvent>;
}

/// @nodoc
class _$TableEventCopyWithImpl<$Res, $Val extends TableEvent>
    implements $TableEventCopyWith<$Res> {
  _$TableEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TableEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$LoadTablesImplCopyWith<$Res> {
  factory _$$LoadTablesImplCopyWith(
          _$LoadTablesImpl value, $Res Function(_$LoadTablesImpl) then) =
      __$$LoadTablesImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadTablesImplCopyWithImpl<$Res>
    extends _$TableEventCopyWithImpl<$Res, _$LoadTablesImpl>
    implements _$$LoadTablesImplCopyWith<$Res> {
  __$$LoadTablesImplCopyWithImpl(
      _$LoadTablesImpl _value, $Res Function(_$LoadTablesImpl) _then)
      : super(_value, _then);

  /// Create a copy of TableEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadTablesImpl implements _LoadTables {
  const _$LoadTablesImpl();

  @override
  String toString() {
    return 'TableEvent.loadTables()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadTablesImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadTables,
    required TResult Function(List<SavvyTable> tables) tablesUpdated,
    required TResult Function(String name, double x, double y) addTable,
    required TResult Function(String uuid, double x, double y) moveTable,
    required TResult Function(String uuid) deleteTable,
    required TResult Function(String uuid, bool isOccupied) toggleOccupied,
    required TResult Function(String sourceUuid, String targetUuid)
        transferTable,
    required TResult Function(String sourceUuid, String targetUuid) mergeTables,
  }) {
    return loadTables();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadTables,
    TResult? Function(List<SavvyTable> tables)? tablesUpdated,
    TResult? Function(String name, double x, double y)? addTable,
    TResult? Function(String uuid, double x, double y)? moveTable,
    TResult? Function(String uuid)? deleteTable,
    TResult? Function(String uuid, bool isOccupied)? toggleOccupied,
    TResult? Function(String sourceUuid, String targetUuid)? transferTable,
    TResult? Function(String sourceUuid, String targetUuid)? mergeTables,
  }) {
    return loadTables?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadTables,
    TResult Function(List<SavvyTable> tables)? tablesUpdated,
    TResult Function(String name, double x, double y)? addTable,
    TResult Function(String uuid, double x, double y)? moveTable,
    TResult Function(String uuid)? deleteTable,
    TResult Function(String uuid, bool isOccupied)? toggleOccupied,
    TResult Function(String sourceUuid, String targetUuid)? transferTable,
    TResult Function(String sourceUuid, String targetUuid)? mergeTables,
    required TResult orElse(),
  }) {
    if (loadTables != null) {
      return loadTables();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadTables value) loadTables,
    required TResult Function(_TablesUpdated value) tablesUpdated,
    required TResult Function(_AddTable value) addTable,
    required TResult Function(_MoveTable value) moveTable,
    required TResult Function(_DeleteTable value) deleteTable,
    required TResult Function(_ToggleOccupied value) toggleOccupied,
    required TResult Function(_TransferTable value) transferTable,
    required TResult Function(_MergeTables value) mergeTables,
  }) {
    return loadTables(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadTables value)? loadTables,
    TResult? Function(_TablesUpdated value)? tablesUpdated,
    TResult? Function(_AddTable value)? addTable,
    TResult? Function(_MoveTable value)? moveTable,
    TResult? Function(_DeleteTable value)? deleteTable,
    TResult? Function(_ToggleOccupied value)? toggleOccupied,
    TResult? Function(_TransferTable value)? transferTable,
    TResult? Function(_MergeTables value)? mergeTables,
  }) {
    return loadTables?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadTables value)? loadTables,
    TResult Function(_TablesUpdated value)? tablesUpdated,
    TResult Function(_AddTable value)? addTable,
    TResult Function(_MoveTable value)? moveTable,
    TResult Function(_DeleteTable value)? deleteTable,
    TResult Function(_ToggleOccupied value)? toggleOccupied,
    TResult Function(_TransferTable value)? transferTable,
    TResult Function(_MergeTables value)? mergeTables,
    required TResult orElse(),
  }) {
    if (loadTables != null) {
      return loadTables(this);
    }
    return orElse();
  }
}

abstract class _LoadTables implements TableEvent {
  const factory _LoadTables() = _$LoadTablesImpl;
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
    extends _$TableEventCopyWithImpl<$Res, _$TablesUpdatedImpl>
    implements _$$TablesUpdatedImplCopyWith<$Res> {
  __$$TablesUpdatedImplCopyWithImpl(
      _$TablesUpdatedImpl _value, $Res Function(_$TablesUpdatedImpl) _then)
      : super(_value, _then);

  /// Create a copy of TableEvent
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
    return 'TableEvent.tablesUpdated(tables: $tables)';
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

  /// Create a copy of TableEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TablesUpdatedImplCopyWith<_$TablesUpdatedImpl> get copyWith =>
      __$$TablesUpdatedImplCopyWithImpl<_$TablesUpdatedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadTables,
    required TResult Function(List<SavvyTable> tables) tablesUpdated,
    required TResult Function(String name, double x, double y) addTable,
    required TResult Function(String uuid, double x, double y) moveTable,
    required TResult Function(String uuid) deleteTable,
    required TResult Function(String uuid, bool isOccupied) toggleOccupied,
    required TResult Function(String sourceUuid, String targetUuid)
        transferTable,
    required TResult Function(String sourceUuid, String targetUuid) mergeTables,
  }) {
    return tablesUpdated(tables);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadTables,
    TResult? Function(List<SavvyTable> tables)? tablesUpdated,
    TResult? Function(String name, double x, double y)? addTable,
    TResult? Function(String uuid, double x, double y)? moveTable,
    TResult? Function(String uuid)? deleteTable,
    TResult? Function(String uuid, bool isOccupied)? toggleOccupied,
    TResult? Function(String sourceUuid, String targetUuid)? transferTable,
    TResult? Function(String sourceUuid, String targetUuid)? mergeTables,
  }) {
    return tablesUpdated?.call(tables);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadTables,
    TResult Function(List<SavvyTable> tables)? tablesUpdated,
    TResult Function(String name, double x, double y)? addTable,
    TResult Function(String uuid, double x, double y)? moveTable,
    TResult Function(String uuid)? deleteTable,
    TResult Function(String uuid, bool isOccupied)? toggleOccupied,
    TResult Function(String sourceUuid, String targetUuid)? transferTable,
    TResult Function(String sourceUuid, String targetUuid)? mergeTables,
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
    required TResult Function(_LoadTables value) loadTables,
    required TResult Function(_TablesUpdated value) tablesUpdated,
    required TResult Function(_AddTable value) addTable,
    required TResult Function(_MoveTable value) moveTable,
    required TResult Function(_DeleteTable value) deleteTable,
    required TResult Function(_ToggleOccupied value) toggleOccupied,
    required TResult Function(_TransferTable value) transferTable,
    required TResult Function(_MergeTables value) mergeTables,
  }) {
    return tablesUpdated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadTables value)? loadTables,
    TResult? Function(_TablesUpdated value)? tablesUpdated,
    TResult? Function(_AddTable value)? addTable,
    TResult? Function(_MoveTable value)? moveTable,
    TResult? Function(_DeleteTable value)? deleteTable,
    TResult? Function(_ToggleOccupied value)? toggleOccupied,
    TResult? Function(_TransferTable value)? transferTable,
    TResult? Function(_MergeTables value)? mergeTables,
  }) {
    return tablesUpdated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadTables value)? loadTables,
    TResult Function(_TablesUpdated value)? tablesUpdated,
    TResult Function(_AddTable value)? addTable,
    TResult Function(_MoveTable value)? moveTable,
    TResult Function(_DeleteTable value)? deleteTable,
    TResult Function(_ToggleOccupied value)? toggleOccupied,
    TResult Function(_TransferTable value)? transferTable,
    TResult Function(_MergeTables value)? mergeTables,
    required TResult orElse(),
  }) {
    if (tablesUpdated != null) {
      return tablesUpdated(this);
    }
    return orElse();
  }
}

abstract class _TablesUpdated implements TableEvent {
  const factory _TablesUpdated(final List<SavvyTable> tables) =
      _$TablesUpdatedImpl;

  List<SavvyTable> get tables;

  /// Create a copy of TableEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TablesUpdatedImplCopyWith<_$TablesUpdatedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AddTableImplCopyWith<$Res> {
  factory _$$AddTableImplCopyWith(
          _$AddTableImpl value, $Res Function(_$AddTableImpl) then) =
      __$$AddTableImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String name, double x, double y});
}

/// @nodoc
class __$$AddTableImplCopyWithImpl<$Res>
    extends _$TableEventCopyWithImpl<$Res, _$AddTableImpl>
    implements _$$AddTableImplCopyWith<$Res> {
  __$$AddTableImplCopyWithImpl(
      _$AddTableImpl _value, $Res Function(_$AddTableImpl) _then)
      : super(_value, _then);

  /// Create a copy of TableEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? x = null,
    Object? y = null,
  }) {
    return _then(_$AddTableImpl(
      null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      null == x
          ? _value.x
          : x // ignore: cast_nullable_to_non_nullable
              as double,
      null == y
          ? _value.y
          : y // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$AddTableImpl implements _AddTable {
  const _$AddTableImpl(this.name, this.x, this.y);

  @override
  final String name;
  @override
  final double x;
  @override
  final double y;

  @override
  String toString() {
    return 'TableEvent.addTable(name: $name, x: $x, y: $y)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddTableImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.x, x) || other.x == x) &&
            (identical(other.y, y) || other.y == y));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, x, y);

  /// Create a copy of TableEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AddTableImplCopyWith<_$AddTableImpl> get copyWith =>
      __$$AddTableImplCopyWithImpl<_$AddTableImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadTables,
    required TResult Function(List<SavvyTable> tables) tablesUpdated,
    required TResult Function(String name, double x, double y) addTable,
    required TResult Function(String uuid, double x, double y) moveTable,
    required TResult Function(String uuid) deleteTable,
    required TResult Function(String uuid, bool isOccupied) toggleOccupied,
    required TResult Function(String sourceUuid, String targetUuid)
        transferTable,
    required TResult Function(String sourceUuid, String targetUuid) mergeTables,
  }) {
    return addTable(name, x, y);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadTables,
    TResult? Function(List<SavvyTable> tables)? tablesUpdated,
    TResult? Function(String name, double x, double y)? addTable,
    TResult? Function(String uuid, double x, double y)? moveTable,
    TResult? Function(String uuid)? deleteTable,
    TResult? Function(String uuid, bool isOccupied)? toggleOccupied,
    TResult? Function(String sourceUuid, String targetUuid)? transferTable,
    TResult? Function(String sourceUuid, String targetUuid)? mergeTables,
  }) {
    return addTable?.call(name, x, y);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadTables,
    TResult Function(List<SavvyTable> tables)? tablesUpdated,
    TResult Function(String name, double x, double y)? addTable,
    TResult Function(String uuid, double x, double y)? moveTable,
    TResult Function(String uuid)? deleteTable,
    TResult Function(String uuid, bool isOccupied)? toggleOccupied,
    TResult Function(String sourceUuid, String targetUuid)? transferTable,
    TResult Function(String sourceUuid, String targetUuid)? mergeTables,
    required TResult orElse(),
  }) {
    if (addTable != null) {
      return addTable(name, x, y);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadTables value) loadTables,
    required TResult Function(_TablesUpdated value) tablesUpdated,
    required TResult Function(_AddTable value) addTable,
    required TResult Function(_MoveTable value) moveTable,
    required TResult Function(_DeleteTable value) deleteTable,
    required TResult Function(_ToggleOccupied value) toggleOccupied,
    required TResult Function(_TransferTable value) transferTable,
    required TResult Function(_MergeTables value) mergeTables,
  }) {
    return addTable(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadTables value)? loadTables,
    TResult? Function(_TablesUpdated value)? tablesUpdated,
    TResult? Function(_AddTable value)? addTable,
    TResult? Function(_MoveTable value)? moveTable,
    TResult? Function(_DeleteTable value)? deleteTable,
    TResult? Function(_ToggleOccupied value)? toggleOccupied,
    TResult? Function(_TransferTable value)? transferTable,
    TResult? Function(_MergeTables value)? mergeTables,
  }) {
    return addTable?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadTables value)? loadTables,
    TResult Function(_TablesUpdated value)? tablesUpdated,
    TResult Function(_AddTable value)? addTable,
    TResult Function(_MoveTable value)? moveTable,
    TResult Function(_DeleteTable value)? deleteTable,
    TResult Function(_ToggleOccupied value)? toggleOccupied,
    TResult Function(_TransferTable value)? transferTable,
    TResult Function(_MergeTables value)? mergeTables,
    required TResult orElse(),
  }) {
    if (addTable != null) {
      return addTable(this);
    }
    return orElse();
  }
}

abstract class _AddTable implements TableEvent {
  const factory _AddTable(final String name, final double x, final double y) =
      _$AddTableImpl;

  String get name;
  double get x;
  double get y;

  /// Create a copy of TableEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AddTableImplCopyWith<_$AddTableImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$MoveTableImplCopyWith<$Res> {
  factory _$$MoveTableImplCopyWith(
          _$MoveTableImpl value, $Res Function(_$MoveTableImpl) then) =
      __$$MoveTableImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String uuid, double x, double y});
}

/// @nodoc
class __$$MoveTableImplCopyWithImpl<$Res>
    extends _$TableEventCopyWithImpl<$Res, _$MoveTableImpl>
    implements _$$MoveTableImplCopyWith<$Res> {
  __$$MoveTableImplCopyWithImpl(
      _$MoveTableImpl _value, $Res Function(_$MoveTableImpl) _then)
      : super(_value, _then);

  /// Create a copy of TableEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
    Object? x = null,
    Object? y = null,
  }) {
    return _then(_$MoveTableImpl(
      null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      null == x
          ? _value.x
          : x // ignore: cast_nullable_to_non_nullable
              as double,
      null == y
          ? _value.y
          : y // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$MoveTableImpl implements _MoveTable {
  const _$MoveTableImpl(this.uuid, this.x, this.y);

  @override
  final String uuid;
  @override
  final double x;
  @override
  final double y;

  @override
  String toString() {
    return 'TableEvent.moveTable(uuid: $uuid, x: $x, y: $y)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MoveTableImpl &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.x, x) || other.x == x) &&
            (identical(other.y, y) || other.y == y));
  }

  @override
  int get hashCode => Object.hash(runtimeType, uuid, x, y);

  /// Create a copy of TableEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MoveTableImplCopyWith<_$MoveTableImpl> get copyWith =>
      __$$MoveTableImplCopyWithImpl<_$MoveTableImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadTables,
    required TResult Function(List<SavvyTable> tables) tablesUpdated,
    required TResult Function(String name, double x, double y) addTable,
    required TResult Function(String uuid, double x, double y) moveTable,
    required TResult Function(String uuid) deleteTable,
    required TResult Function(String uuid, bool isOccupied) toggleOccupied,
    required TResult Function(String sourceUuid, String targetUuid)
        transferTable,
    required TResult Function(String sourceUuid, String targetUuid) mergeTables,
  }) {
    return moveTable(uuid, x, y);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadTables,
    TResult? Function(List<SavvyTable> tables)? tablesUpdated,
    TResult? Function(String name, double x, double y)? addTable,
    TResult? Function(String uuid, double x, double y)? moveTable,
    TResult? Function(String uuid)? deleteTable,
    TResult? Function(String uuid, bool isOccupied)? toggleOccupied,
    TResult? Function(String sourceUuid, String targetUuid)? transferTable,
    TResult? Function(String sourceUuid, String targetUuid)? mergeTables,
  }) {
    return moveTable?.call(uuid, x, y);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadTables,
    TResult Function(List<SavvyTable> tables)? tablesUpdated,
    TResult Function(String name, double x, double y)? addTable,
    TResult Function(String uuid, double x, double y)? moveTable,
    TResult Function(String uuid)? deleteTable,
    TResult Function(String uuid, bool isOccupied)? toggleOccupied,
    TResult Function(String sourceUuid, String targetUuid)? transferTable,
    TResult Function(String sourceUuid, String targetUuid)? mergeTables,
    required TResult orElse(),
  }) {
    if (moveTable != null) {
      return moveTable(uuid, x, y);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadTables value) loadTables,
    required TResult Function(_TablesUpdated value) tablesUpdated,
    required TResult Function(_AddTable value) addTable,
    required TResult Function(_MoveTable value) moveTable,
    required TResult Function(_DeleteTable value) deleteTable,
    required TResult Function(_ToggleOccupied value) toggleOccupied,
    required TResult Function(_TransferTable value) transferTable,
    required TResult Function(_MergeTables value) mergeTables,
  }) {
    return moveTable(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadTables value)? loadTables,
    TResult? Function(_TablesUpdated value)? tablesUpdated,
    TResult? Function(_AddTable value)? addTable,
    TResult? Function(_MoveTable value)? moveTable,
    TResult? Function(_DeleteTable value)? deleteTable,
    TResult? Function(_ToggleOccupied value)? toggleOccupied,
    TResult? Function(_TransferTable value)? transferTable,
    TResult? Function(_MergeTables value)? mergeTables,
  }) {
    return moveTable?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadTables value)? loadTables,
    TResult Function(_TablesUpdated value)? tablesUpdated,
    TResult Function(_AddTable value)? addTable,
    TResult Function(_MoveTable value)? moveTable,
    TResult Function(_DeleteTable value)? deleteTable,
    TResult Function(_ToggleOccupied value)? toggleOccupied,
    TResult Function(_TransferTable value)? transferTable,
    TResult Function(_MergeTables value)? mergeTables,
    required TResult orElse(),
  }) {
    if (moveTable != null) {
      return moveTable(this);
    }
    return orElse();
  }
}

abstract class _MoveTable implements TableEvent {
  const factory _MoveTable(final String uuid, final double x, final double y) =
      _$MoveTableImpl;

  String get uuid;
  double get x;
  double get y;

  /// Create a copy of TableEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MoveTableImplCopyWith<_$MoveTableImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeleteTableImplCopyWith<$Res> {
  factory _$$DeleteTableImplCopyWith(
          _$DeleteTableImpl value, $Res Function(_$DeleteTableImpl) then) =
      __$$DeleteTableImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String uuid});
}

/// @nodoc
class __$$DeleteTableImplCopyWithImpl<$Res>
    extends _$TableEventCopyWithImpl<$Res, _$DeleteTableImpl>
    implements _$$DeleteTableImplCopyWith<$Res> {
  __$$DeleteTableImplCopyWithImpl(
      _$DeleteTableImpl _value, $Res Function(_$DeleteTableImpl) _then)
      : super(_value, _then);

  /// Create a copy of TableEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
  }) {
    return _then(_$DeleteTableImpl(
      null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$DeleteTableImpl implements _DeleteTable {
  const _$DeleteTableImpl(this.uuid);

  @override
  final String uuid;

  @override
  String toString() {
    return 'TableEvent.deleteTable(uuid: $uuid)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeleteTableImpl &&
            (identical(other.uuid, uuid) || other.uuid == uuid));
  }

  @override
  int get hashCode => Object.hash(runtimeType, uuid);

  /// Create a copy of TableEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeleteTableImplCopyWith<_$DeleteTableImpl> get copyWith =>
      __$$DeleteTableImplCopyWithImpl<_$DeleteTableImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadTables,
    required TResult Function(List<SavvyTable> tables) tablesUpdated,
    required TResult Function(String name, double x, double y) addTable,
    required TResult Function(String uuid, double x, double y) moveTable,
    required TResult Function(String uuid) deleteTable,
    required TResult Function(String uuid, bool isOccupied) toggleOccupied,
    required TResult Function(String sourceUuid, String targetUuid)
        transferTable,
    required TResult Function(String sourceUuid, String targetUuid) mergeTables,
  }) {
    return deleteTable(uuid);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadTables,
    TResult? Function(List<SavvyTable> tables)? tablesUpdated,
    TResult? Function(String name, double x, double y)? addTable,
    TResult? Function(String uuid, double x, double y)? moveTable,
    TResult? Function(String uuid)? deleteTable,
    TResult? Function(String uuid, bool isOccupied)? toggleOccupied,
    TResult? Function(String sourceUuid, String targetUuid)? transferTable,
    TResult? Function(String sourceUuid, String targetUuid)? mergeTables,
  }) {
    return deleteTable?.call(uuid);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadTables,
    TResult Function(List<SavvyTable> tables)? tablesUpdated,
    TResult Function(String name, double x, double y)? addTable,
    TResult Function(String uuid, double x, double y)? moveTable,
    TResult Function(String uuid)? deleteTable,
    TResult Function(String uuid, bool isOccupied)? toggleOccupied,
    TResult Function(String sourceUuid, String targetUuid)? transferTable,
    TResult Function(String sourceUuid, String targetUuid)? mergeTables,
    required TResult orElse(),
  }) {
    if (deleteTable != null) {
      return deleteTable(uuid);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadTables value) loadTables,
    required TResult Function(_TablesUpdated value) tablesUpdated,
    required TResult Function(_AddTable value) addTable,
    required TResult Function(_MoveTable value) moveTable,
    required TResult Function(_DeleteTable value) deleteTable,
    required TResult Function(_ToggleOccupied value) toggleOccupied,
    required TResult Function(_TransferTable value) transferTable,
    required TResult Function(_MergeTables value) mergeTables,
  }) {
    return deleteTable(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadTables value)? loadTables,
    TResult? Function(_TablesUpdated value)? tablesUpdated,
    TResult? Function(_AddTable value)? addTable,
    TResult? Function(_MoveTable value)? moveTable,
    TResult? Function(_DeleteTable value)? deleteTable,
    TResult? Function(_ToggleOccupied value)? toggleOccupied,
    TResult? Function(_TransferTable value)? transferTable,
    TResult? Function(_MergeTables value)? mergeTables,
  }) {
    return deleteTable?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadTables value)? loadTables,
    TResult Function(_TablesUpdated value)? tablesUpdated,
    TResult Function(_AddTable value)? addTable,
    TResult Function(_MoveTable value)? moveTable,
    TResult Function(_DeleteTable value)? deleteTable,
    TResult Function(_ToggleOccupied value)? toggleOccupied,
    TResult Function(_TransferTable value)? transferTable,
    TResult Function(_MergeTables value)? mergeTables,
    required TResult orElse(),
  }) {
    if (deleteTable != null) {
      return deleteTable(this);
    }
    return orElse();
  }
}

abstract class _DeleteTable implements TableEvent {
  const factory _DeleteTable(final String uuid) = _$DeleteTableImpl;

  String get uuid;

  /// Create a copy of TableEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeleteTableImplCopyWith<_$DeleteTableImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ToggleOccupiedImplCopyWith<$Res> {
  factory _$$ToggleOccupiedImplCopyWith(_$ToggleOccupiedImpl value,
          $Res Function(_$ToggleOccupiedImpl) then) =
      __$$ToggleOccupiedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String uuid, bool isOccupied});
}

/// @nodoc
class __$$ToggleOccupiedImplCopyWithImpl<$Res>
    extends _$TableEventCopyWithImpl<$Res, _$ToggleOccupiedImpl>
    implements _$$ToggleOccupiedImplCopyWith<$Res> {
  __$$ToggleOccupiedImplCopyWithImpl(
      _$ToggleOccupiedImpl _value, $Res Function(_$ToggleOccupiedImpl) _then)
      : super(_value, _then);

  /// Create a copy of TableEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
    Object? isOccupied = null,
  }) {
    return _then(_$ToggleOccupiedImpl(
      null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      null == isOccupied
          ? _value.isOccupied
          : isOccupied // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$ToggleOccupiedImpl implements _ToggleOccupied {
  const _$ToggleOccupiedImpl(this.uuid, this.isOccupied);

  @override
  final String uuid;
  @override
  final bool isOccupied;

  @override
  String toString() {
    return 'TableEvent.toggleOccupied(uuid: $uuid, isOccupied: $isOccupied)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ToggleOccupiedImpl &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.isOccupied, isOccupied) ||
                other.isOccupied == isOccupied));
  }

  @override
  int get hashCode => Object.hash(runtimeType, uuid, isOccupied);

  /// Create a copy of TableEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ToggleOccupiedImplCopyWith<_$ToggleOccupiedImpl> get copyWith =>
      __$$ToggleOccupiedImplCopyWithImpl<_$ToggleOccupiedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadTables,
    required TResult Function(List<SavvyTable> tables) tablesUpdated,
    required TResult Function(String name, double x, double y) addTable,
    required TResult Function(String uuid, double x, double y) moveTable,
    required TResult Function(String uuid) deleteTable,
    required TResult Function(String uuid, bool isOccupied) toggleOccupied,
    required TResult Function(String sourceUuid, String targetUuid)
        transferTable,
    required TResult Function(String sourceUuid, String targetUuid) mergeTables,
  }) {
    return toggleOccupied(uuid, isOccupied);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadTables,
    TResult? Function(List<SavvyTable> tables)? tablesUpdated,
    TResult? Function(String name, double x, double y)? addTable,
    TResult? Function(String uuid, double x, double y)? moveTable,
    TResult? Function(String uuid)? deleteTable,
    TResult? Function(String uuid, bool isOccupied)? toggleOccupied,
    TResult? Function(String sourceUuid, String targetUuid)? transferTable,
    TResult? Function(String sourceUuid, String targetUuid)? mergeTables,
  }) {
    return toggleOccupied?.call(uuid, isOccupied);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadTables,
    TResult Function(List<SavvyTable> tables)? tablesUpdated,
    TResult Function(String name, double x, double y)? addTable,
    TResult Function(String uuid, double x, double y)? moveTable,
    TResult Function(String uuid)? deleteTable,
    TResult Function(String uuid, bool isOccupied)? toggleOccupied,
    TResult Function(String sourceUuid, String targetUuid)? transferTable,
    TResult Function(String sourceUuid, String targetUuid)? mergeTables,
    required TResult orElse(),
  }) {
    if (toggleOccupied != null) {
      return toggleOccupied(uuid, isOccupied);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadTables value) loadTables,
    required TResult Function(_TablesUpdated value) tablesUpdated,
    required TResult Function(_AddTable value) addTable,
    required TResult Function(_MoveTable value) moveTable,
    required TResult Function(_DeleteTable value) deleteTable,
    required TResult Function(_ToggleOccupied value) toggleOccupied,
    required TResult Function(_TransferTable value) transferTable,
    required TResult Function(_MergeTables value) mergeTables,
  }) {
    return toggleOccupied(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadTables value)? loadTables,
    TResult? Function(_TablesUpdated value)? tablesUpdated,
    TResult? Function(_AddTable value)? addTable,
    TResult? Function(_MoveTable value)? moveTable,
    TResult? Function(_DeleteTable value)? deleteTable,
    TResult? Function(_ToggleOccupied value)? toggleOccupied,
    TResult? Function(_TransferTable value)? transferTable,
    TResult? Function(_MergeTables value)? mergeTables,
  }) {
    return toggleOccupied?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadTables value)? loadTables,
    TResult Function(_TablesUpdated value)? tablesUpdated,
    TResult Function(_AddTable value)? addTable,
    TResult Function(_MoveTable value)? moveTable,
    TResult Function(_DeleteTable value)? deleteTable,
    TResult Function(_ToggleOccupied value)? toggleOccupied,
    TResult Function(_TransferTable value)? transferTable,
    TResult Function(_MergeTables value)? mergeTables,
    required TResult orElse(),
  }) {
    if (toggleOccupied != null) {
      return toggleOccupied(this);
    }
    return orElse();
  }
}

abstract class _ToggleOccupied implements TableEvent {
  const factory _ToggleOccupied(final String uuid, final bool isOccupied) =
      _$ToggleOccupiedImpl;

  String get uuid;
  bool get isOccupied;

  /// Create a copy of TableEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ToggleOccupiedImplCopyWith<_$ToggleOccupiedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TransferTableImplCopyWith<$Res> {
  factory _$$TransferTableImplCopyWith(
          _$TransferTableImpl value, $Res Function(_$TransferTableImpl) then) =
      __$$TransferTableImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String sourceUuid, String targetUuid});
}

/// @nodoc
class __$$TransferTableImplCopyWithImpl<$Res>
    extends _$TableEventCopyWithImpl<$Res, _$TransferTableImpl>
    implements _$$TransferTableImplCopyWith<$Res> {
  __$$TransferTableImplCopyWithImpl(
      _$TransferTableImpl _value, $Res Function(_$TransferTableImpl) _then)
      : super(_value, _then);

  /// Create a copy of TableEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sourceUuid = null,
    Object? targetUuid = null,
  }) {
    return _then(_$TransferTableImpl(
      null == sourceUuid
          ? _value.sourceUuid
          : sourceUuid // ignore: cast_nullable_to_non_nullable
              as String,
      null == targetUuid
          ? _value.targetUuid
          : targetUuid // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$TransferTableImpl implements _TransferTable {
  const _$TransferTableImpl(this.sourceUuid, this.targetUuid);

  @override
  final String sourceUuid;
  @override
  final String targetUuid;

  @override
  String toString() {
    return 'TableEvent.transferTable(sourceUuid: $sourceUuid, targetUuid: $targetUuid)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransferTableImpl &&
            (identical(other.sourceUuid, sourceUuid) ||
                other.sourceUuid == sourceUuid) &&
            (identical(other.targetUuid, targetUuid) ||
                other.targetUuid == targetUuid));
  }

  @override
  int get hashCode => Object.hash(runtimeType, sourceUuid, targetUuid);

  /// Create a copy of TableEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TransferTableImplCopyWith<_$TransferTableImpl> get copyWith =>
      __$$TransferTableImplCopyWithImpl<_$TransferTableImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadTables,
    required TResult Function(List<SavvyTable> tables) tablesUpdated,
    required TResult Function(String name, double x, double y) addTable,
    required TResult Function(String uuid, double x, double y) moveTable,
    required TResult Function(String uuid) deleteTable,
    required TResult Function(String uuid, bool isOccupied) toggleOccupied,
    required TResult Function(String sourceUuid, String targetUuid)
        transferTable,
    required TResult Function(String sourceUuid, String targetUuid) mergeTables,
  }) {
    return transferTable(sourceUuid, targetUuid);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadTables,
    TResult? Function(List<SavvyTable> tables)? tablesUpdated,
    TResult? Function(String name, double x, double y)? addTable,
    TResult? Function(String uuid, double x, double y)? moveTable,
    TResult? Function(String uuid)? deleteTable,
    TResult? Function(String uuid, bool isOccupied)? toggleOccupied,
    TResult? Function(String sourceUuid, String targetUuid)? transferTable,
    TResult? Function(String sourceUuid, String targetUuid)? mergeTables,
  }) {
    return transferTable?.call(sourceUuid, targetUuid);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadTables,
    TResult Function(List<SavvyTable> tables)? tablesUpdated,
    TResult Function(String name, double x, double y)? addTable,
    TResult Function(String uuid, double x, double y)? moveTable,
    TResult Function(String uuid)? deleteTable,
    TResult Function(String uuid, bool isOccupied)? toggleOccupied,
    TResult Function(String sourceUuid, String targetUuid)? transferTable,
    TResult Function(String sourceUuid, String targetUuid)? mergeTables,
    required TResult orElse(),
  }) {
    if (transferTable != null) {
      return transferTable(sourceUuid, targetUuid);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadTables value) loadTables,
    required TResult Function(_TablesUpdated value) tablesUpdated,
    required TResult Function(_AddTable value) addTable,
    required TResult Function(_MoveTable value) moveTable,
    required TResult Function(_DeleteTable value) deleteTable,
    required TResult Function(_ToggleOccupied value) toggleOccupied,
    required TResult Function(_TransferTable value) transferTable,
    required TResult Function(_MergeTables value) mergeTables,
  }) {
    return transferTable(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadTables value)? loadTables,
    TResult? Function(_TablesUpdated value)? tablesUpdated,
    TResult? Function(_AddTable value)? addTable,
    TResult? Function(_MoveTable value)? moveTable,
    TResult? Function(_DeleteTable value)? deleteTable,
    TResult? Function(_ToggleOccupied value)? toggleOccupied,
    TResult? Function(_TransferTable value)? transferTable,
    TResult? Function(_MergeTables value)? mergeTables,
  }) {
    return transferTable?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadTables value)? loadTables,
    TResult Function(_TablesUpdated value)? tablesUpdated,
    TResult Function(_AddTable value)? addTable,
    TResult Function(_MoveTable value)? moveTable,
    TResult Function(_DeleteTable value)? deleteTable,
    TResult Function(_ToggleOccupied value)? toggleOccupied,
    TResult Function(_TransferTable value)? transferTable,
    TResult Function(_MergeTables value)? mergeTables,
    required TResult orElse(),
  }) {
    if (transferTable != null) {
      return transferTable(this);
    }
    return orElse();
  }
}

abstract class _TransferTable implements TableEvent {
  const factory _TransferTable(
      final String sourceUuid, final String targetUuid) = _$TransferTableImpl;

  String get sourceUuid;
  String get targetUuid;

  /// Create a copy of TableEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TransferTableImplCopyWith<_$TransferTableImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$MergeTablesImplCopyWith<$Res> {
  factory _$$MergeTablesImplCopyWith(
          _$MergeTablesImpl value, $Res Function(_$MergeTablesImpl) then) =
      __$$MergeTablesImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String sourceUuid, String targetUuid});
}

/// @nodoc
class __$$MergeTablesImplCopyWithImpl<$Res>
    extends _$TableEventCopyWithImpl<$Res, _$MergeTablesImpl>
    implements _$$MergeTablesImplCopyWith<$Res> {
  __$$MergeTablesImplCopyWithImpl(
      _$MergeTablesImpl _value, $Res Function(_$MergeTablesImpl) _then)
      : super(_value, _then);

  /// Create a copy of TableEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sourceUuid = null,
    Object? targetUuid = null,
  }) {
    return _then(_$MergeTablesImpl(
      null == sourceUuid
          ? _value.sourceUuid
          : sourceUuid // ignore: cast_nullable_to_non_nullable
              as String,
      null == targetUuid
          ? _value.targetUuid
          : targetUuid // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$MergeTablesImpl implements _MergeTables {
  const _$MergeTablesImpl(this.sourceUuid, this.targetUuid);

  @override
  final String sourceUuid;
  @override
  final String targetUuid;

  @override
  String toString() {
    return 'TableEvent.mergeTables(sourceUuid: $sourceUuid, targetUuid: $targetUuid)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MergeTablesImpl &&
            (identical(other.sourceUuid, sourceUuid) ||
                other.sourceUuid == sourceUuid) &&
            (identical(other.targetUuid, targetUuid) ||
                other.targetUuid == targetUuid));
  }

  @override
  int get hashCode => Object.hash(runtimeType, sourceUuid, targetUuid);

  /// Create a copy of TableEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MergeTablesImplCopyWith<_$MergeTablesImpl> get copyWith =>
      __$$MergeTablesImplCopyWithImpl<_$MergeTablesImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadTables,
    required TResult Function(List<SavvyTable> tables) tablesUpdated,
    required TResult Function(String name, double x, double y) addTable,
    required TResult Function(String uuid, double x, double y) moveTable,
    required TResult Function(String uuid) deleteTable,
    required TResult Function(String uuid, bool isOccupied) toggleOccupied,
    required TResult Function(String sourceUuid, String targetUuid)
        transferTable,
    required TResult Function(String sourceUuid, String targetUuid) mergeTables,
  }) {
    return mergeTables(sourceUuid, targetUuid);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadTables,
    TResult? Function(List<SavvyTable> tables)? tablesUpdated,
    TResult? Function(String name, double x, double y)? addTable,
    TResult? Function(String uuid, double x, double y)? moveTable,
    TResult? Function(String uuid)? deleteTable,
    TResult? Function(String uuid, bool isOccupied)? toggleOccupied,
    TResult? Function(String sourceUuid, String targetUuid)? transferTable,
    TResult? Function(String sourceUuid, String targetUuid)? mergeTables,
  }) {
    return mergeTables?.call(sourceUuid, targetUuid);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadTables,
    TResult Function(List<SavvyTable> tables)? tablesUpdated,
    TResult Function(String name, double x, double y)? addTable,
    TResult Function(String uuid, double x, double y)? moveTable,
    TResult Function(String uuid)? deleteTable,
    TResult Function(String uuid, bool isOccupied)? toggleOccupied,
    TResult Function(String sourceUuid, String targetUuid)? transferTable,
    TResult Function(String sourceUuid, String targetUuid)? mergeTables,
    required TResult orElse(),
  }) {
    if (mergeTables != null) {
      return mergeTables(sourceUuid, targetUuid);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadTables value) loadTables,
    required TResult Function(_TablesUpdated value) tablesUpdated,
    required TResult Function(_AddTable value) addTable,
    required TResult Function(_MoveTable value) moveTable,
    required TResult Function(_DeleteTable value) deleteTable,
    required TResult Function(_ToggleOccupied value) toggleOccupied,
    required TResult Function(_TransferTable value) transferTable,
    required TResult Function(_MergeTables value) mergeTables,
  }) {
    return mergeTables(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadTables value)? loadTables,
    TResult? Function(_TablesUpdated value)? tablesUpdated,
    TResult? Function(_AddTable value)? addTable,
    TResult? Function(_MoveTable value)? moveTable,
    TResult? Function(_DeleteTable value)? deleteTable,
    TResult? Function(_ToggleOccupied value)? toggleOccupied,
    TResult? Function(_TransferTable value)? transferTable,
    TResult? Function(_MergeTables value)? mergeTables,
  }) {
    return mergeTables?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadTables value)? loadTables,
    TResult Function(_TablesUpdated value)? tablesUpdated,
    TResult Function(_AddTable value)? addTable,
    TResult Function(_MoveTable value)? moveTable,
    TResult Function(_DeleteTable value)? deleteTable,
    TResult Function(_ToggleOccupied value)? toggleOccupied,
    TResult Function(_TransferTable value)? transferTable,
    TResult Function(_MergeTables value)? mergeTables,
    required TResult orElse(),
  }) {
    if (mergeTables != null) {
      return mergeTables(this);
    }
    return orElse();
  }
}

abstract class _MergeTables implements TableEvent {
  const factory _MergeTables(final String sourceUuid, final String targetUuid) =
      _$MergeTablesImpl;

  String get sourceUuid;
  String get targetUuid;

  /// Create a copy of TableEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MergeTablesImplCopyWith<_$MergeTablesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$TableState {
  List<SavvyTable> get tables => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;

  /// Create a copy of TableState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TableStateCopyWith<TableState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TableStateCopyWith<$Res> {
  factory $TableStateCopyWith(
          TableState value, $Res Function(TableState) then) =
      _$TableStateCopyWithImpl<$Res, TableState>;
  @useResult
  $Res call({List<SavvyTable> tables, bool isLoading, String? error});
}

/// @nodoc
class _$TableStateCopyWithImpl<$Res, $Val extends TableState>
    implements $TableStateCopyWith<$Res> {
  _$TableStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TableState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tables = null,
    Object? isLoading = null,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      tables: null == tables
          ? _value.tables
          : tables // ignore: cast_nullable_to_non_nullable
              as List<SavvyTable>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TableStateImplCopyWith<$Res>
    implements $TableStateCopyWith<$Res> {
  factory _$$TableStateImplCopyWith(
          _$TableStateImpl value, $Res Function(_$TableStateImpl) then) =
      __$$TableStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<SavvyTable> tables, bool isLoading, String? error});
}

/// @nodoc
class __$$TableStateImplCopyWithImpl<$Res>
    extends _$TableStateCopyWithImpl<$Res, _$TableStateImpl>
    implements _$$TableStateImplCopyWith<$Res> {
  __$$TableStateImplCopyWithImpl(
      _$TableStateImpl _value, $Res Function(_$TableStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of TableState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tables = null,
    Object? isLoading = null,
    Object? error = freezed,
  }) {
    return _then(_$TableStateImpl(
      tables: null == tables
          ? _value._tables
          : tables // ignore: cast_nullable_to_non_nullable
              as List<SavvyTable>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$TableStateImpl implements _TableState {
  const _$TableStateImpl(
      {final List<SavvyTable> tables = const [],
      this.isLoading = false,
      this.error})
      : _tables = tables;

  final List<SavvyTable> _tables;
  @override
  @JsonKey()
  List<SavvyTable> get tables {
    if (_tables is EqualUnmodifiableListView) return _tables;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tables);
  }

  @override
  @JsonKey()
  final bool isLoading;
  @override
  final String? error;

  @override
  String toString() {
    return 'TableState(tables: $tables, isLoading: $isLoading, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TableStateImpl &&
            const DeepCollectionEquality().equals(other._tables, _tables) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_tables), isLoading, error);

  /// Create a copy of TableState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TableStateImplCopyWith<_$TableStateImpl> get copyWith =>
      __$$TableStateImplCopyWithImpl<_$TableStateImpl>(this, _$identity);
}

abstract class _TableState implements TableState {
  const factory _TableState(
      {final List<SavvyTable> tables,
      final bool isLoading,
      final String? error}) = _$TableStateImpl;

  @override
  List<SavvyTable> get tables;
  @override
  bool get isLoading;
  @override
  String? get error;

  /// Create a copy of TableState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TableStateImplCopyWith<_$TableStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
