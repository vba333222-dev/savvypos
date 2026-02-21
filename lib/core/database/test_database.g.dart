// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'test_database.dart';

// ignore_for_file: type=lint
class $CategoryTableTable extends CategoryTable
    with TableInfo<$CategoryTableTable, CategoryTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CategoryTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _uuidMeta = const VerificationMeta('uuid');
  @override
  late final GeneratedColumn<String> uuid = GeneratedColumn<String>(
      'uuid', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _colorHexMeta =
      const VerificationMeta('colorHex');
  @override
  late final GeneratedColumn<String> colorHex = GeneratedColumn<String>(
      'color_hex', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _isDeletedMeta =
      const VerificationMeta('isDeleted');
  @override
  late final GeneratedColumn<bool> isDeleted = GeneratedColumn<bool>(
      'is_deleted', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_deleted" IN (0, 1))'),
      defaultValue: const Constant(false));
  @override
  List<GeneratedColumn> get $columns =>
      [id, uuid, name, colorHex, createdAt, updatedAt, isDeleted];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'category_table';
  @override
  VerificationContext validateIntegrity(Insertable<CategoryTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('uuid')) {
      context.handle(
          _uuidMeta, uuid.isAcceptableOrUnknown(data['uuid']!, _uuidMeta));
    } else if (isInserting) {
      context.missing(_uuidMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('color_hex')) {
      context.handle(_colorHexMeta,
          colorHex.isAcceptableOrUnknown(data['color_hex']!, _colorHexMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('is_deleted')) {
      context.handle(_isDeletedMeta,
          isDeleted.isAcceptableOrUnknown(data['is_deleted']!, _isDeletedMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CategoryTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CategoryTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      uuid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}uuid'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      colorHex: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}color_hex']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
      isDeleted: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_deleted'])!,
    );
  }

  @override
  $CategoryTableTable createAlias(String alias) {
    return $CategoryTableTable(attachedDatabase, alias);
  }
}

class CategoryTableData extends DataClass
    implements Insertable<CategoryTableData> {
  final int id;
  final String uuid;
  final String name;
  final String? colorHex;
  final DateTime createdAt;
  final DateTime updatedAt;
  final bool isDeleted;
  const CategoryTableData(
      {required this.id,
      required this.uuid,
      required this.name,
      this.colorHex,
      required this.createdAt,
      required this.updatedAt,
      required this.isDeleted});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['uuid'] = Variable<String>(uuid);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || colorHex != null) {
      map['color_hex'] = Variable<String>(colorHex);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['is_deleted'] = Variable<bool>(isDeleted);
    return map;
  }

  CategoryTableCompanion toCompanion(bool nullToAbsent) {
    return CategoryTableCompanion(
      id: Value(id),
      uuid: Value(uuid),
      name: Value(name),
      colorHex: colorHex == null && nullToAbsent
          ? const Value.absent()
          : Value(colorHex),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      isDeleted: Value(isDeleted),
    );
  }

  factory CategoryTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CategoryTableData(
      id: serializer.fromJson<int>(json['id']),
      uuid: serializer.fromJson<String>(json['uuid']),
      name: serializer.fromJson<String>(json['name']),
      colorHex: serializer.fromJson<String?>(json['colorHex']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      isDeleted: serializer.fromJson<bool>(json['isDeleted']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'uuid': serializer.toJson<String>(uuid),
      'name': serializer.toJson<String>(name),
      'colorHex': serializer.toJson<String?>(colorHex),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'isDeleted': serializer.toJson<bool>(isDeleted),
    };
  }

  CategoryTableData copyWith(
          {int? id,
          String? uuid,
          String? name,
          Value<String?> colorHex = const Value.absent(),
          DateTime? createdAt,
          DateTime? updatedAt,
          bool? isDeleted}) =>
      CategoryTableData(
        id: id ?? this.id,
        uuid: uuid ?? this.uuid,
        name: name ?? this.name,
        colorHex: colorHex.present ? colorHex.value : this.colorHex,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        isDeleted: isDeleted ?? this.isDeleted,
      );
  CategoryTableData copyWithCompanion(CategoryTableCompanion data) {
    return CategoryTableData(
      id: data.id.present ? data.id.value : this.id,
      uuid: data.uuid.present ? data.uuid.value : this.uuid,
      name: data.name.present ? data.name.value : this.name,
      colorHex: data.colorHex.present ? data.colorHex.value : this.colorHex,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      isDeleted: data.isDeleted.present ? data.isDeleted.value : this.isDeleted,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CategoryTableData(')
          ..write('id: $id, ')
          ..write('uuid: $uuid, ')
          ..write('name: $name, ')
          ..write('colorHex: $colorHex, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('isDeleted: $isDeleted')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, uuid, name, colorHex, createdAt, updatedAt, isDeleted);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CategoryTableData &&
          other.id == this.id &&
          other.uuid == this.uuid &&
          other.name == this.name &&
          other.colorHex == this.colorHex &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.isDeleted == this.isDeleted);
}

class CategoryTableCompanion extends UpdateCompanion<CategoryTableData> {
  final Value<int> id;
  final Value<String> uuid;
  final Value<String> name;
  final Value<String?> colorHex;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<bool> isDeleted;
  const CategoryTableCompanion({
    this.id = const Value.absent(),
    this.uuid = const Value.absent(),
    this.name = const Value.absent(),
    this.colorHex = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.isDeleted = const Value.absent(),
  });
  CategoryTableCompanion.insert({
    this.id = const Value.absent(),
    required String uuid,
    required String name,
    this.colorHex = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
    this.isDeleted = const Value.absent(),
  })  : uuid = Value(uuid),
        name = Value(name),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt);
  static Insertable<CategoryTableData> custom({
    Expression<int>? id,
    Expression<String>? uuid,
    Expression<String>? name,
    Expression<String>? colorHex,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<bool>? isDeleted,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (uuid != null) 'uuid': uuid,
      if (name != null) 'name': name,
      if (colorHex != null) 'color_hex': colorHex,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (isDeleted != null) 'is_deleted': isDeleted,
    });
  }

  CategoryTableCompanion copyWith(
      {Value<int>? id,
      Value<String>? uuid,
      Value<String>? name,
      Value<String?>? colorHex,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<bool>? isDeleted}) {
    return CategoryTableCompanion(
      id: id ?? this.id,
      uuid: uuid ?? this.uuid,
      name: name ?? this.name,
      colorHex: colorHex ?? this.colorHex,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      isDeleted: isDeleted ?? this.isDeleted,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (uuid.present) {
      map['uuid'] = Variable<String>(uuid.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (colorHex.present) {
      map['color_hex'] = Variable<String>(colorHex.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (isDeleted.present) {
      map['is_deleted'] = Variable<bool>(isDeleted.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CategoryTableCompanion(')
          ..write('id: $id, ')
          ..write('uuid: $uuid, ')
          ..write('name: $name, ')
          ..write('colorHex: $colorHex, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('isDeleted: $isDeleted')
          ..write(')'))
        .toString();
  }
}

class $InventoryLedgerTableTable extends InventoryLedgerTable
    with TableInfo<$InventoryLedgerTableTable, InventoryLedgerTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $InventoryLedgerTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _productUuidMeta =
      const VerificationMeta('productUuid');
  @override
  late final GeneratedColumn<String> productUuid = GeneratedColumn<String>(
      'product_uuid', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _quantityChangeMeta =
      const VerificationMeta('quantityChange');
  @override
  late final GeneratedColumn<double> quantityChange = GeneratedColumn<double>(
      'quantity_change', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _referenceIdMeta =
      const VerificationMeta('referenceId');
  @override
  late final GeneratedColumn<String> referenceId = GeneratedColumn<String>(
      'reference_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
      'type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _timestampMeta =
      const VerificationMeta('timestamp');
  @override
  late final GeneratedColumn<DateTime> timestamp = GeneratedColumn<DateTime>(
      'timestamp', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _isSyncedMeta =
      const VerificationMeta('isSynced');
  @override
  late final GeneratedColumn<bool> isSynced = GeneratedColumn<bool>(
      'is_synced', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_synced" IN (0, 1))'),
      defaultValue: const Constant(false));
  @override
  List<GeneratedColumn> get $columns =>
      [id, productUuid, quantityChange, referenceId, type, timestamp, isSynced];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'inventory_ledger_table';
  @override
  VerificationContext validateIntegrity(
      Insertable<InventoryLedgerTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('product_uuid')) {
      context.handle(
          _productUuidMeta,
          productUuid.isAcceptableOrUnknown(
              data['product_uuid']!, _productUuidMeta));
    } else if (isInserting) {
      context.missing(_productUuidMeta);
    }
    if (data.containsKey('quantity_change')) {
      context.handle(
          _quantityChangeMeta,
          quantityChange.isAcceptableOrUnknown(
              data['quantity_change']!, _quantityChangeMeta));
    } else if (isInserting) {
      context.missing(_quantityChangeMeta);
    }
    if (data.containsKey('reference_id')) {
      context.handle(
          _referenceIdMeta,
          referenceId.isAcceptableOrUnknown(
              data['reference_id']!, _referenceIdMeta));
    } else if (isInserting) {
      context.missing(_referenceIdMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
          _typeMeta, type.isAcceptableOrUnknown(data['type']!, _typeMeta));
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('timestamp')) {
      context.handle(_timestampMeta,
          timestamp.isAcceptableOrUnknown(data['timestamp']!, _timestampMeta));
    } else if (isInserting) {
      context.missing(_timestampMeta);
    }
    if (data.containsKey('is_synced')) {
      context.handle(_isSyncedMeta,
          isSynced.isAcceptableOrUnknown(data['is_synced']!, _isSyncedMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  InventoryLedgerTableData map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return InventoryLedgerTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      productUuid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}product_uuid'])!,
      quantityChange: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}quantity_change'])!,
      referenceId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}reference_id'])!,
      type: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}type'])!,
      timestamp: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}timestamp'])!,
      isSynced: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_synced'])!,
    );
  }

  @override
  $InventoryLedgerTableTable createAlias(String alias) {
    return $InventoryLedgerTableTable(attachedDatabase, alias);
  }
}

class InventoryLedgerTableData extends DataClass
    implements Insertable<InventoryLedgerTableData> {
  final int id;
  final String productUuid;
  final double quantityChange;
  final String referenceId;
  final String type;
  final DateTime timestamp;
  final bool isSynced;
  const InventoryLedgerTableData(
      {required this.id,
      required this.productUuid,
      required this.quantityChange,
      required this.referenceId,
      required this.type,
      required this.timestamp,
      required this.isSynced});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['product_uuid'] = Variable<String>(productUuid);
    map['quantity_change'] = Variable<double>(quantityChange);
    map['reference_id'] = Variable<String>(referenceId);
    map['type'] = Variable<String>(type);
    map['timestamp'] = Variable<DateTime>(timestamp);
    map['is_synced'] = Variable<bool>(isSynced);
    return map;
  }

  InventoryLedgerTableCompanion toCompanion(bool nullToAbsent) {
    return InventoryLedgerTableCompanion(
      id: Value(id),
      productUuid: Value(productUuid),
      quantityChange: Value(quantityChange),
      referenceId: Value(referenceId),
      type: Value(type),
      timestamp: Value(timestamp),
      isSynced: Value(isSynced),
    );
  }

  factory InventoryLedgerTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return InventoryLedgerTableData(
      id: serializer.fromJson<int>(json['id']),
      productUuid: serializer.fromJson<String>(json['productUuid']),
      quantityChange: serializer.fromJson<double>(json['quantityChange']),
      referenceId: serializer.fromJson<String>(json['referenceId']),
      type: serializer.fromJson<String>(json['type']),
      timestamp: serializer.fromJson<DateTime>(json['timestamp']),
      isSynced: serializer.fromJson<bool>(json['isSynced']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'productUuid': serializer.toJson<String>(productUuid),
      'quantityChange': serializer.toJson<double>(quantityChange),
      'referenceId': serializer.toJson<String>(referenceId),
      'type': serializer.toJson<String>(type),
      'timestamp': serializer.toJson<DateTime>(timestamp),
      'isSynced': serializer.toJson<bool>(isSynced),
    };
  }

  InventoryLedgerTableData copyWith(
          {int? id,
          String? productUuid,
          double? quantityChange,
          String? referenceId,
          String? type,
          DateTime? timestamp,
          bool? isSynced}) =>
      InventoryLedgerTableData(
        id: id ?? this.id,
        productUuid: productUuid ?? this.productUuid,
        quantityChange: quantityChange ?? this.quantityChange,
        referenceId: referenceId ?? this.referenceId,
        type: type ?? this.type,
        timestamp: timestamp ?? this.timestamp,
        isSynced: isSynced ?? this.isSynced,
      );
  InventoryLedgerTableData copyWithCompanion(
      InventoryLedgerTableCompanion data) {
    return InventoryLedgerTableData(
      id: data.id.present ? data.id.value : this.id,
      productUuid:
          data.productUuid.present ? data.productUuid.value : this.productUuid,
      quantityChange: data.quantityChange.present
          ? data.quantityChange.value
          : this.quantityChange,
      referenceId:
          data.referenceId.present ? data.referenceId.value : this.referenceId,
      type: data.type.present ? data.type.value : this.type,
      timestamp: data.timestamp.present ? data.timestamp.value : this.timestamp,
      isSynced: data.isSynced.present ? data.isSynced.value : this.isSynced,
    );
  }

  @override
  String toString() {
    return (StringBuffer('InventoryLedgerTableData(')
          ..write('id: $id, ')
          ..write('productUuid: $productUuid, ')
          ..write('quantityChange: $quantityChange, ')
          ..write('referenceId: $referenceId, ')
          ..write('type: $type, ')
          ..write('timestamp: $timestamp, ')
          ..write('isSynced: $isSynced')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, productUuid, quantityChange, referenceId, type, timestamp, isSynced);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is InventoryLedgerTableData &&
          other.id == this.id &&
          other.productUuid == this.productUuid &&
          other.quantityChange == this.quantityChange &&
          other.referenceId == this.referenceId &&
          other.type == this.type &&
          other.timestamp == this.timestamp &&
          other.isSynced == this.isSynced);
}

class InventoryLedgerTableCompanion
    extends UpdateCompanion<InventoryLedgerTableData> {
  final Value<int> id;
  final Value<String> productUuid;
  final Value<double> quantityChange;
  final Value<String> referenceId;
  final Value<String> type;
  final Value<DateTime> timestamp;
  final Value<bool> isSynced;
  const InventoryLedgerTableCompanion({
    this.id = const Value.absent(),
    this.productUuid = const Value.absent(),
    this.quantityChange = const Value.absent(),
    this.referenceId = const Value.absent(),
    this.type = const Value.absent(),
    this.timestamp = const Value.absent(),
    this.isSynced = const Value.absent(),
  });
  InventoryLedgerTableCompanion.insert({
    this.id = const Value.absent(),
    required String productUuid,
    required double quantityChange,
    required String referenceId,
    required String type,
    required DateTime timestamp,
    this.isSynced = const Value.absent(),
  })  : productUuid = Value(productUuid),
        quantityChange = Value(quantityChange),
        referenceId = Value(referenceId),
        type = Value(type),
        timestamp = Value(timestamp);
  static Insertable<InventoryLedgerTableData> custom({
    Expression<int>? id,
    Expression<String>? productUuid,
    Expression<double>? quantityChange,
    Expression<String>? referenceId,
    Expression<String>? type,
    Expression<DateTime>? timestamp,
    Expression<bool>? isSynced,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (productUuid != null) 'product_uuid': productUuid,
      if (quantityChange != null) 'quantity_change': quantityChange,
      if (referenceId != null) 'reference_id': referenceId,
      if (type != null) 'type': type,
      if (timestamp != null) 'timestamp': timestamp,
      if (isSynced != null) 'is_synced': isSynced,
    });
  }

  InventoryLedgerTableCompanion copyWith(
      {Value<int>? id,
      Value<String>? productUuid,
      Value<double>? quantityChange,
      Value<String>? referenceId,
      Value<String>? type,
      Value<DateTime>? timestamp,
      Value<bool>? isSynced}) {
    return InventoryLedgerTableCompanion(
      id: id ?? this.id,
      productUuid: productUuid ?? this.productUuid,
      quantityChange: quantityChange ?? this.quantityChange,
      referenceId: referenceId ?? this.referenceId,
      type: type ?? this.type,
      timestamp: timestamp ?? this.timestamp,
      isSynced: isSynced ?? this.isSynced,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (productUuid.present) {
      map['product_uuid'] = Variable<String>(productUuid.value);
    }
    if (quantityChange.present) {
      map['quantity_change'] = Variable<double>(quantityChange.value);
    }
    if (referenceId.present) {
      map['reference_id'] = Variable<String>(referenceId.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (timestamp.present) {
      map['timestamp'] = Variable<DateTime>(timestamp.value);
    }
    if (isSynced.present) {
      map['is_synced'] = Variable<bool>(isSynced.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('InventoryLedgerTableCompanion(')
          ..write('id: $id, ')
          ..write('productUuid: $productUuid, ')
          ..write('quantityChange: $quantityChange, ')
          ..write('referenceId: $referenceId, ')
          ..write('type: $type, ')
          ..write('timestamp: $timestamp, ')
          ..write('isSynced: $isSynced')
          ..write(')'))
        .toString();
  }
}

class $TimeEntryTableTable extends TimeEntryTable
    with TableInfo<$TimeEntryTableTable, TimeEntryTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TimeEntryTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _uuidMeta = const VerificationMeta('uuid');
  @override
  late final GeneratedColumn<String> uuid = GeneratedColumn<String>(
      'uuid', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'));
  static const VerificationMeta _employeeUuidMeta =
      const VerificationMeta('employeeUuid');
  @override
  late final GeneratedColumn<String> employeeUuid = GeneratedColumn<String>(
      'employee_uuid', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _clockInMeta =
      const VerificationMeta('clockIn');
  @override
  late final GeneratedColumn<DateTime> clockIn = GeneratedColumn<DateTime>(
      'clock_in', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _clockOutMeta =
      const VerificationMeta('clockOut');
  @override
  late final GeneratedColumn<DateTime> clockOut = GeneratedColumn<DateTime>(
      'clock_out', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _breakStartMeta =
      const VerificationMeta('breakStart');
  @override
  late final GeneratedColumn<DateTime> breakStart = GeneratedColumn<DateTime>(
      'break_start', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _breakEndMeta =
      const VerificationMeta('breakEnd');
  @override
  late final GeneratedColumn<DateTime> breakEnd = GeneratedColumn<DateTime>(
      'break_end', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _regularHoursMeta =
      const VerificationMeta('regularHours');
  @override
  late final GeneratedColumn<double> regularHours = GeneratedColumn<double>(
      'regular_hours', aliasedName, false,
      type: DriftSqlType.double,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _overtimeHoursMeta =
      const VerificationMeta('overtimeHours');
  @override
  late final GeneratedColumn<double> overtimeHours = GeneratedColumn<double>(
      'overtime_hours', aliasedName, false,
      type: DriftSqlType.double,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _breakMinutesMeta =
      const VerificationMeta('breakMinutes');
  @override
  late final GeneratedColumn<double> breakMinutes = GeneratedColumn<double>(
      'break_minutes', aliasedName, false,
      type: DriftSqlType.double,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _cashTipsMeta =
      const VerificationMeta('cashTips');
  @override
  late final GeneratedColumn<double> cashTips = GeneratedColumn<double>(
      'cash_tips', aliasedName, false,
      type: DriftSqlType.double,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _cardTipsMeta =
      const VerificationMeta('cardTips');
  @override
  late final GeneratedColumn<double> cardTips = GeneratedColumn<double>(
      'card_tips', aliasedName, false,
      type: DriftSqlType.double,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _shiftUuidMeta =
      const VerificationMeta('shiftUuid');
  @override
  late final GeneratedColumn<String> shiftUuid = GeneratedColumn<String>(
      'shift_uuid', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
      'notes', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _isApprovedMeta =
      const VerificationMeta('isApproved');
  @override
  late final GeneratedColumn<bool> isApproved = GeneratedColumn<bool>(
      'is_approved', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_approved" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _approvedByMeta =
      const VerificationMeta('approvedBy');
  @override
  late final GeneratedColumn<String> approvedBy = GeneratedColumn<String>(
      'approved_by', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
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
        createdAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'time_entry_table';
  @override
  VerificationContext validateIntegrity(Insertable<TimeEntryTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('uuid')) {
      context.handle(
          _uuidMeta, uuid.isAcceptableOrUnknown(data['uuid']!, _uuidMeta));
    } else if (isInserting) {
      context.missing(_uuidMeta);
    }
    if (data.containsKey('employee_uuid')) {
      context.handle(
          _employeeUuidMeta,
          employeeUuid.isAcceptableOrUnknown(
              data['employee_uuid']!, _employeeUuidMeta));
    } else if (isInserting) {
      context.missing(_employeeUuidMeta);
    }
    if (data.containsKey('clock_in')) {
      context.handle(_clockInMeta,
          clockIn.isAcceptableOrUnknown(data['clock_in']!, _clockInMeta));
    } else if (isInserting) {
      context.missing(_clockInMeta);
    }
    if (data.containsKey('clock_out')) {
      context.handle(_clockOutMeta,
          clockOut.isAcceptableOrUnknown(data['clock_out']!, _clockOutMeta));
    }
    if (data.containsKey('break_start')) {
      context.handle(
          _breakStartMeta,
          breakStart.isAcceptableOrUnknown(
              data['break_start']!, _breakStartMeta));
    }
    if (data.containsKey('break_end')) {
      context.handle(_breakEndMeta,
          breakEnd.isAcceptableOrUnknown(data['break_end']!, _breakEndMeta));
    }
    if (data.containsKey('regular_hours')) {
      context.handle(
          _regularHoursMeta,
          regularHours.isAcceptableOrUnknown(
              data['regular_hours']!, _regularHoursMeta));
    }
    if (data.containsKey('overtime_hours')) {
      context.handle(
          _overtimeHoursMeta,
          overtimeHours.isAcceptableOrUnknown(
              data['overtime_hours']!, _overtimeHoursMeta));
    }
    if (data.containsKey('break_minutes')) {
      context.handle(
          _breakMinutesMeta,
          breakMinutes.isAcceptableOrUnknown(
              data['break_minutes']!, _breakMinutesMeta));
    }
    if (data.containsKey('cash_tips')) {
      context.handle(_cashTipsMeta,
          cashTips.isAcceptableOrUnknown(data['cash_tips']!, _cashTipsMeta));
    }
    if (data.containsKey('card_tips')) {
      context.handle(_cardTipsMeta,
          cardTips.isAcceptableOrUnknown(data['card_tips']!, _cardTipsMeta));
    }
    if (data.containsKey('shift_uuid')) {
      context.handle(_shiftUuidMeta,
          shiftUuid.isAcceptableOrUnknown(data['shift_uuid']!, _shiftUuidMeta));
    }
    if (data.containsKey('notes')) {
      context.handle(
          _notesMeta, notes.isAcceptableOrUnknown(data['notes']!, _notesMeta));
    }
    if (data.containsKey('is_approved')) {
      context.handle(
          _isApprovedMeta,
          isApproved.isAcceptableOrUnknown(
              data['is_approved']!, _isApprovedMeta));
    }
    if (data.containsKey('approved_by')) {
      context.handle(
          _approvedByMeta,
          approvedBy.isAcceptableOrUnknown(
              data['approved_by']!, _approvedByMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TimeEntryTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TimeEntryTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      uuid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}uuid'])!,
      employeeUuid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}employee_uuid'])!,
      clockIn: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}clock_in'])!,
      clockOut: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}clock_out']),
      breakStart: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}break_start']),
      breakEnd: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}break_end']),
      regularHours: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}regular_hours'])!,
      overtimeHours: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}overtime_hours'])!,
      breakMinutes: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}break_minutes'])!,
      cashTips: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}cash_tips'])!,
      cardTips: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}card_tips'])!,
      shiftUuid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}shift_uuid']),
      notes: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}notes']),
      isApproved: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_approved'])!,
      approvedBy: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}approved_by']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
    );
  }

  @override
  $TimeEntryTableTable createAlias(String alias) {
    return $TimeEntryTableTable(attachedDatabase, alias);
  }
}

class TimeEntryTableData extends DataClass
    implements Insertable<TimeEntryTableData> {
  final int id;
  final String uuid;
  final String employeeUuid;
  final DateTime clockIn;
  final DateTime? clockOut;
  final DateTime? breakStart;
  final DateTime? breakEnd;
  final double regularHours;
  final double overtimeHours;
  final double breakMinutes;
  final double cashTips;
  final double cardTips;
  final String? shiftUuid;
  final String? notes;
  final bool isApproved;
  final String? approvedBy;
  final DateTime createdAt;
  const TimeEntryTableData(
      {required this.id,
      required this.uuid,
      required this.employeeUuid,
      required this.clockIn,
      this.clockOut,
      this.breakStart,
      this.breakEnd,
      required this.regularHours,
      required this.overtimeHours,
      required this.breakMinutes,
      required this.cashTips,
      required this.cardTips,
      this.shiftUuid,
      this.notes,
      required this.isApproved,
      this.approvedBy,
      required this.createdAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['uuid'] = Variable<String>(uuid);
    map['employee_uuid'] = Variable<String>(employeeUuid);
    map['clock_in'] = Variable<DateTime>(clockIn);
    if (!nullToAbsent || clockOut != null) {
      map['clock_out'] = Variable<DateTime>(clockOut);
    }
    if (!nullToAbsent || breakStart != null) {
      map['break_start'] = Variable<DateTime>(breakStart);
    }
    if (!nullToAbsent || breakEnd != null) {
      map['break_end'] = Variable<DateTime>(breakEnd);
    }
    map['regular_hours'] = Variable<double>(regularHours);
    map['overtime_hours'] = Variable<double>(overtimeHours);
    map['break_minutes'] = Variable<double>(breakMinutes);
    map['cash_tips'] = Variable<double>(cashTips);
    map['card_tips'] = Variable<double>(cardTips);
    if (!nullToAbsent || shiftUuid != null) {
      map['shift_uuid'] = Variable<String>(shiftUuid);
    }
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    map['is_approved'] = Variable<bool>(isApproved);
    if (!nullToAbsent || approvedBy != null) {
      map['approved_by'] = Variable<String>(approvedBy);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  TimeEntryTableCompanion toCompanion(bool nullToAbsent) {
    return TimeEntryTableCompanion(
      id: Value(id),
      uuid: Value(uuid),
      employeeUuid: Value(employeeUuid),
      clockIn: Value(clockIn),
      clockOut: clockOut == null && nullToAbsent
          ? const Value.absent()
          : Value(clockOut),
      breakStart: breakStart == null && nullToAbsent
          ? const Value.absent()
          : Value(breakStart),
      breakEnd: breakEnd == null && nullToAbsent
          ? const Value.absent()
          : Value(breakEnd),
      regularHours: Value(regularHours),
      overtimeHours: Value(overtimeHours),
      breakMinutes: Value(breakMinutes),
      cashTips: Value(cashTips),
      cardTips: Value(cardTips),
      shiftUuid: shiftUuid == null && nullToAbsent
          ? const Value.absent()
          : Value(shiftUuid),
      notes:
          notes == null && nullToAbsent ? const Value.absent() : Value(notes),
      isApproved: Value(isApproved),
      approvedBy: approvedBy == null && nullToAbsent
          ? const Value.absent()
          : Value(approvedBy),
      createdAt: Value(createdAt),
    );
  }

  factory TimeEntryTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TimeEntryTableData(
      id: serializer.fromJson<int>(json['id']),
      uuid: serializer.fromJson<String>(json['uuid']),
      employeeUuid: serializer.fromJson<String>(json['employeeUuid']),
      clockIn: serializer.fromJson<DateTime>(json['clockIn']),
      clockOut: serializer.fromJson<DateTime?>(json['clockOut']),
      breakStart: serializer.fromJson<DateTime?>(json['breakStart']),
      breakEnd: serializer.fromJson<DateTime?>(json['breakEnd']),
      regularHours: serializer.fromJson<double>(json['regularHours']),
      overtimeHours: serializer.fromJson<double>(json['overtimeHours']),
      breakMinutes: serializer.fromJson<double>(json['breakMinutes']),
      cashTips: serializer.fromJson<double>(json['cashTips']),
      cardTips: serializer.fromJson<double>(json['cardTips']),
      shiftUuid: serializer.fromJson<String?>(json['shiftUuid']),
      notes: serializer.fromJson<String?>(json['notes']),
      isApproved: serializer.fromJson<bool>(json['isApproved']),
      approvedBy: serializer.fromJson<String?>(json['approvedBy']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'uuid': serializer.toJson<String>(uuid),
      'employeeUuid': serializer.toJson<String>(employeeUuid),
      'clockIn': serializer.toJson<DateTime>(clockIn),
      'clockOut': serializer.toJson<DateTime?>(clockOut),
      'breakStart': serializer.toJson<DateTime?>(breakStart),
      'breakEnd': serializer.toJson<DateTime?>(breakEnd),
      'regularHours': serializer.toJson<double>(regularHours),
      'overtimeHours': serializer.toJson<double>(overtimeHours),
      'breakMinutes': serializer.toJson<double>(breakMinutes),
      'cashTips': serializer.toJson<double>(cashTips),
      'cardTips': serializer.toJson<double>(cardTips),
      'shiftUuid': serializer.toJson<String?>(shiftUuid),
      'notes': serializer.toJson<String?>(notes),
      'isApproved': serializer.toJson<bool>(isApproved),
      'approvedBy': serializer.toJson<String?>(approvedBy),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  TimeEntryTableData copyWith(
          {int? id,
          String? uuid,
          String? employeeUuid,
          DateTime? clockIn,
          Value<DateTime?> clockOut = const Value.absent(),
          Value<DateTime?> breakStart = const Value.absent(),
          Value<DateTime?> breakEnd = const Value.absent(),
          double? regularHours,
          double? overtimeHours,
          double? breakMinutes,
          double? cashTips,
          double? cardTips,
          Value<String?> shiftUuid = const Value.absent(),
          Value<String?> notes = const Value.absent(),
          bool? isApproved,
          Value<String?> approvedBy = const Value.absent(),
          DateTime? createdAt}) =>
      TimeEntryTableData(
        id: id ?? this.id,
        uuid: uuid ?? this.uuid,
        employeeUuid: employeeUuid ?? this.employeeUuid,
        clockIn: clockIn ?? this.clockIn,
        clockOut: clockOut.present ? clockOut.value : this.clockOut,
        breakStart: breakStart.present ? breakStart.value : this.breakStart,
        breakEnd: breakEnd.present ? breakEnd.value : this.breakEnd,
        regularHours: regularHours ?? this.regularHours,
        overtimeHours: overtimeHours ?? this.overtimeHours,
        breakMinutes: breakMinutes ?? this.breakMinutes,
        cashTips: cashTips ?? this.cashTips,
        cardTips: cardTips ?? this.cardTips,
        shiftUuid: shiftUuid.present ? shiftUuid.value : this.shiftUuid,
        notes: notes.present ? notes.value : this.notes,
        isApproved: isApproved ?? this.isApproved,
        approvedBy: approvedBy.present ? approvedBy.value : this.approvedBy,
        createdAt: createdAt ?? this.createdAt,
      );
  TimeEntryTableData copyWithCompanion(TimeEntryTableCompanion data) {
    return TimeEntryTableData(
      id: data.id.present ? data.id.value : this.id,
      uuid: data.uuid.present ? data.uuid.value : this.uuid,
      employeeUuid: data.employeeUuid.present
          ? data.employeeUuid.value
          : this.employeeUuid,
      clockIn: data.clockIn.present ? data.clockIn.value : this.clockIn,
      clockOut: data.clockOut.present ? data.clockOut.value : this.clockOut,
      breakStart:
          data.breakStart.present ? data.breakStart.value : this.breakStart,
      breakEnd: data.breakEnd.present ? data.breakEnd.value : this.breakEnd,
      regularHours: data.regularHours.present
          ? data.regularHours.value
          : this.regularHours,
      overtimeHours: data.overtimeHours.present
          ? data.overtimeHours.value
          : this.overtimeHours,
      breakMinutes: data.breakMinutes.present
          ? data.breakMinutes.value
          : this.breakMinutes,
      cashTips: data.cashTips.present ? data.cashTips.value : this.cashTips,
      cardTips: data.cardTips.present ? data.cardTips.value : this.cardTips,
      shiftUuid: data.shiftUuid.present ? data.shiftUuid.value : this.shiftUuid,
      notes: data.notes.present ? data.notes.value : this.notes,
      isApproved:
          data.isApproved.present ? data.isApproved.value : this.isApproved,
      approvedBy:
          data.approvedBy.present ? data.approvedBy.value : this.approvedBy,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TimeEntryTableData(')
          ..write('id: $id, ')
          ..write('uuid: $uuid, ')
          ..write('employeeUuid: $employeeUuid, ')
          ..write('clockIn: $clockIn, ')
          ..write('clockOut: $clockOut, ')
          ..write('breakStart: $breakStart, ')
          ..write('breakEnd: $breakEnd, ')
          ..write('regularHours: $regularHours, ')
          ..write('overtimeHours: $overtimeHours, ')
          ..write('breakMinutes: $breakMinutes, ')
          ..write('cashTips: $cashTips, ')
          ..write('cardTips: $cardTips, ')
          ..write('shiftUuid: $shiftUuid, ')
          ..write('notes: $notes, ')
          ..write('isApproved: $isApproved, ')
          ..write('approvedBy: $approvedBy, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
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
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TimeEntryTableData &&
          other.id == this.id &&
          other.uuid == this.uuid &&
          other.employeeUuid == this.employeeUuid &&
          other.clockIn == this.clockIn &&
          other.clockOut == this.clockOut &&
          other.breakStart == this.breakStart &&
          other.breakEnd == this.breakEnd &&
          other.regularHours == this.regularHours &&
          other.overtimeHours == this.overtimeHours &&
          other.breakMinutes == this.breakMinutes &&
          other.cashTips == this.cashTips &&
          other.cardTips == this.cardTips &&
          other.shiftUuid == this.shiftUuid &&
          other.notes == this.notes &&
          other.isApproved == this.isApproved &&
          other.approvedBy == this.approvedBy &&
          other.createdAt == this.createdAt);
}

class TimeEntryTableCompanion extends UpdateCompanion<TimeEntryTableData> {
  final Value<int> id;
  final Value<String> uuid;
  final Value<String> employeeUuid;
  final Value<DateTime> clockIn;
  final Value<DateTime?> clockOut;
  final Value<DateTime?> breakStart;
  final Value<DateTime?> breakEnd;
  final Value<double> regularHours;
  final Value<double> overtimeHours;
  final Value<double> breakMinutes;
  final Value<double> cashTips;
  final Value<double> cardTips;
  final Value<String?> shiftUuid;
  final Value<String?> notes;
  final Value<bool> isApproved;
  final Value<String?> approvedBy;
  final Value<DateTime> createdAt;
  const TimeEntryTableCompanion({
    this.id = const Value.absent(),
    this.uuid = const Value.absent(),
    this.employeeUuid = const Value.absent(),
    this.clockIn = const Value.absent(),
    this.clockOut = const Value.absent(),
    this.breakStart = const Value.absent(),
    this.breakEnd = const Value.absent(),
    this.regularHours = const Value.absent(),
    this.overtimeHours = const Value.absent(),
    this.breakMinutes = const Value.absent(),
    this.cashTips = const Value.absent(),
    this.cardTips = const Value.absent(),
    this.shiftUuid = const Value.absent(),
    this.notes = const Value.absent(),
    this.isApproved = const Value.absent(),
    this.approvedBy = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  TimeEntryTableCompanion.insert({
    this.id = const Value.absent(),
    required String uuid,
    required String employeeUuid,
    required DateTime clockIn,
    this.clockOut = const Value.absent(),
    this.breakStart = const Value.absent(),
    this.breakEnd = const Value.absent(),
    this.regularHours = const Value.absent(),
    this.overtimeHours = const Value.absent(),
    this.breakMinutes = const Value.absent(),
    this.cashTips = const Value.absent(),
    this.cardTips = const Value.absent(),
    this.shiftUuid = const Value.absent(),
    this.notes = const Value.absent(),
    this.isApproved = const Value.absent(),
    this.approvedBy = const Value.absent(),
    required DateTime createdAt,
  })  : uuid = Value(uuid),
        employeeUuid = Value(employeeUuid),
        clockIn = Value(clockIn),
        createdAt = Value(createdAt);
  static Insertable<TimeEntryTableData> custom({
    Expression<int>? id,
    Expression<String>? uuid,
    Expression<String>? employeeUuid,
    Expression<DateTime>? clockIn,
    Expression<DateTime>? clockOut,
    Expression<DateTime>? breakStart,
    Expression<DateTime>? breakEnd,
    Expression<double>? regularHours,
    Expression<double>? overtimeHours,
    Expression<double>? breakMinutes,
    Expression<double>? cashTips,
    Expression<double>? cardTips,
    Expression<String>? shiftUuid,
    Expression<String>? notes,
    Expression<bool>? isApproved,
    Expression<String>? approvedBy,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (uuid != null) 'uuid': uuid,
      if (employeeUuid != null) 'employee_uuid': employeeUuid,
      if (clockIn != null) 'clock_in': clockIn,
      if (clockOut != null) 'clock_out': clockOut,
      if (breakStart != null) 'break_start': breakStart,
      if (breakEnd != null) 'break_end': breakEnd,
      if (regularHours != null) 'regular_hours': regularHours,
      if (overtimeHours != null) 'overtime_hours': overtimeHours,
      if (breakMinutes != null) 'break_minutes': breakMinutes,
      if (cashTips != null) 'cash_tips': cashTips,
      if (cardTips != null) 'card_tips': cardTips,
      if (shiftUuid != null) 'shift_uuid': shiftUuid,
      if (notes != null) 'notes': notes,
      if (isApproved != null) 'is_approved': isApproved,
      if (approvedBy != null) 'approved_by': approvedBy,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  TimeEntryTableCompanion copyWith(
      {Value<int>? id,
      Value<String>? uuid,
      Value<String>? employeeUuid,
      Value<DateTime>? clockIn,
      Value<DateTime?>? clockOut,
      Value<DateTime?>? breakStart,
      Value<DateTime?>? breakEnd,
      Value<double>? regularHours,
      Value<double>? overtimeHours,
      Value<double>? breakMinutes,
      Value<double>? cashTips,
      Value<double>? cardTips,
      Value<String?>? shiftUuid,
      Value<String?>? notes,
      Value<bool>? isApproved,
      Value<String?>? approvedBy,
      Value<DateTime>? createdAt}) {
    return TimeEntryTableCompanion(
      id: id ?? this.id,
      uuid: uuid ?? this.uuid,
      employeeUuid: employeeUuid ?? this.employeeUuid,
      clockIn: clockIn ?? this.clockIn,
      clockOut: clockOut ?? this.clockOut,
      breakStart: breakStart ?? this.breakStart,
      breakEnd: breakEnd ?? this.breakEnd,
      regularHours: regularHours ?? this.regularHours,
      overtimeHours: overtimeHours ?? this.overtimeHours,
      breakMinutes: breakMinutes ?? this.breakMinutes,
      cashTips: cashTips ?? this.cashTips,
      cardTips: cardTips ?? this.cardTips,
      shiftUuid: shiftUuid ?? this.shiftUuid,
      notes: notes ?? this.notes,
      isApproved: isApproved ?? this.isApproved,
      approvedBy: approvedBy ?? this.approvedBy,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (uuid.present) {
      map['uuid'] = Variable<String>(uuid.value);
    }
    if (employeeUuid.present) {
      map['employee_uuid'] = Variable<String>(employeeUuid.value);
    }
    if (clockIn.present) {
      map['clock_in'] = Variable<DateTime>(clockIn.value);
    }
    if (clockOut.present) {
      map['clock_out'] = Variable<DateTime>(clockOut.value);
    }
    if (breakStart.present) {
      map['break_start'] = Variable<DateTime>(breakStart.value);
    }
    if (breakEnd.present) {
      map['break_end'] = Variable<DateTime>(breakEnd.value);
    }
    if (regularHours.present) {
      map['regular_hours'] = Variable<double>(regularHours.value);
    }
    if (overtimeHours.present) {
      map['overtime_hours'] = Variable<double>(overtimeHours.value);
    }
    if (breakMinutes.present) {
      map['break_minutes'] = Variable<double>(breakMinutes.value);
    }
    if (cashTips.present) {
      map['cash_tips'] = Variable<double>(cashTips.value);
    }
    if (cardTips.present) {
      map['card_tips'] = Variable<double>(cardTips.value);
    }
    if (shiftUuid.present) {
      map['shift_uuid'] = Variable<String>(shiftUuid.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (isApproved.present) {
      map['is_approved'] = Variable<bool>(isApproved.value);
    }
    if (approvedBy.present) {
      map['approved_by'] = Variable<String>(approvedBy.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TimeEntryTableCompanion(')
          ..write('id: $id, ')
          ..write('uuid: $uuid, ')
          ..write('employeeUuid: $employeeUuid, ')
          ..write('clockIn: $clockIn, ')
          ..write('clockOut: $clockOut, ')
          ..write('breakStart: $breakStart, ')
          ..write('breakEnd: $breakEnd, ')
          ..write('regularHours: $regularHours, ')
          ..write('overtimeHours: $overtimeHours, ')
          ..write('breakMinutes: $breakMinutes, ')
          ..write('cashTips: $cashTips, ')
          ..write('cardTips: $cardTips, ')
          ..write('shiftUuid: $shiftUuid, ')
          ..write('notes: $notes, ')
          ..write('isApproved: $isApproved, ')
          ..write('approvedBy: $approvedBy, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $GiftCardTableTable extends GiftCardTable
    with TableInfo<$GiftCardTableTable, GiftCardTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $GiftCardTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _uuidMeta = const VerificationMeta('uuid');
  @override
  late final GeneratedColumn<String> uuid = GeneratedColumn<String>(
      'uuid', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'));
  static const VerificationMeta _cardNumberMeta =
      const VerificationMeta('cardNumber');
  @override
  late final GeneratedColumn<String> cardNumber = GeneratedColumn<String>(
      'card_number', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'));
  static const VerificationMeta _barcodeMeta =
      const VerificationMeta('barcode');
  @override
  late final GeneratedColumn<String> barcode = GeneratedColumn<String>(
      'barcode', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _initialValueMeta =
      const VerificationMeta('initialValue');
  @override
  late final GeneratedColumn<double> initialValue = GeneratedColumn<double>(
      'initial_value', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _currentBalanceMeta =
      const VerificationMeta('currentBalance');
  @override
  late final GeneratedColumn<double> currentBalance = GeneratedColumn<double>(
      'current_balance', aliasedName, false,
      type: DriftSqlType.double,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _customerUuidMeta =
      const VerificationMeta('customerUuid');
  @override
  late final GeneratedColumn<String> customerUuid = GeneratedColumn<String>(
      'customer_uuid', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _customerNameMeta =
      const VerificationMeta('customerName');
  @override
  late final GeneratedColumn<String> customerName = GeneratedColumn<String>(
      'customer_name', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _customerEmailMeta =
      const VerificationMeta('customerEmail');
  @override
  late final GeneratedColumn<String> customerEmail = GeneratedColumn<String>(
      'customer_email', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _customerPhoneMeta =
      const VerificationMeta('customerPhone');
  @override
  late final GeneratedColumn<String> customerPhone = GeneratedColumn<String>(
      'customer_phone', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
      'status', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('active'));
  static const VerificationMeta _activatedAtMeta =
      const VerificationMeta('activatedAt');
  @override
  late final GeneratedColumn<DateTime> activatedAt = GeneratedColumn<DateTime>(
      'activated_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _expiresAtMeta =
      const VerificationMeta('expiresAt');
  @override
  late final GeneratedColumn<DateTime> expiresAt = GeneratedColumn<DateTime>(
      'expires_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _lastUsedAtMeta =
      const VerificationMeta('lastUsedAt');
  @override
  late final GeneratedColumn<DateTime> lastUsedAt = GeneratedColumn<DateTime>(
      'last_used_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _pinMeta = const VerificationMeta('pin');
  @override
  late final GeneratedColumn<String> pin = GeneratedColumn<String>(
      'pin', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _activatedByEmployeeUuidMeta =
      const VerificationMeta('activatedByEmployeeUuid');
  @override
  late final GeneratedColumn<String> activatedByEmployeeUuid =
      GeneratedColumn<String>('activated_by_employee_uuid', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _activatedByEmployeeNameMeta =
      const VerificationMeta('activatedByEmployeeName');
  @override
  late final GeneratedColumn<String> activatedByEmployeeName =
      GeneratedColumn<String>('activated_by_employee_name', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
      'notes', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
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
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'gift_card_table';
  @override
  VerificationContext validateIntegrity(Insertable<GiftCardTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('uuid')) {
      context.handle(
          _uuidMeta, uuid.isAcceptableOrUnknown(data['uuid']!, _uuidMeta));
    } else if (isInserting) {
      context.missing(_uuidMeta);
    }
    if (data.containsKey('card_number')) {
      context.handle(
          _cardNumberMeta,
          cardNumber.isAcceptableOrUnknown(
              data['card_number']!, _cardNumberMeta));
    } else if (isInserting) {
      context.missing(_cardNumberMeta);
    }
    if (data.containsKey('barcode')) {
      context.handle(_barcodeMeta,
          barcode.isAcceptableOrUnknown(data['barcode']!, _barcodeMeta));
    }
    if (data.containsKey('initial_value')) {
      context.handle(
          _initialValueMeta,
          initialValue.isAcceptableOrUnknown(
              data['initial_value']!, _initialValueMeta));
    } else if (isInserting) {
      context.missing(_initialValueMeta);
    }
    if (data.containsKey('current_balance')) {
      context.handle(
          _currentBalanceMeta,
          currentBalance.isAcceptableOrUnknown(
              data['current_balance']!, _currentBalanceMeta));
    }
    if (data.containsKey('customer_uuid')) {
      context.handle(
          _customerUuidMeta,
          customerUuid.isAcceptableOrUnknown(
              data['customer_uuid']!, _customerUuidMeta));
    }
    if (data.containsKey('customer_name')) {
      context.handle(
          _customerNameMeta,
          customerName.isAcceptableOrUnknown(
              data['customer_name']!, _customerNameMeta));
    }
    if (data.containsKey('customer_email')) {
      context.handle(
          _customerEmailMeta,
          customerEmail.isAcceptableOrUnknown(
              data['customer_email']!, _customerEmailMeta));
    }
    if (data.containsKey('customer_phone')) {
      context.handle(
          _customerPhoneMeta,
          customerPhone.isAcceptableOrUnknown(
              data['customer_phone']!, _customerPhoneMeta));
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status']!, _statusMeta));
    }
    if (data.containsKey('activated_at')) {
      context.handle(
          _activatedAtMeta,
          activatedAt.isAcceptableOrUnknown(
              data['activated_at']!, _activatedAtMeta));
    } else if (isInserting) {
      context.missing(_activatedAtMeta);
    }
    if (data.containsKey('expires_at')) {
      context.handle(_expiresAtMeta,
          expiresAt.isAcceptableOrUnknown(data['expires_at']!, _expiresAtMeta));
    }
    if (data.containsKey('last_used_at')) {
      context.handle(
          _lastUsedAtMeta,
          lastUsedAt.isAcceptableOrUnknown(
              data['last_used_at']!, _lastUsedAtMeta));
    }
    if (data.containsKey('pin')) {
      context.handle(
          _pinMeta, pin.isAcceptableOrUnknown(data['pin']!, _pinMeta));
    }
    if (data.containsKey('activated_by_employee_uuid')) {
      context.handle(
          _activatedByEmployeeUuidMeta,
          activatedByEmployeeUuid.isAcceptableOrUnknown(
              data['activated_by_employee_uuid']!,
              _activatedByEmployeeUuidMeta));
    }
    if (data.containsKey('activated_by_employee_name')) {
      context.handle(
          _activatedByEmployeeNameMeta,
          activatedByEmployeeName.isAcceptableOrUnknown(
              data['activated_by_employee_name']!,
              _activatedByEmployeeNameMeta));
    }
    if (data.containsKey('notes')) {
      context.handle(
          _notesMeta, notes.isAcceptableOrUnknown(data['notes']!, _notesMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  GiftCardTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return GiftCardTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      uuid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}uuid'])!,
      cardNumber: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}card_number'])!,
      barcode: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}barcode']),
      initialValue: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}initial_value'])!,
      currentBalance: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}current_balance'])!,
      customerUuid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}customer_uuid']),
      customerName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}customer_name']),
      customerEmail: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}customer_email']),
      customerPhone: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}customer_phone']),
      status: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}status'])!,
      activatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}activated_at'])!,
      expiresAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}expires_at']),
      lastUsedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}last_used_at']),
      pin: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}pin']),
      activatedByEmployeeUuid: attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}activated_by_employee_uuid']),
      activatedByEmployeeName: attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}activated_by_employee_name']),
      notes: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}notes']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
    );
  }

  @override
  $GiftCardTableTable createAlias(String alias) {
    return $GiftCardTableTable(attachedDatabase, alias);
  }
}

class GiftCardTableData extends DataClass
    implements Insertable<GiftCardTableData> {
  final int id;
  final String uuid;
  final String cardNumber;
  final String? barcode;
  final double initialValue;
  final double currentBalance;
  final String? customerUuid;
  final String? customerName;
  final String? customerEmail;
  final String? customerPhone;
  final String status;
  final DateTime activatedAt;
  final DateTime? expiresAt;
  final DateTime? lastUsedAt;
  final String? pin;
  final String? activatedByEmployeeUuid;
  final String? activatedByEmployeeName;
  final String? notes;
  final DateTime createdAt;
  final DateTime updatedAt;
  const GiftCardTableData(
      {required this.id,
      required this.uuid,
      required this.cardNumber,
      this.barcode,
      required this.initialValue,
      required this.currentBalance,
      this.customerUuid,
      this.customerName,
      this.customerEmail,
      this.customerPhone,
      required this.status,
      required this.activatedAt,
      this.expiresAt,
      this.lastUsedAt,
      this.pin,
      this.activatedByEmployeeUuid,
      this.activatedByEmployeeName,
      this.notes,
      required this.createdAt,
      required this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['uuid'] = Variable<String>(uuid);
    map['card_number'] = Variable<String>(cardNumber);
    if (!nullToAbsent || barcode != null) {
      map['barcode'] = Variable<String>(barcode);
    }
    map['initial_value'] = Variable<double>(initialValue);
    map['current_balance'] = Variable<double>(currentBalance);
    if (!nullToAbsent || customerUuid != null) {
      map['customer_uuid'] = Variable<String>(customerUuid);
    }
    if (!nullToAbsent || customerName != null) {
      map['customer_name'] = Variable<String>(customerName);
    }
    if (!nullToAbsent || customerEmail != null) {
      map['customer_email'] = Variable<String>(customerEmail);
    }
    if (!nullToAbsent || customerPhone != null) {
      map['customer_phone'] = Variable<String>(customerPhone);
    }
    map['status'] = Variable<String>(status);
    map['activated_at'] = Variable<DateTime>(activatedAt);
    if (!nullToAbsent || expiresAt != null) {
      map['expires_at'] = Variable<DateTime>(expiresAt);
    }
    if (!nullToAbsent || lastUsedAt != null) {
      map['last_used_at'] = Variable<DateTime>(lastUsedAt);
    }
    if (!nullToAbsent || pin != null) {
      map['pin'] = Variable<String>(pin);
    }
    if (!nullToAbsent || activatedByEmployeeUuid != null) {
      map['activated_by_employee_uuid'] =
          Variable<String>(activatedByEmployeeUuid);
    }
    if (!nullToAbsent || activatedByEmployeeName != null) {
      map['activated_by_employee_name'] =
          Variable<String>(activatedByEmployeeName);
    }
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  GiftCardTableCompanion toCompanion(bool nullToAbsent) {
    return GiftCardTableCompanion(
      id: Value(id),
      uuid: Value(uuid),
      cardNumber: Value(cardNumber),
      barcode: barcode == null && nullToAbsent
          ? const Value.absent()
          : Value(barcode),
      initialValue: Value(initialValue),
      currentBalance: Value(currentBalance),
      customerUuid: customerUuid == null && nullToAbsent
          ? const Value.absent()
          : Value(customerUuid),
      customerName: customerName == null && nullToAbsent
          ? const Value.absent()
          : Value(customerName),
      customerEmail: customerEmail == null && nullToAbsent
          ? const Value.absent()
          : Value(customerEmail),
      customerPhone: customerPhone == null && nullToAbsent
          ? const Value.absent()
          : Value(customerPhone),
      status: Value(status),
      activatedAt: Value(activatedAt),
      expiresAt: expiresAt == null && nullToAbsent
          ? const Value.absent()
          : Value(expiresAt),
      lastUsedAt: lastUsedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(lastUsedAt),
      pin: pin == null && nullToAbsent ? const Value.absent() : Value(pin),
      activatedByEmployeeUuid: activatedByEmployeeUuid == null && nullToAbsent
          ? const Value.absent()
          : Value(activatedByEmployeeUuid),
      activatedByEmployeeName: activatedByEmployeeName == null && nullToAbsent
          ? const Value.absent()
          : Value(activatedByEmployeeName),
      notes:
          notes == null && nullToAbsent ? const Value.absent() : Value(notes),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory GiftCardTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return GiftCardTableData(
      id: serializer.fromJson<int>(json['id']),
      uuid: serializer.fromJson<String>(json['uuid']),
      cardNumber: serializer.fromJson<String>(json['cardNumber']),
      barcode: serializer.fromJson<String?>(json['barcode']),
      initialValue: serializer.fromJson<double>(json['initialValue']),
      currentBalance: serializer.fromJson<double>(json['currentBalance']),
      customerUuid: serializer.fromJson<String?>(json['customerUuid']),
      customerName: serializer.fromJson<String?>(json['customerName']),
      customerEmail: serializer.fromJson<String?>(json['customerEmail']),
      customerPhone: serializer.fromJson<String?>(json['customerPhone']),
      status: serializer.fromJson<String>(json['status']),
      activatedAt: serializer.fromJson<DateTime>(json['activatedAt']),
      expiresAt: serializer.fromJson<DateTime?>(json['expiresAt']),
      lastUsedAt: serializer.fromJson<DateTime?>(json['lastUsedAt']),
      pin: serializer.fromJson<String?>(json['pin']),
      activatedByEmployeeUuid:
          serializer.fromJson<String?>(json['activatedByEmployeeUuid']),
      activatedByEmployeeName:
          serializer.fromJson<String?>(json['activatedByEmployeeName']),
      notes: serializer.fromJson<String?>(json['notes']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'uuid': serializer.toJson<String>(uuid),
      'cardNumber': serializer.toJson<String>(cardNumber),
      'barcode': serializer.toJson<String?>(barcode),
      'initialValue': serializer.toJson<double>(initialValue),
      'currentBalance': serializer.toJson<double>(currentBalance),
      'customerUuid': serializer.toJson<String?>(customerUuid),
      'customerName': serializer.toJson<String?>(customerName),
      'customerEmail': serializer.toJson<String?>(customerEmail),
      'customerPhone': serializer.toJson<String?>(customerPhone),
      'status': serializer.toJson<String>(status),
      'activatedAt': serializer.toJson<DateTime>(activatedAt),
      'expiresAt': serializer.toJson<DateTime?>(expiresAt),
      'lastUsedAt': serializer.toJson<DateTime?>(lastUsedAt),
      'pin': serializer.toJson<String?>(pin),
      'activatedByEmployeeUuid':
          serializer.toJson<String?>(activatedByEmployeeUuid),
      'activatedByEmployeeName':
          serializer.toJson<String?>(activatedByEmployeeName),
      'notes': serializer.toJson<String?>(notes),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  GiftCardTableData copyWith(
          {int? id,
          String? uuid,
          String? cardNumber,
          Value<String?> barcode = const Value.absent(),
          double? initialValue,
          double? currentBalance,
          Value<String?> customerUuid = const Value.absent(),
          Value<String?> customerName = const Value.absent(),
          Value<String?> customerEmail = const Value.absent(),
          Value<String?> customerPhone = const Value.absent(),
          String? status,
          DateTime? activatedAt,
          Value<DateTime?> expiresAt = const Value.absent(),
          Value<DateTime?> lastUsedAt = const Value.absent(),
          Value<String?> pin = const Value.absent(),
          Value<String?> activatedByEmployeeUuid = const Value.absent(),
          Value<String?> activatedByEmployeeName = const Value.absent(),
          Value<String?> notes = const Value.absent(),
          DateTime? createdAt,
          DateTime? updatedAt}) =>
      GiftCardTableData(
        id: id ?? this.id,
        uuid: uuid ?? this.uuid,
        cardNumber: cardNumber ?? this.cardNumber,
        barcode: barcode.present ? barcode.value : this.barcode,
        initialValue: initialValue ?? this.initialValue,
        currentBalance: currentBalance ?? this.currentBalance,
        customerUuid:
            customerUuid.present ? customerUuid.value : this.customerUuid,
        customerName:
            customerName.present ? customerName.value : this.customerName,
        customerEmail:
            customerEmail.present ? customerEmail.value : this.customerEmail,
        customerPhone:
            customerPhone.present ? customerPhone.value : this.customerPhone,
        status: status ?? this.status,
        activatedAt: activatedAt ?? this.activatedAt,
        expiresAt: expiresAt.present ? expiresAt.value : this.expiresAt,
        lastUsedAt: lastUsedAt.present ? lastUsedAt.value : this.lastUsedAt,
        pin: pin.present ? pin.value : this.pin,
        activatedByEmployeeUuid: activatedByEmployeeUuid.present
            ? activatedByEmployeeUuid.value
            : this.activatedByEmployeeUuid,
        activatedByEmployeeName: activatedByEmployeeName.present
            ? activatedByEmployeeName.value
            : this.activatedByEmployeeName,
        notes: notes.present ? notes.value : this.notes,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  GiftCardTableData copyWithCompanion(GiftCardTableCompanion data) {
    return GiftCardTableData(
      id: data.id.present ? data.id.value : this.id,
      uuid: data.uuid.present ? data.uuid.value : this.uuid,
      cardNumber:
          data.cardNumber.present ? data.cardNumber.value : this.cardNumber,
      barcode: data.barcode.present ? data.barcode.value : this.barcode,
      initialValue: data.initialValue.present
          ? data.initialValue.value
          : this.initialValue,
      currentBalance: data.currentBalance.present
          ? data.currentBalance.value
          : this.currentBalance,
      customerUuid: data.customerUuid.present
          ? data.customerUuid.value
          : this.customerUuid,
      customerName: data.customerName.present
          ? data.customerName.value
          : this.customerName,
      customerEmail: data.customerEmail.present
          ? data.customerEmail.value
          : this.customerEmail,
      customerPhone: data.customerPhone.present
          ? data.customerPhone.value
          : this.customerPhone,
      status: data.status.present ? data.status.value : this.status,
      activatedAt:
          data.activatedAt.present ? data.activatedAt.value : this.activatedAt,
      expiresAt: data.expiresAt.present ? data.expiresAt.value : this.expiresAt,
      lastUsedAt:
          data.lastUsedAt.present ? data.lastUsedAt.value : this.lastUsedAt,
      pin: data.pin.present ? data.pin.value : this.pin,
      activatedByEmployeeUuid: data.activatedByEmployeeUuid.present
          ? data.activatedByEmployeeUuid.value
          : this.activatedByEmployeeUuid,
      activatedByEmployeeName: data.activatedByEmployeeName.present
          ? data.activatedByEmployeeName.value
          : this.activatedByEmployeeName,
      notes: data.notes.present ? data.notes.value : this.notes,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('GiftCardTableData(')
          ..write('id: $id, ')
          ..write('uuid: $uuid, ')
          ..write('cardNumber: $cardNumber, ')
          ..write('barcode: $barcode, ')
          ..write('initialValue: $initialValue, ')
          ..write('currentBalance: $currentBalance, ')
          ..write('customerUuid: $customerUuid, ')
          ..write('customerName: $customerName, ')
          ..write('customerEmail: $customerEmail, ')
          ..write('customerPhone: $customerPhone, ')
          ..write('status: $status, ')
          ..write('activatedAt: $activatedAt, ')
          ..write('expiresAt: $expiresAt, ')
          ..write('lastUsedAt: $lastUsedAt, ')
          ..write('pin: $pin, ')
          ..write('activatedByEmployeeUuid: $activatedByEmployeeUuid, ')
          ..write('activatedByEmployeeName: $activatedByEmployeeName, ')
          ..write('notes: $notes, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
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
      updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is GiftCardTableData &&
          other.id == this.id &&
          other.uuid == this.uuid &&
          other.cardNumber == this.cardNumber &&
          other.barcode == this.barcode &&
          other.initialValue == this.initialValue &&
          other.currentBalance == this.currentBalance &&
          other.customerUuid == this.customerUuid &&
          other.customerName == this.customerName &&
          other.customerEmail == this.customerEmail &&
          other.customerPhone == this.customerPhone &&
          other.status == this.status &&
          other.activatedAt == this.activatedAt &&
          other.expiresAt == this.expiresAt &&
          other.lastUsedAt == this.lastUsedAt &&
          other.pin == this.pin &&
          other.activatedByEmployeeUuid == this.activatedByEmployeeUuid &&
          other.activatedByEmployeeName == this.activatedByEmployeeName &&
          other.notes == this.notes &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class GiftCardTableCompanion extends UpdateCompanion<GiftCardTableData> {
  final Value<int> id;
  final Value<String> uuid;
  final Value<String> cardNumber;
  final Value<String?> barcode;
  final Value<double> initialValue;
  final Value<double> currentBalance;
  final Value<String?> customerUuid;
  final Value<String?> customerName;
  final Value<String?> customerEmail;
  final Value<String?> customerPhone;
  final Value<String> status;
  final Value<DateTime> activatedAt;
  final Value<DateTime?> expiresAt;
  final Value<DateTime?> lastUsedAt;
  final Value<String?> pin;
  final Value<String?> activatedByEmployeeUuid;
  final Value<String?> activatedByEmployeeName;
  final Value<String?> notes;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const GiftCardTableCompanion({
    this.id = const Value.absent(),
    this.uuid = const Value.absent(),
    this.cardNumber = const Value.absent(),
    this.barcode = const Value.absent(),
    this.initialValue = const Value.absent(),
    this.currentBalance = const Value.absent(),
    this.customerUuid = const Value.absent(),
    this.customerName = const Value.absent(),
    this.customerEmail = const Value.absent(),
    this.customerPhone = const Value.absent(),
    this.status = const Value.absent(),
    this.activatedAt = const Value.absent(),
    this.expiresAt = const Value.absent(),
    this.lastUsedAt = const Value.absent(),
    this.pin = const Value.absent(),
    this.activatedByEmployeeUuid = const Value.absent(),
    this.activatedByEmployeeName = const Value.absent(),
    this.notes = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  GiftCardTableCompanion.insert({
    this.id = const Value.absent(),
    required String uuid,
    required String cardNumber,
    this.barcode = const Value.absent(),
    required double initialValue,
    this.currentBalance = const Value.absent(),
    this.customerUuid = const Value.absent(),
    this.customerName = const Value.absent(),
    this.customerEmail = const Value.absent(),
    this.customerPhone = const Value.absent(),
    this.status = const Value.absent(),
    required DateTime activatedAt,
    this.expiresAt = const Value.absent(),
    this.lastUsedAt = const Value.absent(),
    this.pin = const Value.absent(),
    this.activatedByEmployeeUuid = const Value.absent(),
    this.activatedByEmployeeName = const Value.absent(),
    this.notes = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
  })  : uuid = Value(uuid),
        cardNumber = Value(cardNumber),
        initialValue = Value(initialValue),
        activatedAt = Value(activatedAt),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt);
  static Insertable<GiftCardTableData> custom({
    Expression<int>? id,
    Expression<String>? uuid,
    Expression<String>? cardNumber,
    Expression<String>? barcode,
    Expression<double>? initialValue,
    Expression<double>? currentBalance,
    Expression<String>? customerUuid,
    Expression<String>? customerName,
    Expression<String>? customerEmail,
    Expression<String>? customerPhone,
    Expression<String>? status,
    Expression<DateTime>? activatedAt,
    Expression<DateTime>? expiresAt,
    Expression<DateTime>? lastUsedAt,
    Expression<String>? pin,
    Expression<String>? activatedByEmployeeUuid,
    Expression<String>? activatedByEmployeeName,
    Expression<String>? notes,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (uuid != null) 'uuid': uuid,
      if (cardNumber != null) 'card_number': cardNumber,
      if (barcode != null) 'barcode': barcode,
      if (initialValue != null) 'initial_value': initialValue,
      if (currentBalance != null) 'current_balance': currentBalance,
      if (customerUuid != null) 'customer_uuid': customerUuid,
      if (customerName != null) 'customer_name': customerName,
      if (customerEmail != null) 'customer_email': customerEmail,
      if (customerPhone != null) 'customer_phone': customerPhone,
      if (status != null) 'status': status,
      if (activatedAt != null) 'activated_at': activatedAt,
      if (expiresAt != null) 'expires_at': expiresAt,
      if (lastUsedAt != null) 'last_used_at': lastUsedAt,
      if (pin != null) 'pin': pin,
      if (activatedByEmployeeUuid != null)
        'activated_by_employee_uuid': activatedByEmployeeUuid,
      if (activatedByEmployeeName != null)
        'activated_by_employee_name': activatedByEmployeeName,
      if (notes != null) 'notes': notes,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  GiftCardTableCompanion copyWith(
      {Value<int>? id,
      Value<String>? uuid,
      Value<String>? cardNumber,
      Value<String?>? barcode,
      Value<double>? initialValue,
      Value<double>? currentBalance,
      Value<String?>? customerUuid,
      Value<String?>? customerName,
      Value<String?>? customerEmail,
      Value<String?>? customerPhone,
      Value<String>? status,
      Value<DateTime>? activatedAt,
      Value<DateTime?>? expiresAt,
      Value<DateTime?>? lastUsedAt,
      Value<String?>? pin,
      Value<String?>? activatedByEmployeeUuid,
      Value<String?>? activatedByEmployeeName,
      Value<String?>? notes,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt}) {
    return GiftCardTableCompanion(
      id: id ?? this.id,
      uuid: uuid ?? this.uuid,
      cardNumber: cardNumber ?? this.cardNumber,
      barcode: barcode ?? this.barcode,
      initialValue: initialValue ?? this.initialValue,
      currentBalance: currentBalance ?? this.currentBalance,
      customerUuid: customerUuid ?? this.customerUuid,
      customerName: customerName ?? this.customerName,
      customerEmail: customerEmail ?? this.customerEmail,
      customerPhone: customerPhone ?? this.customerPhone,
      status: status ?? this.status,
      activatedAt: activatedAt ?? this.activatedAt,
      expiresAt: expiresAt ?? this.expiresAt,
      lastUsedAt: lastUsedAt ?? this.lastUsedAt,
      pin: pin ?? this.pin,
      activatedByEmployeeUuid:
          activatedByEmployeeUuid ?? this.activatedByEmployeeUuid,
      activatedByEmployeeName:
          activatedByEmployeeName ?? this.activatedByEmployeeName,
      notes: notes ?? this.notes,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (uuid.present) {
      map['uuid'] = Variable<String>(uuid.value);
    }
    if (cardNumber.present) {
      map['card_number'] = Variable<String>(cardNumber.value);
    }
    if (barcode.present) {
      map['barcode'] = Variable<String>(barcode.value);
    }
    if (initialValue.present) {
      map['initial_value'] = Variable<double>(initialValue.value);
    }
    if (currentBalance.present) {
      map['current_balance'] = Variable<double>(currentBalance.value);
    }
    if (customerUuid.present) {
      map['customer_uuid'] = Variable<String>(customerUuid.value);
    }
    if (customerName.present) {
      map['customer_name'] = Variable<String>(customerName.value);
    }
    if (customerEmail.present) {
      map['customer_email'] = Variable<String>(customerEmail.value);
    }
    if (customerPhone.present) {
      map['customer_phone'] = Variable<String>(customerPhone.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (activatedAt.present) {
      map['activated_at'] = Variable<DateTime>(activatedAt.value);
    }
    if (expiresAt.present) {
      map['expires_at'] = Variable<DateTime>(expiresAt.value);
    }
    if (lastUsedAt.present) {
      map['last_used_at'] = Variable<DateTime>(lastUsedAt.value);
    }
    if (pin.present) {
      map['pin'] = Variable<String>(pin.value);
    }
    if (activatedByEmployeeUuid.present) {
      map['activated_by_employee_uuid'] =
          Variable<String>(activatedByEmployeeUuid.value);
    }
    if (activatedByEmployeeName.present) {
      map['activated_by_employee_name'] =
          Variable<String>(activatedByEmployeeName.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('GiftCardTableCompanion(')
          ..write('id: $id, ')
          ..write('uuid: $uuid, ')
          ..write('cardNumber: $cardNumber, ')
          ..write('barcode: $barcode, ')
          ..write('initialValue: $initialValue, ')
          ..write('currentBalance: $currentBalance, ')
          ..write('customerUuid: $customerUuid, ')
          ..write('customerName: $customerName, ')
          ..write('customerEmail: $customerEmail, ')
          ..write('customerPhone: $customerPhone, ')
          ..write('status: $status, ')
          ..write('activatedAt: $activatedAt, ')
          ..write('expiresAt: $expiresAt, ')
          ..write('lastUsedAt: $lastUsedAt, ')
          ..write('pin: $pin, ')
          ..write('activatedByEmployeeUuid: $activatedByEmployeeUuid, ')
          ..write('activatedByEmployeeName: $activatedByEmployeeName, ')
          ..write('notes: $notes, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $LoyaltyProgramTableTable extends LoyaltyProgramTable
    with TableInfo<$LoyaltyProgramTableTable, LoyaltyProgramData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LoyaltyProgramTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _uuidMeta = const VerificationMeta('uuid');
  @override
  late final GeneratedColumn<String> uuid = GeneratedColumn<String>(
      'uuid', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('Default Loyalty'));
  static const VerificationMeta _pointsPerCurrencyMeta =
      const VerificationMeta('pointsPerCurrency');
  @override
  late final GeneratedColumn<double> pointsPerCurrency =
      GeneratedColumn<double>('points_per_currency', aliasedName, false,
          type: DriftSqlType.double,
          requiredDuringInsert: false,
          defaultValue: const Constant(1.0));
  static const VerificationMeta _exchangeRateMeta =
      const VerificationMeta('exchangeRate');
  @override
  late final GeneratedColumn<double> exchangeRate = GeneratedColumn<double>(
      'exchange_rate', aliasedName, false,
      type: DriftSqlType.double,
      requiredDuringInsert: false,
      defaultValue: const Constant(0.01));
  static const VerificationMeta _tiersJsonMeta =
      const VerificationMeta('tiersJson');
  @override
  late final GeneratedColumn<String> tiersJson = GeneratedColumn<String>(
      'tiers_json', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns =>
      [id, uuid, name, pointsPerCurrency, exchangeRate, tiersJson, updatedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'loyalty_program_table';
  @override
  VerificationContext validateIntegrity(Insertable<LoyaltyProgramData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('uuid')) {
      context.handle(
          _uuidMeta, uuid.isAcceptableOrUnknown(data['uuid']!, _uuidMeta));
    } else if (isInserting) {
      context.missing(_uuidMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    }
    if (data.containsKey('points_per_currency')) {
      context.handle(
          _pointsPerCurrencyMeta,
          pointsPerCurrency.isAcceptableOrUnknown(
              data['points_per_currency']!, _pointsPerCurrencyMeta));
    }
    if (data.containsKey('exchange_rate')) {
      context.handle(
          _exchangeRateMeta,
          exchangeRate.isAcceptableOrUnknown(
              data['exchange_rate']!, _exchangeRateMeta));
    }
    if (data.containsKey('tiers_json')) {
      context.handle(_tiersJsonMeta,
          tiersJson.isAcceptableOrUnknown(data['tiers_json']!, _tiersJsonMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  LoyaltyProgramData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LoyaltyProgramData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      uuid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}uuid'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      pointsPerCurrency: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}points_per_currency'])!,
      exchangeRate: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}exchange_rate'])!,
      tiersJson: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}tiers_json']),
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
    );
  }

  @override
  $LoyaltyProgramTableTable createAlias(String alias) {
    return $LoyaltyProgramTableTable(attachedDatabase, alias);
  }
}

class LoyaltyProgramData extends DataClass
    implements Insertable<LoyaltyProgramData> {
  final int id;
  final String uuid;
  final String name;
  final double pointsPerCurrency;
  final double exchangeRate;
  final String? tiersJson;
  final DateTime updatedAt;
  const LoyaltyProgramData(
      {required this.id,
      required this.uuid,
      required this.name,
      required this.pointsPerCurrency,
      required this.exchangeRate,
      this.tiersJson,
      required this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['uuid'] = Variable<String>(uuid);
    map['name'] = Variable<String>(name);
    map['points_per_currency'] = Variable<double>(pointsPerCurrency);
    map['exchange_rate'] = Variable<double>(exchangeRate);
    if (!nullToAbsent || tiersJson != null) {
      map['tiers_json'] = Variable<String>(tiersJson);
    }
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  LoyaltyProgramTableCompanion toCompanion(bool nullToAbsent) {
    return LoyaltyProgramTableCompanion(
      id: Value(id),
      uuid: Value(uuid),
      name: Value(name),
      pointsPerCurrency: Value(pointsPerCurrency),
      exchangeRate: Value(exchangeRate),
      tiersJson: tiersJson == null && nullToAbsent
          ? const Value.absent()
          : Value(tiersJson),
      updatedAt: Value(updatedAt),
    );
  }

  factory LoyaltyProgramData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return LoyaltyProgramData(
      id: serializer.fromJson<int>(json['id']),
      uuid: serializer.fromJson<String>(json['uuid']),
      name: serializer.fromJson<String>(json['name']),
      pointsPerCurrency: serializer.fromJson<double>(json['pointsPerCurrency']),
      exchangeRate: serializer.fromJson<double>(json['exchangeRate']),
      tiersJson: serializer.fromJson<String?>(json['tiersJson']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'uuid': serializer.toJson<String>(uuid),
      'name': serializer.toJson<String>(name),
      'pointsPerCurrency': serializer.toJson<double>(pointsPerCurrency),
      'exchangeRate': serializer.toJson<double>(exchangeRate),
      'tiersJson': serializer.toJson<String?>(tiersJson),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  LoyaltyProgramData copyWith(
          {int? id,
          String? uuid,
          String? name,
          double? pointsPerCurrency,
          double? exchangeRate,
          Value<String?> tiersJson = const Value.absent(),
          DateTime? updatedAt}) =>
      LoyaltyProgramData(
        id: id ?? this.id,
        uuid: uuid ?? this.uuid,
        name: name ?? this.name,
        pointsPerCurrency: pointsPerCurrency ?? this.pointsPerCurrency,
        exchangeRate: exchangeRate ?? this.exchangeRate,
        tiersJson: tiersJson.present ? tiersJson.value : this.tiersJson,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  LoyaltyProgramData copyWithCompanion(LoyaltyProgramTableCompanion data) {
    return LoyaltyProgramData(
      id: data.id.present ? data.id.value : this.id,
      uuid: data.uuid.present ? data.uuid.value : this.uuid,
      name: data.name.present ? data.name.value : this.name,
      pointsPerCurrency: data.pointsPerCurrency.present
          ? data.pointsPerCurrency.value
          : this.pointsPerCurrency,
      exchangeRate: data.exchangeRate.present
          ? data.exchangeRate.value
          : this.exchangeRate,
      tiersJson: data.tiersJson.present ? data.tiersJson.value : this.tiersJson,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('LoyaltyProgramData(')
          ..write('id: $id, ')
          ..write('uuid: $uuid, ')
          ..write('name: $name, ')
          ..write('pointsPerCurrency: $pointsPerCurrency, ')
          ..write('exchangeRate: $exchangeRate, ')
          ..write('tiersJson: $tiersJson, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, uuid, name, pointsPerCurrency, exchangeRate, tiersJson, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LoyaltyProgramData &&
          other.id == this.id &&
          other.uuid == this.uuid &&
          other.name == this.name &&
          other.pointsPerCurrency == this.pointsPerCurrency &&
          other.exchangeRate == this.exchangeRate &&
          other.tiersJson == this.tiersJson &&
          other.updatedAt == this.updatedAt);
}

class LoyaltyProgramTableCompanion extends UpdateCompanion<LoyaltyProgramData> {
  final Value<int> id;
  final Value<String> uuid;
  final Value<String> name;
  final Value<double> pointsPerCurrency;
  final Value<double> exchangeRate;
  final Value<String?> tiersJson;
  final Value<DateTime> updatedAt;
  const LoyaltyProgramTableCompanion({
    this.id = const Value.absent(),
    this.uuid = const Value.absent(),
    this.name = const Value.absent(),
    this.pointsPerCurrency = const Value.absent(),
    this.exchangeRate = const Value.absent(),
    this.tiersJson = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  LoyaltyProgramTableCompanion.insert({
    this.id = const Value.absent(),
    required String uuid,
    this.name = const Value.absent(),
    this.pointsPerCurrency = const Value.absent(),
    this.exchangeRate = const Value.absent(),
    this.tiersJson = const Value.absent(),
    this.updatedAt = const Value.absent(),
  }) : uuid = Value(uuid);
  static Insertable<LoyaltyProgramData> custom({
    Expression<int>? id,
    Expression<String>? uuid,
    Expression<String>? name,
    Expression<double>? pointsPerCurrency,
    Expression<double>? exchangeRate,
    Expression<String>? tiersJson,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (uuid != null) 'uuid': uuid,
      if (name != null) 'name': name,
      if (pointsPerCurrency != null) 'points_per_currency': pointsPerCurrency,
      if (exchangeRate != null) 'exchange_rate': exchangeRate,
      if (tiersJson != null) 'tiers_json': tiersJson,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  LoyaltyProgramTableCompanion copyWith(
      {Value<int>? id,
      Value<String>? uuid,
      Value<String>? name,
      Value<double>? pointsPerCurrency,
      Value<double>? exchangeRate,
      Value<String?>? tiersJson,
      Value<DateTime>? updatedAt}) {
    return LoyaltyProgramTableCompanion(
      id: id ?? this.id,
      uuid: uuid ?? this.uuid,
      name: name ?? this.name,
      pointsPerCurrency: pointsPerCurrency ?? this.pointsPerCurrency,
      exchangeRate: exchangeRate ?? this.exchangeRate,
      tiersJson: tiersJson ?? this.tiersJson,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (uuid.present) {
      map['uuid'] = Variable<String>(uuid.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (pointsPerCurrency.present) {
      map['points_per_currency'] = Variable<double>(pointsPerCurrency.value);
    }
    if (exchangeRate.present) {
      map['exchange_rate'] = Variable<double>(exchangeRate.value);
    }
    if (tiersJson.present) {
      map['tiers_json'] = Variable<String>(tiersJson.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LoyaltyProgramTableCompanion(')
          ..write('id: $id, ')
          ..write('uuid: $uuid, ')
          ..write('name: $name, ')
          ..write('pointsPerCurrency: $pointsPerCurrency, ')
          ..write('exchangeRate: $exchangeRate, ')
          ..write('tiersJson: $tiersJson, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $LoyaltyMemberTableTable extends LoyaltyMemberTable
    with TableInfo<$LoyaltyMemberTableTable, LoyaltyMemberData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LoyaltyMemberTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _uuidMeta = const VerificationMeta('uuid');
  @override
  late final GeneratedColumn<String> uuid = GeneratedColumn<String>(
      'uuid', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'));
  static const VerificationMeta _customerUuidMeta =
      const VerificationMeta('customerUuid');
  @override
  late final GeneratedColumn<String> customerUuid = GeneratedColumn<String>(
      'customer_uuid', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'));
  static const VerificationMeta _pointsBalanceMeta =
      const VerificationMeta('pointsBalance');
  @override
  late final GeneratedColumn<double> pointsBalance = GeneratedColumn<double>(
      'points_balance', aliasedName, false,
      type: DriftSqlType.double,
      requiredDuringInsert: false,
      defaultValue: const Constant(0.0));
  static const VerificationMeta _lifetimePointsMeta =
      const VerificationMeta('lifetimePoints');
  @override
  late final GeneratedColumn<double> lifetimePoints = GeneratedColumn<double>(
      'lifetime_points', aliasedName, false,
      type: DriftSqlType.double,
      requiredDuringInsert: false,
      defaultValue: const Constant(0.0));
  static const VerificationMeta _currentTierMeta =
      const VerificationMeta('currentTier');
  @override
  late final GeneratedColumn<String> currentTier = GeneratedColumn<String>(
      'current_tier', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('Base'));
  static const VerificationMeta _joinedAtMeta =
      const VerificationMeta('joinedAt');
  @override
  late final GeneratedColumn<DateTime> joinedAt = GeneratedColumn<DateTime>(
      'joined_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _lastTransactionAtMeta =
      const VerificationMeta('lastTransactionAt');
  @override
  late final GeneratedColumn<DateTime> lastTransactionAt =
      GeneratedColumn<DateTime>('last_transaction_at', aliasedName, true,
          type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        uuid,
        customerUuid,
        pointsBalance,
        lifetimePoints,
        currentTier,
        joinedAt,
        lastTransactionAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'loyalty_member_table';
  @override
  VerificationContext validateIntegrity(Insertable<LoyaltyMemberData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('uuid')) {
      context.handle(
          _uuidMeta, uuid.isAcceptableOrUnknown(data['uuid']!, _uuidMeta));
    } else if (isInserting) {
      context.missing(_uuidMeta);
    }
    if (data.containsKey('customer_uuid')) {
      context.handle(
          _customerUuidMeta,
          customerUuid.isAcceptableOrUnknown(
              data['customer_uuid']!, _customerUuidMeta));
    } else if (isInserting) {
      context.missing(_customerUuidMeta);
    }
    if (data.containsKey('points_balance')) {
      context.handle(
          _pointsBalanceMeta,
          pointsBalance.isAcceptableOrUnknown(
              data['points_balance']!, _pointsBalanceMeta));
    }
    if (data.containsKey('lifetime_points')) {
      context.handle(
          _lifetimePointsMeta,
          lifetimePoints.isAcceptableOrUnknown(
              data['lifetime_points']!, _lifetimePointsMeta));
    }
    if (data.containsKey('current_tier')) {
      context.handle(
          _currentTierMeta,
          currentTier.isAcceptableOrUnknown(
              data['current_tier']!, _currentTierMeta));
    }
    if (data.containsKey('joined_at')) {
      context.handle(_joinedAtMeta,
          joinedAt.isAcceptableOrUnknown(data['joined_at']!, _joinedAtMeta));
    }
    if (data.containsKey('last_transaction_at')) {
      context.handle(
          _lastTransactionAtMeta,
          lastTransactionAt.isAcceptableOrUnknown(
              data['last_transaction_at']!, _lastTransactionAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  LoyaltyMemberData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LoyaltyMemberData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      uuid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}uuid'])!,
      customerUuid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}customer_uuid'])!,
      pointsBalance: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}points_balance'])!,
      lifetimePoints: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}lifetime_points'])!,
      currentTier: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}current_tier'])!,
      joinedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}joined_at'])!,
      lastTransactionAt: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}last_transaction_at']),
    );
  }

  @override
  $LoyaltyMemberTableTable createAlias(String alias) {
    return $LoyaltyMemberTableTable(attachedDatabase, alias);
  }
}

class LoyaltyMemberData extends DataClass
    implements Insertable<LoyaltyMemberData> {
  final int id;
  final String uuid;
  final String customerUuid;
  final double pointsBalance;
  final double lifetimePoints;
  final String currentTier;
  final DateTime joinedAt;
  final DateTime? lastTransactionAt;
  const LoyaltyMemberData(
      {required this.id,
      required this.uuid,
      required this.customerUuid,
      required this.pointsBalance,
      required this.lifetimePoints,
      required this.currentTier,
      required this.joinedAt,
      this.lastTransactionAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['uuid'] = Variable<String>(uuid);
    map['customer_uuid'] = Variable<String>(customerUuid);
    map['points_balance'] = Variable<double>(pointsBalance);
    map['lifetime_points'] = Variable<double>(lifetimePoints);
    map['current_tier'] = Variable<String>(currentTier);
    map['joined_at'] = Variable<DateTime>(joinedAt);
    if (!nullToAbsent || lastTransactionAt != null) {
      map['last_transaction_at'] = Variable<DateTime>(lastTransactionAt);
    }
    return map;
  }

  LoyaltyMemberTableCompanion toCompanion(bool nullToAbsent) {
    return LoyaltyMemberTableCompanion(
      id: Value(id),
      uuid: Value(uuid),
      customerUuid: Value(customerUuid),
      pointsBalance: Value(pointsBalance),
      lifetimePoints: Value(lifetimePoints),
      currentTier: Value(currentTier),
      joinedAt: Value(joinedAt),
      lastTransactionAt: lastTransactionAt == null && nullToAbsent
          ? const Value.absent()
          : Value(lastTransactionAt),
    );
  }

  factory LoyaltyMemberData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return LoyaltyMemberData(
      id: serializer.fromJson<int>(json['id']),
      uuid: serializer.fromJson<String>(json['uuid']),
      customerUuid: serializer.fromJson<String>(json['customerUuid']),
      pointsBalance: serializer.fromJson<double>(json['pointsBalance']),
      lifetimePoints: serializer.fromJson<double>(json['lifetimePoints']),
      currentTier: serializer.fromJson<String>(json['currentTier']),
      joinedAt: serializer.fromJson<DateTime>(json['joinedAt']),
      lastTransactionAt:
          serializer.fromJson<DateTime?>(json['lastTransactionAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'uuid': serializer.toJson<String>(uuid),
      'customerUuid': serializer.toJson<String>(customerUuid),
      'pointsBalance': serializer.toJson<double>(pointsBalance),
      'lifetimePoints': serializer.toJson<double>(lifetimePoints),
      'currentTier': serializer.toJson<String>(currentTier),
      'joinedAt': serializer.toJson<DateTime>(joinedAt),
      'lastTransactionAt': serializer.toJson<DateTime?>(lastTransactionAt),
    };
  }

  LoyaltyMemberData copyWith(
          {int? id,
          String? uuid,
          String? customerUuid,
          double? pointsBalance,
          double? lifetimePoints,
          String? currentTier,
          DateTime? joinedAt,
          Value<DateTime?> lastTransactionAt = const Value.absent()}) =>
      LoyaltyMemberData(
        id: id ?? this.id,
        uuid: uuid ?? this.uuid,
        customerUuid: customerUuid ?? this.customerUuid,
        pointsBalance: pointsBalance ?? this.pointsBalance,
        lifetimePoints: lifetimePoints ?? this.lifetimePoints,
        currentTier: currentTier ?? this.currentTier,
        joinedAt: joinedAt ?? this.joinedAt,
        lastTransactionAt: lastTransactionAt.present
            ? lastTransactionAt.value
            : this.lastTransactionAt,
      );
  LoyaltyMemberData copyWithCompanion(LoyaltyMemberTableCompanion data) {
    return LoyaltyMemberData(
      id: data.id.present ? data.id.value : this.id,
      uuid: data.uuid.present ? data.uuid.value : this.uuid,
      customerUuid: data.customerUuid.present
          ? data.customerUuid.value
          : this.customerUuid,
      pointsBalance: data.pointsBalance.present
          ? data.pointsBalance.value
          : this.pointsBalance,
      lifetimePoints: data.lifetimePoints.present
          ? data.lifetimePoints.value
          : this.lifetimePoints,
      currentTier:
          data.currentTier.present ? data.currentTier.value : this.currentTier,
      joinedAt: data.joinedAt.present ? data.joinedAt.value : this.joinedAt,
      lastTransactionAt: data.lastTransactionAt.present
          ? data.lastTransactionAt.value
          : this.lastTransactionAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('LoyaltyMemberData(')
          ..write('id: $id, ')
          ..write('uuid: $uuid, ')
          ..write('customerUuid: $customerUuid, ')
          ..write('pointsBalance: $pointsBalance, ')
          ..write('lifetimePoints: $lifetimePoints, ')
          ..write('currentTier: $currentTier, ')
          ..write('joinedAt: $joinedAt, ')
          ..write('lastTransactionAt: $lastTransactionAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, uuid, customerUuid, pointsBalance,
      lifetimePoints, currentTier, joinedAt, lastTransactionAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LoyaltyMemberData &&
          other.id == this.id &&
          other.uuid == this.uuid &&
          other.customerUuid == this.customerUuid &&
          other.pointsBalance == this.pointsBalance &&
          other.lifetimePoints == this.lifetimePoints &&
          other.currentTier == this.currentTier &&
          other.joinedAt == this.joinedAt &&
          other.lastTransactionAt == this.lastTransactionAt);
}

class LoyaltyMemberTableCompanion extends UpdateCompanion<LoyaltyMemberData> {
  final Value<int> id;
  final Value<String> uuid;
  final Value<String> customerUuid;
  final Value<double> pointsBalance;
  final Value<double> lifetimePoints;
  final Value<String> currentTier;
  final Value<DateTime> joinedAt;
  final Value<DateTime?> lastTransactionAt;
  const LoyaltyMemberTableCompanion({
    this.id = const Value.absent(),
    this.uuid = const Value.absent(),
    this.customerUuid = const Value.absent(),
    this.pointsBalance = const Value.absent(),
    this.lifetimePoints = const Value.absent(),
    this.currentTier = const Value.absent(),
    this.joinedAt = const Value.absent(),
    this.lastTransactionAt = const Value.absent(),
  });
  LoyaltyMemberTableCompanion.insert({
    this.id = const Value.absent(),
    required String uuid,
    required String customerUuid,
    this.pointsBalance = const Value.absent(),
    this.lifetimePoints = const Value.absent(),
    this.currentTier = const Value.absent(),
    this.joinedAt = const Value.absent(),
    this.lastTransactionAt = const Value.absent(),
  })  : uuid = Value(uuid),
        customerUuid = Value(customerUuid);
  static Insertable<LoyaltyMemberData> custom({
    Expression<int>? id,
    Expression<String>? uuid,
    Expression<String>? customerUuid,
    Expression<double>? pointsBalance,
    Expression<double>? lifetimePoints,
    Expression<String>? currentTier,
    Expression<DateTime>? joinedAt,
    Expression<DateTime>? lastTransactionAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (uuid != null) 'uuid': uuid,
      if (customerUuid != null) 'customer_uuid': customerUuid,
      if (pointsBalance != null) 'points_balance': pointsBalance,
      if (lifetimePoints != null) 'lifetime_points': lifetimePoints,
      if (currentTier != null) 'current_tier': currentTier,
      if (joinedAt != null) 'joined_at': joinedAt,
      if (lastTransactionAt != null) 'last_transaction_at': lastTransactionAt,
    });
  }

  LoyaltyMemberTableCompanion copyWith(
      {Value<int>? id,
      Value<String>? uuid,
      Value<String>? customerUuid,
      Value<double>? pointsBalance,
      Value<double>? lifetimePoints,
      Value<String>? currentTier,
      Value<DateTime>? joinedAt,
      Value<DateTime?>? lastTransactionAt}) {
    return LoyaltyMemberTableCompanion(
      id: id ?? this.id,
      uuid: uuid ?? this.uuid,
      customerUuid: customerUuid ?? this.customerUuid,
      pointsBalance: pointsBalance ?? this.pointsBalance,
      lifetimePoints: lifetimePoints ?? this.lifetimePoints,
      currentTier: currentTier ?? this.currentTier,
      joinedAt: joinedAt ?? this.joinedAt,
      lastTransactionAt: lastTransactionAt ?? this.lastTransactionAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (uuid.present) {
      map['uuid'] = Variable<String>(uuid.value);
    }
    if (customerUuid.present) {
      map['customer_uuid'] = Variable<String>(customerUuid.value);
    }
    if (pointsBalance.present) {
      map['points_balance'] = Variable<double>(pointsBalance.value);
    }
    if (lifetimePoints.present) {
      map['lifetime_points'] = Variable<double>(lifetimePoints.value);
    }
    if (currentTier.present) {
      map['current_tier'] = Variable<String>(currentTier.value);
    }
    if (joinedAt.present) {
      map['joined_at'] = Variable<DateTime>(joinedAt.value);
    }
    if (lastTransactionAt.present) {
      map['last_transaction_at'] = Variable<DateTime>(lastTransactionAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LoyaltyMemberTableCompanion(')
          ..write('id: $id, ')
          ..write('uuid: $uuid, ')
          ..write('customerUuid: $customerUuid, ')
          ..write('pointsBalance: $pointsBalance, ')
          ..write('lifetimePoints: $lifetimePoints, ')
          ..write('currentTier: $currentTier, ')
          ..write('joinedAt: $joinedAt, ')
          ..write('lastTransactionAt: $lastTransactionAt')
          ..write(')'))
        .toString();
  }
}

class $LoyaltyTransactionTableTable extends LoyaltyTransactionTable
    with TableInfo<$LoyaltyTransactionTableTable, LoyaltyTransactionData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LoyaltyTransactionTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _uuidMeta = const VerificationMeta('uuid');
  @override
  late final GeneratedColumn<String> uuid = GeneratedColumn<String>(
      'uuid', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'));
  static const VerificationMeta _memberUuidMeta =
      const VerificationMeta('memberUuid');
  @override
  late final GeneratedColumn<String> memberUuid = GeneratedColumn<String>(
      'member_uuid', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
      'type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _pointsDeltaMeta =
      const VerificationMeta('pointsDelta');
  @override
  late final GeneratedColumn<double> pointsDelta = GeneratedColumn<double>(
      'points_delta', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _orderUuidMeta =
      const VerificationMeta('orderUuid');
  @override
  late final GeneratedColumn<String> orderUuid = GeneratedColumn<String>(
      'order_uuid', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _rewardUuidMeta =
      const VerificationMeta('rewardUuid');
  @override
  late final GeneratedColumn<String> rewardUuid = GeneratedColumn<String>(
      'reward_uuid', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _reasonMeta = const VerificationMeta('reason');
  @override
  late final GeneratedColumn<String> reason = GeneratedColumn<String>(
      'reason', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        uuid,
        memberUuid,
        type,
        pointsDelta,
        orderUuid,
        rewardUuid,
        reason,
        createdAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'loyalty_transaction_table';
  @override
  VerificationContext validateIntegrity(
      Insertable<LoyaltyTransactionData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('uuid')) {
      context.handle(
          _uuidMeta, uuid.isAcceptableOrUnknown(data['uuid']!, _uuidMeta));
    } else if (isInserting) {
      context.missing(_uuidMeta);
    }
    if (data.containsKey('member_uuid')) {
      context.handle(
          _memberUuidMeta,
          memberUuid.isAcceptableOrUnknown(
              data['member_uuid']!, _memberUuidMeta));
    } else if (isInserting) {
      context.missing(_memberUuidMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
          _typeMeta, type.isAcceptableOrUnknown(data['type']!, _typeMeta));
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('points_delta')) {
      context.handle(
          _pointsDeltaMeta,
          pointsDelta.isAcceptableOrUnknown(
              data['points_delta']!, _pointsDeltaMeta));
    } else if (isInserting) {
      context.missing(_pointsDeltaMeta);
    }
    if (data.containsKey('order_uuid')) {
      context.handle(_orderUuidMeta,
          orderUuid.isAcceptableOrUnknown(data['order_uuid']!, _orderUuidMeta));
    }
    if (data.containsKey('reward_uuid')) {
      context.handle(
          _rewardUuidMeta,
          rewardUuid.isAcceptableOrUnknown(
              data['reward_uuid']!, _rewardUuidMeta));
    }
    if (data.containsKey('reason')) {
      context.handle(_reasonMeta,
          reason.isAcceptableOrUnknown(data['reason']!, _reasonMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  LoyaltyTransactionData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LoyaltyTransactionData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      uuid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}uuid'])!,
      memberUuid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}member_uuid'])!,
      type: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}type'])!,
      pointsDelta: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}points_delta'])!,
      orderUuid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}order_uuid']),
      rewardUuid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}reward_uuid']),
      reason: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}reason']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
    );
  }

  @override
  $LoyaltyTransactionTableTable createAlias(String alias) {
    return $LoyaltyTransactionTableTable(attachedDatabase, alias);
  }
}

class LoyaltyTransactionData extends DataClass
    implements Insertable<LoyaltyTransactionData> {
  final int id;
  final String uuid;
  final String memberUuid;
  final String type;
  final double pointsDelta;
  final String? orderUuid;
  final String? rewardUuid;
  final String? reason;
  final DateTime createdAt;
  const LoyaltyTransactionData(
      {required this.id,
      required this.uuid,
      required this.memberUuid,
      required this.type,
      required this.pointsDelta,
      this.orderUuid,
      this.rewardUuid,
      this.reason,
      required this.createdAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['uuid'] = Variable<String>(uuid);
    map['member_uuid'] = Variable<String>(memberUuid);
    map['type'] = Variable<String>(type);
    map['points_delta'] = Variable<double>(pointsDelta);
    if (!nullToAbsent || orderUuid != null) {
      map['order_uuid'] = Variable<String>(orderUuid);
    }
    if (!nullToAbsent || rewardUuid != null) {
      map['reward_uuid'] = Variable<String>(rewardUuid);
    }
    if (!nullToAbsent || reason != null) {
      map['reason'] = Variable<String>(reason);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  LoyaltyTransactionTableCompanion toCompanion(bool nullToAbsent) {
    return LoyaltyTransactionTableCompanion(
      id: Value(id),
      uuid: Value(uuid),
      memberUuid: Value(memberUuid),
      type: Value(type),
      pointsDelta: Value(pointsDelta),
      orderUuid: orderUuid == null && nullToAbsent
          ? const Value.absent()
          : Value(orderUuid),
      rewardUuid: rewardUuid == null && nullToAbsent
          ? const Value.absent()
          : Value(rewardUuid),
      reason:
          reason == null && nullToAbsent ? const Value.absent() : Value(reason),
      createdAt: Value(createdAt),
    );
  }

  factory LoyaltyTransactionData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return LoyaltyTransactionData(
      id: serializer.fromJson<int>(json['id']),
      uuid: serializer.fromJson<String>(json['uuid']),
      memberUuid: serializer.fromJson<String>(json['memberUuid']),
      type: serializer.fromJson<String>(json['type']),
      pointsDelta: serializer.fromJson<double>(json['pointsDelta']),
      orderUuid: serializer.fromJson<String?>(json['orderUuid']),
      rewardUuid: serializer.fromJson<String?>(json['rewardUuid']),
      reason: serializer.fromJson<String?>(json['reason']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'uuid': serializer.toJson<String>(uuid),
      'memberUuid': serializer.toJson<String>(memberUuid),
      'type': serializer.toJson<String>(type),
      'pointsDelta': serializer.toJson<double>(pointsDelta),
      'orderUuid': serializer.toJson<String?>(orderUuid),
      'rewardUuid': serializer.toJson<String?>(rewardUuid),
      'reason': serializer.toJson<String?>(reason),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  LoyaltyTransactionData copyWith(
          {int? id,
          String? uuid,
          String? memberUuid,
          String? type,
          double? pointsDelta,
          Value<String?> orderUuid = const Value.absent(),
          Value<String?> rewardUuid = const Value.absent(),
          Value<String?> reason = const Value.absent(),
          DateTime? createdAt}) =>
      LoyaltyTransactionData(
        id: id ?? this.id,
        uuid: uuid ?? this.uuid,
        memberUuid: memberUuid ?? this.memberUuid,
        type: type ?? this.type,
        pointsDelta: pointsDelta ?? this.pointsDelta,
        orderUuid: orderUuid.present ? orderUuid.value : this.orderUuid,
        rewardUuid: rewardUuid.present ? rewardUuid.value : this.rewardUuid,
        reason: reason.present ? reason.value : this.reason,
        createdAt: createdAt ?? this.createdAt,
      );
  LoyaltyTransactionData copyWithCompanion(
      LoyaltyTransactionTableCompanion data) {
    return LoyaltyTransactionData(
      id: data.id.present ? data.id.value : this.id,
      uuid: data.uuid.present ? data.uuid.value : this.uuid,
      memberUuid:
          data.memberUuid.present ? data.memberUuid.value : this.memberUuid,
      type: data.type.present ? data.type.value : this.type,
      pointsDelta:
          data.pointsDelta.present ? data.pointsDelta.value : this.pointsDelta,
      orderUuid: data.orderUuid.present ? data.orderUuid.value : this.orderUuid,
      rewardUuid:
          data.rewardUuid.present ? data.rewardUuid.value : this.rewardUuid,
      reason: data.reason.present ? data.reason.value : this.reason,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('LoyaltyTransactionData(')
          ..write('id: $id, ')
          ..write('uuid: $uuid, ')
          ..write('memberUuid: $memberUuid, ')
          ..write('type: $type, ')
          ..write('pointsDelta: $pointsDelta, ')
          ..write('orderUuid: $orderUuid, ')
          ..write('rewardUuid: $rewardUuid, ')
          ..write('reason: $reason, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, uuid, memberUuid, type, pointsDelta,
      orderUuid, rewardUuid, reason, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LoyaltyTransactionData &&
          other.id == this.id &&
          other.uuid == this.uuid &&
          other.memberUuid == this.memberUuid &&
          other.type == this.type &&
          other.pointsDelta == this.pointsDelta &&
          other.orderUuid == this.orderUuid &&
          other.rewardUuid == this.rewardUuid &&
          other.reason == this.reason &&
          other.createdAt == this.createdAt);
}

class LoyaltyTransactionTableCompanion
    extends UpdateCompanion<LoyaltyTransactionData> {
  final Value<int> id;
  final Value<String> uuid;
  final Value<String> memberUuid;
  final Value<String> type;
  final Value<double> pointsDelta;
  final Value<String?> orderUuid;
  final Value<String?> rewardUuid;
  final Value<String?> reason;
  final Value<DateTime> createdAt;
  const LoyaltyTransactionTableCompanion({
    this.id = const Value.absent(),
    this.uuid = const Value.absent(),
    this.memberUuid = const Value.absent(),
    this.type = const Value.absent(),
    this.pointsDelta = const Value.absent(),
    this.orderUuid = const Value.absent(),
    this.rewardUuid = const Value.absent(),
    this.reason = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  LoyaltyTransactionTableCompanion.insert({
    this.id = const Value.absent(),
    required String uuid,
    required String memberUuid,
    required String type,
    required double pointsDelta,
    this.orderUuid = const Value.absent(),
    this.rewardUuid = const Value.absent(),
    this.reason = const Value.absent(),
    this.createdAt = const Value.absent(),
  })  : uuid = Value(uuid),
        memberUuid = Value(memberUuid),
        type = Value(type),
        pointsDelta = Value(pointsDelta);
  static Insertable<LoyaltyTransactionData> custom({
    Expression<int>? id,
    Expression<String>? uuid,
    Expression<String>? memberUuid,
    Expression<String>? type,
    Expression<double>? pointsDelta,
    Expression<String>? orderUuid,
    Expression<String>? rewardUuid,
    Expression<String>? reason,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (uuid != null) 'uuid': uuid,
      if (memberUuid != null) 'member_uuid': memberUuid,
      if (type != null) 'type': type,
      if (pointsDelta != null) 'points_delta': pointsDelta,
      if (orderUuid != null) 'order_uuid': orderUuid,
      if (rewardUuid != null) 'reward_uuid': rewardUuid,
      if (reason != null) 'reason': reason,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  LoyaltyTransactionTableCompanion copyWith(
      {Value<int>? id,
      Value<String>? uuid,
      Value<String>? memberUuid,
      Value<String>? type,
      Value<double>? pointsDelta,
      Value<String?>? orderUuid,
      Value<String?>? rewardUuid,
      Value<String?>? reason,
      Value<DateTime>? createdAt}) {
    return LoyaltyTransactionTableCompanion(
      id: id ?? this.id,
      uuid: uuid ?? this.uuid,
      memberUuid: memberUuid ?? this.memberUuid,
      type: type ?? this.type,
      pointsDelta: pointsDelta ?? this.pointsDelta,
      orderUuid: orderUuid ?? this.orderUuid,
      rewardUuid: rewardUuid ?? this.rewardUuid,
      reason: reason ?? this.reason,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (uuid.present) {
      map['uuid'] = Variable<String>(uuid.value);
    }
    if (memberUuid.present) {
      map['member_uuid'] = Variable<String>(memberUuid.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (pointsDelta.present) {
      map['points_delta'] = Variable<double>(pointsDelta.value);
    }
    if (orderUuid.present) {
      map['order_uuid'] = Variable<String>(orderUuid.value);
    }
    if (rewardUuid.present) {
      map['reward_uuid'] = Variable<String>(rewardUuid.value);
    }
    if (reason.present) {
      map['reason'] = Variable<String>(reason.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LoyaltyTransactionTableCompanion(')
          ..write('id: $id, ')
          ..write('uuid: $uuid, ')
          ..write('memberUuid: $memberUuid, ')
          ..write('type: $type, ')
          ..write('pointsDelta: $pointsDelta, ')
          ..write('orderUuid: $orderUuid, ')
          ..write('rewardUuid: $rewardUuid, ')
          ..write('reason: $reason, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $LoyaltyRewardTableTable extends LoyaltyRewardTable
    with TableInfo<$LoyaltyRewardTableTable, LoyaltyRewardData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LoyaltyRewardTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _uuidMeta = const VerificationMeta('uuid');
  @override
  late final GeneratedColumn<String> uuid = GeneratedColumn<String>(
      'uuid', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _pointsCostMeta =
      const VerificationMeta('pointsCost');
  @override
  late final GeneratedColumn<double> pointsCost = GeneratedColumn<double>(
      'points_cost', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _discountTypeMeta =
      const VerificationMeta('discountType');
  @override
  late final GeneratedColumn<String> discountType = GeneratedColumn<String>(
      'discount_type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _discountValueMeta =
      const VerificationMeta('discountValue');
  @override
  late final GeneratedColumn<double> discountValue = GeneratedColumn<double>(
      'discount_value', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _applicableProductUuidMeta =
      const VerificationMeta('applicableProductUuid');
  @override
  late final GeneratedColumn<String> applicableProductUuid =
      GeneratedColumn<String>('applicable_product_uuid', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _isActiveMeta =
      const VerificationMeta('isActive');
  @override
  late final GeneratedColumn<bool> isActive = GeneratedColumn<bool>(
      'is_active', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_active" IN (0, 1))'),
      defaultValue: const Constant(true));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        uuid,
        name,
        description,
        pointsCost,
        discountType,
        discountValue,
        applicableProductUuid,
        isActive
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'loyalty_reward_table';
  @override
  VerificationContext validateIntegrity(Insertable<LoyaltyRewardData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('uuid')) {
      context.handle(
          _uuidMeta, uuid.isAcceptableOrUnknown(data['uuid']!, _uuidMeta));
    } else if (isInserting) {
      context.missing(_uuidMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    }
    if (data.containsKey('points_cost')) {
      context.handle(
          _pointsCostMeta,
          pointsCost.isAcceptableOrUnknown(
              data['points_cost']!, _pointsCostMeta));
    } else if (isInserting) {
      context.missing(_pointsCostMeta);
    }
    if (data.containsKey('discount_type')) {
      context.handle(
          _discountTypeMeta,
          discountType.isAcceptableOrUnknown(
              data['discount_type']!, _discountTypeMeta));
    } else if (isInserting) {
      context.missing(_discountTypeMeta);
    }
    if (data.containsKey('discount_value')) {
      context.handle(
          _discountValueMeta,
          discountValue.isAcceptableOrUnknown(
              data['discount_value']!, _discountValueMeta));
    } else if (isInserting) {
      context.missing(_discountValueMeta);
    }
    if (data.containsKey('applicable_product_uuid')) {
      context.handle(
          _applicableProductUuidMeta,
          applicableProductUuid.isAcceptableOrUnknown(
              data['applicable_product_uuid']!, _applicableProductUuidMeta));
    }
    if (data.containsKey('is_active')) {
      context.handle(_isActiveMeta,
          isActive.isAcceptableOrUnknown(data['is_active']!, _isActiveMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  LoyaltyRewardData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LoyaltyRewardData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      uuid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}uuid'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description']),
      pointsCost: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}points_cost'])!,
      discountType: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}discount_type'])!,
      discountValue: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}discount_value'])!,
      applicableProductUuid: attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}applicable_product_uuid']),
      isActive: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_active'])!,
    );
  }

  @override
  $LoyaltyRewardTableTable createAlias(String alias) {
    return $LoyaltyRewardTableTable(attachedDatabase, alias);
  }
}

class LoyaltyRewardData extends DataClass
    implements Insertable<LoyaltyRewardData> {
  final int id;
  final String uuid;
  final String name;
  final String? description;
  final double pointsCost;
  final String discountType;
  final double discountValue;
  final String? applicableProductUuid;
  final bool isActive;
  const LoyaltyRewardData(
      {required this.id,
      required this.uuid,
      required this.name,
      this.description,
      required this.pointsCost,
      required this.discountType,
      required this.discountValue,
      this.applicableProductUuid,
      required this.isActive});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['uuid'] = Variable<String>(uuid);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    map['points_cost'] = Variable<double>(pointsCost);
    map['discount_type'] = Variable<String>(discountType);
    map['discount_value'] = Variable<double>(discountValue);
    if (!nullToAbsent || applicableProductUuid != null) {
      map['applicable_product_uuid'] = Variable<String>(applicableProductUuid);
    }
    map['is_active'] = Variable<bool>(isActive);
    return map;
  }

  LoyaltyRewardTableCompanion toCompanion(bool nullToAbsent) {
    return LoyaltyRewardTableCompanion(
      id: Value(id),
      uuid: Value(uuid),
      name: Value(name),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      pointsCost: Value(pointsCost),
      discountType: Value(discountType),
      discountValue: Value(discountValue),
      applicableProductUuid: applicableProductUuid == null && nullToAbsent
          ? const Value.absent()
          : Value(applicableProductUuid),
      isActive: Value(isActive),
    );
  }

  factory LoyaltyRewardData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return LoyaltyRewardData(
      id: serializer.fromJson<int>(json['id']),
      uuid: serializer.fromJson<String>(json['uuid']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String?>(json['description']),
      pointsCost: serializer.fromJson<double>(json['pointsCost']),
      discountType: serializer.fromJson<String>(json['discountType']),
      discountValue: serializer.fromJson<double>(json['discountValue']),
      applicableProductUuid:
          serializer.fromJson<String?>(json['applicableProductUuid']),
      isActive: serializer.fromJson<bool>(json['isActive']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'uuid': serializer.toJson<String>(uuid),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String?>(description),
      'pointsCost': serializer.toJson<double>(pointsCost),
      'discountType': serializer.toJson<String>(discountType),
      'discountValue': serializer.toJson<double>(discountValue),
      'applicableProductUuid':
          serializer.toJson<String?>(applicableProductUuid),
      'isActive': serializer.toJson<bool>(isActive),
    };
  }

  LoyaltyRewardData copyWith(
          {int? id,
          String? uuid,
          String? name,
          Value<String?> description = const Value.absent(),
          double? pointsCost,
          String? discountType,
          double? discountValue,
          Value<String?> applicableProductUuid = const Value.absent(),
          bool? isActive}) =>
      LoyaltyRewardData(
        id: id ?? this.id,
        uuid: uuid ?? this.uuid,
        name: name ?? this.name,
        description: description.present ? description.value : this.description,
        pointsCost: pointsCost ?? this.pointsCost,
        discountType: discountType ?? this.discountType,
        discountValue: discountValue ?? this.discountValue,
        applicableProductUuid: applicableProductUuid.present
            ? applicableProductUuid.value
            : this.applicableProductUuid,
        isActive: isActive ?? this.isActive,
      );
  LoyaltyRewardData copyWithCompanion(LoyaltyRewardTableCompanion data) {
    return LoyaltyRewardData(
      id: data.id.present ? data.id.value : this.id,
      uuid: data.uuid.present ? data.uuid.value : this.uuid,
      name: data.name.present ? data.name.value : this.name,
      description:
          data.description.present ? data.description.value : this.description,
      pointsCost:
          data.pointsCost.present ? data.pointsCost.value : this.pointsCost,
      discountType: data.discountType.present
          ? data.discountType.value
          : this.discountType,
      discountValue: data.discountValue.present
          ? data.discountValue.value
          : this.discountValue,
      applicableProductUuid: data.applicableProductUuid.present
          ? data.applicableProductUuid.value
          : this.applicableProductUuid,
      isActive: data.isActive.present ? data.isActive.value : this.isActive,
    );
  }

  @override
  String toString() {
    return (StringBuffer('LoyaltyRewardData(')
          ..write('id: $id, ')
          ..write('uuid: $uuid, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('pointsCost: $pointsCost, ')
          ..write('discountType: $discountType, ')
          ..write('discountValue: $discountValue, ')
          ..write('applicableProductUuid: $applicableProductUuid, ')
          ..write('isActive: $isActive')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, uuid, name, description, pointsCost,
      discountType, discountValue, applicableProductUuid, isActive);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LoyaltyRewardData &&
          other.id == this.id &&
          other.uuid == this.uuid &&
          other.name == this.name &&
          other.description == this.description &&
          other.pointsCost == this.pointsCost &&
          other.discountType == this.discountType &&
          other.discountValue == this.discountValue &&
          other.applicableProductUuid == this.applicableProductUuid &&
          other.isActive == this.isActive);
}

class LoyaltyRewardTableCompanion extends UpdateCompanion<LoyaltyRewardData> {
  final Value<int> id;
  final Value<String> uuid;
  final Value<String> name;
  final Value<String?> description;
  final Value<double> pointsCost;
  final Value<String> discountType;
  final Value<double> discountValue;
  final Value<String?> applicableProductUuid;
  final Value<bool> isActive;
  const LoyaltyRewardTableCompanion({
    this.id = const Value.absent(),
    this.uuid = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.pointsCost = const Value.absent(),
    this.discountType = const Value.absent(),
    this.discountValue = const Value.absent(),
    this.applicableProductUuid = const Value.absent(),
    this.isActive = const Value.absent(),
  });
  LoyaltyRewardTableCompanion.insert({
    this.id = const Value.absent(),
    required String uuid,
    required String name,
    this.description = const Value.absent(),
    required double pointsCost,
    required String discountType,
    required double discountValue,
    this.applicableProductUuid = const Value.absent(),
    this.isActive = const Value.absent(),
  })  : uuid = Value(uuid),
        name = Value(name),
        pointsCost = Value(pointsCost),
        discountType = Value(discountType),
        discountValue = Value(discountValue);
  static Insertable<LoyaltyRewardData> custom({
    Expression<int>? id,
    Expression<String>? uuid,
    Expression<String>? name,
    Expression<String>? description,
    Expression<double>? pointsCost,
    Expression<String>? discountType,
    Expression<double>? discountValue,
    Expression<String>? applicableProductUuid,
    Expression<bool>? isActive,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (uuid != null) 'uuid': uuid,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (pointsCost != null) 'points_cost': pointsCost,
      if (discountType != null) 'discount_type': discountType,
      if (discountValue != null) 'discount_value': discountValue,
      if (applicableProductUuid != null)
        'applicable_product_uuid': applicableProductUuid,
      if (isActive != null) 'is_active': isActive,
    });
  }

  LoyaltyRewardTableCompanion copyWith(
      {Value<int>? id,
      Value<String>? uuid,
      Value<String>? name,
      Value<String?>? description,
      Value<double>? pointsCost,
      Value<String>? discountType,
      Value<double>? discountValue,
      Value<String?>? applicableProductUuid,
      Value<bool>? isActive}) {
    return LoyaltyRewardTableCompanion(
      id: id ?? this.id,
      uuid: uuid ?? this.uuid,
      name: name ?? this.name,
      description: description ?? this.description,
      pointsCost: pointsCost ?? this.pointsCost,
      discountType: discountType ?? this.discountType,
      discountValue: discountValue ?? this.discountValue,
      applicableProductUuid:
          applicableProductUuid ?? this.applicableProductUuid,
      isActive: isActive ?? this.isActive,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (uuid.present) {
      map['uuid'] = Variable<String>(uuid.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (pointsCost.present) {
      map['points_cost'] = Variable<double>(pointsCost.value);
    }
    if (discountType.present) {
      map['discount_type'] = Variable<String>(discountType.value);
    }
    if (discountValue.present) {
      map['discount_value'] = Variable<double>(discountValue.value);
    }
    if (applicableProductUuid.present) {
      map['applicable_product_uuid'] =
          Variable<String>(applicableProductUuid.value);
    }
    if (isActive.present) {
      map['is_active'] = Variable<bool>(isActive.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LoyaltyRewardTableCompanion(')
          ..write('id: $id, ')
          ..write('uuid: $uuid, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('pointsCost: $pointsCost, ')
          ..write('discountType: $discountType, ')
          ..write('discountValue: $discountValue, ')
          ..write('applicableProductUuid: $applicableProductUuid, ')
          ..write('isActive: $isActive')
          ..write(')'))
        .toString();
  }
}

class $TipTableTable extends TipTable
    with TableInfo<$TipTableTable, TipTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TipTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _uuidMeta = const VerificationMeta('uuid');
  @override
  late final GeneratedColumn<String> uuid = GeneratedColumn<String>(
      'uuid', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'));
  static const VerificationMeta _orderUuidMeta =
      const VerificationMeta('orderUuid');
  @override
  late final GeneratedColumn<String> orderUuid = GeneratedColumn<String>(
      'order_uuid', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _orderNumberMeta =
      const VerificationMeta('orderNumber');
  @override
  late final GeneratedColumn<String> orderNumber = GeneratedColumn<String>(
      'order_number', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _tipTypeMeta =
      const VerificationMeta('tipType');
  @override
  late final GeneratedColumn<String> tipType = GeneratedColumn<String>(
      'tip_type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedColumn<double> amount = GeneratedColumn<double>(
      'amount', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _processedByUuidMeta =
      const VerificationMeta('processedByUuid');
  @override
  late final GeneratedColumn<String> processedByUuid = GeneratedColumn<String>(
      'processed_by_uuid', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _processedByNameMeta =
      const VerificationMeta('processedByName');
  @override
  late final GeneratedColumn<String> processedByName = GeneratedColumn<String>(
      'processed_by_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _isPooledMeta =
      const VerificationMeta('isPooled');
  @override
  late final GeneratedColumn<bool> isPooled = GeneratedColumn<bool>(
      'is_pooled', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_pooled" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _poolUuidMeta =
      const VerificationMeta('poolUuid');
  @override
  late final GeneratedColumn<String> poolUuid = GeneratedColumn<String>(
      'pool_uuid', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
      'notes', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        uuid,
        orderUuid,
        orderNumber,
        tipType,
        amount,
        processedByUuid,
        processedByName,
        isPooled,
        poolUuid,
        notes,
        createdAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'tip_table';
  @override
  VerificationContext validateIntegrity(Insertable<TipTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('uuid')) {
      context.handle(
          _uuidMeta, uuid.isAcceptableOrUnknown(data['uuid']!, _uuidMeta));
    } else if (isInserting) {
      context.missing(_uuidMeta);
    }
    if (data.containsKey('order_uuid')) {
      context.handle(_orderUuidMeta,
          orderUuid.isAcceptableOrUnknown(data['order_uuid']!, _orderUuidMeta));
    } else if (isInserting) {
      context.missing(_orderUuidMeta);
    }
    if (data.containsKey('order_number')) {
      context.handle(
          _orderNumberMeta,
          orderNumber.isAcceptableOrUnknown(
              data['order_number']!, _orderNumberMeta));
    } else if (isInserting) {
      context.missing(_orderNumberMeta);
    }
    if (data.containsKey('tip_type')) {
      context.handle(_tipTypeMeta,
          tipType.isAcceptableOrUnknown(data['tip_type']!, _tipTypeMeta));
    } else if (isInserting) {
      context.missing(_tipTypeMeta);
    }
    if (data.containsKey('amount')) {
      context.handle(_amountMeta,
          amount.isAcceptableOrUnknown(data['amount']!, _amountMeta));
    } else if (isInserting) {
      context.missing(_amountMeta);
    }
    if (data.containsKey('processed_by_uuid')) {
      context.handle(
          _processedByUuidMeta,
          processedByUuid.isAcceptableOrUnknown(
              data['processed_by_uuid']!, _processedByUuidMeta));
    } else if (isInserting) {
      context.missing(_processedByUuidMeta);
    }
    if (data.containsKey('processed_by_name')) {
      context.handle(
          _processedByNameMeta,
          processedByName.isAcceptableOrUnknown(
              data['processed_by_name']!, _processedByNameMeta));
    } else if (isInserting) {
      context.missing(_processedByNameMeta);
    }
    if (data.containsKey('is_pooled')) {
      context.handle(_isPooledMeta,
          isPooled.isAcceptableOrUnknown(data['is_pooled']!, _isPooledMeta));
    }
    if (data.containsKey('pool_uuid')) {
      context.handle(_poolUuidMeta,
          poolUuid.isAcceptableOrUnknown(data['pool_uuid']!, _poolUuidMeta));
    }
    if (data.containsKey('notes')) {
      context.handle(
          _notesMeta, notes.isAcceptableOrUnknown(data['notes']!, _notesMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TipTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TipTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      uuid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}uuid'])!,
      orderUuid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}order_uuid'])!,
      orderNumber: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}order_number'])!,
      tipType: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}tip_type'])!,
      amount: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}amount'])!,
      processedByUuid: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}processed_by_uuid'])!,
      processedByName: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}processed_by_name'])!,
      isPooled: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_pooled'])!,
      poolUuid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}pool_uuid']),
      notes: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}notes']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
    );
  }

  @override
  $TipTableTable createAlias(String alias) {
    return $TipTableTable(attachedDatabase, alias);
  }
}

class TipTableData extends DataClass implements Insertable<TipTableData> {
  final int id;
  final String uuid;
  final String orderUuid;
  final String orderNumber;
  final String tipType;
  final double amount;
  final String processedByUuid;
  final String processedByName;
  final bool isPooled;
  final String? poolUuid;
  final String? notes;
  final DateTime createdAt;
  const TipTableData(
      {required this.id,
      required this.uuid,
      required this.orderUuid,
      required this.orderNumber,
      required this.tipType,
      required this.amount,
      required this.processedByUuid,
      required this.processedByName,
      required this.isPooled,
      this.poolUuid,
      this.notes,
      required this.createdAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['uuid'] = Variable<String>(uuid);
    map['order_uuid'] = Variable<String>(orderUuid);
    map['order_number'] = Variable<String>(orderNumber);
    map['tip_type'] = Variable<String>(tipType);
    map['amount'] = Variable<double>(amount);
    map['processed_by_uuid'] = Variable<String>(processedByUuid);
    map['processed_by_name'] = Variable<String>(processedByName);
    map['is_pooled'] = Variable<bool>(isPooled);
    if (!nullToAbsent || poolUuid != null) {
      map['pool_uuid'] = Variable<String>(poolUuid);
    }
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  TipTableCompanion toCompanion(bool nullToAbsent) {
    return TipTableCompanion(
      id: Value(id),
      uuid: Value(uuid),
      orderUuid: Value(orderUuid),
      orderNumber: Value(orderNumber),
      tipType: Value(tipType),
      amount: Value(amount),
      processedByUuid: Value(processedByUuid),
      processedByName: Value(processedByName),
      isPooled: Value(isPooled),
      poolUuid: poolUuid == null && nullToAbsent
          ? const Value.absent()
          : Value(poolUuid),
      notes:
          notes == null && nullToAbsent ? const Value.absent() : Value(notes),
      createdAt: Value(createdAt),
    );
  }

  factory TipTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TipTableData(
      id: serializer.fromJson<int>(json['id']),
      uuid: serializer.fromJson<String>(json['uuid']),
      orderUuid: serializer.fromJson<String>(json['orderUuid']),
      orderNumber: serializer.fromJson<String>(json['orderNumber']),
      tipType: serializer.fromJson<String>(json['tipType']),
      amount: serializer.fromJson<double>(json['amount']),
      processedByUuid: serializer.fromJson<String>(json['processedByUuid']),
      processedByName: serializer.fromJson<String>(json['processedByName']),
      isPooled: serializer.fromJson<bool>(json['isPooled']),
      poolUuid: serializer.fromJson<String?>(json['poolUuid']),
      notes: serializer.fromJson<String?>(json['notes']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'uuid': serializer.toJson<String>(uuid),
      'orderUuid': serializer.toJson<String>(orderUuid),
      'orderNumber': serializer.toJson<String>(orderNumber),
      'tipType': serializer.toJson<String>(tipType),
      'amount': serializer.toJson<double>(amount),
      'processedByUuid': serializer.toJson<String>(processedByUuid),
      'processedByName': serializer.toJson<String>(processedByName),
      'isPooled': serializer.toJson<bool>(isPooled),
      'poolUuid': serializer.toJson<String?>(poolUuid),
      'notes': serializer.toJson<String?>(notes),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  TipTableData copyWith(
          {int? id,
          String? uuid,
          String? orderUuid,
          String? orderNumber,
          String? tipType,
          double? amount,
          String? processedByUuid,
          String? processedByName,
          bool? isPooled,
          Value<String?> poolUuid = const Value.absent(),
          Value<String?> notes = const Value.absent(),
          DateTime? createdAt}) =>
      TipTableData(
        id: id ?? this.id,
        uuid: uuid ?? this.uuid,
        orderUuid: orderUuid ?? this.orderUuid,
        orderNumber: orderNumber ?? this.orderNumber,
        tipType: tipType ?? this.tipType,
        amount: amount ?? this.amount,
        processedByUuid: processedByUuid ?? this.processedByUuid,
        processedByName: processedByName ?? this.processedByName,
        isPooled: isPooled ?? this.isPooled,
        poolUuid: poolUuid.present ? poolUuid.value : this.poolUuid,
        notes: notes.present ? notes.value : this.notes,
        createdAt: createdAt ?? this.createdAt,
      );
  TipTableData copyWithCompanion(TipTableCompanion data) {
    return TipTableData(
      id: data.id.present ? data.id.value : this.id,
      uuid: data.uuid.present ? data.uuid.value : this.uuid,
      orderUuid: data.orderUuid.present ? data.orderUuid.value : this.orderUuid,
      orderNumber:
          data.orderNumber.present ? data.orderNumber.value : this.orderNumber,
      tipType: data.tipType.present ? data.tipType.value : this.tipType,
      amount: data.amount.present ? data.amount.value : this.amount,
      processedByUuid: data.processedByUuid.present
          ? data.processedByUuid.value
          : this.processedByUuid,
      processedByName: data.processedByName.present
          ? data.processedByName.value
          : this.processedByName,
      isPooled: data.isPooled.present ? data.isPooled.value : this.isPooled,
      poolUuid: data.poolUuid.present ? data.poolUuid.value : this.poolUuid,
      notes: data.notes.present ? data.notes.value : this.notes,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TipTableData(')
          ..write('id: $id, ')
          ..write('uuid: $uuid, ')
          ..write('orderUuid: $orderUuid, ')
          ..write('orderNumber: $orderNumber, ')
          ..write('tipType: $tipType, ')
          ..write('amount: $amount, ')
          ..write('processedByUuid: $processedByUuid, ')
          ..write('processedByName: $processedByName, ')
          ..write('isPooled: $isPooled, ')
          ..write('poolUuid: $poolUuid, ')
          ..write('notes: $notes, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      uuid,
      orderUuid,
      orderNumber,
      tipType,
      amount,
      processedByUuid,
      processedByName,
      isPooled,
      poolUuid,
      notes,
      createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TipTableData &&
          other.id == this.id &&
          other.uuid == this.uuid &&
          other.orderUuid == this.orderUuid &&
          other.orderNumber == this.orderNumber &&
          other.tipType == this.tipType &&
          other.amount == this.amount &&
          other.processedByUuid == this.processedByUuid &&
          other.processedByName == this.processedByName &&
          other.isPooled == this.isPooled &&
          other.poolUuid == this.poolUuid &&
          other.notes == this.notes &&
          other.createdAt == this.createdAt);
}

class TipTableCompanion extends UpdateCompanion<TipTableData> {
  final Value<int> id;
  final Value<String> uuid;
  final Value<String> orderUuid;
  final Value<String> orderNumber;
  final Value<String> tipType;
  final Value<double> amount;
  final Value<String> processedByUuid;
  final Value<String> processedByName;
  final Value<bool> isPooled;
  final Value<String?> poolUuid;
  final Value<String?> notes;
  final Value<DateTime> createdAt;
  const TipTableCompanion({
    this.id = const Value.absent(),
    this.uuid = const Value.absent(),
    this.orderUuid = const Value.absent(),
    this.orderNumber = const Value.absent(),
    this.tipType = const Value.absent(),
    this.amount = const Value.absent(),
    this.processedByUuid = const Value.absent(),
    this.processedByName = const Value.absent(),
    this.isPooled = const Value.absent(),
    this.poolUuid = const Value.absent(),
    this.notes = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  TipTableCompanion.insert({
    this.id = const Value.absent(),
    required String uuid,
    required String orderUuid,
    required String orderNumber,
    required String tipType,
    required double amount,
    required String processedByUuid,
    required String processedByName,
    this.isPooled = const Value.absent(),
    this.poolUuid = const Value.absent(),
    this.notes = const Value.absent(),
    required DateTime createdAt,
  })  : uuid = Value(uuid),
        orderUuid = Value(orderUuid),
        orderNumber = Value(orderNumber),
        tipType = Value(tipType),
        amount = Value(amount),
        processedByUuid = Value(processedByUuid),
        processedByName = Value(processedByName),
        createdAt = Value(createdAt);
  static Insertable<TipTableData> custom({
    Expression<int>? id,
    Expression<String>? uuid,
    Expression<String>? orderUuid,
    Expression<String>? orderNumber,
    Expression<String>? tipType,
    Expression<double>? amount,
    Expression<String>? processedByUuid,
    Expression<String>? processedByName,
    Expression<bool>? isPooled,
    Expression<String>? poolUuid,
    Expression<String>? notes,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (uuid != null) 'uuid': uuid,
      if (orderUuid != null) 'order_uuid': orderUuid,
      if (orderNumber != null) 'order_number': orderNumber,
      if (tipType != null) 'tip_type': tipType,
      if (amount != null) 'amount': amount,
      if (processedByUuid != null) 'processed_by_uuid': processedByUuid,
      if (processedByName != null) 'processed_by_name': processedByName,
      if (isPooled != null) 'is_pooled': isPooled,
      if (poolUuid != null) 'pool_uuid': poolUuid,
      if (notes != null) 'notes': notes,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  TipTableCompanion copyWith(
      {Value<int>? id,
      Value<String>? uuid,
      Value<String>? orderUuid,
      Value<String>? orderNumber,
      Value<String>? tipType,
      Value<double>? amount,
      Value<String>? processedByUuid,
      Value<String>? processedByName,
      Value<bool>? isPooled,
      Value<String?>? poolUuid,
      Value<String?>? notes,
      Value<DateTime>? createdAt}) {
    return TipTableCompanion(
      id: id ?? this.id,
      uuid: uuid ?? this.uuid,
      orderUuid: orderUuid ?? this.orderUuid,
      orderNumber: orderNumber ?? this.orderNumber,
      tipType: tipType ?? this.tipType,
      amount: amount ?? this.amount,
      processedByUuid: processedByUuid ?? this.processedByUuid,
      processedByName: processedByName ?? this.processedByName,
      isPooled: isPooled ?? this.isPooled,
      poolUuid: poolUuid ?? this.poolUuid,
      notes: notes ?? this.notes,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (uuid.present) {
      map['uuid'] = Variable<String>(uuid.value);
    }
    if (orderUuid.present) {
      map['order_uuid'] = Variable<String>(orderUuid.value);
    }
    if (orderNumber.present) {
      map['order_number'] = Variable<String>(orderNumber.value);
    }
    if (tipType.present) {
      map['tip_type'] = Variable<String>(tipType.value);
    }
    if (amount.present) {
      map['amount'] = Variable<double>(amount.value);
    }
    if (processedByUuid.present) {
      map['processed_by_uuid'] = Variable<String>(processedByUuid.value);
    }
    if (processedByName.present) {
      map['processed_by_name'] = Variable<String>(processedByName.value);
    }
    if (isPooled.present) {
      map['is_pooled'] = Variable<bool>(isPooled.value);
    }
    if (poolUuid.present) {
      map['pool_uuid'] = Variable<String>(poolUuid.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TipTableCompanion(')
          ..write('id: $id, ')
          ..write('uuid: $uuid, ')
          ..write('orderUuid: $orderUuid, ')
          ..write('orderNumber: $orderNumber, ')
          ..write('tipType: $tipType, ')
          ..write('amount: $amount, ')
          ..write('processedByUuid: $processedByUuid, ')
          ..write('processedByName: $processedByName, ')
          ..write('isPooled: $isPooled, ')
          ..write('poolUuid: $poolUuid, ')
          ..write('notes: $notes, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $SplitBillTableTable extends SplitBillTable
    with TableInfo<$SplitBillTableTable, SplitBillTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SplitBillTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _uuidMeta = const VerificationMeta('uuid');
  @override
  late final GeneratedColumn<String> uuid = GeneratedColumn<String>(
      'uuid', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'));
  static const VerificationMeta _orderUuidMeta =
      const VerificationMeta('orderUuid');
  @override
  late final GeneratedColumn<String> orderUuid = GeneratedColumn<String>(
      'order_uuid', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _orderNumberMeta =
      const VerificationMeta('orderNumber');
  @override
  late final GeneratedColumn<String> orderNumber = GeneratedColumn<String>(
      'order_number', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _originalTotalMeta =
      const VerificationMeta('originalTotal');
  @override
  late final GeneratedColumn<double> originalTotal = GeneratedColumn<double>(
      'original_total', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _guestCountMeta =
      const VerificationMeta('guestCount');
  @override
  late final GeneratedColumn<int> guestCount = GeneratedColumn<int>(
      'guest_count', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _splitModeMeta =
      const VerificationMeta('splitMode');
  @override
  late final GeneratedColumn<String> splitMode = GeneratedColumn<String>(
      'split_mode', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
      'status', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('active'));
  static const VerificationMeta _createdByUuidMeta =
      const VerificationMeta('createdByUuid');
  @override
  late final GeneratedColumn<String> createdByUuid = GeneratedColumn<String>(
      'created_by_uuid', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _createdByNameMeta =
      const VerificationMeta('createdByName');
  @override
  late final GeneratedColumn<String> createdByName = GeneratedColumn<String>(
      'created_by_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _completedAtMeta =
      const VerificationMeta('completedAt');
  @override
  late final GeneratedColumn<DateTime> completedAt = GeneratedColumn<DateTime>(
      'completed_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        uuid,
        orderUuid,
        orderNumber,
        originalTotal,
        guestCount,
        splitMode,
        status,
        createdByUuid,
        createdByName,
        createdAt,
        completedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'split_bill_table';
  @override
  VerificationContext validateIntegrity(Insertable<SplitBillTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('uuid')) {
      context.handle(
          _uuidMeta, uuid.isAcceptableOrUnknown(data['uuid']!, _uuidMeta));
    } else if (isInserting) {
      context.missing(_uuidMeta);
    }
    if (data.containsKey('order_uuid')) {
      context.handle(_orderUuidMeta,
          orderUuid.isAcceptableOrUnknown(data['order_uuid']!, _orderUuidMeta));
    } else if (isInserting) {
      context.missing(_orderUuidMeta);
    }
    if (data.containsKey('order_number')) {
      context.handle(
          _orderNumberMeta,
          orderNumber.isAcceptableOrUnknown(
              data['order_number']!, _orderNumberMeta));
    } else if (isInserting) {
      context.missing(_orderNumberMeta);
    }
    if (data.containsKey('original_total')) {
      context.handle(
          _originalTotalMeta,
          originalTotal.isAcceptableOrUnknown(
              data['original_total']!, _originalTotalMeta));
    } else if (isInserting) {
      context.missing(_originalTotalMeta);
    }
    if (data.containsKey('guest_count')) {
      context.handle(
          _guestCountMeta,
          guestCount.isAcceptableOrUnknown(
              data['guest_count']!, _guestCountMeta));
    } else if (isInserting) {
      context.missing(_guestCountMeta);
    }
    if (data.containsKey('split_mode')) {
      context.handle(_splitModeMeta,
          splitMode.isAcceptableOrUnknown(data['split_mode']!, _splitModeMeta));
    } else if (isInserting) {
      context.missing(_splitModeMeta);
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status']!, _statusMeta));
    }
    if (data.containsKey('created_by_uuid')) {
      context.handle(
          _createdByUuidMeta,
          createdByUuid.isAcceptableOrUnknown(
              data['created_by_uuid']!, _createdByUuidMeta));
    } else if (isInserting) {
      context.missing(_createdByUuidMeta);
    }
    if (data.containsKey('created_by_name')) {
      context.handle(
          _createdByNameMeta,
          createdByName.isAcceptableOrUnknown(
              data['created_by_name']!, _createdByNameMeta));
    } else if (isInserting) {
      context.missing(_createdByNameMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('completed_at')) {
      context.handle(
          _completedAtMeta,
          completedAt.isAcceptableOrUnknown(
              data['completed_at']!, _completedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SplitBillTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SplitBillTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      uuid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}uuid'])!,
      orderUuid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}order_uuid'])!,
      orderNumber: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}order_number'])!,
      originalTotal: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}original_total'])!,
      guestCount: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}guest_count'])!,
      splitMode: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}split_mode'])!,
      status: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}status'])!,
      createdByUuid: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}created_by_uuid'])!,
      createdByName: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}created_by_name'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      completedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}completed_at']),
    );
  }

  @override
  $SplitBillTableTable createAlias(String alias) {
    return $SplitBillTableTable(attachedDatabase, alias);
  }
}

class SplitBillTableData extends DataClass
    implements Insertable<SplitBillTableData> {
  final int id;
  final String uuid;
  final String orderUuid;
  final String orderNumber;
  final double originalTotal;
  final int guestCount;
  final String splitMode;
  final String status;
  final String createdByUuid;
  final String createdByName;
  final DateTime createdAt;
  final DateTime? completedAt;
  const SplitBillTableData(
      {required this.id,
      required this.uuid,
      required this.orderUuid,
      required this.orderNumber,
      required this.originalTotal,
      required this.guestCount,
      required this.splitMode,
      required this.status,
      required this.createdByUuid,
      required this.createdByName,
      required this.createdAt,
      this.completedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['uuid'] = Variable<String>(uuid);
    map['order_uuid'] = Variable<String>(orderUuid);
    map['order_number'] = Variable<String>(orderNumber);
    map['original_total'] = Variable<double>(originalTotal);
    map['guest_count'] = Variable<int>(guestCount);
    map['split_mode'] = Variable<String>(splitMode);
    map['status'] = Variable<String>(status);
    map['created_by_uuid'] = Variable<String>(createdByUuid);
    map['created_by_name'] = Variable<String>(createdByName);
    map['created_at'] = Variable<DateTime>(createdAt);
    if (!nullToAbsent || completedAt != null) {
      map['completed_at'] = Variable<DateTime>(completedAt);
    }
    return map;
  }

  SplitBillTableCompanion toCompanion(bool nullToAbsent) {
    return SplitBillTableCompanion(
      id: Value(id),
      uuid: Value(uuid),
      orderUuid: Value(orderUuid),
      orderNumber: Value(orderNumber),
      originalTotal: Value(originalTotal),
      guestCount: Value(guestCount),
      splitMode: Value(splitMode),
      status: Value(status),
      createdByUuid: Value(createdByUuid),
      createdByName: Value(createdByName),
      createdAt: Value(createdAt),
      completedAt: completedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(completedAt),
    );
  }

  factory SplitBillTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SplitBillTableData(
      id: serializer.fromJson<int>(json['id']),
      uuid: serializer.fromJson<String>(json['uuid']),
      orderUuid: serializer.fromJson<String>(json['orderUuid']),
      orderNumber: serializer.fromJson<String>(json['orderNumber']),
      originalTotal: serializer.fromJson<double>(json['originalTotal']),
      guestCount: serializer.fromJson<int>(json['guestCount']),
      splitMode: serializer.fromJson<String>(json['splitMode']),
      status: serializer.fromJson<String>(json['status']),
      createdByUuid: serializer.fromJson<String>(json['createdByUuid']),
      createdByName: serializer.fromJson<String>(json['createdByName']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      completedAt: serializer.fromJson<DateTime?>(json['completedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'uuid': serializer.toJson<String>(uuid),
      'orderUuid': serializer.toJson<String>(orderUuid),
      'orderNumber': serializer.toJson<String>(orderNumber),
      'originalTotal': serializer.toJson<double>(originalTotal),
      'guestCount': serializer.toJson<int>(guestCount),
      'splitMode': serializer.toJson<String>(splitMode),
      'status': serializer.toJson<String>(status),
      'createdByUuid': serializer.toJson<String>(createdByUuid),
      'createdByName': serializer.toJson<String>(createdByName),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'completedAt': serializer.toJson<DateTime?>(completedAt),
    };
  }

  SplitBillTableData copyWith(
          {int? id,
          String? uuid,
          String? orderUuid,
          String? orderNumber,
          double? originalTotal,
          int? guestCount,
          String? splitMode,
          String? status,
          String? createdByUuid,
          String? createdByName,
          DateTime? createdAt,
          Value<DateTime?> completedAt = const Value.absent()}) =>
      SplitBillTableData(
        id: id ?? this.id,
        uuid: uuid ?? this.uuid,
        orderUuid: orderUuid ?? this.orderUuid,
        orderNumber: orderNumber ?? this.orderNumber,
        originalTotal: originalTotal ?? this.originalTotal,
        guestCount: guestCount ?? this.guestCount,
        splitMode: splitMode ?? this.splitMode,
        status: status ?? this.status,
        createdByUuid: createdByUuid ?? this.createdByUuid,
        createdByName: createdByName ?? this.createdByName,
        createdAt: createdAt ?? this.createdAt,
        completedAt: completedAt.present ? completedAt.value : this.completedAt,
      );
  SplitBillTableData copyWithCompanion(SplitBillTableCompanion data) {
    return SplitBillTableData(
      id: data.id.present ? data.id.value : this.id,
      uuid: data.uuid.present ? data.uuid.value : this.uuid,
      orderUuid: data.orderUuid.present ? data.orderUuid.value : this.orderUuid,
      orderNumber:
          data.orderNumber.present ? data.orderNumber.value : this.orderNumber,
      originalTotal: data.originalTotal.present
          ? data.originalTotal.value
          : this.originalTotal,
      guestCount:
          data.guestCount.present ? data.guestCount.value : this.guestCount,
      splitMode: data.splitMode.present ? data.splitMode.value : this.splitMode,
      status: data.status.present ? data.status.value : this.status,
      createdByUuid: data.createdByUuid.present
          ? data.createdByUuid.value
          : this.createdByUuid,
      createdByName: data.createdByName.present
          ? data.createdByName.value
          : this.createdByName,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      completedAt:
          data.completedAt.present ? data.completedAt.value : this.completedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SplitBillTableData(')
          ..write('id: $id, ')
          ..write('uuid: $uuid, ')
          ..write('orderUuid: $orderUuid, ')
          ..write('orderNumber: $orderNumber, ')
          ..write('originalTotal: $originalTotal, ')
          ..write('guestCount: $guestCount, ')
          ..write('splitMode: $splitMode, ')
          ..write('status: $status, ')
          ..write('createdByUuid: $createdByUuid, ')
          ..write('createdByName: $createdByName, ')
          ..write('createdAt: $createdAt, ')
          ..write('completedAt: $completedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      uuid,
      orderUuid,
      orderNumber,
      originalTotal,
      guestCount,
      splitMode,
      status,
      createdByUuid,
      createdByName,
      createdAt,
      completedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SplitBillTableData &&
          other.id == this.id &&
          other.uuid == this.uuid &&
          other.orderUuid == this.orderUuid &&
          other.orderNumber == this.orderNumber &&
          other.originalTotal == this.originalTotal &&
          other.guestCount == this.guestCount &&
          other.splitMode == this.splitMode &&
          other.status == this.status &&
          other.createdByUuid == this.createdByUuid &&
          other.createdByName == this.createdByName &&
          other.createdAt == this.createdAt &&
          other.completedAt == this.completedAt);
}

class SplitBillTableCompanion extends UpdateCompanion<SplitBillTableData> {
  final Value<int> id;
  final Value<String> uuid;
  final Value<String> orderUuid;
  final Value<String> orderNumber;
  final Value<double> originalTotal;
  final Value<int> guestCount;
  final Value<String> splitMode;
  final Value<String> status;
  final Value<String> createdByUuid;
  final Value<String> createdByName;
  final Value<DateTime> createdAt;
  final Value<DateTime?> completedAt;
  const SplitBillTableCompanion({
    this.id = const Value.absent(),
    this.uuid = const Value.absent(),
    this.orderUuid = const Value.absent(),
    this.orderNumber = const Value.absent(),
    this.originalTotal = const Value.absent(),
    this.guestCount = const Value.absent(),
    this.splitMode = const Value.absent(),
    this.status = const Value.absent(),
    this.createdByUuid = const Value.absent(),
    this.createdByName = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.completedAt = const Value.absent(),
  });
  SplitBillTableCompanion.insert({
    this.id = const Value.absent(),
    required String uuid,
    required String orderUuid,
    required String orderNumber,
    required double originalTotal,
    required int guestCount,
    required String splitMode,
    this.status = const Value.absent(),
    required String createdByUuid,
    required String createdByName,
    required DateTime createdAt,
    this.completedAt = const Value.absent(),
  })  : uuid = Value(uuid),
        orderUuid = Value(orderUuid),
        orderNumber = Value(orderNumber),
        originalTotal = Value(originalTotal),
        guestCount = Value(guestCount),
        splitMode = Value(splitMode),
        createdByUuid = Value(createdByUuid),
        createdByName = Value(createdByName),
        createdAt = Value(createdAt);
  static Insertable<SplitBillTableData> custom({
    Expression<int>? id,
    Expression<String>? uuid,
    Expression<String>? orderUuid,
    Expression<String>? orderNumber,
    Expression<double>? originalTotal,
    Expression<int>? guestCount,
    Expression<String>? splitMode,
    Expression<String>? status,
    Expression<String>? createdByUuid,
    Expression<String>? createdByName,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? completedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (uuid != null) 'uuid': uuid,
      if (orderUuid != null) 'order_uuid': orderUuid,
      if (orderNumber != null) 'order_number': orderNumber,
      if (originalTotal != null) 'original_total': originalTotal,
      if (guestCount != null) 'guest_count': guestCount,
      if (splitMode != null) 'split_mode': splitMode,
      if (status != null) 'status': status,
      if (createdByUuid != null) 'created_by_uuid': createdByUuid,
      if (createdByName != null) 'created_by_name': createdByName,
      if (createdAt != null) 'created_at': createdAt,
      if (completedAt != null) 'completed_at': completedAt,
    });
  }

  SplitBillTableCompanion copyWith(
      {Value<int>? id,
      Value<String>? uuid,
      Value<String>? orderUuid,
      Value<String>? orderNumber,
      Value<double>? originalTotal,
      Value<int>? guestCount,
      Value<String>? splitMode,
      Value<String>? status,
      Value<String>? createdByUuid,
      Value<String>? createdByName,
      Value<DateTime>? createdAt,
      Value<DateTime?>? completedAt}) {
    return SplitBillTableCompanion(
      id: id ?? this.id,
      uuid: uuid ?? this.uuid,
      orderUuid: orderUuid ?? this.orderUuid,
      orderNumber: orderNumber ?? this.orderNumber,
      originalTotal: originalTotal ?? this.originalTotal,
      guestCount: guestCount ?? this.guestCount,
      splitMode: splitMode ?? this.splitMode,
      status: status ?? this.status,
      createdByUuid: createdByUuid ?? this.createdByUuid,
      createdByName: createdByName ?? this.createdByName,
      createdAt: createdAt ?? this.createdAt,
      completedAt: completedAt ?? this.completedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (uuid.present) {
      map['uuid'] = Variable<String>(uuid.value);
    }
    if (orderUuid.present) {
      map['order_uuid'] = Variable<String>(orderUuid.value);
    }
    if (orderNumber.present) {
      map['order_number'] = Variable<String>(orderNumber.value);
    }
    if (originalTotal.present) {
      map['original_total'] = Variable<double>(originalTotal.value);
    }
    if (guestCount.present) {
      map['guest_count'] = Variable<int>(guestCount.value);
    }
    if (splitMode.present) {
      map['split_mode'] = Variable<String>(splitMode.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (createdByUuid.present) {
      map['created_by_uuid'] = Variable<String>(createdByUuid.value);
    }
    if (createdByName.present) {
      map['created_by_name'] = Variable<String>(createdByName.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (completedAt.present) {
      map['completed_at'] = Variable<DateTime>(completedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SplitBillTableCompanion(')
          ..write('id: $id, ')
          ..write('uuid: $uuid, ')
          ..write('orderUuid: $orderUuid, ')
          ..write('orderNumber: $orderNumber, ')
          ..write('originalTotal: $originalTotal, ')
          ..write('guestCount: $guestCount, ')
          ..write('splitMode: $splitMode, ')
          ..write('status: $status, ')
          ..write('createdByUuid: $createdByUuid, ')
          ..write('createdByName: $createdByName, ')
          ..write('createdAt: $createdAt, ')
          ..write('completedAt: $completedAt')
          ..write(')'))
        .toString();
  }
}

class $DiscountTableTable extends DiscountTable
    with TableInfo<$DiscountTableTable, DiscountTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DiscountTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _uuidMeta = const VerificationMeta('uuid');
  @override
  late final GeneratedColumn<String> uuid = GeneratedColumn<String>(
      'uuid', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _codeMeta = const VerificationMeta('code');
  @override
  late final GeneratedColumn<String> code = GeneratedColumn<String>(
      'code', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'));
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
      'type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _scopeMeta = const VerificationMeta('scope');
  @override
  late final GeneratedColumn<String> scope = GeneratedColumn<String>(
      'scope', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
      'status', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('active'));
  static const VerificationMeta _percentageOffMeta =
      const VerificationMeta('percentageOff');
  @override
  late final GeneratedColumn<double> percentageOff = GeneratedColumn<double>(
      'percentage_off', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _fixedAmountOffMeta =
      const VerificationMeta('fixedAmountOff');
  @override
  late final GeneratedColumn<double> fixedAmountOff = GeneratedColumn<double>(
      'fixed_amount_off', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _buyQuantityMeta =
      const VerificationMeta('buyQuantity');
  @override
  late final GeneratedColumn<int> buyQuantity = GeneratedColumn<int>(
      'buy_quantity', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _getQuantityMeta =
      const VerificationMeta('getQuantity');
  @override
  late final GeneratedColumn<int> getQuantity = GeneratedColumn<int>(
      'get_quantity', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _getDiscountPercentMeta =
      const VerificationMeta('getDiscountPercent');
  @override
  late final GeneratedColumn<double> getDiscountPercent =
      GeneratedColumn<double>('get_discount_percent', aliasedName, true,
          type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _tiersJsonMeta =
      const VerificationMeta('tiersJson');
  @override
  late final GeneratedColumn<String> tiersJson = GeneratedColumn<String>(
      'tiers_json', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('[]'));
  static const VerificationMeta _applicableProductUuidsJsonMeta =
      const VerificationMeta('applicableProductUuidsJson');
  @override
  late final GeneratedColumn<String> applicableProductUuidsJson =
      GeneratedColumn<String>(
          'applicable_product_uuids_json', aliasedName, false,
          type: DriftSqlType.string,
          requiredDuringInsert: false,
          defaultValue: const Constant('[]'));
  static const VerificationMeta _applicableCategoryUuidsJsonMeta =
      const VerificationMeta('applicableCategoryUuidsJson');
  @override
  late final GeneratedColumn<String> applicableCategoryUuidsJson =
      GeneratedColumn<String>(
          'applicable_category_uuids_json', aliasedName, false,
          type: DriftSqlType.string,
          requiredDuringInsert: false,
          defaultValue: const Constant('[]'));
  static const VerificationMeta _applicableCustomerUuidsJsonMeta =
      const VerificationMeta('applicableCustomerUuidsJson');
  @override
  late final GeneratedColumn<String> applicableCustomerUuidsJson =
      GeneratedColumn<String>(
          'applicable_customer_uuids_json', aliasedName, false,
          type: DriftSqlType.string,
          requiredDuringInsert: false,
          defaultValue: const Constant('[]'));
  static const VerificationMeta _minOrderAmountMeta =
      const VerificationMeta('minOrderAmount');
  @override
  late final GeneratedColumn<double> minOrderAmount = GeneratedColumn<double>(
      'min_order_amount', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _maxDiscountAmountMeta =
      const VerificationMeta('maxDiscountAmount');
  @override
  late final GeneratedColumn<double> maxDiscountAmount =
      GeneratedColumn<double>('max_discount_amount', aliasedName, true,
          type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _maxUsesTotalMeta =
      const VerificationMeta('maxUsesTotal');
  @override
  late final GeneratedColumn<int> maxUsesTotal = GeneratedColumn<int>(
      'max_uses_total', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _maxUsesPerCustomerMeta =
      const VerificationMeta('maxUsesPerCustomer');
  @override
  late final GeneratedColumn<int> maxUsesPerCustomer = GeneratedColumn<int>(
      'max_uses_per_customer', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _currentUsageCountMeta =
      const VerificationMeta('currentUsageCount');
  @override
  late final GeneratedColumn<int> currentUsageCount = GeneratedColumn<int>(
      'current_usage_count', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _validFromMeta =
      const VerificationMeta('validFrom');
  @override
  late final GeneratedColumn<DateTime> validFrom = GeneratedColumn<DateTime>(
      'valid_from', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _validUntilMeta =
      const VerificationMeta('validUntil');
  @override
  late final GeneratedColumn<DateTime> validUntil = GeneratedColumn<DateTime>(
      'valid_until', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _validDaysOfWeekJsonMeta =
      const VerificationMeta('validDaysOfWeekJson');
  @override
  late final GeneratedColumn<String> validDaysOfWeekJson =
      GeneratedColumn<String>('valid_days_of_week_json', aliasedName, false,
          type: DriftSqlType.string,
          requiredDuringInsert: false,
          defaultValue: const Constant('[]'));
  static const VerificationMeta _validTimeStartMeta =
      const VerificationMeta('validTimeStart');
  @override
  late final GeneratedColumn<String> validTimeStart = GeneratedColumn<String>(
      'valid_time_start', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _validTimeEndMeta =
      const VerificationMeta('validTimeEnd');
  @override
  late final GeneratedColumn<String> validTimeEnd = GeneratedColumn<String>(
      'valid_time_end', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _canStackWithOthersMeta =
      const VerificationMeta('canStackWithOthers');
  @override
  late final GeneratedColumn<bool> canStackWithOthers = GeneratedColumn<bool>(
      'can_stack_with_others', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("can_stack_with_others" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _stackPriorityMeta =
      const VerificationMeta('stackPriority');
  @override
  late final GeneratedColumn<int> stackPriority = GeneratedColumn<int>(
      'stack_priority', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        uuid,
        name,
        code,
        description,
        type,
        scope,
        status,
        percentageOff,
        fixedAmountOff,
        buyQuantity,
        getQuantity,
        getDiscountPercent,
        tiersJson,
        applicableProductUuidsJson,
        applicableCategoryUuidsJson,
        applicableCustomerUuidsJson,
        minOrderAmount,
        maxDiscountAmount,
        maxUsesTotal,
        maxUsesPerCustomer,
        currentUsageCount,
        validFrom,
        validUntil,
        validDaysOfWeekJson,
        validTimeStart,
        validTimeEnd,
        canStackWithOthers,
        stackPriority,
        createdAt,
        updatedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'discount_table';
  @override
  VerificationContext validateIntegrity(Insertable<DiscountTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('uuid')) {
      context.handle(
          _uuidMeta, uuid.isAcceptableOrUnknown(data['uuid']!, _uuidMeta));
    } else if (isInserting) {
      context.missing(_uuidMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('code')) {
      context.handle(
          _codeMeta, code.isAcceptableOrUnknown(data['code']!, _codeMeta));
    } else if (isInserting) {
      context.missing(_codeMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    }
    if (data.containsKey('type')) {
      context.handle(
          _typeMeta, type.isAcceptableOrUnknown(data['type']!, _typeMeta));
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('scope')) {
      context.handle(
          _scopeMeta, scope.isAcceptableOrUnknown(data['scope']!, _scopeMeta));
    } else if (isInserting) {
      context.missing(_scopeMeta);
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status']!, _statusMeta));
    }
    if (data.containsKey('percentage_off')) {
      context.handle(
          _percentageOffMeta,
          percentageOff.isAcceptableOrUnknown(
              data['percentage_off']!, _percentageOffMeta));
    }
    if (data.containsKey('fixed_amount_off')) {
      context.handle(
          _fixedAmountOffMeta,
          fixedAmountOff.isAcceptableOrUnknown(
              data['fixed_amount_off']!, _fixedAmountOffMeta));
    }
    if (data.containsKey('buy_quantity')) {
      context.handle(
          _buyQuantityMeta,
          buyQuantity.isAcceptableOrUnknown(
              data['buy_quantity']!, _buyQuantityMeta));
    }
    if (data.containsKey('get_quantity')) {
      context.handle(
          _getQuantityMeta,
          getQuantity.isAcceptableOrUnknown(
              data['get_quantity']!, _getQuantityMeta));
    }
    if (data.containsKey('get_discount_percent')) {
      context.handle(
          _getDiscountPercentMeta,
          getDiscountPercent.isAcceptableOrUnknown(
              data['get_discount_percent']!, _getDiscountPercentMeta));
    }
    if (data.containsKey('tiers_json')) {
      context.handle(_tiersJsonMeta,
          tiersJson.isAcceptableOrUnknown(data['tiers_json']!, _tiersJsonMeta));
    }
    if (data.containsKey('applicable_product_uuids_json')) {
      context.handle(
          _applicableProductUuidsJsonMeta,
          applicableProductUuidsJson.isAcceptableOrUnknown(
              data['applicable_product_uuids_json']!,
              _applicableProductUuidsJsonMeta));
    }
    if (data.containsKey('applicable_category_uuids_json')) {
      context.handle(
          _applicableCategoryUuidsJsonMeta,
          applicableCategoryUuidsJson.isAcceptableOrUnknown(
              data['applicable_category_uuids_json']!,
              _applicableCategoryUuidsJsonMeta));
    }
    if (data.containsKey('applicable_customer_uuids_json')) {
      context.handle(
          _applicableCustomerUuidsJsonMeta,
          applicableCustomerUuidsJson.isAcceptableOrUnknown(
              data['applicable_customer_uuids_json']!,
              _applicableCustomerUuidsJsonMeta));
    }
    if (data.containsKey('min_order_amount')) {
      context.handle(
          _minOrderAmountMeta,
          minOrderAmount.isAcceptableOrUnknown(
              data['min_order_amount']!, _minOrderAmountMeta));
    }
    if (data.containsKey('max_discount_amount')) {
      context.handle(
          _maxDiscountAmountMeta,
          maxDiscountAmount.isAcceptableOrUnknown(
              data['max_discount_amount']!, _maxDiscountAmountMeta));
    }
    if (data.containsKey('max_uses_total')) {
      context.handle(
          _maxUsesTotalMeta,
          maxUsesTotal.isAcceptableOrUnknown(
              data['max_uses_total']!, _maxUsesTotalMeta));
    }
    if (data.containsKey('max_uses_per_customer')) {
      context.handle(
          _maxUsesPerCustomerMeta,
          maxUsesPerCustomer.isAcceptableOrUnknown(
              data['max_uses_per_customer']!, _maxUsesPerCustomerMeta));
    }
    if (data.containsKey('current_usage_count')) {
      context.handle(
          _currentUsageCountMeta,
          currentUsageCount.isAcceptableOrUnknown(
              data['current_usage_count']!, _currentUsageCountMeta));
    }
    if (data.containsKey('valid_from')) {
      context.handle(_validFromMeta,
          validFrom.isAcceptableOrUnknown(data['valid_from']!, _validFromMeta));
    }
    if (data.containsKey('valid_until')) {
      context.handle(
          _validUntilMeta,
          validUntil.isAcceptableOrUnknown(
              data['valid_until']!, _validUntilMeta));
    }
    if (data.containsKey('valid_days_of_week_json')) {
      context.handle(
          _validDaysOfWeekJsonMeta,
          validDaysOfWeekJson.isAcceptableOrUnknown(
              data['valid_days_of_week_json']!, _validDaysOfWeekJsonMeta));
    }
    if (data.containsKey('valid_time_start')) {
      context.handle(
          _validTimeStartMeta,
          validTimeStart.isAcceptableOrUnknown(
              data['valid_time_start']!, _validTimeStartMeta));
    }
    if (data.containsKey('valid_time_end')) {
      context.handle(
          _validTimeEndMeta,
          validTimeEnd.isAcceptableOrUnknown(
              data['valid_time_end']!, _validTimeEndMeta));
    }
    if (data.containsKey('can_stack_with_others')) {
      context.handle(
          _canStackWithOthersMeta,
          canStackWithOthers.isAcceptableOrUnknown(
              data['can_stack_with_others']!, _canStackWithOthersMeta));
    }
    if (data.containsKey('stack_priority')) {
      context.handle(
          _stackPriorityMeta,
          stackPriority.isAcceptableOrUnknown(
              data['stack_priority']!, _stackPriorityMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DiscountTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DiscountTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      uuid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}uuid'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      code: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}code'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description']),
      type: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}type'])!,
      scope: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}scope'])!,
      status: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}status'])!,
      percentageOff: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}percentage_off']),
      fixedAmountOff: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}fixed_amount_off']),
      buyQuantity: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}buy_quantity']),
      getQuantity: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}get_quantity']),
      getDiscountPercent: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}get_discount_percent']),
      tiersJson: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}tiers_json'])!,
      applicableProductUuidsJson: attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}applicable_product_uuids_json'])!,
      applicableCategoryUuidsJson: attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}applicable_category_uuids_json'])!,
      applicableCustomerUuidsJson: attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}applicable_customer_uuids_json'])!,
      minOrderAmount: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}min_order_amount']),
      maxDiscountAmount: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}max_discount_amount']),
      maxUsesTotal: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}max_uses_total']),
      maxUsesPerCustomer: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}max_uses_per_customer']),
      currentUsageCount: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}current_usage_count'])!,
      validFrom: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}valid_from']),
      validUntil: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}valid_until']),
      validDaysOfWeekJson: attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}valid_days_of_week_json'])!,
      validTimeStart: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}valid_time_start']),
      validTimeEnd: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}valid_time_end']),
      canStackWithOthers: attachedDatabase.typeMapping.read(
          DriftSqlType.bool, data['${effectivePrefix}can_stack_with_others'])!,
      stackPriority: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}stack_priority'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at']),
    );
  }

  @override
  $DiscountTableTable createAlias(String alias) {
    return $DiscountTableTable(attachedDatabase, alias);
  }
}

class DiscountTableData extends DataClass
    implements Insertable<DiscountTableData> {
  final int id;
  final String uuid;
  final String name;
  final String code;
  final String? description;
  final String type;
  final String scope;
  final String status;
  final double? percentageOff;
  final double? fixedAmountOff;
  final int? buyQuantity;
  final int? getQuantity;
  final double? getDiscountPercent;
  final String tiersJson;
  final String applicableProductUuidsJson;
  final String applicableCategoryUuidsJson;
  final String applicableCustomerUuidsJson;
  final double? minOrderAmount;
  final double? maxDiscountAmount;
  final int? maxUsesTotal;
  final int? maxUsesPerCustomer;
  final int currentUsageCount;
  final DateTime? validFrom;
  final DateTime? validUntil;
  final String validDaysOfWeekJson;
  final String? validTimeStart;
  final String? validTimeEnd;
  final bool canStackWithOthers;
  final int stackPriority;
  final DateTime createdAt;
  final DateTime? updatedAt;
  const DiscountTableData(
      {required this.id,
      required this.uuid,
      required this.name,
      required this.code,
      this.description,
      required this.type,
      required this.scope,
      required this.status,
      this.percentageOff,
      this.fixedAmountOff,
      this.buyQuantity,
      this.getQuantity,
      this.getDiscountPercent,
      required this.tiersJson,
      required this.applicableProductUuidsJson,
      required this.applicableCategoryUuidsJson,
      required this.applicableCustomerUuidsJson,
      this.minOrderAmount,
      this.maxDiscountAmount,
      this.maxUsesTotal,
      this.maxUsesPerCustomer,
      required this.currentUsageCount,
      this.validFrom,
      this.validUntil,
      required this.validDaysOfWeekJson,
      this.validTimeStart,
      this.validTimeEnd,
      required this.canStackWithOthers,
      required this.stackPriority,
      required this.createdAt,
      this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['uuid'] = Variable<String>(uuid);
    map['name'] = Variable<String>(name);
    map['code'] = Variable<String>(code);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    map['type'] = Variable<String>(type);
    map['scope'] = Variable<String>(scope);
    map['status'] = Variable<String>(status);
    if (!nullToAbsent || percentageOff != null) {
      map['percentage_off'] = Variable<double>(percentageOff);
    }
    if (!nullToAbsent || fixedAmountOff != null) {
      map['fixed_amount_off'] = Variable<double>(fixedAmountOff);
    }
    if (!nullToAbsent || buyQuantity != null) {
      map['buy_quantity'] = Variable<int>(buyQuantity);
    }
    if (!nullToAbsent || getQuantity != null) {
      map['get_quantity'] = Variable<int>(getQuantity);
    }
    if (!nullToAbsent || getDiscountPercent != null) {
      map['get_discount_percent'] = Variable<double>(getDiscountPercent);
    }
    map['tiers_json'] = Variable<String>(tiersJson);
    map['applicable_product_uuids_json'] =
        Variable<String>(applicableProductUuidsJson);
    map['applicable_category_uuids_json'] =
        Variable<String>(applicableCategoryUuidsJson);
    map['applicable_customer_uuids_json'] =
        Variable<String>(applicableCustomerUuidsJson);
    if (!nullToAbsent || minOrderAmount != null) {
      map['min_order_amount'] = Variable<double>(minOrderAmount);
    }
    if (!nullToAbsent || maxDiscountAmount != null) {
      map['max_discount_amount'] = Variable<double>(maxDiscountAmount);
    }
    if (!nullToAbsent || maxUsesTotal != null) {
      map['max_uses_total'] = Variable<int>(maxUsesTotal);
    }
    if (!nullToAbsent || maxUsesPerCustomer != null) {
      map['max_uses_per_customer'] = Variable<int>(maxUsesPerCustomer);
    }
    map['current_usage_count'] = Variable<int>(currentUsageCount);
    if (!nullToAbsent || validFrom != null) {
      map['valid_from'] = Variable<DateTime>(validFrom);
    }
    if (!nullToAbsent || validUntil != null) {
      map['valid_until'] = Variable<DateTime>(validUntil);
    }
    map['valid_days_of_week_json'] = Variable<String>(validDaysOfWeekJson);
    if (!nullToAbsent || validTimeStart != null) {
      map['valid_time_start'] = Variable<String>(validTimeStart);
    }
    if (!nullToAbsent || validTimeEnd != null) {
      map['valid_time_end'] = Variable<String>(validTimeEnd);
    }
    map['can_stack_with_others'] = Variable<bool>(canStackWithOthers);
    map['stack_priority'] = Variable<int>(stackPriority);
    map['created_at'] = Variable<DateTime>(createdAt);
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<DateTime>(updatedAt);
    }
    return map;
  }

  DiscountTableCompanion toCompanion(bool nullToAbsent) {
    return DiscountTableCompanion(
      id: Value(id),
      uuid: Value(uuid),
      name: Value(name),
      code: Value(code),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      type: Value(type),
      scope: Value(scope),
      status: Value(status),
      percentageOff: percentageOff == null && nullToAbsent
          ? const Value.absent()
          : Value(percentageOff),
      fixedAmountOff: fixedAmountOff == null && nullToAbsent
          ? const Value.absent()
          : Value(fixedAmountOff),
      buyQuantity: buyQuantity == null && nullToAbsent
          ? const Value.absent()
          : Value(buyQuantity),
      getQuantity: getQuantity == null && nullToAbsent
          ? const Value.absent()
          : Value(getQuantity),
      getDiscountPercent: getDiscountPercent == null && nullToAbsent
          ? const Value.absent()
          : Value(getDiscountPercent),
      tiersJson: Value(tiersJson),
      applicableProductUuidsJson: Value(applicableProductUuidsJson),
      applicableCategoryUuidsJson: Value(applicableCategoryUuidsJson),
      applicableCustomerUuidsJson: Value(applicableCustomerUuidsJson),
      minOrderAmount: minOrderAmount == null && nullToAbsent
          ? const Value.absent()
          : Value(minOrderAmount),
      maxDiscountAmount: maxDiscountAmount == null && nullToAbsent
          ? const Value.absent()
          : Value(maxDiscountAmount),
      maxUsesTotal: maxUsesTotal == null && nullToAbsent
          ? const Value.absent()
          : Value(maxUsesTotal),
      maxUsesPerCustomer: maxUsesPerCustomer == null && nullToAbsent
          ? const Value.absent()
          : Value(maxUsesPerCustomer),
      currentUsageCount: Value(currentUsageCount),
      validFrom: validFrom == null && nullToAbsent
          ? const Value.absent()
          : Value(validFrom),
      validUntil: validUntil == null && nullToAbsent
          ? const Value.absent()
          : Value(validUntil),
      validDaysOfWeekJson: Value(validDaysOfWeekJson),
      validTimeStart: validTimeStart == null && nullToAbsent
          ? const Value.absent()
          : Value(validTimeStart),
      validTimeEnd: validTimeEnd == null && nullToAbsent
          ? const Value.absent()
          : Value(validTimeEnd),
      canStackWithOthers: Value(canStackWithOthers),
      stackPriority: Value(stackPriority),
      createdAt: Value(createdAt),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
    );
  }

  factory DiscountTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DiscountTableData(
      id: serializer.fromJson<int>(json['id']),
      uuid: serializer.fromJson<String>(json['uuid']),
      name: serializer.fromJson<String>(json['name']),
      code: serializer.fromJson<String>(json['code']),
      description: serializer.fromJson<String?>(json['description']),
      type: serializer.fromJson<String>(json['type']),
      scope: serializer.fromJson<String>(json['scope']),
      status: serializer.fromJson<String>(json['status']),
      percentageOff: serializer.fromJson<double?>(json['percentageOff']),
      fixedAmountOff: serializer.fromJson<double?>(json['fixedAmountOff']),
      buyQuantity: serializer.fromJson<int?>(json['buyQuantity']),
      getQuantity: serializer.fromJson<int?>(json['getQuantity']),
      getDiscountPercent:
          serializer.fromJson<double?>(json['getDiscountPercent']),
      tiersJson: serializer.fromJson<String>(json['tiersJson']),
      applicableProductUuidsJson:
          serializer.fromJson<String>(json['applicableProductUuidsJson']),
      applicableCategoryUuidsJson:
          serializer.fromJson<String>(json['applicableCategoryUuidsJson']),
      applicableCustomerUuidsJson:
          serializer.fromJson<String>(json['applicableCustomerUuidsJson']),
      minOrderAmount: serializer.fromJson<double?>(json['minOrderAmount']),
      maxDiscountAmount:
          serializer.fromJson<double?>(json['maxDiscountAmount']),
      maxUsesTotal: serializer.fromJson<int?>(json['maxUsesTotal']),
      maxUsesPerCustomer: serializer.fromJson<int?>(json['maxUsesPerCustomer']),
      currentUsageCount: serializer.fromJson<int>(json['currentUsageCount']),
      validFrom: serializer.fromJson<DateTime?>(json['validFrom']),
      validUntil: serializer.fromJson<DateTime?>(json['validUntil']),
      validDaysOfWeekJson:
          serializer.fromJson<String>(json['validDaysOfWeekJson']),
      validTimeStart: serializer.fromJson<String?>(json['validTimeStart']),
      validTimeEnd: serializer.fromJson<String?>(json['validTimeEnd']),
      canStackWithOthers: serializer.fromJson<bool>(json['canStackWithOthers']),
      stackPriority: serializer.fromJson<int>(json['stackPriority']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime?>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'uuid': serializer.toJson<String>(uuid),
      'name': serializer.toJson<String>(name),
      'code': serializer.toJson<String>(code),
      'description': serializer.toJson<String?>(description),
      'type': serializer.toJson<String>(type),
      'scope': serializer.toJson<String>(scope),
      'status': serializer.toJson<String>(status),
      'percentageOff': serializer.toJson<double?>(percentageOff),
      'fixedAmountOff': serializer.toJson<double?>(fixedAmountOff),
      'buyQuantity': serializer.toJson<int?>(buyQuantity),
      'getQuantity': serializer.toJson<int?>(getQuantity),
      'getDiscountPercent': serializer.toJson<double?>(getDiscountPercent),
      'tiersJson': serializer.toJson<String>(tiersJson),
      'applicableProductUuidsJson':
          serializer.toJson<String>(applicableProductUuidsJson),
      'applicableCategoryUuidsJson':
          serializer.toJson<String>(applicableCategoryUuidsJson),
      'applicableCustomerUuidsJson':
          serializer.toJson<String>(applicableCustomerUuidsJson),
      'minOrderAmount': serializer.toJson<double?>(minOrderAmount),
      'maxDiscountAmount': serializer.toJson<double?>(maxDiscountAmount),
      'maxUsesTotal': serializer.toJson<int?>(maxUsesTotal),
      'maxUsesPerCustomer': serializer.toJson<int?>(maxUsesPerCustomer),
      'currentUsageCount': serializer.toJson<int>(currentUsageCount),
      'validFrom': serializer.toJson<DateTime?>(validFrom),
      'validUntil': serializer.toJson<DateTime?>(validUntil),
      'validDaysOfWeekJson': serializer.toJson<String>(validDaysOfWeekJson),
      'validTimeStart': serializer.toJson<String?>(validTimeStart),
      'validTimeEnd': serializer.toJson<String?>(validTimeEnd),
      'canStackWithOthers': serializer.toJson<bool>(canStackWithOthers),
      'stackPriority': serializer.toJson<int>(stackPriority),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime?>(updatedAt),
    };
  }

  DiscountTableData copyWith(
          {int? id,
          String? uuid,
          String? name,
          String? code,
          Value<String?> description = const Value.absent(),
          String? type,
          String? scope,
          String? status,
          Value<double?> percentageOff = const Value.absent(),
          Value<double?> fixedAmountOff = const Value.absent(),
          Value<int?> buyQuantity = const Value.absent(),
          Value<int?> getQuantity = const Value.absent(),
          Value<double?> getDiscountPercent = const Value.absent(),
          String? tiersJson,
          String? applicableProductUuidsJson,
          String? applicableCategoryUuidsJson,
          String? applicableCustomerUuidsJson,
          Value<double?> minOrderAmount = const Value.absent(),
          Value<double?> maxDiscountAmount = const Value.absent(),
          Value<int?> maxUsesTotal = const Value.absent(),
          Value<int?> maxUsesPerCustomer = const Value.absent(),
          int? currentUsageCount,
          Value<DateTime?> validFrom = const Value.absent(),
          Value<DateTime?> validUntil = const Value.absent(),
          String? validDaysOfWeekJson,
          Value<String?> validTimeStart = const Value.absent(),
          Value<String?> validTimeEnd = const Value.absent(),
          bool? canStackWithOthers,
          int? stackPriority,
          DateTime? createdAt,
          Value<DateTime?> updatedAt = const Value.absent()}) =>
      DiscountTableData(
        id: id ?? this.id,
        uuid: uuid ?? this.uuid,
        name: name ?? this.name,
        code: code ?? this.code,
        description: description.present ? description.value : this.description,
        type: type ?? this.type,
        scope: scope ?? this.scope,
        status: status ?? this.status,
        percentageOff:
            percentageOff.present ? percentageOff.value : this.percentageOff,
        fixedAmountOff:
            fixedAmountOff.present ? fixedAmountOff.value : this.fixedAmountOff,
        buyQuantity: buyQuantity.present ? buyQuantity.value : this.buyQuantity,
        getQuantity: getQuantity.present ? getQuantity.value : this.getQuantity,
        getDiscountPercent: getDiscountPercent.present
            ? getDiscountPercent.value
            : this.getDiscountPercent,
        tiersJson: tiersJson ?? this.tiersJson,
        applicableProductUuidsJson:
            applicableProductUuidsJson ?? this.applicableProductUuidsJson,
        applicableCategoryUuidsJson:
            applicableCategoryUuidsJson ?? this.applicableCategoryUuidsJson,
        applicableCustomerUuidsJson:
            applicableCustomerUuidsJson ?? this.applicableCustomerUuidsJson,
        minOrderAmount:
            minOrderAmount.present ? minOrderAmount.value : this.minOrderAmount,
        maxDiscountAmount: maxDiscountAmount.present
            ? maxDiscountAmount.value
            : this.maxDiscountAmount,
        maxUsesTotal:
            maxUsesTotal.present ? maxUsesTotal.value : this.maxUsesTotal,
        maxUsesPerCustomer: maxUsesPerCustomer.present
            ? maxUsesPerCustomer.value
            : this.maxUsesPerCustomer,
        currentUsageCount: currentUsageCount ?? this.currentUsageCount,
        validFrom: validFrom.present ? validFrom.value : this.validFrom,
        validUntil: validUntil.present ? validUntil.value : this.validUntil,
        validDaysOfWeekJson: validDaysOfWeekJson ?? this.validDaysOfWeekJson,
        validTimeStart:
            validTimeStart.present ? validTimeStart.value : this.validTimeStart,
        validTimeEnd:
            validTimeEnd.present ? validTimeEnd.value : this.validTimeEnd,
        canStackWithOthers: canStackWithOthers ?? this.canStackWithOthers,
        stackPriority: stackPriority ?? this.stackPriority,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt.present ? updatedAt.value : this.updatedAt,
      );
  DiscountTableData copyWithCompanion(DiscountTableCompanion data) {
    return DiscountTableData(
      id: data.id.present ? data.id.value : this.id,
      uuid: data.uuid.present ? data.uuid.value : this.uuid,
      name: data.name.present ? data.name.value : this.name,
      code: data.code.present ? data.code.value : this.code,
      description:
          data.description.present ? data.description.value : this.description,
      type: data.type.present ? data.type.value : this.type,
      scope: data.scope.present ? data.scope.value : this.scope,
      status: data.status.present ? data.status.value : this.status,
      percentageOff: data.percentageOff.present
          ? data.percentageOff.value
          : this.percentageOff,
      fixedAmountOff: data.fixedAmountOff.present
          ? data.fixedAmountOff.value
          : this.fixedAmountOff,
      buyQuantity:
          data.buyQuantity.present ? data.buyQuantity.value : this.buyQuantity,
      getQuantity:
          data.getQuantity.present ? data.getQuantity.value : this.getQuantity,
      getDiscountPercent: data.getDiscountPercent.present
          ? data.getDiscountPercent.value
          : this.getDiscountPercent,
      tiersJson: data.tiersJson.present ? data.tiersJson.value : this.tiersJson,
      applicableProductUuidsJson: data.applicableProductUuidsJson.present
          ? data.applicableProductUuidsJson.value
          : this.applicableProductUuidsJson,
      applicableCategoryUuidsJson: data.applicableCategoryUuidsJson.present
          ? data.applicableCategoryUuidsJson.value
          : this.applicableCategoryUuidsJson,
      applicableCustomerUuidsJson: data.applicableCustomerUuidsJson.present
          ? data.applicableCustomerUuidsJson.value
          : this.applicableCustomerUuidsJson,
      minOrderAmount: data.minOrderAmount.present
          ? data.minOrderAmount.value
          : this.minOrderAmount,
      maxDiscountAmount: data.maxDiscountAmount.present
          ? data.maxDiscountAmount.value
          : this.maxDiscountAmount,
      maxUsesTotal: data.maxUsesTotal.present
          ? data.maxUsesTotal.value
          : this.maxUsesTotal,
      maxUsesPerCustomer: data.maxUsesPerCustomer.present
          ? data.maxUsesPerCustomer.value
          : this.maxUsesPerCustomer,
      currentUsageCount: data.currentUsageCount.present
          ? data.currentUsageCount.value
          : this.currentUsageCount,
      validFrom: data.validFrom.present ? data.validFrom.value : this.validFrom,
      validUntil:
          data.validUntil.present ? data.validUntil.value : this.validUntil,
      validDaysOfWeekJson: data.validDaysOfWeekJson.present
          ? data.validDaysOfWeekJson.value
          : this.validDaysOfWeekJson,
      validTimeStart: data.validTimeStart.present
          ? data.validTimeStart.value
          : this.validTimeStart,
      validTimeEnd: data.validTimeEnd.present
          ? data.validTimeEnd.value
          : this.validTimeEnd,
      canStackWithOthers: data.canStackWithOthers.present
          ? data.canStackWithOthers.value
          : this.canStackWithOthers,
      stackPriority: data.stackPriority.present
          ? data.stackPriority.value
          : this.stackPriority,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DiscountTableData(')
          ..write('id: $id, ')
          ..write('uuid: $uuid, ')
          ..write('name: $name, ')
          ..write('code: $code, ')
          ..write('description: $description, ')
          ..write('type: $type, ')
          ..write('scope: $scope, ')
          ..write('status: $status, ')
          ..write('percentageOff: $percentageOff, ')
          ..write('fixedAmountOff: $fixedAmountOff, ')
          ..write('buyQuantity: $buyQuantity, ')
          ..write('getQuantity: $getQuantity, ')
          ..write('getDiscountPercent: $getDiscountPercent, ')
          ..write('tiersJson: $tiersJson, ')
          ..write('applicableProductUuidsJson: $applicableProductUuidsJson, ')
          ..write('applicableCategoryUuidsJson: $applicableCategoryUuidsJson, ')
          ..write('applicableCustomerUuidsJson: $applicableCustomerUuidsJson, ')
          ..write('minOrderAmount: $minOrderAmount, ')
          ..write('maxDiscountAmount: $maxDiscountAmount, ')
          ..write('maxUsesTotal: $maxUsesTotal, ')
          ..write('maxUsesPerCustomer: $maxUsesPerCustomer, ')
          ..write('currentUsageCount: $currentUsageCount, ')
          ..write('validFrom: $validFrom, ')
          ..write('validUntil: $validUntil, ')
          ..write('validDaysOfWeekJson: $validDaysOfWeekJson, ')
          ..write('validTimeStart: $validTimeStart, ')
          ..write('validTimeEnd: $validTimeEnd, ')
          ..write('canStackWithOthers: $canStackWithOthers, ')
          ..write('stackPriority: $stackPriority, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([
        id,
        uuid,
        name,
        code,
        description,
        type,
        scope,
        status,
        percentageOff,
        fixedAmountOff,
        buyQuantity,
        getQuantity,
        getDiscountPercent,
        tiersJson,
        applicableProductUuidsJson,
        applicableCategoryUuidsJson,
        applicableCustomerUuidsJson,
        minOrderAmount,
        maxDiscountAmount,
        maxUsesTotal,
        maxUsesPerCustomer,
        currentUsageCount,
        validFrom,
        validUntil,
        validDaysOfWeekJson,
        validTimeStart,
        validTimeEnd,
        canStackWithOthers,
        stackPriority,
        createdAt,
        updatedAt
      ]);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DiscountTableData &&
          other.id == this.id &&
          other.uuid == this.uuid &&
          other.name == this.name &&
          other.code == this.code &&
          other.description == this.description &&
          other.type == this.type &&
          other.scope == this.scope &&
          other.status == this.status &&
          other.percentageOff == this.percentageOff &&
          other.fixedAmountOff == this.fixedAmountOff &&
          other.buyQuantity == this.buyQuantity &&
          other.getQuantity == this.getQuantity &&
          other.getDiscountPercent == this.getDiscountPercent &&
          other.tiersJson == this.tiersJson &&
          other.applicableProductUuidsJson == this.applicableProductUuidsJson &&
          other.applicableCategoryUuidsJson ==
              this.applicableCategoryUuidsJson &&
          other.applicableCustomerUuidsJson ==
              this.applicableCustomerUuidsJson &&
          other.minOrderAmount == this.minOrderAmount &&
          other.maxDiscountAmount == this.maxDiscountAmount &&
          other.maxUsesTotal == this.maxUsesTotal &&
          other.maxUsesPerCustomer == this.maxUsesPerCustomer &&
          other.currentUsageCount == this.currentUsageCount &&
          other.validFrom == this.validFrom &&
          other.validUntil == this.validUntil &&
          other.validDaysOfWeekJson == this.validDaysOfWeekJson &&
          other.validTimeStart == this.validTimeStart &&
          other.validTimeEnd == this.validTimeEnd &&
          other.canStackWithOthers == this.canStackWithOthers &&
          other.stackPriority == this.stackPriority &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class DiscountTableCompanion extends UpdateCompanion<DiscountTableData> {
  final Value<int> id;
  final Value<String> uuid;
  final Value<String> name;
  final Value<String> code;
  final Value<String?> description;
  final Value<String> type;
  final Value<String> scope;
  final Value<String> status;
  final Value<double?> percentageOff;
  final Value<double?> fixedAmountOff;
  final Value<int?> buyQuantity;
  final Value<int?> getQuantity;
  final Value<double?> getDiscountPercent;
  final Value<String> tiersJson;
  final Value<String> applicableProductUuidsJson;
  final Value<String> applicableCategoryUuidsJson;
  final Value<String> applicableCustomerUuidsJson;
  final Value<double?> minOrderAmount;
  final Value<double?> maxDiscountAmount;
  final Value<int?> maxUsesTotal;
  final Value<int?> maxUsesPerCustomer;
  final Value<int> currentUsageCount;
  final Value<DateTime?> validFrom;
  final Value<DateTime?> validUntil;
  final Value<String> validDaysOfWeekJson;
  final Value<String?> validTimeStart;
  final Value<String?> validTimeEnd;
  final Value<bool> canStackWithOthers;
  final Value<int> stackPriority;
  final Value<DateTime> createdAt;
  final Value<DateTime?> updatedAt;
  const DiscountTableCompanion({
    this.id = const Value.absent(),
    this.uuid = const Value.absent(),
    this.name = const Value.absent(),
    this.code = const Value.absent(),
    this.description = const Value.absent(),
    this.type = const Value.absent(),
    this.scope = const Value.absent(),
    this.status = const Value.absent(),
    this.percentageOff = const Value.absent(),
    this.fixedAmountOff = const Value.absent(),
    this.buyQuantity = const Value.absent(),
    this.getQuantity = const Value.absent(),
    this.getDiscountPercent = const Value.absent(),
    this.tiersJson = const Value.absent(),
    this.applicableProductUuidsJson = const Value.absent(),
    this.applicableCategoryUuidsJson = const Value.absent(),
    this.applicableCustomerUuidsJson = const Value.absent(),
    this.minOrderAmount = const Value.absent(),
    this.maxDiscountAmount = const Value.absent(),
    this.maxUsesTotal = const Value.absent(),
    this.maxUsesPerCustomer = const Value.absent(),
    this.currentUsageCount = const Value.absent(),
    this.validFrom = const Value.absent(),
    this.validUntil = const Value.absent(),
    this.validDaysOfWeekJson = const Value.absent(),
    this.validTimeStart = const Value.absent(),
    this.validTimeEnd = const Value.absent(),
    this.canStackWithOthers = const Value.absent(),
    this.stackPriority = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  DiscountTableCompanion.insert({
    this.id = const Value.absent(),
    required String uuid,
    required String name,
    required String code,
    this.description = const Value.absent(),
    required String type,
    required String scope,
    this.status = const Value.absent(),
    this.percentageOff = const Value.absent(),
    this.fixedAmountOff = const Value.absent(),
    this.buyQuantity = const Value.absent(),
    this.getQuantity = const Value.absent(),
    this.getDiscountPercent = const Value.absent(),
    this.tiersJson = const Value.absent(),
    this.applicableProductUuidsJson = const Value.absent(),
    this.applicableCategoryUuidsJson = const Value.absent(),
    this.applicableCustomerUuidsJson = const Value.absent(),
    this.minOrderAmount = const Value.absent(),
    this.maxDiscountAmount = const Value.absent(),
    this.maxUsesTotal = const Value.absent(),
    this.maxUsesPerCustomer = const Value.absent(),
    this.currentUsageCount = const Value.absent(),
    this.validFrom = const Value.absent(),
    this.validUntil = const Value.absent(),
    this.validDaysOfWeekJson = const Value.absent(),
    this.validTimeStart = const Value.absent(),
    this.validTimeEnd = const Value.absent(),
    this.canStackWithOthers = const Value.absent(),
    this.stackPriority = const Value.absent(),
    required DateTime createdAt,
    this.updatedAt = const Value.absent(),
  })  : uuid = Value(uuid),
        name = Value(name),
        code = Value(code),
        type = Value(type),
        scope = Value(scope),
        createdAt = Value(createdAt);
  static Insertable<DiscountTableData> custom({
    Expression<int>? id,
    Expression<String>? uuid,
    Expression<String>? name,
    Expression<String>? code,
    Expression<String>? description,
    Expression<String>? type,
    Expression<String>? scope,
    Expression<String>? status,
    Expression<double>? percentageOff,
    Expression<double>? fixedAmountOff,
    Expression<int>? buyQuantity,
    Expression<int>? getQuantity,
    Expression<double>? getDiscountPercent,
    Expression<String>? tiersJson,
    Expression<String>? applicableProductUuidsJson,
    Expression<String>? applicableCategoryUuidsJson,
    Expression<String>? applicableCustomerUuidsJson,
    Expression<double>? minOrderAmount,
    Expression<double>? maxDiscountAmount,
    Expression<int>? maxUsesTotal,
    Expression<int>? maxUsesPerCustomer,
    Expression<int>? currentUsageCount,
    Expression<DateTime>? validFrom,
    Expression<DateTime>? validUntil,
    Expression<String>? validDaysOfWeekJson,
    Expression<String>? validTimeStart,
    Expression<String>? validTimeEnd,
    Expression<bool>? canStackWithOthers,
    Expression<int>? stackPriority,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (uuid != null) 'uuid': uuid,
      if (name != null) 'name': name,
      if (code != null) 'code': code,
      if (description != null) 'description': description,
      if (type != null) 'type': type,
      if (scope != null) 'scope': scope,
      if (status != null) 'status': status,
      if (percentageOff != null) 'percentage_off': percentageOff,
      if (fixedAmountOff != null) 'fixed_amount_off': fixedAmountOff,
      if (buyQuantity != null) 'buy_quantity': buyQuantity,
      if (getQuantity != null) 'get_quantity': getQuantity,
      if (getDiscountPercent != null)
        'get_discount_percent': getDiscountPercent,
      if (tiersJson != null) 'tiers_json': tiersJson,
      if (applicableProductUuidsJson != null)
        'applicable_product_uuids_json': applicableProductUuidsJson,
      if (applicableCategoryUuidsJson != null)
        'applicable_category_uuids_json': applicableCategoryUuidsJson,
      if (applicableCustomerUuidsJson != null)
        'applicable_customer_uuids_json': applicableCustomerUuidsJson,
      if (minOrderAmount != null) 'min_order_amount': minOrderAmount,
      if (maxDiscountAmount != null) 'max_discount_amount': maxDiscountAmount,
      if (maxUsesTotal != null) 'max_uses_total': maxUsesTotal,
      if (maxUsesPerCustomer != null)
        'max_uses_per_customer': maxUsesPerCustomer,
      if (currentUsageCount != null) 'current_usage_count': currentUsageCount,
      if (validFrom != null) 'valid_from': validFrom,
      if (validUntil != null) 'valid_until': validUntil,
      if (validDaysOfWeekJson != null)
        'valid_days_of_week_json': validDaysOfWeekJson,
      if (validTimeStart != null) 'valid_time_start': validTimeStart,
      if (validTimeEnd != null) 'valid_time_end': validTimeEnd,
      if (canStackWithOthers != null)
        'can_stack_with_others': canStackWithOthers,
      if (stackPriority != null) 'stack_priority': stackPriority,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  DiscountTableCompanion copyWith(
      {Value<int>? id,
      Value<String>? uuid,
      Value<String>? name,
      Value<String>? code,
      Value<String?>? description,
      Value<String>? type,
      Value<String>? scope,
      Value<String>? status,
      Value<double?>? percentageOff,
      Value<double?>? fixedAmountOff,
      Value<int?>? buyQuantity,
      Value<int?>? getQuantity,
      Value<double?>? getDiscountPercent,
      Value<String>? tiersJson,
      Value<String>? applicableProductUuidsJson,
      Value<String>? applicableCategoryUuidsJson,
      Value<String>? applicableCustomerUuidsJson,
      Value<double?>? minOrderAmount,
      Value<double?>? maxDiscountAmount,
      Value<int?>? maxUsesTotal,
      Value<int?>? maxUsesPerCustomer,
      Value<int>? currentUsageCount,
      Value<DateTime?>? validFrom,
      Value<DateTime?>? validUntil,
      Value<String>? validDaysOfWeekJson,
      Value<String?>? validTimeStart,
      Value<String?>? validTimeEnd,
      Value<bool>? canStackWithOthers,
      Value<int>? stackPriority,
      Value<DateTime>? createdAt,
      Value<DateTime?>? updatedAt}) {
    return DiscountTableCompanion(
      id: id ?? this.id,
      uuid: uuid ?? this.uuid,
      name: name ?? this.name,
      code: code ?? this.code,
      description: description ?? this.description,
      type: type ?? this.type,
      scope: scope ?? this.scope,
      status: status ?? this.status,
      percentageOff: percentageOff ?? this.percentageOff,
      fixedAmountOff: fixedAmountOff ?? this.fixedAmountOff,
      buyQuantity: buyQuantity ?? this.buyQuantity,
      getQuantity: getQuantity ?? this.getQuantity,
      getDiscountPercent: getDiscountPercent ?? this.getDiscountPercent,
      tiersJson: tiersJson ?? this.tiersJson,
      applicableProductUuidsJson:
          applicableProductUuidsJson ?? this.applicableProductUuidsJson,
      applicableCategoryUuidsJson:
          applicableCategoryUuidsJson ?? this.applicableCategoryUuidsJson,
      applicableCustomerUuidsJson:
          applicableCustomerUuidsJson ?? this.applicableCustomerUuidsJson,
      minOrderAmount: minOrderAmount ?? this.minOrderAmount,
      maxDiscountAmount: maxDiscountAmount ?? this.maxDiscountAmount,
      maxUsesTotal: maxUsesTotal ?? this.maxUsesTotal,
      maxUsesPerCustomer: maxUsesPerCustomer ?? this.maxUsesPerCustomer,
      currentUsageCount: currentUsageCount ?? this.currentUsageCount,
      validFrom: validFrom ?? this.validFrom,
      validUntil: validUntil ?? this.validUntil,
      validDaysOfWeekJson: validDaysOfWeekJson ?? this.validDaysOfWeekJson,
      validTimeStart: validTimeStart ?? this.validTimeStart,
      validTimeEnd: validTimeEnd ?? this.validTimeEnd,
      canStackWithOthers: canStackWithOthers ?? this.canStackWithOthers,
      stackPriority: stackPriority ?? this.stackPriority,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (uuid.present) {
      map['uuid'] = Variable<String>(uuid.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (code.present) {
      map['code'] = Variable<String>(code.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (scope.present) {
      map['scope'] = Variable<String>(scope.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (percentageOff.present) {
      map['percentage_off'] = Variable<double>(percentageOff.value);
    }
    if (fixedAmountOff.present) {
      map['fixed_amount_off'] = Variable<double>(fixedAmountOff.value);
    }
    if (buyQuantity.present) {
      map['buy_quantity'] = Variable<int>(buyQuantity.value);
    }
    if (getQuantity.present) {
      map['get_quantity'] = Variable<int>(getQuantity.value);
    }
    if (getDiscountPercent.present) {
      map['get_discount_percent'] = Variable<double>(getDiscountPercent.value);
    }
    if (tiersJson.present) {
      map['tiers_json'] = Variable<String>(tiersJson.value);
    }
    if (applicableProductUuidsJson.present) {
      map['applicable_product_uuids_json'] =
          Variable<String>(applicableProductUuidsJson.value);
    }
    if (applicableCategoryUuidsJson.present) {
      map['applicable_category_uuids_json'] =
          Variable<String>(applicableCategoryUuidsJson.value);
    }
    if (applicableCustomerUuidsJson.present) {
      map['applicable_customer_uuids_json'] =
          Variable<String>(applicableCustomerUuidsJson.value);
    }
    if (minOrderAmount.present) {
      map['min_order_amount'] = Variable<double>(minOrderAmount.value);
    }
    if (maxDiscountAmount.present) {
      map['max_discount_amount'] = Variable<double>(maxDiscountAmount.value);
    }
    if (maxUsesTotal.present) {
      map['max_uses_total'] = Variable<int>(maxUsesTotal.value);
    }
    if (maxUsesPerCustomer.present) {
      map['max_uses_per_customer'] = Variable<int>(maxUsesPerCustomer.value);
    }
    if (currentUsageCount.present) {
      map['current_usage_count'] = Variable<int>(currentUsageCount.value);
    }
    if (validFrom.present) {
      map['valid_from'] = Variable<DateTime>(validFrom.value);
    }
    if (validUntil.present) {
      map['valid_until'] = Variable<DateTime>(validUntil.value);
    }
    if (validDaysOfWeekJson.present) {
      map['valid_days_of_week_json'] =
          Variable<String>(validDaysOfWeekJson.value);
    }
    if (validTimeStart.present) {
      map['valid_time_start'] = Variable<String>(validTimeStart.value);
    }
    if (validTimeEnd.present) {
      map['valid_time_end'] = Variable<String>(validTimeEnd.value);
    }
    if (canStackWithOthers.present) {
      map['can_stack_with_others'] = Variable<bool>(canStackWithOthers.value);
    }
    if (stackPriority.present) {
      map['stack_priority'] = Variable<int>(stackPriority.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DiscountTableCompanion(')
          ..write('id: $id, ')
          ..write('uuid: $uuid, ')
          ..write('name: $name, ')
          ..write('code: $code, ')
          ..write('description: $description, ')
          ..write('type: $type, ')
          ..write('scope: $scope, ')
          ..write('status: $status, ')
          ..write('percentageOff: $percentageOff, ')
          ..write('fixedAmountOff: $fixedAmountOff, ')
          ..write('buyQuantity: $buyQuantity, ')
          ..write('getQuantity: $getQuantity, ')
          ..write('getDiscountPercent: $getDiscountPercent, ')
          ..write('tiersJson: $tiersJson, ')
          ..write('applicableProductUuidsJson: $applicableProductUuidsJson, ')
          ..write('applicableCategoryUuidsJson: $applicableCategoryUuidsJson, ')
          ..write('applicableCustomerUuidsJson: $applicableCustomerUuidsJson, ')
          ..write('minOrderAmount: $minOrderAmount, ')
          ..write('maxDiscountAmount: $maxDiscountAmount, ')
          ..write('maxUsesTotal: $maxUsesTotal, ')
          ..write('maxUsesPerCustomer: $maxUsesPerCustomer, ')
          ..write('currentUsageCount: $currentUsageCount, ')
          ..write('validFrom: $validFrom, ')
          ..write('validUntil: $validUntil, ')
          ..write('validDaysOfWeekJson: $validDaysOfWeekJson, ')
          ..write('validTimeStart: $validTimeStart, ')
          ..write('validTimeEnd: $validTimeEnd, ')
          ..write('canStackWithOthers: $canStackWithOthers, ')
          ..write('stackPriority: $stackPriority, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $WaitlistTableTable extends WaitlistTable
    with TableInfo<$WaitlistTableTable, WaitlistTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $WaitlistTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _uuidMeta = const VerificationMeta('uuid');
  @override
  late final GeneratedColumn<String> uuid = GeneratedColumn<String>(
      'uuid', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'));
  static const VerificationMeta _guestNameMeta =
      const VerificationMeta('guestName');
  @override
  late final GeneratedColumn<String> guestName = GeneratedColumn<String>(
      'guest_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _phoneNumberMeta =
      const VerificationMeta('phoneNumber');
  @override
  late final GeneratedColumn<String> phoneNumber = GeneratedColumn<String>(
      'phone_number', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _partySizeMeta =
      const VerificationMeta('partySize');
  @override
  late final GeneratedColumn<int> partySize = GeneratedColumn<int>(
      'party_size', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _specialRequestsMeta =
      const VerificationMeta('specialRequests');
  @override
  late final GeneratedColumn<String> specialRequests = GeneratedColumn<String>(
      'special_requests', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _highchairNeededMeta =
      const VerificationMeta('highchairNeeded');
  @override
  late final GeneratedColumn<bool> highchairNeeded = GeneratedColumn<bool>(
      'highchair_needed', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("highchair_needed" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _wheelchairAccessibleMeta =
      const VerificationMeta('wheelchairAccessible');
  @override
  late final GeneratedColumn<bool> wheelchairAccessible = GeneratedColumn<bool>(
      'wheelchair_accessible', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("wheelchair_accessible" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _tablePreferenceMeta =
      const VerificationMeta('tablePreference');
  @override
  late final GeneratedColumn<String> tablePreference = GeneratedColumn<String>(
      'table_preference', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
      'status', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('waiting'));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _quotedWaitTimeMeta =
      const VerificationMeta('quotedWaitTime');
  @override
  late final GeneratedColumn<DateTime> quotedWaitTime =
      GeneratedColumn<DateTime>('quoted_wait_time', aliasedName, true,
          type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _notifiedAtMeta =
      const VerificationMeta('notifiedAt');
  @override
  late final GeneratedColumn<DateTime> notifiedAt = GeneratedColumn<DateTime>(
      'notified_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _seatedAtMeta =
      const VerificationMeta('seatedAt');
  @override
  late final GeneratedColumn<DateTime> seatedAt = GeneratedColumn<DateTime>(
      'seated_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _seatedTableUuidMeta =
      const VerificationMeta('seatedTableUuid');
  @override
  late final GeneratedColumn<String> seatedTableUuid = GeneratedColumn<String>(
      'seated_table_uuid', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _queuePositionMeta =
      const VerificationMeta('queuePosition');
  @override
  late final GeneratedColumn<int> queuePosition = GeneratedColumn<int>(
      'queue_position', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
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
        queuePosition
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'waitlist_table';
  @override
  VerificationContext validateIntegrity(Insertable<WaitlistTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('uuid')) {
      context.handle(
          _uuidMeta, uuid.isAcceptableOrUnknown(data['uuid']!, _uuidMeta));
    } else if (isInserting) {
      context.missing(_uuidMeta);
    }
    if (data.containsKey('guest_name')) {
      context.handle(_guestNameMeta,
          guestName.isAcceptableOrUnknown(data['guest_name']!, _guestNameMeta));
    } else if (isInserting) {
      context.missing(_guestNameMeta);
    }
    if (data.containsKey('phone_number')) {
      context.handle(
          _phoneNumberMeta,
          phoneNumber.isAcceptableOrUnknown(
              data['phone_number']!, _phoneNumberMeta));
    } else if (isInserting) {
      context.missing(_phoneNumberMeta);
    }
    if (data.containsKey('party_size')) {
      context.handle(_partySizeMeta,
          partySize.isAcceptableOrUnknown(data['party_size']!, _partySizeMeta));
    } else if (isInserting) {
      context.missing(_partySizeMeta);
    }
    if (data.containsKey('special_requests')) {
      context.handle(
          _specialRequestsMeta,
          specialRequests.isAcceptableOrUnknown(
              data['special_requests']!, _specialRequestsMeta));
    }
    if (data.containsKey('highchair_needed')) {
      context.handle(
          _highchairNeededMeta,
          highchairNeeded.isAcceptableOrUnknown(
              data['highchair_needed']!, _highchairNeededMeta));
    }
    if (data.containsKey('wheelchair_accessible')) {
      context.handle(
          _wheelchairAccessibleMeta,
          wheelchairAccessible.isAcceptableOrUnknown(
              data['wheelchair_accessible']!, _wheelchairAccessibleMeta));
    }
    if (data.containsKey('table_preference')) {
      context.handle(
          _tablePreferenceMeta,
          tablePreference.isAcceptableOrUnknown(
              data['table_preference']!, _tablePreferenceMeta));
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status']!, _statusMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('quoted_wait_time')) {
      context.handle(
          _quotedWaitTimeMeta,
          quotedWaitTime.isAcceptableOrUnknown(
              data['quoted_wait_time']!, _quotedWaitTimeMeta));
    }
    if (data.containsKey('notified_at')) {
      context.handle(
          _notifiedAtMeta,
          notifiedAt.isAcceptableOrUnknown(
              data['notified_at']!, _notifiedAtMeta));
    }
    if (data.containsKey('seated_at')) {
      context.handle(_seatedAtMeta,
          seatedAt.isAcceptableOrUnknown(data['seated_at']!, _seatedAtMeta));
    }
    if (data.containsKey('seated_table_uuid')) {
      context.handle(
          _seatedTableUuidMeta,
          seatedTableUuid.isAcceptableOrUnknown(
              data['seated_table_uuid']!, _seatedTableUuidMeta));
    }
    if (data.containsKey('queue_position')) {
      context.handle(
          _queuePositionMeta,
          queuePosition.isAcceptableOrUnknown(
              data['queue_position']!, _queuePositionMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  WaitlistTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return WaitlistTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      uuid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}uuid'])!,
      guestName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}guest_name'])!,
      phoneNumber: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}phone_number'])!,
      partySize: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}party_size'])!,
      specialRequests: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}special_requests']),
      highchairNeeded: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}highchair_needed'])!,
      wheelchairAccessible: attachedDatabase.typeMapping.read(
          DriftSqlType.bool, data['${effectivePrefix}wheelchair_accessible'])!,
      tablePreference: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}table_preference']),
      status: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}status'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      quotedWaitTime: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}quoted_wait_time']),
      notifiedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}notified_at']),
      seatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}seated_at']),
      seatedTableUuid: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}seated_table_uuid']),
      queuePosition: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}queue_position']),
    );
  }

  @override
  $WaitlistTableTable createAlias(String alias) {
    return $WaitlistTableTable(attachedDatabase, alias);
  }
}

class WaitlistTableData extends DataClass
    implements Insertable<WaitlistTableData> {
  final int id;
  final String uuid;
  final String guestName;
  final String phoneNumber;
  final int partySize;
  final String? specialRequests;
  final bool highchairNeeded;
  final bool wheelchairAccessible;
  final String? tablePreference;
  final String status;
  final DateTime createdAt;
  final DateTime? quotedWaitTime;
  final DateTime? notifiedAt;
  final DateTime? seatedAt;
  final String? seatedTableUuid;
  final int? queuePosition;
  const WaitlistTableData(
      {required this.id,
      required this.uuid,
      required this.guestName,
      required this.phoneNumber,
      required this.partySize,
      this.specialRequests,
      required this.highchairNeeded,
      required this.wheelchairAccessible,
      this.tablePreference,
      required this.status,
      required this.createdAt,
      this.quotedWaitTime,
      this.notifiedAt,
      this.seatedAt,
      this.seatedTableUuid,
      this.queuePosition});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['uuid'] = Variable<String>(uuid);
    map['guest_name'] = Variable<String>(guestName);
    map['phone_number'] = Variable<String>(phoneNumber);
    map['party_size'] = Variable<int>(partySize);
    if (!nullToAbsent || specialRequests != null) {
      map['special_requests'] = Variable<String>(specialRequests);
    }
    map['highchair_needed'] = Variable<bool>(highchairNeeded);
    map['wheelchair_accessible'] = Variable<bool>(wheelchairAccessible);
    if (!nullToAbsent || tablePreference != null) {
      map['table_preference'] = Variable<String>(tablePreference);
    }
    map['status'] = Variable<String>(status);
    map['created_at'] = Variable<DateTime>(createdAt);
    if (!nullToAbsent || quotedWaitTime != null) {
      map['quoted_wait_time'] = Variable<DateTime>(quotedWaitTime);
    }
    if (!nullToAbsent || notifiedAt != null) {
      map['notified_at'] = Variable<DateTime>(notifiedAt);
    }
    if (!nullToAbsent || seatedAt != null) {
      map['seated_at'] = Variable<DateTime>(seatedAt);
    }
    if (!nullToAbsent || seatedTableUuid != null) {
      map['seated_table_uuid'] = Variable<String>(seatedTableUuid);
    }
    if (!nullToAbsent || queuePosition != null) {
      map['queue_position'] = Variable<int>(queuePosition);
    }
    return map;
  }

  WaitlistTableCompanion toCompanion(bool nullToAbsent) {
    return WaitlistTableCompanion(
      id: Value(id),
      uuid: Value(uuid),
      guestName: Value(guestName),
      phoneNumber: Value(phoneNumber),
      partySize: Value(partySize),
      specialRequests: specialRequests == null && nullToAbsent
          ? const Value.absent()
          : Value(specialRequests),
      highchairNeeded: Value(highchairNeeded),
      wheelchairAccessible: Value(wheelchairAccessible),
      tablePreference: tablePreference == null && nullToAbsent
          ? const Value.absent()
          : Value(tablePreference),
      status: Value(status),
      createdAt: Value(createdAt),
      quotedWaitTime: quotedWaitTime == null && nullToAbsent
          ? const Value.absent()
          : Value(quotedWaitTime),
      notifiedAt: notifiedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(notifiedAt),
      seatedAt: seatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(seatedAt),
      seatedTableUuid: seatedTableUuid == null && nullToAbsent
          ? const Value.absent()
          : Value(seatedTableUuid),
      queuePosition: queuePosition == null && nullToAbsent
          ? const Value.absent()
          : Value(queuePosition),
    );
  }

  factory WaitlistTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return WaitlistTableData(
      id: serializer.fromJson<int>(json['id']),
      uuid: serializer.fromJson<String>(json['uuid']),
      guestName: serializer.fromJson<String>(json['guestName']),
      phoneNumber: serializer.fromJson<String>(json['phoneNumber']),
      partySize: serializer.fromJson<int>(json['partySize']),
      specialRequests: serializer.fromJson<String?>(json['specialRequests']),
      highchairNeeded: serializer.fromJson<bool>(json['highchairNeeded']),
      wheelchairAccessible:
          serializer.fromJson<bool>(json['wheelchairAccessible']),
      tablePreference: serializer.fromJson<String?>(json['tablePreference']),
      status: serializer.fromJson<String>(json['status']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      quotedWaitTime: serializer.fromJson<DateTime?>(json['quotedWaitTime']),
      notifiedAt: serializer.fromJson<DateTime?>(json['notifiedAt']),
      seatedAt: serializer.fromJson<DateTime?>(json['seatedAt']),
      seatedTableUuid: serializer.fromJson<String?>(json['seatedTableUuid']),
      queuePosition: serializer.fromJson<int?>(json['queuePosition']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'uuid': serializer.toJson<String>(uuid),
      'guestName': serializer.toJson<String>(guestName),
      'phoneNumber': serializer.toJson<String>(phoneNumber),
      'partySize': serializer.toJson<int>(partySize),
      'specialRequests': serializer.toJson<String?>(specialRequests),
      'highchairNeeded': serializer.toJson<bool>(highchairNeeded),
      'wheelchairAccessible': serializer.toJson<bool>(wheelchairAccessible),
      'tablePreference': serializer.toJson<String?>(tablePreference),
      'status': serializer.toJson<String>(status),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'quotedWaitTime': serializer.toJson<DateTime?>(quotedWaitTime),
      'notifiedAt': serializer.toJson<DateTime?>(notifiedAt),
      'seatedAt': serializer.toJson<DateTime?>(seatedAt),
      'seatedTableUuid': serializer.toJson<String?>(seatedTableUuid),
      'queuePosition': serializer.toJson<int?>(queuePosition),
    };
  }

  WaitlistTableData copyWith(
          {int? id,
          String? uuid,
          String? guestName,
          String? phoneNumber,
          int? partySize,
          Value<String?> specialRequests = const Value.absent(),
          bool? highchairNeeded,
          bool? wheelchairAccessible,
          Value<String?> tablePreference = const Value.absent(),
          String? status,
          DateTime? createdAt,
          Value<DateTime?> quotedWaitTime = const Value.absent(),
          Value<DateTime?> notifiedAt = const Value.absent(),
          Value<DateTime?> seatedAt = const Value.absent(),
          Value<String?> seatedTableUuid = const Value.absent(),
          Value<int?> queuePosition = const Value.absent()}) =>
      WaitlistTableData(
        id: id ?? this.id,
        uuid: uuid ?? this.uuid,
        guestName: guestName ?? this.guestName,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        partySize: partySize ?? this.partySize,
        specialRequests: specialRequests.present
            ? specialRequests.value
            : this.specialRequests,
        highchairNeeded: highchairNeeded ?? this.highchairNeeded,
        wheelchairAccessible: wheelchairAccessible ?? this.wheelchairAccessible,
        tablePreference: tablePreference.present
            ? tablePreference.value
            : this.tablePreference,
        status: status ?? this.status,
        createdAt: createdAt ?? this.createdAt,
        quotedWaitTime:
            quotedWaitTime.present ? quotedWaitTime.value : this.quotedWaitTime,
        notifiedAt: notifiedAt.present ? notifiedAt.value : this.notifiedAt,
        seatedAt: seatedAt.present ? seatedAt.value : this.seatedAt,
        seatedTableUuid: seatedTableUuid.present
            ? seatedTableUuid.value
            : this.seatedTableUuid,
        queuePosition:
            queuePosition.present ? queuePosition.value : this.queuePosition,
      );
  WaitlistTableData copyWithCompanion(WaitlistTableCompanion data) {
    return WaitlistTableData(
      id: data.id.present ? data.id.value : this.id,
      uuid: data.uuid.present ? data.uuid.value : this.uuid,
      guestName: data.guestName.present ? data.guestName.value : this.guestName,
      phoneNumber:
          data.phoneNumber.present ? data.phoneNumber.value : this.phoneNumber,
      partySize: data.partySize.present ? data.partySize.value : this.partySize,
      specialRequests: data.specialRequests.present
          ? data.specialRequests.value
          : this.specialRequests,
      highchairNeeded: data.highchairNeeded.present
          ? data.highchairNeeded.value
          : this.highchairNeeded,
      wheelchairAccessible: data.wheelchairAccessible.present
          ? data.wheelchairAccessible.value
          : this.wheelchairAccessible,
      tablePreference: data.tablePreference.present
          ? data.tablePreference.value
          : this.tablePreference,
      status: data.status.present ? data.status.value : this.status,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      quotedWaitTime: data.quotedWaitTime.present
          ? data.quotedWaitTime.value
          : this.quotedWaitTime,
      notifiedAt:
          data.notifiedAt.present ? data.notifiedAt.value : this.notifiedAt,
      seatedAt: data.seatedAt.present ? data.seatedAt.value : this.seatedAt,
      seatedTableUuid: data.seatedTableUuid.present
          ? data.seatedTableUuid.value
          : this.seatedTableUuid,
      queuePosition: data.queuePosition.present
          ? data.queuePosition.value
          : this.queuePosition,
    );
  }

  @override
  String toString() {
    return (StringBuffer('WaitlistTableData(')
          ..write('id: $id, ')
          ..write('uuid: $uuid, ')
          ..write('guestName: $guestName, ')
          ..write('phoneNumber: $phoneNumber, ')
          ..write('partySize: $partySize, ')
          ..write('specialRequests: $specialRequests, ')
          ..write('highchairNeeded: $highchairNeeded, ')
          ..write('wheelchairAccessible: $wheelchairAccessible, ')
          ..write('tablePreference: $tablePreference, ')
          ..write('status: $status, ')
          ..write('createdAt: $createdAt, ')
          ..write('quotedWaitTime: $quotedWaitTime, ')
          ..write('notifiedAt: $notifiedAt, ')
          ..write('seatedAt: $seatedAt, ')
          ..write('seatedTableUuid: $seatedTableUuid, ')
          ..write('queuePosition: $queuePosition')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
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
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is WaitlistTableData &&
          other.id == this.id &&
          other.uuid == this.uuid &&
          other.guestName == this.guestName &&
          other.phoneNumber == this.phoneNumber &&
          other.partySize == this.partySize &&
          other.specialRequests == this.specialRequests &&
          other.highchairNeeded == this.highchairNeeded &&
          other.wheelchairAccessible == this.wheelchairAccessible &&
          other.tablePreference == this.tablePreference &&
          other.status == this.status &&
          other.createdAt == this.createdAt &&
          other.quotedWaitTime == this.quotedWaitTime &&
          other.notifiedAt == this.notifiedAt &&
          other.seatedAt == this.seatedAt &&
          other.seatedTableUuid == this.seatedTableUuid &&
          other.queuePosition == this.queuePosition);
}

class WaitlistTableCompanion extends UpdateCompanion<WaitlistTableData> {
  final Value<int> id;
  final Value<String> uuid;
  final Value<String> guestName;
  final Value<String> phoneNumber;
  final Value<int> partySize;
  final Value<String?> specialRequests;
  final Value<bool> highchairNeeded;
  final Value<bool> wheelchairAccessible;
  final Value<String?> tablePreference;
  final Value<String> status;
  final Value<DateTime> createdAt;
  final Value<DateTime?> quotedWaitTime;
  final Value<DateTime?> notifiedAt;
  final Value<DateTime?> seatedAt;
  final Value<String?> seatedTableUuid;
  final Value<int?> queuePosition;
  const WaitlistTableCompanion({
    this.id = const Value.absent(),
    this.uuid = const Value.absent(),
    this.guestName = const Value.absent(),
    this.phoneNumber = const Value.absent(),
    this.partySize = const Value.absent(),
    this.specialRequests = const Value.absent(),
    this.highchairNeeded = const Value.absent(),
    this.wheelchairAccessible = const Value.absent(),
    this.tablePreference = const Value.absent(),
    this.status = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.quotedWaitTime = const Value.absent(),
    this.notifiedAt = const Value.absent(),
    this.seatedAt = const Value.absent(),
    this.seatedTableUuid = const Value.absent(),
    this.queuePosition = const Value.absent(),
  });
  WaitlistTableCompanion.insert({
    this.id = const Value.absent(),
    required String uuid,
    required String guestName,
    required String phoneNumber,
    required int partySize,
    this.specialRequests = const Value.absent(),
    this.highchairNeeded = const Value.absent(),
    this.wheelchairAccessible = const Value.absent(),
    this.tablePreference = const Value.absent(),
    this.status = const Value.absent(),
    required DateTime createdAt,
    this.quotedWaitTime = const Value.absent(),
    this.notifiedAt = const Value.absent(),
    this.seatedAt = const Value.absent(),
    this.seatedTableUuid = const Value.absent(),
    this.queuePosition = const Value.absent(),
  })  : uuid = Value(uuid),
        guestName = Value(guestName),
        phoneNumber = Value(phoneNumber),
        partySize = Value(partySize),
        createdAt = Value(createdAt);
  static Insertable<WaitlistTableData> custom({
    Expression<int>? id,
    Expression<String>? uuid,
    Expression<String>? guestName,
    Expression<String>? phoneNumber,
    Expression<int>? partySize,
    Expression<String>? specialRequests,
    Expression<bool>? highchairNeeded,
    Expression<bool>? wheelchairAccessible,
    Expression<String>? tablePreference,
    Expression<String>? status,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? quotedWaitTime,
    Expression<DateTime>? notifiedAt,
    Expression<DateTime>? seatedAt,
    Expression<String>? seatedTableUuid,
    Expression<int>? queuePosition,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (uuid != null) 'uuid': uuid,
      if (guestName != null) 'guest_name': guestName,
      if (phoneNumber != null) 'phone_number': phoneNumber,
      if (partySize != null) 'party_size': partySize,
      if (specialRequests != null) 'special_requests': specialRequests,
      if (highchairNeeded != null) 'highchair_needed': highchairNeeded,
      if (wheelchairAccessible != null)
        'wheelchair_accessible': wheelchairAccessible,
      if (tablePreference != null) 'table_preference': tablePreference,
      if (status != null) 'status': status,
      if (createdAt != null) 'created_at': createdAt,
      if (quotedWaitTime != null) 'quoted_wait_time': quotedWaitTime,
      if (notifiedAt != null) 'notified_at': notifiedAt,
      if (seatedAt != null) 'seated_at': seatedAt,
      if (seatedTableUuid != null) 'seated_table_uuid': seatedTableUuid,
      if (queuePosition != null) 'queue_position': queuePosition,
    });
  }

  WaitlistTableCompanion copyWith(
      {Value<int>? id,
      Value<String>? uuid,
      Value<String>? guestName,
      Value<String>? phoneNumber,
      Value<int>? partySize,
      Value<String?>? specialRequests,
      Value<bool>? highchairNeeded,
      Value<bool>? wheelchairAccessible,
      Value<String?>? tablePreference,
      Value<String>? status,
      Value<DateTime>? createdAt,
      Value<DateTime?>? quotedWaitTime,
      Value<DateTime?>? notifiedAt,
      Value<DateTime?>? seatedAt,
      Value<String?>? seatedTableUuid,
      Value<int?>? queuePosition}) {
    return WaitlistTableCompanion(
      id: id ?? this.id,
      uuid: uuid ?? this.uuid,
      guestName: guestName ?? this.guestName,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      partySize: partySize ?? this.partySize,
      specialRequests: specialRequests ?? this.specialRequests,
      highchairNeeded: highchairNeeded ?? this.highchairNeeded,
      wheelchairAccessible: wheelchairAccessible ?? this.wheelchairAccessible,
      tablePreference: tablePreference ?? this.tablePreference,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
      quotedWaitTime: quotedWaitTime ?? this.quotedWaitTime,
      notifiedAt: notifiedAt ?? this.notifiedAt,
      seatedAt: seatedAt ?? this.seatedAt,
      seatedTableUuid: seatedTableUuid ?? this.seatedTableUuid,
      queuePosition: queuePosition ?? this.queuePosition,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (uuid.present) {
      map['uuid'] = Variable<String>(uuid.value);
    }
    if (guestName.present) {
      map['guest_name'] = Variable<String>(guestName.value);
    }
    if (phoneNumber.present) {
      map['phone_number'] = Variable<String>(phoneNumber.value);
    }
    if (partySize.present) {
      map['party_size'] = Variable<int>(partySize.value);
    }
    if (specialRequests.present) {
      map['special_requests'] = Variable<String>(specialRequests.value);
    }
    if (highchairNeeded.present) {
      map['highchair_needed'] = Variable<bool>(highchairNeeded.value);
    }
    if (wheelchairAccessible.present) {
      map['wheelchair_accessible'] = Variable<bool>(wheelchairAccessible.value);
    }
    if (tablePreference.present) {
      map['table_preference'] = Variable<String>(tablePreference.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (quotedWaitTime.present) {
      map['quoted_wait_time'] = Variable<DateTime>(quotedWaitTime.value);
    }
    if (notifiedAt.present) {
      map['notified_at'] = Variable<DateTime>(notifiedAt.value);
    }
    if (seatedAt.present) {
      map['seated_at'] = Variable<DateTime>(seatedAt.value);
    }
    if (seatedTableUuid.present) {
      map['seated_table_uuid'] = Variable<String>(seatedTableUuid.value);
    }
    if (queuePosition.present) {
      map['queue_position'] = Variable<int>(queuePosition.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('WaitlistTableCompanion(')
          ..write('id: $id, ')
          ..write('uuid: $uuid, ')
          ..write('guestName: $guestName, ')
          ..write('phoneNumber: $phoneNumber, ')
          ..write('partySize: $partySize, ')
          ..write('specialRequests: $specialRequests, ')
          ..write('highchairNeeded: $highchairNeeded, ')
          ..write('wheelchairAccessible: $wheelchairAccessible, ')
          ..write('tablePreference: $tablePreference, ')
          ..write('status: $status, ')
          ..write('createdAt: $createdAt, ')
          ..write('quotedWaitTime: $quotedWaitTime, ')
          ..write('notifiedAt: $notifiedAt, ')
          ..write('seatedAt: $seatedAt, ')
          ..write('seatedTableUuid: $seatedTableUuid, ')
          ..write('queuePosition: $queuePosition')
          ..write(')'))
        .toString();
  }
}

class $StaffAlertTableTable extends StaffAlertTable
    with TableInfo<$StaffAlertTableTable, StaffAlertTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $StaffAlertTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _uuidMeta = const VerificationMeta('uuid');
  @override
  late final GeneratedColumn<String> uuid = GeneratedColumn<String>(
      'uuid', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'));
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
      'type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _priorityMeta =
      const VerificationMeta('priority');
  @override
  late final GeneratedColumn<String> priority = GeneratedColumn<String>(
      'priority', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _messageMeta =
      const VerificationMeta('message');
  @override
  late final GeneratedColumn<String> message = GeneratedColumn<String>(
      'message', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
      'status', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('active'));
  static const VerificationMeta _targetRolesJsonMeta =
      const VerificationMeta('targetRolesJson');
  @override
  late final GeneratedColumn<String> targetRolesJson = GeneratedColumn<String>(
      'target_roles_json', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('[]'));
  static const VerificationMeta _targetUserUuidsJsonMeta =
      const VerificationMeta('targetUserUuidsJson');
  @override
  late final GeneratedColumn<String> targetUserUuidsJson =
      GeneratedColumn<String>('target_user_uuids_json', aliasedName, false,
          type: DriftSqlType.string,
          requiredDuringInsert: false,
          defaultValue: const Constant('[]'));
  static const VerificationMeta _broadcastToAllMeta =
      const VerificationMeta('broadcastToAll');
  @override
  late final GeneratedColumn<bool> broadcastToAll = GeneratedColumn<bool>(
      'broadcast_to_all', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("broadcast_to_all" IN (0, 1))'),
      defaultValue: const Constant(true));
  static const VerificationMeta _relatedOrderUuidMeta =
      const VerificationMeta('relatedOrderUuid');
  @override
  late final GeneratedColumn<String> relatedOrderUuid = GeneratedColumn<String>(
      'related_order_uuid', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _relatedTableUuidMeta =
      const VerificationMeta('relatedTableUuid');
  @override
  late final GeneratedColumn<String> relatedTableUuid = GeneratedColumn<String>(
      'related_table_uuid', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _relatedCustomerUuidMeta =
      const VerificationMeta('relatedCustomerUuid');
  @override
  late final GeneratedColumn<String> relatedCustomerUuid =
      GeneratedColumn<String>('related_customer_uuid', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _actionLabelMeta =
      const VerificationMeta('actionLabel');
  @override
  late final GeneratedColumn<String> actionLabel = GeneratedColumn<String>(
      'action_label', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _actionRouteMeta =
      const VerificationMeta('actionRoute');
  @override
  late final GeneratedColumn<String> actionRoute = GeneratedColumn<String>(
      'action_route', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _expiresAtMeta =
      const VerificationMeta('expiresAt');
  @override
  late final GeneratedColumn<DateTime> expiresAt = GeneratedColumn<DateTime>(
      'expires_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _acknowledgedAtMeta =
      const VerificationMeta('acknowledgedAt');
  @override
  late final GeneratedColumn<DateTime> acknowledgedAt =
      GeneratedColumn<DateTime>('acknowledged_at', aliasedName, true,
          type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _acknowledgedByUuidMeta =
      const VerificationMeta('acknowledgedByUuid');
  @override
  late final GeneratedColumn<String> acknowledgedByUuid =
      GeneratedColumn<String>('acknowledged_by_uuid', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _resolvedAtMeta =
      const VerificationMeta('resolvedAt');
  @override
  late final GeneratedColumn<DateTime> resolvedAt = GeneratedColumn<DateTime>(
      'resolved_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _resolvedByUuidMeta =
      const VerificationMeta('resolvedByUuid');
  @override
  late final GeneratedColumn<String> resolvedByUuid = GeneratedColumn<String>(
      'resolved_by_uuid', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _playSoundMeta =
      const VerificationMeta('playSound');
  @override
  late final GeneratedColumn<bool> playSound = GeneratedColumn<bool>(
      'play_sound', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("play_sound" IN (0, 1))'),
      defaultValue: const Constant(true));
  static const VerificationMeta _vibrateMeta =
      const VerificationMeta('vibrate');
  @override
  late final GeneratedColumn<bool> vibrate = GeneratedColumn<bool>(
      'vibrate', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("vibrate" IN (0, 1))'),
      defaultValue: const Constant(true));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        uuid,
        type,
        priority,
        title,
        message,
        status,
        targetRolesJson,
        targetUserUuidsJson,
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
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'staff_alert_table';
  @override
  VerificationContext validateIntegrity(
      Insertable<StaffAlertTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('uuid')) {
      context.handle(
          _uuidMeta, uuid.isAcceptableOrUnknown(data['uuid']!, _uuidMeta));
    } else if (isInserting) {
      context.missing(_uuidMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
          _typeMeta, type.isAcceptableOrUnknown(data['type']!, _typeMeta));
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('priority')) {
      context.handle(_priorityMeta,
          priority.isAcceptableOrUnknown(data['priority']!, _priorityMeta));
    } else if (isInserting) {
      context.missing(_priorityMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('message')) {
      context.handle(_messageMeta,
          message.isAcceptableOrUnknown(data['message']!, _messageMeta));
    } else if (isInserting) {
      context.missing(_messageMeta);
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status']!, _statusMeta));
    }
    if (data.containsKey('target_roles_json')) {
      context.handle(
          _targetRolesJsonMeta,
          targetRolesJson.isAcceptableOrUnknown(
              data['target_roles_json']!, _targetRolesJsonMeta));
    }
    if (data.containsKey('target_user_uuids_json')) {
      context.handle(
          _targetUserUuidsJsonMeta,
          targetUserUuidsJson.isAcceptableOrUnknown(
              data['target_user_uuids_json']!, _targetUserUuidsJsonMeta));
    }
    if (data.containsKey('broadcast_to_all')) {
      context.handle(
          _broadcastToAllMeta,
          broadcastToAll.isAcceptableOrUnknown(
              data['broadcast_to_all']!, _broadcastToAllMeta));
    }
    if (data.containsKey('related_order_uuid')) {
      context.handle(
          _relatedOrderUuidMeta,
          relatedOrderUuid.isAcceptableOrUnknown(
              data['related_order_uuid']!, _relatedOrderUuidMeta));
    }
    if (data.containsKey('related_table_uuid')) {
      context.handle(
          _relatedTableUuidMeta,
          relatedTableUuid.isAcceptableOrUnknown(
              data['related_table_uuid']!, _relatedTableUuidMeta));
    }
    if (data.containsKey('related_customer_uuid')) {
      context.handle(
          _relatedCustomerUuidMeta,
          relatedCustomerUuid.isAcceptableOrUnknown(
              data['related_customer_uuid']!, _relatedCustomerUuidMeta));
    }
    if (data.containsKey('action_label')) {
      context.handle(
          _actionLabelMeta,
          actionLabel.isAcceptableOrUnknown(
              data['action_label']!, _actionLabelMeta));
    }
    if (data.containsKey('action_route')) {
      context.handle(
          _actionRouteMeta,
          actionRoute.isAcceptableOrUnknown(
              data['action_route']!, _actionRouteMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('expires_at')) {
      context.handle(_expiresAtMeta,
          expiresAt.isAcceptableOrUnknown(data['expires_at']!, _expiresAtMeta));
    }
    if (data.containsKey('acknowledged_at')) {
      context.handle(
          _acknowledgedAtMeta,
          acknowledgedAt.isAcceptableOrUnknown(
              data['acknowledged_at']!, _acknowledgedAtMeta));
    }
    if (data.containsKey('acknowledged_by_uuid')) {
      context.handle(
          _acknowledgedByUuidMeta,
          acknowledgedByUuid.isAcceptableOrUnknown(
              data['acknowledged_by_uuid']!, _acknowledgedByUuidMeta));
    }
    if (data.containsKey('resolved_at')) {
      context.handle(
          _resolvedAtMeta,
          resolvedAt.isAcceptableOrUnknown(
              data['resolved_at']!, _resolvedAtMeta));
    }
    if (data.containsKey('resolved_by_uuid')) {
      context.handle(
          _resolvedByUuidMeta,
          resolvedByUuid.isAcceptableOrUnknown(
              data['resolved_by_uuid']!, _resolvedByUuidMeta));
    }
    if (data.containsKey('play_sound')) {
      context.handle(_playSoundMeta,
          playSound.isAcceptableOrUnknown(data['play_sound']!, _playSoundMeta));
    }
    if (data.containsKey('vibrate')) {
      context.handle(_vibrateMeta,
          vibrate.isAcceptableOrUnknown(data['vibrate']!, _vibrateMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  StaffAlertTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return StaffAlertTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      uuid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}uuid'])!,
      type: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}type'])!,
      priority: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}priority'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      message: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}message'])!,
      status: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}status'])!,
      targetRolesJson: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}target_roles_json'])!,
      targetUserUuidsJson: attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}target_user_uuids_json'])!,
      broadcastToAll: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}broadcast_to_all'])!,
      relatedOrderUuid: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}related_order_uuid']),
      relatedTableUuid: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}related_table_uuid']),
      relatedCustomerUuid: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}related_customer_uuid']),
      actionLabel: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}action_label']),
      actionRoute: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}action_route']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      expiresAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}expires_at']),
      acknowledgedAt: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}acknowledged_at']),
      acknowledgedByUuid: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}acknowledged_by_uuid']),
      resolvedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}resolved_at']),
      resolvedByUuid: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}resolved_by_uuid']),
      playSound: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}play_sound'])!,
      vibrate: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}vibrate'])!,
    );
  }

  @override
  $StaffAlertTableTable createAlias(String alias) {
    return $StaffAlertTableTable(attachedDatabase, alias);
  }
}

class StaffAlertTableData extends DataClass
    implements Insertable<StaffAlertTableData> {
  final int id;
  final String uuid;
  final String type;
  final String priority;
  final String title;
  final String message;
  final String status;
  final String targetRolesJson;
  final String targetUserUuidsJson;
  final bool broadcastToAll;
  final String? relatedOrderUuid;
  final String? relatedTableUuid;
  final String? relatedCustomerUuid;
  final String? actionLabel;
  final String? actionRoute;
  final DateTime createdAt;
  final DateTime? expiresAt;
  final DateTime? acknowledgedAt;
  final String? acknowledgedByUuid;
  final DateTime? resolvedAt;
  final String? resolvedByUuid;
  final bool playSound;
  final bool vibrate;
  const StaffAlertTableData(
      {required this.id,
      required this.uuid,
      required this.type,
      required this.priority,
      required this.title,
      required this.message,
      required this.status,
      required this.targetRolesJson,
      required this.targetUserUuidsJson,
      required this.broadcastToAll,
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
      required this.playSound,
      required this.vibrate});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['uuid'] = Variable<String>(uuid);
    map['type'] = Variable<String>(type);
    map['priority'] = Variable<String>(priority);
    map['title'] = Variable<String>(title);
    map['message'] = Variable<String>(message);
    map['status'] = Variable<String>(status);
    map['target_roles_json'] = Variable<String>(targetRolesJson);
    map['target_user_uuids_json'] = Variable<String>(targetUserUuidsJson);
    map['broadcast_to_all'] = Variable<bool>(broadcastToAll);
    if (!nullToAbsent || relatedOrderUuid != null) {
      map['related_order_uuid'] = Variable<String>(relatedOrderUuid);
    }
    if (!nullToAbsent || relatedTableUuid != null) {
      map['related_table_uuid'] = Variable<String>(relatedTableUuid);
    }
    if (!nullToAbsent || relatedCustomerUuid != null) {
      map['related_customer_uuid'] = Variable<String>(relatedCustomerUuid);
    }
    if (!nullToAbsent || actionLabel != null) {
      map['action_label'] = Variable<String>(actionLabel);
    }
    if (!nullToAbsent || actionRoute != null) {
      map['action_route'] = Variable<String>(actionRoute);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    if (!nullToAbsent || expiresAt != null) {
      map['expires_at'] = Variable<DateTime>(expiresAt);
    }
    if (!nullToAbsent || acknowledgedAt != null) {
      map['acknowledged_at'] = Variable<DateTime>(acknowledgedAt);
    }
    if (!nullToAbsent || acknowledgedByUuid != null) {
      map['acknowledged_by_uuid'] = Variable<String>(acknowledgedByUuid);
    }
    if (!nullToAbsent || resolvedAt != null) {
      map['resolved_at'] = Variable<DateTime>(resolvedAt);
    }
    if (!nullToAbsent || resolvedByUuid != null) {
      map['resolved_by_uuid'] = Variable<String>(resolvedByUuid);
    }
    map['play_sound'] = Variable<bool>(playSound);
    map['vibrate'] = Variable<bool>(vibrate);
    return map;
  }

  StaffAlertTableCompanion toCompanion(bool nullToAbsent) {
    return StaffAlertTableCompanion(
      id: Value(id),
      uuid: Value(uuid),
      type: Value(type),
      priority: Value(priority),
      title: Value(title),
      message: Value(message),
      status: Value(status),
      targetRolesJson: Value(targetRolesJson),
      targetUserUuidsJson: Value(targetUserUuidsJson),
      broadcastToAll: Value(broadcastToAll),
      relatedOrderUuid: relatedOrderUuid == null && nullToAbsent
          ? const Value.absent()
          : Value(relatedOrderUuid),
      relatedTableUuid: relatedTableUuid == null && nullToAbsent
          ? const Value.absent()
          : Value(relatedTableUuid),
      relatedCustomerUuid: relatedCustomerUuid == null && nullToAbsent
          ? const Value.absent()
          : Value(relatedCustomerUuid),
      actionLabel: actionLabel == null && nullToAbsent
          ? const Value.absent()
          : Value(actionLabel),
      actionRoute: actionRoute == null && nullToAbsent
          ? const Value.absent()
          : Value(actionRoute),
      createdAt: Value(createdAt),
      expiresAt: expiresAt == null && nullToAbsent
          ? const Value.absent()
          : Value(expiresAt),
      acknowledgedAt: acknowledgedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(acknowledgedAt),
      acknowledgedByUuid: acknowledgedByUuid == null && nullToAbsent
          ? const Value.absent()
          : Value(acknowledgedByUuid),
      resolvedAt: resolvedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(resolvedAt),
      resolvedByUuid: resolvedByUuid == null && nullToAbsent
          ? const Value.absent()
          : Value(resolvedByUuid),
      playSound: Value(playSound),
      vibrate: Value(vibrate),
    );
  }

  factory StaffAlertTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return StaffAlertTableData(
      id: serializer.fromJson<int>(json['id']),
      uuid: serializer.fromJson<String>(json['uuid']),
      type: serializer.fromJson<String>(json['type']),
      priority: serializer.fromJson<String>(json['priority']),
      title: serializer.fromJson<String>(json['title']),
      message: serializer.fromJson<String>(json['message']),
      status: serializer.fromJson<String>(json['status']),
      targetRolesJson: serializer.fromJson<String>(json['targetRolesJson']),
      targetUserUuidsJson:
          serializer.fromJson<String>(json['targetUserUuidsJson']),
      broadcastToAll: serializer.fromJson<bool>(json['broadcastToAll']),
      relatedOrderUuid: serializer.fromJson<String?>(json['relatedOrderUuid']),
      relatedTableUuid: serializer.fromJson<String?>(json['relatedTableUuid']),
      relatedCustomerUuid:
          serializer.fromJson<String?>(json['relatedCustomerUuid']),
      actionLabel: serializer.fromJson<String?>(json['actionLabel']),
      actionRoute: serializer.fromJson<String?>(json['actionRoute']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      expiresAt: serializer.fromJson<DateTime?>(json['expiresAt']),
      acknowledgedAt: serializer.fromJson<DateTime?>(json['acknowledgedAt']),
      acknowledgedByUuid:
          serializer.fromJson<String?>(json['acknowledgedByUuid']),
      resolvedAt: serializer.fromJson<DateTime?>(json['resolvedAt']),
      resolvedByUuid: serializer.fromJson<String?>(json['resolvedByUuid']),
      playSound: serializer.fromJson<bool>(json['playSound']),
      vibrate: serializer.fromJson<bool>(json['vibrate']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'uuid': serializer.toJson<String>(uuid),
      'type': serializer.toJson<String>(type),
      'priority': serializer.toJson<String>(priority),
      'title': serializer.toJson<String>(title),
      'message': serializer.toJson<String>(message),
      'status': serializer.toJson<String>(status),
      'targetRolesJson': serializer.toJson<String>(targetRolesJson),
      'targetUserUuidsJson': serializer.toJson<String>(targetUserUuidsJson),
      'broadcastToAll': serializer.toJson<bool>(broadcastToAll),
      'relatedOrderUuid': serializer.toJson<String?>(relatedOrderUuid),
      'relatedTableUuid': serializer.toJson<String?>(relatedTableUuid),
      'relatedCustomerUuid': serializer.toJson<String?>(relatedCustomerUuid),
      'actionLabel': serializer.toJson<String?>(actionLabel),
      'actionRoute': serializer.toJson<String?>(actionRoute),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'expiresAt': serializer.toJson<DateTime?>(expiresAt),
      'acknowledgedAt': serializer.toJson<DateTime?>(acknowledgedAt),
      'acknowledgedByUuid': serializer.toJson<String?>(acknowledgedByUuid),
      'resolvedAt': serializer.toJson<DateTime?>(resolvedAt),
      'resolvedByUuid': serializer.toJson<String?>(resolvedByUuid),
      'playSound': serializer.toJson<bool>(playSound),
      'vibrate': serializer.toJson<bool>(vibrate),
    };
  }

  StaffAlertTableData copyWith(
          {int? id,
          String? uuid,
          String? type,
          String? priority,
          String? title,
          String? message,
          String? status,
          String? targetRolesJson,
          String? targetUserUuidsJson,
          bool? broadcastToAll,
          Value<String?> relatedOrderUuid = const Value.absent(),
          Value<String?> relatedTableUuid = const Value.absent(),
          Value<String?> relatedCustomerUuid = const Value.absent(),
          Value<String?> actionLabel = const Value.absent(),
          Value<String?> actionRoute = const Value.absent(),
          DateTime? createdAt,
          Value<DateTime?> expiresAt = const Value.absent(),
          Value<DateTime?> acknowledgedAt = const Value.absent(),
          Value<String?> acknowledgedByUuid = const Value.absent(),
          Value<DateTime?> resolvedAt = const Value.absent(),
          Value<String?> resolvedByUuid = const Value.absent(),
          bool? playSound,
          bool? vibrate}) =>
      StaffAlertTableData(
        id: id ?? this.id,
        uuid: uuid ?? this.uuid,
        type: type ?? this.type,
        priority: priority ?? this.priority,
        title: title ?? this.title,
        message: message ?? this.message,
        status: status ?? this.status,
        targetRolesJson: targetRolesJson ?? this.targetRolesJson,
        targetUserUuidsJson: targetUserUuidsJson ?? this.targetUserUuidsJson,
        broadcastToAll: broadcastToAll ?? this.broadcastToAll,
        relatedOrderUuid: relatedOrderUuid.present
            ? relatedOrderUuid.value
            : this.relatedOrderUuid,
        relatedTableUuid: relatedTableUuid.present
            ? relatedTableUuid.value
            : this.relatedTableUuid,
        relatedCustomerUuid: relatedCustomerUuid.present
            ? relatedCustomerUuid.value
            : this.relatedCustomerUuid,
        actionLabel: actionLabel.present ? actionLabel.value : this.actionLabel,
        actionRoute: actionRoute.present ? actionRoute.value : this.actionRoute,
        createdAt: createdAt ?? this.createdAt,
        expiresAt: expiresAt.present ? expiresAt.value : this.expiresAt,
        acknowledgedAt:
            acknowledgedAt.present ? acknowledgedAt.value : this.acknowledgedAt,
        acknowledgedByUuid: acknowledgedByUuid.present
            ? acknowledgedByUuid.value
            : this.acknowledgedByUuid,
        resolvedAt: resolvedAt.present ? resolvedAt.value : this.resolvedAt,
        resolvedByUuid:
            resolvedByUuid.present ? resolvedByUuid.value : this.resolvedByUuid,
        playSound: playSound ?? this.playSound,
        vibrate: vibrate ?? this.vibrate,
      );
  StaffAlertTableData copyWithCompanion(StaffAlertTableCompanion data) {
    return StaffAlertTableData(
      id: data.id.present ? data.id.value : this.id,
      uuid: data.uuid.present ? data.uuid.value : this.uuid,
      type: data.type.present ? data.type.value : this.type,
      priority: data.priority.present ? data.priority.value : this.priority,
      title: data.title.present ? data.title.value : this.title,
      message: data.message.present ? data.message.value : this.message,
      status: data.status.present ? data.status.value : this.status,
      targetRolesJson: data.targetRolesJson.present
          ? data.targetRolesJson.value
          : this.targetRolesJson,
      targetUserUuidsJson: data.targetUserUuidsJson.present
          ? data.targetUserUuidsJson.value
          : this.targetUserUuidsJson,
      broadcastToAll: data.broadcastToAll.present
          ? data.broadcastToAll.value
          : this.broadcastToAll,
      relatedOrderUuid: data.relatedOrderUuid.present
          ? data.relatedOrderUuid.value
          : this.relatedOrderUuid,
      relatedTableUuid: data.relatedTableUuid.present
          ? data.relatedTableUuid.value
          : this.relatedTableUuid,
      relatedCustomerUuid: data.relatedCustomerUuid.present
          ? data.relatedCustomerUuid.value
          : this.relatedCustomerUuid,
      actionLabel:
          data.actionLabel.present ? data.actionLabel.value : this.actionLabel,
      actionRoute:
          data.actionRoute.present ? data.actionRoute.value : this.actionRoute,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      expiresAt: data.expiresAt.present ? data.expiresAt.value : this.expiresAt,
      acknowledgedAt: data.acknowledgedAt.present
          ? data.acknowledgedAt.value
          : this.acknowledgedAt,
      acknowledgedByUuid: data.acknowledgedByUuid.present
          ? data.acknowledgedByUuid.value
          : this.acknowledgedByUuid,
      resolvedAt:
          data.resolvedAt.present ? data.resolvedAt.value : this.resolvedAt,
      resolvedByUuid: data.resolvedByUuid.present
          ? data.resolvedByUuid.value
          : this.resolvedByUuid,
      playSound: data.playSound.present ? data.playSound.value : this.playSound,
      vibrate: data.vibrate.present ? data.vibrate.value : this.vibrate,
    );
  }

  @override
  String toString() {
    return (StringBuffer('StaffAlertTableData(')
          ..write('id: $id, ')
          ..write('uuid: $uuid, ')
          ..write('type: $type, ')
          ..write('priority: $priority, ')
          ..write('title: $title, ')
          ..write('message: $message, ')
          ..write('status: $status, ')
          ..write('targetRolesJson: $targetRolesJson, ')
          ..write('targetUserUuidsJson: $targetUserUuidsJson, ')
          ..write('broadcastToAll: $broadcastToAll, ')
          ..write('relatedOrderUuid: $relatedOrderUuid, ')
          ..write('relatedTableUuid: $relatedTableUuid, ')
          ..write('relatedCustomerUuid: $relatedCustomerUuid, ')
          ..write('actionLabel: $actionLabel, ')
          ..write('actionRoute: $actionRoute, ')
          ..write('createdAt: $createdAt, ')
          ..write('expiresAt: $expiresAt, ')
          ..write('acknowledgedAt: $acknowledgedAt, ')
          ..write('acknowledgedByUuid: $acknowledgedByUuid, ')
          ..write('resolvedAt: $resolvedAt, ')
          ..write('resolvedByUuid: $resolvedByUuid, ')
          ..write('playSound: $playSound, ')
          ..write('vibrate: $vibrate')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([
        id,
        uuid,
        type,
        priority,
        title,
        message,
        status,
        targetRolesJson,
        targetUserUuidsJson,
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
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is StaffAlertTableData &&
          other.id == this.id &&
          other.uuid == this.uuid &&
          other.type == this.type &&
          other.priority == this.priority &&
          other.title == this.title &&
          other.message == this.message &&
          other.status == this.status &&
          other.targetRolesJson == this.targetRolesJson &&
          other.targetUserUuidsJson == this.targetUserUuidsJson &&
          other.broadcastToAll == this.broadcastToAll &&
          other.relatedOrderUuid == this.relatedOrderUuid &&
          other.relatedTableUuid == this.relatedTableUuid &&
          other.relatedCustomerUuid == this.relatedCustomerUuid &&
          other.actionLabel == this.actionLabel &&
          other.actionRoute == this.actionRoute &&
          other.createdAt == this.createdAt &&
          other.expiresAt == this.expiresAt &&
          other.acknowledgedAt == this.acknowledgedAt &&
          other.acknowledgedByUuid == this.acknowledgedByUuid &&
          other.resolvedAt == this.resolvedAt &&
          other.resolvedByUuid == this.resolvedByUuid &&
          other.playSound == this.playSound &&
          other.vibrate == this.vibrate);
}

class StaffAlertTableCompanion extends UpdateCompanion<StaffAlertTableData> {
  final Value<int> id;
  final Value<String> uuid;
  final Value<String> type;
  final Value<String> priority;
  final Value<String> title;
  final Value<String> message;
  final Value<String> status;
  final Value<String> targetRolesJson;
  final Value<String> targetUserUuidsJson;
  final Value<bool> broadcastToAll;
  final Value<String?> relatedOrderUuid;
  final Value<String?> relatedTableUuid;
  final Value<String?> relatedCustomerUuid;
  final Value<String?> actionLabel;
  final Value<String?> actionRoute;
  final Value<DateTime> createdAt;
  final Value<DateTime?> expiresAt;
  final Value<DateTime?> acknowledgedAt;
  final Value<String?> acknowledgedByUuid;
  final Value<DateTime?> resolvedAt;
  final Value<String?> resolvedByUuid;
  final Value<bool> playSound;
  final Value<bool> vibrate;
  const StaffAlertTableCompanion({
    this.id = const Value.absent(),
    this.uuid = const Value.absent(),
    this.type = const Value.absent(),
    this.priority = const Value.absent(),
    this.title = const Value.absent(),
    this.message = const Value.absent(),
    this.status = const Value.absent(),
    this.targetRolesJson = const Value.absent(),
    this.targetUserUuidsJson = const Value.absent(),
    this.broadcastToAll = const Value.absent(),
    this.relatedOrderUuid = const Value.absent(),
    this.relatedTableUuid = const Value.absent(),
    this.relatedCustomerUuid = const Value.absent(),
    this.actionLabel = const Value.absent(),
    this.actionRoute = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.expiresAt = const Value.absent(),
    this.acknowledgedAt = const Value.absent(),
    this.acknowledgedByUuid = const Value.absent(),
    this.resolvedAt = const Value.absent(),
    this.resolvedByUuid = const Value.absent(),
    this.playSound = const Value.absent(),
    this.vibrate = const Value.absent(),
  });
  StaffAlertTableCompanion.insert({
    this.id = const Value.absent(),
    required String uuid,
    required String type,
    required String priority,
    required String title,
    required String message,
    this.status = const Value.absent(),
    this.targetRolesJson = const Value.absent(),
    this.targetUserUuidsJson = const Value.absent(),
    this.broadcastToAll = const Value.absent(),
    this.relatedOrderUuid = const Value.absent(),
    this.relatedTableUuid = const Value.absent(),
    this.relatedCustomerUuid = const Value.absent(),
    this.actionLabel = const Value.absent(),
    this.actionRoute = const Value.absent(),
    required DateTime createdAt,
    this.expiresAt = const Value.absent(),
    this.acknowledgedAt = const Value.absent(),
    this.acknowledgedByUuid = const Value.absent(),
    this.resolvedAt = const Value.absent(),
    this.resolvedByUuid = const Value.absent(),
    this.playSound = const Value.absent(),
    this.vibrate = const Value.absent(),
  })  : uuid = Value(uuid),
        type = Value(type),
        priority = Value(priority),
        title = Value(title),
        message = Value(message),
        createdAt = Value(createdAt);
  static Insertable<StaffAlertTableData> custom({
    Expression<int>? id,
    Expression<String>? uuid,
    Expression<String>? type,
    Expression<String>? priority,
    Expression<String>? title,
    Expression<String>? message,
    Expression<String>? status,
    Expression<String>? targetRolesJson,
    Expression<String>? targetUserUuidsJson,
    Expression<bool>? broadcastToAll,
    Expression<String>? relatedOrderUuid,
    Expression<String>? relatedTableUuid,
    Expression<String>? relatedCustomerUuid,
    Expression<String>? actionLabel,
    Expression<String>? actionRoute,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? expiresAt,
    Expression<DateTime>? acknowledgedAt,
    Expression<String>? acknowledgedByUuid,
    Expression<DateTime>? resolvedAt,
    Expression<String>? resolvedByUuid,
    Expression<bool>? playSound,
    Expression<bool>? vibrate,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (uuid != null) 'uuid': uuid,
      if (type != null) 'type': type,
      if (priority != null) 'priority': priority,
      if (title != null) 'title': title,
      if (message != null) 'message': message,
      if (status != null) 'status': status,
      if (targetRolesJson != null) 'target_roles_json': targetRolesJson,
      if (targetUserUuidsJson != null)
        'target_user_uuids_json': targetUserUuidsJson,
      if (broadcastToAll != null) 'broadcast_to_all': broadcastToAll,
      if (relatedOrderUuid != null) 'related_order_uuid': relatedOrderUuid,
      if (relatedTableUuid != null) 'related_table_uuid': relatedTableUuid,
      if (relatedCustomerUuid != null)
        'related_customer_uuid': relatedCustomerUuid,
      if (actionLabel != null) 'action_label': actionLabel,
      if (actionRoute != null) 'action_route': actionRoute,
      if (createdAt != null) 'created_at': createdAt,
      if (expiresAt != null) 'expires_at': expiresAt,
      if (acknowledgedAt != null) 'acknowledged_at': acknowledgedAt,
      if (acknowledgedByUuid != null)
        'acknowledged_by_uuid': acknowledgedByUuid,
      if (resolvedAt != null) 'resolved_at': resolvedAt,
      if (resolvedByUuid != null) 'resolved_by_uuid': resolvedByUuid,
      if (playSound != null) 'play_sound': playSound,
      if (vibrate != null) 'vibrate': vibrate,
    });
  }

  StaffAlertTableCompanion copyWith(
      {Value<int>? id,
      Value<String>? uuid,
      Value<String>? type,
      Value<String>? priority,
      Value<String>? title,
      Value<String>? message,
      Value<String>? status,
      Value<String>? targetRolesJson,
      Value<String>? targetUserUuidsJson,
      Value<bool>? broadcastToAll,
      Value<String?>? relatedOrderUuid,
      Value<String?>? relatedTableUuid,
      Value<String?>? relatedCustomerUuid,
      Value<String?>? actionLabel,
      Value<String?>? actionRoute,
      Value<DateTime>? createdAt,
      Value<DateTime?>? expiresAt,
      Value<DateTime?>? acknowledgedAt,
      Value<String?>? acknowledgedByUuid,
      Value<DateTime?>? resolvedAt,
      Value<String?>? resolvedByUuid,
      Value<bool>? playSound,
      Value<bool>? vibrate}) {
    return StaffAlertTableCompanion(
      id: id ?? this.id,
      uuid: uuid ?? this.uuid,
      type: type ?? this.type,
      priority: priority ?? this.priority,
      title: title ?? this.title,
      message: message ?? this.message,
      status: status ?? this.status,
      targetRolesJson: targetRolesJson ?? this.targetRolesJson,
      targetUserUuidsJson: targetUserUuidsJson ?? this.targetUserUuidsJson,
      broadcastToAll: broadcastToAll ?? this.broadcastToAll,
      relatedOrderUuid: relatedOrderUuid ?? this.relatedOrderUuid,
      relatedTableUuid: relatedTableUuid ?? this.relatedTableUuid,
      relatedCustomerUuid: relatedCustomerUuid ?? this.relatedCustomerUuid,
      actionLabel: actionLabel ?? this.actionLabel,
      actionRoute: actionRoute ?? this.actionRoute,
      createdAt: createdAt ?? this.createdAt,
      expiresAt: expiresAt ?? this.expiresAt,
      acknowledgedAt: acknowledgedAt ?? this.acknowledgedAt,
      acknowledgedByUuid: acknowledgedByUuid ?? this.acknowledgedByUuid,
      resolvedAt: resolvedAt ?? this.resolvedAt,
      resolvedByUuid: resolvedByUuid ?? this.resolvedByUuid,
      playSound: playSound ?? this.playSound,
      vibrate: vibrate ?? this.vibrate,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (uuid.present) {
      map['uuid'] = Variable<String>(uuid.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (priority.present) {
      map['priority'] = Variable<String>(priority.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (message.present) {
      map['message'] = Variable<String>(message.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (targetRolesJson.present) {
      map['target_roles_json'] = Variable<String>(targetRolesJson.value);
    }
    if (targetUserUuidsJson.present) {
      map['target_user_uuids_json'] =
          Variable<String>(targetUserUuidsJson.value);
    }
    if (broadcastToAll.present) {
      map['broadcast_to_all'] = Variable<bool>(broadcastToAll.value);
    }
    if (relatedOrderUuid.present) {
      map['related_order_uuid'] = Variable<String>(relatedOrderUuid.value);
    }
    if (relatedTableUuid.present) {
      map['related_table_uuid'] = Variable<String>(relatedTableUuid.value);
    }
    if (relatedCustomerUuid.present) {
      map['related_customer_uuid'] =
          Variable<String>(relatedCustomerUuid.value);
    }
    if (actionLabel.present) {
      map['action_label'] = Variable<String>(actionLabel.value);
    }
    if (actionRoute.present) {
      map['action_route'] = Variable<String>(actionRoute.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (expiresAt.present) {
      map['expires_at'] = Variable<DateTime>(expiresAt.value);
    }
    if (acknowledgedAt.present) {
      map['acknowledged_at'] = Variable<DateTime>(acknowledgedAt.value);
    }
    if (acknowledgedByUuid.present) {
      map['acknowledged_by_uuid'] = Variable<String>(acknowledgedByUuid.value);
    }
    if (resolvedAt.present) {
      map['resolved_at'] = Variable<DateTime>(resolvedAt.value);
    }
    if (resolvedByUuid.present) {
      map['resolved_by_uuid'] = Variable<String>(resolvedByUuid.value);
    }
    if (playSound.present) {
      map['play_sound'] = Variable<bool>(playSound.value);
    }
    if (vibrate.present) {
      map['vibrate'] = Variable<bool>(vibrate.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('StaffAlertTableCompanion(')
          ..write('id: $id, ')
          ..write('uuid: $uuid, ')
          ..write('type: $type, ')
          ..write('priority: $priority, ')
          ..write('title: $title, ')
          ..write('message: $message, ')
          ..write('status: $status, ')
          ..write('targetRolesJson: $targetRolesJson, ')
          ..write('targetUserUuidsJson: $targetUserUuidsJson, ')
          ..write('broadcastToAll: $broadcastToAll, ')
          ..write('relatedOrderUuid: $relatedOrderUuid, ')
          ..write('relatedTableUuid: $relatedTableUuid, ')
          ..write('relatedCustomerUuid: $relatedCustomerUuid, ')
          ..write('actionLabel: $actionLabel, ')
          ..write('actionRoute: $actionRoute, ')
          ..write('createdAt: $createdAt, ')
          ..write('expiresAt: $expiresAt, ')
          ..write('acknowledgedAt: $acknowledgedAt, ')
          ..write('acknowledgedByUuid: $acknowledgedByUuid, ')
          ..write('resolvedAt: $resolvedAt, ')
          ..write('resolvedByUuid: $resolvedByUuid, ')
          ..write('playSound: $playSound, ')
          ..write('vibrate: $vibrate')
          ..write(')'))
        .toString();
  }
}

class $KitchenTicketTableTable extends KitchenTicketTable
    with TableInfo<$KitchenTicketTableTable, KitchenTicketTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $KitchenTicketTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _uuidMeta = const VerificationMeta('uuid');
  @override
  late final GeneratedColumn<String> uuid = GeneratedColumn<String>(
      'uuid', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'));
  static const VerificationMeta _orderUuidMeta =
      const VerificationMeta('orderUuid');
  @override
  late final GeneratedColumn<String> orderUuid = GeneratedColumn<String>(
      'order_uuid', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _orderNumberMeta =
      const VerificationMeta('orderNumber');
  @override
  late final GeneratedColumn<String> orderNumber = GeneratedColumn<String>(
      'order_number', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _tableUuidMeta =
      const VerificationMeta('tableUuid');
  @override
  late final GeneratedColumn<String> tableUuid = GeneratedColumn<String>(
      'table_uuid', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _guestTableNameMeta =
      const VerificationMeta('guestTableName');
  @override
  late final GeneratedColumn<String> guestTableName = GeneratedColumn<String>(
      'guest_table_name', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _serverNameMeta =
      const VerificationMeta('serverName');
  @override
  late final GeneratedColumn<String> serverName = GeneratedColumn<String>(
      'server_name', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
      'status', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('fired'));
  static const VerificationMeta _firedAtMeta =
      const VerificationMeta('firedAt');
  @override
  late final GeneratedColumn<DateTime> firedAt = GeneratedColumn<DateTime>(
      'fired_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _startedAtMeta =
      const VerificationMeta('startedAt');
  @override
  late final GeneratedColumn<DateTime> startedAt = GeneratedColumn<DateTime>(
      'started_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _completedAtMeta =
      const VerificationMeta('completedAt');
  @override
  late final GeneratedColumn<DateTime> completedAt = GeneratedColumn<DateTime>(
      'completed_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _targetTimeMeta =
      const VerificationMeta('targetTime');
  @override
  late final GeneratedColumn<DateTime> targetTime = GeneratedColumn<DateTime>(
      'target_time', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _noteMeta = const VerificationMeta('note');
  @override
  late final GeneratedColumn<String> note = GeneratedColumn<String>(
      'note', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _isRushMeta = const VerificationMeta('isRush');
  @override
  late final GeneratedColumn<bool> isRush = GeneratedColumn<bool>(
      'is_rush', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_rush" IN (0, 1))'),
      defaultValue: const Constant(false));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        uuid,
        orderUuid,
        orderNumber,
        tableUuid,
        guestTableName,
        serverName,
        status,
        firedAt,
        startedAt,
        completedAt,
        targetTime,
        note,
        isRush
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'kitchen_ticket_table';
  @override
  VerificationContext validateIntegrity(
      Insertable<KitchenTicketTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('uuid')) {
      context.handle(
          _uuidMeta, uuid.isAcceptableOrUnknown(data['uuid']!, _uuidMeta));
    } else if (isInserting) {
      context.missing(_uuidMeta);
    }
    if (data.containsKey('order_uuid')) {
      context.handle(_orderUuidMeta,
          orderUuid.isAcceptableOrUnknown(data['order_uuid']!, _orderUuidMeta));
    } else if (isInserting) {
      context.missing(_orderUuidMeta);
    }
    if (data.containsKey('order_number')) {
      context.handle(
          _orderNumberMeta,
          orderNumber.isAcceptableOrUnknown(
              data['order_number']!, _orderNumberMeta));
    } else if (isInserting) {
      context.missing(_orderNumberMeta);
    }
    if (data.containsKey('table_uuid')) {
      context.handle(_tableUuidMeta,
          tableUuid.isAcceptableOrUnknown(data['table_uuid']!, _tableUuidMeta));
    }
    if (data.containsKey('guest_table_name')) {
      context.handle(
          _guestTableNameMeta,
          guestTableName.isAcceptableOrUnknown(
              data['guest_table_name']!, _guestTableNameMeta));
    }
    if (data.containsKey('server_name')) {
      context.handle(
          _serverNameMeta,
          serverName.isAcceptableOrUnknown(
              data['server_name']!, _serverNameMeta));
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status']!, _statusMeta));
    }
    if (data.containsKey('fired_at')) {
      context.handle(_firedAtMeta,
          firedAt.isAcceptableOrUnknown(data['fired_at']!, _firedAtMeta));
    } else if (isInserting) {
      context.missing(_firedAtMeta);
    }
    if (data.containsKey('started_at')) {
      context.handle(_startedAtMeta,
          startedAt.isAcceptableOrUnknown(data['started_at']!, _startedAtMeta));
    }
    if (data.containsKey('completed_at')) {
      context.handle(
          _completedAtMeta,
          completedAt.isAcceptableOrUnknown(
              data['completed_at']!, _completedAtMeta));
    }
    if (data.containsKey('target_time')) {
      context.handle(
          _targetTimeMeta,
          targetTime.isAcceptableOrUnknown(
              data['target_time']!, _targetTimeMeta));
    }
    if (data.containsKey('note')) {
      context.handle(
          _noteMeta, note.isAcceptableOrUnknown(data['note']!, _noteMeta));
    }
    if (data.containsKey('is_rush')) {
      context.handle(_isRushMeta,
          isRush.isAcceptableOrUnknown(data['is_rush']!, _isRushMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  KitchenTicketTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return KitchenTicketTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      uuid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}uuid'])!,
      orderUuid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}order_uuid'])!,
      orderNumber: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}order_number'])!,
      tableUuid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}table_uuid']),
      guestTableName: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}guest_table_name']),
      serverName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}server_name']),
      status: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}status'])!,
      firedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}fired_at'])!,
      startedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}started_at']),
      completedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}completed_at']),
      targetTime: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}target_time']),
      note: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}note']),
      isRush: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_rush'])!,
    );
  }

  @override
  $KitchenTicketTableTable createAlias(String alias) {
    return $KitchenTicketTableTable(attachedDatabase, alias);
  }
}

class KitchenTicketTableData extends DataClass
    implements Insertable<KitchenTicketTableData> {
  final int id;
  final String uuid;
  final String orderUuid;
  final String orderNumber;
  final String? tableUuid;
  final String? guestTableName;
  final String? serverName;
  final String status;
  final DateTime firedAt;
  final DateTime? startedAt;
  final DateTime? completedAt;
  final DateTime? targetTime;
  final String? note;
  final bool isRush;
  const KitchenTicketTableData(
      {required this.id,
      required this.uuid,
      required this.orderUuid,
      required this.orderNumber,
      this.tableUuid,
      this.guestTableName,
      this.serverName,
      required this.status,
      required this.firedAt,
      this.startedAt,
      this.completedAt,
      this.targetTime,
      this.note,
      required this.isRush});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['uuid'] = Variable<String>(uuid);
    map['order_uuid'] = Variable<String>(orderUuid);
    map['order_number'] = Variable<String>(orderNumber);
    if (!nullToAbsent || tableUuid != null) {
      map['table_uuid'] = Variable<String>(tableUuid);
    }
    if (!nullToAbsent || guestTableName != null) {
      map['guest_table_name'] = Variable<String>(guestTableName);
    }
    if (!nullToAbsent || serverName != null) {
      map['server_name'] = Variable<String>(serverName);
    }
    map['status'] = Variable<String>(status);
    map['fired_at'] = Variable<DateTime>(firedAt);
    if (!nullToAbsent || startedAt != null) {
      map['started_at'] = Variable<DateTime>(startedAt);
    }
    if (!nullToAbsent || completedAt != null) {
      map['completed_at'] = Variable<DateTime>(completedAt);
    }
    if (!nullToAbsent || targetTime != null) {
      map['target_time'] = Variable<DateTime>(targetTime);
    }
    if (!nullToAbsent || note != null) {
      map['note'] = Variable<String>(note);
    }
    map['is_rush'] = Variable<bool>(isRush);
    return map;
  }

  KitchenTicketTableCompanion toCompanion(bool nullToAbsent) {
    return KitchenTicketTableCompanion(
      id: Value(id),
      uuid: Value(uuid),
      orderUuid: Value(orderUuid),
      orderNumber: Value(orderNumber),
      tableUuid: tableUuid == null && nullToAbsent
          ? const Value.absent()
          : Value(tableUuid),
      guestTableName: guestTableName == null && nullToAbsent
          ? const Value.absent()
          : Value(guestTableName),
      serverName: serverName == null && nullToAbsent
          ? const Value.absent()
          : Value(serverName),
      status: Value(status),
      firedAt: Value(firedAt),
      startedAt: startedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(startedAt),
      completedAt: completedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(completedAt),
      targetTime: targetTime == null && nullToAbsent
          ? const Value.absent()
          : Value(targetTime),
      note: note == null && nullToAbsent ? const Value.absent() : Value(note),
      isRush: Value(isRush),
    );
  }

  factory KitchenTicketTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return KitchenTicketTableData(
      id: serializer.fromJson<int>(json['id']),
      uuid: serializer.fromJson<String>(json['uuid']),
      orderUuid: serializer.fromJson<String>(json['orderUuid']),
      orderNumber: serializer.fromJson<String>(json['orderNumber']),
      tableUuid: serializer.fromJson<String?>(json['tableUuid']),
      guestTableName: serializer.fromJson<String?>(json['guestTableName']),
      serverName: serializer.fromJson<String?>(json['serverName']),
      status: serializer.fromJson<String>(json['status']),
      firedAt: serializer.fromJson<DateTime>(json['firedAt']),
      startedAt: serializer.fromJson<DateTime?>(json['startedAt']),
      completedAt: serializer.fromJson<DateTime?>(json['completedAt']),
      targetTime: serializer.fromJson<DateTime?>(json['targetTime']),
      note: serializer.fromJson<String?>(json['note']),
      isRush: serializer.fromJson<bool>(json['isRush']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'uuid': serializer.toJson<String>(uuid),
      'orderUuid': serializer.toJson<String>(orderUuid),
      'orderNumber': serializer.toJson<String>(orderNumber),
      'tableUuid': serializer.toJson<String?>(tableUuid),
      'guestTableName': serializer.toJson<String?>(guestTableName),
      'serverName': serializer.toJson<String?>(serverName),
      'status': serializer.toJson<String>(status),
      'firedAt': serializer.toJson<DateTime>(firedAt),
      'startedAt': serializer.toJson<DateTime?>(startedAt),
      'completedAt': serializer.toJson<DateTime?>(completedAt),
      'targetTime': serializer.toJson<DateTime?>(targetTime),
      'note': serializer.toJson<String?>(note),
      'isRush': serializer.toJson<bool>(isRush),
    };
  }

  KitchenTicketTableData copyWith(
          {int? id,
          String? uuid,
          String? orderUuid,
          String? orderNumber,
          Value<String?> tableUuid = const Value.absent(),
          Value<String?> guestTableName = const Value.absent(),
          Value<String?> serverName = const Value.absent(),
          String? status,
          DateTime? firedAt,
          Value<DateTime?> startedAt = const Value.absent(),
          Value<DateTime?> completedAt = const Value.absent(),
          Value<DateTime?> targetTime = const Value.absent(),
          Value<String?> note = const Value.absent(),
          bool? isRush}) =>
      KitchenTicketTableData(
        id: id ?? this.id,
        uuid: uuid ?? this.uuid,
        orderUuid: orderUuid ?? this.orderUuid,
        orderNumber: orderNumber ?? this.orderNumber,
        tableUuid: tableUuid.present ? tableUuid.value : this.tableUuid,
        guestTableName:
            guestTableName.present ? guestTableName.value : this.guestTableName,
        serverName: serverName.present ? serverName.value : this.serverName,
        status: status ?? this.status,
        firedAt: firedAt ?? this.firedAt,
        startedAt: startedAt.present ? startedAt.value : this.startedAt,
        completedAt: completedAt.present ? completedAt.value : this.completedAt,
        targetTime: targetTime.present ? targetTime.value : this.targetTime,
        note: note.present ? note.value : this.note,
        isRush: isRush ?? this.isRush,
      );
  KitchenTicketTableData copyWithCompanion(KitchenTicketTableCompanion data) {
    return KitchenTicketTableData(
      id: data.id.present ? data.id.value : this.id,
      uuid: data.uuid.present ? data.uuid.value : this.uuid,
      orderUuid: data.orderUuid.present ? data.orderUuid.value : this.orderUuid,
      orderNumber:
          data.orderNumber.present ? data.orderNumber.value : this.orderNumber,
      tableUuid: data.tableUuid.present ? data.tableUuid.value : this.tableUuid,
      guestTableName: data.guestTableName.present
          ? data.guestTableName.value
          : this.guestTableName,
      serverName:
          data.serverName.present ? data.serverName.value : this.serverName,
      status: data.status.present ? data.status.value : this.status,
      firedAt: data.firedAt.present ? data.firedAt.value : this.firedAt,
      startedAt: data.startedAt.present ? data.startedAt.value : this.startedAt,
      completedAt:
          data.completedAt.present ? data.completedAt.value : this.completedAt,
      targetTime:
          data.targetTime.present ? data.targetTime.value : this.targetTime,
      note: data.note.present ? data.note.value : this.note,
      isRush: data.isRush.present ? data.isRush.value : this.isRush,
    );
  }

  @override
  String toString() {
    return (StringBuffer('KitchenTicketTableData(')
          ..write('id: $id, ')
          ..write('uuid: $uuid, ')
          ..write('orderUuid: $orderUuid, ')
          ..write('orderNumber: $orderNumber, ')
          ..write('tableUuid: $tableUuid, ')
          ..write('guestTableName: $guestTableName, ')
          ..write('serverName: $serverName, ')
          ..write('status: $status, ')
          ..write('firedAt: $firedAt, ')
          ..write('startedAt: $startedAt, ')
          ..write('completedAt: $completedAt, ')
          ..write('targetTime: $targetTime, ')
          ..write('note: $note, ')
          ..write('isRush: $isRush')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      uuid,
      orderUuid,
      orderNumber,
      tableUuid,
      guestTableName,
      serverName,
      status,
      firedAt,
      startedAt,
      completedAt,
      targetTime,
      note,
      isRush);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is KitchenTicketTableData &&
          other.id == this.id &&
          other.uuid == this.uuid &&
          other.orderUuid == this.orderUuid &&
          other.orderNumber == this.orderNumber &&
          other.tableUuid == this.tableUuid &&
          other.guestTableName == this.guestTableName &&
          other.serverName == this.serverName &&
          other.status == this.status &&
          other.firedAt == this.firedAt &&
          other.startedAt == this.startedAt &&
          other.completedAt == this.completedAt &&
          other.targetTime == this.targetTime &&
          other.note == this.note &&
          other.isRush == this.isRush);
}

class KitchenTicketTableCompanion
    extends UpdateCompanion<KitchenTicketTableData> {
  final Value<int> id;
  final Value<String> uuid;
  final Value<String> orderUuid;
  final Value<String> orderNumber;
  final Value<String?> tableUuid;
  final Value<String?> guestTableName;
  final Value<String?> serverName;
  final Value<String> status;
  final Value<DateTime> firedAt;
  final Value<DateTime?> startedAt;
  final Value<DateTime?> completedAt;
  final Value<DateTime?> targetTime;
  final Value<String?> note;
  final Value<bool> isRush;
  const KitchenTicketTableCompanion({
    this.id = const Value.absent(),
    this.uuid = const Value.absent(),
    this.orderUuid = const Value.absent(),
    this.orderNumber = const Value.absent(),
    this.tableUuid = const Value.absent(),
    this.guestTableName = const Value.absent(),
    this.serverName = const Value.absent(),
    this.status = const Value.absent(),
    this.firedAt = const Value.absent(),
    this.startedAt = const Value.absent(),
    this.completedAt = const Value.absent(),
    this.targetTime = const Value.absent(),
    this.note = const Value.absent(),
    this.isRush = const Value.absent(),
  });
  KitchenTicketTableCompanion.insert({
    this.id = const Value.absent(),
    required String uuid,
    required String orderUuid,
    required String orderNumber,
    this.tableUuid = const Value.absent(),
    this.guestTableName = const Value.absent(),
    this.serverName = const Value.absent(),
    this.status = const Value.absent(),
    required DateTime firedAt,
    this.startedAt = const Value.absent(),
    this.completedAt = const Value.absent(),
    this.targetTime = const Value.absent(),
    this.note = const Value.absent(),
    this.isRush = const Value.absent(),
  })  : uuid = Value(uuid),
        orderUuid = Value(orderUuid),
        orderNumber = Value(orderNumber),
        firedAt = Value(firedAt);
  static Insertable<KitchenTicketTableData> custom({
    Expression<int>? id,
    Expression<String>? uuid,
    Expression<String>? orderUuid,
    Expression<String>? orderNumber,
    Expression<String>? tableUuid,
    Expression<String>? guestTableName,
    Expression<String>? serverName,
    Expression<String>? status,
    Expression<DateTime>? firedAt,
    Expression<DateTime>? startedAt,
    Expression<DateTime>? completedAt,
    Expression<DateTime>? targetTime,
    Expression<String>? note,
    Expression<bool>? isRush,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (uuid != null) 'uuid': uuid,
      if (orderUuid != null) 'order_uuid': orderUuid,
      if (orderNumber != null) 'order_number': orderNumber,
      if (tableUuid != null) 'table_uuid': tableUuid,
      if (guestTableName != null) 'guest_table_name': guestTableName,
      if (serverName != null) 'server_name': serverName,
      if (status != null) 'status': status,
      if (firedAt != null) 'fired_at': firedAt,
      if (startedAt != null) 'started_at': startedAt,
      if (completedAt != null) 'completed_at': completedAt,
      if (targetTime != null) 'target_time': targetTime,
      if (note != null) 'note': note,
      if (isRush != null) 'is_rush': isRush,
    });
  }

  KitchenTicketTableCompanion copyWith(
      {Value<int>? id,
      Value<String>? uuid,
      Value<String>? orderUuid,
      Value<String>? orderNumber,
      Value<String?>? tableUuid,
      Value<String?>? guestTableName,
      Value<String?>? serverName,
      Value<String>? status,
      Value<DateTime>? firedAt,
      Value<DateTime?>? startedAt,
      Value<DateTime?>? completedAt,
      Value<DateTime?>? targetTime,
      Value<String?>? note,
      Value<bool>? isRush}) {
    return KitchenTicketTableCompanion(
      id: id ?? this.id,
      uuid: uuid ?? this.uuid,
      orderUuid: orderUuid ?? this.orderUuid,
      orderNumber: orderNumber ?? this.orderNumber,
      tableUuid: tableUuid ?? this.tableUuid,
      guestTableName: guestTableName ?? this.guestTableName,
      serverName: serverName ?? this.serverName,
      status: status ?? this.status,
      firedAt: firedAt ?? this.firedAt,
      startedAt: startedAt ?? this.startedAt,
      completedAt: completedAt ?? this.completedAt,
      targetTime: targetTime ?? this.targetTime,
      note: note ?? this.note,
      isRush: isRush ?? this.isRush,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (uuid.present) {
      map['uuid'] = Variable<String>(uuid.value);
    }
    if (orderUuid.present) {
      map['order_uuid'] = Variable<String>(orderUuid.value);
    }
    if (orderNumber.present) {
      map['order_number'] = Variable<String>(orderNumber.value);
    }
    if (tableUuid.present) {
      map['table_uuid'] = Variable<String>(tableUuid.value);
    }
    if (guestTableName.present) {
      map['guest_table_name'] = Variable<String>(guestTableName.value);
    }
    if (serverName.present) {
      map['server_name'] = Variable<String>(serverName.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (firedAt.present) {
      map['fired_at'] = Variable<DateTime>(firedAt.value);
    }
    if (startedAt.present) {
      map['started_at'] = Variable<DateTime>(startedAt.value);
    }
    if (completedAt.present) {
      map['completed_at'] = Variable<DateTime>(completedAt.value);
    }
    if (targetTime.present) {
      map['target_time'] = Variable<DateTime>(targetTime.value);
    }
    if (note.present) {
      map['note'] = Variable<String>(note.value);
    }
    if (isRush.present) {
      map['is_rush'] = Variable<bool>(isRush.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('KitchenTicketTableCompanion(')
          ..write('id: $id, ')
          ..write('uuid: $uuid, ')
          ..write('orderUuid: $orderUuid, ')
          ..write('orderNumber: $orderNumber, ')
          ..write('tableUuid: $tableUuid, ')
          ..write('guestTableName: $guestTableName, ')
          ..write('serverName: $serverName, ')
          ..write('status: $status, ')
          ..write('firedAt: $firedAt, ')
          ..write('startedAt: $startedAt, ')
          ..write('completedAt: $completedAt, ')
          ..write('targetTime: $targetTime, ')
          ..write('note: $note, ')
          ..write('isRush: $isRush')
          ..write(')'))
        .toString();
  }
}

class $OrderTableTable extends OrderTable
    with TableInfo<$OrderTableTable, OrderTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $OrderTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _uuidMeta = const VerificationMeta('uuid');
  @override
  late final GeneratedColumn<String> uuid = GeneratedColumn<String>(
      'uuid', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'));
  static const VerificationMeta _orderNumberMeta =
      const VerificationMeta('orderNumber');
  @override
  late final GeneratedColumn<String> orderNumber = GeneratedColumn<String>(
      'order_number', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _shiftUuidMeta =
      const VerificationMeta('shiftUuid');
  @override
  late final GeneratedColumn<String> shiftUuid = GeneratedColumn<String>(
      'shift_uuid', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _customerUuidMeta =
      const VerificationMeta('customerUuid');
  @override
  late final GeneratedColumn<String> customerUuid = GeneratedColumn<String>(
      'customer_uuid', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _tenantIdMeta =
      const VerificationMeta('tenantId');
  @override
  late final GeneratedColumn<String> tenantId = GeneratedColumn<String>(
      'tenant_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _outletIdMeta =
      const VerificationMeta('outletId');
  @override
  late final GeneratedColumn<String> outletId = GeneratedColumn<String>(
      'outlet_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
      'status', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('COMPLETED'));
  static const VerificationMeta _paymentStatusMeta =
      const VerificationMeta('paymentStatus');
  @override
  late final GeneratedColumn<String> paymentStatus = GeneratedColumn<String>(
      'payment_status', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('PAID'));
  static const VerificationMeta _transactionDateMeta =
      const VerificationMeta('transactionDate');
  @override
  late final GeneratedColumn<DateTime> transactionDate =
      GeneratedColumn<DateTime>('transaction_date', aliasedName, false,
          type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _subtotalMeta =
      const VerificationMeta('subtotal');
  @override
  late final GeneratedColumn<double> subtotal = GeneratedColumn<double>(
      'subtotal', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _discountTotalMeta =
      const VerificationMeta('discountTotal');
  @override
  late final GeneratedColumn<double> discountTotal = GeneratedColumn<double>(
      'discount_total', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _taxTotalMeta =
      const VerificationMeta('taxTotal');
  @override
  late final GeneratedColumn<double> taxTotal = GeneratedColumn<double>(
      'tax_total', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _grandTotalMeta =
      const VerificationMeta('grandTotal');
  @override
  late final GeneratedColumn<double> grandTotal = GeneratedColumn<double>(
      'grand_total', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _paymentMethodMeta =
      const VerificationMeta('paymentMethod');
  @override
  late final GeneratedColumn<String> paymentMethod = GeneratedColumn<String>(
      'payment_method', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _tenderedAmountMeta =
      const VerificationMeta('tenderedAmount');
  @override
  late final GeneratedColumn<double> tenderedAmount = GeneratedColumn<double>(
      'tendered_amount', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _changeAmountMeta =
      const VerificationMeta('changeAmount');
  @override
  late final GeneratedColumn<double> changeAmount = GeneratedColumn<double>(
      'change_amount', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _isSyncedMeta =
      const VerificationMeta('isSynced');
  @override
  late final GeneratedColumn<bool> isSynced = GeneratedColumn<bool>(
      'is_synced', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_synced" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _versionMeta =
      const VerificationMeta('version');
  @override
  late final GeneratedColumn<int> version = GeneratedColumn<int>(
      'version', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(1));
  static const VerificationMeta _syncAttemptsMeta =
      const VerificationMeta('syncAttempts');
  @override
  late final GeneratedColumn<int> syncAttempts = GeneratedColumn<int>(
      'sync_attempts', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _isFulfilledMeta =
      const VerificationMeta('isFulfilled');
  @override
  late final GeneratedColumn<bool> isFulfilled = GeneratedColumn<bool>(
      'is_fulfilled', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("is_fulfilled" IN (0, 1))'),
      defaultValue: const Constant(false));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        uuid,
        orderNumber,
        shiftUuid,
        customerUuid,
        tenantId,
        outletId,
        status,
        paymentStatus,
        transactionDate,
        subtotal,
        discountTotal,
        taxTotal,
        grandTotal,
        paymentMethod,
        tenderedAmount,
        changeAmount,
        updatedAt,
        isSynced,
        version,
        syncAttempts,
        isFulfilled
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'order_table';
  @override
  VerificationContext validateIntegrity(Insertable<OrderTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('uuid')) {
      context.handle(
          _uuidMeta, uuid.isAcceptableOrUnknown(data['uuid']!, _uuidMeta));
    } else if (isInserting) {
      context.missing(_uuidMeta);
    }
    if (data.containsKey('order_number')) {
      context.handle(
          _orderNumberMeta,
          orderNumber.isAcceptableOrUnknown(
              data['order_number']!, _orderNumberMeta));
    } else if (isInserting) {
      context.missing(_orderNumberMeta);
    }
    if (data.containsKey('shift_uuid')) {
      context.handle(_shiftUuidMeta,
          shiftUuid.isAcceptableOrUnknown(data['shift_uuid']!, _shiftUuidMeta));
    }
    if (data.containsKey('customer_uuid')) {
      context.handle(
          _customerUuidMeta,
          customerUuid.isAcceptableOrUnknown(
              data['customer_uuid']!, _customerUuidMeta));
    }
    if (data.containsKey('tenant_id')) {
      context.handle(_tenantIdMeta,
          tenantId.isAcceptableOrUnknown(data['tenant_id']!, _tenantIdMeta));
    }
    if (data.containsKey('outlet_id')) {
      context.handle(_outletIdMeta,
          outletId.isAcceptableOrUnknown(data['outlet_id']!, _outletIdMeta));
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status']!, _statusMeta));
    }
    if (data.containsKey('payment_status')) {
      context.handle(
          _paymentStatusMeta,
          paymentStatus.isAcceptableOrUnknown(
              data['payment_status']!, _paymentStatusMeta));
    }
    if (data.containsKey('transaction_date')) {
      context.handle(
          _transactionDateMeta,
          transactionDate.isAcceptableOrUnknown(
              data['transaction_date']!, _transactionDateMeta));
    } else if (isInserting) {
      context.missing(_transactionDateMeta);
    }
    if (data.containsKey('subtotal')) {
      context.handle(_subtotalMeta,
          subtotal.isAcceptableOrUnknown(data['subtotal']!, _subtotalMeta));
    } else if (isInserting) {
      context.missing(_subtotalMeta);
    }
    if (data.containsKey('discount_total')) {
      context.handle(
          _discountTotalMeta,
          discountTotal.isAcceptableOrUnknown(
              data['discount_total']!, _discountTotalMeta));
    } else if (isInserting) {
      context.missing(_discountTotalMeta);
    }
    if (data.containsKey('tax_total')) {
      context.handle(_taxTotalMeta,
          taxTotal.isAcceptableOrUnknown(data['tax_total']!, _taxTotalMeta));
    } else if (isInserting) {
      context.missing(_taxTotalMeta);
    }
    if (data.containsKey('grand_total')) {
      context.handle(
          _grandTotalMeta,
          grandTotal.isAcceptableOrUnknown(
              data['grand_total']!, _grandTotalMeta));
    } else if (isInserting) {
      context.missing(_grandTotalMeta);
    }
    if (data.containsKey('payment_method')) {
      context.handle(
          _paymentMethodMeta,
          paymentMethod.isAcceptableOrUnknown(
              data['payment_method']!, _paymentMethodMeta));
    }
    if (data.containsKey('tendered_amount')) {
      context.handle(
          _tenderedAmountMeta,
          tenderedAmount.isAcceptableOrUnknown(
              data['tendered_amount']!, _tenderedAmountMeta));
    }
    if (data.containsKey('change_amount')) {
      context.handle(
          _changeAmountMeta,
          changeAmount.isAcceptableOrUnknown(
              data['change_amount']!, _changeAmountMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    if (data.containsKey('is_synced')) {
      context.handle(_isSyncedMeta,
          isSynced.isAcceptableOrUnknown(data['is_synced']!, _isSyncedMeta));
    }
    if (data.containsKey('version')) {
      context.handle(_versionMeta,
          version.isAcceptableOrUnknown(data['version']!, _versionMeta));
    }
    if (data.containsKey('sync_attempts')) {
      context.handle(
          _syncAttemptsMeta,
          syncAttempts.isAcceptableOrUnknown(
              data['sync_attempts']!, _syncAttemptsMeta));
    }
    if (data.containsKey('is_fulfilled')) {
      context.handle(
          _isFulfilledMeta,
          isFulfilled.isAcceptableOrUnknown(
              data['is_fulfilled']!, _isFulfilledMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  OrderTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return OrderTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      uuid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}uuid'])!,
      orderNumber: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}order_number'])!,
      shiftUuid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}shift_uuid']),
      customerUuid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}customer_uuid']),
      tenantId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}tenant_id']),
      outletId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}outlet_id']),
      status: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}status'])!,
      paymentStatus: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}payment_status'])!,
      transactionDate: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}transaction_date'])!,
      subtotal: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}subtotal'])!,
      discountTotal: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}discount_total'])!,
      taxTotal: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}tax_total'])!,
      grandTotal: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}grand_total'])!,
      paymentMethod: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}payment_method']),
      tenderedAmount: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}tendered_amount']),
      changeAmount: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}change_amount']),
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
      isSynced: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_synced'])!,
      version: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}version'])!,
      syncAttempts: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}sync_attempts'])!,
      isFulfilled: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_fulfilled'])!,
    );
  }

  @override
  $OrderTableTable createAlias(String alias) {
    return $OrderTableTable(attachedDatabase, alias);
  }
}

class OrderTableData extends DataClass implements Insertable<OrderTableData> {
  final int id;
  final String uuid;
  final String orderNumber;
  final String? shiftUuid;
  final String? customerUuid;
  final String? tenantId;
  final String? outletId;
  final String status;
  final String paymentStatus;
  final DateTime transactionDate;
  final double subtotal;
  final double discountTotal;
  final double taxTotal;
  final double grandTotal;
  final String? paymentMethod;
  final double? tenderedAmount;
  final double? changeAmount;
  final DateTime updatedAt;
  final bool isSynced;
  final int version;
  final int syncAttempts;
  final bool isFulfilled;
  const OrderTableData(
      {required this.id,
      required this.uuid,
      required this.orderNumber,
      this.shiftUuid,
      this.customerUuid,
      this.tenantId,
      this.outletId,
      required this.status,
      required this.paymentStatus,
      required this.transactionDate,
      required this.subtotal,
      required this.discountTotal,
      required this.taxTotal,
      required this.grandTotal,
      this.paymentMethod,
      this.tenderedAmount,
      this.changeAmount,
      required this.updatedAt,
      required this.isSynced,
      required this.version,
      required this.syncAttempts,
      required this.isFulfilled});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['uuid'] = Variable<String>(uuid);
    map['order_number'] = Variable<String>(orderNumber);
    if (!nullToAbsent || shiftUuid != null) {
      map['shift_uuid'] = Variable<String>(shiftUuid);
    }
    if (!nullToAbsent || customerUuid != null) {
      map['customer_uuid'] = Variable<String>(customerUuid);
    }
    if (!nullToAbsent || tenantId != null) {
      map['tenant_id'] = Variable<String>(tenantId);
    }
    if (!nullToAbsent || outletId != null) {
      map['outlet_id'] = Variable<String>(outletId);
    }
    map['status'] = Variable<String>(status);
    map['payment_status'] = Variable<String>(paymentStatus);
    map['transaction_date'] = Variable<DateTime>(transactionDate);
    map['subtotal'] = Variable<double>(subtotal);
    map['discount_total'] = Variable<double>(discountTotal);
    map['tax_total'] = Variable<double>(taxTotal);
    map['grand_total'] = Variable<double>(grandTotal);
    if (!nullToAbsent || paymentMethod != null) {
      map['payment_method'] = Variable<String>(paymentMethod);
    }
    if (!nullToAbsent || tenderedAmount != null) {
      map['tendered_amount'] = Variable<double>(tenderedAmount);
    }
    if (!nullToAbsent || changeAmount != null) {
      map['change_amount'] = Variable<double>(changeAmount);
    }
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['is_synced'] = Variable<bool>(isSynced);
    map['version'] = Variable<int>(version);
    map['sync_attempts'] = Variable<int>(syncAttempts);
    map['is_fulfilled'] = Variable<bool>(isFulfilled);
    return map;
  }

  OrderTableCompanion toCompanion(bool nullToAbsent) {
    return OrderTableCompanion(
      id: Value(id),
      uuid: Value(uuid),
      orderNumber: Value(orderNumber),
      shiftUuid: shiftUuid == null && nullToAbsent
          ? const Value.absent()
          : Value(shiftUuid),
      customerUuid: customerUuid == null && nullToAbsent
          ? const Value.absent()
          : Value(customerUuid),
      tenantId: tenantId == null && nullToAbsent
          ? const Value.absent()
          : Value(tenantId),
      outletId: outletId == null && nullToAbsent
          ? const Value.absent()
          : Value(outletId),
      status: Value(status),
      paymentStatus: Value(paymentStatus),
      transactionDate: Value(transactionDate),
      subtotal: Value(subtotal),
      discountTotal: Value(discountTotal),
      taxTotal: Value(taxTotal),
      grandTotal: Value(grandTotal),
      paymentMethod: paymentMethod == null && nullToAbsent
          ? const Value.absent()
          : Value(paymentMethod),
      tenderedAmount: tenderedAmount == null && nullToAbsent
          ? const Value.absent()
          : Value(tenderedAmount),
      changeAmount: changeAmount == null && nullToAbsent
          ? const Value.absent()
          : Value(changeAmount),
      updatedAt: Value(updatedAt),
      isSynced: Value(isSynced),
      version: Value(version),
      syncAttempts: Value(syncAttempts),
      isFulfilled: Value(isFulfilled),
    );
  }

  factory OrderTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return OrderTableData(
      id: serializer.fromJson<int>(json['id']),
      uuid: serializer.fromJson<String>(json['uuid']),
      orderNumber: serializer.fromJson<String>(json['orderNumber']),
      shiftUuid: serializer.fromJson<String?>(json['shiftUuid']),
      customerUuid: serializer.fromJson<String?>(json['customerUuid']),
      tenantId: serializer.fromJson<String?>(json['tenantId']),
      outletId: serializer.fromJson<String?>(json['outletId']),
      status: serializer.fromJson<String>(json['status']),
      paymentStatus: serializer.fromJson<String>(json['paymentStatus']),
      transactionDate: serializer.fromJson<DateTime>(json['transactionDate']),
      subtotal: serializer.fromJson<double>(json['subtotal']),
      discountTotal: serializer.fromJson<double>(json['discountTotal']),
      taxTotal: serializer.fromJson<double>(json['taxTotal']),
      grandTotal: serializer.fromJson<double>(json['grandTotal']),
      paymentMethod: serializer.fromJson<String?>(json['paymentMethod']),
      tenderedAmount: serializer.fromJson<double?>(json['tenderedAmount']),
      changeAmount: serializer.fromJson<double?>(json['changeAmount']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      isSynced: serializer.fromJson<bool>(json['isSynced']),
      version: serializer.fromJson<int>(json['version']),
      syncAttempts: serializer.fromJson<int>(json['syncAttempts']),
      isFulfilled: serializer.fromJson<bool>(json['isFulfilled']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'uuid': serializer.toJson<String>(uuid),
      'orderNumber': serializer.toJson<String>(orderNumber),
      'shiftUuid': serializer.toJson<String?>(shiftUuid),
      'customerUuid': serializer.toJson<String?>(customerUuid),
      'tenantId': serializer.toJson<String?>(tenantId),
      'outletId': serializer.toJson<String?>(outletId),
      'status': serializer.toJson<String>(status),
      'paymentStatus': serializer.toJson<String>(paymentStatus),
      'transactionDate': serializer.toJson<DateTime>(transactionDate),
      'subtotal': serializer.toJson<double>(subtotal),
      'discountTotal': serializer.toJson<double>(discountTotal),
      'taxTotal': serializer.toJson<double>(taxTotal),
      'grandTotal': serializer.toJson<double>(grandTotal),
      'paymentMethod': serializer.toJson<String?>(paymentMethod),
      'tenderedAmount': serializer.toJson<double?>(tenderedAmount),
      'changeAmount': serializer.toJson<double?>(changeAmount),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'isSynced': serializer.toJson<bool>(isSynced),
      'version': serializer.toJson<int>(version),
      'syncAttempts': serializer.toJson<int>(syncAttempts),
      'isFulfilled': serializer.toJson<bool>(isFulfilled),
    };
  }

  OrderTableData copyWith(
          {int? id,
          String? uuid,
          String? orderNumber,
          Value<String?> shiftUuid = const Value.absent(),
          Value<String?> customerUuid = const Value.absent(),
          Value<String?> tenantId = const Value.absent(),
          Value<String?> outletId = const Value.absent(),
          String? status,
          String? paymentStatus,
          DateTime? transactionDate,
          double? subtotal,
          double? discountTotal,
          double? taxTotal,
          double? grandTotal,
          Value<String?> paymentMethod = const Value.absent(),
          Value<double?> tenderedAmount = const Value.absent(),
          Value<double?> changeAmount = const Value.absent(),
          DateTime? updatedAt,
          bool? isSynced,
          int? version,
          int? syncAttempts,
          bool? isFulfilled}) =>
      OrderTableData(
        id: id ?? this.id,
        uuid: uuid ?? this.uuid,
        orderNumber: orderNumber ?? this.orderNumber,
        shiftUuid: shiftUuid.present ? shiftUuid.value : this.shiftUuid,
        customerUuid:
            customerUuid.present ? customerUuid.value : this.customerUuid,
        tenantId: tenantId.present ? tenantId.value : this.tenantId,
        outletId: outletId.present ? outletId.value : this.outletId,
        status: status ?? this.status,
        paymentStatus: paymentStatus ?? this.paymentStatus,
        transactionDate: transactionDate ?? this.transactionDate,
        subtotal: subtotal ?? this.subtotal,
        discountTotal: discountTotal ?? this.discountTotal,
        taxTotal: taxTotal ?? this.taxTotal,
        grandTotal: grandTotal ?? this.grandTotal,
        paymentMethod:
            paymentMethod.present ? paymentMethod.value : this.paymentMethod,
        tenderedAmount:
            tenderedAmount.present ? tenderedAmount.value : this.tenderedAmount,
        changeAmount:
            changeAmount.present ? changeAmount.value : this.changeAmount,
        updatedAt: updatedAt ?? this.updatedAt,
        isSynced: isSynced ?? this.isSynced,
        version: version ?? this.version,
        syncAttempts: syncAttempts ?? this.syncAttempts,
        isFulfilled: isFulfilled ?? this.isFulfilled,
      );
  OrderTableData copyWithCompanion(OrderTableCompanion data) {
    return OrderTableData(
      id: data.id.present ? data.id.value : this.id,
      uuid: data.uuid.present ? data.uuid.value : this.uuid,
      orderNumber:
          data.orderNumber.present ? data.orderNumber.value : this.orderNumber,
      shiftUuid: data.shiftUuid.present ? data.shiftUuid.value : this.shiftUuid,
      customerUuid: data.customerUuid.present
          ? data.customerUuid.value
          : this.customerUuid,
      tenantId: data.tenantId.present ? data.tenantId.value : this.tenantId,
      outletId: data.outletId.present ? data.outletId.value : this.outletId,
      status: data.status.present ? data.status.value : this.status,
      paymentStatus: data.paymentStatus.present
          ? data.paymentStatus.value
          : this.paymentStatus,
      transactionDate: data.transactionDate.present
          ? data.transactionDate.value
          : this.transactionDate,
      subtotal: data.subtotal.present ? data.subtotal.value : this.subtotal,
      discountTotal: data.discountTotal.present
          ? data.discountTotal.value
          : this.discountTotal,
      taxTotal: data.taxTotal.present ? data.taxTotal.value : this.taxTotal,
      grandTotal:
          data.grandTotal.present ? data.grandTotal.value : this.grandTotal,
      paymentMethod: data.paymentMethod.present
          ? data.paymentMethod.value
          : this.paymentMethod,
      tenderedAmount: data.tenderedAmount.present
          ? data.tenderedAmount.value
          : this.tenderedAmount,
      changeAmount: data.changeAmount.present
          ? data.changeAmount.value
          : this.changeAmount,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      isSynced: data.isSynced.present ? data.isSynced.value : this.isSynced,
      version: data.version.present ? data.version.value : this.version,
      syncAttempts: data.syncAttempts.present
          ? data.syncAttempts.value
          : this.syncAttempts,
      isFulfilled:
          data.isFulfilled.present ? data.isFulfilled.value : this.isFulfilled,
    );
  }

  @override
  String toString() {
    return (StringBuffer('OrderTableData(')
          ..write('id: $id, ')
          ..write('uuid: $uuid, ')
          ..write('orderNumber: $orderNumber, ')
          ..write('shiftUuid: $shiftUuid, ')
          ..write('customerUuid: $customerUuid, ')
          ..write('tenantId: $tenantId, ')
          ..write('outletId: $outletId, ')
          ..write('status: $status, ')
          ..write('paymentStatus: $paymentStatus, ')
          ..write('transactionDate: $transactionDate, ')
          ..write('subtotal: $subtotal, ')
          ..write('discountTotal: $discountTotal, ')
          ..write('taxTotal: $taxTotal, ')
          ..write('grandTotal: $grandTotal, ')
          ..write('paymentMethod: $paymentMethod, ')
          ..write('tenderedAmount: $tenderedAmount, ')
          ..write('changeAmount: $changeAmount, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('isSynced: $isSynced, ')
          ..write('version: $version, ')
          ..write('syncAttempts: $syncAttempts, ')
          ..write('isFulfilled: $isFulfilled')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([
        id,
        uuid,
        orderNumber,
        shiftUuid,
        customerUuid,
        tenantId,
        outletId,
        status,
        paymentStatus,
        transactionDate,
        subtotal,
        discountTotal,
        taxTotal,
        grandTotal,
        paymentMethod,
        tenderedAmount,
        changeAmount,
        updatedAt,
        isSynced,
        version,
        syncAttempts,
        isFulfilled
      ]);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is OrderTableData &&
          other.id == this.id &&
          other.uuid == this.uuid &&
          other.orderNumber == this.orderNumber &&
          other.shiftUuid == this.shiftUuid &&
          other.customerUuid == this.customerUuid &&
          other.tenantId == this.tenantId &&
          other.outletId == this.outletId &&
          other.status == this.status &&
          other.paymentStatus == this.paymentStatus &&
          other.transactionDate == this.transactionDate &&
          other.subtotal == this.subtotal &&
          other.discountTotal == this.discountTotal &&
          other.taxTotal == this.taxTotal &&
          other.grandTotal == this.grandTotal &&
          other.paymentMethod == this.paymentMethod &&
          other.tenderedAmount == this.tenderedAmount &&
          other.changeAmount == this.changeAmount &&
          other.updatedAt == this.updatedAt &&
          other.isSynced == this.isSynced &&
          other.version == this.version &&
          other.syncAttempts == this.syncAttempts &&
          other.isFulfilled == this.isFulfilled);
}

class OrderTableCompanion extends UpdateCompanion<OrderTableData> {
  final Value<int> id;
  final Value<String> uuid;
  final Value<String> orderNumber;
  final Value<String?> shiftUuid;
  final Value<String?> customerUuid;
  final Value<String?> tenantId;
  final Value<String?> outletId;
  final Value<String> status;
  final Value<String> paymentStatus;
  final Value<DateTime> transactionDate;
  final Value<double> subtotal;
  final Value<double> discountTotal;
  final Value<double> taxTotal;
  final Value<double> grandTotal;
  final Value<String?> paymentMethod;
  final Value<double?> tenderedAmount;
  final Value<double?> changeAmount;
  final Value<DateTime> updatedAt;
  final Value<bool> isSynced;
  final Value<int> version;
  final Value<int> syncAttempts;
  final Value<bool> isFulfilled;
  const OrderTableCompanion({
    this.id = const Value.absent(),
    this.uuid = const Value.absent(),
    this.orderNumber = const Value.absent(),
    this.shiftUuid = const Value.absent(),
    this.customerUuid = const Value.absent(),
    this.tenantId = const Value.absent(),
    this.outletId = const Value.absent(),
    this.status = const Value.absent(),
    this.paymentStatus = const Value.absent(),
    this.transactionDate = const Value.absent(),
    this.subtotal = const Value.absent(),
    this.discountTotal = const Value.absent(),
    this.taxTotal = const Value.absent(),
    this.grandTotal = const Value.absent(),
    this.paymentMethod = const Value.absent(),
    this.tenderedAmount = const Value.absent(),
    this.changeAmount = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.isSynced = const Value.absent(),
    this.version = const Value.absent(),
    this.syncAttempts = const Value.absent(),
    this.isFulfilled = const Value.absent(),
  });
  OrderTableCompanion.insert({
    this.id = const Value.absent(),
    required String uuid,
    required String orderNumber,
    this.shiftUuid = const Value.absent(),
    this.customerUuid = const Value.absent(),
    this.tenantId = const Value.absent(),
    this.outletId = const Value.absent(),
    this.status = const Value.absent(),
    this.paymentStatus = const Value.absent(),
    required DateTime transactionDate,
    required double subtotal,
    required double discountTotal,
    required double taxTotal,
    required double grandTotal,
    this.paymentMethod = const Value.absent(),
    this.tenderedAmount = const Value.absent(),
    this.changeAmount = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.isSynced = const Value.absent(),
    this.version = const Value.absent(),
    this.syncAttempts = const Value.absent(),
    this.isFulfilled = const Value.absent(),
  })  : uuid = Value(uuid),
        orderNumber = Value(orderNumber),
        transactionDate = Value(transactionDate),
        subtotal = Value(subtotal),
        discountTotal = Value(discountTotal),
        taxTotal = Value(taxTotal),
        grandTotal = Value(grandTotal);
  static Insertable<OrderTableData> custom({
    Expression<int>? id,
    Expression<String>? uuid,
    Expression<String>? orderNumber,
    Expression<String>? shiftUuid,
    Expression<String>? customerUuid,
    Expression<String>? tenantId,
    Expression<String>? outletId,
    Expression<String>? status,
    Expression<String>? paymentStatus,
    Expression<DateTime>? transactionDate,
    Expression<double>? subtotal,
    Expression<double>? discountTotal,
    Expression<double>? taxTotal,
    Expression<double>? grandTotal,
    Expression<String>? paymentMethod,
    Expression<double>? tenderedAmount,
    Expression<double>? changeAmount,
    Expression<DateTime>? updatedAt,
    Expression<bool>? isSynced,
    Expression<int>? version,
    Expression<int>? syncAttempts,
    Expression<bool>? isFulfilled,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (uuid != null) 'uuid': uuid,
      if (orderNumber != null) 'order_number': orderNumber,
      if (shiftUuid != null) 'shift_uuid': shiftUuid,
      if (customerUuid != null) 'customer_uuid': customerUuid,
      if (tenantId != null) 'tenant_id': tenantId,
      if (outletId != null) 'outlet_id': outletId,
      if (status != null) 'status': status,
      if (paymentStatus != null) 'payment_status': paymentStatus,
      if (transactionDate != null) 'transaction_date': transactionDate,
      if (subtotal != null) 'subtotal': subtotal,
      if (discountTotal != null) 'discount_total': discountTotal,
      if (taxTotal != null) 'tax_total': taxTotal,
      if (grandTotal != null) 'grand_total': grandTotal,
      if (paymentMethod != null) 'payment_method': paymentMethod,
      if (tenderedAmount != null) 'tendered_amount': tenderedAmount,
      if (changeAmount != null) 'change_amount': changeAmount,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (isSynced != null) 'is_synced': isSynced,
      if (version != null) 'version': version,
      if (syncAttempts != null) 'sync_attempts': syncAttempts,
      if (isFulfilled != null) 'is_fulfilled': isFulfilled,
    });
  }

  OrderTableCompanion copyWith(
      {Value<int>? id,
      Value<String>? uuid,
      Value<String>? orderNumber,
      Value<String?>? shiftUuid,
      Value<String?>? customerUuid,
      Value<String?>? tenantId,
      Value<String?>? outletId,
      Value<String>? status,
      Value<String>? paymentStatus,
      Value<DateTime>? transactionDate,
      Value<double>? subtotal,
      Value<double>? discountTotal,
      Value<double>? taxTotal,
      Value<double>? grandTotal,
      Value<String?>? paymentMethod,
      Value<double?>? tenderedAmount,
      Value<double?>? changeAmount,
      Value<DateTime>? updatedAt,
      Value<bool>? isSynced,
      Value<int>? version,
      Value<int>? syncAttempts,
      Value<bool>? isFulfilled}) {
    return OrderTableCompanion(
      id: id ?? this.id,
      uuid: uuid ?? this.uuid,
      orderNumber: orderNumber ?? this.orderNumber,
      shiftUuid: shiftUuid ?? this.shiftUuid,
      customerUuid: customerUuid ?? this.customerUuid,
      tenantId: tenantId ?? this.tenantId,
      outletId: outletId ?? this.outletId,
      status: status ?? this.status,
      paymentStatus: paymentStatus ?? this.paymentStatus,
      transactionDate: transactionDate ?? this.transactionDate,
      subtotal: subtotal ?? this.subtotal,
      discountTotal: discountTotal ?? this.discountTotal,
      taxTotal: taxTotal ?? this.taxTotal,
      grandTotal: grandTotal ?? this.grandTotal,
      paymentMethod: paymentMethod ?? this.paymentMethod,
      tenderedAmount: tenderedAmount ?? this.tenderedAmount,
      changeAmount: changeAmount ?? this.changeAmount,
      updatedAt: updatedAt ?? this.updatedAt,
      isSynced: isSynced ?? this.isSynced,
      version: version ?? this.version,
      syncAttempts: syncAttempts ?? this.syncAttempts,
      isFulfilled: isFulfilled ?? this.isFulfilled,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (uuid.present) {
      map['uuid'] = Variable<String>(uuid.value);
    }
    if (orderNumber.present) {
      map['order_number'] = Variable<String>(orderNumber.value);
    }
    if (shiftUuid.present) {
      map['shift_uuid'] = Variable<String>(shiftUuid.value);
    }
    if (customerUuid.present) {
      map['customer_uuid'] = Variable<String>(customerUuid.value);
    }
    if (tenantId.present) {
      map['tenant_id'] = Variable<String>(tenantId.value);
    }
    if (outletId.present) {
      map['outlet_id'] = Variable<String>(outletId.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (paymentStatus.present) {
      map['payment_status'] = Variable<String>(paymentStatus.value);
    }
    if (transactionDate.present) {
      map['transaction_date'] = Variable<DateTime>(transactionDate.value);
    }
    if (subtotal.present) {
      map['subtotal'] = Variable<double>(subtotal.value);
    }
    if (discountTotal.present) {
      map['discount_total'] = Variable<double>(discountTotal.value);
    }
    if (taxTotal.present) {
      map['tax_total'] = Variable<double>(taxTotal.value);
    }
    if (grandTotal.present) {
      map['grand_total'] = Variable<double>(grandTotal.value);
    }
    if (paymentMethod.present) {
      map['payment_method'] = Variable<String>(paymentMethod.value);
    }
    if (tenderedAmount.present) {
      map['tendered_amount'] = Variable<double>(tenderedAmount.value);
    }
    if (changeAmount.present) {
      map['change_amount'] = Variable<double>(changeAmount.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (isSynced.present) {
      map['is_synced'] = Variable<bool>(isSynced.value);
    }
    if (version.present) {
      map['version'] = Variable<int>(version.value);
    }
    if (syncAttempts.present) {
      map['sync_attempts'] = Variable<int>(syncAttempts.value);
    }
    if (isFulfilled.present) {
      map['is_fulfilled'] = Variable<bool>(isFulfilled.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('OrderTableCompanion(')
          ..write('id: $id, ')
          ..write('uuid: $uuid, ')
          ..write('orderNumber: $orderNumber, ')
          ..write('shiftUuid: $shiftUuid, ')
          ..write('customerUuid: $customerUuid, ')
          ..write('tenantId: $tenantId, ')
          ..write('outletId: $outletId, ')
          ..write('status: $status, ')
          ..write('paymentStatus: $paymentStatus, ')
          ..write('transactionDate: $transactionDate, ')
          ..write('subtotal: $subtotal, ')
          ..write('discountTotal: $discountTotal, ')
          ..write('taxTotal: $taxTotal, ')
          ..write('grandTotal: $grandTotal, ')
          ..write('paymentMethod: $paymentMethod, ')
          ..write('tenderedAmount: $tenderedAmount, ')
          ..write('changeAmount: $changeAmount, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('isSynced: $isSynced, ')
          ..write('version: $version, ')
          ..write('syncAttempts: $syncAttempts, ')
          ..write('isFulfilled: $isFulfilled')
          ..write(')'))
        .toString();
  }
}

class $CustomerTableTable extends CustomerTable
    with TableInfo<$CustomerTableTable, CustomerTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CustomerTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _uuidMeta = const VerificationMeta('uuid');
  @override
  late final GeneratedColumn<String> uuid = GeneratedColumn<String>(
      'uuid', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _phoneMeta = const VerificationMeta('phone');
  @override
  late final GeneratedColumn<String> phone = GeneratedColumn<String>(
      'phone', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
      'email', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _totalPointsMeta =
      const VerificationMeta('totalPoints');
  @override
  late final GeneratedColumn<double> totalPoints = GeneratedColumn<double>(
      'total_points', aliasedName, false,
      type: DriftSqlType.double,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _lastVisitAtMeta =
      const VerificationMeta('lastVisitAt');
  @override
  late final GeneratedColumn<DateTime> lastVisitAt = GeneratedColumn<DateTime>(
      'last_visit_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _isSyncedMeta =
      const VerificationMeta('isSynced');
  @override
  late final GeneratedColumn<bool> isSynced = GeneratedColumn<bool>(
      'is_synced', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_synced" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _versionMeta =
      const VerificationMeta('version');
  @override
  late final GeneratedColumn<int> version = GeneratedColumn<int>(
      'version', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(1));
  static const VerificationMeta _isDeletedMeta =
      const VerificationMeta('isDeleted');
  @override
  late final GeneratedColumn<bool> isDeleted = GeneratedColumn<bool>(
      'is_deleted', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_deleted" IN (0, 1))'),
      defaultValue: const Constant(false));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        uuid,
        name,
        phone,
        email,
        totalPoints,
        lastVisitAt,
        updatedAt,
        isSynced,
        version,
        isDeleted
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'customer_table';
  @override
  VerificationContext validateIntegrity(Insertable<CustomerTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('uuid')) {
      context.handle(
          _uuidMeta, uuid.isAcceptableOrUnknown(data['uuid']!, _uuidMeta));
    } else if (isInserting) {
      context.missing(_uuidMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('phone')) {
      context.handle(
          _phoneMeta, phone.isAcceptableOrUnknown(data['phone']!, _phoneMeta));
    }
    if (data.containsKey('email')) {
      context.handle(
          _emailMeta, email.isAcceptableOrUnknown(data['email']!, _emailMeta));
    }
    if (data.containsKey('total_points')) {
      context.handle(
          _totalPointsMeta,
          totalPoints.isAcceptableOrUnknown(
              data['total_points']!, _totalPointsMeta));
    }
    if (data.containsKey('last_visit_at')) {
      context.handle(
          _lastVisitAtMeta,
          lastVisitAt.isAcceptableOrUnknown(
              data['last_visit_at']!, _lastVisitAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('is_synced')) {
      context.handle(_isSyncedMeta,
          isSynced.isAcceptableOrUnknown(data['is_synced']!, _isSyncedMeta));
    }
    if (data.containsKey('version')) {
      context.handle(_versionMeta,
          version.isAcceptableOrUnknown(data['version']!, _versionMeta));
    }
    if (data.containsKey('is_deleted')) {
      context.handle(_isDeletedMeta,
          isDeleted.isAcceptableOrUnknown(data['is_deleted']!, _isDeletedMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CustomerTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CustomerTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      uuid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}uuid'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      phone: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}phone']),
      email: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}email']),
      totalPoints: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}total_points'])!,
      lastVisitAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}last_visit_at']),
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
      isSynced: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_synced'])!,
      version: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}version'])!,
      isDeleted: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_deleted'])!,
    );
  }

  @override
  $CustomerTableTable createAlias(String alias) {
    return $CustomerTableTable(attachedDatabase, alias);
  }
}

class CustomerTableData extends DataClass
    implements Insertable<CustomerTableData> {
  final int id;
  final String uuid;
  final String name;
  final String? phone;
  final String? email;
  final double totalPoints;
  final DateTime? lastVisitAt;
  final DateTime updatedAt;
  final bool isSynced;
  final int version;
  final bool isDeleted;
  const CustomerTableData(
      {required this.id,
      required this.uuid,
      required this.name,
      this.phone,
      this.email,
      required this.totalPoints,
      this.lastVisitAt,
      required this.updatedAt,
      required this.isSynced,
      required this.version,
      required this.isDeleted});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['uuid'] = Variable<String>(uuid);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || phone != null) {
      map['phone'] = Variable<String>(phone);
    }
    if (!nullToAbsent || email != null) {
      map['email'] = Variable<String>(email);
    }
    map['total_points'] = Variable<double>(totalPoints);
    if (!nullToAbsent || lastVisitAt != null) {
      map['last_visit_at'] = Variable<DateTime>(lastVisitAt);
    }
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['is_synced'] = Variable<bool>(isSynced);
    map['version'] = Variable<int>(version);
    map['is_deleted'] = Variable<bool>(isDeleted);
    return map;
  }

  CustomerTableCompanion toCompanion(bool nullToAbsent) {
    return CustomerTableCompanion(
      id: Value(id),
      uuid: Value(uuid),
      name: Value(name),
      phone:
          phone == null && nullToAbsent ? const Value.absent() : Value(phone),
      email:
          email == null && nullToAbsent ? const Value.absent() : Value(email),
      totalPoints: Value(totalPoints),
      lastVisitAt: lastVisitAt == null && nullToAbsent
          ? const Value.absent()
          : Value(lastVisitAt),
      updatedAt: Value(updatedAt),
      isSynced: Value(isSynced),
      version: Value(version),
      isDeleted: Value(isDeleted),
    );
  }

  factory CustomerTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CustomerTableData(
      id: serializer.fromJson<int>(json['id']),
      uuid: serializer.fromJson<String>(json['uuid']),
      name: serializer.fromJson<String>(json['name']),
      phone: serializer.fromJson<String?>(json['phone']),
      email: serializer.fromJson<String?>(json['email']),
      totalPoints: serializer.fromJson<double>(json['totalPoints']),
      lastVisitAt: serializer.fromJson<DateTime?>(json['lastVisitAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      isSynced: serializer.fromJson<bool>(json['isSynced']),
      version: serializer.fromJson<int>(json['version']),
      isDeleted: serializer.fromJson<bool>(json['isDeleted']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'uuid': serializer.toJson<String>(uuid),
      'name': serializer.toJson<String>(name),
      'phone': serializer.toJson<String?>(phone),
      'email': serializer.toJson<String?>(email),
      'totalPoints': serializer.toJson<double>(totalPoints),
      'lastVisitAt': serializer.toJson<DateTime?>(lastVisitAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'isSynced': serializer.toJson<bool>(isSynced),
      'version': serializer.toJson<int>(version),
      'isDeleted': serializer.toJson<bool>(isDeleted),
    };
  }

  CustomerTableData copyWith(
          {int? id,
          String? uuid,
          String? name,
          Value<String?> phone = const Value.absent(),
          Value<String?> email = const Value.absent(),
          double? totalPoints,
          Value<DateTime?> lastVisitAt = const Value.absent(),
          DateTime? updatedAt,
          bool? isSynced,
          int? version,
          bool? isDeleted}) =>
      CustomerTableData(
        id: id ?? this.id,
        uuid: uuid ?? this.uuid,
        name: name ?? this.name,
        phone: phone.present ? phone.value : this.phone,
        email: email.present ? email.value : this.email,
        totalPoints: totalPoints ?? this.totalPoints,
        lastVisitAt: lastVisitAt.present ? lastVisitAt.value : this.lastVisitAt,
        updatedAt: updatedAt ?? this.updatedAt,
        isSynced: isSynced ?? this.isSynced,
        version: version ?? this.version,
        isDeleted: isDeleted ?? this.isDeleted,
      );
  CustomerTableData copyWithCompanion(CustomerTableCompanion data) {
    return CustomerTableData(
      id: data.id.present ? data.id.value : this.id,
      uuid: data.uuid.present ? data.uuid.value : this.uuid,
      name: data.name.present ? data.name.value : this.name,
      phone: data.phone.present ? data.phone.value : this.phone,
      email: data.email.present ? data.email.value : this.email,
      totalPoints:
          data.totalPoints.present ? data.totalPoints.value : this.totalPoints,
      lastVisitAt:
          data.lastVisitAt.present ? data.lastVisitAt.value : this.lastVisitAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      isSynced: data.isSynced.present ? data.isSynced.value : this.isSynced,
      version: data.version.present ? data.version.value : this.version,
      isDeleted: data.isDeleted.present ? data.isDeleted.value : this.isDeleted,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CustomerTableData(')
          ..write('id: $id, ')
          ..write('uuid: $uuid, ')
          ..write('name: $name, ')
          ..write('phone: $phone, ')
          ..write('email: $email, ')
          ..write('totalPoints: $totalPoints, ')
          ..write('lastVisitAt: $lastVisitAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('isSynced: $isSynced, ')
          ..write('version: $version, ')
          ..write('isDeleted: $isDeleted')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, uuid, name, phone, email, totalPoints,
      lastVisitAt, updatedAt, isSynced, version, isDeleted);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CustomerTableData &&
          other.id == this.id &&
          other.uuid == this.uuid &&
          other.name == this.name &&
          other.phone == this.phone &&
          other.email == this.email &&
          other.totalPoints == this.totalPoints &&
          other.lastVisitAt == this.lastVisitAt &&
          other.updatedAt == this.updatedAt &&
          other.isSynced == this.isSynced &&
          other.version == this.version &&
          other.isDeleted == this.isDeleted);
}

class CustomerTableCompanion extends UpdateCompanion<CustomerTableData> {
  final Value<int> id;
  final Value<String> uuid;
  final Value<String> name;
  final Value<String?> phone;
  final Value<String?> email;
  final Value<double> totalPoints;
  final Value<DateTime?> lastVisitAt;
  final Value<DateTime> updatedAt;
  final Value<bool> isSynced;
  final Value<int> version;
  final Value<bool> isDeleted;
  const CustomerTableCompanion({
    this.id = const Value.absent(),
    this.uuid = const Value.absent(),
    this.name = const Value.absent(),
    this.phone = const Value.absent(),
    this.email = const Value.absent(),
    this.totalPoints = const Value.absent(),
    this.lastVisitAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.isSynced = const Value.absent(),
    this.version = const Value.absent(),
    this.isDeleted = const Value.absent(),
  });
  CustomerTableCompanion.insert({
    this.id = const Value.absent(),
    required String uuid,
    required String name,
    this.phone = const Value.absent(),
    this.email = const Value.absent(),
    this.totalPoints = const Value.absent(),
    this.lastVisitAt = const Value.absent(),
    required DateTime updatedAt,
    this.isSynced = const Value.absent(),
    this.version = const Value.absent(),
    this.isDeleted = const Value.absent(),
  })  : uuid = Value(uuid),
        name = Value(name),
        updatedAt = Value(updatedAt);
  static Insertable<CustomerTableData> custom({
    Expression<int>? id,
    Expression<String>? uuid,
    Expression<String>? name,
    Expression<String>? phone,
    Expression<String>? email,
    Expression<double>? totalPoints,
    Expression<DateTime>? lastVisitAt,
    Expression<DateTime>? updatedAt,
    Expression<bool>? isSynced,
    Expression<int>? version,
    Expression<bool>? isDeleted,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (uuid != null) 'uuid': uuid,
      if (name != null) 'name': name,
      if (phone != null) 'phone': phone,
      if (email != null) 'email': email,
      if (totalPoints != null) 'total_points': totalPoints,
      if (lastVisitAt != null) 'last_visit_at': lastVisitAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (isSynced != null) 'is_synced': isSynced,
      if (version != null) 'version': version,
      if (isDeleted != null) 'is_deleted': isDeleted,
    });
  }

  CustomerTableCompanion copyWith(
      {Value<int>? id,
      Value<String>? uuid,
      Value<String>? name,
      Value<String?>? phone,
      Value<String?>? email,
      Value<double>? totalPoints,
      Value<DateTime?>? lastVisitAt,
      Value<DateTime>? updatedAt,
      Value<bool>? isSynced,
      Value<int>? version,
      Value<bool>? isDeleted}) {
    return CustomerTableCompanion(
      id: id ?? this.id,
      uuid: uuid ?? this.uuid,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      totalPoints: totalPoints ?? this.totalPoints,
      lastVisitAt: lastVisitAt ?? this.lastVisitAt,
      updatedAt: updatedAt ?? this.updatedAt,
      isSynced: isSynced ?? this.isSynced,
      version: version ?? this.version,
      isDeleted: isDeleted ?? this.isDeleted,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (uuid.present) {
      map['uuid'] = Variable<String>(uuid.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (phone.present) {
      map['phone'] = Variable<String>(phone.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (totalPoints.present) {
      map['total_points'] = Variable<double>(totalPoints.value);
    }
    if (lastVisitAt.present) {
      map['last_visit_at'] = Variable<DateTime>(lastVisitAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (isSynced.present) {
      map['is_synced'] = Variable<bool>(isSynced.value);
    }
    if (version.present) {
      map['version'] = Variable<int>(version.value);
    }
    if (isDeleted.present) {
      map['is_deleted'] = Variable<bool>(isDeleted.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CustomerTableCompanion(')
          ..write('id: $id, ')
          ..write('uuid: $uuid, ')
          ..write('name: $name, ')
          ..write('phone: $phone, ')
          ..write('email: $email, ')
          ..write('totalPoints: $totalPoints, ')
          ..write('lastVisitAt: $lastVisitAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('isSynced: $isSynced, ')
          ..write('version: $version, ')
          ..write('isDeleted: $isDeleted')
          ..write(')'))
        .toString();
  }
}

class $CustomerFeedbackTableTable extends CustomerFeedbackTable
    with TableInfo<$CustomerFeedbackTableTable, CustomerFeedbackTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CustomerFeedbackTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _uuidMeta = const VerificationMeta('uuid');
  @override
  late final GeneratedColumn<String> uuid = GeneratedColumn<String>(
      'uuid', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'));
  static const VerificationMeta _orderUuidMeta =
      const VerificationMeta('orderUuid');
  @override
  late final GeneratedColumn<String> orderUuid = GeneratedColumn<String>(
      'order_uuid', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES order_table (uuid)'));
  static const VerificationMeta _customerUuidMeta =
      const VerificationMeta('customerUuid');
  @override
  late final GeneratedColumn<String> customerUuid = GeneratedColumn<String>(
      'customer_uuid', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES customer_table (uuid)'));
  static const VerificationMeta _ratingMeta = const VerificationMeta('rating');
  @override
  late final GeneratedColumn<int> rating = GeneratedColumn<int>(
      'rating', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _sentimentMeta =
      const VerificationMeta('sentiment');
  @override
  late final GeneratedColumn<String> sentiment = GeneratedColumn<String>(
      'sentiment', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('neutral'));
  static const VerificationMeta _tagsMeta = const VerificationMeta('tags');
  @override
  late final GeneratedColumn<String> tags = GeneratedColumn<String>(
      'tags', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _commentMeta =
      const VerificationMeta('comment');
  @override
  late final GeneratedColumn<String> comment = GeneratedColumn<String>(
      'comment', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _isActionedMeta =
      const VerificationMeta('isActioned');
  @override
  late final GeneratedColumn<bool> isActioned = GeneratedColumn<bool>(
      'is_actioned', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_actioned" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        uuid,
        orderUuid,
        customerUuid,
        rating,
        sentiment,
        tags,
        comment,
        isActioned,
        createdAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'customer_feedback_table';
  @override
  VerificationContext validateIntegrity(
      Insertable<CustomerFeedbackTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('uuid')) {
      context.handle(
          _uuidMeta, uuid.isAcceptableOrUnknown(data['uuid']!, _uuidMeta));
    } else if (isInserting) {
      context.missing(_uuidMeta);
    }
    if (data.containsKey('order_uuid')) {
      context.handle(_orderUuidMeta,
          orderUuid.isAcceptableOrUnknown(data['order_uuid']!, _orderUuidMeta));
    } else if (isInserting) {
      context.missing(_orderUuidMeta);
    }
    if (data.containsKey('customer_uuid')) {
      context.handle(
          _customerUuidMeta,
          customerUuid.isAcceptableOrUnknown(
              data['customer_uuid']!, _customerUuidMeta));
    }
    if (data.containsKey('rating')) {
      context.handle(_ratingMeta,
          rating.isAcceptableOrUnknown(data['rating']!, _ratingMeta));
    } else if (isInserting) {
      context.missing(_ratingMeta);
    }
    if (data.containsKey('sentiment')) {
      context.handle(_sentimentMeta,
          sentiment.isAcceptableOrUnknown(data['sentiment']!, _sentimentMeta));
    }
    if (data.containsKey('tags')) {
      context.handle(
          _tagsMeta, tags.isAcceptableOrUnknown(data['tags']!, _tagsMeta));
    }
    if (data.containsKey('comment')) {
      context.handle(_commentMeta,
          comment.isAcceptableOrUnknown(data['comment']!, _commentMeta));
    }
    if (data.containsKey('is_actioned')) {
      context.handle(
          _isActionedMeta,
          isActioned.isAcceptableOrUnknown(
              data['is_actioned']!, _isActionedMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
        {uuid},
      ];
  @override
  CustomerFeedbackTableData map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CustomerFeedbackTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      uuid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}uuid'])!,
      orderUuid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}order_uuid'])!,
      customerUuid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}customer_uuid']),
      rating: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}rating'])!,
      sentiment: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}sentiment'])!,
      tags: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}tags']),
      comment: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}comment']),
      isActioned: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_actioned'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
    );
  }

  @override
  $CustomerFeedbackTableTable createAlias(String alias) {
    return $CustomerFeedbackTableTable(attachedDatabase, alias);
  }
}

class CustomerFeedbackTableData extends DataClass
    implements Insertable<CustomerFeedbackTableData> {
  final int id;
  final String uuid;
  final String orderUuid;
  final String? customerUuid;
  final int rating;
  final String sentiment;
  final String? tags;
  final String? comment;
  final bool isActioned;
  final DateTime createdAt;
  const CustomerFeedbackTableData(
      {required this.id,
      required this.uuid,
      required this.orderUuid,
      this.customerUuid,
      required this.rating,
      required this.sentiment,
      this.tags,
      this.comment,
      required this.isActioned,
      required this.createdAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['uuid'] = Variable<String>(uuid);
    map['order_uuid'] = Variable<String>(orderUuid);
    if (!nullToAbsent || customerUuid != null) {
      map['customer_uuid'] = Variable<String>(customerUuid);
    }
    map['rating'] = Variable<int>(rating);
    map['sentiment'] = Variable<String>(sentiment);
    if (!nullToAbsent || tags != null) {
      map['tags'] = Variable<String>(tags);
    }
    if (!nullToAbsent || comment != null) {
      map['comment'] = Variable<String>(comment);
    }
    map['is_actioned'] = Variable<bool>(isActioned);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  CustomerFeedbackTableCompanion toCompanion(bool nullToAbsent) {
    return CustomerFeedbackTableCompanion(
      id: Value(id),
      uuid: Value(uuid),
      orderUuid: Value(orderUuid),
      customerUuid: customerUuid == null && nullToAbsent
          ? const Value.absent()
          : Value(customerUuid),
      rating: Value(rating),
      sentiment: Value(sentiment),
      tags: tags == null && nullToAbsent ? const Value.absent() : Value(tags),
      comment: comment == null && nullToAbsent
          ? const Value.absent()
          : Value(comment),
      isActioned: Value(isActioned),
      createdAt: Value(createdAt),
    );
  }

  factory CustomerFeedbackTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CustomerFeedbackTableData(
      id: serializer.fromJson<int>(json['id']),
      uuid: serializer.fromJson<String>(json['uuid']),
      orderUuid: serializer.fromJson<String>(json['orderUuid']),
      customerUuid: serializer.fromJson<String?>(json['customerUuid']),
      rating: serializer.fromJson<int>(json['rating']),
      sentiment: serializer.fromJson<String>(json['sentiment']),
      tags: serializer.fromJson<String?>(json['tags']),
      comment: serializer.fromJson<String?>(json['comment']),
      isActioned: serializer.fromJson<bool>(json['isActioned']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'uuid': serializer.toJson<String>(uuid),
      'orderUuid': serializer.toJson<String>(orderUuid),
      'customerUuid': serializer.toJson<String?>(customerUuid),
      'rating': serializer.toJson<int>(rating),
      'sentiment': serializer.toJson<String>(sentiment),
      'tags': serializer.toJson<String?>(tags),
      'comment': serializer.toJson<String?>(comment),
      'isActioned': serializer.toJson<bool>(isActioned),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  CustomerFeedbackTableData copyWith(
          {int? id,
          String? uuid,
          String? orderUuid,
          Value<String?> customerUuid = const Value.absent(),
          int? rating,
          String? sentiment,
          Value<String?> tags = const Value.absent(),
          Value<String?> comment = const Value.absent(),
          bool? isActioned,
          DateTime? createdAt}) =>
      CustomerFeedbackTableData(
        id: id ?? this.id,
        uuid: uuid ?? this.uuid,
        orderUuid: orderUuid ?? this.orderUuid,
        customerUuid:
            customerUuid.present ? customerUuid.value : this.customerUuid,
        rating: rating ?? this.rating,
        sentiment: sentiment ?? this.sentiment,
        tags: tags.present ? tags.value : this.tags,
        comment: comment.present ? comment.value : this.comment,
        isActioned: isActioned ?? this.isActioned,
        createdAt: createdAt ?? this.createdAt,
      );
  CustomerFeedbackTableData copyWithCompanion(
      CustomerFeedbackTableCompanion data) {
    return CustomerFeedbackTableData(
      id: data.id.present ? data.id.value : this.id,
      uuid: data.uuid.present ? data.uuid.value : this.uuid,
      orderUuid: data.orderUuid.present ? data.orderUuid.value : this.orderUuid,
      customerUuid: data.customerUuid.present
          ? data.customerUuid.value
          : this.customerUuid,
      rating: data.rating.present ? data.rating.value : this.rating,
      sentiment: data.sentiment.present ? data.sentiment.value : this.sentiment,
      tags: data.tags.present ? data.tags.value : this.tags,
      comment: data.comment.present ? data.comment.value : this.comment,
      isActioned:
          data.isActioned.present ? data.isActioned.value : this.isActioned,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CustomerFeedbackTableData(')
          ..write('id: $id, ')
          ..write('uuid: $uuid, ')
          ..write('orderUuid: $orderUuid, ')
          ..write('customerUuid: $customerUuid, ')
          ..write('rating: $rating, ')
          ..write('sentiment: $sentiment, ')
          ..write('tags: $tags, ')
          ..write('comment: $comment, ')
          ..write('isActioned: $isActioned, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, uuid, orderUuid, customerUuid, rating,
      sentiment, tags, comment, isActioned, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CustomerFeedbackTableData &&
          other.id == this.id &&
          other.uuid == this.uuid &&
          other.orderUuid == this.orderUuid &&
          other.customerUuid == this.customerUuid &&
          other.rating == this.rating &&
          other.sentiment == this.sentiment &&
          other.tags == this.tags &&
          other.comment == this.comment &&
          other.isActioned == this.isActioned &&
          other.createdAt == this.createdAt);
}

class CustomerFeedbackTableCompanion
    extends UpdateCompanion<CustomerFeedbackTableData> {
  final Value<int> id;
  final Value<String> uuid;
  final Value<String> orderUuid;
  final Value<String?> customerUuid;
  final Value<int> rating;
  final Value<String> sentiment;
  final Value<String?> tags;
  final Value<String?> comment;
  final Value<bool> isActioned;
  final Value<DateTime> createdAt;
  const CustomerFeedbackTableCompanion({
    this.id = const Value.absent(),
    this.uuid = const Value.absent(),
    this.orderUuid = const Value.absent(),
    this.customerUuid = const Value.absent(),
    this.rating = const Value.absent(),
    this.sentiment = const Value.absent(),
    this.tags = const Value.absent(),
    this.comment = const Value.absent(),
    this.isActioned = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  CustomerFeedbackTableCompanion.insert({
    this.id = const Value.absent(),
    required String uuid,
    required String orderUuid,
    this.customerUuid = const Value.absent(),
    required int rating,
    this.sentiment = const Value.absent(),
    this.tags = const Value.absent(),
    this.comment = const Value.absent(),
    this.isActioned = const Value.absent(),
    required DateTime createdAt,
  })  : uuid = Value(uuid),
        orderUuid = Value(orderUuid),
        rating = Value(rating),
        createdAt = Value(createdAt);
  static Insertable<CustomerFeedbackTableData> custom({
    Expression<int>? id,
    Expression<String>? uuid,
    Expression<String>? orderUuid,
    Expression<String>? customerUuid,
    Expression<int>? rating,
    Expression<String>? sentiment,
    Expression<String>? tags,
    Expression<String>? comment,
    Expression<bool>? isActioned,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (uuid != null) 'uuid': uuid,
      if (orderUuid != null) 'order_uuid': orderUuid,
      if (customerUuid != null) 'customer_uuid': customerUuid,
      if (rating != null) 'rating': rating,
      if (sentiment != null) 'sentiment': sentiment,
      if (tags != null) 'tags': tags,
      if (comment != null) 'comment': comment,
      if (isActioned != null) 'is_actioned': isActioned,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  CustomerFeedbackTableCompanion copyWith(
      {Value<int>? id,
      Value<String>? uuid,
      Value<String>? orderUuid,
      Value<String?>? customerUuid,
      Value<int>? rating,
      Value<String>? sentiment,
      Value<String?>? tags,
      Value<String?>? comment,
      Value<bool>? isActioned,
      Value<DateTime>? createdAt}) {
    return CustomerFeedbackTableCompanion(
      id: id ?? this.id,
      uuid: uuid ?? this.uuid,
      orderUuid: orderUuid ?? this.orderUuid,
      customerUuid: customerUuid ?? this.customerUuid,
      rating: rating ?? this.rating,
      sentiment: sentiment ?? this.sentiment,
      tags: tags ?? this.tags,
      comment: comment ?? this.comment,
      isActioned: isActioned ?? this.isActioned,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (uuid.present) {
      map['uuid'] = Variable<String>(uuid.value);
    }
    if (orderUuid.present) {
      map['order_uuid'] = Variable<String>(orderUuid.value);
    }
    if (customerUuid.present) {
      map['customer_uuid'] = Variable<String>(customerUuid.value);
    }
    if (rating.present) {
      map['rating'] = Variable<int>(rating.value);
    }
    if (sentiment.present) {
      map['sentiment'] = Variable<String>(sentiment.value);
    }
    if (tags.present) {
      map['tags'] = Variable<String>(tags.value);
    }
    if (comment.present) {
      map['comment'] = Variable<String>(comment.value);
    }
    if (isActioned.present) {
      map['is_actioned'] = Variable<bool>(isActioned.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CustomerFeedbackTableCompanion(')
          ..write('id: $id, ')
          ..write('uuid: $uuid, ')
          ..write('orderUuid: $orderUuid, ')
          ..write('customerUuid: $customerUuid, ')
          ..write('rating: $rating, ')
          ..write('sentiment: $sentiment, ')
          ..write('tags: $tags, ')
          ..write('comment: $comment, ')
          ..write('isActioned: $isActioned, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

abstract class _$TestDatabase extends GeneratedDatabase {
  _$TestDatabase(QueryExecutor e) : super(e);
  $TestDatabaseManager get managers => $TestDatabaseManager(this);
  late final $CategoryTableTable categoryTable = $CategoryTableTable(this);
  late final $InventoryLedgerTableTable inventoryLedgerTable =
      $InventoryLedgerTableTable(this);
  late final $TimeEntryTableTable timeEntryTable = $TimeEntryTableTable(this);
  late final $GiftCardTableTable giftCardTable = $GiftCardTableTable(this);
  late final $LoyaltyProgramTableTable loyaltyProgramTable =
      $LoyaltyProgramTableTable(this);
  late final $LoyaltyMemberTableTable loyaltyMemberTable =
      $LoyaltyMemberTableTable(this);
  late final $LoyaltyTransactionTableTable loyaltyTransactionTable =
      $LoyaltyTransactionTableTable(this);
  late final $LoyaltyRewardTableTable loyaltyRewardTable =
      $LoyaltyRewardTableTable(this);
  late final $TipTableTable tipTable = $TipTableTable(this);
  late final $SplitBillTableTable splitBillTable = $SplitBillTableTable(this);
  late final $DiscountTableTable discountTable = $DiscountTableTable(this);
  late final $WaitlistTableTable waitlistTable = $WaitlistTableTable(this);
  late final $StaffAlertTableTable staffAlertTable =
      $StaffAlertTableTable(this);
  late final $KitchenTicketTableTable kitchenTicketTable =
      $KitchenTicketTableTable(this);
  late final $OrderTableTable orderTable = $OrderTableTable(this);
  late final $CustomerTableTable customerTable = $CustomerTableTable(this);
  late final $CustomerFeedbackTableTable customerFeedbackTable =
      $CustomerFeedbackTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        categoryTable,
        inventoryLedgerTable,
        timeEntryTable,
        giftCardTable,
        loyaltyProgramTable,
        loyaltyMemberTable,
        loyaltyTransactionTable,
        loyaltyRewardTable,
        tipTable,
        splitBillTable,
        discountTable,
        waitlistTable,
        staffAlertTable,
        kitchenTicketTable,
        orderTable,
        customerTable,
        customerFeedbackTable
      ];
}

typedef $$CategoryTableTableCreateCompanionBuilder = CategoryTableCompanion
    Function({
  Value<int> id,
  required String uuid,
  required String name,
  Value<String?> colorHex,
  required DateTime createdAt,
  required DateTime updatedAt,
  Value<bool> isDeleted,
});
typedef $$CategoryTableTableUpdateCompanionBuilder = CategoryTableCompanion
    Function({
  Value<int> id,
  Value<String> uuid,
  Value<String> name,
  Value<String?> colorHex,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<bool> isDeleted,
});

class $$CategoryTableTableFilterComposer
    extends Composer<_$TestDatabase, $CategoryTableTable> {
  $$CategoryTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get uuid => $composableBuilder(
      column: $table.uuid, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get colorHex => $composableBuilder(
      column: $table.colorHex, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isDeleted => $composableBuilder(
      column: $table.isDeleted, builder: (column) => ColumnFilters(column));
}

class $$CategoryTableTableOrderingComposer
    extends Composer<_$TestDatabase, $CategoryTableTable> {
  $$CategoryTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get uuid => $composableBuilder(
      column: $table.uuid, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get colorHex => $composableBuilder(
      column: $table.colorHex, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isDeleted => $composableBuilder(
      column: $table.isDeleted, builder: (column) => ColumnOrderings(column));
}

class $$CategoryTableTableAnnotationComposer
    extends Composer<_$TestDatabase, $CategoryTableTable> {
  $$CategoryTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get uuid =>
      $composableBuilder(column: $table.uuid, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get colorHex =>
      $composableBuilder(column: $table.colorHex, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<bool> get isDeleted =>
      $composableBuilder(column: $table.isDeleted, builder: (column) => column);
}

class $$CategoryTableTableTableManager extends RootTableManager<
    _$TestDatabase,
    $CategoryTableTable,
    CategoryTableData,
    $$CategoryTableTableFilterComposer,
    $$CategoryTableTableOrderingComposer,
    $$CategoryTableTableAnnotationComposer,
    $$CategoryTableTableCreateCompanionBuilder,
    $$CategoryTableTableUpdateCompanionBuilder,
    (
      CategoryTableData,
      BaseReferences<_$TestDatabase, $CategoryTableTable, CategoryTableData>
    ),
    CategoryTableData,
    PrefetchHooks Function()> {
  $$CategoryTableTableTableManager(_$TestDatabase db, $CategoryTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CategoryTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CategoryTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CategoryTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> uuid = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String?> colorHex = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<bool> isDeleted = const Value.absent(),
          }) =>
              CategoryTableCompanion(
            id: id,
            uuid: uuid,
            name: name,
            colorHex: colorHex,
            createdAt: createdAt,
            updatedAt: updatedAt,
            isDeleted: isDeleted,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String uuid,
            required String name,
            Value<String?> colorHex = const Value.absent(),
            required DateTime createdAt,
            required DateTime updatedAt,
            Value<bool> isDeleted = const Value.absent(),
          }) =>
              CategoryTableCompanion.insert(
            id: id,
            uuid: uuid,
            name: name,
            colorHex: colorHex,
            createdAt: createdAt,
            updatedAt: updatedAt,
            isDeleted: isDeleted,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$CategoryTableTableProcessedTableManager = ProcessedTableManager<
    _$TestDatabase,
    $CategoryTableTable,
    CategoryTableData,
    $$CategoryTableTableFilterComposer,
    $$CategoryTableTableOrderingComposer,
    $$CategoryTableTableAnnotationComposer,
    $$CategoryTableTableCreateCompanionBuilder,
    $$CategoryTableTableUpdateCompanionBuilder,
    (
      CategoryTableData,
      BaseReferences<_$TestDatabase, $CategoryTableTable, CategoryTableData>
    ),
    CategoryTableData,
    PrefetchHooks Function()>;
typedef $$InventoryLedgerTableTableCreateCompanionBuilder
    = InventoryLedgerTableCompanion Function({
  Value<int> id,
  required String productUuid,
  required double quantityChange,
  required String referenceId,
  required String type,
  required DateTime timestamp,
  Value<bool> isSynced,
});
typedef $$InventoryLedgerTableTableUpdateCompanionBuilder
    = InventoryLedgerTableCompanion Function({
  Value<int> id,
  Value<String> productUuid,
  Value<double> quantityChange,
  Value<String> referenceId,
  Value<String> type,
  Value<DateTime> timestamp,
  Value<bool> isSynced,
});

class $$InventoryLedgerTableTableFilterComposer
    extends Composer<_$TestDatabase, $InventoryLedgerTableTable> {
  $$InventoryLedgerTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get productUuid => $composableBuilder(
      column: $table.productUuid, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get quantityChange => $composableBuilder(
      column: $table.quantityChange,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get referenceId => $composableBuilder(
      column: $table.referenceId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get type => $composableBuilder(
      column: $table.type, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get timestamp => $composableBuilder(
      column: $table.timestamp, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isSynced => $composableBuilder(
      column: $table.isSynced, builder: (column) => ColumnFilters(column));
}

class $$InventoryLedgerTableTableOrderingComposer
    extends Composer<_$TestDatabase, $InventoryLedgerTableTable> {
  $$InventoryLedgerTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get productUuid => $composableBuilder(
      column: $table.productUuid, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get quantityChange => $composableBuilder(
      column: $table.quantityChange,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get referenceId => $composableBuilder(
      column: $table.referenceId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get type => $composableBuilder(
      column: $table.type, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get timestamp => $composableBuilder(
      column: $table.timestamp, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isSynced => $composableBuilder(
      column: $table.isSynced, builder: (column) => ColumnOrderings(column));
}

class $$InventoryLedgerTableTableAnnotationComposer
    extends Composer<_$TestDatabase, $InventoryLedgerTableTable> {
  $$InventoryLedgerTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get productUuid => $composableBuilder(
      column: $table.productUuid, builder: (column) => column);

  GeneratedColumn<double> get quantityChange => $composableBuilder(
      column: $table.quantityChange, builder: (column) => column);

  GeneratedColumn<String> get referenceId => $composableBuilder(
      column: $table.referenceId, builder: (column) => column);

  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<DateTime> get timestamp =>
      $composableBuilder(column: $table.timestamp, builder: (column) => column);

  GeneratedColumn<bool> get isSynced =>
      $composableBuilder(column: $table.isSynced, builder: (column) => column);
}

class $$InventoryLedgerTableTableTableManager extends RootTableManager<
    _$TestDatabase,
    $InventoryLedgerTableTable,
    InventoryLedgerTableData,
    $$InventoryLedgerTableTableFilterComposer,
    $$InventoryLedgerTableTableOrderingComposer,
    $$InventoryLedgerTableTableAnnotationComposer,
    $$InventoryLedgerTableTableCreateCompanionBuilder,
    $$InventoryLedgerTableTableUpdateCompanionBuilder,
    (
      InventoryLedgerTableData,
      BaseReferences<_$TestDatabase, $InventoryLedgerTableTable,
          InventoryLedgerTableData>
    ),
    InventoryLedgerTableData,
    PrefetchHooks Function()> {
  $$InventoryLedgerTableTableTableManager(
      _$TestDatabase db, $InventoryLedgerTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$InventoryLedgerTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$InventoryLedgerTableTableOrderingComposer(
                  $db: db, $table: table),
          createComputedFieldComposer: () =>
              $$InventoryLedgerTableTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> productUuid = const Value.absent(),
            Value<double> quantityChange = const Value.absent(),
            Value<String> referenceId = const Value.absent(),
            Value<String> type = const Value.absent(),
            Value<DateTime> timestamp = const Value.absent(),
            Value<bool> isSynced = const Value.absent(),
          }) =>
              InventoryLedgerTableCompanion(
            id: id,
            productUuid: productUuid,
            quantityChange: quantityChange,
            referenceId: referenceId,
            type: type,
            timestamp: timestamp,
            isSynced: isSynced,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String productUuid,
            required double quantityChange,
            required String referenceId,
            required String type,
            required DateTime timestamp,
            Value<bool> isSynced = const Value.absent(),
          }) =>
              InventoryLedgerTableCompanion.insert(
            id: id,
            productUuid: productUuid,
            quantityChange: quantityChange,
            referenceId: referenceId,
            type: type,
            timestamp: timestamp,
            isSynced: isSynced,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$InventoryLedgerTableTableProcessedTableManager
    = ProcessedTableManager<
        _$TestDatabase,
        $InventoryLedgerTableTable,
        InventoryLedgerTableData,
        $$InventoryLedgerTableTableFilterComposer,
        $$InventoryLedgerTableTableOrderingComposer,
        $$InventoryLedgerTableTableAnnotationComposer,
        $$InventoryLedgerTableTableCreateCompanionBuilder,
        $$InventoryLedgerTableTableUpdateCompanionBuilder,
        (
          InventoryLedgerTableData,
          BaseReferences<_$TestDatabase, $InventoryLedgerTableTable,
              InventoryLedgerTableData>
        ),
        InventoryLedgerTableData,
        PrefetchHooks Function()>;
typedef $$TimeEntryTableTableCreateCompanionBuilder = TimeEntryTableCompanion
    Function({
  Value<int> id,
  required String uuid,
  required String employeeUuid,
  required DateTime clockIn,
  Value<DateTime?> clockOut,
  Value<DateTime?> breakStart,
  Value<DateTime?> breakEnd,
  Value<double> regularHours,
  Value<double> overtimeHours,
  Value<double> breakMinutes,
  Value<double> cashTips,
  Value<double> cardTips,
  Value<String?> shiftUuid,
  Value<String?> notes,
  Value<bool> isApproved,
  Value<String?> approvedBy,
  required DateTime createdAt,
});
typedef $$TimeEntryTableTableUpdateCompanionBuilder = TimeEntryTableCompanion
    Function({
  Value<int> id,
  Value<String> uuid,
  Value<String> employeeUuid,
  Value<DateTime> clockIn,
  Value<DateTime?> clockOut,
  Value<DateTime?> breakStart,
  Value<DateTime?> breakEnd,
  Value<double> regularHours,
  Value<double> overtimeHours,
  Value<double> breakMinutes,
  Value<double> cashTips,
  Value<double> cardTips,
  Value<String?> shiftUuid,
  Value<String?> notes,
  Value<bool> isApproved,
  Value<String?> approvedBy,
  Value<DateTime> createdAt,
});

class $$TimeEntryTableTableFilterComposer
    extends Composer<_$TestDatabase, $TimeEntryTableTable> {
  $$TimeEntryTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get uuid => $composableBuilder(
      column: $table.uuid, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get employeeUuid => $composableBuilder(
      column: $table.employeeUuid, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get clockIn => $composableBuilder(
      column: $table.clockIn, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get clockOut => $composableBuilder(
      column: $table.clockOut, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get breakStart => $composableBuilder(
      column: $table.breakStart, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get breakEnd => $composableBuilder(
      column: $table.breakEnd, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get regularHours => $composableBuilder(
      column: $table.regularHours, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get overtimeHours => $composableBuilder(
      column: $table.overtimeHours, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get breakMinutes => $composableBuilder(
      column: $table.breakMinutes, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get cashTips => $composableBuilder(
      column: $table.cashTips, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get cardTips => $composableBuilder(
      column: $table.cardTips, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get shiftUuid => $composableBuilder(
      column: $table.shiftUuid, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isApproved => $composableBuilder(
      column: $table.isApproved, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get approvedBy => $composableBuilder(
      column: $table.approvedBy, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));
}

class $$TimeEntryTableTableOrderingComposer
    extends Composer<_$TestDatabase, $TimeEntryTableTable> {
  $$TimeEntryTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get uuid => $composableBuilder(
      column: $table.uuid, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get employeeUuid => $composableBuilder(
      column: $table.employeeUuid,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get clockIn => $composableBuilder(
      column: $table.clockIn, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get clockOut => $composableBuilder(
      column: $table.clockOut, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get breakStart => $composableBuilder(
      column: $table.breakStart, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get breakEnd => $composableBuilder(
      column: $table.breakEnd, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get regularHours => $composableBuilder(
      column: $table.regularHours,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get overtimeHours => $composableBuilder(
      column: $table.overtimeHours,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get breakMinutes => $composableBuilder(
      column: $table.breakMinutes,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get cashTips => $composableBuilder(
      column: $table.cashTips, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get cardTips => $composableBuilder(
      column: $table.cardTips, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get shiftUuid => $composableBuilder(
      column: $table.shiftUuid, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isApproved => $composableBuilder(
      column: $table.isApproved, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get approvedBy => $composableBuilder(
      column: $table.approvedBy, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));
}

class $$TimeEntryTableTableAnnotationComposer
    extends Composer<_$TestDatabase, $TimeEntryTableTable> {
  $$TimeEntryTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get uuid =>
      $composableBuilder(column: $table.uuid, builder: (column) => column);

  GeneratedColumn<String> get employeeUuid => $composableBuilder(
      column: $table.employeeUuid, builder: (column) => column);

  GeneratedColumn<DateTime> get clockIn =>
      $composableBuilder(column: $table.clockIn, builder: (column) => column);

  GeneratedColumn<DateTime> get clockOut =>
      $composableBuilder(column: $table.clockOut, builder: (column) => column);

  GeneratedColumn<DateTime> get breakStart => $composableBuilder(
      column: $table.breakStart, builder: (column) => column);

  GeneratedColumn<DateTime> get breakEnd =>
      $composableBuilder(column: $table.breakEnd, builder: (column) => column);

  GeneratedColumn<double> get regularHours => $composableBuilder(
      column: $table.regularHours, builder: (column) => column);

  GeneratedColumn<double> get overtimeHours => $composableBuilder(
      column: $table.overtimeHours, builder: (column) => column);

  GeneratedColumn<double> get breakMinutes => $composableBuilder(
      column: $table.breakMinutes, builder: (column) => column);

  GeneratedColumn<double> get cashTips =>
      $composableBuilder(column: $table.cashTips, builder: (column) => column);

  GeneratedColumn<double> get cardTips =>
      $composableBuilder(column: $table.cardTips, builder: (column) => column);

  GeneratedColumn<String> get shiftUuid =>
      $composableBuilder(column: $table.shiftUuid, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<bool> get isApproved => $composableBuilder(
      column: $table.isApproved, builder: (column) => column);

  GeneratedColumn<String> get approvedBy => $composableBuilder(
      column: $table.approvedBy, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$TimeEntryTableTableTableManager extends RootTableManager<
    _$TestDatabase,
    $TimeEntryTableTable,
    TimeEntryTableData,
    $$TimeEntryTableTableFilterComposer,
    $$TimeEntryTableTableOrderingComposer,
    $$TimeEntryTableTableAnnotationComposer,
    $$TimeEntryTableTableCreateCompanionBuilder,
    $$TimeEntryTableTableUpdateCompanionBuilder,
    (
      TimeEntryTableData,
      BaseReferences<_$TestDatabase, $TimeEntryTableTable, TimeEntryTableData>
    ),
    TimeEntryTableData,
    PrefetchHooks Function()> {
  $$TimeEntryTableTableTableManager(
      _$TestDatabase db, $TimeEntryTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TimeEntryTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TimeEntryTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TimeEntryTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> uuid = const Value.absent(),
            Value<String> employeeUuid = const Value.absent(),
            Value<DateTime> clockIn = const Value.absent(),
            Value<DateTime?> clockOut = const Value.absent(),
            Value<DateTime?> breakStart = const Value.absent(),
            Value<DateTime?> breakEnd = const Value.absent(),
            Value<double> regularHours = const Value.absent(),
            Value<double> overtimeHours = const Value.absent(),
            Value<double> breakMinutes = const Value.absent(),
            Value<double> cashTips = const Value.absent(),
            Value<double> cardTips = const Value.absent(),
            Value<String?> shiftUuid = const Value.absent(),
            Value<String?> notes = const Value.absent(),
            Value<bool> isApproved = const Value.absent(),
            Value<String?> approvedBy = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
          }) =>
              TimeEntryTableCompanion(
            id: id,
            uuid: uuid,
            employeeUuid: employeeUuid,
            clockIn: clockIn,
            clockOut: clockOut,
            breakStart: breakStart,
            breakEnd: breakEnd,
            regularHours: regularHours,
            overtimeHours: overtimeHours,
            breakMinutes: breakMinutes,
            cashTips: cashTips,
            cardTips: cardTips,
            shiftUuid: shiftUuid,
            notes: notes,
            isApproved: isApproved,
            approvedBy: approvedBy,
            createdAt: createdAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String uuid,
            required String employeeUuid,
            required DateTime clockIn,
            Value<DateTime?> clockOut = const Value.absent(),
            Value<DateTime?> breakStart = const Value.absent(),
            Value<DateTime?> breakEnd = const Value.absent(),
            Value<double> regularHours = const Value.absent(),
            Value<double> overtimeHours = const Value.absent(),
            Value<double> breakMinutes = const Value.absent(),
            Value<double> cashTips = const Value.absent(),
            Value<double> cardTips = const Value.absent(),
            Value<String?> shiftUuid = const Value.absent(),
            Value<String?> notes = const Value.absent(),
            Value<bool> isApproved = const Value.absent(),
            Value<String?> approvedBy = const Value.absent(),
            required DateTime createdAt,
          }) =>
              TimeEntryTableCompanion.insert(
            id: id,
            uuid: uuid,
            employeeUuid: employeeUuid,
            clockIn: clockIn,
            clockOut: clockOut,
            breakStart: breakStart,
            breakEnd: breakEnd,
            regularHours: regularHours,
            overtimeHours: overtimeHours,
            breakMinutes: breakMinutes,
            cashTips: cashTips,
            cardTips: cardTips,
            shiftUuid: shiftUuid,
            notes: notes,
            isApproved: isApproved,
            approvedBy: approvedBy,
            createdAt: createdAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$TimeEntryTableTableProcessedTableManager = ProcessedTableManager<
    _$TestDatabase,
    $TimeEntryTableTable,
    TimeEntryTableData,
    $$TimeEntryTableTableFilterComposer,
    $$TimeEntryTableTableOrderingComposer,
    $$TimeEntryTableTableAnnotationComposer,
    $$TimeEntryTableTableCreateCompanionBuilder,
    $$TimeEntryTableTableUpdateCompanionBuilder,
    (
      TimeEntryTableData,
      BaseReferences<_$TestDatabase, $TimeEntryTableTable, TimeEntryTableData>
    ),
    TimeEntryTableData,
    PrefetchHooks Function()>;
typedef $$GiftCardTableTableCreateCompanionBuilder = GiftCardTableCompanion
    Function({
  Value<int> id,
  required String uuid,
  required String cardNumber,
  Value<String?> barcode,
  required double initialValue,
  Value<double> currentBalance,
  Value<String?> customerUuid,
  Value<String?> customerName,
  Value<String?> customerEmail,
  Value<String?> customerPhone,
  Value<String> status,
  required DateTime activatedAt,
  Value<DateTime?> expiresAt,
  Value<DateTime?> lastUsedAt,
  Value<String?> pin,
  Value<String?> activatedByEmployeeUuid,
  Value<String?> activatedByEmployeeName,
  Value<String?> notes,
  required DateTime createdAt,
  required DateTime updatedAt,
});
typedef $$GiftCardTableTableUpdateCompanionBuilder = GiftCardTableCompanion
    Function({
  Value<int> id,
  Value<String> uuid,
  Value<String> cardNumber,
  Value<String?> barcode,
  Value<double> initialValue,
  Value<double> currentBalance,
  Value<String?> customerUuid,
  Value<String?> customerName,
  Value<String?> customerEmail,
  Value<String?> customerPhone,
  Value<String> status,
  Value<DateTime> activatedAt,
  Value<DateTime?> expiresAt,
  Value<DateTime?> lastUsedAt,
  Value<String?> pin,
  Value<String?> activatedByEmployeeUuid,
  Value<String?> activatedByEmployeeName,
  Value<String?> notes,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
});

class $$GiftCardTableTableFilterComposer
    extends Composer<_$TestDatabase, $GiftCardTableTable> {
  $$GiftCardTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get uuid => $composableBuilder(
      column: $table.uuid, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get cardNumber => $composableBuilder(
      column: $table.cardNumber, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get barcode => $composableBuilder(
      column: $table.barcode, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get initialValue => $composableBuilder(
      column: $table.initialValue, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get currentBalance => $composableBuilder(
      column: $table.currentBalance,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get customerUuid => $composableBuilder(
      column: $table.customerUuid, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get customerName => $composableBuilder(
      column: $table.customerName, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get customerEmail => $composableBuilder(
      column: $table.customerEmail, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get customerPhone => $composableBuilder(
      column: $table.customerPhone, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get activatedAt => $composableBuilder(
      column: $table.activatedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get expiresAt => $composableBuilder(
      column: $table.expiresAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get lastUsedAt => $composableBuilder(
      column: $table.lastUsedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get pin => $composableBuilder(
      column: $table.pin, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get activatedByEmployeeUuid => $composableBuilder(
      column: $table.activatedByEmployeeUuid,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get activatedByEmployeeName => $composableBuilder(
      column: $table.activatedByEmployeeName,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));
}

class $$GiftCardTableTableOrderingComposer
    extends Composer<_$TestDatabase, $GiftCardTableTable> {
  $$GiftCardTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get uuid => $composableBuilder(
      column: $table.uuid, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get cardNumber => $composableBuilder(
      column: $table.cardNumber, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get barcode => $composableBuilder(
      column: $table.barcode, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get initialValue => $composableBuilder(
      column: $table.initialValue,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get currentBalance => $composableBuilder(
      column: $table.currentBalance,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get customerUuid => $composableBuilder(
      column: $table.customerUuid,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get customerName => $composableBuilder(
      column: $table.customerName,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get customerEmail => $composableBuilder(
      column: $table.customerEmail,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get customerPhone => $composableBuilder(
      column: $table.customerPhone,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get activatedAt => $composableBuilder(
      column: $table.activatedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get expiresAt => $composableBuilder(
      column: $table.expiresAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get lastUsedAt => $composableBuilder(
      column: $table.lastUsedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get pin => $composableBuilder(
      column: $table.pin, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get activatedByEmployeeUuid => $composableBuilder(
      column: $table.activatedByEmployeeUuid,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get activatedByEmployeeName => $composableBuilder(
      column: $table.activatedByEmployeeName,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));
}

class $$GiftCardTableTableAnnotationComposer
    extends Composer<_$TestDatabase, $GiftCardTableTable> {
  $$GiftCardTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get uuid =>
      $composableBuilder(column: $table.uuid, builder: (column) => column);

  GeneratedColumn<String> get cardNumber => $composableBuilder(
      column: $table.cardNumber, builder: (column) => column);

  GeneratedColumn<String> get barcode =>
      $composableBuilder(column: $table.barcode, builder: (column) => column);

  GeneratedColumn<double> get initialValue => $composableBuilder(
      column: $table.initialValue, builder: (column) => column);

  GeneratedColumn<double> get currentBalance => $composableBuilder(
      column: $table.currentBalance, builder: (column) => column);

  GeneratedColumn<String> get customerUuid => $composableBuilder(
      column: $table.customerUuid, builder: (column) => column);

  GeneratedColumn<String> get customerName => $composableBuilder(
      column: $table.customerName, builder: (column) => column);

  GeneratedColumn<String> get customerEmail => $composableBuilder(
      column: $table.customerEmail, builder: (column) => column);

  GeneratedColumn<String> get customerPhone => $composableBuilder(
      column: $table.customerPhone, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<DateTime> get activatedAt => $composableBuilder(
      column: $table.activatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get expiresAt =>
      $composableBuilder(column: $table.expiresAt, builder: (column) => column);

  GeneratedColumn<DateTime> get lastUsedAt => $composableBuilder(
      column: $table.lastUsedAt, builder: (column) => column);

  GeneratedColumn<String> get pin =>
      $composableBuilder(column: $table.pin, builder: (column) => column);

  GeneratedColumn<String> get activatedByEmployeeUuid => $composableBuilder(
      column: $table.activatedByEmployeeUuid, builder: (column) => column);

  GeneratedColumn<String> get activatedByEmployeeName => $composableBuilder(
      column: $table.activatedByEmployeeName, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$GiftCardTableTableTableManager extends RootTableManager<
    _$TestDatabase,
    $GiftCardTableTable,
    GiftCardTableData,
    $$GiftCardTableTableFilterComposer,
    $$GiftCardTableTableOrderingComposer,
    $$GiftCardTableTableAnnotationComposer,
    $$GiftCardTableTableCreateCompanionBuilder,
    $$GiftCardTableTableUpdateCompanionBuilder,
    (
      GiftCardTableData,
      BaseReferences<_$TestDatabase, $GiftCardTableTable, GiftCardTableData>
    ),
    GiftCardTableData,
    PrefetchHooks Function()> {
  $$GiftCardTableTableTableManager(_$TestDatabase db, $GiftCardTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$GiftCardTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$GiftCardTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$GiftCardTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> uuid = const Value.absent(),
            Value<String> cardNumber = const Value.absent(),
            Value<String?> barcode = const Value.absent(),
            Value<double> initialValue = const Value.absent(),
            Value<double> currentBalance = const Value.absent(),
            Value<String?> customerUuid = const Value.absent(),
            Value<String?> customerName = const Value.absent(),
            Value<String?> customerEmail = const Value.absent(),
            Value<String?> customerPhone = const Value.absent(),
            Value<String> status = const Value.absent(),
            Value<DateTime> activatedAt = const Value.absent(),
            Value<DateTime?> expiresAt = const Value.absent(),
            Value<DateTime?> lastUsedAt = const Value.absent(),
            Value<String?> pin = const Value.absent(),
            Value<String?> activatedByEmployeeUuid = const Value.absent(),
            Value<String?> activatedByEmployeeName = const Value.absent(),
            Value<String?> notes = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
          }) =>
              GiftCardTableCompanion(
            id: id,
            uuid: uuid,
            cardNumber: cardNumber,
            barcode: barcode,
            initialValue: initialValue,
            currentBalance: currentBalance,
            customerUuid: customerUuid,
            customerName: customerName,
            customerEmail: customerEmail,
            customerPhone: customerPhone,
            status: status,
            activatedAt: activatedAt,
            expiresAt: expiresAt,
            lastUsedAt: lastUsedAt,
            pin: pin,
            activatedByEmployeeUuid: activatedByEmployeeUuid,
            activatedByEmployeeName: activatedByEmployeeName,
            notes: notes,
            createdAt: createdAt,
            updatedAt: updatedAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String uuid,
            required String cardNumber,
            Value<String?> barcode = const Value.absent(),
            required double initialValue,
            Value<double> currentBalance = const Value.absent(),
            Value<String?> customerUuid = const Value.absent(),
            Value<String?> customerName = const Value.absent(),
            Value<String?> customerEmail = const Value.absent(),
            Value<String?> customerPhone = const Value.absent(),
            Value<String> status = const Value.absent(),
            required DateTime activatedAt,
            Value<DateTime?> expiresAt = const Value.absent(),
            Value<DateTime?> lastUsedAt = const Value.absent(),
            Value<String?> pin = const Value.absent(),
            Value<String?> activatedByEmployeeUuid = const Value.absent(),
            Value<String?> activatedByEmployeeName = const Value.absent(),
            Value<String?> notes = const Value.absent(),
            required DateTime createdAt,
            required DateTime updatedAt,
          }) =>
              GiftCardTableCompanion.insert(
            id: id,
            uuid: uuid,
            cardNumber: cardNumber,
            barcode: barcode,
            initialValue: initialValue,
            currentBalance: currentBalance,
            customerUuid: customerUuid,
            customerName: customerName,
            customerEmail: customerEmail,
            customerPhone: customerPhone,
            status: status,
            activatedAt: activatedAt,
            expiresAt: expiresAt,
            lastUsedAt: lastUsedAt,
            pin: pin,
            activatedByEmployeeUuid: activatedByEmployeeUuid,
            activatedByEmployeeName: activatedByEmployeeName,
            notes: notes,
            createdAt: createdAt,
            updatedAt: updatedAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$GiftCardTableTableProcessedTableManager = ProcessedTableManager<
    _$TestDatabase,
    $GiftCardTableTable,
    GiftCardTableData,
    $$GiftCardTableTableFilterComposer,
    $$GiftCardTableTableOrderingComposer,
    $$GiftCardTableTableAnnotationComposer,
    $$GiftCardTableTableCreateCompanionBuilder,
    $$GiftCardTableTableUpdateCompanionBuilder,
    (
      GiftCardTableData,
      BaseReferences<_$TestDatabase, $GiftCardTableTable, GiftCardTableData>
    ),
    GiftCardTableData,
    PrefetchHooks Function()>;
typedef $$LoyaltyProgramTableTableCreateCompanionBuilder
    = LoyaltyProgramTableCompanion Function({
  Value<int> id,
  required String uuid,
  Value<String> name,
  Value<double> pointsPerCurrency,
  Value<double> exchangeRate,
  Value<String?> tiersJson,
  Value<DateTime> updatedAt,
});
typedef $$LoyaltyProgramTableTableUpdateCompanionBuilder
    = LoyaltyProgramTableCompanion Function({
  Value<int> id,
  Value<String> uuid,
  Value<String> name,
  Value<double> pointsPerCurrency,
  Value<double> exchangeRate,
  Value<String?> tiersJson,
  Value<DateTime> updatedAt,
});

class $$LoyaltyProgramTableTableFilterComposer
    extends Composer<_$TestDatabase, $LoyaltyProgramTableTable> {
  $$LoyaltyProgramTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get uuid => $composableBuilder(
      column: $table.uuid, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get pointsPerCurrency => $composableBuilder(
      column: $table.pointsPerCurrency,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get exchangeRate => $composableBuilder(
      column: $table.exchangeRate, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get tiersJson => $composableBuilder(
      column: $table.tiersJson, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));
}

class $$LoyaltyProgramTableTableOrderingComposer
    extends Composer<_$TestDatabase, $LoyaltyProgramTableTable> {
  $$LoyaltyProgramTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get uuid => $composableBuilder(
      column: $table.uuid, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get pointsPerCurrency => $composableBuilder(
      column: $table.pointsPerCurrency,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get exchangeRate => $composableBuilder(
      column: $table.exchangeRate,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get tiersJson => $composableBuilder(
      column: $table.tiersJson, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));
}

class $$LoyaltyProgramTableTableAnnotationComposer
    extends Composer<_$TestDatabase, $LoyaltyProgramTableTable> {
  $$LoyaltyProgramTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get uuid =>
      $composableBuilder(column: $table.uuid, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<double> get pointsPerCurrency => $composableBuilder(
      column: $table.pointsPerCurrency, builder: (column) => column);

  GeneratedColumn<double> get exchangeRate => $composableBuilder(
      column: $table.exchangeRate, builder: (column) => column);

  GeneratedColumn<String> get tiersJson =>
      $composableBuilder(column: $table.tiersJson, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$LoyaltyProgramTableTableTableManager extends RootTableManager<
    _$TestDatabase,
    $LoyaltyProgramTableTable,
    LoyaltyProgramData,
    $$LoyaltyProgramTableTableFilterComposer,
    $$LoyaltyProgramTableTableOrderingComposer,
    $$LoyaltyProgramTableTableAnnotationComposer,
    $$LoyaltyProgramTableTableCreateCompanionBuilder,
    $$LoyaltyProgramTableTableUpdateCompanionBuilder,
    (
      LoyaltyProgramData,
      BaseReferences<_$TestDatabase, $LoyaltyProgramTableTable,
          LoyaltyProgramData>
    ),
    LoyaltyProgramData,
    PrefetchHooks Function()> {
  $$LoyaltyProgramTableTableTableManager(
      _$TestDatabase db, $LoyaltyProgramTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$LoyaltyProgramTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$LoyaltyProgramTableTableOrderingComposer(
                  $db: db, $table: table),
          createComputedFieldComposer: () =>
              $$LoyaltyProgramTableTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> uuid = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<double> pointsPerCurrency = const Value.absent(),
            Value<double> exchangeRate = const Value.absent(),
            Value<String?> tiersJson = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
          }) =>
              LoyaltyProgramTableCompanion(
            id: id,
            uuid: uuid,
            name: name,
            pointsPerCurrency: pointsPerCurrency,
            exchangeRate: exchangeRate,
            tiersJson: tiersJson,
            updatedAt: updatedAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String uuid,
            Value<String> name = const Value.absent(),
            Value<double> pointsPerCurrency = const Value.absent(),
            Value<double> exchangeRate = const Value.absent(),
            Value<String?> tiersJson = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
          }) =>
              LoyaltyProgramTableCompanion.insert(
            id: id,
            uuid: uuid,
            name: name,
            pointsPerCurrency: pointsPerCurrency,
            exchangeRate: exchangeRate,
            tiersJson: tiersJson,
            updatedAt: updatedAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$LoyaltyProgramTableTableProcessedTableManager = ProcessedTableManager<
    _$TestDatabase,
    $LoyaltyProgramTableTable,
    LoyaltyProgramData,
    $$LoyaltyProgramTableTableFilterComposer,
    $$LoyaltyProgramTableTableOrderingComposer,
    $$LoyaltyProgramTableTableAnnotationComposer,
    $$LoyaltyProgramTableTableCreateCompanionBuilder,
    $$LoyaltyProgramTableTableUpdateCompanionBuilder,
    (
      LoyaltyProgramData,
      BaseReferences<_$TestDatabase, $LoyaltyProgramTableTable,
          LoyaltyProgramData>
    ),
    LoyaltyProgramData,
    PrefetchHooks Function()>;
typedef $$LoyaltyMemberTableTableCreateCompanionBuilder
    = LoyaltyMemberTableCompanion Function({
  Value<int> id,
  required String uuid,
  required String customerUuid,
  Value<double> pointsBalance,
  Value<double> lifetimePoints,
  Value<String> currentTier,
  Value<DateTime> joinedAt,
  Value<DateTime?> lastTransactionAt,
});
typedef $$LoyaltyMemberTableTableUpdateCompanionBuilder
    = LoyaltyMemberTableCompanion Function({
  Value<int> id,
  Value<String> uuid,
  Value<String> customerUuid,
  Value<double> pointsBalance,
  Value<double> lifetimePoints,
  Value<String> currentTier,
  Value<DateTime> joinedAt,
  Value<DateTime?> lastTransactionAt,
});

class $$LoyaltyMemberTableTableFilterComposer
    extends Composer<_$TestDatabase, $LoyaltyMemberTableTable> {
  $$LoyaltyMemberTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get uuid => $composableBuilder(
      column: $table.uuid, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get customerUuid => $composableBuilder(
      column: $table.customerUuid, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get pointsBalance => $composableBuilder(
      column: $table.pointsBalance, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get lifetimePoints => $composableBuilder(
      column: $table.lifetimePoints,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get currentTier => $composableBuilder(
      column: $table.currentTier, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get joinedAt => $composableBuilder(
      column: $table.joinedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get lastTransactionAt => $composableBuilder(
      column: $table.lastTransactionAt,
      builder: (column) => ColumnFilters(column));
}

class $$LoyaltyMemberTableTableOrderingComposer
    extends Composer<_$TestDatabase, $LoyaltyMemberTableTable> {
  $$LoyaltyMemberTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get uuid => $composableBuilder(
      column: $table.uuid, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get customerUuid => $composableBuilder(
      column: $table.customerUuid,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get pointsBalance => $composableBuilder(
      column: $table.pointsBalance,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get lifetimePoints => $composableBuilder(
      column: $table.lifetimePoints,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get currentTier => $composableBuilder(
      column: $table.currentTier, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get joinedAt => $composableBuilder(
      column: $table.joinedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get lastTransactionAt => $composableBuilder(
      column: $table.lastTransactionAt,
      builder: (column) => ColumnOrderings(column));
}

class $$LoyaltyMemberTableTableAnnotationComposer
    extends Composer<_$TestDatabase, $LoyaltyMemberTableTable> {
  $$LoyaltyMemberTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get uuid =>
      $composableBuilder(column: $table.uuid, builder: (column) => column);

  GeneratedColumn<String> get customerUuid => $composableBuilder(
      column: $table.customerUuid, builder: (column) => column);

  GeneratedColumn<double> get pointsBalance => $composableBuilder(
      column: $table.pointsBalance, builder: (column) => column);

  GeneratedColumn<double> get lifetimePoints => $composableBuilder(
      column: $table.lifetimePoints, builder: (column) => column);

  GeneratedColumn<String> get currentTier => $composableBuilder(
      column: $table.currentTier, builder: (column) => column);

  GeneratedColumn<DateTime> get joinedAt =>
      $composableBuilder(column: $table.joinedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get lastTransactionAt => $composableBuilder(
      column: $table.lastTransactionAt, builder: (column) => column);
}

class $$LoyaltyMemberTableTableTableManager extends RootTableManager<
    _$TestDatabase,
    $LoyaltyMemberTableTable,
    LoyaltyMemberData,
    $$LoyaltyMemberTableTableFilterComposer,
    $$LoyaltyMemberTableTableOrderingComposer,
    $$LoyaltyMemberTableTableAnnotationComposer,
    $$LoyaltyMemberTableTableCreateCompanionBuilder,
    $$LoyaltyMemberTableTableUpdateCompanionBuilder,
    (
      LoyaltyMemberData,
      BaseReferences<_$TestDatabase, $LoyaltyMemberTableTable,
          LoyaltyMemberData>
    ),
    LoyaltyMemberData,
    PrefetchHooks Function()> {
  $$LoyaltyMemberTableTableTableManager(
      _$TestDatabase db, $LoyaltyMemberTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$LoyaltyMemberTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$LoyaltyMemberTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$LoyaltyMemberTableTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> uuid = const Value.absent(),
            Value<String> customerUuid = const Value.absent(),
            Value<double> pointsBalance = const Value.absent(),
            Value<double> lifetimePoints = const Value.absent(),
            Value<String> currentTier = const Value.absent(),
            Value<DateTime> joinedAt = const Value.absent(),
            Value<DateTime?> lastTransactionAt = const Value.absent(),
          }) =>
              LoyaltyMemberTableCompanion(
            id: id,
            uuid: uuid,
            customerUuid: customerUuid,
            pointsBalance: pointsBalance,
            lifetimePoints: lifetimePoints,
            currentTier: currentTier,
            joinedAt: joinedAt,
            lastTransactionAt: lastTransactionAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String uuid,
            required String customerUuid,
            Value<double> pointsBalance = const Value.absent(),
            Value<double> lifetimePoints = const Value.absent(),
            Value<String> currentTier = const Value.absent(),
            Value<DateTime> joinedAt = const Value.absent(),
            Value<DateTime?> lastTransactionAt = const Value.absent(),
          }) =>
              LoyaltyMemberTableCompanion.insert(
            id: id,
            uuid: uuid,
            customerUuid: customerUuid,
            pointsBalance: pointsBalance,
            lifetimePoints: lifetimePoints,
            currentTier: currentTier,
            joinedAt: joinedAt,
            lastTransactionAt: lastTransactionAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$LoyaltyMemberTableTableProcessedTableManager = ProcessedTableManager<
    _$TestDatabase,
    $LoyaltyMemberTableTable,
    LoyaltyMemberData,
    $$LoyaltyMemberTableTableFilterComposer,
    $$LoyaltyMemberTableTableOrderingComposer,
    $$LoyaltyMemberTableTableAnnotationComposer,
    $$LoyaltyMemberTableTableCreateCompanionBuilder,
    $$LoyaltyMemberTableTableUpdateCompanionBuilder,
    (
      LoyaltyMemberData,
      BaseReferences<_$TestDatabase, $LoyaltyMemberTableTable,
          LoyaltyMemberData>
    ),
    LoyaltyMemberData,
    PrefetchHooks Function()>;
typedef $$LoyaltyTransactionTableTableCreateCompanionBuilder
    = LoyaltyTransactionTableCompanion Function({
  Value<int> id,
  required String uuid,
  required String memberUuid,
  required String type,
  required double pointsDelta,
  Value<String?> orderUuid,
  Value<String?> rewardUuid,
  Value<String?> reason,
  Value<DateTime> createdAt,
});
typedef $$LoyaltyTransactionTableTableUpdateCompanionBuilder
    = LoyaltyTransactionTableCompanion Function({
  Value<int> id,
  Value<String> uuid,
  Value<String> memberUuid,
  Value<String> type,
  Value<double> pointsDelta,
  Value<String?> orderUuid,
  Value<String?> rewardUuid,
  Value<String?> reason,
  Value<DateTime> createdAt,
});

class $$LoyaltyTransactionTableTableFilterComposer
    extends Composer<_$TestDatabase, $LoyaltyTransactionTableTable> {
  $$LoyaltyTransactionTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get uuid => $composableBuilder(
      column: $table.uuid, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get memberUuid => $composableBuilder(
      column: $table.memberUuid, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get type => $composableBuilder(
      column: $table.type, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get pointsDelta => $composableBuilder(
      column: $table.pointsDelta, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get orderUuid => $composableBuilder(
      column: $table.orderUuid, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get rewardUuid => $composableBuilder(
      column: $table.rewardUuid, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get reason => $composableBuilder(
      column: $table.reason, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));
}

class $$LoyaltyTransactionTableTableOrderingComposer
    extends Composer<_$TestDatabase, $LoyaltyTransactionTableTable> {
  $$LoyaltyTransactionTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get uuid => $composableBuilder(
      column: $table.uuid, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get memberUuid => $composableBuilder(
      column: $table.memberUuid, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get type => $composableBuilder(
      column: $table.type, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get pointsDelta => $composableBuilder(
      column: $table.pointsDelta, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get orderUuid => $composableBuilder(
      column: $table.orderUuid, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get rewardUuid => $composableBuilder(
      column: $table.rewardUuid, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get reason => $composableBuilder(
      column: $table.reason, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));
}

class $$LoyaltyTransactionTableTableAnnotationComposer
    extends Composer<_$TestDatabase, $LoyaltyTransactionTableTable> {
  $$LoyaltyTransactionTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get uuid =>
      $composableBuilder(column: $table.uuid, builder: (column) => column);

  GeneratedColumn<String> get memberUuid => $composableBuilder(
      column: $table.memberUuid, builder: (column) => column);

  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<double> get pointsDelta => $composableBuilder(
      column: $table.pointsDelta, builder: (column) => column);

  GeneratedColumn<String> get orderUuid =>
      $composableBuilder(column: $table.orderUuid, builder: (column) => column);

  GeneratedColumn<String> get rewardUuid => $composableBuilder(
      column: $table.rewardUuid, builder: (column) => column);

  GeneratedColumn<String> get reason =>
      $composableBuilder(column: $table.reason, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$LoyaltyTransactionTableTableTableManager extends RootTableManager<
    _$TestDatabase,
    $LoyaltyTransactionTableTable,
    LoyaltyTransactionData,
    $$LoyaltyTransactionTableTableFilterComposer,
    $$LoyaltyTransactionTableTableOrderingComposer,
    $$LoyaltyTransactionTableTableAnnotationComposer,
    $$LoyaltyTransactionTableTableCreateCompanionBuilder,
    $$LoyaltyTransactionTableTableUpdateCompanionBuilder,
    (
      LoyaltyTransactionData,
      BaseReferences<_$TestDatabase, $LoyaltyTransactionTableTable,
          LoyaltyTransactionData>
    ),
    LoyaltyTransactionData,
    PrefetchHooks Function()> {
  $$LoyaltyTransactionTableTableTableManager(
      _$TestDatabase db, $LoyaltyTransactionTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$LoyaltyTransactionTableTableFilterComposer(
                  $db: db, $table: table),
          createOrderingComposer: () =>
              $$LoyaltyTransactionTableTableOrderingComposer(
                  $db: db, $table: table),
          createComputedFieldComposer: () =>
              $$LoyaltyTransactionTableTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> uuid = const Value.absent(),
            Value<String> memberUuid = const Value.absent(),
            Value<String> type = const Value.absent(),
            Value<double> pointsDelta = const Value.absent(),
            Value<String?> orderUuid = const Value.absent(),
            Value<String?> rewardUuid = const Value.absent(),
            Value<String?> reason = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
          }) =>
              LoyaltyTransactionTableCompanion(
            id: id,
            uuid: uuid,
            memberUuid: memberUuid,
            type: type,
            pointsDelta: pointsDelta,
            orderUuid: orderUuid,
            rewardUuid: rewardUuid,
            reason: reason,
            createdAt: createdAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String uuid,
            required String memberUuid,
            required String type,
            required double pointsDelta,
            Value<String?> orderUuid = const Value.absent(),
            Value<String?> rewardUuid = const Value.absent(),
            Value<String?> reason = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
          }) =>
              LoyaltyTransactionTableCompanion.insert(
            id: id,
            uuid: uuid,
            memberUuid: memberUuid,
            type: type,
            pointsDelta: pointsDelta,
            orderUuid: orderUuid,
            rewardUuid: rewardUuid,
            reason: reason,
            createdAt: createdAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$LoyaltyTransactionTableTableProcessedTableManager
    = ProcessedTableManager<
        _$TestDatabase,
        $LoyaltyTransactionTableTable,
        LoyaltyTransactionData,
        $$LoyaltyTransactionTableTableFilterComposer,
        $$LoyaltyTransactionTableTableOrderingComposer,
        $$LoyaltyTransactionTableTableAnnotationComposer,
        $$LoyaltyTransactionTableTableCreateCompanionBuilder,
        $$LoyaltyTransactionTableTableUpdateCompanionBuilder,
        (
          LoyaltyTransactionData,
          BaseReferences<_$TestDatabase, $LoyaltyTransactionTableTable,
              LoyaltyTransactionData>
        ),
        LoyaltyTransactionData,
        PrefetchHooks Function()>;
typedef $$LoyaltyRewardTableTableCreateCompanionBuilder
    = LoyaltyRewardTableCompanion Function({
  Value<int> id,
  required String uuid,
  required String name,
  Value<String?> description,
  required double pointsCost,
  required String discountType,
  required double discountValue,
  Value<String?> applicableProductUuid,
  Value<bool> isActive,
});
typedef $$LoyaltyRewardTableTableUpdateCompanionBuilder
    = LoyaltyRewardTableCompanion Function({
  Value<int> id,
  Value<String> uuid,
  Value<String> name,
  Value<String?> description,
  Value<double> pointsCost,
  Value<String> discountType,
  Value<double> discountValue,
  Value<String?> applicableProductUuid,
  Value<bool> isActive,
});

class $$LoyaltyRewardTableTableFilterComposer
    extends Composer<_$TestDatabase, $LoyaltyRewardTableTable> {
  $$LoyaltyRewardTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get uuid => $composableBuilder(
      column: $table.uuid, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get pointsCost => $composableBuilder(
      column: $table.pointsCost, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get discountType => $composableBuilder(
      column: $table.discountType, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get discountValue => $composableBuilder(
      column: $table.discountValue, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get applicableProductUuid => $composableBuilder(
      column: $table.applicableProductUuid,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isActive => $composableBuilder(
      column: $table.isActive, builder: (column) => ColumnFilters(column));
}

class $$LoyaltyRewardTableTableOrderingComposer
    extends Composer<_$TestDatabase, $LoyaltyRewardTableTable> {
  $$LoyaltyRewardTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get uuid => $composableBuilder(
      column: $table.uuid, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get pointsCost => $composableBuilder(
      column: $table.pointsCost, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get discountType => $composableBuilder(
      column: $table.discountType,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get discountValue => $composableBuilder(
      column: $table.discountValue,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get applicableProductUuid => $composableBuilder(
      column: $table.applicableProductUuid,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isActive => $composableBuilder(
      column: $table.isActive, builder: (column) => ColumnOrderings(column));
}

class $$LoyaltyRewardTableTableAnnotationComposer
    extends Composer<_$TestDatabase, $LoyaltyRewardTableTable> {
  $$LoyaltyRewardTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get uuid =>
      $composableBuilder(column: $table.uuid, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => column);

  GeneratedColumn<double> get pointsCost => $composableBuilder(
      column: $table.pointsCost, builder: (column) => column);

  GeneratedColumn<String> get discountType => $composableBuilder(
      column: $table.discountType, builder: (column) => column);

  GeneratedColumn<double> get discountValue => $composableBuilder(
      column: $table.discountValue, builder: (column) => column);

  GeneratedColumn<String> get applicableProductUuid => $composableBuilder(
      column: $table.applicableProductUuid, builder: (column) => column);

  GeneratedColumn<bool> get isActive =>
      $composableBuilder(column: $table.isActive, builder: (column) => column);
}

class $$LoyaltyRewardTableTableTableManager extends RootTableManager<
    _$TestDatabase,
    $LoyaltyRewardTableTable,
    LoyaltyRewardData,
    $$LoyaltyRewardTableTableFilterComposer,
    $$LoyaltyRewardTableTableOrderingComposer,
    $$LoyaltyRewardTableTableAnnotationComposer,
    $$LoyaltyRewardTableTableCreateCompanionBuilder,
    $$LoyaltyRewardTableTableUpdateCompanionBuilder,
    (
      LoyaltyRewardData,
      BaseReferences<_$TestDatabase, $LoyaltyRewardTableTable,
          LoyaltyRewardData>
    ),
    LoyaltyRewardData,
    PrefetchHooks Function()> {
  $$LoyaltyRewardTableTableTableManager(
      _$TestDatabase db, $LoyaltyRewardTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$LoyaltyRewardTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$LoyaltyRewardTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$LoyaltyRewardTableTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> uuid = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String?> description = const Value.absent(),
            Value<double> pointsCost = const Value.absent(),
            Value<String> discountType = const Value.absent(),
            Value<double> discountValue = const Value.absent(),
            Value<String?> applicableProductUuid = const Value.absent(),
            Value<bool> isActive = const Value.absent(),
          }) =>
              LoyaltyRewardTableCompanion(
            id: id,
            uuid: uuid,
            name: name,
            description: description,
            pointsCost: pointsCost,
            discountType: discountType,
            discountValue: discountValue,
            applicableProductUuid: applicableProductUuid,
            isActive: isActive,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String uuid,
            required String name,
            Value<String?> description = const Value.absent(),
            required double pointsCost,
            required String discountType,
            required double discountValue,
            Value<String?> applicableProductUuid = const Value.absent(),
            Value<bool> isActive = const Value.absent(),
          }) =>
              LoyaltyRewardTableCompanion.insert(
            id: id,
            uuid: uuid,
            name: name,
            description: description,
            pointsCost: pointsCost,
            discountType: discountType,
            discountValue: discountValue,
            applicableProductUuid: applicableProductUuid,
            isActive: isActive,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$LoyaltyRewardTableTableProcessedTableManager = ProcessedTableManager<
    _$TestDatabase,
    $LoyaltyRewardTableTable,
    LoyaltyRewardData,
    $$LoyaltyRewardTableTableFilterComposer,
    $$LoyaltyRewardTableTableOrderingComposer,
    $$LoyaltyRewardTableTableAnnotationComposer,
    $$LoyaltyRewardTableTableCreateCompanionBuilder,
    $$LoyaltyRewardTableTableUpdateCompanionBuilder,
    (
      LoyaltyRewardData,
      BaseReferences<_$TestDatabase, $LoyaltyRewardTableTable,
          LoyaltyRewardData>
    ),
    LoyaltyRewardData,
    PrefetchHooks Function()>;
typedef $$TipTableTableCreateCompanionBuilder = TipTableCompanion Function({
  Value<int> id,
  required String uuid,
  required String orderUuid,
  required String orderNumber,
  required String tipType,
  required double amount,
  required String processedByUuid,
  required String processedByName,
  Value<bool> isPooled,
  Value<String?> poolUuid,
  Value<String?> notes,
  required DateTime createdAt,
});
typedef $$TipTableTableUpdateCompanionBuilder = TipTableCompanion Function({
  Value<int> id,
  Value<String> uuid,
  Value<String> orderUuid,
  Value<String> orderNumber,
  Value<String> tipType,
  Value<double> amount,
  Value<String> processedByUuid,
  Value<String> processedByName,
  Value<bool> isPooled,
  Value<String?> poolUuid,
  Value<String?> notes,
  Value<DateTime> createdAt,
});

class $$TipTableTableFilterComposer
    extends Composer<_$TestDatabase, $TipTableTable> {
  $$TipTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get uuid => $composableBuilder(
      column: $table.uuid, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get orderUuid => $composableBuilder(
      column: $table.orderUuid, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get orderNumber => $composableBuilder(
      column: $table.orderNumber, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get tipType => $composableBuilder(
      column: $table.tipType, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get amount => $composableBuilder(
      column: $table.amount, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get processedByUuid => $composableBuilder(
      column: $table.processedByUuid,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get processedByName => $composableBuilder(
      column: $table.processedByName,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isPooled => $composableBuilder(
      column: $table.isPooled, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get poolUuid => $composableBuilder(
      column: $table.poolUuid, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));
}

class $$TipTableTableOrderingComposer
    extends Composer<_$TestDatabase, $TipTableTable> {
  $$TipTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get uuid => $composableBuilder(
      column: $table.uuid, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get orderUuid => $composableBuilder(
      column: $table.orderUuid, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get orderNumber => $composableBuilder(
      column: $table.orderNumber, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get tipType => $composableBuilder(
      column: $table.tipType, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get amount => $composableBuilder(
      column: $table.amount, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get processedByUuid => $composableBuilder(
      column: $table.processedByUuid,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get processedByName => $composableBuilder(
      column: $table.processedByName,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isPooled => $composableBuilder(
      column: $table.isPooled, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get poolUuid => $composableBuilder(
      column: $table.poolUuid, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));
}

class $$TipTableTableAnnotationComposer
    extends Composer<_$TestDatabase, $TipTableTable> {
  $$TipTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get uuid =>
      $composableBuilder(column: $table.uuid, builder: (column) => column);

  GeneratedColumn<String> get orderUuid =>
      $composableBuilder(column: $table.orderUuid, builder: (column) => column);

  GeneratedColumn<String> get orderNumber => $composableBuilder(
      column: $table.orderNumber, builder: (column) => column);

  GeneratedColumn<String> get tipType =>
      $composableBuilder(column: $table.tipType, builder: (column) => column);

  GeneratedColumn<double> get amount =>
      $composableBuilder(column: $table.amount, builder: (column) => column);

  GeneratedColumn<String> get processedByUuid => $composableBuilder(
      column: $table.processedByUuid, builder: (column) => column);

  GeneratedColumn<String> get processedByName => $composableBuilder(
      column: $table.processedByName, builder: (column) => column);

  GeneratedColumn<bool> get isPooled =>
      $composableBuilder(column: $table.isPooled, builder: (column) => column);

  GeneratedColumn<String> get poolUuid =>
      $composableBuilder(column: $table.poolUuid, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$TipTableTableTableManager extends RootTableManager<
    _$TestDatabase,
    $TipTableTable,
    TipTableData,
    $$TipTableTableFilterComposer,
    $$TipTableTableOrderingComposer,
    $$TipTableTableAnnotationComposer,
    $$TipTableTableCreateCompanionBuilder,
    $$TipTableTableUpdateCompanionBuilder,
    (
      TipTableData,
      BaseReferences<_$TestDatabase, $TipTableTable, TipTableData>
    ),
    TipTableData,
    PrefetchHooks Function()> {
  $$TipTableTableTableManager(_$TestDatabase db, $TipTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TipTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TipTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TipTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> uuid = const Value.absent(),
            Value<String> orderUuid = const Value.absent(),
            Value<String> orderNumber = const Value.absent(),
            Value<String> tipType = const Value.absent(),
            Value<double> amount = const Value.absent(),
            Value<String> processedByUuid = const Value.absent(),
            Value<String> processedByName = const Value.absent(),
            Value<bool> isPooled = const Value.absent(),
            Value<String?> poolUuid = const Value.absent(),
            Value<String?> notes = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
          }) =>
              TipTableCompanion(
            id: id,
            uuid: uuid,
            orderUuid: orderUuid,
            orderNumber: orderNumber,
            tipType: tipType,
            amount: amount,
            processedByUuid: processedByUuid,
            processedByName: processedByName,
            isPooled: isPooled,
            poolUuid: poolUuid,
            notes: notes,
            createdAt: createdAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String uuid,
            required String orderUuid,
            required String orderNumber,
            required String tipType,
            required double amount,
            required String processedByUuid,
            required String processedByName,
            Value<bool> isPooled = const Value.absent(),
            Value<String?> poolUuid = const Value.absent(),
            Value<String?> notes = const Value.absent(),
            required DateTime createdAt,
          }) =>
              TipTableCompanion.insert(
            id: id,
            uuid: uuid,
            orderUuid: orderUuid,
            orderNumber: orderNumber,
            tipType: tipType,
            amount: amount,
            processedByUuid: processedByUuid,
            processedByName: processedByName,
            isPooled: isPooled,
            poolUuid: poolUuid,
            notes: notes,
            createdAt: createdAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$TipTableTableProcessedTableManager = ProcessedTableManager<
    _$TestDatabase,
    $TipTableTable,
    TipTableData,
    $$TipTableTableFilterComposer,
    $$TipTableTableOrderingComposer,
    $$TipTableTableAnnotationComposer,
    $$TipTableTableCreateCompanionBuilder,
    $$TipTableTableUpdateCompanionBuilder,
    (
      TipTableData,
      BaseReferences<_$TestDatabase, $TipTableTable, TipTableData>
    ),
    TipTableData,
    PrefetchHooks Function()>;
typedef $$SplitBillTableTableCreateCompanionBuilder = SplitBillTableCompanion
    Function({
  Value<int> id,
  required String uuid,
  required String orderUuid,
  required String orderNumber,
  required double originalTotal,
  required int guestCount,
  required String splitMode,
  Value<String> status,
  required String createdByUuid,
  required String createdByName,
  required DateTime createdAt,
  Value<DateTime?> completedAt,
});
typedef $$SplitBillTableTableUpdateCompanionBuilder = SplitBillTableCompanion
    Function({
  Value<int> id,
  Value<String> uuid,
  Value<String> orderUuid,
  Value<String> orderNumber,
  Value<double> originalTotal,
  Value<int> guestCount,
  Value<String> splitMode,
  Value<String> status,
  Value<String> createdByUuid,
  Value<String> createdByName,
  Value<DateTime> createdAt,
  Value<DateTime?> completedAt,
});

class $$SplitBillTableTableFilterComposer
    extends Composer<_$TestDatabase, $SplitBillTableTable> {
  $$SplitBillTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get uuid => $composableBuilder(
      column: $table.uuid, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get orderUuid => $composableBuilder(
      column: $table.orderUuid, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get orderNumber => $composableBuilder(
      column: $table.orderNumber, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get originalTotal => $composableBuilder(
      column: $table.originalTotal, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get guestCount => $composableBuilder(
      column: $table.guestCount, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get splitMode => $composableBuilder(
      column: $table.splitMode, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get createdByUuid => $composableBuilder(
      column: $table.createdByUuid, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get createdByName => $composableBuilder(
      column: $table.createdByName, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get completedAt => $composableBuilder(
      column: $table.completedAt, builder: (column) => ColumnFilters(column));
}

class $$SplitBillTableTableOrderingComposer
    extends Composer<_$TestDatabase, $SplitBillTableTable> {
  $$SplitBillTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get uuid => $composableBuilder(
      column: $table.uuid, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get orderUuid => $composableBuilder(
      column: $table.orderUuid, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get orderNumber => $composableBuilder(
      column: $table.orderNumber, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get originalTotal => $composableBuilder(
      column: $table.originalTotal,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get guestCount => $composableBuilder(
      column: $table.guestCount, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get splitMode => $composableBuilder(
      column: $table.splitMode, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get createdByUuid => $composableBuilder(
      column: $table.createdByUuid,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get createdByName => $composableBuilder(
      column: $table.createdByName,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get completedAt => $composableBuilder(
      column: $table.completedAt, builder: (column) => ColumnOrderings(column));
}

class $$SplitBillTableTableAnnotationComposer
    extends Composer<_$TestDatabase, $SplitBillTableTable> {
  $$SplitBillTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get uuid =>
      $composableBuilder(column: $table.uuid, builder: (column) => column);

  GeneratedColumn<String> get orderUuid =>
      $composableBuilder(column: $table.orderUuid, builder: (column) => column);

  GeneratedColumn<String> get orderNumber => $composableBuilder(
      column: $table.orderNumber, builder: (column) => column);

  GeneratedColumn<double> get originalTotal => $composableBuilder(
      column: $table.originalTotal, builder: (column) => column);

  GeneratedColumn<int> get guestCount => $composableBuilder(
      column: $table.guestCount, builder: (column) => column);

  GeneratedColumn<String> get splitMode =>
      $composableBuilder(column: $table.splitMode, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<String> get createdByUuid => $composableBuilder(
      column: $table.createdByUuid, builder: (column) => column);

  GeneratedColumn<String> get createdByName => $composableBuilder(
      column: $table.createdByName, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get completedAt => $composableBuilder(
      column: $table.completedAt, builder: (column) => column);
}

class $$SplitBillTableTableTableManager extends RootTableManager<
    _$TestDatabase,
    $SplitBillTableTable,
    SplitBillTableData,
    $$SplitBillTableTableFilterComposer,
    $$SplitBillTableTableOrderingComposer,
    $$SplitBillTableTableAnnotationComposer,
    $$SplitBillTableTableCreateCompanionBuilder,
    $$SplitBillTableTableUpdateCompanionBuilder,
    (
      SplitBillTableData,
      BaseReferences<_$TestDatabase, $SplitBillTableTable, SplitBillTableData>
    ),
    SplitBillTableData,
    PrefetchHooks Function()> {
  $$SplitBillTableTableTableManager(
      _$TestDatabase db, $SplitBillTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SplitBillTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SplitBillTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SplitBillTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> uuid = const Value.absent(),
            Value<String> orderUuid = const Value.absent(),
            Value<String> orderNumber = const Value.absent(),
            Value<double> originalTotal = const Value.absent(),
            Value<int> guestCount = const Value.absent(),
            Value<String> splitMode = const Value.absent(),
            Value<String> status = const Value.absent(),
            Value<String> createdByUuid = const Value.absent(),
            Value<String> createdByName = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime?> completedAt = const Value.absent(),
          }) =>
              SplitBillTableCompanion(
            id: id,
            uuid: uuid,
            orderUuid: orderUuid,
            orderNumber: orderNumber,
            originalTotal: originalTotal,
            guestCount: guestCount,
            splitMode: splitMode,
            status: status,
            createdByUuid: createdByUuid,
            createdByName: createdByName,
            createdAt: createdAt,
            completedAt: completedAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String uuid,
            required String orderUuid,
            required String orderNumber,
            required double originalTotal,
            required int guestCount,
            required String splitMode,
            Value<String> status = const Value.absent(),
            required String createdByUuid,
            required String createdByName,
            required DateTime createdAt,
            Value<DateTime?> completedAt = const Value.absent(),
          }) =>
              SplitBillTableCompanion.insert(
            id: id,
            uuid: uuid,
            orderUuid: orderUuid,
            orderNumber: orderNumber,
            originalTotal: originalTotal,
            guestCount: guestCount,
            splitMode: splitMode,
            status: status,
            createdByUuid: createdByUuid,
            createdByName: createdByName,
            createdAt: createdAt,
            completedAt: completedAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$SplitBillTableTableProcessedTableManager = ProcessedTableManager<
    _$TestDatabase,
    $SplitBillTableTable,
    SplitBillTableData,
    $$SplitBillTableTableFilterComposer,
    $$SplitBillTableTableOrderingComposer,
    $$SplitBillTableTableAnnotationComposer,
    $$SplitBillTableTableCreateCompanionBuilder,
    $$SplitBillTableTableUpdateCompanionBuilder,
    (
      SplitBillTableData,
      BaseReferences<_$TestDatabase, $SplitBillTableTable, SplitBillTableData>
    ),
    SplitBillTableData,
    PrefetchHooks Function()>;
typedef $$DiscountTableTableCreateCompanionBuilder = DiscountTableCompanion
    Function({
  Value<int> id,
  required String uuid,
  required String name,
  required String code,
  Value<String?> description,
  required String type,
  required String scope,
  Value<String> status,
  Value<double?> percentageOff,
  Value<double?> fixedAmountOff,
  Value<int?> buyQuantity,
  Value<int?> getQuantity,
  Value<double?> getDiscountPercent,
  Value<String> tiersJson,
  Value<String> applicableProductUuidsJson,
  Value<String> applicableCategoryUuidsJson,
  Value<String> applicableCustomerUuidsJson,
  Value<double?> minOrderAmount,
  Value<double?> maxDiscountAmount,
  Value<int?> maxUsesTotal,
  Value<int?> maxUsesPerCustomer,
  Value<int> currentUsageCount,
  Value<DateTime?> validFrom,
  Value<DateTime?> validUntil,
  Value<String> validDaysOfWeekJson,
  Value<String?> validTimeStart,
  Value<String?> validTimeEnd,
  Value<bool> canStackWithOthers,
  Value<int> stackPriority,
  required DateTime createdAt,
  Value<DateTime?> updatedAt,
});
typedef $$DiscountTableTableUpdateCompanionBuilder = DiscountTableCompanion
    Function({
  Value<int> id,
  Value<String> uuid,
  Value<String> name,
  Value<String> code,
  Value<String?> description,
  Value<String> type,
  Value<String> scope,
  Value<String> status,
  Value<double?> percentageOff,
  Value<double?> fixedAmountOff,
  Value<int?> buyQuantity,
  Value<int?> getQuantity,
  Value<double?> getDiscountPercent,
  Value<String> tiersJson,
  Value<String> applicableProductUuidsJson,
  Value<String> applicableCategoryUuidsJson,
  Value<String> applicableCustomerUuidsJson,
  Value<double?> minOrderAmount,
  Value<double?> maxDiscountAmount,
  Value<int?> maxUsesTotal,
  Value<int?> maxUsesPerCustomer,
  Value<int> currentUsageCount,
  Value<DateTime?> validFrom,
  Value<DateTime?> validUntil,
  Value<String> validDaysOfWeekJson,
  Value<String?> validTimeStart,
  Value<String?> validTimeEnd,
  Value<bool> canStackWithOthers,
  Value<int> stackPriority,
  Value<DateTime> createdAt,
  Value<DateTime?> updatedAt,
});

class $$DiscountTableTableFilterComposer
    extends Composer<_$TestDatabase, $DiscountTableTable> {
  $$DiscountTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get uuid => $composableBuilder(
      column: $table.uuid, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get code => $composableBuilder(
      column: $table.code, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get type => $composableBuilder(
      column: $table.type, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get scope => $composableBuilder(
      column: $table.scope, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get percentageOff => $composableBuilder(
      column: $table.percentageOff, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get fixedAmountOff => $composableBuilder(
      column: $table.fixedAmountOff,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get buyQuantity => $composableBuilder(
      column: $table.buyQuantity, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get getQuantity => $composableBuilder(
      column: $table.getQuantity, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get getDiscountPercent => $composableBuilder(
      column: $table.getDiscountPercent,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get tiersJson => $composableBuilder(
      column: $table.tiersJson, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get applicableProductUuidsJson => $composableBuilder(
      column: $table.applicableProductUuidsJson,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get applicableCategoryUuidsJson => $composableBuilder(
      column: $table.applicableCategoryUuidsJson,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get applicableCustomerUuidsJson => $composableBuilder(
      column: $table.applicableCustomerUuidsJson,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get minOrderAmount => $composableBuilder(
      column: $table.minOrderAmount,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get maxDiscountAmount => $composableBuilder(
      column: $table.maxDiscountAmount,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get maxUsesTotal => $composableBuilder(
      column: $table.maxUsesTotal, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get maxUsesPerCustomer => $composableBuilder(
      column: $table.maxUsesPerCustomer,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get currentUsageCount => $composableBuilder(
      column: $table.currentUsageCount,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get validFrom => $composableBuilder(
      column: $table.validFrom, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get validUntil => $composableBuilder(
      column: $table.validUntil, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get validDaysOfWeekJson => $composableBuilder(
      column: $table.validDaysOfWeekJson,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get validTimeStart => $composableBuilder(
      column: $table.validTimeStart,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get validTimeEnd => $composableBuilder(
      column: $table.validTimeEnd, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get canStackWithOthers => $composableBuilder(
      column: $table.canStackWithOthers,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get stackPriority => $composableBuilder(
      column: $table.stackPriority, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));
}

class $$DiscountTableTableOrderingComposer
    extends Composer<_$TestDatabase, $DiscountTableTable> {
  $$DiscountTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get uuid => $composableBuilder(
      column: $table.uuid, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get code => $composableBuilder(
      column: $table.code, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get type => $composableBuilder(
      column: $table.type, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get scope => $composableBuilder(
      column: $table.scope, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get percentageOff => $composableBuilder(
      column: $table.percentageOff,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get fixedAmountOff => $composableBuilder(
      column: $table.fixedAmountOff,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get buyQuantity => $composableBuilder(
      column: $table.buyQuantity, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get getQuantity => $composableBuilder(
      column: $table.getQuantity, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get getDiscountPercent => $composableBuilder(
      column: $table.getDiscountPercent,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get tiersJson => $composableBuilder(
      column: $table.tiersJson, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get applicableProductUuidsJson => $composableBuilder(
      column: $table.applicableProductUuidsJson,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get applicableCategoryUuidsJson => $composableBuilder(
      column: $table.applicableCategoryUuidsJson,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get applicableCustomerUuidsJson => $composableBuilder(
      column: $table.applicableCustomerUuidsJson,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get minOrderAmount => $composableBuilder(
      column: $table.minOrderAmount,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get maxDiscountAmount => $composableBuilder(
      column: $table.maxDiscountAmount,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get maxUsesTotal => $composableBuilder(
      column: $table.maxUsesTotal,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get maxUsesPerCustomer => $composableBuilder(
      column: $table.maxUsesPerCustomer,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get currentUsageCount => $composableBuilder(
      column: $table.currentUsageCount,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get validFrom => $composableBuilder(
      column: $table.validFrom, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get validUntil => $composableBuilder(
      column: $table.validUntil, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get validDaysOfWeekJson => $composableBuilder(
      column: $table.validDaysOfWeekJson,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get validTimeStart => $composableBuilder(
      column: $table.validTimeStart,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get validTimeEnd => $composableBuilder(
      column: $table.validTimeEnd,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get canStackWithOthers => $composableBuilder(
      column: $table.canStackWithOthers,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get stackPriority => $composableBuilder(
      column: $table.stackPriority,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));
}

class $$DiscountTableTableAnnotationComposer
    extends Composer<_$TestDatabase, $DiscountTableTable> {
  $$DiscountTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get uuid =>
      $composableBuilder(column: $table.uuid, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get code =>
      $composableBuilder(column: $table.code, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => column);

  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<String> get scope =>
      $composableBuilder(column: $table.scope, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<double> get percentageOff => $composableBuilder(
      column: $table.percentageOff, builder: (column) => column);

  GeneratedColumn<double> get fixedAmountOff => $composableBuilder(
      column: $table.fixedAmountOff, builder: (column) => column);

  GeneratedColumn<int> get buyQuantity => $composableBuilder(
      column: $table.buyQuantity, builder: (column) => column);

  GeneratedColumn<int> get getQuantity => $composableBuilder(
      column: $table.getQuantity, builder: (column) => column);

  GeneratedColumn<double> get getDiscountPercent => $composableBuilder(
      column: $table.getDiscountPercent, builder: (column) => column);

  GeneratedColumn<String> get tiersJson =>
      $composableBuilder(column: $table.tiersJson, builder: (column) => column);

  GeneratedColumn<String> get applicableProductUuidsJson => $composableBuilder(
      column: $table.applicableProductUuidsJson, builder: (column) => column);

  GeneratedColumn<String> get applicableCategoryUuidsJson => $composableBuilder(
      column: $table.applicableCategoryUuidsJson, builder: (column) => column);

  GeneratedColumn<String> get applicableCustomerUuidsJson => $composableBuilder(
      column: $table.applicableCustomerUuidsJson, builder: (column) => column);

  GeneratedColumn<double> get minOrderAmount => $composableBuilder(
      column: $table.minOrderAmount, builder: (column) => column);

  GeneratedColumn<double> get maxDiscountAmount => $composableBuilder(
      column: $table.maxDiscountAmount, builder: (column) => column);

  GeneratedColumn<int> get maxUsesTotal => $composableBuilder(
      column: $table.maxUsesTotal, builder: (column) => column);

  GeneratedColumn<int> get maxUsesPerCustomer => $composableBuilder(
      column: $table.maxUsesPerCustomer, builder: (column) => column);

  GeneratedColumn<int> get currentUsageCount => $composableBuilder(
      column: $table.currentUsageCount, builder: (column) => column);

  GeneratedColumn<DateTime> get validFrom =>
      $composableBuilder(column: $table.validFrom, builder: (column) => column);

  GeneratedColumn<DateTime> get validUntil => $composableBuilder(
      column: $table.validUntil, builder: (column) => column);

  GeneratedColumn<String> get validDaysOfWeekJson => $composableBuilder(
      column: $table.validDaysOfWeekJson, builder: (column) => column);

  GeneratedColumn<String> get validTimeStart => $composableBuilder(
      column: $table.validTimeStart, builder: (column) => column);

  GeneratedColumn<String> get validTimeEnd => $composableBuilder(
      column: $table.validTimeEnd, builder: (column) => column);

  GeneratedColumn<bool> get canStackWithOthers => $composableBuilder(
      column: $table.canStackWithOthers, builder: (column) => column);

  GeneratedColumn<int> get stackPriority => $composableBuilder(
      column: $table.stackPriority, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$DiscountTableTableTableManager extends RootTableManager<
    _$TestDatabase,
    $DiscountTableTable,
    DiscountTableData,
    $$DiscountTableTableFilterComposer,
    $$DiscountTableTableOrderingComposer,
    $$DiscountTableTableAnnotationComposer,
    $$DiscountTableTableCreateCompanionBuilder,
    $$DiscountTableTableUpdateCompanionBuilder,
    (
      DiscountTableData,
      BaseReferences<_$TestDatabase, $DiscountTableTable, DiscountTableData>
    ),
    DiscountTableData,
    PrefetchHooks Function()> {
  $$DiscountTableTableTableManager(_$TestDatabase db, $DiscountTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DiscountTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DiscountTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DiscountTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> uuid = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String> code = const Value.absent(),
            Value<String?> description = const Value.absent(),
            Value<String> type = const Value.absent(),
            Value<String> scope = const Value.absent(),
            Value<String> status = const Value.absent(),
            Value<double?> percentageOff = const Value.absent(),
            Value<double?> fixedAmountOff = const Value.absent(),
            Value<int?> buyQuantity = const Value.absent(),
            Value<int?> getQuantity = const Value.absent(),
            Value<double?> getDiscountPercent = const Value.absent(),
            Value<String> tiersJson = const Value.absent(),
            Value<String> applicableProductUuidsJson = const Value.absent(),
            Value<String> applicableCategoryUuidsJson = const Value.absent(),
            Value<String> applicableCustomerUuidsJson = const Value.absent(),
            Value<double?> minOrderAmount = const Value.absent(),
            Value<double?> maxDiscountAmount = const Value.absent(),
            Value<int?> maxUsesTotal = const Value.absent(),
            Value<int?> maxUsesPerCustomer = const Value.absent(),
            Value<int> currentUsageCount = const Value.absent(),
            Value<DateTime?> validFrom = const Value.absent(),
            Value<DateTime?> validUntil = const Value.absent(),
            Value<String> validDaysOfWeekJson = const Value.absent(),
            Value<String?> validTimeStart = const Value.absent(),
            Value<String?> validTimeEnd = const Value.absent(),
            Value<bool> canStackWithOthers = const Value.absent(),
            Value<int> stackPriority = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime?> updatedAt = const Value.absent(),
          }) =>
              DiscountTableCompanion(
            id: id,
            uuid: uuid,
            name: name,
            code: code,
            description: description,
            type: type,
            scope: scope,
            status: status,
            percentageOff: percentageOff,
            fixedAmountOff: fixedAmountOff,
            buyQuantity: buyQuantity,
            getQuantity: getQuantity,
            getDiscountPercent: getDiscountPercent,
            tiersJson: tiersJson,
            applicableProductUuidsJson: applicableProductUuidsJson,
            applicableCategoryUuidsJson: applicableCategoryUuidsJson,
            applicableCustomerUuidsJson: applicableCustomerUuidsJson,
            minOrderAmount: minOrderAmount,
            maxDiscountAmount: maxDiscountAmount,
            maxUsesTotal: maxUsesTotal,
            maxUsesPerCustomer: maxUsesPerCustomer,
            currentUsageCount: currentUsageCount,
            validFrom: validFrom,
            validUntil: validUntil,
            validDaysOfWeekJson: validDaysOfWeekJson,
            validTimeStart: validTimeStart,
            validTimeEnd: validTimeEnd,
            canStackWithOthers: canStackWithOthers,
            stackPriority: stackPriority,
            createdAt: createdAt,
            updatedAt: updatedAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String uuid,
            required String name,
            required String code,
            Value<String?> description = const Value.absent(),
            required String type,
            required String scope,
            Value<String> status = const Value.absent(),
            Value<double?> percentageOff = const Value.absent(),
            Value<double?> fixedAmountOff = const Value.absent(),
            Value<int?> buyQuantity = const Value.absent(),
            Value<int?> getQuantity = const Value.absent(),
            Value<double?> getDiscountPercent = const Value.absent(),
            Value<String> tiersJson = const Value.absent(),
            Value<String> applicableProductUuidsJson = const Value.absent(),
            Value<String> applicableCategoryUuidsJson = const Value.absent(),
            Value<String> applicableCustomerUuidsJson = const Value.absent(),
            Value<double?> minOrderAmount = const Value.absent(),
            Value<double?> maxDiscountAmount = const Value.absent(),
            Value<int?> maxUsesTotal = const Value.absent(),
            Value<int?> maxUsesPerCustomer = const Value.absent(),
            Value<int> currentUsageCount = const Value.absent(),
            Value<DateTime?> validFrom = const Value.absent(),
            Value<DateTime?> validUntil = const Value.absent(),
            Value<String> validDaysOfWeekJson = const Value.absent(),
            Value<String?> validTimeStart = const Value.absent(),
            Value<String?> validTimeEnd = const Value.absent(),
            Value<bool> canStackWithOthers = const Value.absent(),
            Value<int> stackPriority = const Value.absent(),
            required DateTime createdAt,
            Value<DateTime?> updatedAt = const Value.absent(),
          }) =>
              DiscountTableCompanion.insert(
            id: id,
            uuid: uuid,
            name: name,
            code: code,
            description: description,
            type: type,
            scope: scope,
            status: status,
            percentageOff: percentageOff,
            fixedAmountOff: fixedAmountOff,
            buyQuantity: buyQuantity,
            getQuantity: getQuantity,
            getDiscountPercent: getDiscountPercent,
            tiersJson: tiersJson,
            applicableProductUuidsJson: applicableProductUuidsJson,
            applicableCategoryUuidsJson: applicableCategoryUuidsJson,
            applicableCustomerUuidsJson: applicableCustomerUuidsJson,
            minOrderAmount: minOrderAmount,
            maxDiscountAmount: maxDiscountAmount,
            maxUsesTotal: maxUsesTotal,
            maxUsesPerCustomer: maxUsesPerCustomer,
            currentUsageCount: currentUsageCount,
            validFrom: validFrom,
            validUntil: validUntil,
            validDaysOfWeekJson: validDaysOfWeekJson,
            validTimeStart: validTimeStart,
            validTimeEnd: validTimeEnd,
            canStackWithOthers: canStackWithOthers,
            stackPriority: stackPriority,
            createdAt: createdAt,
            updatedAt: updatedAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$DiscountTableTableProcessedTableManager = ProcessedTableManager<
    _$TestDatabase,
    $DiscountTableTable,
    DiscountTableData,
    $$DiscountTableTableFilterComposer,
    $$DiscountTableTableOrderingComposer,
    $$DiscountTableTableAnnotationComposer,
    $$DiscountTableTableCreateCompanionBuilder,
    $$DiscountTableTableUpdateCompanionBuilder,
    (
      DiscountTableData,
      BaseReferences<_$TestDatabase, $DiscountTableTable, DiscountTableData>
    ),
    DiscountTableData,
    PrefetchHooks Function()>;
typedef $$WaitlistTableTableCreateCompanionBuilder = WaitlistTableCompanion
    Function({
  Value<int> id,
  required String uuid,
  required String guestName,
  required String phoneNumber,
  required int partySize,
  Value<String?> specialRequests,
  Value<bool> highchairNeeded,
  Value<bool> wheelchairAccessible,
  Value<String?> tablePreference,
  Value<String> status,
  required DateTime createdAt,
  Value<DateTime?> quotedWaitTime,
  Value<DateTime?> notifiedAt,
  Value<DateTime?> seatedAt,
  Value<String?> seatedTableUuid,
  Value<int?> queuePosition,
});
typedef $$WaitlistTableTableUpdateCompanionBuilder = WaitlistTableCompanion
    Function({
  Value<int> id,
  Value<String> uuid,
  Value<String> guestName,
  Value<String> phoneNumber,
  Value<int> partySize,
  Value<String?> specialRequests,
  Value<bool> highchairNeeded,
  Value<bool> wheelchairAccessible,
  Value<String?> tablePreference,
  Value<String> status,
  Value<DateTime> createdAt,
  Value<DateTime?> quotedWaitTime,
  Value<DateTime?> notifiedAt,
  Value<DateTime?> seatedAt,
  Value<String?> seatedTableUuid,
  Value<int?> queuePosition,
});

class $$WaitlistTableTableFilterComposer
    extends Composer<_$TestDatabase, $WaitlistTableTable> {
  $$WaitlistTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get uuid => $composableBuilder(
      column: $table.uuid, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get guestName => $composableBuilder(
      column: $table.guestName, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get phoneNumber => $composableBuilder(
      column: $table.phoneNumber, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get partySize => $composableBuilder(
      column: $table.partySize, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get specialRequests => $composableBuilder(
      column: $table.specialRequests,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get highchairNeeded => $composableBuilder(
      column: $table.highchairNeeded,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get wheelchairAccessible => $composableBuilder(
      column: $table.wheelchairAccessible,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get tablePreference => $composableBuilder(
      column: $table.tablePreference,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get quotedWaitTime => $composableBuilder(
      column: $table.quotedWaitTime,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get notifiedAt => $composableBuilder(
      column: $table.notifiedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get seatedAt => $composableBuilder(
      column: $table.seatedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get seatedTableUuid => $composableBuilder(
      column: $table.seatedTableUuid,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get queuePosition => $composableBuilder(
      column: $table.queuePosition, builder: (column) => ColumnFilters(column));
}

class $$WaitlistTableTableOrderingComposer
    extends Composer<_$TestDatabase, $WaitlistTableTable> {
  $$WaitlistTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get uuid => $composableBuilder(
      column: $table.uuid, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get guestName => $composableBuilder(
      column: $table.guestName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get phoneNumber => $composableBuilder(
      column: $table.phoneNumber, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get partySize => $composableBuilder(
      column: $table.partySize, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get specialRequests => $composableBuilder(
      column: $table.specialRequests,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get highchairNeeded => $composableBuilder(
      column: $table.highchairNeeded,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get wheelchairAccessible => $composableBuilder(
      column: $table.wheelchairAccessible,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get tablePreference => $composableBuilder(
      column: $table.tablePreference,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get quotedWaitTime => $composableBuilder(
      column: $table.quotedWaitTime,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get notifiedAt => $composableBuilder(
      column: $table.notifiedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get seatedAt => $composableBuilder(
      column: $table.seatedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get seatedTableUuid => $composableBuilder(
      column: $table.seatedTableUuid,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get queuePosition => $composableBuilder(
      column: $table.queuePosition,
      builder: (column) => ColumnOrderings(column));
}

class $$WaitlistTableTableAnnotationComposer
    extends Composer<_$TestDatabase, $WaitlistTableTable> {
  $$WaitlistTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get uuid =>
      $composableBuilder(column: $table.uuid, builder: (column) => column);

  GeneratedColumn<String> get guestName =>
      $composableBuilder(column: $table.guestName, builder: (column) => column);

  GeneratedColumn<String> get phoneNumber => $composableBuilder(
      column: $table.phoneNumber, builder: (column) => column);

  GeneratedColumn<int> get partySize =>
      $composableBuilder(column: $table.partySize, builder: (column) => column);

  GeneratedColumn<String> get specialRequests => $composableBuilder(
      column: $table.specialRequests, builder: (column) => column);

  GeneratedColumn<bool> get highchairNeeded => $composableBuilder(
      column: $table.highchairNeeded, builder: (column) => column);

  GeneratedColumn<bool> get wheelchairAccessible => $composableBuilder(
      column: $table.wheelchairAccessible, builder: (column) => column);

  GeneratedColumn<String> get tablePreference => $composableBuilder(
      column: $table.tablePreference, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get quotedWaitTime => $composableBuilder(
      column: $table.quotedWaitTime, builder: (column) => column);

  GeneratedColumn<DateTime> get notifiedAt => $composableBuilder(
      column: $table.notifiedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get seatedAt =>
      $composableBuilder(column: $table.seatedAt, builder: (column) => column);

  GeneratedColumn<String> get seatedTableUuid => $composableBuilder(
      column: $table.seatedTableUuid, builder: (column) => column);

  GeneratedColumn<int> get queuePosition => $composableBuilder(
      column: $table.queuePosition, builder: (column) => column);
}

class $$WaitlistTableTableTableManager extends RootTableManager<
    _$TestDatabase,
    $WaitlistTableTable,
    WaitlistTableData,
    $$WaitlistTableTableFilterComposer,
    $$WaitlistTableTableOrderingComposer,
    $$WaitlistTableTableAnnotationComposer,
    $$WaitlistTableTableCreateCompanionBuilder,
    $$WaitlistTableTableUpdateCompanionBuilder,
    (
      WaitlistTableData,
      BaseReferences<_$TestDatabase, $WaitlistTableTable, WaitlistTableData>
    ),
    WaitlistTableData,
    PrefetchHooks Function()> {
  $$WaitlistTableTableTableManager(_$TestDatabase db, $WaitlistTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$WaitlistTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$WaitlistTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$WaitlistTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> uuid = const Value.absent(),
            Value<String> guestName = const Value.absent(),
            Value<String> phoneNumber = const Value.absent(),
            Value<int> partySize = const Value.absent(),
            Value<String?> specialRequests = const Value.absent(),
            Value<bool> highchairNeeded = const Value.absent(),
            Value<bool> wheelchairAccessible = const Value.absent(),
            Value<String?> tablePreference = const Value.absent(),
            Value<String> status = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime?> quotedWaitTime = const Value.absent(),
            Value<DateTime?> notifiedAt = const Value.absent(),
            Value<DateTime?> seatedAt = const Value.absent(),
            Value<String?> seatedTableUuid = const Value.absent(),
            Value<int?> queuePosition = const Value.absent(),
          }) =>
              WaitlistTableCompanion(
            id: id,
            uuid: uuid,
            guestName: guestName,
            phoneNumber: phoneNumber,
            partySize: partySize,
            specialRequests: specialRequests,
            highchairNeeded: highchairNeeded,
            wheelchairAccessible: wheelchairAccessible,
            tablePreference: tablePreference,
            status: status,
            createdAt: createdAt,
            quotedWaitTime: quotedWaitTime,
            notifiedAt: notifiedAt,
            seatedAt: seatedAt,
            seatedTableUuid: seatedTableUuid,
            queuePosition: queuePosition,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String uuid,
            required String guestName,
            required String phoneNumber,
            required int partySize,
            Value<String?> specialRequests = const Value.absent(),
            Value<bool> highchairNeeded = const Value.absent(),
            Value<bool> wheelchairAccessible = const Value.absent(),
            Value<String?> tablePreference = const Value.absent(),
            Value<String> status = const Value.absent(),
            required DateTime createdAt,
            Value<DateTime?> quotedWaitTime = const Value.absent(),
            Value<DateTime?> notifiedAt = const Value.absent(),
            Value<DateTime?> seatedAt = const Value.absent(),
            Value<String?> seatedTableUuid = const Value.absent(),
            Value<int?> queuePosition = const Value.absent(),
          }) =>
              WaitlistTableCompanion.insert(
            id: id,
            uuid: uuid,
            guestName: guestName,
            phoneNumber: phoneNumber,
            partySize: partySize,
            specialRequests: specialRequests,
            highchairNeeded: highchairNeeded,
            wheelchairAccessible: wheelchairAccessible,
            tablePreference: tablePreference,
            status: status,
            createdAt: createdAt,
            quotedWaitTime: quotedWaitTime,
            notifiedAt: notifiedAt,
            seatedAt: seatedAt,
            seatedTableUuid: seatedTableUuid,
            queuePosition: queuePosition,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$WaitlistTableTableProcessedTableManager = ProcessedTableManager<
    _$TestDatabase,
    $WaitlistTableTable,
    WaitlistTableData,
    $$WaitlistTableTableFilterComposer,
    $$WaitlistTableTableOrderingComposer,
    $$WaitlistTableTableAnnotationComposer,
    $$WaitlistTableTableCreateCompanionBuilder,
    $$WaitlistTableTableUpdateCompanionBuilder,
    (
      WaitlistTableData,
      BaseReferences<_$TestDatabase, $WaitlistTableTable, WaitlistTableData>
    ),
    WaitlistTableData,
    PrefetchHooks Function()>;
typedef $$StaffAlertTableTableCreateCompanionBuilder = StaffAlertTableCompanion
    Function({
  Value<int> id,
  required String uuid,
  required String type,
  required String priority,
  required String title,
  required String message,
  Value<String> status,
  Value<String> targetRolesJson,
  Value<String> targetUserUuidsJson,
  Value<bool> broadcastToAll,
  Value<String?> relatedOrderUuid,
  Value<String?> relatedTableUuid,
  Value<String?> relatedCustomerUuid,
  Value<String?> actionLabel,
  Value<String?> actionRoute,
  required DateTime createdAt,
  Value<DateTime?> expiresAt,
  Value<DateTime?> acknowledgedAt,
  Value<String?> acknowledgedByUuid,
  Value<DateTime?> resolvedAt,
  Value<String?> resolvedByUuid,
  Value<bool> playSound,
  Value<bool> vibrate,
});
typedef $$StaffAlertTableTableUpdateCompanionBuilder = StaffAlertTableCompanion
    Function({
  Value<int> id,
  Value<String> uuid,
  Value<String> type,
  Value<String> priority,
  Value<String> title,
  Value<String> message,
  Value<String> status,
  Value<String> targetRolesJson,
  Value<String> targetUserUuidsJson,
  Value<bool> broadcastToAll,
  Value<String?> relatedOrderUuid,
  Value<String?> relatedTableUuid,
  Value<String?> relatedCustomerUuid,
  Value<String?> actionLabel,
  Value<String?> actionRoute,
  Value<DateTime> createdAt,
  Value<DateTime?> expiresAt,
  Value<DateTime?> acknowledgedAt,
  Value<String?> acknowledgedByUuid,
  Value<DateTime?> resolvedAt,
  Value<String?> resolvedByUuid,
  Value<bool> playSound,
  Value<bool> vibrate,
});

class $$StaffAlertTableTableFilterComposer
    extends Composer<_$TestDatabase, $StaffAlertTableTable> {
  $$StaffAlertTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get uuid => $composableBuilder(
      column: $table.uuid, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get type => $composableBuilder(
      column: $table.type, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get priority => $composableBuilder(
      column: $table.priority, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get message => $composableBuilder(
      column: $table.message, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get targetRolesJson => $composableBuilder(
      column: $table.targetRolesJson,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get targetUserUuidsJson => $composableBuilder(
      column: $table.targetUserUuidsJson,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get broadcastToAll => $composableBuilder(
      column: $table.broadcastToAll,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get relatedOrderUuid => $composableBuilder(
      column: $table.relatedOrderUuid,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get relatedTableUuid => $composableBuilder(
      column: $table.relatedTableUuid,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get relatedCustomerUuid => $composableBuilder(
      column: $table.relatedCustomerUuid,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get actionLabel => $composableBuilder(
      column: $table.actionLabel, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get actionRoute => $composableBuilder(
      column: $table.actionRoute, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get expiresAt => $composableBuilder(
      column: $table.expiresAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get acknowledgedAt => $composableBuilder(
      column: $table.acknowledgedAt,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get acknowledgedByUuid => $composableBuilder(
      column: $table.acknowledgedByUuid,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get resolvedAt => $composableBuilder(
      column: $table.resolvedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get resolvedByUuid => $composableBuilder(
      column: $table.resolvedByUuid,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get playSound => $composableBuilder(
      column: $table.playSound, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get vibrate => $composableBuilder(
      column: $table.vibrate, builder: (column) => ColumnFilters(column));
}

class $$StaffAlertTableTableOrderingComposer
    extends Composer<_$TestDatabase, $StaffAlertTableTable> {
  $$StaffAlertTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get uuid => $composableBuilder(
      column: $table.uuid, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get type => $composableBuilder(
      column: $table.type, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get priority => $composableBuilder(
      column: $table.priority, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get message => $composableBuilder(
      column: $table.message, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get targetRolesJson => $composableBuilder(
      column: $table.targetRolesJson,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get targetUserUuidsJson => $composableBuilder(
      column: $table.targetUserUuidsJson,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get broadcastToAll => $composableBuilder(
      column: $table.broadcastToAll,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get relatedOrderUuid => $composableBuilder(
      column: $table.relatedOrderUuid,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get relatedTableUuid => $composableBuilder(
      column: $table.relatedTableUuid,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get relatedCustomerUuid => $composableBuilder(
      column: $table.relatedCustomerUuid,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get actionLabel => $composableBuilder(
      column: $table.actionLabel, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get actionRoute => $composableBuilder(
      column: $table.actionRoute, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get expiresAt => $composableBuilder(
      column: $table.expiresAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get acknowledgedAt => $composableBuilder(
      column: $table.acknowledgedAt,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get acknowledgedByUuid => $composableBuilder(
      column: $table.acknowledgedByUuid,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get resolvedAt => $composableBuilder(
      column: $table.resolvedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get resolvedByUuid => $composableBuilder(
      column: $table.resolvedByUuid,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get playSound => $composableBuilder(
      column: $table.playSound, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get vibrate => $composableBuilder(
      column: $table.vibrate, builder: (column) => ColumnOrderings(column));
}

class $$StaffAlertTableTableAnnotationComposer
    extends Composer<_$TestDatabase, $StaffAlertTableTable> {
  $$StaffAlertTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get uuid =>
      $composableBuilder(column: $table.uuid, builder: (column) => column);

  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<String> get priority =>
      $composableBuilder(column: $table.priority, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get message =>
      $composableBuilder(column: $table.message, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<String> get targetRolesJson => $composableBuilder(
      column: $table.targetRolesJson, builder: (column) => column);

  GeneratedColumn<String> get targetUserUuidsJson => $composableBuilder(
      column: $table.targetUserUuidsJson, builder: (column) => column);

  GeneratedColumn<bool> get broadcastToAll => $composableBuilder(
      column: $table.broadcastToAll, builder: (column) => column);

  GeneratedColumn<String> get relatedOrderUuid => $composableBuilder(
      column: $table.relatedOrderUuid, builder: (column) => column);

  GeneratedColumn<String> get relatedTableUuid => $composableBuilder(
      column: $table.relatedTableUuid, builder: (column) => column);

  GeneratedColumn<String> get relatedCustomerUuid => $composableBuilder(
      column: $table.relatedCustomerUuid, builder: (column) => column);

  GeneratedColumn<String> get actionLabel => $composableBuilder(
      column: $table.actionLabel, builder: (column) => column);

  GeneratedColumn<String> get actionRoute => $composableBuilder(
      column: $table.actionRoute, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get expiresAt =>
      $composableBuilder(column: $table.expiresAt, builder: (column) => column);

  GeneratedColumn<DateTime> get acknowledgedAt => $composableBuilder(
      column: $table.acknowledgedAt, builder: (column) => column);

  GeneratedColumn<String> get acknowledgedByUuid => $composableBuilder(
      column: $table.acknowledgedByUuid, builder: (column) => column);

  GeneratedColumn<DateTime> get resolvedAt => $composableBuilder(
      column: $table.resolvedAt, builder: (column) => column);

  GeneratedColumn<String> get resolvedByUuid => $composableBuilder(
      column: $table.resolvedByUuid, builder: (column) => column);

  GeneratedColumn<bool> get playSound =>
      $composableBuilder(column: $table.playSound, builder: (column) => column);

  GeneratedColumn<bool> get vibrate =>
      $composableBuilder(column: $table.vibrate, builder: (column) => column);
}

class $$StaffAlertTableTableTableManager extends RootTableManager<
    _$TestDatabase,
    $StaffAlertTableTable,
    StaffAlertTableData,
    $$StaffAlertTableTableFilterComposer,
    $$StaffAlertTableTableOrderingComposer,
    $$StaffAlertTableTableAnnotationComposer,
    $$StaffAlertTableTableCreateCompanionBuilder,
    $$StaffAlertTableTableUpdateCompanionBuilder,
    (
      StaffAlertTableData,
      BaseReferences<_$TestDatabase, $StaffAlertTableTable, StaffAlertTableData>
    ),
    StaffAlertTableData,
    PrefetchHooks Function()> {
  $$StaffAlertTableTableTableManager(
      _$TestDatabase db, $StaffAlertTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$StaffAlertTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$StaffAlertTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$StaffAlertTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> uuid = const Value.absent(),
            Value<String> type = const Value.absent(),
            Value<String> priority = const Value.absent(),
            Value<String> title = const Value.absent(),
            Value<String> message = const Value.absent(),
            Value<String> status = const Value.absent(),
            Value<String> targetRolesJson = const Value.absent(),
            Value<String> targetUserUuidsJson = const Value.absent(),
            Value<bool> broadcastToAll = const Value.absent(),
            Value<String?> relatedOrderUuid = const Value.absent(),
            Value<String?> relatedTableUuid = const Value.absent(),
            Value<String?> relatedCustomerUuid = const Value.absent(),
            Value<String?> actionLabel = const Value.absent(),
            Value<String?> actionRoute = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime?> expiresAt = const Value.absent(),
            Value<DateTime?> acknowledgedAt = const Value.absent(),
            Value<String?> acknowledgedByUuid = const Value.absent(),
            Value<DateTime?> resolvedAt = const Value.absent(),
            Value<String?> resolvedByUuid = const Value.absent(),
            Value<bool> playSound = const Value.absent(),
            Value<bool> vibrate = const Value.absent(),
          }) =>
              StaffAlertTableCompanion(
            id: id,
            uuid: uuid,
            type: type,
            priority: priority,
            title: title,
            message: message,
            status: status,
            targetRolesJson: targetRolesJson,
            targetUserUuidsJson: targetUserUuidsJson,
            broadcastToAll: broadcastToAll,
            relatedOrderUuid: relatedOrderUuid,
            relatedTableUuid: relatedTableUuid,
            relatedCustomerUuid: relatedCustomerUuid,
            actionLabel: actionLabel,
            actionRoute: actionRoute,
            createdAt: createdAt,
            expiresAt: expiresAt,
            acknowledgedAt: acknowledgedAt,
            acknowledgedByUuid: acknowledgedByUuid,
            resolvedAt: resolvedAt,
            resolvedByUuid: resolvedByUuid,
            playSound: playSound,
            vibrate: vibrate,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String uuid,
            required String type,
            required String priority,
            required String title,
            required String message,
            Value<String> status = const Value.absent(),
            Value<String> targetRolesJson = const Value.absent(),
            Value<String> targetUserUuidsJson = const Value.absent(),
            Value<bool> broadcastToAll = const Value.absent(),
            Value<String?> relatedOrderUuid = const Value.absent(),
            Value<String?> relatedTableUuid = const Value.absent(),
            Value<String?> relatedCustomerUuid = const Value.absent(),
            Value<String?> actionLabel = const Value.absent(),
            Value<String?> actionRoute = const Value.absent(),
            required DateTime createdAt,
            Value<DateTime?> expiresAt = const Value.absent(),
            Value<DateTime?> acknowledgedAt = const Value.absent(),
            Value<String?> acknowledgedByUuid = const Value.absent(),
            Value<DateTime?> resolvedAt = const Value.absent(),
            Value<String?> resolvedByUuid = const Value.absent(),
            Value<bool> playSound = const Value.absent(),
            Value<bool> vibrate = const Value.absent(),
          }) =>
              StaffAlertTableCompanion.insert(
            id: id,
            uuid: uuid,
            type: type,
            priority: priority,
            title: title,
            message: message,
            status: status,
            targetRolesJson: targetRolesJson,
            targetUserUuidsJson: targetUserUuidsJson,
            broadcastToAll: broadcastToAll,
            relatedOrderUuid: relatedOrderUuid,
            relatedTableUuid: relatedTableUuid,
            relatedCustomerUuid: relatedCustomerUuid,
            actionLabel: actionLabel,
            actionRoute: actionRoute,
            createdAt: createdAt,
            expiresAt: expiresAt,
            acknowledgedAt: acknowledgedAt,
            acknowledgedByUuid: acknowledgedByUuid,
            resolvedAt: resolvedAt,
            resolvedByUuid: resolvedByUuid,
            playSound: playSound,
            vibrate: vibrate,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$StaffAlertTableTableProcessedTableManager = ProcessedTableManager<
    _$TestDatabase,
    $StaffAlertTableTable,
    StaffAlertTableData,
    $$StaffAlertTableTableFilterComposer,
    $$StaffAlertTableTableOrderingComposer,
    $$StaffAlertTableTableAnnotationComposer,
    $$StaffAlertTableTableCreateCompanionBuilder,
    $$StaffAlertTableTableUpdateCompanionBuilder,
    (
      StaffAlertTableData,
      BaseReferences<_$TestDatabase, $StaffAlertTableTable, StaffAlertTableData>
    ),
    StaffAlertTableData,
    PrefetchHooks Function()>;
typedef $$KitchenTicketTableTableCreateCompanionBuilder
    = KitchenTicketTableCompanion Function({
  Value<int> id,
  required String uuid,
  required String orderUuid,
  required String orderNumber,
  Value<String?> tableUuid,
  Value<String?> guestTableName,
  Value<String?> serverName,
  Value<String> status,
  required DateTime firedAt,
  Value<DateTime?> startedAt,
  Value<DateTime?> completedAt,
  Value<DateTime?> targetTime,
  Value<String?> note,
  Value<bool> isRush,
});
typedef $$KitchenTicketTableTableUpdateCompanionBuilder
    = KitchenTicketTableCompanion Function({
  Value<int> id,
  Value<String> uuid,
  Value<String> orderUuid,
  Value<String> orderNumber,
  Value<String?> tableUuid,
  Value<String?> guestTableName,
  Value<String?> serverName,
  Value<String> status,
  Value<DateTime> firedAt,
  Value<DateTime?> startedAt,
  Value<DateTime?> completedAt,
  Value<DateTime?> targetTime,
  Value<String?> note,
  Value<bool> isRush,
});

class $$KitchenTicketTableTableFilterComposer
    extends Composer<_$TestDatabase, $KitchenTicketTableTable> {
  $$KitchenTicketTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get uuid => $composableBuilder(
      column: $table.uuid, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get orderUuid => $composableBuilder(
      column: $table.orderUuid, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get orderNumber => $composableBuilder(
      column: $table.orderNumber, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get tableUuid => $composableBuilder(
      column: $table.tableUuid, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get guestTableName => $composableBuilder(
      column: $table.guestTableName,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get serverName => $composableBuilder(
      column: $table.serverName, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get firedAt => $composableBuilder(
      column: $table.firedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get startedAt => $composableBuilder(
      column: $table.startedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get completedAt => $composableBuilder(
      column: $table.completedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get targetTime => $composableBuilder(
      column: $table.targetTime, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get note => $composableBuilder(
      column: $table.note, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isRush => $composableBuilder(
      column: $table.isRush, builder: (column) => ColumnFilters(column));
}

class $$KitchenTicketTableTableOrderingComposer
    extends Composer<_$TestDatabase, $KitchenTicketTableTable> {
  $$KitchenTicketTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get uuid => $composableBuilder(
      column: $table.uuid, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get orderUuid => $composableBuilder(
      column: $table.orderUuid, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get orderNumber => $composableBuilder(
      column: $table.orderNumber, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get tableUuid => $composableBuilder(
      column: $table.tableUuid, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get guestTableName => $composableBuilder(
      column: $table.guestTableName,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get serverName => $composableBuilder(
      column: $table.serverName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get firedAt => $composableBuilder(
      column: $table.firedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get startedAt => $composableBuilder(
      column: $table.startedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get completedAt => $composableBuilder(
      column: $table.completedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get targetTime => $composableBuilder(
      column: $table.targetTime, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get note => $composableBuilder(
      column: $table.note, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isRush => $composableBuilder(
      column: $table.isRush, builder: (column) => ColumnOrderings(column));
}

class $$KitchenTicketTableTableAnnotationComposer
    extends Composer<_$TestDatabase, $KitchenTicketTableTable> {
  $$KitchenTicketTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get uuid =>
      $composableBuilder(column: $table.uuid, builder: (column) => column);

  GeneratedColumn<String> get orderUuid =>
      $composableBuilder(column: $table.orderUuid, builder: (column) => column);

  GeneratedColumn<String> get orderNumber => $composableBuilder(
      column: $table.orderNumber, builder: (column) => column);

  GeneratedColumn<String> get tableUuid =>
      $composableBuilder(column: $table.tableUuid, builder: (column) => column);

  GeneratedColumn<String> get guestTableName => $composableBuilder(
      column: $table.guestTableName, builder: (column) => column);

  GeneratedColumn<String> get serverName => $composableBuilder(
      column: $table.serverName, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<DateTime> get firedAt =>
      $composableBuilder(column: $table.firedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get startedAt =>
      $composableBuilder(column: $table.startedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get completedAt => $composableBuilder(
      column: $table.completedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get targetTime => $composableBuilder(
      column: $table.targetTime, builder: (column) => column);

  GeneratedColumn<String> get note =>
      $composableBuilder(column: $table.note, builder: (column) => column);

  GeneratedColumn<bool> get isRush =>
      $composableBuilder(column: $table.isRush, builder: (column) => column);
}

class $$KitchenTicketTableTableTableManager extends RootTableManager<
    _$TestDatabase,
    $KitchenTicketTableTable,
    KitchenTicketTableData,
    $$KitchenTicketTableTableFilterComposer,
    $$KitchenTicketTableTableOrderingComposer,
    $$KitchenTicketTableTableAnnotationComposer,
    $$KitchenTicketTableTableCreateCompanionBuilder,
    $$KitchenTicketTableTableUpdateCompanionBuilder,
    (
      KitchenTicketTableData,
      BaseReferences<_$TestDatabase, $KitchenTicketTableTable,
          KitchenTicketTableData>
    ),
    KitchenTicketTableData,
    PrefetchHooks Function()> {
  $$KitchenTicketTableTableTableManager(
      _$TestDatabase db, $KitchenTicketTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$KitchenTicketTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$KitchenTicketTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$KitchenTicketTableTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> uuid = const Value.absent(),
            Value<String> orderUuid = const Value.absent(),
            Value<String> orderNumber = const Value.absent(),
            Value<String?> tableUuid = const Value.absent(),
            Value<String?> guestTableName = const Value.absent(),
            Value<String?> serverName = const Value.absent(),
            Value<String> status = const Value.absent(),
            Value<DateTime> firedAt = const Value.absent(),
            Value<DateTime?> startedAt = const Value.absent(),
            Value<DateTime?> completedAt = const Value.absent(),
            Value<DateTime?> targetTime = const Value.absent(),
            Value<String?> note = const Value.absent(),
            Value<bool> isRush = const Value.absent(),
          }) =>
              KitchenTicketTableCompanion(
            id: id,
            uuid: uuid,
            orderUuid: orderUuid,
            orderNumber: orderNumber,
            tableUuid: tableUuid,
            guestTableName: guestTableName,
            serverName: serverName,
            status: status,
            firedAt: firedAt,
            startedAt: startedAt,
            completedAt: completedAt,
            targetTime: targetTime,
            note: note,
            isRush: isRush,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String uuid,
            required String orderUuid,
            required String orderNumber,
            Value<String?> tableUuid = const Value.absent(),
            Value<String?> guestTableName = const Value.absent(),
            Value<String?> serverName = const Value.absent(),
            Value<String> status = const Value.absent(),
            required DateTime firedAt,
            Value<DateTime?> startedAt = const Value.absent(),
            Value<DateTime?> completedAt = const Value.absent(),
            Value<DateTime?> targetTime = const Value.absent(),
            Value<String?> note = const Value.absent(),
            Value<bool> isRush = const Value.absent(),
          }) =>
              KitchenTicketTableCompanion.insert(
            id: id,
            uuid: uuid,
            orderUuid: orderUuid,
            orderNumber: orderNumber,
            tableUuid: tableUuid,
            guestTableName: guestTableName,
            serverName: serverName,
            status: status,
            firedAt: firedAt,
            startedAt: startedAt,
            completedAt: completedAt,
            targetTime: targetTime,
            note: note,
            isRush: isRush,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$KitchenTicketTableTableProcessedTableManager = ProcessedTableManager<
    _$TestDatabase,
    $KitchenTicketTableTable,
    KitchenTicketTableData,
    $$KitchenTicketTableTableFilterComposer,
    $$KitchenTicketTableTableOrderingComposer,
    $$KitchenTicketTableTableAnnotationComposer,
    $$KitchenTicketTableTableCreateCompanionBuilder,
    $$KitchenTicketTableTableUpdateCompanionBuilder,
    (
      KitchenTicketTableData,
      BaseReferences<_$TestDatabase, $KitchenTicketTableTable,
          KitchenTicketTableData>
    ),
    KitchenTicketTableData,
    PrefetchHooks Function()>;
typedef $$OrderTableTableCreateCompanionBuilder = OrderTableCompanion Function({
  Value<int> id,
  required String uuid,
  required String orderNumber,
  Value<String?> shiftUuid,
  Value<String?> customerUuid,
  Value<String?> tenantId,
  Value<String?> outletId,
  Value<String> status,
  Value<String> paymentStatus,
  required DateTime transactionDate,
  required double subtotal,
  required double discountTotal,
  required double taxTotal,
  required double grandTotal,
  Value<String?> paymentMethod,
  Value<double?> tenderedAmount,
  Value<double?> changeAmount,
  Value<DateTime> updatedAt,
  Value<bool> isSynced,
  Value<int> version,
  Value<int> syncAttempts,
  Value<bool> isFulfilled,
});
typedef $$OrderTableTableUpdateCompanionBuilder = OrderTableCompanion Function({
  Value<int> id,
  Value<String> uuid,
  Value<String> orderNumber,
  Value<String?> shiftUuid,
  Value<String?> customerUuid,
  Value<String?> tenantId,
  Value<String?> outletId,
  Value<String> status,
  Value<String> paymentStatus,
  Value<DateTime> transactionDate,
  Value<double> subtotal,
  Value<double> discountTotal,
  Value<double> taxTotal,
  Value<double> grandTotal,
  Value<String?> paymentMethod,
  Value<double?> tenderedAmount,
  Value<double?> changeAmount,
  Value<DateTime> updatedAt,
  Value<bool> isSynced,
  Value<int> version,
  Value<int> syncAttempts,
  Value<bool> isFulfilled,
});

final class $$OrderTableTableReferences
    extends BaseReferences<_$TestDatabase, $OrderTableTable, OrderTableData> {
  $$OrderTableTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$CustomerFeedbackTableTable,
      List<CustomerFeedbackTableData>> _customerFeedbackTableRefsTable(
          _$TestDatabase db) =>
      MultiTypedResultKey.fromTable(db.customerFeedbackTable,
          aliasName: $_aliasNameGenerator(
              db.orderTable.uuid, db.customerFeedbackTable.orderUuid));

  $$CustomerFeedbackTableTableProcessedTableManager
      get customerFeedbackTableRefs {
    final manager = $$CustomerFeedbackTableTableTableManager(
            $_db, $_db.customerFeedbackTable)
        .filter(
            (f) => f.orderUuid.uuid.sqlEquals($_itemColumn<String>('uuid')!));

    final cache =
        $_typedResult.readTableOrNull(_customerFeedbackTableRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$OrderTableTableFilterComposer
    extends Composer<_$TestDatabase, $OrderTableTable> {
  $$OrderTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get uuid => $composableBuilder(
      column: $table.uuid, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get orderNumber => $composableBuilder(
      column: $table.orderNumber, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get shiftUuid => $composableBuilder(
      column: $table.shiftUuid, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get customerUuid => $composableBuilder(
      column: $table.customerUuid, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get tenantId => $composableBuilder(
      column: $table.tenantId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get outletId => $composableBuilder(
      column: $table.outletId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get paymentStatus => $composableBuilder(
      column: $table.paymentStatus, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get transactionDate => $composableBuilder(
      column: $table.transactionDate,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get subtotal => $composableBuilder(
      column: $table.subtotal, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get discountTotal => $composableBuilder(
      column: $table.discountTotal, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get taxTotal => $composableBuilder(
      column: $table.taxTotal, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get grandTotal => $composableBuilder(
      column: $table.grandTotal, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get paymentMethod => $composableBuilder(
      column: $table.paymentMethod, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get tenderedAmount => $composableBuilder(
      column: $table.tenderedAmount,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get changeAmount => $composableBuilder(
      column: $table.changeAmount, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isSynced => $composableBuilder(
      column: $table.isSynced, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get version => $composableBuilder(
      column: $table.version, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get syncAttempts => $composableBuilder(
      column: $table.syncAttempts, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isFulfilled => $composableBuilder(
      column: $table.isFulfilled, builder: (column) => ColumnFilters(column));

  Expression<bool> customerFeedbackTableRefs(
      Expression<bool> Function($$CustomerFeedbackTableTableFilterComposer f)
          f) {
    final $$CustomerFeedbackTableTableFilterComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.uuid,
            referencedTable: $db.customerFeedbackTable,
            getReferencedColumn: (t) => t.orderUuid,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$CustomerFeedbackTableTableFilterComposer(
                  $db: $db,
                  $table: $db.customerFeedbackTable,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }
}

class $$OrderTableTableOrderingComposer
    extends Composer<_$TestDatabase, $OrderTableTable> {
  $$OrderTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get uuid => $composableBuilder(
      column: $table.uuid, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get orderNumber => $composableBuilder(
      column: $table.orderNumber, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get shiftUuid => $composableBuilder(
      column: $table.shiftUuid, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get customerUuid => $composableBuilder(
      column: $table.customerUuid,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get tenantId => $composableBuilder(
      column: $table.tenantId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get outletId => $composableBuilder(
      column: $table.outletId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get paymentStatus => $composableBuilder(
      column: $table.paymentStatus,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get transactionDate => $composableBuilder(
      column: $table.transactionDate,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get subtotal => $composableBuilder(
      column: $table.subtotal, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get discountTotal => $composableBuilder(
      column: $table.discountTotal,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get taxTotal => $composableBuilder(
      column: $table.taxTotal, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get grandTotal => $composableBuilder(
      column: $table.grandTotal, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get paymentMethod => $composableBuilder(
      column: $table.paymentMethod,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get tenderedAmount => $composableBuilder(
      column: $table.tenderedAmount,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get changeAmount => $composableBuilder(
      column: $table.changeAmount,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isSynced => $composableBuilder(
      column: $table.isSynced, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get version => $composableBuilder(
      column: $table.version, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get syncAttempts => $composableBuilder(
      column: $table.syncAttempts,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isFulfilled => $composableBuilder(
      column: $table.isFulfilled, builder: (column) => ColumnOrderings(column));
}

class $$OrderTableTableAnnotationComposer
    extends Composer<_$TestDatabase, $OrderTableTable> {
  $$OrderTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get uuid =>
      $composableBuilder(column: $table.uuid, builder: (column) => column);

  GeneratedColumn<String> get orderNumber => $composableBuilder(
      column: $table.orderNumber, builder: (column) => column);

  GeneratedColumn<String> get shiftUuid =>
      $composableBuilder(column: $table.shiftUuid, builder: (column) => column);

  GeneratedColumn<String> get customerUuid => $composableBuilder(
      column: $table.customerUuid, builder: (column) => column);

  GeneratedColumn<String> get tenantId =>
      $composableBuilder(column: $table.tenantId, builder: (column) => column);

  GeneratedColumn<String> get outletId =>
      $composableBuilder(column: $table.outletId, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<String> get paymentStatus => $composableBuilder(
      column: $table.paymentStatus, builder: (column) => column);

  GeneratedColumn<DateTime> get transactionDate => $composableBuilder(
      column: $table.transactionDate, builder: (column) => column);

  GeneratedColumn<double> get subtotal =>
      $composableBuilder(column: $table.subtotal, builder: (column) => column);

  GeneratedColumn<double> get discountTotal => $composableBuilder(
      column: $table.discountTotal, builder: (column) => column);

  GeneratedColumn<double> get taxTotal =>
      $composableBuilder(column: $table.taxTotal, builder: (column) => column);

  GeneratedColumn<double> get grandTotal => $composableBuilder(
      column: $table.grandTotal, builder: (column) => column);

  GeneratedColumn<String> get paymentMethod => $composableBuilder(
      column: $table.paymentMethod, builder: (column) => column);

  GeneratedColumn<double> get tenderedAmount => $composableBuilder(
      column: $table.tenderedAmount, builder: (column) => column);

  GeneratedColumn<double> get changeAmount => $composableBuilder(
      column: $table.changeAmount, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<bool> get isSynced =>
      $composableBuilder(column: $table.isSynced, builder: (column) => column);

  GeneratedColumn<int> get version =>
      $composableBuilder(column: $table.version, builder: (column) => column);

  GeneratedColumn<int> get syncAttempts => $composableBuilder(
      column: $table.syncAttempts, builder: (column) => column);

  GeneratedColumn<bool> get isFulfilled => $composableBuilder(
      column: $table.isFulfilled, builder: (column) => column);

  Expression<T> customerFeedbackTableRefs<T extends Object>(
      Expression<T> Function($$CustomerFeedbackTableTableAnnotationComposer a)
          f) {
    final $$CustomerFeedbackTableTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.uuid,
            referencedTable: $db.customerFeedbackTable,
            getReferencedColumn: (t) => t.orderUuid,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$CustomerFeedbackTableTableAnnotationComposer(
                  $db: $db,
                  $table: $db.customerFeedbackTable,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }
}

class $$OrderTableTableTableManager extends RootTableManager<
    _$TestDatabase,
    $OrderTableTable,
    OrderTableData,
    $$OrderTableTableFilterComposer,
    $$OrderTableTableOrderingComposer,
    $$OrderTableTableAnnotationComposer,
    $$OrderTableTableCreateCompanionBuilder,
    $$OrderTableTableUpdateCompanionBuilder,
    (OrderTableData, $$OrderTableTableReferences),
    OrderTableData,
    PrefetchHooks Function({bool customerFeedbackTableRefs})> {
  $$OrderTableTableTableManager(_$TestDatabase db, $OrderTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$OrderTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$OrderTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$OrderTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> uuid = const Value.absent(),
            Value<String> orderNumber = const Value.absent(),
            Value<String?> shiftUuid = const Value.absent(),
            Value<String?> customerUuid = const Value.absent(),
            Value<String?> tenantId = const Value.absent(),
            Value<String?> outletId = const Value.absent(),
            Value<String> status = const Value.absent(),
            Value<String> paymentStatus = const Value.absent(),
            Value<DateTime> transactionDate = const Value.absent(),
            Value<double> subtotal = const Value.absent(),
            Value<double> discountTotal = const Value.absent(),
            Value<double> taxTotal = const Value.absent(),
            Value<double> grandTotal = const Value.absent(),
            Value<String?> paymentMethod = const Value.absent(),
            Value<double?> tenderedAmount = const Value.absent(),
            Value<double?> changeAmount = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<bool> isSynced = const Value.absent(),
            Value<int> version = const Value.absent(),
            Value<int> syncAttempts = const Value.absent(),
            Value<bool> isFulfilled = const Value.absent(),
          }) =>
              OrderTableCompanion(
            id: id,
            uuid: uuid,
            orderNumber: orderNumber,
            shiftUuid: shiftUuid,
            customerUuid: customerUuid,
            tenantId: tenantId,
            outletId: outletId,
            status: status,
            paymentStatus: paymentStatus,
            transactionDate: transactionDate,
            subtotal: subtotal,
            discountTotal: discountTotal,
            taxTotal: taxTotal,
            grandTotal: grandTotal,
            paymentMethod: paymentMethod,
            tenderedAmount: tenderedAmount,
            changeAmount: changeAmount,
            updatedAt: updatedAt,
            isSynced: isSynced,
            version: version,
            syncAttempts: syncAttempts,
            isFulfilled: isFulfilled,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String uuid,
            required String orderNumber,
            Value<String?> shiftUuid = const Value.absent(),
            Value<String?> customerUuid = const Value.absent(),
            Value<String?> tenantId = const Value.absent(),
            Value<String?> outletId = const Value.absent(),
            Value<String> status = const Value.absent(),
            Value<String> paymentStatus = const Value.absent(),
            required DateTime transactionDate,
            required double subtotal,
            required double discountTotal,
            required double taxTotal,
            required double grandTotal,
            Value<String?> paymentMethod = const Value.absent(),
            Value<double?> tenderedAmount = const Value.absent(),
            Value<double?> changeAmount = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<bool> isSynced = const Value.absent(),
            Value<int> version = const Value.absent(),
            Value<int> syncAttempts = const Value.absent(),
            Value<bool> isFulfilled = const Value.absent(),
          }) =>
              OrderTableCompanion.insert(
            id: id,
            uuid: uuid,
            orderNumber: orderNumber,
            shiftUuid: shiftUuid,
            customerUuid: customerUuid,
            tenantId: tenantId,
            outletId: outletId,
            status: status,
            paymentStatus: paymentStatus,
            transactionDate: transactionDate,
            subtotal: subtotal,
            discountTotal: discountTotal,
            taxTotal: taxTotal,
            grandTotal: grandTotal,
            paymentMethod: paymentMethod,
            tenderedAmount: tenderedAmount,
            changeAmount: changeAmount,
            updatedAt: updatedAt,
            isSynced: isSynced,
            version: version,
            syncAttempts: syncAttempts,
            isFulfilled: isFulfilled,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$OrderTableTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({customerFeedbackTableRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (customerFeedbackTableRefs) db.customerFeedbackTable
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (customerFeedbackTableRefs)
                    await $_getPrefetchedData<OrderTableData, $OrderTableTable,
                            CustomerFeedbackTableData>(
                        currentTable: table,
                        referencedTable: $$OrderTableTableReferences
                            ._customerFeedbackTableRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$OrderTableTableReferences(db, table, p0)
                                .customerFeedbackTableRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.orderUuid == item.uuid),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$OrderTableTableProcessedTableManager = ProcessedTableManager<
    _$TestDatabase,
    $OrderTableTable,
    OrderTableData,
    $$OrderTableTableFilterComposer,
    $$OrderTableTableOrderingComposer,
    $$OrderTableTableAnnotationComposer,
    $$OrderTableTableCreateCompanionBuilder,
    $$OrderTableTableUpdateCompanionBuilder,
    (OrderTableData, $$OrderTableTableReferences),
    OrderTableData,
    PrefetchHooks Function({bool customerFeedbackTableRefs})>;
typedef $$CustomerTableTableCreateCompanionBuilder = CustomerTableCompanion
    Function({
  Value<int> id,
  required String uuid,
  required String name,
  Value<String?> phone,
  Value<String?> email,
  Value<double> totalPoints,
  Value<DateTime?> lastVisitAt,
  required DateTime updatedAt,
  Value<bool> isSynced,
  Value<int> version,
  Value<bool> isDeleted,
});
typedef $$CustomerTableTableUpdateCompanionBuilder = CustomerTableCompanion
    Function({
  Value<int> id,
  Value<String> uuid,
  Value<String> name,
  Value<String?> phone,
  Value<String?> email,
  Value<double> totalPoints,
  Value<DateTime?> lastVisitAt,
  Value<DateTime> updatedAt,
  Value<bool> isSynced,
  Value<int> version,
  Value<bool> isDeleted,
});

final class $$CustomerTableTableReferences extends BaseReferences<
    _$TestDatabase, $CustomerTableTable, CustomerTableData> {
  $$CustomerTableTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$CustomerFeedbackTableTable,
      List<CustomerFeedbackTableData>> _customerFeedbackTableRefsTable(
          _$TestDatabase db) =>
      MultiTypedResultKey.fromTable(db.customerFeedbackTable,
          aliasName: $_aliasNameGenerator(
              db.customerTable.uuid, db.customerFeedbackTable.customerUuid));

  $$CustomerFeedbackTableTableProcessedTableManager
      get customerFeedbackTableRefs {
    final manager = $$CustomerFeedbackTableTableTableManager(
            $_db, $_db.customerFeedbackTable)
        .filter((f) =>
            f.customerUuid.uuid.sqlEquals($_itemColumn<String>('uuid')!));

    final cache =
        $_typedResult.readTableOrNull(_customerFeedbackTableRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$CustomerTableTableFilterComposer
    extends Composer<_$TestDatabase, $CustomerTableTable> {
  $$CustomerTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get uuid => $composableBuilder(
      column: $table.uuid, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get phone => $composableBuilder(
      column: $table.phone, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get email => $composableBuilder(
      column: $table.email, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get totalPoints => $composableBuilder(
      column: $table.totalPoints, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get lastVisitAt => $composableBuilder(
      column: $table.lastVisitAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isSynced => $composableBuilder(
      column: $table.isSynced, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get version => $composableBuilder(
      column: $table.version, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isDeleted => $composableBuilder(
      column: $table.isDeleted, builder: (column) => ColumnFilters(column));

  Expression<bool> customerFeedbackTableRefs(
      Expression<bool> Function($$CustomerFeedbackTableTableFilterComposer f)
          f) {
    final $$CustomerFeedbackTableTableFilterComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.uuid,
            referencedTable: $db.customerFeedbackTable,
            getReferencedColumn: (t) => t.customerUuid,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$CustomerFeedbackTableTableFilterComposer(
                  $db: $db,
                  $table: $db.customerFeedbackTable,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }
}

class $$CustomerTableTableOrderingComposer
    extends Composer<_$TestDatabase, $CustomerTableTable> {
  $$CustomerTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get uuid => $composableBuilder(
      column: $table.uuid, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get phone => $composableBuilder(
      column: $table.phone, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get email => $composableBuilder(
      column: $table.email, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get totalPoints => $composableBuilder(
      column: $table.totalPoints, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get lastVisitAt => $composableBuilder(
      column: $table.lastVisitAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isSynced => $composableBuilder(
      column: $table.isSynced, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get version => $composableBuilder(
      column: $table.version, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isDeleted => $composableBuilder(
      column: $table.isDeleted, builder: (column) => ColumnOrderings(column));
}

class $$CustomerTableTableAnnotationComposer
    extends Composer<_$TestDatabase, $CustomerTableTable> {
  $$CustomerTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get uuid =>
      $composableBuilder(column: $table.uuid, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get phone =>
      $composableBuilder(column: $table.phone, builder: (column) => column);

  GeneratedColumn<String> get email =>
      $composableBuilder(column: $table.email, builder: (column) => column);

  GeneratedColumn<double> get totalPoints => $composableBuilder(
      column: $table.totalPoints, builder: (column) => column);

  GeneratedColumn<DateTime> get lastVisitAt => $composableBuilder(
      column: $table.lastVisitAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<bool> get isSynced =>
      $composableBuilder(column: $table.isSynced, builder: (column) => column);

  GeneratedColumn<int> get version =>
      $composableBuilder(column: $table.version, builder: (column) => column);

  GeneratedColumn<bool> get isDeleted =>
      $composableBuilder(column: $table.isDeleted, builder: (column) => column);

  Expression<T> customerFeedbackTableRefs<T extends Object>(
      Expression<T> Function($$CustomerFeedbackTableTableAnnotationComposer a)
          f) {
    final $$CustomerFeedbackTableTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.uuid,
            referencedTable: $db.customerFeedbackTable,
            getReferencedColumn: (t) => t.customerUuid,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$CustomerFeedbackTableTableAnnotationComposer(
                  $db: $db,
                  $table: $db.customerFeedbackTable,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }
}

class $$CustomerTableTableTableManager extends RootTableManager<
    _$TestDatabase,
    $CustomerTableTable,
    CustomerTableData,
    $$CustomerTableTableFilterComposer,
    $$CustomerTableTableOrderingComposer,
    $$CustomerTableTableAnnotationComposer,
    $$CustomerTableTableCreateCompanionBuilder,
    $$CustomerTableTableUpdateCompanionBuilder,
    (CustomerTableData, $$CustomerTableTableReferences),
    CustomerTableData,
    PrefetchHooks Function({bool customerFeedbackTableRefs})> {
  $$CustomerTableTableTableManager(_$TestDatabase db, $CustomerTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CustomerTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CustomerTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CustomerTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> uuid = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String?> phone = const Value.absent(),
            Value<String?> email = const Value.absent(),
            Value<double> totalPoints = const Value.absent(),
            Value<DateTime?> lastVisitAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<bool> isSynced = const Value.absent(),
            Value<int> version = const Value.absent(),
            Value<bool> isDeleted = const Value.absent(),
          }) =>
              CustomerTableCompanion(
            id: id,
            uuid: uuid,
            name: name,
            phone: phone,
            email: email,
            totalPoints: totalPoints,
            lastVisitAt: lastVisitAt,
            updatedAt: updatedAt,
            isSynced: isSynced,
            version: version,
            isDeleted: isDeleted,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String uuid,
            required String name,
            Value<String?> phone = const Value.absent(),
            Value<String?> email = const Value.absent(),
            Value<double> totalPoints = const Value.absent(),
            Value<DateTime?> lastVisitAt = const Value.absent(),
            required DateTime updatedAt,
            Value<bool> isSynced = const Value.absent(),
            Value<int> version = const Value.absent(),
            Value<bool> isDeleted = const Value.absent(),
          }) =>
              CustomerTableCompanion.insert(
            id: id,
            uuid: uuid,
            name: name,
            phone: phone,
            email: email,
            totalPoints: totalPoints,
            lastVisitAt: lastVisitAt,
            updatedAt: updatedAt,
            isSynced: isSynced,
            version: version,
            isDeleted: isDeleted,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$CustomerTableTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({customerFeedbackTableRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (customerFeedbackTableRefs) db.customerFeedbackTable
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (customerFeedbackTableRefs)
                    await $_getPrefetchedData<CustomerTableData,
                            $CustomerTableTable, CustomerFeedbackTableData>(
                        currentTable: table,
                        referencedTable: $$CustomerTableTableReferences
                            ._customerFeedbackTableRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$CustomerTableTableReferences(db, table, p0)
                                .customerFeedbackTableRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.customerUuid == item.uuid),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$CustomerTableTableProcessedTableManager = ProcessedTableManager<
    _$TestDatabase,
    $CustomerTableTable,
    CustomerTableData,
    $$CustomerTableTableFilterComposer,
    $$CustomerTableTableOrderingComposer,
    $$CustomerTableTableAnnotationComposer,
    $$CustomerTableTableCreateCompanionBuilder,
    $$CustomerTableTableUpdateCompanionBuilder,
    (CustomerTableData, $$CustomerTableTableReferences),
    CustomerTableData,
    PrefetchHooks Function({bool customerFeedbackTableRefs})>;
typedef $$CustomerFeedbackTableTableCreateCompanionBuilder
    = CustomerFeedbackTableCompanion Function({
  Value<int> id,
  required String uuid,
  required String orderUuid,
  Value<String?> customerUuid,
  required int rating,
  Value<String> sentiment,
  Value<String?> tags,
  Value<String?> comment,
  Value<bool> isActioned,
  required DateTime createdAt,
});
typedef $$CustomerFeedbackTableTableUpdateCompanionBuilder
    = CustomerFeedbackTableCompanion Function({
  Value<int> id,
  Value<String> uuid,
  Value<String> orderUuid,
  Value<String?> customerUuid,
  Value<int> rating,
  Value<String> sentiment,
  Value<String?> tags,
  Value<String?> comment,
  Value<bool> isActioned,
  Value<DateTime> createdAt,
});

final class $$CustomerFeedbackTableTableReferences extends BaseReferences<
    _$TestDatabase, $CustomerFeedbackTableTable, CustomerFeedbackTableData> {
  $$CustomerFeedbackTableTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $OrderTableTable _orderUuidTable(_$TestDatabase db) =>
      db.orderTable.createAlias($_aliasNameGenerator(
          db.customerFeedbackTable.orderUuid, db.orderTable.uuid));

  $$OrderTableTableProcessedTableManager get orderUuid {
    final $_column = $_itemColumn<String>('order_uuid')!;

    final manager = $$OrderTableTableTableManager($_db, $_db.orderTable)
        .filter((f) => f.uuid.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_orderUuidTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $CustomerTableTable _customerUuidTable(_$TestDatabase db) =>
      db.customerTable.createAlias($_aliasNameGenerator(
          db.customerFeedbackTable.customerUuid, db.customerTable.uuid));

  $$CustomerTableTableProcessedTableManager? get customerUuid {
    final $_column = $_itemColumn<String>('customer_uuid');
    if ($_column == null) return null;
    final manager = $$CustomerTableTableTableManager($_db, $_db.customerTable)
        .filter((f) => f.uuid.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_customerUuidTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$CustomerFeedbackTableTableFilterComposer
    extends Composer<_$TestDatabase, $CustomerFeedbackTableTable> {
  $$CustomerFeedbackTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get uuid => $composableBuilder(
      column: $table.uuid, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get rating => $composableBuilder(
      column: $table.rating, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get sentiment => $composableBuilder(
      column: $table.sentiment, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get tags => $composableBuilder(
      column: $table.tags, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get comment => $composableBuilder(
      column: $table.comment, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isActioned => $composableBuilder(
      column: $table.isActioned, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  $$OrderTableTableFilterComposer get orderUuid {
    final $$OrderTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.orderUuid,
        referencedTable: $db.orderTable,
        getReferencedColumn: (t) => t.uuid,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$OrderTableTableFilterComposer(
              $db: $db,
              $table: $db.orderTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$CustomerTableTableFilterComposer get customerUuid {
    final $$CustomerTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.customerUuid,
        referencedTable: $db.customerTable,
        getReferencedColumn: (t) => t.uuid,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CustomerTableTableFilterComposer(
              $db: $db,
              $table: $db.customerTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$CustomerFeedbackTableTableOrderingComposer
    extends Composer<_$TestDatabase, $CustomerFeedbackTableTable> {
  $$CustomerFeedbackTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get uuid => $composableBuilder(
      column: $table.uuid, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get rating => $composableBuilder(
      column: $table.rating, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get sentiment => $composableBuilder(
      column: $table.sentiment, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get tags => $composableBuilder(
      column: $table.tags, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get comment => $composableBuilder(
      column: $table.comment, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isActioned => $composableBuilder(
      column: $table.isActioned, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  $$OrderTableTableOrderingComposer get orderUuid {
    final $$OrderTableTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.orderUuid,
        referencedTable: $db.orderTable,
        getReferencedColumn: (t) => t.uuid,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$OrderTableTableOrderingComposer(
              $db: $db,
              $table: $db.orderTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$CustomerTableTableOrderingComposer get customerUuid {
    final $$CustomerTableTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.customerUuid,
        referencedTable: $db.customerTable,
        getReferencedColumn: (t) => t.uuid,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CustomerTableTableOrderingComposer(
              $db: $db,
              $table: $db.customerTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$CustomerFeedbackTableTableAnnotationComposer
    extends Composer<_$TestDatabase, $CustomerFeedbackTableTable> {
  $$CustomerFeedbackTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get uuid =>
      $composableBuilder(column: $table.uuid, builder: (column) => column);

  GeneratedColumn<int> get rating =>
      $composableBuilder(column: $table.rating, builder: (column) => column);

  GeneratedColumn<String> get sentiment =>
      $composableBuilder(column: $table.sentiment, builder: (column) => column);

  GeneratedColumn<String> get tags =>
      $composableBuilder(column: $table.tags, builder: (column) => column);

  GeneratedColumn<String> get comment =>
      $composableBuilder(column: $table.comment, builder: (column) => column);

  GeneratedColumn<bool> get isActioned => $composableBuilder(
      column: $table.isActioned, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  $$OrderTableTableAnnotationComposer get orderUuid {
    final $$OrderTableTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.orderUuid,
        referencedTable: $db.orderTable,
        getReferencedColumn: (t) => t.uuid,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$OrderTableTableAnnotationComposer(
              $db: $db,
              $table: $db.orderTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$CustomerTableTableAnnotationComposer get customerUuid {
    final $$CustomerTableTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.customerUuid,
        referencedTable: $db.customerTable,
        getReferencedColumn: (t) => t.uuid,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CustomerTableTableAnnotationComposer(
              $db: $db,
              $table: $db.customerTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$CustomerFeedbackTableTableTableManager extends RootTableManager<
    _$TestDatabase,
    $CustomerFeedbackTableTable,
    CustomerFeedbackTableData,
    $$CustomerFeedbackTableTableFilterComposer,
    $$CustomerFeedbackTableTableOrderingComposer,
    $$CustomerFeedbackTableTableAnnotationComposer,
    $$CustomerFeedbackTableTableCreateCompanionBuilder,
    $$CustomerFeedbackTableTableUpdateCompanionBuilder,
    (CustomerFeedbackTableData, $$CustomerFeedbackTableTableReferences),
    CustomerFeedbackTableData,
    PrefetchHooks Function({bool orderUuid, bool customerUuid})> {
  $$CustomerFeedbackTableTableTableManager(
      _$TestDatabase db, $CustomerFeedbackTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CustomerFeedbackTableTableFilterComposer(
                  $db: db, $table: table),
          createOrderingComposer: () =>
              $$CustomerFeedbackTableTableOrderingComposer(
                  $db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CustomerFeedbackTableTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> uuid = const Value.absent(),
            Value<String> orderUuid = const Value.absent(),
            Value<String?> customerUuid = const Value.absent(),
            Value<int> rating = const Value.absent(),
            Value<String> sentiment = const Value.absent(),
            Value<String?> tags = const Value.absent(),
            Value<String?> comment = const Value.absent(),
            Value<bool> isActioned = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
          }) =>
              CustomerFeedbackTableCompanion(
            id: id,
            uuid: uuid,
            orderUuid: orderUuid,
            customerUuid: customerUuid,
            rating: rating,
            sentiment: sentiment,
            tags: tags,
            comment: comment,
            isActioned: isActioned,
            createdAt: createdAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String uuid,
            required String orderUuid,
            Value<String?> customerUuid = const Value.absent(),
            required int rating,
            Value<String> sentiment = const Value.absent(),
            Value<String?> tags = const Value.absent(),
            Value<String?> comment = const Value.absent(),
            Value<bool> isActioned = const Value.absent(),
            required DateTime createdAt,
          }) =>
              CustomerFeedbackTableCompanion.insert(
            id: id,
            uuid: uuid,
            orderUuid: orderUuid,
            customerUuid: customerUuid,
            rating: rating,
            sentiment: sentiment,
            tags: tags,
            comment: comment,
            isActioned: isActioned,
            createdAt: createdAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$CustomerFeedbackTableTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({orderUuid = false, customerUuid = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (orderUuid) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.orderUuid,
                    referencedTable: $$CustomerFeedbackTableTableReferences
                        ._orderUuidTable(db),
                    referencedColumn: $$CustomerFeedbackTableTableReferences
                        ._orderUuidTable(db)
                        .uuid,
                  ) as T;
                }
                if (customerUuid) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.customerUuid,
                    referencedTable: $$CustomerFeedbackTableTableReferences
                        ._customerUuidTable(db),
                    referencedColumn: $$CustomerFeedbackTableTableReferences
                        ._customerUuidTable(db)
                        .uuid,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$CustomerFeedbackTableTableProcessedTableManager
    = ProcessedTableManager<
        _$TestDatabase,
        $CustomerFeedbackTableTable,
        CustomerFeedbackTableData,
        $$CustomerFeedbackTableTableFilterComposer,
        $$CustomerFeedbackTableTableOrderingComposer,
        $$CustomerFeedbackTableTableAnnotationComposer,
        $$CustomerFeedbackTableTableCreateCompanionBuilder,
        $$CustomerFeedbackTableTableUpdateCompanionBuilder,
        (CustomerFeedbackTableData, $$CustomerFeedbackTableTableReferences),
        CustomerFeedbackTableData,
        PrefetchHooks Function({bool orderUuid, bool customerUuid})>;

class $TestDatabaseManager {
  final _$TestDatabase _db;
  $TestDatabaseManager(this._db);
  $$CategoryTableTableTableManager get categoryTable =>
      $$CategoryTableTableTableManager(_db, _db.categoryTable);
  $$InventoryLedgerTableTableTableManager get inventoryLedgerTable =>
      $$InventoryLedgerTableTableTableManager(_db, _db.inventoryLedgerTable);
  $$TimeEntryTableTableTableManager get timeEntryTable =>
      $$TimeEntryTableTableTableManager(_db, _db.timeEntryTable);
  $$GiftCardTableTableTableManager get giftCardTable =>
      $$GiftCardTableTableTableManager(_db, _db.giftCardTable);
  $$LoyaltyProgramTableTableTableManager get loyaltyProgramTable =>
      $$LoyaltyProgramTableTableTableManager(_db, _db.loyaltyProgramTable);
  $$LoyaltyMemberTableTableTableManager get loyaltyMemberTable =>
      $$LoyaltyMemberTableTableTableManager(_db, _db.loyaltyMemberTable);
  $$LoyaltyTransactionTableTableTableManager get loyaltyTransactionTable =>
      $$LoyaltyTransactionTableTableTableManager(
          _db, _db.loyaltyTransactionTable);
  $$LoyaltyRewardTableTableTableManager get loyaltyRewardTable =>
      $$LoyaltyRewardTableTableTableManager(_db, _db.loyaltyRewardTable);
  $$TipTableTableTableManager get tipTable =>
      $$TipTableTableTableManager(_db, _db.tipTable);
  $$SplitBillTableTableTableManager get splitBillTable =>
      $$SplitBillTableTableTableManager(_db, _db.splitBillTable);
  $$DiscountTableTableTableManager get discountTable =>
      $$DiscountTableTableTableManager(_db, _db.discountTable);
  $$WaitlistTableTableTableManager get waitlistTable =>
      $$WaitlistTableTableTableManager(_db, _db.waitlistTable);
  $$StaffAlertTableTableTableManager get staffAlertTable =>
      $$StaffAlertTableTableTableManager(_db, _db.staffAlertTable);
  $$KitchenTicketTableTableTableManager get kitchenTicketTable =>
      $$KitchenTicketTableTableTableManager(_db, _db.kitchenTicketTable);
  $$OrderTableTableTableManager get orderTable =>
      $$OrderTableTableTableManager(_db, _db.orderTable);
  $$CustomerTableTableTableManager get customerTable =>
      $$CustomerTableTableTableManager(_db, _db.customerTable);
  $$CustomerFeedbackTableTableTableManager get customerFeedbackTable =>
      $$CustomerFeedbackTableTableTableManager(_db, _db.customerFeedbackTable);
}
