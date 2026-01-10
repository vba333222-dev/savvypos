// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $TenantConfigTableTable extends TenantConfigTable
    with TableInfo<$TenantConfigTableTable, TenantConfigTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TenantConfigTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _tenantIdMeta =
      const VerificationMeta('tenantId');
  @override
  late final GeneratedColumn<String> tenantId = GeneratedColumn<String>(
      'tenant_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'));
  static const VerificationMeta _outletNameMeta =
      const VerificationMeta('outletName');
  @override
  late final GeneratedColumn<String> outletName = GeneratedColumn<String>(
      'outlet_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _addressMeta =
      const VerificationMeta('address');
  @override
  late final GeneratedColumn<String> address = GeneratedColumn<String>(
      'address', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _currencySymbolMeta =
      const VerificationMeta('currencySymbol');
  @override
  late final GeneratedColumn<String> currencySymbol = GeneratedColumn<String>(
      'currency_symbol', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _tierMeta = const VerificationMeta('tier');
  @override
  late final GeneratedColumn<int> tier = GeneratedColumn<int>(
      'tier', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _subscriptionExpiryMeta =
      const VerificationMeta('subscriptionExpiry');
  @override
  late final GeneratedColumn<DateTime> subscriptionExpiry =
      GeneratedColumn<DateTime>('subscription_expiry', aliasedName, true,
          type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _isAdsEnabledMeta =
      const VerificationMeta('isAdsEnabled');
  @override
  late final GeneratedColumn<bool> isAdsEnabled = GeneratedColumn<bool>(
      'is_ads_enabled', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("is_ads_enabled" IN (0, 1))'));
  static const VerificationMeta _managerPinHashMeta =
      const VerificationMeta('managerPinHash');
  @override
  late final GeneratedColumn<String> managerPinHash = GeneratedColumn<String>(
      'manager_pin_hash', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        tenantId,
        outletName,
        address,
        currencySymbol,
        tier,
        subscriptionExpiry,
        isAdsEnabled,
        managerPinHash,
        updatedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'tenant_config_table';
  @override
  VerificationContext validateIntegrity(
      Insertable<TenantConfigTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('tenant_id')) {
      context.handle(_tenantIdMeta,
          tenantId.isAcceptableOrUnknown(data['tenant_id']!, _tenantIdMeta));
    } else if (isInserting) {
      context.missing(_tenantIdMeta);
    }
    if (data.containsKey('outlet_name')) {
      context.handle(
          _outletNameMeta,
          outletName.isAcceptableOrUnknown(
              data['outlet_name']!, _outletNameMeta));
    } else if (isInserting) {
      context.missing(_outletNameMeta);
    }
    if (data.containsKey('address')) {
      context.handle(_addressMeta,
          address.isAcceptableOrUnknown(data['address']!, _addressMeta));
    } else if (isInserting) {
      context.missing(_addressMeta);
    }
    if (data.containsKey('currency_symbol')) {
      context.handle(
          _currencySymbolMeta,
          currencySymbol.isAcceptableOrUnknown(
              data['currency_symbol']!, _currencySymbolMeta));
    } else if (isInserting) {
      context.missing(_currencySymbolMeta);
    }
    if (data.containsKey('tier')) {
      context.handle(
          _tierMeta, tier.isAcceptableOrUnknown(data['tier']!, _tierMeta));
    } else if (isInserting) {
      context.missing(_tierMeta);
    }
    if (data.containsKey('subscription_expiry')) {
      context.handle(
          _subscriptionExpiryMeta,
          subscriptionExpiry.isAcceptableOrUnknown(
              data['subscription_expiry']!, _subscriptionExpiryMeta));
    }
    if (data.containsKey('is_ads_enabled')) {
      context.handle(
          _isAdsEnabledMeta,
          isAdsEnabled.isAcceptableOrUnknown(
              data['is_ads_enabled']!, _isAdsEnabledMeta));
    } else if (isInserting) {
      context.missing(_isAdsEnabledMeta);
    }
    if (data.containsKey('manager_pin_hash')) {
      context.handle(
          _managerPinHashMeta,
          managerPinHash.isAcceptableOrUnknown(
              data['manager_pin_hash']!, _managerPinHashMeta));
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
  TenantConfigTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TenantConfigTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      tenantId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}tenant_id'])!,
      outletName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}outlet_name'])!,
      address: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}address'])!,
      currencySymbol: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}currency_symbol'])!,
      tier: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}tier'])!,
      subscriptionExpiry: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}subscription_expiry']),
      isAdsEnabled: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_ads_enabled'])!,
      managerPinHash: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}manager_pin_hash']),
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
    );
  }

  @override
  $TenantConfigTableTable createAlias(String alias) {
    return $TenantConfigTableTable(attachedDatabase, alias);
  }
}

class TenantConfigTableData extends DataClass
    implements Insertable<TenantConfigTableData> {
  final int id;
  final String tenantId;
  final String outletName;
  final String address;
  final String currencySymbol;
  final int tier;
  final DateTime? subscriptionExpiry;
  final bool isAdsEnabled;
  final String? managerPinHash;
  final DateTime updatedAt;
  const TenantConfigTableData(
      {required this.id,
      required this.tenantId,
      required this.outletName,
      required this.address,
      required this.currencySymbol,
      required this.tier,
      this.subscriptionExpiry,
      required this.isAdsEnabled,
      this.managerPinHash,
      required this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['tenant_id'] = Variable<String>(tenantId);
    map['outlet_name'] = Variable<String>(outletName);
    map['address'] = Variable<String>(address);
    map['currency_symbol'] = Variable<String>(currencySymbol);
    map['tier'] = Variable<int>(tier);
    if (!nullToAbsent || subscriptionExpiry != null) {
      map['subscription_expiry'] = Variable<DateTime>(subscriptionExpiry);
    }
    map['is_ads_enabled'] = Variable<bool>(isAdsEnabled);
    if (!nullToAbsent || managerPinHash != null) {
      map['manager_pin_hash'] = Variable<String>(managerPinHash);
    }
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  TenantConfigTableCompanion toCompanion(bool nullToAbsent) {
    return TenantConfigTableCompanion(
      id: Value(id),
      tenantId: Value(tenantId),
      outletName: Value(outletName),
      address: Value(address),
      currencySymbol: Value(currencySymbol),
      tier: Value(tier),
      subscriptionExpiry: subscriptionExpiry == null && nullToAbsent
          ? const Value.absent()
          : Value(subscriptionExpiry),
      isAdsEnabled: Value(isAdsEnabled),
      managerPinHash: managerPinHash == null && nullToAbsent
          ? const Value.absent()
          : Value(managerPinHash),
      updatedAt: Value(updatedAt),
    );
  }

  factory TenantConfigTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TenantConfigTableData(
      id: serializer.fromJson<int>(json['id']),
      tenantId: serializer.fromJson<String>(json['tenantId']),
      outletName: serializer.fromJson<String>(json['outletName']),
      address: serializer.fromJson<String>(json['address']),
      currencySymbol: serializer.fromJson<String>(json['currencySymbol']),
      tier: serializer.fromJson<int>(json['tier']),
      subscriptionExpiry:
          serializer.fromJson<DateTime?>(json['subscriptionExpiry']),
      isAdsEnabled: serializer.fromJson<bool>(json['isAdsEnabled']),
      managerPinHash: serializer.fromJson<String?>(json['managerPinHash']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'tenantId': serializer.toJson<String>(tenantId),
      'outletName': serializer.toJson<String>(outletName),
      'address': serializer.toJson<String>(address),
      'currencySymbol': serializer.toJson<String>(currencySymbol),
      'tier': serializer.toJson<int>(tier),
      'subscriptionExpiry': serializer.toJson<DateTime?>(subscriptionExpiry),
      'isAdsEnabled': serializer.toJson<bool>(isAdsEnabled),
      'managerPinHash': serializer.toJson<String?>(managerPinHash),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  TenantConfigTableData copyWith(
          {int? id,
          String? tenantId,
          String? outletName,
          String? address,
          String? currencySymbol,
          int? tier,
          Value<DateTime?> subscriptionExpiry = const Value.absent(),
          bool? isAdsEnabled,
          Value<String?> managerPinHash = const Value.absent(),
          DateTime? updatedAt}) =>
      TenantConfigTableData(
        id: id ?? this.id,
        tenantId: tenantId ?? this.tenantId,
        outletName: outletName ?? this.outletName,
        address: address ?? this.address,
        currencySymbol: currencySymbol ?? this.currencySymbol,
        tier: tier ?? this.tier,
        subscriptionExpiry: subscriptionExpiry.present
            ? subscriptionExpiry.value
            : this.subscriptionExpiry,
        isAdsEnabled: isAdsEnabled ?? this.isAdsEnabled,
        managerPinHash:
            managerPinHash.present ? managerPinHash.value : this.managerPinHash,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  TenantConfigTableData copyWithCompanion(TenantConfigTableCompanion data) {
    return TenantConfigTableData(
      id: data.id.present ? data.id.value : this.id,
      tenantId: data.tenantId.present ? data.tenantId.value : this.tenantId,
      outletName:
          data.outletName.present ? data.outletName.value : this.outletName,
      address: data.address.present ? data.address.value : this.address,
      currencySymbol: data.currencySymbol.present
          ? data.currencySymbol.value
          : this.currencySymbol,
      tier: data.tier.present ? data.tier.value : this.tier,
      subscriptionExpiry: data.subscriptionExpiry.present
          ? data.subscriptionExpiry.value
          : this.subscriptionExpiry,
      isAdsEnabled: data.isAdsEnabled.present
          ? data.isAdsEnabled.value
          : this.isAdsEnabled,
      managerPinHash: data.managerPinHash.present
          ? data.managerPinHash.value
          : this.managerPinHash,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TenantConfigTableData(')
          ..write('id: $id, ')
          ..write('tenantId: $tenantId, ')
          ..write('outletName: $outletName, ')
          ..write('address: $address, ')
          ..write('currencySymbol: $currencySymbol, ')
          ..write('tier: $tier, ')
          ..write('subscriptionExpiry: $subscriptionExpiry, ')
          ..write('isAdsEnabled: $isAdsEnabled, ')
          ..write('managerPinHash: $managerPinHash, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      tenantId,
      outletName,
      address,
      currencySymbol,
      tier,
      subscriptionExpiry,
      isAdsEnabled,
      managerPinHash,
      updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TenantConfigTableData &&
          other.id == this.id &&
          other.tenantId == this.tenantId &&
          other.outletName == this.outletName &&
          other.address == this.address &&
          other.currencySymbol == this.currencySymbol &&
          other.tier == this.tier &&
          other.subscriptionExpiry == this.subscriptionExpiry &&
          other.isAdsEnabled == this.isAdsEnabled &&
          other.managerPinHash == this.managerPinHash &&
          other.updatedAt == this.updatedAt);
}

class TenantConfigTableCompanion
    extends UpdateCompanion<TenantConfigTableData> {
  final Value<int> id;
  final Value<String> tenantId;
  final Value<String> outletName;
  final Value<String> address;
  final Value<String> currencySymbol;
  final Value<int> tier;
  final Value<DateTime?> subscriptionExpiry;
  final Value<bool> isAdsEnabled;
  final Value<String?> managerPinHash;
  final Value<DateTime> updatedAt;
  const TenantConfigTableCompanion({
    this.id = const Value.absent(),
    this.tenantId = const Value.absent(),
    this.outletName = const Value.absent(),
    this.address = const Value.absent(),
    this.currencySymbol = const Value.absent(),
    this.tier = const Value.absent(),
    this.subscriptionExpiry = const Value.absent(),
    this.isAdsEnabled = const Value.absent(),
    this.managerPinHash = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  TenantConfigTableCompanion.insert({
    this.id = const Value.absent(),
    required String tenantId,
    required String outletName,
    required String address,
    required String currencySymbol,
    required int tier,
    this.subscriptionExpiry = const Value.absent(),
    required bool isAdsEnabled,
    this.managerPinHash = const Value.absent(),
    required DateTime updatedAt,
  })  : tenantId = Value(tenantId),
        outletName = Value(outletName),
        address = Value(address),
        currencySymbol = Value(currencySymbol),
        tier = Value(tier),
        isAdsEnabled = Value(isAdsEnabled),
        updatedAt = Value(updatedAt);
  static Insertable<TenantConfigTableData> custom({
    Expression<int>? id,
    Expression<String>? tenantId,
    Expression<String>? outletName,
    Expression<String>? address,
    Expression<String>? currencySymbol,
    Expression<int>? tier,
    Expression<DateTime>? subscriptionExpiry,
    Expression<bool>? isAdsEnabled,
    Expression<String>? managerPinHash,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (tenantId != null) 'tenant_id': tenantId,
      if (outletName != null) 'outlet_name': outletName,
      if (address != null) 'address': address,
      if (currencySymbol != null) 'currency_symbol': currencySymbol,
      if (tier != null) 'tier': tier,
      if (subscriptionExpiry != null) 'subscription_expiry': subscriptionExpiry,
      if (isAdsEnabled != null) 'is_ads_enabled': isAdsEnabled,
      if (managerPinHash != null) 'manager_pin_hash': managerPinHash,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  TenantConfigTableCompanion copyWith(
      {Value<int>? id,
      Value<String>? tenantId,
      Value<String>? outletName,
      Value<String>? address,
      Value<String>? currencySymbol,
      Value<int>? tier,
      Value<DateTime?>? subscriptionExpiry,
      Value<bool>? isAdsEnabled,
      Value<String?>? managerPinHash,
      Value<DateTime>? updatedAt}) {
    return TenantConfigTableCompanion(
      id: id ?? this.id,
      tenantId: tenantId ?? this.tenantId,
      outletName: outletName ?? this.outletName,
      address: address ?? this.address,
      currencySymbol: currencySymbol ?? this.currencySymbol,
      tier: tier ?? this.tier,
      subscriptionExpiry: subscriptionExpiry ?? this.subscriptionExpiry,
      isAdsEnabled: isAdsEnabled ?? this.isAdsEnabled,
      managerPinHash: managerPinHash ?? this.managerPinHash,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (tenantId.present) {
      map['tenant_id'] = Variable<String>(tenantId.value);
    }
    if (outletName.present) {
      map['outlet_name'] = Variable<String>(outletName.value);
    }
    if (address.present) {
      map['address'] = Variable<String>(address.value);
    }
    if (currencySymbol.present) {
      map['currency_symbol'] = Variable<String>(currencySymbol.value);
    }
    if (tier.present) {
      map['tier'] = Variable<int>(tier.value);
    }
    if (subscriptionExpiry.present) {
      map['subscription_expiry'] = Variable<DateTime>(subscriptionExpiry.value);
    }
    if (isAdsEnabled.present) {
      map['is_ads_enabled'] = Variable<bool>(isAdsEnabled.value);
    }
    if (managerPinHash.present) {
      map['manager_pin_hash'] = Variable<String>(managerPinHash.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TenantConfigTableCompanion(')
          ..write('id: $id, ')
          ..write('tenantId: $tenantId, ')
          ..write('outletName: $outletName, ')
          ..write('address: $address, ')
          ..write('currencySymbol: $currencySymbol, ')
          ..write('tier: $tier, ')
          ..write('subscriptionExpiry: $subscriptionExpiry, ')
          ..write('isAdsEnabled: $isAdsEnabled, ')
          ..write('managerPinHash: $managerPinHash, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

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

class $ProductTableTable extends ProductTable
    with TableInfo<$ProductTableTable, ProductTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProductTableTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _skuMeta = const VerificationMeta('sku');
  @override
  late final GeneratedColumn<String> sku = GeneratedColumn<String>(
      'sku', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _barcodeMeta =
      const VerificationMeta('barcode');
  @override
  late final GeneratedColumn<String> barcode = GeneratedColumn<String>(
      'barcode', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _priceMeta = const VerificationMeta('price');
  @override
  late final GeneratedColumn<double> price = GeneratedColumn<double>(
      'price', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _costPriceMeta =
      const VerificationMeta('costPrice');
  @override
  late final GeneratedColumn<double> costPrice = GeneratedColumn<double>(
      'cost_price', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _categoryIdMeta =
      const VerificationMeta('categoryId');
  @override
  late final GeneratedColumn<String> categoryId = GeneratedColumn<String>(
      'category_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _trackStockMeta =
      const VerificationMeta('trackStock');
  @override
  late final GeneratedColumn<bool> trackStock = GeneratedColumn<bool>(
      'track_stock', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("track_stock" IN (0, 1))'));
  static const VerificationMeta _isServiceMeta =
      const VerificationMeta('isService');
  @override
  late final GeneratedColumn<bool> isService = GeneratedColumn<bool>(
      'is_service', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_service" IN (0, 1))'));
  static const VerificationMeta _colorHexMeta =
      const VerificationMeta('colorHex');
  @override
  late final GeneratedColumn<String> colorHex = GeneratedColumn<String>(
      'color_hex', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _imageUrlMeta =
      const VerificationMeta('imageUrl');
  @override
  late final GeneratedColumn<String> imageUrl = GeneratedColumn<String>(
      'image_url', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _printerCategoryMeta =
      const VerificationMeta('printerCategory');
  @override
  late final GeneratedColumn<String> printerCategory = GeneratedColumn<String>(
      'printer_category', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('OTHER'));
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
  static const VerificationMeta _isCompositeMeta =
      const VerificationMeta('isComposite');
  @override
  late final GeneratedColumn<bool> isComposite = GeneratedColumn<bool>(
      'is_composite', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("is_composite" IN (0, 1))'),
      defaultValue: const Constant(false));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        uuid,
        name,
        sku,
        barcode,
        price,
        costPrice,
        categoryId,
        trackStock,
        isService,
        colorHex,
        imageUrl,
        printerCategory,
        updatedAt,
        isSynced,
        version,
        isDeleted,
        isComposite
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'product_table';
  @override
  VerificationContext validateIntegrity(Insertable<ProductTableData> instance,
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
    if (data.containsKey('sku')) {
      context.handle(
          _skuMeta, sku.isAcceptableOrUnknown(data['sku']!, _skuMeta));
    }
    if (data.containsKey('barcode')) {
      context.handle(_barcodeMeta,
          barcode.isAcceptableOrUnknown(data['barcode']!, _barcodeMeta));
    }
    if (data.containsKey('price')) {
      context.handle(
          _priceMeta, price.isAcceptableOrUnknown(data['price']!, _priceMeta));
    } else if (isInserting) {
      context.missing(_priceMeta);
    }
    if (data.containsKey('cost_price')) {
      context.handle(_costPriceMeta,
          costPrice.isAcceptableOrUnknown(data['cost_price']!, _costPriceMeta));
    }
    if (data.containsKey('category_id')) {
      context.handle(
          _categoryIdMeta,
          categoryId.isAcceptableOrUnknown(
              data['category_id']!, _categoryIdMeta));
    } else if (isInserting) {
      context.missing(_categoryIdMeta);
    }
    if (data.containsKey('track_stock')) {
      context.handle(
          _trackStockMeta,
          trackStock.isAcceptableOrUnknown(
              data['track_stock']!, _trackStockMeta));
    } else if (isInserting) {
      context.missing(_trackStockMeta);
    }
    if (data.containsKey('is_service')) {
      context.handle(_isServiceMeta,
          isService.isAcceptableOrUnknown(data['is_service']!, _isServiceMeta));
    } else if (isInserting) {
      context.missing(_isServiceMeta);
    }
    if (data.containsKey('color_hex')) {
      context.handle(_colorHexMeta,
          colorHex.isAcceptableOrUnknown(data['color_hex']!, _colorHexMeta));
    }
    if (data.containsKey('image_url')) {
      context.handle(_imageUrlMeta,
          imageUrl.isAcceptableOrUnknown(data['image_url']!, _imageUrlMeta));
    }
    if (data.containsKey('printer_category')) {
      context.handle(
          _printerCategoryMeta,
          printerCategory.isAcceptableOrUnknown(
              data['printer_category']!, _printerCategoryMeta));
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
    if (data.containsKey('is_composite')) {
      context.handle(
          _isCompositeMeta,
          isComposite.isAcceptableOrUnknown(
              data['is_composite']!, _isCompositeMeta));
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
  ProductTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ProductTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      uuid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}uuid'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      sku: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}sku']),
      barcode: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}barcode']),
      price: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}price'])!,
      costPrice: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}cost_price']),
      categoryId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}category_id'])!,
      trackStock: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}track_stock'])!,
      isService: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_service'])!,
      colorHex: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}color_hex']),
      imageUrl: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}image_url']),
      printerCategory: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}printer_category'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
      isSynced: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_synced'])!,
      version: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}version'])!,
      isDeleted: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_deleted'])!,
      isComposite: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_composite'])!,
    );
  }

  @override
  $ProductTableTable createAlias(String alias) {
    return $ProductTableTable(attachedDatabase, alias);
  }
}

class ProductTableData extends DataClass
    implements Insertable<ProductTableData> {
  final int id;
  final String uuid;
  final String name;
  final String? sku;
  final String? barcode;
  final double price;
  final double? costPrice;
  final String categoryId;
  final bool trackStock;
  final bool isService;
  final String? colorHex;
  final String? imageUrl;
  final String printerCategory;
  final DateTime updatedAt;
  final bool isSynced;
  final int version;
  final bool isDeleted;
  final bool isComposite;
  const ProductTableData(
      {required this.id,
      required this.uuid,
      required this.name,
      this.sku,
      this.barcode,
      required this.price,
      this.costPrice,
      required this.categoryId,
      required this.trackStock,
      required this.isService,
      this.colorHex,
      this.imageUrl,
      required this.printerCategory,
      required this.updatedAt,
      required this.isSynced,
      required this.version,
      required this.isDeleted,
      required this.isComposite});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['uuid'] = Variable<String>(uuid);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || sku != null) {
      map['sku'] = Variable<String>(sku);
    }
    if (!nullToAbsent || barcode != null) {
      map['barcode'] = Variable<String>(barcode);
    }
    map['price'] = Variable<double>(price);
    if (!nullToAbsent || costPrice != null) {
      map['cost_price'] = Variable<double>(costPrice);
    }
    map['category_id'] = Variable<String>(categoryId);
    map['track_stock'] = Variable<bool>(trackStock);
    map['is_service'] = Variable<bool>(isService);
    if (!nullToAbsent || colorHex != null) {
      map['color_hex'] = Variable<String>(colorHex);
    }
    if (!nullToAbsent || imageUrl != null) {
      map['image_url'] = Variable<String>(imageUrl);
    }
    map['printer_category'] = Variable<String>(printerCategory);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['is_synced'] = Variable<bool>(isSynced);
    map['version'] = Variable<int>(version);
    map['is_deleted'] = Variable<bool>(isDeleted);
    map['is_composite'] = Variable<bool>(isComposite);
    return map;
  }

  ProductTableCompanion toCompanion(bool nullToAbsent) {
    return ProductTableCompanion(
      id: Value(id),
      uuid: Value(uuid),
      name: Value(name),
      sku: sku == null && nullToAbsent ? const Value.absent() : Value(sku),
      barcode: barcode == null && nullToAbsent
          ? const Value.absent()
          : Value(barcode),
      price: Value(price),
      costPrice: costPrice == null && nullToAbsent
          ? const Value.absent()
          : Value(costPrice),
      categoryId: Value(categoryId),
      trackStock: Value(trackStock),
      isService: Value(isService),
      colorHex: colorHex == null && nullToAbsent
          ? const Value.absent()
          : Value(colorHex),
      imageUrl: imageUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(imageUrl),
      printerCategory: Value(printerCategory),
      updatedAt: Value(updatedAt),
      isSynced: Value(isSynced),
      version: Value(version),
      isDeleted: Value(isDeleted),
      isComposite: Value(isComposite),
    );
  }

  factory ProductTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ProductTableData(
      id: serializer.fromJson<int>(json['id']),
      uuid: serializer.fromJson<String>(json['uuid']),
      name: serializer.fromJson<String>(json['name']),
      sku: serializer.fromJson<String?>(json['sku']),
      barcode: serializer.fromJson<String?>(json['barcode']),
      price: serializer.fromJson<double>(json['price']),
      costPrice: serializer.fromJson<double?>(json['costPrice']),
      categoryId: serializer.fromJson<String>(json['categoryId']),
      trackStock: serializer.fromJson<bool>(json['trackStock']),
      isService: serializer.fromJson<bool>(json['isService']),
      colorHex: serializer.fromJson<String?>(json['colorHex']),
      imageUrl: serializer.fromJson<String?>(json['imageUrl']),
      printerCategory: serializer.fromJson<String>(json['printerCategory']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      isSynced: serializer.fromJson<bool>(json['isSynced']),
      version: serializer.fromJson<int>(json['version']),
      isDeleted: serializer.fromJson<bool>(json['isDeleted']),
      isComposite: serializer.fromJson<bool>(json['isComposite']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'uuid': serializer.toJson<String>(uuid),
      'name': serializer.toJson<String>(name),
      'sku': serializer.toJson<String?>(sku),
      'barcode': serializer.toJson<String?>(barcode),
      'price': serializer.toJson<double>(price),
      'costPrice': serializer.toJson<double?>(costPrice),
      'categoryId': serializer.toJson<String>(categoryId),
      'trackStock': serializer.toJson<bool>(trackStock),
      'isService': serializer.toJson<bool>(isService),
      'colorHex': serializer.toJson<String?>(colorHex),
      'imageUrl': serializer.toJson<String?>(imageUrl),
      'printerCategory': serializer.toJson<String>(printerCategory),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'isSynced': serializer.toJson<bool>(isSynced),
      'version': serializer.toJson<int>(version),
      'isDeleted': serializer.toJson<bool>(isDeleted),
      'isComposite': serializer.toJson<bool>(isComposite),
    };
  }

  ProductTableData copyWith(
          {int? id,
          String? uuid,
          String? name,
          Value<String?> sku = const Value.absent(),
          Value<String?> barcode = const Value.absent(),
          double? price,
          Value<double?> costPrice = const Value.absent(),
          String? categoryId,
          bool? trackStock,
          bool? isService,
          Value<String?> colorHex = const Value.absent(),
          Value<String?> imageUrl = const Value.absent(),
          String? printerCategory,
          DateTime? updatedAt,
          bool? isSynced,
          int? version,
          bool? isDeleted,
          bool? isComposite}) =>
      ProductTableData(
        id: id ?? this.id,
        uuid: uuid ?? this.uuid,
        name: name ?? this.name,
        sku: sku.present ? sku.value : this.sku,
        barcode: barcode.present ? barcode.value : this.barcode,
        price: price ?? this.price,
        costPrice: costPrice.present ? costPrice.value : this.costPrice,
        categoryId: categoryId ?? this.categoryId,
        trackStock: trackStock ?? this.trackStock,
        isService: isService ?? this.isService,
        colorHex: colorHex.present ? colorHex.value : this.colorHex,
        imageUrl: imageUrl.present ? imageUrl.value : this.imageUrl,
        printerCategory: printerCategory ?? this.printerCategory,
        updatedAt: updatedAt ?? this.updatedAt,
        isSynced: isSynced ?? this.isSynced,
        version: version ?? this.version,
        isDeleted: isDeleted ?? this.isDeleted,
        isComposite: isComposite ?? this.isComposite,
      );
  ProductTableData copyWithCompanion(ProductTableCompanion data) {
    return ProductTableData(
      id: data.id.present ? data.id.value : this.id,
      uuid: data.uuid.present ? data.uuid.value : this.uuid,
      name: data.name.present ? data.name.value : this.name,
      sku: data.sku.present ? data.sku.value : this.sku,
      barcode: data.barcode.present ? data.barcode.value : this.barcode,
      price: data.price.present ? data.price.value : this.price,
      costPrice: data.costPrice.present ? data.costPrice.value : this.costPrice,
      categoryId:
          data.categoryId.present ? data.categoryId.value : this.categoryId,
      trackStock:
          data.trackStock.present ? data.trackStock.value : this.trackStock,
      isService: data.isService.present ? data.isService.value : this.isService,
      colorHex: data.colorHex.present ? data.colorHex.value : this.colorHex,
      imageUrl: data.imageUrl.present ? data.imageUrl.value : this.imageUrl,
      printerCategory: data.printerCategory.present
          ? data.printerCategory.value
          : this.printerCategory,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      isSynced: data.isSynced.present ? data.isSynced.value : this.isSynced,
      version: data.version.present ? data.version.value : this.version,
      isDeleted: data.isDeleted.present ? data.isDeleted.value : this.isDeleted,
      isComposite:
          data.isComposite.present ? data.isComposite.value : this.isComposite,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ProductTableData(')
          ..write('id: $id, ')
          ..write('uuid: $uuid, ')
          ..write('name: $name, ')
          ..write('sku: $sku, ')
          ..write('barcode: $barcode, ')
          ..write('price: $price, ')
          ..write('costPrice: $costPrice, ')
          ..write('categoryId: $categoryId, ')
          ..write('trackStock: $trackStock, ')
          ..write('isService: $isService, ')
          ..write('colorHex: $colorHex, ')
          ..write('imageUrl: $imageUrl, ')
          ..write('printerCategory: $printerCategory, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('isSynced: $isSynced, ')
          ..write('version: $version, ')
          ..write('isDeleted: $isDeleted, ')
          ..write('isComposite: $isComposite')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      uuid,
      name,
      sku,
      barcode,
      price,
      costPrice,
      categoryId,
      trackStock,
      isService,
      colorHex,
      imageUrl,
      printerCategory,
      updatedAt,
      isSynced,
      version,
      isDeleted,
      isComposite);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ProductTableData &&
          other.id == this.id &&
          other.uuid == this.uuid &&
          other.name == this.name &&
          other.sku == this.sku &&
          other.barcode == this.barcode &&
          other.price == this.price &&
          other.costPrice == this.costPrice &&
          other.categoryId == this.categoryId &&
          other.trackStock == this.trackStock &&
          other.isService == this.isService &&
          other.colorHex == this.colorHex &&
          other.imageUrl == this.imageUrl &&
          other.printerCategory == this.printerCategory &&
          other.updatedAt == this.updatedAt &&
          other.isSynced == this.isSynced &&
          other.version == this.version &&
          other.isDeleted == this.isDeleted &&
          other.isComposite == this.isComposite);
}

class ProductTableCompanion extends UpdateCompanion<ProductTableData> {
  final Value<int> id;
  final Value<String> uuid;
  final Value<String> name;
  final Value<String?> sku;
  final Value<String?> barcode;
  final Value<double> price;
  final Value<double?> costPrice;
  final Value<String> categoryId;
  final Value<bool> trackStock;
  final Value<bool> isService;
  final Value<String?> colorHex;
  final Value<String?> imageUrl;
  final Value<String> printerCategory;
  final Value<DateTime> updatedAt;
  final Value<bool> isSynced;
  final Value<int> version;
  final Value<bool> isDeleted;
  final Value<bool> isComposite;
  const ProductTableCompanion({
    this.id = const Value.absent(),
    this.uuid = const Value.absent(),
    this.name = const Value.absent(),
    this.sku = const Value.absent(),
    this.barcode = const Value.absent(),
    this.price = const Value.absent(),
    this.costPrice = const Value.absent(),
    this.categoryId = const Value.absent(),
    this.trackStock = const Value.absent(),
    this.isService = const Value.absent(),
    this.colorHex = const Value.absent(),
    this.imageUrl = const Value.absent(),
    this.printerCategory = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.isSynced = const Value.absent(),
    this.version = const Value.absent(),
    this.isDeleted = const Value.absent(),
    this.isComposite = const Value.absent(),
  });
  ProductTableCompanion.insert({
    this.id = const Value.absent(),
    required String uuid,
    required String name,
    this.sku = const Value.absent(),
    this.barcode = const Value.absent(),
    required double price,
    this.costPrice = const Value.absent(),
    required String categoryId,
    required bool trackStock,
    required bool isService,
    this.colorHex = const Value.absent(),
    this.imageUrl = const Value.absent(),
    this.printerCategory = const Value.absent(),
    required DateTime updatedAt,
    this.isSynced = const Value.absent(),
    this.version = const Value.absent(),
    this.isDeleted = const Value.absent(),
    this.isComposite = const Value.absent(),
  })  : uuid = Value(uuid),
        name = Value(name),
        price = Value(price),
        categoryId = Value(categoryId),
        trackStock = Value(trackStock),
        isService = Value(isService),
        updatedAt = Value(updatedAt);
  static Insertable<ProductTableData> custom({
    Expression<int>? id,
    Expression<String>? uuid,
    Expression<String>? name,
    Expression<String>? sku,
    Expression<String>? barcode,
    Expression<double>? price,
    Expression<double>? costPrice,
    Expression<String>? categoryId,
    Expression<bool>? trackStock,
    Expression<bool>? isService,
    Expression<String>? colorHex,
    Expression<String>? imageUrl,
    Expression<String>? printerCategory,
    Expression<DateTime>? updatedAt,
    Expression<bool>? isSynced,
    Expression<int>? version,
    Expression<bool>? isDeleted,
    Expression<bool>? isComposite,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (uuid != null) 'uuid': uuid,
      if (name != null) 'name': name,
      if (sku != null) 'sku': sku,
      if (barcode != null) 'barcode': barcode,
      if (price != null) 'price': price,
      if (costPrice != null) 'cost_price': costPrice,
      if (categoryId != null) 'category_id': categoryId,
      if (trackStock != null) 'track_stock': trackStock,
      if (isService != null) 'is_service': isService,
      if (colorHex != null) 'color_hex': colorHex,
      if (imageUrl != null) 'image_url': imageUrl,
      if (printerCategory != null) 'printer_category': printerCategory,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (isSynced != null) 'is_synced': isSynced,
      if (version != null) 'version': version,
      if (isDeleted != null) 'is_deleted': isDeleted,
      if (isComposite != null) 'is_composite': isComposite,
    });
  }

  ProductTableCompanion copyWith(
      {Value<int>? id,
      Value<String>? uuid,
      Value<String>? name,
      Value<String?>? sku,
      Value<String?>? barcode,
      Value<double>? price,
      Value<double?>? costPrice,
      Value<String>? categoryId,
      Value<bool>? trackStock,
      Value<bool>? isService,
      Value<String?>? colorHex,
      Value<String?>? imageUrl,
      Value<String>? printerCategory,
      Value<DateTime>? updatedAt,
      Value<bool>? isSynced,
      Value<int>? version,
      Value<bool>? isDeleted,
      Value<bool>? isComposite}) {
    return ProductTableCompanion(
      id: id ?? this.id,
      uuid: uuid ?? this.uuid,
      name: name ?? this.name,
      sku: sku ?? this.sku,
      barcode: barcode ?? this.barcode,
      price: price ?? this.price,
      costPrice: costPrice ?? this.costPrice,
      categoryId: categoryId ?? this.categoryId,
      trackStock: trackStock ?? this.trackStock,
      isService: isService ?? this.isService,
      colorHex: colorHex ?? this.colorHex,
      imageUrl: imageUrl ?? this.imageUrl,
      printerCategory: printerCategory ?? this.printerCategory,
      updatedAt: updatedAt ?? this.updatedAt,
      isSynced: isSynced ?? this.isSynced,
      version: version ?? this.version,
      isDeleted: isDeleted ?? this.isDeleted,
      isComposite: isComposite ?? this.isComposite,
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
    if (sku.present) {
      map['sku'] = Variable<String>(sku.value);
    }
    if (barcode.present) {
      map['barcode'] = Variable<String>(barcode.value);
    }
    if (price.present) {
      map['price'] = Variable<double>(price.value);
    }
    if (costPrice.present) {
      map['cost_price'] = Variable<double>(costPrice.value);
    }
    if (categoryId.present) {
      map['category_id'] = Variable<String>(categoryId.value);
    }
    if (trackStock.present) {
      map['track_stock'] = Variable<bool>(trackStock.value);
    }
    if (isService.present) {
      map['is_service'] = Variable<bool>(isService.value);
    }
    if (colorHex.present) {
      map['color_hex'] = Variable<String>(colorHex.value);
    }
    if (imageUrl.present) {
      map['image_url'] = Variable<String>(imageUrl.value);
    }
    if (printerCategory.present) {
      map['printer_category'] = Variable<String>(printerCategory.value);
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
    if (isComposite.present) {
      map['is_composite'] = Variable<bool>(isComposite.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProductTableCompanion(')
          ..write('id: $id, ')
          ..write('uuid: $uuid, ')
          ..write('name: $name, ')
          ..write('sku: $sku, ')
          ..write('barcode: $barcode, ')
          ..write('price: $price, ')
          ..write('costPrice: $costPrice, ')
          ..write('categoryId: $categoryId, ')
          ..write('trackStock: $trackStock, ')
          ..write('isService: $isService, ')
          ..write('colorHex: $colorHex, ')
          ..write('imageUrl: $imageUrl, ')
          ..write('printerCategory: $printerCategory, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('isSynced: $isSynced, ')
          ..write('version: $version, ')
          ..write('isDeleted: $isDeleted, ')
          ..write('isComposite: $isComposite')
          ..write(')'))
        .toString();
  }
}

class $RestaurantTableTable extends RestaurantTable
    with TableInfo<$RestaurantTableTable, RestaurantTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RestaurantTableTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _capacityMeta =
      const VerificationMeta('capacity');
  @override
  late final GeneratedColumn<int> capacity = GeneratedColumn<int>(
      'capacity', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(4));
  static const VerificationMeta _xMeta = const VerificationMeta('x');
  @override
  late final GeneratedColumn<double> x = GeneratedColumn<double>(
      'x', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _yMeta = const VerificationMeta('y');
  @override
  late final GeneratedColumn<double> y = GeneratedColumn<double>(
      'y', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _isOccupiedMeta =
      const VerificationMeta('isOccupied');
  @override
  late final GeneratedColumn<bool> isOccupied = GeneratedColumn<bool>(
      'is_occupied', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_occupied" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _currentOrderUuidMeta =
      const VerificationMeta('currentOrderUuid');
  @override
  late final GeneratedColumn<String> currentOrderUuid = GeneratedColumn<String>(
      'current_order_uuid', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, uuid, name, capacity, x, y, isOccupied, currentOrderUuid, updatedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'restaurant_table';
  @override
  VerificationContext validateIntegrity(
      Insertable<RestaurantTableData> instance,
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
    if (data.containsKey('capacity')) {
      context.handle(_capacityMeta,
          capacity.isAcceptableOrUnknown(data['capacity']!, _capacityMeta));
    }
    if (data.containsKey('x')) {
      context.handle(_xMeta, x.isAcceptableOrUnknown(data['x']!, _xMeta));
    } else if (isInserting) {
      context.missing(_xMeta);
    }
    if (data.containsKey('y')) {
      context.handle(_yMeta, y.isAcceptableOrUnknown(data['y']!, _yMeta));
    } else if (isInserting) {
      context.missing(_yMeta);
    }
    if (data.containsKey('is_occupied')) {
      context.handle(
          _isOccupiedMeta,
          isOccupied.isAcceptableOrUnknown(
              data['is_occupied']!, _isOccupiedMeta));
    }
    if (data.containsKey('current_order_uuid')) {
      context.handle(
          _currentOrderUuidMeta,
          currentOrderUuid.isAcceptableOrUnknown(
              data['current_order_uuid']!, _currentOrderUuidMeta));
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
  RestaurantTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RestaurantTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      uuid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}uuid'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      capacity: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}capacity'])!,
      x: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}x'])!,
      y: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}y'])!,
      isOccupied: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_occupied'])!,
      currentOrderUuid: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}current_order_uuid']),
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
    );
  }

  @override
  $RestaurantTableTable createAlias(String alias) {
    return $RestaurantTableTable(attachedDatabase, alias);
  }
}

class RestaurantTableData extends DataClass
    implements Insertable<RestaurantTableData> {
  final int id;
  final String uuid;
  final String name;
  final int capacity;
  final double x;
  final double y;
  final bool isOccupied;
  final String? currentOrderUuid;
  final DateTime updatedAt;
  const RestaurantTableData(
      {required this.id,
      required this.uuid,
      required this.name,
      required this.capacity,
      required this.x,
      required this.y,
      required this.isOccupied,
      this.currentOrderUuid,
      required this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['uuid'] = Variable<String>(uuid);
    map['name'] = Variable<String>(name);
    map['capacity'] = Variable<int>(capacity);
    map['x'] = Variable<double>(x);
    map['y'] = Variable<double>(y);
    map['is_occupied'] = Variable<bool>(isOccupied);
    if (!nullToAbsent || currentOrderUuid != null) {
      map['current_order_uuid'] = Variable<String>(currentOrderUuid);
    }
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  RestaurantTableCompanion toCompanion(bool nullToAbsent) {
    return RestaurantTableCompanion(
      id: Value(id),
      uuid: Value(uuid),
      name: Value(name),
      capacity: Value(capacity),
      x: Value(x),
      y: Value(y),
      isOccupied: Value(isOccupied),
      currentOrderUuid: currentOrderUuid == null && nullToAbsent
          ? const Value.absent()
          : Value(currentOrderUuid),
      updatedAt: Value(updatedAt),
    );
  }

  factory RestaurantTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RestaurantTableData(
      id: serializer.fromJson<int>(json['id']),
      uuid: serializer.fromJson<String>(json['uuid']),
      name: serializer.fromJson<String>(json['name']),
      capacity: serializer.fromJson<int>(json['capacity']),
      x: serializer.fromJson<double>(json['x']),
      y: serializer.fromJson<double>(json['y']),
      isOccupied: serializer.fromJson<bool>(json['isOccupied']),
      currentOrderUuid: serializer.fromJson<String?>(json['currentOrderUuid']),
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
      'capacity': serializer.toJson<int>(capacity),
      'x': serializer.toJson<double>(x),
      'y': serializer.toJson<double>(y),
      'isOccupied': serializer.toJson<bool>(isOccupied),
      'currentOrderUuid': serializer.toJson<String?>(currentOrderUuid),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  RestaurantTableData copyWith(
          {int? id,
          String? uuid,
          String? name,
          int? capacity,
          double? x,
          double? y,
          bool? isOccupied,
          Value<String?> currentOrderUuid = const Value.absent(),
          DateTime? updatedAt}) =>
      RestaurantTableData(
        id: id ?? this.id,
        uuid: uuid ?? this.uuid,
        name: name ?? this.name,
        capacity: capacity ?? this.capacity,
        x: x ?? this.x,
        y: y ?? this.y,
        isOccupied: isOccupied ?? this.isOccupied,
        currentOrderUuid: currentOrderUuid.present
            ? currentOrderUuid.value
            : this.currentOrderUuid,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  RestaurantTableData copyWithCompanion(RestaurantTableCompanion data) {
    return RestaurantTableData(
      id: data.id.present ? data.id.value : this.id,
      uuid: data.uuid.present ? data.uuid.value : this.uuid,
      name: data.name.present ? data.name.value : this.name,
      capacity: data.capacity.present ? data.capacity.value : this.capacity,
      x: data.x.present ? data.x.value : this.x,
      y: data.y.present ? data.y.value : this.y,
      isOccupied:
          data.isOccupied.present ? data.isOccupied.value : this.isOccupied,
      currentOrderUuid: data.currentOrderUuid.present
          ? data.currentOrderUuid.value
          : this.currentOrderUuid,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('RestaurantTableData(')
          ..write('id: $id, ')
          ..write('uuid: $uuid, ')
          ..write('name: $name, ')
          ..write('capacity: $capacity, ')
          ..write('x: $x, ')
          ..write('y: $y, ')
          ..write('isOccupied: $isOccupied, ')
          ..write('currentOrderUuid: $currentOrderUuid, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, uuid, name, capacity, x, y, isOccupied, currentOrderUuid, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RestaurantTableData &&
          other.id == this.id &&
          other.uuid == this.uuid &&
          other.name == this.name &&
          other.capacity == this.capacity &&
          other.x == this.x &&
          other.y == this.y &&
          other.isOccupied == this.isOccupied &&
          other.currentOrderUuid == this.currentOrderUuid &&
          other.updatedAt == this.updatedAt);
}

class RestaurantTableCompanion extends UpdateCompanion<RestaurantTableData> {
  final Value<int> id;
  final Value<String> uuid;
  final Value<String> name;
  final Value<int> capacity;
  final Value<double> x;
  final Value<double> y;
  final Value<bool> isOccupied;
  final Value<String?> currentOrderUuid;
  final Value<DateTime> updatedAt;
  const RestaurantTableCompanion({
    this.id = const Value.absent(),
    this.uuid = const Value.absent(),
    this.name = const Value.absent(),
    this.capacity = const Value.absent(),
    this.x = const Value.absent(),
    this.y = const Value.absent(),
    this.isOccupied = const Value.absent(),
    this.currentOrderUuid = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  RestaurantTableCompanion.insert({
    this.id = const Value.absent(),
    required String uuid,
    required String name,
    this.capacity = const Value.absent(),
    required double x,
    required double y,
    this.isOccupied = const Value.absent(),
    this.currentOrderUuid = const Value.absent(),
    required DateTime updatedAt,
  })  : uuid = Value(uuid),
        name = Value(name),
        x = Value(x),
        y = Value(y),
        updatedAt = Value(updatedAt);
  static Insertable<RestaurantTableData> custom({
    Expression<int>? id,
    Expression<String>? uuid,
    Expression<String>? name,
    Expression<int>? capacity,
    Expression<double>? x,
    Expression<double>? y,
    Expression<bool>? isOccupied,
    Expression<String>? currentOrderUuid,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (uuid != null) 'uuid': uuid,
      if (name != null) 'name': name,
      if (capacity != null) 'capacity': capacity,
      if (x != null) 'x': x,
      if (y != null) 'y': y,
      if (isOccupied != null) 'is_occupied': isOccupied,
      if (currentOrderUuid != null) 'current_order_uuid': currentOrderUuid,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  RestaurantTableCompanion copyWith(
      {Value<int>? id,
      Value<String>? uuid,
      Value<String>? name,
      Value<int>? capacity,
      Value<double>? x,
      Value<double>? y,
      Value<bool>? isOccupied,
      Value<String?>? currentOrderUuid,
      Value<DateTime>? updatedAt}) {
    return RestaurantTableCompanion(
      id: id ?? this.id,
      uuid: uuid ?? this.uuid,
      name: name ?? this.name,
      capacity: capacity ?? this.capacity,
      x: x ?? this.x,
      y: y ?? this.y,
      isOccupied: isOccupied ?? this.isOccupied,
      currentOrderUuid: currentOrderUuid ?? this.currentOrderUuid,
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
    if (capacity.present) {
      map['capacity'] = Variable<int>(capacity.value);
    }
    if (x.present) {
      map['x'] = Variable<double>(x.value);
    }
    if (y.present) {
      map['y'] = Variable<double>(y.value);
    }
    if (isOccupied.present) {
      map['is_occupied'] = Variable<bool>(isOccupied.value);
    }
    if (currentOrderUuid.present) {
      map['current_order_uuid'] = Variable<String>(currentOrderUuid.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RestaurantTableCompanion(')
          ..write('id: $id, ')
          ..write('uuid: $uuid, ')
          ..write('name: $name, ')
          ..write('capacity: $capacity, ')
          ..write('x: $x, ')
          ..write('y: $y, ')
          ..write('isOccupied: $isOccupied, ')
          ..write('currentOrderUuid: $currentOrderUuid, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $ReservationTableTable extends ReservationTable
    with TableInfo<$ReservationTableTable, ReservationTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ReservationTableTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _customerNameMeta =
      const VerificationMeta('customerName');
  @override
  late final GeneratedColumn<String> customerName = GeneratedColumn<String>(
      'customer_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _phoneMeta = const VerificationMeta('phone');
  @override
  late final GeneratedColumn<String> phone = GeneratedColumn<String>(
      'phone', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _paxMeta = const VerificationMeta('pax');
  @override
  late final GeneratedColumn<int> pax = GeneratedColumn<int>(
      'pax', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _reservationTimeMeta =
      const VerificationMeta('reservationTime');
  @override
  late final GeneratedColumn<DateTime> reservationTime =
      GeneratedColumn<DateTime>('reservation_time', aliasedName, false,
          type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _tableUuidMeta =
      const VerificationMeta('tableUuid');
  @override
  late final GeneratedColumn<String> tableUuid = GeneratedColumn<String>(
      'table_uuid', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
      'status', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('PENDING'));
  static const VerificationMeta _noteMeta = const VerificationMeta('note');
  @override
  late final GeneratedColumn<String> note = GeneratedColumn<String>(
      'note', aliasedName, true,
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
        customerName,
        phone,
        pax,
        reservationTime,
        tableUuid,
        status,
        note,
        createdAt,
        updatedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'reservation_table';
  @override
  VerificationContext validateIntegrity(
      Insertable<ReservationTableData> instance,
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
    if (data.containsKey('customer_name')) {
      context.handle(
          _customerNameMeta,
          customerName.isAcceptableOrUnknown(
              data['customer_name']!, _customerNameMeta));
    } else if (isInserting) {
      context.missing(_customerNameMeta);
    }
    if (data.containsKey('phone')) {
      context.handle(
          _phoneMeta, phone.isAcceptableOrUnknown(data['phone']!, _phoneMeta));
    }
    if (data.containsKey('pax')) {
      context.handle(
          _paxMeta, pax.isAcceptableOrUnknown(data['pax']!, _paxMeta));
    } else if (isInserting) {
      context.missing(_paxMeta);
    }
    if (data.containsKey('reservation_time')) {
      context.handle(
          _reservationTimeMeta,
          reservationTime.isAcceptableOrUnknown(
              data['reservation_time']!, _reservationTimeMeta));
    } else if (isInserting) {
      context.missing(_reservationTimeMeta);
    }
    if (data.containsKey('table_uuid')) {
      context.handle(_tableUuidMeta,
          tableUuid.isAcceptableOrUnknown(data['table_uuid']!, _tableUuidMeta));
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status']!, _statusMeta));
    }
    if (data.containsKey('note')) {
      context.handle(
          _noteMeta, note.isAcceptableOrUnknown(data['note']!, _noteMeta));
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
  ReservationTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ReservationTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      uuid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}uuid'])!,
      customerName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}customer_name'])!,
      phone: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}phone']),
      pax: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}pax'])!,
      reservationTime: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}reservation_time'])!,
      tableUuid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}table_uuid']),
      status: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}status'])!,
      note: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}note']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
    );
  }

  @override
  $ReservationTableTable createAlias(String alias) {
    return $ReservationTableTable(attachedDatabase, alias);
  }
}

class ReservationTableData extends DataClass
    implements Insertable<ReservationTableData> {
  final int id;
  final String uuid;
  final String customerName;
  final String? phone;
  final int pax;
  final DateTime reservationTime;
  final String? tableUuid;
  final String status;
  final String? note;
  final DateTime createdAt;
  final DateTime updatedAt;
  const ReservationTableData(
      {required this.id,
      required this.uuid,
      required this.customerName,
      this.phone,
      required this.pax,
      required this.reservationTime,
      this.tableUuid,
      required this.status,
      this.note,
      required this.createdAt,
      required this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['uuid'] = Variable<String>(uuid);
    map['customer_name'] = Variable<String>(customerName);
    if (!nullToAbsent || phone != null) {
      map['phone'] = Variable<String>(phone);
    }
    map['pax'] = Variable<int>(pax);
    map['reservation_time'] = Variable<DateTime>(reservationTime);
    if (!nullToAbsent || tableUuid != null) {
      map['table_uuid'] = Variable<String>(tableUuid);
    }
    map['status'] = Variable<String>(status);
    if (!nullToAbsent || note != null) {
      map['note'] = Variable<String>(note);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  ReservationTableCompanion toCompanion(bool nullToAbsent) {
    return ReservationTableCompanion(
      id: Value(id),
      uuid: Value(uuid),
      customerName: Value(customerName),
      phone:
          phone == null && nullToAbsent ? const Value.absent() : Value(phone),
      pax: Value(pax),
      reservationTime: Value(reservationTime),
      tableUuid: tableUuid == null && nullToAbsent
          ? const Value.absent()
          : Value(tableUuid),
      status: Value(status),
      note: note == null && nullToAbsent ? const Value.absent() : Value(note),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory ReservationTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ReservationTableData(
      id: serializer.fromJson<int>(json['id']),
      uuid: serializer.fromJson<String>(json['uuid']),
      customerName: serializer.fromJson<String>(json['customerName']),
      phone: serializer.fromJson<String?>(json['phone']),
      pax: serializer.fromJson<int>(json['pax']),
      reservationTime: serializer.fromJson<DateTime>(json['reservationTime']),
      tableUuid: serializer.fromJson<String?>(json['tableUuid']),
      status: serializer.fromJson<String>(json['status']),
      note: serializer.fromJson<String?>(json['note']),
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
      'customerName': serializer.toJson<String>(customerName),
      'phone': serializer.toJson<String?>(phone),
      'pax': serializer.toJson<int>(pax),
      'reservationTime': serializer.toJson<DateTime>(reservationTime),
      'tableUuid': serializer.toJson<String?>(tableUuid),
      'status': serializer.toJson<String>(status),
      'note': serializer.toJson<String?>(note),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  ReservationTableData copyWith(
          {int? id,
          String? uuid,
          String? customerName,
          Value<String?> phone = const Value.absent(),
          int? pax,
          DateTime? reservationTime,
          Value<String?> tableUuid = const Value.absent(),
          String? status,
          Value<String?> note = const Value.absent(),
          DateTime? createdAt,
          DateTime? updatedAt}) =>
      ReservationTableData(
        id: id ?? this.id,
        uuid: uuid ?? this.uuid,
        customerName: customerName ?? this.customerName,
        phone: phone.present ? phone.value : this.phone,
        pax: pax ?? this.pax,
        reservationTime: reservationTime ?? this.reservationTime,
        tableUuid: tableUuid.present ? tableUuid.value : this.tableUuid,
        status: status ?? this.status,
        note: note.present ? note.value : this.note,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  ReservationTableData copyWithCompanion(ReservationTableCompanion data) {
    return ReservationTableData(
      id: data.id.present ? data.id.value : this.id,
      uuid: data.uuid.present ? data.uuid.value : this.uuid,
      customerName: data.customerName.present
          ? data.customerName.value
          : this.customerName,
      phone: data.phone.present ? data.phone.value : this.phone,
      pax: data.pax.present ? data.pax.value : this.pax,
      reservationTime: data.reservationTime.present
          ? data.reservationTime.value
          : this.reservationTime,
      tableUuid: data.tableUuid.present ? data.tableUuid.value : this.tableUuid,
      status: data.status.present ? data.status.value : this.status,
      note: data.note.present ? data.note.value : this.note,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ReservationTableData(')
          ..write('id: $id, ')
          ..write('uuid: $uuid, ')
          ..write('customerName: $customerName, ')
          ..write('phone: $phone, ')
          ..write('pax: $pax, ')
          ..write('reservationTime: $reservationTime, ')
          ..write('tableUuid: $tableUuid, ')
          ..write('status: $status, ')
          ..write('note: $note, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, uuid, customerName, phone, pax,
      reservationTime, tableUuid, status, note, createdAt, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ReservationTableData &&
          other.id == this.id &&
          other.uuid == this.uuid &&
          other.customerName == this.customerName &&
          other.phone == this.phone &&
          other.pax == this.pax &&
          other.reservationTime == this.reservationTime &&
          other.tableUuid == this.tableUuid &&
          other.status == this.status &&
          other.note == this.note &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class ReservationTableCompanion extends UpdateCompanion<ReservationTableData> {
  final Value<int> id;
  final Value<String> uuid;
  final Value<String> customerName;
  final Value<String?> phone;
  final Value<int> pax;
  final Value<DateTime> reservationTime;
  final Value<String?> tableUuid;
  final Value<String> status;
  final Value<String?> note;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const ReservationTableCompanion({
    this.id = const Value.absent(),
    this.uuid = const Value.absent(),
    this.customerName = const Value.absent(),
    this.phone = const Value.absent(),
    this.pax = const Value.absent(),
    this.reservationTime = const Value.absent(),
    this.tableUuid = const Value.absent(),
    this.status = const Value.absent(),
    this.note = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  ReservationTableCompanion.insert({
    this.id = const Value.absent(),
    required String uuid,
    required String customerName,
    this.phone = const Value.absent(),
    required int pax,
    required DateTime reservationTime,
    this.tableUuid = const Value.absent(),
    this.status = const Value.absent(),
    this.note = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
  })  : uuid = Value(uuid),
        customerName = Value(customerName),
        pax = Value(pax),
        reservationTime = Value(reservationTime),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt);
  static Insertable<ReservationTableData> custom({
    Expression<int>? id,
    Expression<String>? uuid,
    Expression<String>? customerName,
    Expression<String>? phone,
    Expression<int>? pax,
    Expression<DateTime>? reservationTime,
    Expression<String>? tableUuid,
    Expression<String>? status,
    Expression<String>? note,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (uuid != null) 'uuid': uuid,
      if (customerName != null) 'customer_name': customerName,
      if (phone != null) 'phone': phone,
      if (pax != null) 'pax': pax,
      if (reservationTime != null) 'reservation_time': reservationTime,
      if (tableUuid != null) 'table_uuid': tableUuid,
      if (status != null) 'status': status,
      if (note != null) 'note': note,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  ReservationTableCompanion copyWith(
      {Value<int>? id,
      Value<String>? uuid,
      Value<String>? customerName,
      Value<String?>? phone,
      Value<int>? pax,
      Value<DateTime>? reservationTime,
      Value<String?>? tableUuid,
      Value<String>? status,
      Value<String?>? note,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt}) {
    return ReservationTableCompanion(
      id: id ?? this.id,
      uuid: uuid ?? this.uuid,
      customerName: customerName ?? this.customerName,
      phone: phone ?? this.phone,
      pax: pax ?? this.pax,
      reservationTime: reservationTime ?? this.reservationTime,
      tableUuid: tableUuid ?? this.tableUuid,
      status: status ?? this.status,
      note: note ?? this.note,
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
    if (customerName.present) {
      map['customer_name'] = Variable<String>(customerName.value);
    }
    if (phone.present) {
      map['phone'] = Variable<String>(phone.value);
    }
    if (pax.present) {
      map['pax'] = Variable<int>(pax.value);
    }
    if (reservationTime.present) {
      map['reservation_time'] = Variable<DateTime>(reservationTime.value);
    }
    if (tableUuid.present) {
      map['table_uuid'] = Variable<String>(tableUuid.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (note.present) {
      map['note'] = Variable<String>(note.value);
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
    return (StringBuffer('ReservationTableCompanion(')
          ..write('id: $id, ')
          ..write('uuid: $uuid, ')
          ..write('customerName: $customerName, ')
          ..write('phone: $phone, ')
          ..write('pax: $pax, ')
          ..write('reservationTime: $reservationTime, ')
          ..write('tableUuid: $tableUuid, ')
          ..write('status: $status, ')
          ..write('note: $note, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $EmployeeTableTable extends EmployeeTable
    with TableInfo<$EmployeeTableTable, EmployeeTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $EmployeeTableTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _pinMeta = const VerificationMeta('pin');
  @override
  late final GeneratedColumn<String> pin = GeneratedColumn<String>(
      'pin', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _roleMeta = const VerificationMeta('role');
  @override
  late final GeneratedColumn<String> role = GeneratedColumn<String>(
      'role', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
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
  List<GeneratedColumn> get $columns =>
      [id, uuid, name, pin, role, isActive, createdAt, updatedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'employee_table';
  @override
  VerificationContext validateIntegrity(Insertable<EmployeeTableData> instance,
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
    if (data.containsKey('pin')) {
      context.handle(
          _pinMeta, pin.isAcceptableOrUnknown(data['pin']!, _pinMeta));
    } else if (isInserting) {
      context.missing(_pinMeta);
    }
    if (data.containsKey('role')) {
      context.handle(
          _roleMeta, role.isAcceptableOrUnknown(data['role']!, _roleMeta));
    } else if (isInserting) {
      context.missing(_roleMeta);
    }
    if (data.containsKey('is_active')) {
      context.handle(_isActiveMeta,
          isActive.isAcceptableOrUnknown(data['is_active']!, _isActiveMeta));
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
  EmployeeTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return EmployeeTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      uuid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}uuid'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      pin: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}pin'])!,
      role: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}role'])!,
      isActive: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_active'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at']),
    );
  }

  @override
  $EmployeeTableTable createAlias(String alias) {
    return $EmployeeTableTable(attachedDatabase, alias);
  }
}

class EmployeeTableData extends DataClass
    implements Insertable<EmployeeTableData> {
  final int id;
  final String uuid;
  final String name;
  final String pin;
  final String role;
  final bool isActive;
  final DateTime createdAt;
  final DateTime? updatedAt;
  const EmployeeTableData(
      {required this.id,
      required this.uuid,
      required this.name,
      required this.pin,
      required this.role,
      required this.isActive,
      required this.createdAt,
      this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['uuid'] = Variable<String>(uuid);
    map['name'] = Variable<String>(name);
    map['pin'] = Variable<String>(pin);
    map['role'] = Variable<String>(role);
    map['is_active'] = Variable<bool>(isActive);
    map['created_at'] = Variable<DateTime>(createdAt);
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<DateTime>(updatedAt);
    }
    return map;
  }

  EmployeeTableCompanion toCompanion(bool nullToAbsent) {
    return EmployeeTableCompanion(
      id: Value(id),
      uuid: Value(uuid),
      name: Value(name),
      pin: Value(pin),
      role: Value(role),
      isActive: Value(isActive),
      createdAt: Value(createdAt),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
    );
  }

  factory EmployeeTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return EmployeeTableData(
      id: serializer.fromJson<int>(json['id']),
      uuid: serializer.fromJson<String>(json['uuid']),
      name: serializer.fromJson<String>(json['name']),
      pin: serializer.fromJson<String>(json['pin']),
      role: serializer.fromJson<String>(json['role']),
      isActive: serializer.fromJson<bool>(json['isActive']),
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
      'pin': serializer.toJson<String>(pin),
      'role': serializer.toJson<String>(role),
      'isActive': serializer.toJson<bool>(isActive),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime?>(updatedAt),
    };
  }

  EmployeeTableData copyWith(
          {int? id,
          String? uuid,
          String? name,
          String? pin,
          String? role,
          bool? isActive,
          DateTime? createdAt,
          Value<DateTime?> updatedAt = const Value.absent()}) =>
      EmployeeTableData(
        id: id ?? this.id,
        uuid: uuid ?? this.uuid,
        name: name ?? this.name,
        pin: pin ?? this.pin,
        role: role ?? this.role,
        isActive: isActive ?? this.isActive,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt.present ? updatedAt.value : this.updatedAt,
      );
  EmployeeTableData copyWithCompanion(EmployeeTableCompanion data) {
    return EmployeeTableData(
      id: data.id.present ? data.id.value : this.id,
      uuid: data.uuid.present ? data.uuid.value : this.uuid,
      name: data.name.present ? data.name.value : this.name,
      pin: data.pin.present ? data.pin.value : this.pin,
      role: data.role.present ? data.role.value : this.role,
      isActive: data.isActive.present ? data.isActive.value : this.isActive,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('EmployeeTableData(')
          ..write('id: $id, ')
          ..write('uuid: $uuid, ')
          ..write('name: $name, ')
          ..write('pin: $pin, ')
          ..write('role: $role, ')
          ..write('isActive: $isActive, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, uuid, name, pin, role, isActive, createdAt, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is EmployeeTableData &&
          other.id == this.id &&
          other.uuid == this.uuid &&
          other.name == this.name &&
          other.pin == this.pin &&
          other.role == this.role &&
          other.isActive == this.isActive &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class EmployeeTableCompanion extends UpdateCompanion<EmployeeTableData> {
  final Value<int> id;
  final Value<String> uuid;
  final Value<String> name;
  final Value<String> pin;
  final Value<String> role;
  final Value<bool> isActive;
  final Value<DateTime> createdAt;
  final Value<DateTime?> updatedAt;
  const EmployeeTableCompanion({
    this.id = const Value.absent(),
    this.uuid = const Value.absent(),
    this.name = const Value.absent(),
    this.pin = const Value.absent(),
    this.role = const Value.absent(),
    this.isActive = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  EmployeeTableCompanion.insert({
    this.id = const Value.absent(),
    required String uuid,
    required String name,
    required String pin,
    required String role,
    this.isActive = const Value.absent(),
    required DateTime createdAt,
    this.updatedAt = const Value.absent(),
  })  : uuid = Value(uuid),
        name = Value(name),
        pin = Value(pin),
        role = Value(role),
        createdAt = Value(createdAt);
  static Insertable<EmployeeTableData> custom({
    Expression<int>? id,
    Expression<String>? uuid,
    Expression<String>? name,
    Expression<String>? pin,
    Expression<String>? role,
    Expression<bool>? isActive,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (uuid != null) 'uuid': uuid,
      if (name != null) 'name': name,
      if (pin != null) 'pin': pin,
      if (role != null) 'role': role,
      if (isActive != null) 'is_active': isActive,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  EmployeeTableCompanion copyWith(
      {Value<int>? id,
      Value<String>? uuid,
      Value<String>? name,
      Value<String>? pin,
      Value<String>? role,
      Value<bool>? isActive,
      Value<DateTime>? createdAt,
      Value<DateTime?>? updatedAt}) {
    return EmployeeTableCompanion(
      id: id ?? this.id,
      uuid: uuid ?? this.uuid,
      name: name ?? this.name,
      pin: pin ?? this.pin,
      role: role ?? this.role,
      isActive: isActive ?? this.isActive,
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
    if (pin.present) {
      map['pin'] = Variable<String>(pin.value);
    }
    if (role.present) {
      map['role'] = Variable<String>(role.value);
    }
    if (isActive.present) {
      map['is_active'] = Variable<bool>(isActive.value);
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
    return (StringBuffer('EmployeeTableCompanion(')
          ..write('id: $id, ')
          ..write('uuid: $uuid, ')
          ..write('name: $name, ')
          ..write('pin: $pin, ')
          ..write('role: $role, ')
          ..write('isActive: $isActive, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $ModifierGroupTableTable extends ModifierGroupTable
    with TableInfo<$ModifierGroupTableTable, ModifierGroupTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ModifierGroupTableTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _allowMultiSelectMeta =
      const VerificationMeta('allowMultiSelect');
  @override
  late final GeneratedColumn<bool> allowMultiSelect = GeneratedColumn<bool>(
      'allow_multi_select', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("allow_multi_select" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _minSelectionMeta =
      const VerificationMeta('minSelection');
  @override
  late final GeneratedColumn<int> minSelection = GeneratedColumn<int>(
      'min_selection', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _maxSelectionMeta =
      const VerificationMeta('maxSelection');
  @override
  late final GeneratedColumn<int> maxSelection = GeneratedColumn<int>(
      'max_selection', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
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
  List<GeneratedColumn> get $columns => [
        id,
        uuid,
        name,
        allowMultiSelect,
        minSelection,
        maxSelection,
        updatedAt,
        isDeleted
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'modifier_group_table';
  @override
  VerificationContext validateIntegrity(
      Insertable<ModifierGroupTableData> instance,
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
    if (data.containsKey('allow_multi_select')) {
      context.handle(
          _allowMultiSelectMeta,
          allowMultiSelect.isAcceptableOrUnknown(
              data['allow_multi_select']!, _allowMultiSelectMeta));
    }
    if (data.containsKey('min_selection')) {
      context.handle(
          _minSelectionMeta,
          minSelection.isAcceptableOrUnknown(
              data['min_selection']!, _minSelectionMeta));
    }
    if (data.containsKey('max_selection')) {
      context.handle(
          _maxSelectionMeta,
          maxSelection.isAcceptableOrUnknown(
              data['max_selection']!, _maxSelectionMeta));
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
  ModifierGroupTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ModifierGroupTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      uuid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}uuid'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      allowMultiSelect: attachedDatabase.typeMapping.read(
          DriftSqlType.bool, data['${effectivePrefix}allow_multi_select'])!,
      minSelection: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}min_selection'])!,
      maxSelection: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}max_selection']),
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
      isDeleted: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_deleted'])!,
    );
  }

  @override
  $ModifierGroupTableTable createAlias(String alias) {
    return $ModifierGroupTableTable(attachedDatabase, alias);
  }
}

class ModifierGroupTableData extends DataClass
    implements Insertable<ModifierGroupTableData> {
  final int id;
  final String uuid;
  final String name;
  final bool allowMultiSelect;
  final int minSelection;
  final int? maxSelection;
  final DateTime updatedAt;
  final bool isDeleted;
  const ModifierGroupTableData(
      {required this.id,
      required this.uuid,
      required this.name,
      required this.allowMultiSelect,
      required this.minSelection,
      this.maxSelection,
      required this.updatedAt,
      required this.isDeleted});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['uuid'] = Variable<String>(uuid);
    map['name'] = Variable<String>(name);
    map['allow_multi_select'] = Variable<bool>(allowMultiSelect);
    map['min_selection'] = Variable<int>(minSelection);
    if (!nullToAbsent || maxSelection != null) {
      map['max_selection'] = Variable<int>(maxSelection);
    }
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['is_deleted'] = Variable<bool>(isDeleted);
    return map;
  }

  ModifierGroupTableCompanion toCompanion(bool nullToAbsent) {
    return ModifierGroupTableCompanion(
      id: Value(id),
      uuid: Value(uuid),
      name: Value(name),
      allowMultiSelect: Value(allowMultiSelect),
      minSelection: Value(minSelection),
      maxSelection: maxSelection == null && nullToAbsent
          ? const Value.absent()
          : Value(maxSelection),
      updatedAt: Value(updatedAt),
      isDeleted: Value(isDeleted),
    );
  }

  factory ModifierGroupTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ModifierGroupTableData(
      id: serializer.fromJson<int>(json['id']),
      uuid: serializer.fromJson<String>(json['uuid']),
      name: serializer.fromJson<String>(json['name']),
      allowMultiSelect: serializer.fromJson<bool>(json['allowMultiSelect']),
      minSelection: serializer.fromJson<int>(json['minSelection']),
      maxSelection: serializer.fromJson<int?>(json['maxSelection']),
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
      'allowMultiSelect': serializer.toJson<bool>(allowMultiSelect),
      'minSelection': serializer.toJson<int>(minSelection),
      'maxSelection': serializer.toJson<int?>(maxSelection),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'isDeleted': serializer.toJson<bool>(isDeleted),
    };
  }

  ModifierGroupTableData copyWith(
          {int? id,
          String? uuid,
          String? name,
          bool? allowMultiSelect,
          int? minSelection,
          Value<int?> maxSelection = const Value.absent(),
          DateTime? updatedAt,
          bool? isDeleted}) =>
      ModifierGroupTableData(
        id: id ?? this.id,
        uuid: uuid ?? this.uuid,
        name: name ?? this.name,
        allowMultiSelect: allowMultiSelect ?? this.allowMultiSelect,
        minSelection: minSelection ?? this.minSelection,
        maxSelection:
            maxSelection.present ? maxSelection.value : this.maxSelection,
        updatedAt: updatedAt ?? this.updatedAt,
        isDeleted: isDeleted ?? this.isDeleted,
      );
  ModifierGroupTableData copyWithCompanion(ModifierGroupTableCompanion data) {
    return ModifierGroupTableData(
      id: data.id.present ? data.id.value : this.id,
      uuid: data.uuid.present ? data.uuid.value : this.uuid,
      name: data.name.present ? data.name.value : this.name,
      allowMultiSelect: data.allowMultiSelect.present
          ? data.allowMultiSelect.value
          : this.allowMultiSelect,
      minSelection: data.minSelection.present
          ? data.minSelection.value
          : this.minSelection,
      maxSelection: data.maxSelection.present
          ? data.maxSelection.value
          : this.maxSelection,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      isDeleted: data.isDeleted.present ? data.isDeleted.value : this.isDeleted,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ModifierGroupTableData(')
          ..write('id: $id, ')
          ..write('uuid: $uuid, ')
          ..write('name: $name, ')
          ..write('allowMultiSelect: $allowMultiSelect, ')
          ..write('minSelection: $minSelection, ')
          ..write('maxSelection: $maxSelection, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('isDeleted: $isDeleted')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, uuid, name, allowMultiSelect,
      minSelection, maxSelection, updatedAt, isDeleted);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ModifierGroupTableData &&
          other.id == this.id &&
          other.uuid == this.uuid &&
          other.name == this.name &&
          other.allowMultiSelect == this.allowMultiSelect &&
          other.minSelection == this.minSelection &&
          other.maxSelection == this.maxSelection &&
          other.updatedAt == this.updatedAt &&
          other.isDeleted == this.isDeleted);
}

class ModifierGroupTableCompanion
    extends UpdateCompanion<ModifierGroupTableData> {
  final Value<int> id;
  final Value<String> uuid;
  final Value<String> name;
  final Value<bool> allowMultiSelect;
  final Value<int> minSelection;
  final Value<int?> maxSelection;
  final Value<DateTime> updatedAt;
  final Value<bool> isDeleted;
  const ModifierGroupTableCompanion({
    this.id = const Value.absent(),
    this.uuid = const Value.absent(),
    this.name = const Value.absent(),
    this.allowMultiSelect = const Value.absent(),
    this.minSelection = const Value.absent(),
    this.maxSelection = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.isDeleted = const Value.absent(),
  });
  ModifierGroupTableCompanion.insert({
    this.id = const Value.absent(),
    required String uuid,
    required String name,
    this.allowMultiSelect = const Value.absent(),
    this.minSelection = const Value.absent(),
    this.maxSelection = const Value.absent(),
    required DateTime updatedAt,
    this.isDeleted = const Value.absent(),
  })  : uuid = Value(uuid),
        name = Value(name),
        updatedAt = Value(updatedAt);
  static Insertable<ModifierGroupTableData> custom({
    Expression<int>? id,
    Expression<String>? uuid,
    Expression<String>? name,
    Expression<bool>? allowMultiSelect,
    Expression<int>? minSelection,
    Expression<int>? maxSelection,
    Expression<DateTime>? updatedAt,
    Expression<bool>? isDeleted,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (uuid != null) 'uuid': uuid,
      if (name != null) 'name': name,
      if (allowMultiSelect != null) 'allow_multi_select': allowMultiSelect,
      if (minSelection != null) 'min_selection': minSelection,
      if (maxSelection != null) 'max_selection': maxSelection,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (isDeleted != null) 'is_deleted': isDeleted,
    });
  }

  ModifierGroupTableCompanion copyWith(
      {Value<int>? id,
      Value<String>? uuid,
      Value<String>? name,
      Value<bool>? allowMultiSelect,
      Value<int>? minSelection,
      Value<int?>? maxSelection,
      Value<DateTime>? updatedAt,
      Value<bool>? isDeleted}) {
    return ModifierGroupTableCompanion(
      id: id ?? this.id,
      uuid: uuid ?? this.uuid,
      name: name ?? this.name,
      allowMultiSelect: allowMultiSelect ?? this.allowMultiSelect,
      minSelection: minSelection ?? this.minSelection,
      maxSelection: maxSelection ?? this.maxSelection,
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
    if (allowMultiSelect.present) {
      map['allow_multi_select'] = Variable<bool>(allowMultiSelect.value);
    }
    if (minSelection.present) {
      map['min_selection'] = Variable<int>(minSelection.value);
    }
    if (maxSelection.present) {
      map['max_selection'] = Variable<int>(maxSelection.value);
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
    return (StringBuffer('ModifierGroupTableCompanion(')
          ..write('id: $id, ')
          ..write('uuid: $uuid, ')
          ..write('name: $name, ')
          ..write('allowMultiSelect: $allowMultiSelect, ')
          ..write('minSelection: $minSelection, ')
          ..write('maxSelection: $maxSelection, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('isDeleted: $isDeleted')
          ..write(')'))
        .toString();
  }
}

class $ModifierItemTableTable extends ModifierItemTable
    with TableInfo<$ModifierItemTableTable, ModifierItemTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ModifierItemTableTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _groupUuidMeta =
      const VerificationMeta('groupUuid');
  @override
  late final GeneratedColumn<String> groupUuid = GeneratedColumn<String>(
      'group_uuid', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES modifier_group_table (uuid) ON DELETE CASCADE'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _priceDeltaMeta =
      const VerificationMeta('priceDelta');
  @override
  late final GeneratedColumn<double> priceDelta = GeneratedColumn<double>(
      'price_delta', aliasedName, false,
      type: DriftSqlType.double,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
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
      [id, uuid, groupUuid, name, priceDelta, updatedAt, isDeleted];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'modifier_item_table';
  @override
  VerificationContext validateIntegrity(
      Insertable<ModifierItemTableData> instance,
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
    if (data.containsKey('group_uuid')) {
      context.handle(_groupUuidMeta,
          groupUuid.isAcceptableOrUnknown(data['group_uuid']!, _groupUuidMeta));
    } else if (isInserting) {
      context.missing(_groupUuidMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('price_delta')) {
      context.handle(
          _priceDeltaMeta,
          priceDelta.isAcceptableOrUnknown(
              data['price_delta']!, _priceDeltaMeta));
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
  ModifierItemTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ModifierItemTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      uuid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}uuid'])!,
      groupUuid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}group_uuid'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      priceDelta: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}price_delta'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
      isDeleted: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_deleted'])!,
    );
  }

  @override
  $ModifierItemTableTable createAlias(String alias) {
    return $ModifierItemTableTable(attachedDatabase, alias);
  }
}

class ModifierItemTableData extends DataClass
    implements Insertable<ModifierItemTableData> {
  final int id;
  final String uuid;
  final String groupUuid;
  final String name;
  final double priceDelta;
  final DateTime updatedAt;
  final bool isDeleted;
  const ModifierItemTableData(
      {required this.id,
      required this.uuid,
      required this.groupUuid,
      required this.name,
      required this.priceDelta,
      required this.updatedAt,
      required this.isDeleted});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['uuid'] = Variable<String>(uuid);
    map['group_uuid'] = Variable<String>(groupUuid);
    map['name'] = Variable<String>(name);
    map['price_delta'] = Variable<double>(priceDelta);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['is_deleted'] = Variable<bool>(isDeleted);
    return map;
  }

  ModifierItemTableCompanion toCompanion(bool nullToAbsent) {
    return ModifierItemTableCompanion(
      id: Value(id),
      uuid: Value(uuid),
      groupUuid: Value(groupUuid),
      name: Value(name),
      priceDelta: Value(priceDelta),
      updatedAt: Value(updatedAt),
      isDeleted: Value(isDeleted),
    );
  }

  factory ModifierItemTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ModifierItemTableData(
      id: serializer.fromJson<int>(json['id']),
      uuid: serializer.fromJson<String>(json['uuid']),
      groupUuid: serializer.fromJson<String>(json['groupUuid']),
      name: serializer.fromJson<String>(json['name']),
      priceDelta: serializer.fromJson<double>(json['priceDelta']),
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
      'groupUuid': serializer.toJson<String>(groupUuid),
      'name': serializer.toJson<String>(name),
      'priceDelta': serializer.toJson<double>(priceDelta),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'isDeleted': serializer.toJson<bool>(isDeleted),
    };
  }

  ModifierItemTableData copyWith(
          {int? id,
          String? uuid,
          String? groupUuid,
          String? name,
          double? priceDelta,
          DateTime? updatedAt,
          bool? isDeleted}) =>
      ModifierItemTableData(
        id: id ?? this.id,
        uuid: uuid ?? this.uuid,
        groupUuid: groupUuid ?? this.groupUuid,
        name: name ?? this.name,
        priceDelta: priceDelta ?? this.priceDelta,
        updatedAt: updatedAt ?? this.updatedAt,
        isDeleted: isDeleted ?? this.isDeleted,
      );
  ModifierItemTableData copyWithCompanion(ModifierItemTableCompanion data) {
    return ModifierItemTableData(
      id: data.id.present ? data.id.value : this.id,
      uuid: data.uuid.present ? data.uuid.value : this.uuid,
      groupUuid: data.groupUuid.present ? data.groupUuid.value : this.groupUuid,
      name: data.name.present ? data.name.value : this.name,
      priceDelta:
          data.priceDelta.present ? data.priceDelta.value : this.priceDelta,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      isDeleted: data.isDeleted.present ? data.isDeleted.value : this.isDeleted,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ModifierItemTableData(')
          ..write('id: $id, ')
          ..write('uuid: $uuid, ')
          ..write('groupUuid: $groupUuid, ')
          ..write('name: $name, ')
          ..write('priceDelta: $priceDelta, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('isDeleted: $isDeleted')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, uuid, groupUuid, name, priceDelta, updatedAt, isDeleted);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ModifierItemTableData &&
          other.id == this.id &&
          other.uuid == this.uuid &&
          other.groupUuid == this.groupUuid &&
          other.name == this.name &&
          other.priceDelta == this.priceDelta &&
          other.updatedAt == this.updatedAt &&
          other.isDeleted == this.isDeleted);
}

class ModifierItemTableCompanion
    extends UpdateCompanion<ModifierItemTableData> {
  final Value<int> id;
  final Value<String> uuid;
  final Value<String> groupUuid;
  final Value<String> name;
  final Value<double> priceDelta;
  final Value<DateTime> updatedAt;
  final Value<bool> isDeleted;
  const ModifierItemTableCompanion({
    this.id = const Value.absent(),
    this.uuid = const Value.absent(),
    this.groupUuid = const Value.absent(),
    this.name = const Value.absent(),
    this.priceDelta = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.isDeleted = const Value.absent(),
  });
  ModifierItemTableCompanion.insert({
    this.id = const Value.absent(),
    required String uuid,
    required String groupUuid,
    required String name,
    this.priceDelta = const Value.absent(),
    required DateTime updatedAt,
    this.isDeleted = const Value.absent(),
  })  : uuid = Value(uuid),
        groupUuid = Value(groupUuid),
        name = Value(name),
        updatedAt = Value(updatedAt);
  static Insertable<ModifierItemTableData> custom({
    Expression<int>? id,
    Expression<String>? uuid,
    Expression<String>? groupUuid,
    Expression<String>? name,
    Expression<double>? priceDelta,
    Expression<DateTime>? updatedAt,
    Expression<bool>? isDeleted,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (uuid != null) 'uuid': uuid,
      if (groupUuid != null) 'group_uuid': groupUuid,
      if (name != null) 'name': name,
      if (priceDelta != null) 'price_delta': priceDelta,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (isDeleted != null) 'is_deleted': isDeleted,
    });
  }

  ModifierItemTableCompanion copyWith(
      {Value<int>? id,
      Value<String>? uuid,
      Value<String>? groupUuid,
      Value<String>? name,
      Value<double>? priceDelta,
      Value<DateTime>? updatedAt,
      Value<bool>? isDeleted}) {
    return ModifierItemTableCompanion(
      id: id ?? this.id,
      uuid: uuid ?? this.uuid,
      groupUuid: groupUuid ?? this.groupUuid,
      name: name ?? this.name,
      priceDelta: priceDelta ?? this.priceDelta,
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
    if (groupUuid.present) {
      map['group_uuid'] = Variable<String>(groupUuid.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (priceDelta.present) {
      map['price_delta'] = Variable<double>(priceDelta.value);
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
    return (StringBuffer('ModifierItemTableCompanion(')
          ..write('id: $id, ')
          ..write('uuid: $uuid, ')
          ..write('groupUuid: $groupUuid, ')
          ..write('name: $name, ')
          ..write('priceDelta: $priceDelta, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('isDeleted: $isDeleted')
          ..write(')'))
        .toString();
  }
}

class $ProductModifierLinkTableTable extends ProductModifierLinkTable
    with
        TableInfo<$ProductModifierLinkTableTable,
            ProductModifierLinkTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProductModifierLinkTableTable(this.attachedDatabase, [this._alias]);
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
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES product_table (uuid) ON DELETE CASCADE'));
  static const VerificationMeta _modifierGroupUuidMeta =
      const VerificationMeta('modifierGroupUuid');
  @override
  late final GeneratedColumn<String> modifierGroupUuid =
      GeneratedColumn<String>('modifier_group_uuid', aliasedName, false,
          type: DriftSqlType.string,
          requiredDuringInsert: true,
          defaultConstraints: GeneratedColumn.constraintIsAlways(
              'REFERENCES modifier_group_table (uuid) ON DELETE CASCADE'));
  static const VerificationMeta _sortOrderMeta =
      const VerificationMeta('sortOrder');
  @override
  late final GeneratedColumn<int> sortOrder = GeneratedColumn<int>(
      'sort_order', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  @override
  List<GeneratedColumn> get $columns =>
      [id, productUuid, modifierGroupUuid, sortOrder];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'product_modifier_link_table';
  @override
  VerificationContext validateIntegrity(
      Insertable<ProductModifierLinkTableData> instance,
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
    if (data.containsKey('modifier_group_uuid')) {
      context.handle(
          _modifierGroupUuidMeta,
          modifierGroupUuid.isAcceptableOrUnknown(
              data['modifier_group_uuid']!, _modifierGroupUuidMeta));
    } else if (isInserting) {
      context.missing(_modifierGroupUuidMeta);
    }
    if (data.containsKey('sort_order')) {
      context.handle(_sortOrderMeta,
          sortOrder.isAcceptableOrUnknown(data['sort_order']!, _sortOrderMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ProductModifierLinkTableData map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ProductModifierLinkTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      productUuid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}product_uuid'])!,
      modifierGroupUuid: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}modifier_group_uuid'])!,
      sortOrder: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}sort_order'])!,
    );
  }

  @override
  $ProductModifierLinkTableTable createAlias(String alias) {
    return $ProductModifierLinkTableTable(attachedDatabase, alias);
  }
}

class ProductModifierLinkTableData extends DataClass
    implements Insertable<ProductModifierLinkTableData> {
  final int id;
  final String productUuid;
  final String modifierGroupUuid;
  final int sortOrder;
  const ProductModifierLinkTableData(
      {required this.id,
      required this.productUuid,
      required this.modifierGroupUuid,
      required this.sortOrder});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['product_uuid'] = Variable<String>(productUuid);
    map['modifier_group_uuid'] = Variable<String>(modifierGroupUuid);
    map['sort_order'] = Variable<int>(sortOrder);
    return map;
  }

  ProductModifierLinkTableCompanion toCompanion(bool nullToAbsent) {
    return ProductModifierLinkTableCompanion(
      id: Value(id),
      productUuid: Value(productUuid),
      modifierGroupUuid: Value(modifierGroupUuid),
      sortOrder: Value(sortOrder),
    );
  }

  factory ProductModifierLinkTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ProductModifierLinkTableData(
      id: serializer.fromJson<int>(json['id']),
      productUuid: serializer.fromJson<String>(json['productUuid']),
      modifierGroupUuid: serializer.fromJson<String>(json['modifierGroupUuid']),
      sortOrder: serializer.fromJson<int>(json['sortOrder']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'productUuid': serializer.toJson<String>(productUuid),
      'modifierGroupUuid': serializer.toJson<String>(modifierGroupUuid),
      'sortOrder': serializer.toJson<int>(sortOrder),
    };
  }

  ProductModifierLinkTableData copyWith(
          {int? id,
          String? productUuid,
          String? modifierGroupUuid,
          int? sortOrder}) =>
      ProductModifierLinkTableData(
        id: id ?? this.id,
        productUuid: productUuid ?? this.productUuid,
        modifierGroupUuid: modifierGroupUuid ?? this.modifierGroupUuid,
        sortOrder: sortOrder ?? this.sortOrder,
      );
  ProductModifierLinkTableData copyWithCompanion(
      ProductModifierLinkTableCompanion data) {
    return ProductModifierLinkTableData(
      id: data.id.present ? data.id.value : this.id,
      productUuid:
          data.productUuid.present ? data.productUuid.value : this.productUuid,
      modifierGroupUuid: data.modifierGroupUuid.present
          ? data.modifierGroupUuid.value
          : this.modifierGroupUuid,
      sortOrder: data.sortOrder.present ? data.sortOrder.value : this.sortOrder,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ProductModifierLinkTableData(')
          ..write('id: $id, ')
          ..write('productUuid: $productUuid, ')
          ..write('modifierGroupUuid: $modifierGroupUuid, ')
          ..write('sortOrder: $sortOrder')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, productUuid, modifierGroupUuid, sortOrder);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ProductModifierLinkTableData &&
          other.id == this.id &&
          other.productUuid == this.productUuid &&
          other.modifierGroupUuid == this.modifierGroupUuid &&
          other.sortOrder == this.sortOrder);
}

class ProductModifierLinkTableCompanion
    extends UpdateCompanion<ProductModifierLinkTableData> {
  final Value<int> id;
  final Value<String> productUuid;
  final Value<String> modifierGroupUuid;
  final Value<int> sortOrder;
  const ProductModifierLinkTableCompanion({
    this.id = const Value.absent(),
    this.productUuid = const Value.absent(),
    this.modifierGroupUuid = const Value.absent(),
    this.sortOrder = const Value.absent(),
  });
  ProductModifierLinkTableCompanion.insert({
    this.id = const Value.absent(),
    required String productUuid,
    required String modifierGroupUuid,
    this.sortOrder = const Value.absent(),
  })  : productUuid = Value(productUuid),
        modifierGroupUuid = Value(modifierGroupUuid);
  static Insertable<ProductModifierLinkTableData> custom({
    Expression<int>? id,
    Expression<String>? productUuid,
    Expression<String>? modifierGroupUuid,
    Expression<int>? sortOrder,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (productUuid != null) 'product_uuid': productUuid,
      if (modifierGroupUuid != null) 'modifier_group_uuid': modifierGroupUuid,
      if (sortOrder != null) 'sort_order': sortOrder,
    });
  }

  ProductModifierLinkTableCompanion copyWith(
      {Value<int>? id,
      Value<String>? productUuid,
      Value<String>? modifierGroupUuid,
      Value<int>? sortOrder}) {
    return ProductModifierLinkTableCompanion(
      id: id ?? this.id,
      productUuid: productUuid ?? this.productUuid,
      modifierGroupUuid: modifierGroupUuid ?? this.modifierGroupUuid,
      sortOrder: sortOrder ?? this.sortOrder,
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
    if (modifierGroupUuid.present) {
      map['modifier_group_uuid'] = Variable<String>(modifierGroupUuid.value);
    }
    if (sortOrder.present) {
      map['sort_order'] = Variable<int>(sortOrder.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProductModifierLinkTableCompanion(')
          ..write('id: $id, ')
          ..write('productUuid: $productUuid, ')
          ..write('modifierGroupUuid: $modifierGroupUuid, ')
          ..write('sortOrder: $sortOrder')
          ..write(')'))
        .toString();
  }
}

class $IngredientTableTable extends IngredientTable
    with TableInfo<$IngredientTableTable, IngredientTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $IngredientTableTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _unitMeta = const VerificationMeta('unit');
  @override
  late final GeneratedColumn<String> unit = GeneratedColumn<String>(
      'unit', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _currentStockMeta =
      const VerificationMeta('currentStock');
  @override
  late final GeneratedColumn<double> currentStock = GeneratedColumn<double>(
      'current_stock', aliasedName, false,
      type: DriftSqlType.double,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _costPerUnitMeta =
      const VerificationMeta('costPerUnit');
  @override
  late final GeneratedColumn<double> costPerUnit = GeneratedColumn<double>(
      'cost_per_unit', aliasedName, false,
      type: DriftSqlType.double,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
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
      [id, uuid, name, unit, currentStock, costPerUnit, updatedAt, isDeleted];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'ingredient_table';
  @override
  VerificationContext validateIntegrity(
      Insertable<IngredientTableData> instance,
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
    if (data.containsKey('unit')) {
      context.handle(
          _unitMeta, unit.isAcceptableOrUnknown(data['unit']!, _unitMeta));
    } else if (isInserting) {
      context.missing(_unitMeta);
    }
    if (data.containsKey('current_stock')) {
      context.handle(
          _currentStockMeta,
          currentStock.isAcceptableOrUnknown(
              data['current_stock']!, _currentStockMeta));
    }
    if (data.containsKey('cost_per_unit')) {
      context.handle(
          _costPerUnitMeta,
          costPerUnit.isAcceptableOrUnknown(
              data['cost_per_unit']!, _costPerUnitMeta));
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
  IngredientTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return IngredientTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      uuid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}uuid'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      unit: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}unit'])!,
      currentStock: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}current_stock'])!,
      costPerUnit: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}cost_per_unit'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
      isDeleted: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_deleted'])!,
    );
  }

  @override
  $IngredientTableTable createAlias(String alias) {
    return $IngredientTableTable(attachedDatabase, alias);
  }
}

class IngredientTableData extends DataClass
    implements Insertable<IngredientTableData> {
  final int id;
  final String uuid;
  final String name;
  final String unit;
  final double currentStock;
  final double costPerUnit;
  final DateTime updatedAt;
  final bool isDeleted;
  const IngredientTableData(
      {required this.id,
      required this.uuid,
      required this.name,
      required this.unit,
      required this.currentStock,
      required this.costPerUnit,
      required this.updatedAt,
      required this.isDeleted});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['uuid'] = Variable<String>(uuid);
    map['name'] = Variable<String>(name);
    map['unit'] = Variable<String>(unit);
    map['current_stock'] = Variable<double>(currentStock);
    map['cost_per_unit'] = Variable<double>(costPerUnit);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['is_deleted'] = Variable<bool>(isDeleted);
    return map;
  }

  IngredientTableCompanion toCompanion(bool nullToAbsent) {
    return IngredientTableCompanion(
      id: Value(id),
      uuid: Value(uuid),
      name: Value(name),
      unit: Value(unit),
      currentStock: Value(currentStock),
      costPerUnit: Value(costPerUnit),
      updatedAt: Value(updatedAt),
      isDeleted: Value(isDeleted),
    );
  }

  factory IngredientTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return IngredientTableData(
      id: serializer.fromJson<int>(json['id']),
      uuid: serializer.fromJson<String>(json['uuid']),
      name: serializer.fromJson<String>(json['name']),
      unit: serializer.fromJson<String>(json['unit']),
      currentStock: serializer.fromJson<double>(json['currentStock']),
      costPerUnit: serializer.fromJson<double>(json['costPerUnit']),
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
      'unit': serializer.toJson<String>(unit),
      'currentStock': serializer.toJson<double>(currentStock),
      'costPerUnit': serializer.toJson<double>(costPerUnit),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'isDeleted': serializer.toJson<bool>(isDeleted),
    };
  }

  IngredientTableData copyWith(
          {int? id,
          String? uuid,
          String? name,
          String? unit,
          double? currentStock,
          double? costPerUnit,
          DateTime? updatedAt,
          bool? isDeleted}) =>
      IngredientTableData(
        id: id ?? this.id,
        uuid: uuid ?? this.uuid,
        name: name ?? this.name,
        unit: unit ?? this.unit,
        currentStock: currentStock ?? this.currentStock,
        costPerUnit: costPerUnit ?? this.costPerUnit,
        updatedAt: updatedAt ?? this.updatedAt,
        isDeleted: isDeleted ?? this.isDeleted,
      );
  IngredientTableData copyWithCompanion(IngredientTableCompanion data) {
    return IngredientTableData(
      id: data.id.present ? data.id.value : this.id,
      uuid: data.uuid.present ? data.uuid.value : this.uuid,
      name: data.name.present ? data.name.value : this.name,
      unit: data.unit.present ? data.unit.value : this.unit,
      currentStock: data.currentStock.present
          ? data.currentStock.value
          : this.currentStock,
      costPerUnit:
          data.costPerUnit.present ? data.costPerUnit.value : this.costPerUnit,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      isDeleted: data.isDeleted.present ? data.isDeleted.value : this.isDeleted,
    );
  }

  @override
  String toString() {
    return (StringBuffer('IngredientTableData(')
          ..write('id: $id, ')
          ..write('uuid: $uuid, ')
          ..write('name: $name, ')
          ..write('unit: $unit, ')
          ..write('currentStock: $currentStock, ')
          ..write('costPerUnit: $costPerUnit, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('isDeleted: $isDeleted')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, uuid, name, unit, currentStock, costPerUnit, updatedAt, isDeleted);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is IngredientTableData &&
          other.id == this.id &&
          other.uuid == this.uuid &&
          other.name == this.name &&
          other.unit == this.unit &&
          other.currentStock == this.currentStock &&
          other.costPerUnit == this.costPerUnit &&
          other.updatedAt == this.updatedAt &&
          other.isDeleted == this.isDeleted);
}

class IngredientTableCompanion extends UpdateCompanion<IngredientTableData> {
  final Value<int> id;
  final Value<String> uuid;
  final Value<String> name;
  final Value<String> unit;
  final Value<double> currentStock;
  final Value<double> costPerUnit;
  final Value<DateTime> updatedAt;
  final Value<bool> isDeleted;
  const IngredientTableCompanion({
    this.id = const Value.absent(),
    this.uuid = const Value.absent(),
    this.name = const Value.absent(),
    this.unit = const Value.absent(),
    this.currentStock = const Value.absent(),
    this.costPerUnit = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.isDeleted = const Value.absent(),
  });
  IngredientTableCompanion.insert({
    this.id = const Value.absent(),
    required String uuid,
    required String name,
    required String unit,
    this.currentStock = const Value.absent(),
    this.costPerUnit = const Value.absent(),
    required DateTime updatedAt,
    this.isDeleted = const Value.absent(),
  })  : uuid = Value(uuid),
        name = Value(name),
        unit = Value(unit),
        updatedAt = Value(updatedAt);
  static Insertable<IngredientTableData> custom({
    Expression<int>? id,
    Expression<String>? uuid,
    Expression<String>? name,
    Expression<String>? unit,
    Expression<double>? currentStock,
    Expression<double>? costPerUnit,
    Expression<DateTime>? updatedAt,
    Expression<bool>? isDeleted,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (uuid != null) 'uuid': uuid,
      if (name != null) 'name': name,
      if (unit != null) 'unit': unit,
      if (currentStock != null) 'current_stock': currentStock,
      if (costPerUnit != null) 'cost_per_unit': costPerUnit,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (isDeleted != null) 'is_deleted': isDeleted,
    });
  }

  IngredientTableCompanion copyWith(
      {Value<int>? id,
      Value<String>? uuid,
      Value<String>? name,
      Value<String>? unit,
      Value<double>? currentStock,
      Value<double>? costPerUnit,
      Value<DateTime>? updatedAt,
      Value<bool>? isDeleted}) {
    return IngredientTableCompanion(
      id: id ?? this.id,
      uuid: uuid ?? this.uuid,
      name: name ?? this.name,
      unit: unit ?? this.unit,
      currentStock: currentStock ?? this.currentStock,
      costPerUnit: costPerUnit ?? this.costPerUnit,
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
    if (unit.present) {
      map['unit'] = Variable<String>(unit.value);
    }
    if (currentStock.present) {
      map['current_stock'] = Variable<double>(currentStock.value);
    }
    if (costPerUnit.present) {
      map['cost_per_unit'] = Variable<double>(costPerUnit.value);
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
    return (StringBuffer('IngredientTableCompanion(')
          ..write('id: $id, ')
          ..write('uuid: $uuid, ')
          ..write('name: $name, ')
          ..write('unit: $unit, ')
          ..write('currentStock: $currentStock, ')
          ..write('costPerUnit: $costPerUnit, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('isDeleted: $isDeleted')
          ..write(')'))
        .toString();
  }
}

class $RecipeTableTable extends RecipeTable
    with TableInfo<$RecipeTableTable, RecipeTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RecipeTableTable(this.attachedDatabase, [this._alias]);
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
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES product_table (uuid) ON DELETE CASCADE'));
  static const VerificationMeta _ingredientUuidMeta =
      const VerificationMeta('ingredientUuid');
  @override
  late final GeneratedColumn<String> ingredientUuid = GeneratedColumn<String>(
      'ingredient_uuid', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES ingredient_table (uuid) ON DELETE CASCADE'));
  static const VerificationMeta _quantityRequiredMeta =
      const VerificationMeta('quantityRequired');
  @override
  late final GeneratedColumn<double> quantityRequired = GeneratedColumn<double>(
      'quantity_required', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, productUuid, ingredientUuid, quantityRequired];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'recipe_table';
  @override
  VerificationContext validateIntegrity(Insertable<RecipeTableData> instance,
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
    if (data.containsKey('ingredient_uuid')) {
      context.handle(
          _ingredientUuidMeta,
          ingredientUuid.isAcceptableOrUnknown(
              data['ingredient_uuid']!, _ingredientUuidMeta));
    } else if (isInserting) {
      context.missing(_ingredientUuidMeta);
    }
    if (data.containsKey('quantity_required')) {
      context.handle(
          _quantityRequiredMeta,
          quantityRequired.isAcceptableOrUnknown(
              data['quantity_required']!, _quantityRequiredMeta));
    } else if (isInserting) {
      context.missing(_quantityRequiredMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  RecipeTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RecipeTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      productUuid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}product_uuid'])!,
      ingredientUuid: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}ingredient_uuid'])!,
      quantityRequired: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}quantity_required'])!,
    );
  }

  @override
  $RecipeTableTable createAlias(String alias) {
    return $RecipeTableTable(attachedDatabase, alias);
  }
}

class RecipeTableData extends DataClass implements Insertable<RecipeTableData> {
  final int id;
  final String productUuid;
  final String ingredientUuid;
  final double quantityRequired;
  const RecipeTableData(
      {required this.id,
      required this.productUuid,
      required this.ingredientUuid,
      required this.quantityRequired});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['product_uuid'] = Variable<String>(productUuid);
    map['ingredient_uuid'] = Variable<String>(ingredientUuid);
    map['quantity_required'] = Variable<double>(quantityRequired);
    return map;
  }

  RecipeTableCompanion toCompanion(bool nullToAbsent) {
    return RecipeTableCompanion(
      id: Value(id),
      productUuid: Value(productUuid),
      ingredientUuid: Value(ingredientUuid),
      quantityRequired: Value(quantityRequired),
    );
  }

  factory RecipeTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RecipeTableData(
      id: serializer.fromJson<int>(json['id']),
      productUuid: serializer.fromJson<String>(json['productUuid']),
      ingredientUuid: serializer.fromJson<String>(json['ingredientUuid']),
      quantityRequired: serializer.fromJson<double>(json['quantityRequired']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'productUuid': serializer.toJson<String>(productUuid),
      'ingredientUuid': serializer.toJson<String>(ingredientUuid),
      'quantityRequired': serializer.toJson<double>(quantityRequired),
    };
  }

  RecipeTableData copyWith(
          {int? id,
          String? productUuid,
          String? ingredientUuid,
          double? quantityRequired}) =>
      RecipeTableData(
        id: id ?? this.id,
        productUuid: productUuid ?? this.productUuid,
        ingredientUuid: ingredientUuid ?? this.ingredientUuid,
        quantityRequired: quantityRequired ?? this.quantityRequired,
      );
  RecipeTableData copyWithCompanion(RecipeTableCompanion data) {
    return RecipeTableData(
      id: data.id.present ? data.id.value : this.id,
      productUuid:
          data.productUuid.present ? data.productUuid.value : this.productUuid,
      ingredientUuid: data.ingredientUuid.present
          ? data.ingredientUuid.value
          : this.ingredientUuid,
      quantityRequired: data.quantityRequired.present
          ? data.quantityRequired.value
          : this.quantityRequired,
    );
  }

  @override
  String toString() {
    return (StringBuffer('RecipeTableData(')
          ..write('id: $id, ')
          ..write('productUuid: $productUuid, ')
          ..write('ingredientUuid: $ingredientUuid, ')
          ..write('quantityRequired: $quantityRequired')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, productUuid, ingredientUuid, quantityRequired);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RecipeTableData &&
          other.id == this.id &&
          other.productUuid == this.productUuid &&
          other.ingredientUuid == this.ingredientUuid &&
          other.quantityRequired == this.quantityRequired);
}

class RecipeTableCompanion extends UpdateCompanion<RecipeTableData> {
  final Value<int> id;
  final Value<String> productUuid;
  final Value<String> ingredientUuid;
  final Value<double> quantityRequired;
  const RecipeTableCompanion({
    this.id = const Value.absent(),
    this.productUuid = const Value.absent(),
    this.ingredientUuid = const Value.absent(),
    this.quantityRequired = const Value.absent(),
  });
  RecipeTableCompanion.insert({
    this.id = const Value.absent(),
    required String productUuid,
    required String ingredientUuid,
    required double quantityRequired,
  })  : productUuid = Value(productUuid),
        ingredientUuid = Value(ingredientUuid),
        quantityRequired = Value(quantityRequired);
  static Insertable<RecipeTableData> custom({
    Expression<int>? id,
    Expression<String>? productUuid,
    Expression<String>? ingredientUuid,
    Expression<double>? quantityRequired,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (productUuid != null) 'product_uuid': productUuid,
      if (ingredientUuid != null) 'ingredient_uuid': ingredientUuid,
      if (quantityRequired != null) 'quantity_required': quantityRequired,
    });
  }

  RecipeTableCompanion copyWith(
      {Value<int>? id,
      Value<String>? productUuid,
      Value<String>? ingredientUuid,
      Value<double>? quantityRequired}) {
    return RecipeTableCompanion(
      id: id ?? this.id,
      productUuid: productUuid ?? this.productUuid,
      ingredientUuid: ingredientUuid ?? this.ingredientUuid,
      quantityRequired: quantityRequired ?? this.quantityRequired,
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
    if (ingredientUuid.present) {
      map['ingredient_uuid'] = Variable<String>(ingredientUuid.value);
    }
    if (quantityRequired.present) {
      map['quantity_required'] = Variable<double>(quantityRequired.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RecipeTableCompanion(')
          ..write('id: $id, ')
          ..write('productUuid: $productUuid, ')
          ..write('ingredientUuid: $ingredientUuid, ')
          ..write('quantityRequired: $quantityRequired')
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
      'payment_method', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
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
    } else if (isInserting) {
      context.missing(_paymentMethodMeta);
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
          .read(DriftSqlType.string, data['${effectivePrefix}payment_method'])!,
      tenderedAmount: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}tendered_amount']),
      changeAmount: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}change_amount']),
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
  final String status;
  final String paymentStatus;
  final DateTime transactionDate;
  final double subtotal;
  final double discountTotal;
  final double taxTotal;
  final double grandTotal;
  final String paymentMethod;
  final double? tenderedAmount;
  final double? changeAmount;
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
      required this.status,
      required this.paymentStatus,
      required this.transactionDate,
      required this.subtotal,
      required this.discountTotal,
      required this.taxTotal,
      required this.grandTotal,
      required this.paymentMethod,
      this.tenderedAmount,
      this.changeAmount,
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
    map['status'] = Variable<String>(status);
    map['payment_status'] = Variable<String>(paymentStatus);
    map['transaction_date'] = Variable<DateTime>(transactionDate);
    map['subtotal'] = Variable<double>(subtotal);
    map['discount_total'] = Variable<double>(discountTotal);
    map['tax_total'] = Variable<double>(taxTotal);
    map['grand_total'] = Variable<double>(grandTotal);
    map['payment_method'] = Variable<String>(paymentMethod);
    if (!nullToAbsent || tenderedAmount != null) {
      map['tendered_amount'] = Variable<double>(tenderedAmount);
    }
    if (!nullToAbsent || changeAmount != null) {
      map['change_amount'] = Variable<double>(changeAmount);
    }
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
      status: Value(status),
      paymentStatus: Value(paymentStatus),
      transactionDate: Value(transactionDate),
      subtotal: Value(subtotal),
      discountTotal: Value(discountTotal),
      taxTotal: Value(taxTotal),
      grandTotal: Value(grandTotal),
      paymentMethod: Value(paymentMethod),
      tenderedAmount: tenderedAmount == null && nullToAbsent
          ? const Value.absent()
          : Value(tenderedAmount),
      changeAmount: changeAmount == null && nullToAbsent
          ? const Value.absent()
          : Value(changeAmount),
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
      status: serializer.fromJson<String>(json['status']),
      paymentStatus: serializer.fromJson<String>(json['paymentStatus']),
      transactionDate: serializer.fromJson<DateTime>(json['transactionDate']),
      subtotal: serializer.fromJson<double>(json['subtotal']),
      discountTotal: serializer.fromJson<double>(json['discountTotal']),
      taxTotal: serializer.fromJson<double>(json['taxTotal']),
      grandTotal: serializer.fromJson<double>(json['grandTotal']),
      paymentMethod: serializer.fromJson<String>(json['paymentMethod']),
      tenderedAmount: serializer.fromJson<double?>(json['tenderedAmount']),
      changeAmount: serializer.fromJson<double?>(json['changeAmount']),
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
      'status': serializer.toJson<String>(status),
      'paymentStatus': serializer.toJson<String>(paymentStatus),
      'transactionDate': serializer.toJson<DateTime>(transactionDate),
      'subtotal': serializer.toJson<double>(subtotal),
      'discountTotal': serializer.toJson<double>(discountTotal),
      'taxTotal': serializer.toJson<double>(taxTotal),
      'grandTotal': serializer.toJson<double>(grandTotal),
      'paymentMethod': serializer.toJson<String>(paymentMethod),
      'tenderedAmount': serializer.toJson<double?>(tenderedAmount),
      'changeAmount': serializer.toJson<double?>(changeAmount),
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
          String? status,
          String? paymentStatus,
          DateTime? transactionDate,
          double? subtotal,
          double? discountTotal,
          double? taxTotal,
          double? grandTotal,
          String? paymentMethod,
          Value<double?> tenderedAmount = const Value.absent(),
          Value<double?> changeAmount = const Value.absent(),
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
        status: status ?? this.status,
        paymentStatus: paymentStatus ?? this.paymentStatus,
        transactionDate: transactionDate ?? this.transactionDate,
        subtotal: subtotal ?? this.subtotal,
        discountTotal: discountTotal ?? this.discountTotal,
        taxTotal: taxTotal ?? this.taxTotal,
        grandTotal: grandTotal ?? this.grandTotal,
        paymentMethod: paymentMethod ?? this.paymentMethod,
        tenderedAmount:
            tenderedAmount.present ? tenderedAmount.value : this.tenderedAmount,
        changeAmount:
            changeAmount.present ? changeAmount.value : this.changeAmount,
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
          ..write('isSynced: $isSynced, ')
          ..write('version: $version, ')
          ..write('syncAttempts: $syncAttempts, ')
          ..write('isFulfilled: $isFulfilled')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      uuid,
      orderNumber,
      shiftUuid,
      customerUuid,
      tenantId,
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
      isSynced,
      version,
      syncAttempts,
      isFulfilled);
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
  final Value<String> status;
  final Value<String> paymentStatus;
  final Value<DateTime> transactionDate;
  final Value<double> subtotal;
  final Value<double> discountTotal;
  final Value<double> taxTotal;
  final Value<double> grandTotal;
  final Value<String> paymentMethod;
  final Value<double?> tenderedAmount;
  final Value<double?> changeAmount;
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
    this.status = const Value.absent(),
    this.paymentStatus = const Value.absent(),
    required DateTime transactionDate,
    required double subtotal,
    required double discountTotal,
    required double taxTotal,
    required double grandTotal,
    required String paymentMethod,
    this.tenderedAmount = const Value.absent(),
    this.changeAmount = const Value.absent(),
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
        grandTotal = Value(grandTotal),
        paymentMethod = Value(paymentMethod);
  static Insertable<OrderTableData> custom({
    Expression<int>? id,
    Expression<String>? uuid,
    Expression<String>? orderNumber,
    Expression<String>? shiftUuid,
    Expression<String>? customerUuid,
    Expression<String>? tenantId,
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
      Value<String>? status,
      Value<String>? paymentStatus,
      Value<DateTime>? transactionDate,
      Value<double>? subtotal,
      Value<double>? discountTotal,
      Value<double>? taxTotal,
      Value<double>? grandTotal,
      Value<String>? paymentMethod,
      Value<double?>? tenderedAmount,
      Value<double?>? changeAmount,
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
          ..write('isSynced: $isSynced, ')
          ..write('version: $version, ')
          ..write('syncAttempts: $syncAttempts, ')
          ..write('isFulfilled: $isFulfilled')
          ..write(')'))
        .toString();
  }
}

class $OrderItemTableTable extends OrderItemTable
    with TableInfo<$OrderItemTableTable, OrderItemTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $OrderItemTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _orderUuidMeta =
      const VerificationMeta('orderUuid');
  @override
  late final GeneratedColumn<String> orderUuid = GeneratedColumn<String>(
      'order_uuid', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES order_table (uuid) ON DELETE CASCADE'));
  static const VerificationMeta _productUuidMeta =
      const VerificationMeta('productUuid');
  @override
  late final GeneratedColumn<String> productUuid = GeneratedColumn<String>(
      'product_uuid', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _priceMeta = const VerificationMeta('price');
  @override
  late final GeneratedColumn<double> price = GeneratedColumn<double>(
      'price', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _quantityMeta =
      const VerificationMeta('quantity');
  @override
  late final GeneratedColumn<double> quantity = GeneratedColumn<double>(
      'quantity', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _paidQtyMeta =
      const VerificationMeta('paidQty');
  @override
  late final GeneratedColumn<double> paidQty = GeneratedColumn<double>(
      'paid_qty', aliasedName, false,
      type: DriftSqlType.double,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _noteMeta = const VerificationMeta('note');
  @override
  late final GeneratedColumn<String> note = GeneratedColumn<String>(
      'note', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _modifiersJsonMeta =
      const VerificationMeta('modifiersJson');
  @override
  late final GeneratedColumn<String> modifiersJson = GeneratedColumn<String>(
      'modifiers_json', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _totalMeta = const VerificationMeta('total');
  @override
  late final GeneratedColumn<double> total = GeneratedColumn<double>(
      'total', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        orderUuid,
        productUuid,
        name,
        price,
        quantity,
        paidQty,
        note,
        modifiersJson,
        total
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'order_item_table';
  @override
  VerificationContext validateIntegrity(Insertable<OrderItemTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('order_uuid')) {
      context.handle(_orderUuidMeta,
          orderUuid.isAcceptableOrUnknown(data['order_uuid']!, _orderUuidMeta));
    } else if (isInserting) {
      context.missing(_orderUuidMeta);
    }
    if (data.containsKey('product_uuid')) {
      context.handle(
          _productUuidMeta,
          productUuid.isAcceptableOrUnknown(
              data['product_uuid']!, _productUuidMeta));
    } else if (isInserting) {
      context.missing(_productUuidMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('price')) {
      context.handle(
          _priceMeta, price.isAcceptableOrUnknown(data['price']!, _priceMeta));
    } else if (isInserting) {
      context.missing(_priceMeta);
    }
    if (data.containsKey('quantity')) {
      context.handle(_quantityMeta,
          quantity.isAcceptableOrUnknown(data['quantity']!, _quantityMeta));
    } else if (isInserting) {
      context.missing(_quantityMeta);
    }
    if (data.containsKey('paid_qty')) {
      context.handle(_paidQtyMeta,
          paidQty.isAcceptableOrUnknown(data['paid_qty']!, _paidQtyMeta));
    }
    if (data.containsKey('note')) {
      context.handle(
          _noteMeta, note.isAcceptableOrUnknown(data['note']!, _noteMeta));
    }
    if (data.containsKey('modifiers_json')) {
      context.handle(
          _modifiersJsonMeta,
          modifiersJson.isAcceptableOrUnknown(
              data['modifiers_json']!, _modifiersJsonMeta));
    }
    if (data.containsKey('total')) {
      context.handle(
          _totalMeta, total.isAcceptableOrUnknown(data['total']!, _totalMeta));
    } else if (isInserting) {
      context.missing(_totalMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  OrderItemTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return OrderItemTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      orderUuid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}order_uuid'])!,
      productUuid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}product_uuid'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      price: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}price'])!,
      quantity: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}quantity'])!,
      paidQty: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}paid_qty'])!,
      note: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}note']),
      modifiersJson: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}modifiers_json']),
      total: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}total'])!,
    );
  }

  @override
  $OrderItemTableTable createAlias(String alias) {
    return $OrderItemTableTable(attachedDatabase, alias);
  }
}

class OrderItemTableData extends DataClass
    implements Insertable<OrderItemTableData> {
  final int id;
  final String orderUuid;
  final String productUuid;
  final String name;
  final double price;
  final double quantity;
  final double paidQty;
  final String? note;
  final String? modifiersJson;
  final double total;
  const OrderItemTableData(
      {required this.id,
      required this.orderUuid,
      required this.productUuid,
      required this.name,
      required this.price,
      required this.quantity,
      required this.paidQty,
      this.note,
      this.modifiersJson,
      required this.total});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['order_uuid'] = Variable<String>(orderUuid);
    map['product_uuid'] = Variable<String>(productUuid);
    map['name'] = Variable<String>(name);
    map['price'] = Variable<double>(price);
    map['quantity'] = Variable<double>(quantity);
    map['paid_qty'] = Variable<double>(paidQty);
    if (!nullToAbsent || note != null) {
      map['note'] = Variable<String>(note);
    }
    if (!nullToAbsent || modifiersJson != null) {
      map['modifiers_json'] = Variable<String>(modifiersJson);
    }
    map['total'] = Variable<double>(total);
    return map;
  }

  OrderItemTableCompanion toCompanion(bool nullToAbsent) {
    return OrderItemTableCompanion(
      id: Value(id),
      orderUuid: Value(orderUuid),
      productUuid: Value(productUuid),
      name: Value(name),
      price: Value(price),
      quantity: Value(quantity),
      paidQty: Value(paidQty),
      note: note == null && nullToAbsent ? const Value.absent() : Value(note),
      modifiersJson: modifiersJson == null && nullToAbsent
          ? const Value.absent()
          : Value(modifiersJson),
      total: Value(total),
    );
  }

  factory OrderItemTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return OrderItemTableData(
      id: serializer.fromJson<int>(json['id']),
      orderUuid: serializer.fromJson<String>(json['orderUuid']),
      productUuid: serializer.fromJson<String>(json['productUuid']),
      name: serializer.fromJson<String>(json['name']),
      price: serializer.fromJson<double>(json['price']),
      quantity: serializer.fromJson<double>(json['quantity']),
      paidQty: serializer.fromJson<double>(json['paidQty']),
      note: serializer.fromJson<String?>(json['note']),
      modifiersJson: serializer.fromJson<String?>(json['modifiersJson']),
      total: serializer.fromJson<double>(json['total']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'orderUuid': serializer.toJson<String>(orderUuid),
      'productUuid': serializer.toJson<String>(productUuid),
      'name': serializer.toJson<String>(name),
      'price': serializer.toJson<double>(price),
      'quantity': serializer.toJson<double>(quantity),
      'paidQty': serializer.toJson<double>(paidQty),
      'note': serializer.toJson<String?>(note),
      'modifiersJson': serializer.toJson<String?>(modifiersJson),
      'total': serializer.toJson<double>(total),
    };
  }

  OrderItemTableData copyWith(
          {int? id,
          String? orderUuid,
          String? productUuid,
          String? name,
          double? price,
          double? quantity,
          double? paidQty,
          Value<String?> note = const Value.absent(),
          Value<String?> modifiersJson = const Value.absent(),
          double? total}) =>
      OrderItemTableData(
        id: id ?? this.id,
        orderUuid: orderUuid ?? this.orderUuid,
        productUuid: productUuid ?? this.productUuid,
        name: name ?? this.name,
        price: price ?? this.price,
        quantity: quantity ?? this.quantity,
        paidQty: paidQty ?? this.paidQty,
        note: note.present ? note.value : this.note,
        modifiersJson:
            modifiersJson.present ? modifiersJson.value : this.modifiersJson,
        total: total ?? this.total,
      );
  OrderItemTableData copyWithCompanion(OrderItemTableCompanion data) {
    return OrderItemTableData(
      id: data.id.present ? data.id.value : this.id,
      orderUuid: data.orderUuid.present ? data.orderUuid.value : this.orderUuid,
      productUuid:
          data.productUuid.present ? data.productUuid.value : this.productUuid,
      name: data.name.present ? data.name.value : this.name,
      price: data.price.present ? data.price.value : this.price,
      quantity: data.quantity.present ? data.quantity.value : this.quantity,
      paidQty: data.paidQty.present ? data.paidQty.value : this.paidQty,
      note: data.note.present ? data.note.value : this.note,
      modifiersJson: data.modifiersJson.present
          ? data.modifiersJson.value
          : this.modifiersJson,
      total: data.total.present ? data.total.value : this.total,
    );
  }

  @override
  String toString() {
    return (StringBuffer('OrderItemTableData(')
          ..write('id: $id, ')
          ..write('orderUuid: $orderUuid, ')
          ..write('productUuid: $productUuid, ')
          ..write('name: $name, ')
          ..write('price: $price, ')
          ..write('quantity: $quantity, ')
          ..write('paidQty: $paidQty, ')
          ..write('note: $note, ')
          ..write('modifiersJson: $modifiersJson, ')
          ..write('total: $total')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, orderUuid, productUuid, name, price,
      quantity, paidQty, note, modifiersJson, total);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is OrderItemTableData &&
          other.id == this.id &&
          other.orderUuid == this.orderUuid &&
          other.productUuid == this.productUuid &&
          other.name == this.name &&
          other.price == this.price &&
          other.quantity == this.quantity &&
          other.paidQty == this.paidQty &&
          other.note == this.note &&
          other.modifiersJson == this.modifiersJson &&
          other.total == this.total);
}

class OrderItemTableCompanion extends UpdateCompanion<OrderItemTableData> {
  final Value<int> id;
  final Value<String> orderUuid;
  final Value<String> productUuid;
  final Value<String> name;
  final Value<double> price;
  final Value<double> quantity;
  final Value<double> paidQty;
  final Value<String?> note;
  final Value<String?> modifiersJson;
  final Value<double> total;
  const OrderItemTableCompanion({
    this.id = const Value.absent(),
    this.orderUuid = const Value.absent(),
    this.productUuid = const Value.absent(),
    this.name = const Value.absent(),
    this.price = const Value.absent(),
    this.quantity = const Value.absent(),
    this.paidQty = const Value.absent(),
    this.note = const Value.absent(),
    this.modifiersJson = const Value.absent(),
    this.total = const Value.absent(),
  });
  OrderItemTableCompanion.insert({
    this.id = const Value.absent(),
    required String orderUuid,
    required String productUuid,
    required String name,
    required double price,
    required double quantity,
    this.paidQty = const Value.absent(),
    this.note = const Value.absent(),
    this.modifiersJson = const Value.absent(),
    required double total,
  })  : orderUuid = Value(orderUuid),
        productUuid = Value(productUuid),
        name = Value(name),
        price = Value(price),
        quantity = Value(quantity),
        total = Value(total);
  static Insertable<OrderItemTableData> custom({
    Expression<int>? id,
    Expression<String>? orderUuid,
    Expression<String>? productUuid,
    Expression<String>? name,
    Expression<double>? price,
    Expression<double>? quantity,
    Expression<double>? paidQty,
    Expression<String>? note,
    Expression<String>? modifiersJson,
    Expression<double>? total,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (orderUuid != null) 'order_uuid': orderUuid,
      if (productUuid != null) 'product_uuid': productUuid,
      if (name != null) 'name': name,
      if (price != null) 'price': price,
      if (quantity != null) 'quantity': quantity,
      if (paidQty != null) 'paid_qty': paidQty,
      if (note != null) 'note': note,
      if (modifiersJson != null) 'modifiers_json': modifiersJson,
      if (total != null) 'total': total,
    });
  }

  OrderItemTableCompanion copyWith(
      {Value<int>? id,
      Value<String>? orderUuid,
      Value<String>? productUuid,
      Value<String>? name,
      Value<double>? price,
      Value<double>? quantity,
      Value<double>? paidQty,
      Value<String?>? note,
      Value<String?>? modifiersJson,
      Value<double>? total}) {
    return OrderItemTableCompanion(
      id: id ?? this.id,
      orderUuid: orderUuid ?? this.orderUuid,
      productUuid: productUuid ?? this.productUuid,
      name: name ?? this.name,
      price: price ?? this.price,
      quantity: quantity ?? this.quantity,
      paidQty: paidQty ?? this.paidQty,
      note: note ?? this.note,
      modifiersJson: modifiersJson ?? this.modifiersJson,
      total: total ?? this.total,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (orderUuid.present) {
      map['order_uuid'] = Variable<String>(orderUuid.value);
    }
    if (productUuid.present) {
      map['product_uuid'] = Variable<String>(productUuid.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (price.present) {
      map['price'] = Variable<double>(price.value);
    }
    if (quantity.present) {
      map['quantity'] = Variable<double>(quantity.value);
    }
    if (paidQty.present) {
      map['paid_qty'] = Variable<double>(paidQty.value);
    }
    if (note.present) {
      map['note'] = Variable<String>(note.value);
    }
    if (modifiersJson.present) {
      map['modifiers_json'] = Variable<String>(modifiersJson.value);
    }
    if (total.present) {
      map['total'] = Variable<double>(total.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('OrderItemTableCompanion(')
          ..write('id: $id, ')
          ..write('orderUuid: $orderUuid, ')
          ..write('productUuid: $productUuid, ')
          ..write('name: $name, ')
          ..write('price: $price, ')
          ..write('quantity: $quantity, ')
          ..write('paidQty: $paidQty, ')
          ..write('note: $note, ')
          ..write('modifiersJson: $modifiersJson, ')
          ..write('total: $total')
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

class $InventoryCacheTableTable extends InventoryCacheTable
    with TableInfo<$InventoryCacheTableTable, InventoryCacheTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $InventoryCacheTableTable(this.attachedDatabase, [this._alias]);
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
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'));
  static const VerificationMeta _serverQuantityMeta =
      const VerificationMeta('serverQuantity');
  @override
  late final GeneratedColumn<double> serverQuantity = GeneratedColumn<double>(
      'server_quantity', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _lastSyncedAtMeta =
      const VerificationMeta('lastSyncedAt');
  @override
  late final GeneratedColumn<DateTime> lastSyncedAt = GeneratedColumn<DateTime>(
      'last_synced_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, productUuid, serverQuantity, lastSyncedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'inventory_cache_table';
  @override
  VerificationContext validateIntegrity(
      Insertable<InventoryCacheTableData> instance,
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
    if (data.containsKey('server_quantity')) {
      context.handle(
          _serverQuantityMeta,
          serverQuantity.isAcceptableOrUnknown(
              data['server_quantity']!, _serverQuantityMeta));
    } else if (isInserting) {
      context.missing(_serverQuantityMeta);
    }
    if (data.containsKey('last_synced_at')) {
      context.handle(
          _lastSyncedAtMeta,
          lastSyncedAt.isAcceptableOrUnknown(
              data['last_synced_at']!, _lastSyncedAtMeta));
    } else if (isInserting) {
      context.missing(_lastSyncedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  InventoryCacheTableData map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return InventoryCacheTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      productUuid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}product_uuid'])!,
      serverQuantity: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}server_quantity'])!,
      lastSyncedAt: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}last_synced_at'])!,
    );
  }

  @override
  $InventoryCacheTableTable createAlias(String alias) {
    return $InventoryCacheTableTable(attachedDatabase, alias);
  }
}

class InventoryCacheTableData extends DataClass
    implements Insertable<InventoryCacheTableData> {
  final int id;
  final String productUuid;
  final double serverQuantity;
  final DateTime lastSyncedAt;
  const InventoryCacheTableData(
      {required this.id,
      required this.productUuid,
      required this.serverQuantity,
      required this.lastSyncedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['product_uuid'] = Variable<String>(productUuid);
    map['server_quantity'] = Variable<double>(serverQuantity);
    map['last_synced_at'] = Variable<DateTime>(lastSyncedAt);
    return map;
  }

  InventoryCacheTableCompanion toCompanion(bool nullToAbsent) {
    return InventoryCacheTableCompanion(
      id: Value(id),
      productUuid: Value(productUuid),
      serverQuantity: Value(serverQuantity),
      lastSyncedAt: Value(lastSyncedAt),
    );
  }

  factory InventoryCacheTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return InventoryCacheTableData(
      id: serializer.fromJson<int>(json['id']),
      productUuid: serializer.fromJson<String>(json['productUuid']),
      serverQuantity: serializer.fromJson<double>(json['serverQuantity']),
      lastSyncedAt: serializer.fromJson<DateTime>(json['lastSyncedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'productUuid': serializer.toJson<String>(productUuid),
      'serverQuantity': serializer.toJson<double>(serverQuantity),
      'lastSyncedAt': serializer.toJson<DateTime>(lastSyncedAt),
    };
  }

  InventoryCacheTableData copyWith(
          {int? id,
          String? productUuid,
          double? serverQuantity,
          DateTime? lastSyncedAt}) =>
      InventoryCacheTableData(
        id: id ?? this.id,
        productUuid: productUuid ?? this.productUuid,
        serverQuantity: serverQuantity ?? this.serverQuantity,
        lastSyncedAt: lastSyncedAt ?? this.lastSyncedAt,
      );
  InventoryCacheTableData copyWithCompanion(InventoryCacheTableCompanion data) {
    return InventoryCacheTableData(
      id: data.id.present ? data.id.value : this.id,
      productUuid:
          data.productUuid.present ? data.productUuid.value : this.productUuid,
      serverQuantity: data.serverQuantity.present
          ? data.serverQuantity.value
          : this.serverQuantity,
      lastSyncedAt: data.lastSyncedAt.present
          ? data.lastSyncedAt.value
          : this.lastSyncedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('InventoryCacheTableData(')
          ..write('id: $id, ')
          ..write('productUuid: $productUuid, ')
          ..write('serverQuantity: $serverQuantity, ')
          ..write('lastSyncedAt: $lastSyncedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, productUuid, serverQuantity, lastSyncedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is InventoryCacheTableData &&
          other.id == this.id &&
          other.productUuid == this.productUuid &&
          other.serverQuantity == this.serverQuantity &&
          other.lastSyncedAt == this.lastSyncedAt);
}

class InventoryCacheTableCompanion
    extends UpdateCompanion<InventoryCacheTableData> {
  final Value<int> id;
  final Value<String> productUuid;
  final Value<double> serverQuantity;
  final Value<DateTime> lastSyncedAt;
  const InventoryCacheTableCompanion({
    this.id = const Value.absent(),
    this.productUuid = const Value.absent(),
    this.serverQuantity = const Value.absent(),
    this.lastSyncedAt = const Value.absent(),
  });
  InventoryCacheTableCompanion.insert({
    this.id = const Value.absent(),
    required String productUuid,
    required double serverQuantity,
    required DateTime lastSyncedAt,
  })  : productUuid = Value(productUuid),
        serverQuantity = Value(serverQuantity),
        lastSyncedAt = Value(lastSyncedAt);
  static Insertable<InventoryCacheTableData> custom({
    Expression<int>? id,
    Expression<String>? productUuid,
    Expression<double>? serverQuantity,
    Expression<DateTime>? lastSyncedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (productUuid != null) 'product_uuid': productUuid,
      if (serverQuantity != null) 'server_quantity': serverQuantity,
      if (lastSyncedAt != null) 'last_synced_at': lastSyncedAt,
    });
  }

  InventoryCacheTableCompanion copyWith(
      {Value<int>? id,
      Value<String>? productUuid,
      Value<double>? serverQuantity,
      Value<DateTime>? lastSyncedAt}) {
    return InventoryCacheTableCompanion(
      id: id ?? this.id,
      productUuid: productUuid ?? this.productUuid,
      serverQuantity: serverQuantity ?? this.serverQuantity,
      lastSyncedAt: lastSyncedAt ?? this.lastSyncedAt,
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
    if (serverQuantity.present) {
      map['server_quantity'] = Variable<double>(serverQuantity.value);
    }
    if (lastSyncedAt.present) {
      map['last_synced_at'] = Variable<DateTime>(lastSyncedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('InventoryCacheTableCompanion(')
          ..write('id: $id, ')
          ..write('productUuid: $productUuid, ')
          ..write('serverQuantity: $serverQuantity, ')
          ..write('lastSyncedAt: $lastSyncedAt')
          ..write(')'))
        .toString();
  }
}

class $LocalStocksTableTable extends LocalStocksTable
    with TableInfo<$LocalStocksTableTable, LocalStocksTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LocalStocksTableTable(this.attachedDatabase, [this._alias]);
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
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES product_table (uuid) ON DELETE CASCADE'));
  static const VerificationMeta _warehouseUuidMeta =
      const VerificationMeta('warehouseUuid');
  @override
  late final GeneratedColumn<String> warehouseUuid = GeneratedColumn<String>(
      'warehouse_uuid', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _quantityMeta =
      const VerificationMeta('quantity');
  @override
  late final GeneratedColumn<double> quantity = GeneratedColumn<double>(
      'quantity', aliasedName, false,
      type: DriftSqlType.double,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _versionMeta =
      const VerificationMeta('version');
  @override
  late final GeneratedColumn<int> version = GeneratedColumn<int>(
      'version', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(1));
  @override
  List<GeneratedColumn> get $columns =>
      [id, productUuid, warehouseUuid, quantity, updatedAt, version];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'local_stocks_table';
  @override
  VerificationContext validateIntegrity(
      Insertable<LocalStocksTableData> instance,
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
    if (data.containsKey('warehouse_uuid')) {
      context.handle(
          _warehouseUuidMeta,
          warehouseUuid.isAcceptableOrUnknown(
              data['warehouse_uuid']!, _warehouseUuidMeta));
    } else if (isInserting) {
      context.missing(_warehouseUuidMeta);
    }
    if (data.containsKey('quantity')) {
      context.handle(_quantityMeta,
          quantity.isAcceptableOrUnknown(data['quantity']!, _quantityMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('version')) {
      context.handle(_versionMeta,
          version.isAcceptableOrUnknown(data['version']!, _versionMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
        {productUuid, warehouseUuid},
      ];
  @override
  LocalStocksTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LocalStocksTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      productUuid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}product_uuid'])!,
      warehouseUuid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}warehouse_uuid'])!,
      quantity: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}quantity'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
      version: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}version'])!,
    );
  }

  @override
  $LocalStocksTableTable createAlias(String alias) {
    return $LocalStocksTableTable(attachedDatabase, alias);
  }
}

class LocalStocksTableData extends DataClass
    implements Insertable<LocalStocksTableData> {
  final int id;
  final String productUuid;
  final String warehouseUuid;
  final double quantity;
  final DateTime updatedAt;
  final int version;
  const LocalStocksTableData(
      {required this.id,
      required this.productUuid,
      required this.warehouseUuid,
      required this.quantity,
      required this.updatedAt,
      required this.version});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['product_uuid'] = Variable<String>(productUuid);
    map['warehouse_uuid'] = Variable<String>(warehouseUuid);
    map['quantity'] = Variable<double>(quantity);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['version'] = Variable<int>(version);
    return map;
  }

  LocalStocksTableCompanion toCompanion(bool nullToAbsent) {
    return LocalStocksTableCompanion(
      id: Value(id),
      productUuid: Value(productUuid),
      warehouseUuid: Value(warehouseUuid),
      quantity: Value(quantity),
      updatedAt: Value(updatedAt),
      version: Value(version),
    );
  }

  factory LocalStocksTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return LocalStocksTableData(
      id: serializer.fromJson<int>(json['id']),
      productUuid: serializer.fromJson<String>(json['productUuid']),
      warehouseUuid: serializer.fromJson<String>(json['warehouseUuid']),
      quantity: serializer.fromJson<double>(json['quantity']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      version: serializer.fromJson<int>(json['version']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'productUuid': serializer.toJson<String>(productUuid),
      'warehouseUuid': serializer.toJson<String>(warehouseUuid),
      'quantity': serializer.toJson<double>(quantity),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'version': serializer.toJson<int>(version),
    };
  }

  LocalStocksTableData copyWith(
          {int? id,
          String? productUuid,
          String? warehouseUuid,
          double? quantity,
          DateTime? updatedAt,
          int? version}) =>
      LocalStocksTableData(
        id: id ?? this.id,
        productUuid: productUuid ?? this.productUuid,
        warehouseUuid: warehouseUuid ?? this.warehouseUuid,
        quantity: quantity ?? this.quantity,
        updatedAt: updatedAt ?? this.updatedAt,
        version: version ?? this.version,
      );
  LocalStocksTableData copyWithCompanion(LocalStocksTableCompanion data) {
    return LocalStocksTableData(
      id: data.id.present ? data.id.value : this.id,
      productUuid:
          data.productUuid.present ? data.productUuid.value : this.productUuid,
      warehouseUuid: data.warehouseUuid.present
          ? data.warehouseUuid.value
          : this.warehouseUuid,
      quantity: data.quantity.present ? data.quantity.value : this.quantity,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      version: data.version.present ? data.version.value : this.version,
    );
  }

  @override
  String toString() {
    return (StringBuffer('LocalStocksTableData(')
          ..write('id: $id, ')
          ..write('productUuid: $productUuid, ')
          ..write('warehouseUuid: $warehouseUuid, ')
          ..write('quantity: $quantity, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('version: $version')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, productUuid, warehouseUuid, quantity, updatedAt, version);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LocalStocksTableData &&
          other.id == this.id &&
          other.productUuid == this.productUuid &&
          other.warehouseUuid == this.warehouseUuid &&
          other.quantity == this.quantity &&
          other.updatedAt == this.updatedAt &&
          other.version == this.version);
}

class LocalStocksTableCompanion extends UpdateCompanion<LocalStocksTableData> {
  final Value<int> id;
  final Value<String> productUuid;
  final Value<String> warehouseUuid;
  final Value<double> quantity;
  final Value<DateTime> updatedAt;
  final Value<int> version;
  const LocalStocksTableCompanion({
    this.id = const Value.absent(),
    this.productUuid = const Value.absent(),
    this.warehouseUuid = const Value.absent(),
    this.quantity = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.version = const Value.absent(),
  });
  LocalStocksTableCompanion.insert({
    this.id = const Value.absent(),
    required String productUuid,
    required String warehouseUuid,
    this.quantity = const Value.absent(),
    required DateTime updatedAt,
    this.version = const Value.absent(),
  })  : productUuid = Value(productUuid),
        warehouseUuid = Value(warehouseUuid),
        updatedAt = Value(updatedAt);
  static Insertable<LocalStocksTableData> custom({
    Expression<int>? id,
    Expression<String>? productUuid,
    Expression<String>? warehouseUuid,
    Expression<double>? quantity,
    Expression<DateTime>? updatedAt,
    Expression<int>? version,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (productUuid != null) 'product_uuid': productUuid,
      if (warehouseUuid != null) 'warehouse_uuid': warehouseUuid,
      if (quantity != null) 'quantity': quantity,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (version != null) 'version': version,
    });
  }

  LocalStocksTableCompanion copyWith(
      {Value<int>? id,
      Value<String>? productUuid,
      Value<String>? warehouseUuid,
      Value<double>? quantity,
      Value<DateTime>? updatedAt,
      Value<int>? version}) {
    return LocalStocksTableCompanion(
      id: id ?? this.id,
      productUuid: productUuid ?? this.productUuid,
      warehouseUuid: warehouseUuid ?? this.warehouseUuid,
      quantity: quantity ?? this.quantity,
      updatedAt: updatedAt ?? this.updatedAt,
      version: version ?? this.version,
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
    if (warehouseUuid.present) {
      map['warehouse_uuid'] = Variable<String>(warehouseUuid.value);
    }
    if (quantity.present) {
      map['quantity'] = Variable<double>(quantity.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (version.present) {
      map['version'] = Variable<int>(version.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LocalStocksTableCompanion(')
          ..write('id: $id, ')
          ..write('productUuid: $productUuid, ')
          ..write('warehouseUuid: $warehouseUuid, ')
          ..write('quantity: $quantity, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('version: $version')
          ..write(')'))
        .toString();
  }
}

class $SupplierTableTable extends SupplierTable
    with TableInfo<$SupplierTableTable, SupplierTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SupplierTableTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
      'email', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _phoneMeta = const VerificationMeta('phone');
  @override
  late final GeneratedColumn<String> phone = GeneratedColumn<String>(
      'phone', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _addressMeta =
      const VerificationMeta('address');
  @override
  late final GeneratedColumn<String> address = GeneratedColumn<String>(
      'address', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, uuid, name, email, phone, address, updatedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'supplier_table';
  @override
  VerificationContext validateIntegrity(Insertable<SupplierTableData> instance,
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
    if (data.containsKey('email')) {
      context.handle(
          _emailMeta, email.isAcceptableOrUnknown(data['email']!, _emailMeta));
    }
    if (data.containsKey('phone')) {
      context.handle(
          _phoneMeta, phone.isAcceptableOrUnknown(data['phone']!, _phoneMeta));
    }
    if (data.containsKey('address')) {
      context.handle(_addressMeta,
          address.isAcceptableOrUnknown(data['address']!, _addressMeta));
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
  SupplierTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SupplierTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      uuid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}uuid'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      email: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}email']),
      phone: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}phone']),
      address: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}address']),
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
    );
  }

  @override
  $SupplierTableTable createAlias(String alias) {
    return $SupplierTableTable(attachedDatabase, alias);
  }
}

class SupplierTableData extends DataClass
    implements Insertable<SupplierTableData> {
  final int id;
  final String uuid;
  final String name;
  final String? email;
  final String? phone;
  final String? address;
  final DateTime updatedAt;
  const SupplierTableData(
      {required this.id,
      required this.uuid,
      required this.name,
      this.email,
      this.phone,
      this.address,
      required this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['uuid'] = Variable<String>(uuid);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || email != null) {
      map['email'] = Variable<String>(email);
    }
    if (!nullToAbsent || phone != null) {
      map['phone'] = Variable<String>(phone);
    }
    if (!nullToAbsent || address != null) {
      map['address'] = Variable<String>(address);
    }
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  SupplierTableCompanion toCompanion(bool nullToAbsent) {
    return SupplierTableCompanion(
      id: Value(id),
      uuid: Value(uuid),
      name: Value(name),
      email:
          email == null && nullToAbsent ? const Value.absent() : Value(email),
      phone:
          phone == null && nullToAbsent ? const Value.absent() : Value(phone),
      address: address == null && nullToAbsent
          ? const Value.absent()
          : Value(address),
      updatedAt: Value(updatedAt),
    );
  }

  factory SupplierTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SupplierTableData(
      id: serializer.fromJson<int>(json['id']),
      uuid: serializer.fromJson<String>(json['uuid']),
      name: serializer.fromJson<String>(json['name']),
      email: serializer.fromJson<String?>(json['email']),
      phone: serializer.fromJson<String?>(json['phone']),
      address: serializer.fromJson<String?>(json['address']),
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
      'email': serializer.toJson<String?>(email),
      'phone': serializer.toJson<String?>(phone),
      'address': serializer.toJson<String?>(address),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  SupplierTableData copyWith(
          {int? id,
          String? uuid,
          String? name,
          Value<String?> email = const Value.absent(),
          Value<String?> phone = const Value.absent(),
          Value<String?> address = const Value.absent(),
          DateTime? updatedAt}) =>
      SupplierTableData(
        id: id ?? this.id,
        uuid: uuid ?? this.uuid,
        name: name ?? this.name,
        email: email.present ? email.value : this.email,
        phone: phone.present ? phone.value : this.phone,
        address: address.present ? address.value : this.address,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  SupplierTableData copyWithCompanion(SupplierTableCompanion data) {
    return SupplierTableData(
      id: data.id.present ? data.id.value : this.id,
      uuid: data.uuid.present ? data.uuid.value : this.uuid,
      name: data.name.present ? data.name.value : this.name,
      email: data.email.present ? data.email.value : this.email,
      phone: data.phone.present ? data.phone.value : this.phone,
      address: data.address.present ? data.address.value : this.address,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SupplierTableData(')
          ..write('id: $id, ')
          ..write('uuid: $uuid, ')
          ..write('name: $name, ')
          ..write('email: $email, ')
          ..write('phone: $phone, ')
          ..write('address: $address, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, uuid, name, email, phone, address, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SupplierTableData &&
          other.id == this.id &&
          other.uuid == this.uuid &&
          other.name == this.name &&
          other.email == this.email &&
          other.phone == this.phone &&
          other.address == this.address &&
          other.updatedAt == this.updatedAt);
}

class SupplierTableCompanion extends UpdateCompanion<SupplierTableData> {
  final Value<int> id;
  final Value<String> uuid;
  final Value<String> name;
  final Value<String?> email;
  final Value<String?> phone;
  final Value<String?> address;
  final Value<DateTime> updatedAt;
  const SupplierTableCompanion({
    this.id = const Value.absent(),
    this.uuid = const Value.absent(),
    this.name = const Value.absent(),
    this.email = const Value.absent(),
    this.phone = const Value.absent(),
    this.address = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  SupplierTableCompanion.insert({
    this.id = const Value.absent(),
    required String uuid,
    required String name,
    this.email = const Value.absent(),
    this.phone = const Value.absent(),
    this.address = const Value.absent(),
    required DateTime updatedAt,
  })  : uuid = Value(uuid),
        name = Value(name),
        updatedAt = Value(updatedAt);
  static Insertable<SupplierTableData> custom({
    Expression<int>? id,
    Expression<String>? uuid,
    Expression<String>? name,
    Expression<String>? email,
    Expression<String>? phone,
    Expression<String>? address,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (uuid != null) 'uuid': uuid,
      if (name != null) 'name': name,
      if (email != null) 'email': email,
      if (phone != null) 'phone': phone,
      if (address != null) 'address': address,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  SupplierTableCompanion copyWith(
      {Value<int>? id,
      Value<String>? uuid,
      Value<String>? name,
      Value<String?>? email,
      Value<String?>? phone,
      Value<String?>? address,
      Value<DateTime>? updatedAt}) {
    return SupplierTableCompanion(
      id: id ?? this.id,
      uuid: uuid ?? this.uuid,
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      address: address ?? this.address,
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
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (phone.present) {
      map['phone'] = Variable<String>(phone.value);
    }
    if (address.present) {
      map['address'] = Variable<String>(address.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SupplierTableCompanion(')
          ..write('id: $id, ')
          ..write('uuid: $uuid, ')
          ..write('name: $name, ')
          ..write('email: $email, ')
          ..write('phone: $phone, ')
          ..write('address: $address, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $ProductSupplierTableTable extends ProductSupplierTable
    with TableInfo<$ProductSupplierTableTable, ProductSupplierTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProductSupplierTableTable(this.attachedDatabase, [this._alias]);
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
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES product_table (uuid) ON DELETE CASCADE'));
  static const VerificationMeta _supplierUuidMeta =
      const VerificationMeta('supplierUuid');
  @override
  late final GeneratedColumn<String> supplierUuid = GeneratedColumn<String>(
      'supplier_uuid', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES supplier_table (uuid) ON DELETE CASCADE'));
  static const VerificationMeta _costPriceMeta =
      const VerificationMeta('costPrice');
  @override
  late final GeneratedColumn<double> costPrice = GeneratedColumn<double>(
      'cost_price', aliasedName, false,
      type: DriftSqlType.double,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _leadTimeDaysMeta =
      const VerificationMeta('leadTimeDays');
  @override
  late final GeneratedColumn<int> leadTimeDays = GeneratedColumn<int>(
      'lead_time_days', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _minOrderQtyMeta =
      const VerificationMeta('minOrderQty');
  @override
  late final GeneratedColumn<double> minOrderQty = GeneratedColumn<double>(
      'min_order_qty', aliasedName, false,
      type: DriftSqlType.double,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  @override
  List<GeneratedColumn> get $columns =>
      [id, productUuid, supplierUuid, costPrice, leadTimeDays, minOrderQty];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'product_supplier_table';
  @override
  VerificationContext validateIntegrity(
      Insertable<ProductSupplierTableData> instance,
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
    if (data.containsKey('supplier_uuid')) {
      context.handle(
          _supplierUuidMeta,
          supplierUuid.isAcceptableOrUnknown(
              data['supplier_uuid']!, _supplierUuidMeta));
    } else if (isInserting) {
      context.missing(_supplierUuidMeta);
    }
    if (data.containsKey('cost_price')) {
      context.handle(_costPriceMeta,
          costPrice.isAcceptableOrUnknown(data['cost_price']!, _costPriceMeta));
    }
    if (data.containsKey('lead_time_days')) {
      context.handle(
          _leadTimeDaysMeta,
          leadTimeDays.isAcceptableOrUnknown(
              data['lead_time_days']!, _leadTimeDaysMeta));
    }
    if (data.containsKey('min_order_qty')) {
      context.handle(
          _minOrderQtyMeta,
          minOrderQty.isAcceptableOrUnknown(
              data['min_order_qty']!, _minOrderQtyMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
        {productUuid, supplierUuid},
      ];
  @override
  ProductSupplierTableData map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ProductSupplierTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      productUuid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}product_uuid'])!,
      supplierUuid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}supplier_uuid'])!,
      costPrice: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}cost_price'])!,
      leadTimeDays: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}lead_time_days'])!,
      minOrderQty: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}min_order_qty'])!,
    );
  }

  @override
  $ProductSupplierTableTable createAlias(String alias) {
    return $ProductSupplierTableTable(attachedDatabase, alias);
  }
}

class ProductSupplierTableData extends DataClass
    implements Insertable<ProductSupplierTableData> {
  final int id;
  final String productUuid;
  final String supplierUuid;
  final double costPrice;
  final int leadTimeDays;
  final double minOrderQty;
  const ProductSupplierTableData(
      {required this.id,
      required this.productUuid,
      required this.supplierUuid,
      required this.costPrice,
      required this.leadTimeDays,
      required this.minOrderQty});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['product_uuid'] = Variable<String>(productUuid);
    map['supplier_uuid'] = Variable<String>(supplierUuid);
    map['cost_price'] = Variable<double>(costPrice);
    map['lead_time_days'] = Variable<int>(leadTimeDays);
    map['min_order_qty'] = Variable<double>(minOrderQty);
    return map;
  }

  ProductSupplierTableCompanion toCompanion(bool nullToAbsent) {
    return ProductSupplierTableCompanion(
      id: Value(id),
      productUuid: Value(productUuid),
      supplierUuid: Value(supplierUuid),
      costPrice: Value(costPrice),
      leadTimeDays: Value(leadTimeDays),
      minOrderQty: Value(minOrderQty),
    );
  }

  factory ProductSupplierTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ProductSupplierTableData(
      id: serializer.fromJson<int>(json['id']),
      productUuid: serializer.fromJson<String>(json['productUuid']),
      supplierUuid: serializer.fromJson<String>(json['supplierUuid']),
      costPrice: serializer.fromJson<double>(json['costPrice']),
      leadTimeDays: serializer.fromJson<int>(json['leadTimeDays']),
      minOrderQty: serializer.fromJson<double>(json['minOrderQty']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'productUuid': serializer.toJson<String>(productUuid),
      'supplierUuid': serializer.toJson<String>(supplierUuid),
      'costPrice': serializer.toJson<double>(costPrice),
      'leadTimeDays': serializer.toJson<int>(leadTimeDays),
      'minOrderQty': serializer.toJson<double>(minOrderQty),
    };
  }

  ProductSupplierTableData copyWith(
          {int? id,
          String? productUuid,
          String? supplierUuid,
          double? costPrice,
          int? leadTimeDays,
          double? minOrderQty}) =>
      ProductSupplierTableData(
        id: id ?? this.id,
        productUuid: productUuid ?? this.productUuid,
        supplierUuid: supplierUuid ?? this.supplierUuid,
        costPrice: costPrice ?? this.costPrice,
        leadTimeDays: leadTimeDays ?? this.leadTimeDays,
        minOrderQty: minOrderQty ?? this.minOrderQty,
      );
  ProductSupplierTableData copyWithCompanion(
      ProductSupplierTableCompanion data) {
    return ProductSupplierTableData(
      id: data.id.present ? data.id.value : this.id,
      productUuid:
          data.productUuid.present ? data.productUuid.value : this.productUuid,
      supplierUuid: data.supplierUuid.present
          ? data.supplierUuid.value
          : this.supplierUuid,
      costPrice: data.costPrice.present ? data.costPrice.value : this.costPrice,
      leadTimeDays: data.leadTimeDays.present
          ? data.leadTimeDays.value
          : this.leadTimeDays,
      minOrderQty:
          data.minOrderQty.present ? data.minOrderQty.value : this.minOrderQty,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ProductSupplierTableData(')
          ..write('id: $id, ')
          ..write('productUuid: $productUuid, ')
          ..write('supplierUuid: $supplierUuid, ')
          ..write('costPrice: $costPrice, ')
          ..write('leadTimeDays: $leadTimeDays, ')
          ..write('minOrderQty: $minOrderQty')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, productUuid, supplierUuid, costPrice, leadTimeDays, minOrderQty);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ProductSupplierTableData &&
          other.id == this.id &&
          other.productUuid == this.productUuid &&
          other.supplierUuid == this.supplierUuid &&
          other.costPrice == this.costPrice &&
          other.leadTimeDays == this.leadTimeDays &&
          other.minOrderQty == this.minOrderQty);
}

class ProductSupplierTableCompanion
    extends UpdateCompanion<ProductSupplierTableData> {
  final Value<int> id;
  final Value<String> productUuid;
  final Value<String> supplierUuid;
  final Value<double> costPrice;
  final Value<int> leadTimeDays;
  final Value<double> minOrderQty;
  const ProductSupplierTableCompanion({
    this.id = const Value.absent(),
    this.productUuid = const Value.absent(),
    this.supplierUuid = const Value.absent(),
    this.costPrice = const Value.absent(),
    this.leadTimeDays = const Value.absent(),
    this.minOrderQty = const Value.absent(),
  });
  ProductSupplierTableCompanion.insert({
    this.id = const Value.absent(),
    required String productUuid,
    required String supplierUuid,
    this.costPrice = const Value.absent(),
    this.leadTimeDays = const Value.absent(),
    this.minOrderQty = const Value.absent(),
  })  : productUuid = Value(productUuid),
        supplierUuid = Value(supplierUuid);
  static Insertable<ProductSupplierTableData> custom({
    Expression<int>? id,
    Expression<String>? productUuid,
    Expression<String>? supplierUuid,
    Expression<double>? costPrice,
    Expression<int>? leadTimeDays,
    Expression<double>? minOrderQty,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (productUuid != null) 'product_uuid': productUuid,
      if (supplierUuid != null) 'supplier_uuid': supplierUuid,
      if (costPrice != null) 'cost_price': costPrice,
      if (leadTimeDays != null) 'lead_time_days': leadTimeDays,
      if (minOrderQty != null) 'min_order_qty': minOrderQty,
    });
  }

  ProductSupplierTableCompanion copyWith(
      {Value<int>? id,
      Value<String>? productUuid,
      Value<String>? supplierUuid,
      Value<double>? costPrice,
      Value<int>? leadTimeDays,
      Value<double>? minOrderQty}) {
    return ProductSupplierTableCompanion(
      id: id ?? this.id,
      productUuid: productUuid ?? this.productUuid,
      supplierUuid: supplierUuid ?? this.supplierUuid,
      costPrice: costPrice ?? this.costPrice,
      leadTimeDays: leadTimeDays ?? this.leadTimeDays,
      minOrderQty: minOrderQty ?? this.minOrderQty,
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
    if (supplierUuid.present) {
      map['supplier_uuid'] = Variable<String>(supplierUuid.value);
    }
    if (costPrice.present) {
      map['cost_price'] = Variable<double>(costPrice.value);
    }
    if (leadTimeDays.present) {
      map['lead_time_days'] = Variable<int>(leadTimeDays.value);
    }
    if (minOrderQty.present) {
      map['min_order_qty'] = Variable<double>(minOrderQty.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProductSupplierTableCompanion(')
          ..write('id: $id, ')
          ..write('productUuid: $productUuid, ')
          ..write('supplierUuid: $supplierUuid, ')
          ..write('costPrice: $costPrice, ')
          ..write('leadTimeDays: $leadTimeDays, ')
          ..write('minOrderQty: $minOrderQty')
          ..write(')'))
        .toString();
  }
}

class $PurchaseOrderTableTable extends PurchaseOrderTable
    with TableInfo<$PurchaseOrderTableTable, PurchaseOrderTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PurchaseOrderTableTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _supplierUuidMeta =
      const VerificationMeta('supplierUuid');
  @override
  late final GeneratedColumn<String> supplierUuid = GeneratedColumn<String>(
      'supplier_uuid', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES supplier_table (uuid) ON DELETE CASCADE'));
  static const VerificationMeta _targetWarehouseUuidMeta =
      const VerificationMeta('targetWarehouseUuid');
  @override
  late final GeneratedColumn<String> targetWarehouseUuid =
      GeneratedColumn<String>('target_warehouse_uuid', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
      'status', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('PENDING'));
  static const VerificationMeta _referenceNumberMeta =
      const VerificationMeta('referenceNumber');
  @override
  late final GeneratedColumn<String> referenceNumber = GeneratedColumn<String>(
      'reference_number', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
      'notes', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _totalCostMeta =
      const VerificationMeta('totalCost');
  @override
  late final GeneratedColumn<double> totalCost = GeneratedColumn<double>(
      'total_cost', aliasedName, false,
      type: DriftSqlType.double,
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
  @override
  List<GeneratedColumn> get $columns => [
        id,
        uuid,
        supplierUuid,
        targetWarehouseUuid,
        status,
        referenceNumber,
        notes,
        totalCost,
        createdAt,
        updatedAt,
        isSynced
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'purchase_order_table';
  @override
  VerificationContext validateIntegrity(
      Insertable<PurchaseOrderTableData> instance,
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
    if (data.containsKey('supplier_uuid')) {
      context.handle(
          _supplierUuidMeta,
          supplierUuid.isAcceptableOrUnknown(
              data['supplier_uuid']!, _supplierUuidMeta));
    } else if (isInserting) {
      context.missing(_supplierUuidMeta);
    }
    if (data.containsKey('target_warehouse_uuid')) {
      context.handle(
          _targetWarehouseUuidMeta,
          targetWarehouseUuid.isAcceptableOrUnknown(
              data['target_warehouse_uuid']!, _targetWarehouseUuidMeta));
    } else if (isInserting) {
      context.missing(_targetWarehouseUuidMeta);
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status']!, _statusMeta));
    }
    if (data.containsKey('reference_number')) {
      context.handle(
          _referenceNumberMeta,
          referenceNumber.isAcceptableOrUnknown(
              data['reference_number']!, _referenceNumberMeta));
    }
    if (data.containsKey('notes')) {
      context.handle(
          _notesMeta, notes.isAcceptableOrUnknown(data['notes']!, _notesMeta));
    }
    if (data.containsKey('total_cost')) {
      context.handle(_totalCostMeta,
          totalCost.isAcceptableOrUnknown(data['total_cost']!, _totalCostMeta));
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
    if (data.containsKey('is_synced')) {
      context.handle(_isSyncedMeta,
          isSynced.isAcceptableOrUnknown(data['is_synced']!, _isSyncedMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PurchaseOrderTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PurchaseOrderTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      uuid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}uuid'])!,
      supplierUuid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}supplier_uuid'])!,
      targetWarehouseUuid: attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}target_warehouse_uuid'])!,
      status: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}status'])!,
      referenceNumber: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}reference_number']),
      notes: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}notes']),
      totalCost: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}total_cost'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
      isSynced: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_synced'])!,
    );
  }

  @override
  $PurchaseOrderTableTable createAlias(String alias) {
    return $PurchaseOrderTableTable(attachedDatabase, alias);
  }
}

class PurchaseOrderTableData extends DataClass
    implements Insertable<PurchaseOrderTableData> {
  final int id;
  final String uuid;
  final String supplierUuid;
  final String targetWarehouseUuid;
  final String status;
  final String? referenceNumber;
  final String? notes;
  final double totalCost;
  final DateTime createdAt;
  final DateTime updatedAt;
  final bool isSynced;
  const PurchaseOrderTableData(
      {required this.id,
      required this.uuid,
      required this.supplierUuid,
      required this.targetWarehouseUuid,
      required this.status,
      this.referenceNumber,
      this.notes,
      required this.totalCost,
      required this.createdAt,
      required this.updatedAt,
      required this.isSynced});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['uuid'] = Variable<String>(uuid);
    map['supplier_uuid'] = Variable<String>(supplierUuid);
    map['target_warehouse_uuid'] = Variable<String>(targetWarehouseUuid);
    map['status'] = Variable<String>(status);
    if (!nullToAbsent || referenceNumber != null) {
      map['reference_number'] = Variable<String>(referenceNumber);
    }
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    map['total_cost'] = Variable<double>(totalCost);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['is_synced'] = Variable<bool>(isSynced);
    return map;
  }

  PurchaseOrderTableCompanion toCompanion(bool nullToAbsent) {
    return PurchaseOrderTableCompanion(
      id: Value(id),
      uuid: Value(uuid),
      supplierUuid: Value(supplierUuid),
      targetWarehouseUuid: Value(targetWarehouseUuid),
      status: Value(status),
      referenceNumber: referenceNumber == null && nullToAbsent
          ? const Value.absent()
          : Value(referenceNumber),
      notes:
          notes == null && nullToAbsent ? const Value.absent() : Value(notes),
      totalCost: Value(totalCost),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      isSynced: Value(isSynced),
    );
  }

  factory PurchaseOrderTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PurchaseOrderTableData(
      id: serializer.fromJson<int>(json['id']),
      uuid: serializer.fromJson<String>(json['uuid']),
      supplierUuid: serializer.fromJson<String>(json['supplierUuid']),
      targetWarehouseUuid:
          serializer.fromJson<String>(json['targetWarehouseUuid']),
      status: serializer.fromJson<String>(json['status']),
      referenceNumber: serializer.fromJson<String?>(json['referenceNumber']),
      notes: serializer.fromJson<String?>(json['notes']),
      totalCost: serializer.fromJson<double>(json['totalCost']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      isSynced: serializer.fromJson<bool>(json['isSynced']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'uuid': serializer.toJson<String>(uuid),
      'supplierUuid': serializer.toJson<String>(supplierUuid),
      'targetWarehouseUuid': serializer.toJson<String>(targetWarehouseUuid),
      'status': serializer.toJson<String>(status),
      'referenceNumber': serializer.toJson<String?>(referenceNumber),
      'notes': serializer.toJson<String?>(notes),
      'totalCost': serializer.toJson<double>(totalCost),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'isSynced': serializer.toJson<bool>(isSynced),
    };
  }

  PurchaseOrderTableData copyWith(
          {int? id,
          String? uuid,
          String? supplierUuid,
          String? targetWarehouseUuid,
          String? status,
          Value<String?> referenceNumber = const Value.absent(),
          Value<String?> notes = const Value.absent(),
          double? totalCost,
          DateTime? createdAt,
          DateTime? updatedAt,
          bool? isSynced}) =>
      PurchaseOrderTableData(
        id: id ?? this.id,
        uuid: uuid ?? this.uuid,
        supplierUuid: supplierUuid ?? this.supplierUuid,
        targetWarehouseUuid: targetWarehouseUuid ?? this.targetWarehouseUuid,
        status: status ?? this.status,
        referenceNumber: referenceNumber.present
            ? referenceNumber.value
            : this.referenceNumber,
        notes: notes.present ? notes.value : this.notes,
        totalCost: totalCost ?? this.totalCost,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        isSynced: isSynced ?? this.isSynced,
      );
  PurchaseOrderTableData copyWithCompanion(PurchaseOrderTableCompanion data) {
    return PurchaseOrderTableData(
      id: data.id.present ? data.id.value : this.id,
      uuid: data.uuid.present ? data.uuid.value : this.uuid,
      supplierUuid: data.supplierUuid.present
          ? data.supplierUuid.value
          : this.supplierUuid,
      targetWarehouseUuid: data.targetWarehouseUuid.present
          ? data.targetWarehouseUuid.value
          : this.targetWarehouseUuid,
      status: data.status.present ? data.status.value : this.status,
      referenceNumber: data.referenceNumber.present
          ? data.referenceNumber.value
          : this.referenceNumber,
      notes: data.notes.present ? data.notes.value : this.notes,
      totalCost: data.totalCost.present ? data.totalCost.value : this.totalCost,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      isSynced: data.isSynced.present ? data.isSynced.value : this.isSynced,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PurchaseOrderTableData(')
          ..write('id: $id, ')
          ..write('uuid: $uuid, ')
          ..write('supplierUuid: $supplierUuid, ')
          ..write('targetWarehouseUuid: $targetWarehouseUuid, ')
          ..write('status: $status, ')
          ..write('referenceNumber: $referenceNumber, ')
          ..write('notes: $notes, ')
          ..write('totalCost: $totalCost, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('isSynced: $isSynced')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      uuid,
      supplierUuid,
      targetWarehouseUuid,
      status,
      referenceNumber,
      notes,
      totalCost,
      createdAt,
      updatedAt,
      isSynced);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PurchaseOrderTableData &&
          other.id == this.id &&
          other.uuid == this.uuid &&
          other.supplierUuid == this.supplierUuid &&
          other.targetWarehouseUuid == this.targetWarehouseUuid &&
          other.status == this.status &&
          other.referenceNumber == this.referenceNumber &&
          other.notes == this.notes &&
          other.totalCost == this.totalCost &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.isSynced == this.isSynced);
}

class PurchaseOrderTableCompanion
    extends UpdateCompanion<PurchaseOrderTableData> {
  final Value<int> id;
  final Value<String> uuid;
  final Value<String> supplierUuid;
  final Value<String> targetWarehouseUuid;
  final Value<String> status;
  final Value<String?> referenceNumber;
  final Value<String?> notes;
  final Value<double> totalCost;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<bool> isSynced;
  const PurchaseOrderTableCompanion({
    this.id = const Value.absent(),
    this.uuid = const Value.absent(),
    this.supplierUuid = const Value.absent(),
    this.targetWarehouseUuid = const Value.absent(),
    this.status = const Value.absent(),
    this.referenceNumber = const Value.absent(),
    this.notes = const Value.absent(),
    this.totalCost = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.isSynced = const Value.absent(),
  });
  PurchaseOrderTableCompanion.insert({
    this.id = const Value.absent(),
    required String uuid,
    required String supplierUuid,
    required String targetWarehouseUuid,
    this.status = const Value.absent(),
    this.referenceNumber = const Value.absent(),
    this.notes = const Value.absent(),
    this.totalCost = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
    this.isSynced = const Value.absent(),
  })  : uuid = Value(uuid),
        supplierUuid = Value(supplierUuid),
        targetWarehouseUuid = Value(targetWarehouseUuid),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt);
  static Insertable<PurchaseOrderTableData> custom({
    Expression<int>? id,
    Expression<String>? uuid,
    Expression<String>? supplierUuid,
    Expression<String>? targetWarehouseUuid,
    Expression<String>? status,
    Expression<String>? referenceNumber,
    Expression<String>? notes,
    Expression<double>? totalCost,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<bool>? isSynced,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (uuid != null) 'uuid': uuid,
      if (supplierUuid != null) 'supplier_uuid': supplierUuid,
      if (targetWarehouseUuid != null)
        'target_warehouse_uuid': targetWarehouseUuid,
      if (status != null) 'status': status,
      if (referenceNumber != null) 'reference_number': referenceNumber,
      if (notes != null) 'notes': notes,
      if (totalCost != null) 'total_cost': totalCost,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (isSynced != null) 'is_synced': isSynced,
    });
  }

  PurchaseOrderTableCompanion copyWith(
      {Value<int>? id,
      Value<String>? uuid,
      Value<String>? supplierUuid,
      Value<String>? targetWarehouseUuid,
      Value<String>? status,
      Value<String?>? referenceNumber,
      Value<String?>? notes,
      Value<double>? totalCost,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<bool>? isSynced}) {
    return PurchaseOrderTableCompanion(
      id: id ?? this.id,
      uuid: uuid ?? this.uuid,
      supplierUuid: supplierUuid ?? this.supplierUuid,
      targetWarehouseUuid: targetWarehouseUuid ?? this.targetWarehouseUuid,
      status: status ?? this.status,
      referenceNumber: referenceNumber ?? this.referenceNumber,
      notes: notes ?? this.notes,
      totalCost: totalCost ?? this.totalCost,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      isSynced: isSynced ?? this.isSynced,
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
    if (supplierUuid.present) {
      map['supplier_uuid'] = Variable<String>(supplierUuid.value);
    }
    if (targetWarehouseUuid.present) {
      map['target_warehouse_uuid'] =
          Variable<String>(targetWarehouseUuid.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (referenceNumber.present) {
      map['reference_number'] = Variable<String>(referenceNumber.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (totalCost.present) {
      map['total_cost'] = Variable<double>(totalCost.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (isSynced.present) {
      map['is_synced'] = Variable<bool>(isSynced.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PurchaseOrderTableCompanion(')
          ..write('id: $id, ')
          ..write('uuid: $uuid, ')
          ..write('supplierUuid: $supplierUuid, ')
          ..write('targetWarehouseUuid: $targetWarehouseUuid, ')
          ..write('status: $status, ')
          ..write('referenceNumber: $referenceNumber, ')
          ..write('notes: $notes, ')
          ..write('totalCost: $totalCost, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('isSynced: $isSynced')
          ..write(')'))
        .toString();
  }
}

class $PurchaseOrderItemTableTable extends PurchaseOrderItemTable
    with TableInfo<$PurchaseOrderItemTableTable, PurchaseOrderItemTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PurchaseOrderItemTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _poUuidMeta = const VerificationMeta('poUuid');
  @override
  late final GeneratedColumn<String> poUuid = GeneratedColumn<String>(
      'po_uuid', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES purchase_order_table (uuid) ON DELETE CASCADE'));
  static const VerificationMeta _productUuidMeta =
      const VerificationMeta('productUuid');
  @override
  late final GeneratedColumn<String> productUuid = GeneratedColumn<String>(
      'product_uuid', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES product_table (uuid) ON DELETE CASCADE'));
  static const VerificationMeta _quantityOrderedMeta =
      const VerificationMeta('quantityOrdered');
  @override
  late final GeneratedColumn<double> quantityOrdered = GeneratedColumn<double>(
      'quantity_ordered', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _quantityReceivedMeta =
      const VerificationMeta('quantityReceived');
  @override
  late final GeneratedColumn<double> quantityReceived = GeneratedColumn<double>(
      'quantity_received', aliasedName, false,
      type: DriftSqlType.double,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _unitCostMeta =
      const VerificationMeta('unitCost');
  @override
  late final GeneratedColumn<double> unitCost = GeneratedColumn<double>(
      'unit_cost', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, poUuid, productUuid, quantityOrdered, quantityReceived, unitCost];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'purchase_order_item_table';
  @override
  VerificationContext validateIntegrity(
      Insertable<PurchaseOrderItemTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('po_uuid')) {
      context.handle(_poUuidMeta,
          poUuid.isAcceptableOrUnknown(data['po_uuid']!, _poUuidMeta));
    } else if (isInserting) {
      context.missing(_poUuidMeta);
    }
    if (data.containsKey('product_uuid')) {
      context.handle(
          _productUuidMeta,
          productUuid.isAcceptableOrUnknown(
              data['product_uuid']!, _productUuidMeta));
    } else if (isInserting) {
      context.missing(_productUuidMeta);
    }
    if (data.containsKey('quantity_ordered')) {
      context.handle(
          _quantityOrderedMeta,
          quantityOrdered.isAcceptableOrUnknown(
              data['quantity_ordered']!, _quantityOrderedMeta));
    } else if (isInserting) {
      context.missing(_quantityOrderedMeta);
    }
    if (data.containsKey('quantity_received')) {
      context.handle(
          _quantityReceivedMeta,
          quantityReceived.isAcceptableOrUnknown(
              data['quantity_received']!, _quantityReceivedMeta));
    }
    if (data.containsKey('unit_cost')) {
      context.handle(_unitCostMeta,
          unitCost.isAcceptableOrUnknown(data['unit_cost']!, _unitCostMeta));
    } else if (isInserting) {
      context.missing(_unitCostMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PurchaseOrderItemTableData map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PurchaseOrderItemTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      poUuid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}po_uuid'])!,
      productUuid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}product_uuid'])!,
      quantityOrdered: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}quantity_ordered'])!,
      quantityReceived: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}quantity_received'])!,
      unitCost: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}unit_cost'])!,
    );
  }

  @override
  $PurchaseOrderItemTableTable createAlias(String alias) {
    return $PurchaseOrderItemTableTable(attachedDatabase, alias);
  }
}

class PurchaseOrderItemTableData extends DataClass
    implements Insertable<PurchaseOrderItemTableData> {
  final int id;
  final String poUuid;
  final String productUuid;
  final double quantityOrdered;
  final double quantityReceived;
  final double unitCost;
  const PurchaseOrderItemTableData(
      {required this.id,
      required this.poUuid,
      required this.productUuid,
      required this.quantityOrdered,
      required this.quantityReceived,
      required this.unitCost});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['po_uuid'] = Variable<String>(poUuid);
    map['product_uuid'] = Variable<String>(productUuid);
    map['quantity_ordered'] = Variable<double>(quantityOrdered);
    map['quantity_received'] = Variable<double>(quantityReceived);
    map['unit_cost'] = Variable<double>(unitCost);
    return map;
  }

  PurchaseOrderItemTableCompanion toCompanion(bool nullToAbsent) {
    return PurchaseOrderItemTableCompanion(
      id: Value(id),
      poUuid: Value(poUuid),
      productUuid: Value(productUuid),
      quantityOrdered: Value(quantityOrdered),
      quantityReceived: Value(quantityReceived),
      unitCost: Value(unitCost),
    );
  }

  factory PurchaseOrderItemTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PurchaseOrderItemTableData(
      id: serializer.fromJson<int>(json['id']),
      poUuid: serializer.fromJson<String>(json['poUuid']),
      productUuid: serializer.fromJson<String>(json['productUuid']),
      quantityOrdered: serializer.fromJson<double>(json['quantityOrdered']),
      quantityReceived: serializer.fromJson<double>(json['quantityReceived']),
      unitCost: serializer.fromJson<double>(json['unitCost']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'poUuid': serializer.toJson<String>(poUuid),
      'productUuid': serializer.toJson<String>(productUuid),
      'quantityOrdered': serializer.toJson<double>(quantityOrdered),
      'quantityReceived': serializer.toJson<double>(quantityReceived),
      'unitCost': serializer.toJson<double>(unitCost),
    };
  }

  PurchaseOrderItemTableData copyWith(
          {int? id,
          String? poUuid,
          String? productUuid,
          double? quantityOrdered,
          double? quantityReceived,
          double? unitCost}) =>
      PurchaseOrderItemTableData(
        id: id ?? this.id,
        poUuid: poUuid ?? this.poUuid,
        productUuid: productUuid ?? this.productUuid,
        quantityOrdered: quantityOrdered ?? this.quantityOrdered,
        quantityReceived: quantityReceived ?? this.quantityReceived,
        unitCost: unitCost ?? this.unitCost,
      );
  PurchaseOrderItemTableData copyWithCompanion(
      PurchaseOrderItemTableCompanion data) {
    return PurchaseOrderItemTableData(
      id: data.id.present ? data.id.value : this.id,
      poUuid: data.poUuid.present ? data.poUuid.value : this.poUuid,
      productUuid:
          data.productUuid.present ? data.productUuid.value : this.productUuid,
      quantityOrdered: data.quantityOrdered.present
          ? data.quantityOrdered.value
          : this.quantityOrdered,
      quantityReceived: data.quantityReceived.present
          ? data.quantityReceived.value
          : this.quantityReceived,
      unitCost: data.unitCost.present ? data.unitCost.value : this.unitCost,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PurchaseOrderItemTableData(')
          ..write('id: $id, ')
          ..write('poUuid: $poUuid, ')
          ..write('productUuid: $productUuid, ')
          ..write('quantityOrdered: $quantityOrdered, ')
          ..write('quantityReceived: $quantityReceived, ')
          ..write('unitCost: $unitCost')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, poUuid, productUuid, quantityOrdered, quantityReceived, unitCost);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PurchaseOrderItemTableData &&
          other.id == this.id &&
          other.poUuid == this.poUuid &&
          other.productUuid == this.productUuid &&
          other.quantityOrdered == this.quantityOrdered &&
          other.quantityReceived == this.quantityReceived &&
          other.unitCost == this.unitCost);
}

class PurchaseOrderItemTableCompanion
    extends UpdateCompanion<PurchaseOrderItemTableData> {
  final Value<int> id;
  final Value<String> poUuid;
  final Value<String> productUuid;
  final Value<double> quantityOrdered;
  final Value<double> quantityReceived;
  final Value<double> unitCost;
  const PurchaseOrderItemTableCompanion({
    this.id = const Value.absent(),
    this.poUuid = const Value.absent(),
    this.productUuid = const Value.absent(),
    this.quantityOrdered = const Value.absent(),
    this.quantityReceived = const Value.absent(),
    this.unitCost = const Value.absent(),
  });
  PurchaseOrderItemTableCompanion.insert({
    this.id = const Value.absent(),
    required String poUuid,
    required String productUuid,
    required double quantityOrdered,
    this.quantityReceived = const Value.absent(),
    required double unitCost,
  })  : poUuid = Value(poUuid),
        productUuid = Value(productUuid),
        quantityOrdered = Value(quantityOrdered),
        unitCost = Value(unitCost);
  static Insertable<PurchaseOrderItemTableData> custom({
    Expression<int>? id,
    Expression<String>? poUuid,
    Expression<String>? productUuid,
    Expression<double>? quantityOrdered,
    Expression<double>? quantityReceived,
    Expression<double>? unitCost,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (poUuid != null) 'po_uuid': poUuid,
      if (productUuid != null) 'product_uuid': productUuid,
      if (quantityOrdered != null) 'quantity_ordered': quantityOrdered,
      if (quantityReceived != null) 'quantity_received': quantityReceived,
      if (unitCost != null) 'unit_cost': unitCost,
    });
  }

  PurchaseOrderItemTableCompanion copyWith(
      {Value<int>? id,
      Value<String>? poUuid,
      Value<String>? productUuid,
      Value<double>? quantityOrdered,
      Value<double>? quantityReceived,
      Value<double>? unitCost}) {
    return PurchaseOrderItemTableCompanion(
      id: id ?? this.id,
      poUuid: poUuid ?? this.poUuid,
      productUuid: productUuid ?? this.productUuid,
      quantityOrdered: quantityOrdered ?? this.quantityOrdered,
      quantityReceived: quantityReceived ?? this.quantityReceived,
      unitCost: unitCost ?? this.unitCost,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (poUuid.present) {
      map['po_uuid'] = Variable<String>(poUuid.value);
    }
    if (productUuid.present) {
      map['product_uuid'] = Variable<String>(productUuid.value);
    }
    if (quantityOrdered.present) {
      map['quantity_ordered'] = Variable<double>(quantityOrdered.value);
    }
    if (quantityReceived.present) {
      map['quantity_received'] = Variable<double>(quantityReceived.value);
    }
    if (unitCost.present) {
      map['unit_cost'] = Variable<double>(unitCost.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PurchaseOrderItemTableCompanion(')
          ..write('id: $id, ')
          ..write('poUuid: $poUuid, ')
          ..write('productUuid: $productUuid, ')
          ..write('quantityOrdered: $quantityOrdered, ')
          ..write('quantityReceived: $quantityReceived, ')
          ..write('unitCost: $unitCost')
          ..write(')'))
        .toString();
  }
}

class $ShiftSessionTableTable extends ShiftSessionTable
    with TableInfo<$ShiftSessionTableTable, ShiftSessionTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ShiftSessionTableTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _staffIdMeta =
      const VerificationMeta('staffId');
  @override
  late final GeneratedColumn<String> staffId = GeneratedColumn<String>(
      'staff_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _staffNameMeta =
      const VerificationMeta('staffName');
  @override
  late final GeneratedColumn<String> staffName = GeneratedColumn<String>(
      'staff_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _startShiftMeta =
      const VerificationMeta('startShift');
  @override
  late final GeneratedColumn<DateTime> startShift = GeneratedColumn<DateTime>(
      'start_shift', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _endShiftMeta =
      const VerificationMeta('endShift');
  @override
  late final GeneratedColumn<DateTime> endShift = GeneratedColumn<DateTime>(
      'end_shift', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _startCashMeta =
      const VerificationMeta('startCash');
  @override
  late final GeneratedColumn<double> startCash = GeneratedColumn<double>(
      'start_cash', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _expectedCashMeta =
      const VerificationMeta('expectedCash');
  @override
  late final GeneratedColumn<double> expectedCash = GeneratedColumn<double>(
      'expected_cash', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _actualCashMeta =
      const VerificationMeta('actualCash');
  @override
  late final GeneratedColumn<double> actualCash = GeneratedColumn<double>(
      'actual_cash', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _differenceMeta =
      const VerificationMeta('difference');
  @override
  late final GeneratedColumn<double> difference = GeneratedColumn<double>(
      'difference', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _isClosedMeta =
      const VerificationMeta('isClosed');
  @override
  late final GeneratedColumn<bool> isClosed = GeneratedColumn<bool>(
      'is_closed', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_closed" IN (0, 1))'),
      defaultValue: const Constant(false));
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
  List<GeneratedColumn> get $columns => [
        id,
        uuid,
        staffId,
        staffName,
        startShift,
        endShift,
        startCash,
        expectedCash,
        actualCash,
        difference,
        isClosed,
        isSynced
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'shift_session_table';
  @override
  VerificationContext validateIntegrity(
      Insertable<ShiftSessionTableData> instance,
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
    if (data.containsKey('staff_id')) {
      context.handle(_staffIdMeta,
          staffId.isAcceptableOrUnknown(data['staff_id']!, _staffIdMeta));
    } else if (isInserting) {
      context.missing(_staffIdMeta);
    }
    if (data.containsKey('staff_name')) {
      context.handle(_staffNameMeta,
          staffName.isAcceptableOrUnknown(data['staff_name']!, _staffNameMeta));
    } else if (isInserting) {
      context.missing(_staffNameMeta);
    }
    if (data.containsKey('start_shift')) {
      context.handle(
          _startShiftMeta,
          startShift.isAcceptableOrUnknown(
              data['start_shift']!, _startShiftMeta));
    } else if (isInserting) {
      context.missing(_startShiftMeta);
    }
    if (data.containsKey('end_shift')) {
      context.handle(_endShiftMeta,
          endShift.isAcceptableOrUnknown(data['end_shift']!, _endShiftMeta));
    }
    if (data.containsKey('start_cash')) {
      context.handle(_startCashMeta,
          startCash.isAcceptableOrUnknown(data['start_cash']!, _startCashMeta));
    } else if (isInserting) {
      context.missing(_startCashMeta);
    }
    if (data.containsKey('expected_cash')) {
      context.handle(
          _expectedCashMeta,
          expectedCash.isAcceptableOrUnknown(
              data['expected_cash']!, _expectedCashMeta));
    } else if (isInserting) {
      context.missing(_expectedCashMeta);
    }
    if (data.containsKey('actual_cash')) {
      context.handle(
          _actualCashMeta,
          actualCash.isAcceptableOrUnknown(
              data['actual_cash']!, _actualCashMeta));
    } else if (isInserting) {
      context.missing(_actualCashMeta);
    }
    if (data.containsKey('difference')) {
      context.handle(
          _differenceMeta,
          difference.isAcceptableOrUnknown(
              data['difference']!, _differenceMeta));
    } else if (isInserting) {
      context.missing(_differenceMeta);
    }
    if (data.containsKey('is_closed')) {
      context.handle(_isClosedMeta,
          isClosed.isAcceptableOrUnknown(data['is_closed']!, _isClosedMeta));
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
  ShiftSessionTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ShiftSessionTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      uuid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}uuid'])!,
      staffId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}staff_id'])!,
      staffName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}staff_name'])!,
      startShift: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}start_shift'])!,
      endShift: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}end_shift']),
      startCash: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}start_cash'])!,
      expectedCash: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}expected_cash'])!,
      actualCash: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}actual_cash'])!,
      difference: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}difference'])!,
      isClosed: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_closed'])!,
      isSynced: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_synced'])!,
    );
  }

  @override
  $ShiftSessionTableTable createAlias(String alias) {
    return $ShiftSessionTableTable(attachedDatabase, alias);
  }
}

class ShiftSessionTableData extends DataClass
    implements Insertable<ShiftSessionTableData> {
  final int id;
  final String uuid;
  final String staffId;
  final String staffName;
  final DateTime startShift;
  final DateTime? endShift;
  final double startCash;
  final double expectedCash;
  final double actualCash;
  final double difference;
  final bool isClosed;
  final bool isSynced;
  const ShiftSessionTableData(
      {required this.id,
      required this.uuid,
      required this.staffId,
      required this.staffName,
      required this.startShift,
      this.endShift,
      required this.startCash,
      required this.expectedCash,
      required this.actualCash,
      required this.difference,
      required this.isClosed,
      required this.isSynced});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['uuid'] = Variable<String>(uuid);
    map['staff_id'] = Variable<String>(staffId);
    map['staff_name'] = Variable<String>(staffName);
    map['start_shift'] = Variable<DateTime>(startShift);
    if (!nullToAbsent || endShift != null) {
      map['end_shift'] = Variable<DateTime>(endShift);
    }
    map['start_cash'] = Variable<double>(startCash);
    map['expected_cash'] = Variable<double>(expectedCash);
    map['actual_cash'] = Variable<double>(actualCash);
    map['difference'] = Variable<double>(difference);
    map['is_closed'] = Variable<bool>(isClosed);
    map['is_synced'] = Variable<bool>(isSynced);
    return map;
  }

  ShiftSessionTableCompanion toCompanion(bool nullToAbsent) {
    return ShiftSessionTableCompanion(
      id: Value(id),
      uuid: Value(uuid),
      staffId: Value(staffId),
      staffName: Value(staffName),
      startShift: Value(startShift),
      endShift: endShift == null && nullToAbsent
          ? const Value.absent()
          : Value(endShift),
      startCash: Value(startCash),
      expectedCash: Value(expectedCash),
      actualCash: Value(actualCash),
      difference: Value(difference),
      isClosed: Value(isClosed),
      isSynced: Value(isSynced),
    );
  }

  factory ShiftSessionTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ShiftSessionTableData(
      id: serializer.fromJson<int>(json['id']),
      uuid: serializer.fromJson<String>(json['uuid']),
      staffId: serializer.fromJson<String>(json['staffId']),
      staffName: serializer.fromJson<String>(json['staffName']),
      startShift: serializer.fromJson<DateTime>(json['startShift']),
      endShift: serializer.fromJson<DateTime?>(json['endShift']),
      startCash: serializer.fromJson<double>(json['startCash']),
      expectedCash: serializer.fromJson<double>(json['expectedCash']),
      actualCash: serializer.fromJson<double>(json['actualCash']),
      difference: serializer.fromJson<double>(json['difference']),
      isClosed: serializer.fromJson<bool>(json['isClosed']),
      isSynced: serializer.fromJson<bool>(json['isSynced']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'uuid': serializer.toJson<String>(uuid),
      'staffId': serializer.toJson<String>(staffId),
      'staffName': serializer.toJson<String>(staffName),
      'startShift': serializer.toJson<DateTime>(startShift),
      'endShift': serializer.toJson<DateTime?>(endShift),
      'startCash': serializer.toJson<double>(startCash),
      'expectedCash': serializer.toJson<double>(expectedCash),
      'actualCash': serializer.toJson<double>(actualCash),
      'difference': serializer.toJson<double>(difference),
      'isClosed': serializer.toJson<bool>(isClosed),
      'isSynced': serializer.toJson<bool>(isSynced),
    };
  }

  ShiftSessionTableData copyWith(
          {int? id,
          String? uuid,
          String? staffId,
          String? staffName,
          DateTime? startShift,
          Value<DateTime?> endShift = const Value.absent(),
          double? startCash,
          double? expectedCash,
          double? actualCash,
          double? difference,
          bool? isClosed,
          bool? isSynced}) =>
      ShiftSessionTableData(
        id: id ?? this.id,
        uuid: uuid ?? this.uuid,
        staffId: staffId ?? this.staffId,
        staffName: staffName ?? this.staffName,
        startShift: startShift ?? this.startShift,
        endShift: endShift.present ? endShift.value : this.endShift,
        startCash: startCash ?? this.startCash,
        expectedCash: expectedCash ?? this.expectedCash,
        actualCash: actualCash ?? this.actualCash,
        difference: difference ?? this.difference,
        isClosed: isClosed ?? this.isClosed,
        isSynced: isSynced ?? this.isSynced,
      );
  ShiftSessionTableData copyWithCompanion(ShiftSessionTableCompanion data) {
    return ShiftSessionTableData(
      id: data.id.present ? data.id.value : this.id,
      uuid: data.uuid.present ? data.uuid.value : this.uuid,
      staffId: data.staffId.present ? data.staffId.value : this.staffId,
      staffName: data.staffName.present ? data.staffName.value : this.staffName,
      startShift:
          data.startShift.present ? data.startShift.value : this.startShift,
      endShift: data.endShift.present ? data.endShift.value : this.endShift,
      startCash: data.startCash.present ? data.startCash.value : this.startCash,
      expectedCash: data.expectedCash.present
          ? data.expectedCash.value
          : this.expectedCash,
      actualCash:
          data.actualCash.present ? data.actualCash.value : this.actualCash,
      difference:
          data.difference.present ? data.difference.value : this.difference,
      isClosed: data.isClosed.present ? data.isClosed.value : this.isClosed,
      isSynced: data.isSynced.present ? data.isSynced.value : this.isSynced,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ShiftSessionTableData(')
          ..write('id: $id, ')
          ..write('uuid: $uuid, ')
          ..write('staffId: $staffId, ')
          ..write('staffName: $staffName, ')
          ..write('startShift: $startShift, ')
          ..write('endShift: $endShift, ')
          ..write('startCash: $startCash, ')
          ..write('expectedCash: $expectedCash, ')
          ..write('actualCash: $actualCash, ')
          ..write('difference: $difference, ')
          ..write('isClosed: $isClosed, ')
          ..write('isSynced: $isSynced')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      uuid,
      staffId,
      staffName,
      startShift,
      endShift,
      startCash,
      expectedCash,
      actualCash,
      difference,
      isClosed,
      isSynced);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ShiftSessionTableData &&
          other.id == this.id &&
          other.uuid == this.uuid &&
          other.staffId == this.staffId &&
          other.staffName == this.staffName &&
          other.startShift == this.startShift &&
          other.endShift == this.endShift &&
          other.startCash == this.startCash &&
          other.expectedCash == this.expectedCash &&
          other.actualCash == this.actualCash &&
          other.difference == this.difference &&
          other.isClosed == this.isClosed &&
          other.isSynced == this.isSynced);
}

class ShiftSessionTableCompanion
    extends UpdateCompanion<ShiftSessionTableData> {
  final Value<int> id;
  final Value<String> uuid;
  final Value<String> staffId;
  final Value<String> staffName;
  final Value<DateTime> startShift;
  final Value<DateTime?> endShift;
  final Value<double> startCash;
  final Value<double> expectedCash;
  final Value<double> actualCash;
  final Value<double> difference;
  final Value<bool> isClosed;
  final Value<bool> isSynced;
  const ShiftSessionTableCompanion({
    this.id = const Value.absent(),
    this.uuid = const Value.absent(),
    this.staffId = const Value.absent(),
    this.staffName = const Value.absent(),
    this.startShift = const Value.absent(),
    this.endShift = const Value.absent(),
    this.startCash = const Value.absent(),
    this.expectedCash = const Value.absent(),
    this.actualCash = const Value.absent(),
    this.difference = const Value.absent(),
    this.isClosed = const Value.absent(),
    this.isSynced = const Value.absent(),
  });
  ShiftSessionTableCompanion.insert({
    this.id = const Value.absent(),
    required String uuid,
    required String staffId,
    required String staffName,
    required DateTime startShift,
    this.endShift = const Value.absent(),
    required double startCash,
    required double expectedCash,
    required double actualCash,
    required double difference,
    this.isClosed = const Value.absent(),
    this.isSynced = const Value.absent(),
  })  : uuid = Value(uuid),
        staffId = Value(staffId),
        staffName = Value(staffName),
        startShift = Value(startShift),
        startCash = Value(startCash),
        expectedCash = Value(expectedCash),
        actualCash = Value(actualCash),
        difference = Value(difference);
  static Insertable<ShiftSessionTableData> custom({
    Expression<int>? id,
    Expression<String>? uuid,
    Expression<String>? staffId,
    Expression<String>? staffName,
    Expression<DateTime>? startShift,
    Expression<DateTime>? endShift,
    Expression<double>? startCash,
    Expression<double>? expectedCash,
    Expression<double>? actualCash,
    Expression<double>? difference,
    Expression<bool>? isClosed,
    Expression<bool>? isSynced,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (uuid != null) 'uuid': uuid,
      if (staffId != null) 'staff_id': staffId,
      if (staffName != null) 'staff_name': staffName,
      if (startShift != null) 'start_shift': startShift,
      if (endShift != null) 'end_shift': endShift,
      if (startCash != null) 'start_cash': startCash,
      if (expectedCash != null) 'expected_cash': expectedCash,
      if (actualCash != null) 'actual_cash': actualCash,
      if (difference != null) 'difference': difference,
      if (isClosed != null) 'is_closed': isClosed,
      if (isSynced != null) 'is_synced': isSynced,
    });
  }

  ShiftSessionTableCompanion copyWith(
      {Value<int>? id,
      Value<String>? uuid,
      Value<String>? staffId,
      Value<String>? staffName,
      Value<DateTime>? startShift,
      Value<DateTime?>? endShift,
      Value<double>? startCash,
      Value<double>? expectedCash,
      Value<double>? actualCash,
      Value<double>? difference,
      Value<bool>? isClosed,
      Value<bool>? isSynced}) {
    return ShiftSessionTableCompanion(
      id: id ?? this.id,
      uuid: uuid ?? this.uuid,
      staffId: staffId ?? this.staffId,
      staffName: staffName ?? this.staffName,
      startShift: startShift ?? this.startShift,
      endShift: endShift ?? this.endShift,
      startCash: startCash ?? this.startCash,
      expectedCash: expectedCash ?? this.expectedCash,
      actualCash: actualCash ?? this.actualCash,
      difference: difference ?? this.difference,
      isClosed: isClosed ?? this.isClosed,
      isSynced: isSynced ?? this.isSynced,
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
    if (staffId.present) {
      map['staff_id'] = Variable<String>(staffId.value);
    }
    if (staffName.present) {
      map['staff_name'] = Variable<String>(staffName.value);
    }
    if (startShift.present) {
      map['start_shift'] = Variable<DateTime>(startShift.value);
    }
    if (endShift.present) {
      map['end_shift'] = Variable<DateTime>(endShift.value);
    }
    if (startCash.present) {
      map['start_cash'] = Variable<double>(startCash.value);
    }
    if (expectedCash.present) {
      map['expected_cash'] = Variable<double>(expectedCash.value);
    }
    if (actualCash.present) {
      map['actual_cash'] = Variable<double>(actualCash.value);
    }
    if (difference.present) {
      map['difference'] = Variable<double>(difference.value);
    }
    if (isClosed.present) {
      map['is_closed'] = Variable<bool>(isClosed.value);
    }
    if (isSynced.present) {
      map['is_synced'] = Variable<bool>(isSynced.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ShiftSessionTableCompanion(')
          ..write('id: $id, ')
          ..write('uuid: $uuid, ')
          ..write('staffId: $staffId, ')
          ..write('staffName: $staffName, ')
          ..write('startShift: $startShift, ')
          ..write('endShift: $endShift, ')
          ..write('startCash: $startCash, ')
          ..write('expectedCash: $expectedCash, ')
          ..write('actualCash: $actualCash, ')
          ..write('difference: $difference, ')
          ..write('isClosed: $isClosed, ')
          ..write('isSynced: $isSynced')
          ..write(')'))
        .toString();
  }
}

class $SyncQueueTable extends SyncQueue
    with TableInfo<$SyncQueueTable, SyncQueueData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SyncQueueTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _actionTypeMeta =
      const VerificationMeta('actionType');
  @override
  late final GeneratedColumn<String> actionType = GeneratedColumn<String>(
      'action_type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _payloadJsonMeta =
      const VerificationMeta('payloadJson');
  @override
  late final GeneratedColumn<String> payloadJson = GeneratedColumn<String>(
      'payload_json', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _idempotencyKeyMeta =
      const VerificationMeta('idempotencyKey');
  @override
  late final GeneratedColumn<String> idempotencyKey = GeneratedColumn<String>(
      'idempotency_key', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
      'status', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('PENDING'));
  static const VerificationMeta _retryCountMeta =
      const VerificationMeta('retryCount');
  @override
  late final GeneratedColumn<int> retryCount = GeneratedColumn<int>(
      'retry_count', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _nextRetryAtMeta =
      const VerificationMeta('nextRetryAt');
  @override
  late final GeneratedColumn<DateTime> nextRetryAt = GeneratedColumn<DateTime>(
      'next_retry_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        actionType,
        payloadJson,
        idempotencyKey,
        createdAt,
        status,
        retryCount,
        nextRetryAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'sync_queue';
  @override
  VerificationContext validateIntegrity(Insertable<SyncQueueData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('action_type')) {
      context.handle(
          _actionTypeMeta,
          actionType.isAcceptableOrUnknown(
              data['action_type']!, _actionTypeMeta));
    } else if (isInserting) {
      context.missing(_actionTypeMeta);
    }
    if (data.containsKey('payload_json')) {
      context.handle(
          _payloadJsonMeta,
          payloadJson.isAcceptableOrUnknown(
              data['payload_json']!, _payloadJsonMeta));
    } else if (isInserting) {
      context.missing(_payloadJsonMeta);
    }
    if (data.containsKey('idempotency_key')) {
      context.handle(
          _idempotencyKeyMeta,
          idempotencyKey.isAcceptableOrUnknown(
              data['idempotency_key']!, _idempotencyKeyMeta));
    } else if (isInserting) {
      context.missing(_idempotencyKeyMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status']!, _statusMeta));
    }
    if (data.containsKey('retry_count')) {
      context.handle(
          _retryCountMeta,
          retryCount.isAcceptableOrUnknown(
              data['retry_count']!, _retryCountMeta));
    }
    if (data.containsKey('next_retry_at')) {
      context.handle(
          _nextRetryAtMeta,
          nextRetryAt.isAcceptableOrUnknown(
              data['next_retry_at']!, _nextRetryAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SyncQueueData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SyncQueueData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      actionType: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}action_type'])!,
      payloadJson: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}payload_json'])!,
      idempotencyKey: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}idempotency_key'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      status: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}status'])!,
      retryCount: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}retry_count'])!,
      nextRetryAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}next_retry_at']),
    );
  }

  @override
  $SyncQueueTable createAlias(String alias) {
    return $SyncQueueTable(attachedDatabase, alias);
  }
}

class SyncQueueData extends DataClass implements Insertable<SyncQueueData> {
  final int id;
  final String actionType;
  final String payloadJson;
  final String idempotencyKey;
  final DateTime createdAt;
  final String status;
  final int retryCount;
  final DateTime? nextRetryAt;
  const SyncQueueData(
      {required this.id,
      required this.actionType,
      required this.payloadJson,
      required this.idempotencyKey,
      required this.createdAt,
      required this.status,
      required this.retryCount,
      this.nextRetryAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['action_type'] = Variable<String>(actionType);
    map['payload_json'] = Variable<String>(payloadJson);
    map['idempotency_key'] = Variable<String>(idempotencyKey);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['status'] = Variable<String>(status);
    map['retry_count'] = Variable<int>(retryCount);
    if (!nullToAbsent || nextRetryAt != null) {
      map['next_retry_at'] = Variable<DateTime>(nextRetryAt);
    }
    return map;
  }

  SyncQueueCompanion toCompanion(bool nullToAbsent) {
    return SyncQueueCompanion(
      id: Value(id),
      actionType: Value(actionType),
      payloadJson: Value(payloadJson),
      idempotencyKey: Value(idempotencyKey),
      createdAt: Value(createdAt),
      status: Value(status),
      retryCount: Value(retryCount),
      nextRetryAt: nextRetryAt == null && nullToAbsent
          ? const Value.absent()
          : Value(nextRetryAt),
    );
  }

  factory SyncQueueData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SyncQueueData(
      id: serializer.fromJson<int>(json['id']),
      actionType: serializer.fromJson<String>(json['actionType']),
      payloadJson: serializer.fromJson<String>(json['payloadJson']),
      idempotencyKey: serializer.fromJson<String>(json['idempotencyKey']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      status: serializer.fromJson<String>(json['status']),
      retryCount: serializer.fromJson<int>(json['retryCount']),
      nextRetryAt: serializer.fromJson<DateTime?>(json['nextRetryAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'actionType': serializer.toJson<String>(actionType),
      'payloadJson': serializer.toJson<String>(payloadJson),
      'idempotencyKey': serializer.toJson<String>(idempotencyKey),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'status': serializer.toJson<String>(status),
      'retryCount': serializer.toJson<int>(retryCount),
      'nextRetryAt': serializer.toJson<DateTime?>(nextRetryAt),
    };
  }

  SyncQueueData copyWith(
          {int? id,
          String? actionType,
          String? payloadJson,
          String? idempotencyKey,
          DateTime? createdAt,
          String? status,
          int? retryCount,
          Value<DateTime?> nextRetryAt = const Value.absent()}) =>
      SyncQueueData(
        id: id ?? this.id,
        actionType: actionType ?? this.actionType,
        payloadJson: payloadJson ?? this.payloadJson,
        idempotencyKey: idempotencyKey ?? this.idempotencyKey,
        createdAt: createdAt ?? this.createdAt,
        status: status ?? this.status,
        retryCount: retryCount ?? this.retryCount,
        nextRetryAt: nextRetryAt.present ? nextRetryAt.value : this.nextRetryAt,
      );
  SyncQueueData copyWithCompanion(SyncQueueCompanion data) {
    return SyncQueueData(
      id: data.id.present ? data.id.value : this.id,
      actionType:
          data.actionType.present ? data.actionType.value : this.actionType,
      payloadJson:
          data.payloadJson.present ? data.payloadJson.value : this.payloadJson,
      idempotencyKey: data.idempotencyKey.present
          ? data.idempotencyKey.value
          : this.idempotencyKey,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      status: data.status.present ? data.status.value : this.status,
      retryCount:
          data.retryCount.present ? data.retryCount.value : this.retryCount,
      nextRetryAt:
          data.nextRetryAt.present ? data.nextRetryAt.value : this.nextRetryAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SyncQueueData(')
          ..write('id: $id, ')
          ..write('actionType: $actionType, ')
          ..write('payloadJson: $payloadJson, ')
          ..write('idempotencyKey: $idempotencyKey, ')
          ..write('createdAt: $createdAt, ')
          ..write('status: $status, ')
          ..write('retryCount: $retryCount, ')
          ..write('nextRetryAt: $nextRetryAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, actionType, payloadJson, idempotencyKey,
      createdAt, status, retryCount, nextRetryAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SyncQueueData &&
          other.id == this.id &&
          other.actionType == this.actionType &&
          other.payloadJson == this.payloadJson &&
          other.idempotencyKey == this.idempotencyKey &&
          other.createdAt == this.createdAt &&
          other.status == this.status &&
          other.retryCount == this.retryCount &&
          other.nextRetryAt == this.nextRetryAt);
}

class SyncQueueCompanion extends UpdateCompanion<SyncQueueData> {
  final Value<int> id;
  final Value<String> actionType;
  final Value<String> payloadJson;
  final Value<String> idempotencyKey;
  final Value<DateTime> createdAt;
  final Value<String> status;
  final Value<int> retryCount;
  final Value<DateTime?> nextRetryAt;
  const SyncQueueCompanion({
    this.id = const Value.absent(),
    this.actionType = const Value.absent(),
    this.payloadJson = const Value.absent(),
    this.idempotencyKey = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.status = const Value.absent(),
    this.retryCount = const Value.absent(),
    this.nextRetryAt = const Value.absent(),
  });
  SyncQueueCompanion.insert({
    this.id = const Value.absent(),
    required String actionType,
    required String payloadJson,
    required String idempotencyKey,
    required DateTime createdAt,
    this.status = const Value.absent(),
    this.retryCount = const Value.absent(),
    this.nextRetryAt = const Value.absent(),
  })  : actionType = Value(actionType),
        payloadJson = Value(payloadJson),
        idempotencyKey = Value(idempotencyKey),
        createdAt = Value(createdAt);
  static Insertable<SyncQueueData> custom({
    Expression<int>? id,
    Expression<String>? actionType,
    Expression<String>? payloadJson,
    Expression<String>? idempotencyKey,
    Expression<DateTime>? createdAt,
    Expression<String>? status,
    Expression<int>? retryCount,
    Expression<DateTime>? nextRetryAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (actionType != null) 'action_type': actionType,
      if (payloadJson != null) 'payload_json': payloadJson,
      if (idempotencyKey != null) 'idempotency_key': idempotencyKey,
      if (createdAt != null) 'created_at': createdAt,
      if (status != null) 'status': status,
      if (retryCount != null) 'retry_count': retryCount,
      if (nextRetryAt != null) 'next_retry_at': nextRetryAt,
    });
  }

  SyncQueueCompanion copyWith(
      {Value<int>? id,
      Value<String>? actionType,
      Value<String>? payloadJson,
      Value<String>? idempotencyKey,
      Value<DateTime>? createdAt,
      Value<String>? status,
      Value<int>? retryCount,
      Value<DateTime?>? nextRetryAt}) {
    return SyncQueueCompanion(
      id: id ?? this.id,
      actionType: actionType ?? this.actionType,
      payloadJson: payloadJson ?? this.payloadJson,
      idempotencyKey: idempotencyKey ?? this.idempotencyKey,
      createdAt: createdAt ?? this.createdAt,
      status: status ?? this.status,
      retryCount: retryCount ?? this.retryCount,
      nextRetryAt: nextRetryAt ?? this.nextRetryAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (actionType.present) {
      map['action_type'] = Variable<String>(actionType.value);
    }
    if (payloadJson.present) {
      map['payload_json'] = Variable<String>(payloadJson.value);
    }
    if (idempotencyKey.present) {
      map['idempotency_key'] = Variable<String>(idempotencyKey.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (retryCount.present) {
      map['retry_count'] = Variable<int>(retryCount.value);
    }
    if (nextRetryAt.present) {
      map['next_retry_at'] = Variable<DateTime>(nextRetryAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SyncQueueCompanion(')
          ..write('id: $id, ')
          ..write('actionType: $actionType, ')
          ..write('payloadJson: $payloadJson, ')
          ..write('idempotencyKey: $idempotencyKey, ')
          ..write('createdAt: $createdAt, ')
          ..write('status: $status, ')
          ..write('retryCount: $retryCount, ')
          ..write('nextRetryAt: $nextRetryAt')
          ..write(')'))
        .toString();
  }
}

class $CashTransactionTableTable extends CashTransactionTable
    with TableInfo<$CashTransactionTableTable, CashTransactionTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CashTransactionTableTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _shiftUuidMeta =
      const VerificationMeta('shiftUuid');
  @override
  late final GeneratedColumn<String> shiftUuid = GeneratedColumn<String>(
      'shift_uuid', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
      'type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedColumn<double> amount = GeneratedColumn<double>(
      'amount', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
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
      [id, uuid, shiftUuid, type, amount, reason, createdAt, isSynced];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'cash_transaction_table';
  @override
  VerificationContext validateIntegrity(
      Insertable<CashTransactionTableData> instance,
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
    if (data.containsKey('shift_uuid')) {
      context.handle(_shiftUuidMeta,
          shiftUuid.isAcceptableOrUnknown(data['shift_uuid']!, _shiftUuidMeta));
    }
    if (data.containsKey('type')) {
      context.handle(
          _typeMeta, type.isAcceptableOrUnknown(data['type']!, _typeMeta));
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('amount')) {
      context.handle(_amountMeta,
          amount.isAcceptableOrUnknown(data['amount']!, _amountMeta));
    } else if (isInserting) {
      context.missing(_amountMeta);
    }
    if (data.containsKey('reason')) {
      context.handle(_reasonMeta,
          reason.isAcceptableOrUnknown(data['reason']!, _reasonMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
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
  CashTransactionTableData map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CashTransactionTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      uuid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}uuid'])!,
      shiftUuid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}shift_uuid']),
      type: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}type'])!,
      amount: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}amount'])!,
      reason: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}reason']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      isSynced: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_synced'])!,
    );
  }

  @override
  $CashTransactionTableTable createAlias(String alias) {
    return $CashTransactionTableTable(attachedDatabase, alias);
  }
}

class CashTransactionTableData extends DataClass
    implements Insertable<CashTransactionTableData> {
  final int id;
  final String uuid;
  final String? shiftUuid;
  final String type;
  final double amount;
  final String? reason;
  final DateTime createdAt;
  final bool isSynced;
  const CashTransactionTableData(
      {required this.id,
      required this.uuid,
      this.shiftUuid,
      required this.type,
      required this.amount,
      this.reason,
      required this.createdAt,
      required this.isSynced});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['uuid'] = Variable<String>(uuid);
    if (!nullToAbsent || shiftUuid != null) {
      map['shift_uuid'] = Variable<String>(shiftUuid);
    }
    map['type'] = Variable<String>(type);
    map['amount'] = Variable<double>(amount);
    if (!nullToAbsent || reason != null) {
      map['reason'] = Variable<String>(reason);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['is_synced'] = Variable<bool>(isSynced);
    return map;
  }

  CashTransactionTableCompanion toCompanion(bool nullToAbsent) {
    return CashTransactionTableCompanion(
      id: Value(id),
      uuid: Value(uuid),
      shiftUuid: shiftUuid == null && nullToAbsent
          ? const Value.absent()
          : Value(shiftUuid),
      type: Value(type),
      amount: Value(amount),
      reason:
          reason == null && nullToAbsent ? const Value.absent() : Value(reason),
      createdAt: Value(createdAt),
      isSynced: Value(isSynced),
    );
  }

  factory CashTransactionTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CashTransactionTableData(
      id: serializer.fromJson<int>(json['id']),
      uuid: serializer.fromJson<String>(json['uuid']),
      shiftUuid: serializer.fromJson<String?>(json['shiftUuid']),
      type: serializer.fromJson<String>(json['type']),
      amount: serializer.fromJson<double>(json['amount']),
      reason: serializer.fromJson<String?>(json['reason']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      isSynced: serializer.fromJson<bool>(json['isSynced']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'uuid': serializer.toJson<String>(uuid),
      'shiftUuid': serializer.toJson<String?>(shiftUuid),
      'type': serializer.toJson<String>(type),
      'amount': serializer.toJson<double>(amount),
      'reason': serializer.toJson<String?>(reason),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'isSynced': serializer.toJson<bool>(isSynced),
    };
  }

  CashTransactionTableData copyWith(
          {int? id,
          String? uuid,
          Value<String?> shiftUuid = const Value.absent(),
          String? type,
          double? amount,
          Value<String?> reason = const Value.absent(),
          DateTime? createdAt,
          bool? isSynced}) =>
      CashTransactionTableData(
        id: id ?? this.id,
        uuid: uuid ?? this.uuid,
        shiftUuid: shiftUuid.present ? shiftUuid.value : this.shiftUuid,
        type: type ?? this.type,
        amount: amount ?? this.amount,
        reason: reason.present ? reason.value : this.reason,
        createdAt: createdAt ?? this.createdAt,
        isSynced: isSynced ?? this.isSynced,
      );
  CashTransactionTableData copyWithCompanion(
      CashTransactionTableCompanion data) {
    return CashTransactionTableData(
      id: data.id.present ? data.id.value : this.id,
      uuid: data.uuid.present ? data.uuid.value : this.uuid,
      shiftUuid: data.shiftUuid.present ? data.shiftUuid.value : this.shiftUuid,
      type: data.type.present ? data.type.value : this.type,
      amount: data.amount.present ? data.amount.value : this.amount,
      reason: data.reason.present ? data.reason.value : this.reason,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      isSynced: data.isSynced.present ? data.isSynced.value : this.isSynced,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CashTransactionTableData(')
          ..write('id: $id, ')
          ..write('uuid: $uuid, ')
          ..write('shiftUuid: $shiftUuid, ')
          ..write('type: $type, ')
          ..write('amount: $amount, ')
          ..write('reason: $reason, ')
          ..write('createdAt: $createdAt, ')
          ..write('isSynced: $isSynced')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, uuid, shiftUuid, type, amount, reason, createdAt, isSynced);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CashTransactionTableData &&
          other.id == this.id &&
          other.uuid == this.uuid &&
          other.shiftUuid == this.shiftUuid &&
          other.type == this.type &&
          other.amount == this.amount &&
          other.reason == this.reason &&
          other.createdAt == this.createdAt &&
          other.isSynced == this.isSynced);
}

class CashTransactionTableCompanion
    extends UpdateCompanion<CashTransactionTableData> {
  final Value<int> id;
  final Value<String> uuid;
  final Value<String?> shiftUuid;
  final Value<String> type;
  final Value<double> amount;
  final Value<String?> reason;
  final Value<DateTime> createdAt;
  final Value<bool> isSynced;
  const CashTransactionTableCompanion({
    this.id = const Value.absent(),
    this.uuid = const Value.absent(),
    this.shiftUuid = const Value.absent(),
    this.type = const Value.absent(),
    this.amount = const Value.absent(),
    this.reason = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.isSynced = const Value.absent(),
  });
  CashTransactionTableCompanion.insert({
    this.id = const Value.absent(),
    required String uuid,
    this.shiftUuid = const Value.absent(),
    required String type,
    required double amount,
    this.reason = const Value.absent(),
    required DateTime createdAt,
    this.isSynced = const Value.absent(),
  })  : uuid = Value(uuid),
        type = Value(type),
        amount = Value(amount),
        createdAt = Value(createdAt);
  static Insertable<CashTransactionTableData> custom({
    Expression<int>? id,
    Expression<String>? uuid,
    Expression<String>? shiftUuid,
    Expression<String>? type,
    Expression<double>? amount,
    Expression<String>? reason,
    Expression<DateTime>? createdAt,
    Expression<bool>? isSynced,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (uuid != null) 'uuid': uuid,
      if (shiftUuid != null) 'shift_uuid': shiftUuid,
      if (type != null) 'type': type,
      if (amount != null) 'amount': amount,
      if (reason != null) 'reason': reason,
      if (createdAt != null) 'created_at': createdAt,
      if (isSynced != null) 'is_synced': isSynced,
    });
  }

  CashTransactionTableCompanion copyWith(
      {Value<int>? id,
      Value<String>? uuid,
      Value<String?>? shiftUuid,
      Value<String>? type,
      Value<double>? amount,
      Value<String?>? reason,
      Value<DateTime>? createdAt,
      Value<bool>? isSynced}) {
    return CashTransactionTableCompanion(
      id: id ?? this.id,
      uuid: uuid ?? this.uuid,
      shiftUuid: shiftUuid ?? this.shiftUuid,
      type: type ?? this.type,
      amount: amount ?? this.amount,
      reason: reason ?? this.reason,
      createdAt: createdAt ?? this.createdAt,
      isSynced: isSynced ?? this.isSynced,
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
    if (shiftUuid.present) {
      map['shift_uuid'] = Variable<String>(shiftUuid.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (amount.present) {
      map['amount'] = Variable<double>(amount.value);
    }
    if (reason.present) {
      map['reason'] = Variable<String>(reason.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (isSynced.present) {
      map['is_synced'] = Variable<bool>(isSynced.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CashTransactionTableCompanion(')
          ..write('id: $id, ')
          ..write('uuid: $uuid, ')
          ..write('shiftUuid: $shiftUuid, ')
          ..write('type: $type, ')
          ..write('amount: $amount, ')
          ..write('reason: $reason, ')
          ..write('createdAt: $createdAt, ')
          ..write('isSynced: $isSynced')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $TenantConfigTableTable tenantConfigTable =
      $TenantConfigTableTable(this);
  late final $CategoryTableTable categoryTable = $CategoryTableTable(this);
  late final $ProductTableTable productTable = $ProductTableTable(this);
  late final $RestaurantTableTable restaurantTable =
      $RestaurantTableTable(this);
  late final $ReservationTableTable reservationTable =
      $ReservationTableTable(this);
  late final $EmployeeTableTable employeeTable = $EmployeeTableTable(this);
  late final $ModifierGroupTableTable modifierGroupTable =
      $ModifierGroupTableTable(this);
  late final $ModifierItemTableTable modifierItemTable =
      $ModifierItemTableTable(this);
  late final $ProductModifierLinkTableTable productModifierLinkTable =
      $ProductModifierLinkTableTable(this);
  late final $IngredientTableTable ingredientTable =
      $IngredientTableTable(this);
  late final $RecipeTableTable recipeTable = $RecipeTableTable(this);
  late final $CustomerTableTable customerTable = $CustomerTableTable(this);
  late final $OrderTableTable orderTable = $OrderTableTable(this);
  late final $OrderItemTableTable orderItemTable = $OrderItemTableTable(this);
  late final $InventoryLedgerTableTable inventoryLedgerTable =
      $InventoryLedgerTableTable(this);
  late final $InventoryCacheTableTable inventoryCacheTable =
      $InventoryCacheTableTable(this);
  late final $LocalStocksTableTable localStocksTable =
      $LocalStocksTableTable(this);
  late final $SupplierTableTable supplierTable = $SupplierTableTable(this);
  late final $ProductSupplierTableTable productSupplierTable =
      $ProductSupplierTableTable(this);
  late final $PurchaseOrderTableTable purchaseOrderTable =
      $PurchaseOrderTableTable(this);
  late final $PurchaseOrderItemTableTable purchaseOrderItemTable =
      $PurchaseOrderItemTableTable(this);
  late final $ShiftSessionTableTable shiftSessionTable =
      $ShiftSessionTableTable(this);
  late final $SyncQueueTable syncQueue = $SyncQueueTable(this);
  late final $CashTransactionTableTable cashTransactionTable =
      $CashTransactionTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        tenantConfigTable,
        categoryTable,
        productTable,
        restaurantTable,
        reservationTable,
        employeeTable,
        modifierGroupTable,
        modifierItemTable,
        productModifierLinkTable,
        ingredientTable,
        recipeTable,
        customerTable,
        orderTable,
        orderItemTable,
        inventoryLedgerTable,
        inventoryCacheTable,
        localStocksTable,
        supplierTable,
        productSupplierTable,
        purchaseOrderTable,
        purchaseOrderItemTable,
        shiftSessionTable,
        syncQueue,
        cashTransactionTable
      ];
  @override
  StreamQueryUpdateRules get streamUpdateRules => const StreamQueryUpdateRules(
        [
          WritePropagation(
            on: TableUpdateQuery.onTableName('modifier_group_table',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('modifier_item_table', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('product_table',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('product_modifier_link_table',
                  kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('modifier_group_table',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('product_modifier_link_table',
                  kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('product_table',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('recipe_table', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('ingredient_table',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('recipe_table', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('order_table',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('order_item_table', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('product_table',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('local_stocks_table', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('product_table',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('product_supplier_table', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('supplier_table',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('product_supplier_table', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('supplier_table',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('purchase_order_table', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('purchase_order_table',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('purchase_order_item_table', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('product_table',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('purchase_order_item_table', kind: UpdateKind.delete),
            ],
          ),
        ],
      );
}

typedef $$TenantConfigTableTableCreateCompanionBuilder
    = TenantConfigTableCompanion Function({
  Value<int> id,
  required String tenantId,
  required String outletName,
  required String address,
  required String currencySymbol,
  required int tier,
  Value<DateTime?> subscriptionExpiry,
  required bool isAdsEnabled,
  Value<String?> managerPinHash,
  required DateTime updatedAt,
});
typedef $$TenantConfigTableTableUpdateCompanionBuilder
    = TenantConfigTableCompanion Function({
  Value<int> id,
  Value<String> tenantId,
  Value<String> outletName,
  Value<String> address,
  Value<String> currencySymbol,
  Value<int> tier,
  Value<DateTime?> subscriptionExpiry,
  Value<bool> isAdsEnabled,
  Value<String?> managerPinHash,
  Value<DateTime> updatedAt,
});

class $$TenantConfigTableTableFilterComposer
    extends Composer<_$AppDatabase, $TenantConfigTableTable> {
  $$TenantConfigTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get tenantId => $composableBuilder(
      column: $table.tenantId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get outletName => $composableBuilder(
      column: $table.outletName, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get address => $composableBuilder(
      column: $table.address, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get currencySymbol => $composableBuilder(
      column: $table.currencySymbol,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get tier => $composableBuilder(
      column: $table.tier, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get subscriptionExpiry => $composableBuilder(
      column: $table.subscriptionExpiry,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isAdsEnabled => $composableBuilder(
      column: $table.isAdsEnabled, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get managerPinHash => $composableBuilder(
      column: $table.managerPinHash,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));
}

class $$TenantConfigTableTableOrderingComposer
    extends Composer<_$AppDatabase, $TenantConfigTableTable> {
  $$TenantConfigTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get tenantId => $composableBuilder(
      column: $table.tenantId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get outletName => $composableBuilder(
      column: $table.outletName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get address => $composableBuilder(
      column: $table.address, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get currencySymbol => $composableBuilder(
      column: $table.currencySymbol,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get tier => $composableBuilder(
      column: $table.tier, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get subscriptionExpiry => $composableBuilder(
      column: $table.subscriptionExpiry,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isAdsEnabled => $composableBuilder(
      column: $table.isAdsEnabled,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get managerPinHash => $composableBuilder(
      column: $table.managerPinHash,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));
}

class $$TenantConfigTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $TenantConfigTableTable> {
  $$TenantConfigTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get tenantId =>
      $composableBuilder(column: $table.tenantId, builder: (column) => column);

  GeneratedColumn<String> get outletName => $composableBuilder(
      column: $table.outletName, builder: (column) => column);

  GeneratedColumn<String> get address =>
      $composableBuilder(column: $table.address, builder: (column) => column);

  GeneratedColumn<String> get currencySymbol => $composableBuilder(
      column: $table.currencySymbol, builder: (column) => column);

  GeneratedColumn<int> get tier =>
      $composableBuilder(column: $table.tier, builder: (column) => column);

  GeneratedColumn<DateTime> get subscriptionExpiry => $composableBuilder(
      column: $table.subscriptionExpiry, builder: (column) => column);

  GeneratedColumn<bool> get isAdsEnabled => $composableBuilder(
      column: $table.isAdsEnabled, builder: (column) => column);

  GeneratedColumn<String> get managerPinHash => $composableBuilder(
      column: $table.managerPinHash, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$TenantConfigTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $TenantConfigTableTable,
    TenantConfigTableData,
    $$TenantConfigTableTableFilterComposer,
    $$TenantConfigTableTableOrderingComposer,
    $$TenantConfigTableTableAnnotationComposer,
    $$TenantConfigTableTableCreateCompanionBuilder,
    $$TenantConfigTableTableUpdateCompanionBuilder,
    (
      TenantConfigTableData,
      BaseReferences<_$AppDatabase, $TenantConfigTableTable,
          TenantConfigTableData>
    ),
    TenantConfigTableData,
    PrefetchHooks Function()> {
  $$TenantConfigTableTableTableManager(
      _$AppDatabase db, $TenantConfigTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TenantConfigTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TenantConfigTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TenantConfigTableTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> tenantId = const Value.absent(),
            Value<String> outletName = const Value.absent(),
            Value<String> address = const Value.absent(),
            Value<String> currencySymbol = const Value.absent(),
            Value<int> tier = const Value.absent(),
            Value<DateTime?> subscriptionExpiry = const Value.absent(),
            Value<bool> isAdsEnabled = const Value.absent(),
            Value<String?> managerPinHash = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
          }) =>
              TenantConfigTableCompanion(
            id: id,
            tenantId: tenantId,
            outletName: outletName,
            address: address,
            currencySymbol: currencySymbol,
            tier: tier,
            subscriptionExpiry: subscriptionExpiry,
            isAdsEnabled: isAdsEnabled,
            managerPinHash: managerPinHash,
            updatedAt: updatedAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String tenantId,
            required String outletName,
            required String address,
            required String currencySymbol,
            required int tier,
            Value<DateTime?> subscriptionExpiry = const Value.absent(),
            required bool isAdsEnabled,
            Value<String?> managerPinHash = const Value.absent(),
            required DateTime updatedAt,
          }) =>
              TenantConfigTableCompanion.insert(
            id: id,
            tenantId: tenantId,
            outletName: outletName,
            address: address,
            currencySymbol: currencySymbol,
            tier: tier,
            subscriptionExpiry: subscriptionExpiry,
            isAdsEnabled: isAdsEnabled,
            managerPinHash: managerPinHash,
            updatedAt: updatedAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$TenantConfigTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $TenantConfigTableTable,
    TenantConfigTableData,
    $$TenantConfigTableTableFilterComposer,
    $$TenantConfigTableTableOrderingComposer,
    $$TenantConfigTableTableAnnotationComposer,
    $$TenantConfigTableTableCreateCompanionBuilder,
    $$TenantConfigTableTableUpdateCompanionBuilder,
    (
      TenantConfigTableData,
      BaseReferences<_$AppDatabase, $TenantConfigTableTable,
          TenantConfigTableData>
    ),
    TenantConfigTableData,
    PrefetchHooks Function()>;
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
    extends Composer<_$AppDatabase, $CategoryTableTable> {
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
    extends Composer<_$AppDatabase, $CategoryTableTable> {
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
    extends Composer<_$AppDatabase, $CategoryTableTable> {
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
    _$AppDatabase,
    $CategoryTableTable,
    CategoryTableData,
    $$CategoryTableTableFilterComposer,
    $$CategoryTableTableOrderingComposer,
    $$CategoryTableTableAnnotationComposer,
    $$CategoryTableTableCreateCompanionBuilder,
    $$CategoryTableTableUpdateCompanionBuilder,
    (
      CategoryTableData,
      BaseReferences<_$AppDatabase, $CategoryTableTable, CategoryTableData>
    ),
    CategoryTableData,
    PrefetchHooks Function()> {
  $$CategoryTableTableTableManager(_$AppDatabase db, $CategoryTableTable table)
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
    _$AppDatabase,
    $CategoryTableTable,
    CategoryTableData,
    $$CategoryTableTableFilterComposer,
    $$CategoryTableTableOrderingComposer,
    $$CategoryTableTableAnnotationComposer,
    $$CategoryTableTableCreateCompanionBuilder,
    $$CategoryTableTableUpdateCompanionBuilder,
    (
      CategoryTableData,
      BaseReferences<_$AppDatabase, $CategoryTableTable, CategoryTableData>
    ),
    CategoryTableData,
    PrefetchHooks Function()>;
typedef $$ProductTableTableCreateCompanionBuilder = ProductTableCompanion
    Function({
  Value<int> id,
  required String uuid,
  required String name,
  Value<String?> sku,
  Value<String?> barcode,
  required double price,
  Value<double?> costPrice,
  required String categoryId,
  required bool trackStock,
  required bool isService,
  Value<String?> colorHex,
  Value<String?> imageUrl,
  Value<String> printerCategory,
  required DateTime updatedAt,
  Value<bool> isSynced,
  Value<int> version,
  Value<bool> isDeleted,
  Value<bool> isComposite,
});
typedef $$ProductTableTableUpdateCompanionBuilder = ProductTableCompanion
    Function({
  Value<int> id,
  Value<String> uuid,
  Value<String> name,
  Value<String?> sku,
  Value<String?> barcode,
  Value<double> price,
  Value<double?> costPrice,
  Value<String> categoryId,
  Value<bool> trackStock,
  Value<bool> isService,
  Value<String?> colorHex,
  Value<String?> imageUrl,
  Value<String> printerCategory,
  Value<DateTime> updatedAt,
  Value<bool> isSynced,
  Value<int> version,
  Value<bool> isDeleted,
  Value<bool> isComposite,
});

final class $$ProductTableTableReferences extends BaseReferences<_$AppDatabase,
    $ProductTableTable, ProductTableData> {
  $$ProductTableTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$ProductModifierLinkTableTable,
      List<ProductModifierLinkTableData>> _productModifierLinkTableRefsTable(
          _$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.productModifierLinkTable,
          aliasName: $_aliasNameGenerator(
              db.productTable.uuid, db.productModifierLinkTable.productUuid));

  $$ProductModifierLinkTableTableProcessedTableManager
      get productModifierLinkTableRefs {
    final manager = $$ProductModifierLinkTableTableTableManager(
            $_db, $_db.productModifierLinkTable)
        .filter((f) => f.productUuid.uuid($_item.uuid));

    final cache =
        $_typedResult.readTableOrNull(_productModifierLinkTableRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$RecipeTableTable, List<RecipeTableData>>
      _recipeTableRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.recipeTable,
              aliasName: $_aliasNameGenerator(
                  db.productTable.uuid, db.recipeTable.productUuid));

  $$RecipeTableTableProcessedTableManager get recipeTableRefs {
    final manager = $$RecipeTableTableTableManager($_db, $_db.recipeTable)
        .filter((f) => f.productUuid.uuid($_item.uuid));

    final cache = $_typedResult.readTableOrNull(_recipeTableRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$LocalStocksTableTable, List<LocalStocksTableData>>
      _localStocksTableRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.localStocksTable,
              aliasName: $_aliasNameGenerator(
                  db.productTable.uuid, db.localStocksTable.productUuid));

  $$LocalStocksTableTableProcessedTableManager get localStocksTableRefs {
    final manager =
        $$LocalStocksTableTableTableManager($_db, $_db.localStocksTable)
            .filter((f) => f.productUuid.uuid($_item.uuid));

    final cache =
        $_typedResult.readTableOrNull(_localStocksTableRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$ProductSupplierTableTable,
      List<ProductSupplierTableData>> _productSupplierTableRefsTable(
          _$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.productSupplierTable,
          aliasName: $_aliasNameGenerator(
              db.productTable.uuid, db.productSupplierTable.productUuid));

  $$ProductSupplierTableTableProcessedTableManager
      get productSupplierTableRefs {
    final manager =
        $$ProductSupplierTableTableTableManager($_db, $_db.productSupplierTable)
            .filter((f) => f.productUuid.uuid($_item.uuid));

    final cache =
        $_typedResult.readTableOrNull(_productSupplierTableRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$PurchaseOrderItemTableTable,
      List<PurchaseOrderItemTableData>> _purchaseOrderItemTableRefsTable(
          _$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.purchaseOrderItemTable,
          aliasName: $_aliasNameGenerator(
              db.productTable.uuid, db.purchaseOrderItemTable.productUuid));

  $$PurchaseOrderItemTableTableProcessedTableManager
      get purchaseOrderItemTableRefs {
    final manager = $$PurchaseOrderItemTableTableTableManager(
            $_db, $_db.purchaseOrderItemTable)
        .filter((f) => f.productUuid.uuid($_item.uuid));

    final cache =
        $_typedResult.readTableOrNull(_purchaseOrderItemTableRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$ProductTableTableFilterComposer
    extends Composer<_$AppDatabase, $ProductTableTable> {
  $$ProductTableTableFilterComposer({
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

  ColumnFilters<String> get sku => $composableBuilder(
      column: $table.sku, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get barcode => $composableBuilder(
      column: $table.barcode, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get price => $composableBuilder(
      column: $table.price, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get costPrice => $composableBuilder(
      column: $table.costPrice, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get categoryId => $composableBuilder(
      column: $table.categoryId, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get trackStock => $composableBuilder(
      column: $table.trackStock, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isService => $composableBuilder(
      column: $table.isService, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get colorHex => $composableBuilder(
      column: $table.colorHex, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get imageUrl => $composableBuilder(
      column: $table.imageUrl, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get printerCategory => $composableBuilder(
      column: $table.printerCategory,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isSynced => $composableBuilder(
      column: $table.isSynced, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get version => $composableBuilder(
      column: $table.version, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isDeleted => $composableBuilder(
      column: $table.isDeleted, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isComposite => $composableBuilder(
      column: $table.isComposite, builder: (column) => ColumnFilters(column));

  Expression<bool> productModifierLinkTableRefs(
      Expression<bool> Function($$ProductModifierLinkTableTableFilterComposer f)
          f) {
    final $$ProductModifierLinkTableTableFilterComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.uuid,
            referencedTable: $db.productModifierLinkTable,
            getReferencedColumn: (t) => t.productUuid,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$ProductModifierLinkTableTableFilterComposer(
                  $db: $db,
                  $table: $db.productModifierLinkTable,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }

  Expression<bool> recipeTableRefs(
      Expression<bool> Function($$RecipeTableTableFilterComposer f) f) {
    final $$RecipeTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.uuid,
        referencedTable: $db.recipeTable,
        getReferencedColumn: (t) => t.productUuid,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$RecipeTableTableFilterComposer(
              $db: $db,
              $table: $db.recipeTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> localStocksTableRefs(
      Expression<bool> Function($$LocalStocksTableTableFilterComposer f) f) {
    final $$LocalStocksTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.uuid,
        referencedTable: $db.localStocksTable,
        getReferencedColumn: (t) => t.productUuid,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$LocalStocksTableTableFilterComposer(
              $db: $db,
              $table: $db.localStocksTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> productSupplierTableRefs(
      Expression<bool> Function($$ProductSupplierTableTableFilterComposer f)
          f) {
    final $$ProductSupplierTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.uuid,
        referencedTable: $db.productSupplierTable,
        getReferencedColumn: (t) => t.productUuid,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ProductSupplierTableTableFilterComposer(
              $db: $db,
              $table: $db.productSupplierTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> purchaseOrderItemTableRefs(
      Expression<bool> Function($$PurchaseOrderItemTableTableFilterComposer f)
          f) {
    final $$PurchaseOrderItemTableTableFilterComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.uuid,
            referencedTable: $db.purchaseOrderItemTable,
            getReferencedColumn: (t) => t.productUuid,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$PurchaseOrderItemTableTableFilterComposer(
                  $db: $db,
                  $table: $db.purchaseOrderItemTable,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }
}

class $$ProductTableTableOrderingComposer
    extends Composer<_$AppDatabase, $ProductTableTable> {
  $$ProductTableTableOrderingComposer({
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

  ColumnOrderings<String> get sku => $composableBuilder(
      column: $table.sku, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get barcode => $composableBuilder(
      column: $table.barcode, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get price => $composableBuilder(
      column: $table.price, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get costPrice => $composableBuilder(
      column: $table.costPrice, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get categoryId => $composableBuilder(
      column: $table.categoryId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get trackStock => $composableBuilder(
      column: $table.trackStock, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isService => $composableBuilder(
      column: $table.isService, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get colorHex => $composableBuilder(
      column: $table.colorHex, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get imageUrl => $composableBuilder(
      column: $table.imageUrl, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get printerCategory => $composableBuilder(
      column: $table.printerCategory,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isSynced => $composableBuilder(
      column: $table.isSynced, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get version => $composableBuilder(
      column: $table.version, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isDeleted => $composableBuilder(
      column: $table.isDeleted, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isComposite => $composableBuilder(
      column: $table.isComposite, builder: (column) => ColumnOrderings(column));
}

class $$ProductTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $ProductTableTable> {
  $$ProductTableTableAnnotationComposer({
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

  GeneratedColumn<String> get sku =>
      $composableBuilder(column: $table.sku, builder: (column) => column);

  GeneratedColumn<String> get barcode =>
      $composableBuilder(column: $table.barcode, builder: (column) => column);

  GeneratedColumn<double> get price =>
      $composableBuilder(column: $table.price, builder: (column) => column);

  GeneratedColumn<double> get costPrice =>
      $composableBuilder(column: $table.costPrice, builder: (column) => column);

  GeneratedColumn<String> get categoryId => $composableBuilder(
      column: $table.categoryId, builder: (column) => column);

  GeneratedColumn<bool> get trackStock => $composableBuilder(
      column: $table.trackStock, builder: (column) => column);

  GeneratedColumn<bool> get isService =>
      $composableBuilder(column: $table.isService, builder: (column) => column);

  GeneratedColumn<String> get colorHex =>
      $composableBuilder(column: $table.colorHex, builder: (column) => column);

  GeneratedColumn<String> get imageUrl =>
      $composableBuilder(column: $table.imageUrl, builder: (column) => column);

  GeneratedColumn<String> get printerCategory => $composableBuilder(
      column: $table.printerCategory, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<bool> get isSynced =>
      $composableBuilder(column: $table.isSynced, builder: (column) => column);

  GeneratedColumn<int> get version =>
      $composableBuilder(column: $table.version, builder: (column) => column);

  GeneratedColumn<bool> get isDeleted =>
      $composableBuilder(column: $table.isDeleted, builder: (column) => column);

  GeneratedColumn<bool> get isComposite => $composableBuilder(
      column: $table.isComposite, builder: (column) => column);

  Expression<T> productModifierLinkTableRefs<T extends Object>(
      Expression<T> Function(
              $$ProductModifierLinkTableTableAnnotationComposer a)
          f) {
    final $$ProductModifierLinkTableTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.uuid,
            referencedTable: $db.productModifierLinkTable,
            getReferencedColumn: (t) => t.productUuid,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$ProductModifierLinkTableTableAnnotationComposer(
                  $db: $db,
                  $table: $db.productModifierLinkTable,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }

  Expression<T> recipeTableRefs<T extends Object>(
      Expression<T> Function($$RecipeTableTableAnnotationComposer a) f) {
    final $$RecipeTableTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.uuid,
        referencedTable: $db.recipeTable,
        getReferencedColumn: (t) => t.productUuid,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$RecipeTableTableAnnotationComposer(
              $db: $db,
              $table: $db.recipeTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<T> localStocksTableRefs<T extends Object>(
      Expression<T> Function($$LocalStocksTableTableAnnotationComposer a) f) {
    final $$LocalStocksTableTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.uuid,
        referencedTable: $db.localStocksTable,
        getReferencedColumn: (t) => t.productUuid,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$LocalStocksTableTableAnnotationComposer(
              $db: $db,
              $table: $db.localStocksTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<T> productSupplierTableRefs<T extends Object>(
      Expression<T> Function($$ProductSupplierTableTableAnnotationComposer a)
          f) {
    final $$ProductSupplierTableTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.uuid,
            referencedTable: $db.productSupplierTable,
            getReferencedColumn: (t) => t.productUuid,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$ProductSupplierTableTableAnnotationComposer(
                  $db: $db,
                  $table: $db.productSupplierTable,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }

  Expression<T> purchaseOrderItemTableRefs<T extends Object>(
      Expression<T> Function($$PurchaseOrderItemTableTableAnnotationComposer a)
          f) {
    final $$PurchaseOrderItemTableTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.uuid,
            referencedTable: $db.purchaseOrderItemTable,
            getReferencedColumn: (t) => t.productUuid,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$PurchaseOrderItemTableTableAnnotationComposer(
                  $db: $db,
                  $table: $db.purchaseOrderItemTable,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }
}

class $$ProductTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ProductTableTable,
    ProductTableData,
    $$ProductTableTableFilterComposer,
    $$ProductTableTableOrderingComposer,
    $$ProductTableTableAnnotationComposer,
    $$ProductTableTableCreateCompanionBuilder,
    $$ProductTableTableUpdateCompanionBuilder,
    (ProductTableData, $$ProductTableTableReferences),
    ProductTableData,
    PrefetchHooks Function(
        {bool productModifierLinkTableRefs,
        bool recipeTableRefs,
        bool localStocksTableRefs,
        bool productSupplierTableRefs,
        bool purchaseOrderItemTableRefs})> {
  $$ProductTableTableTableManager(_$AppDatabase db, $ProductTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ProductTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ProductTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ProductTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> uuid = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String?> sku = const Value.absent(),
            Value<String?> barcode = const Value.absent(),
            Value<double> price = const Value.absent(),
            Value<double?> costPrice = const Value.absent(),
            Value<String> categoryId = const Value.absent(),
            Value<bool> trackStock = const Value.absent(),
            Value<bool> isService = const Value.absent(),
            Value<String?> colorHex = const Value.absent(),
            Value<String?> imageUrl = const Value.absent(),
            Value<String> printerCategory = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<bool> isSynced = const Value.absent(),
            Value<int> version = const Value.absent(),
            Value<bool> isDeleted = const Value.absent(),
            Value<bool> isComposite = const Value.absent(),
          }) =>
              ProductTableCompanion(
            id: id,
            uuid: uuid,
            name: name,
            sku: sku,
            barcode: barcode,
            price: price,
            costPrice: costPrice,
            categoryId: categoryId,
            trackStock: trackStock,
            isService: isService,
            colorHex: colorHex,
            imageUrl: imageUrl,
            printerCategory: printerCategory,
            updatedAt: updatedAt,
            isSynced: isSynced,
            version: version,
            isDeleted: isDeleted,
            isComposite: isComposite,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String uuid,
            required String name,
            Value<String?> sku = const Value.absent(),
            Value<String?> barcode = const Value.absent(),
            required double price,
            Value<double?> costPrice = const Value.absent(),
            required String categoryId,
            required bool trackStock,
            required bool isService,
            Value<String?> colorHex = const Value.absent(),
            Value<String?> imageUrl = const Value.absent(),
            Value<String> printerCategory = const Value.absent(),
            required DateTime updatedAt,
            Value<bool> isSynced = const Value.absent(),
            Value<int> version = const Value.absent(),
            Value<bool> isDeleted = const Value.absent(),
            Value<bool> isComposite = const Value.absent(),
          }) =>
              ProductTableCompanion.insert(
            id: id,
            uuid: uuid,
            name: name,
            sku: sku,
            barcode: barcode,
            price: price,
            costPrice: costPrice,
            categoryId: categoryId,
            trackStock: trackStock,
            isService: isService,
            colorHex: colorHex,
            imageUrl: imageUrl,
            printerCategory: printerCategory,
            updatedAt: updatedAt,
            isSynced: isSynced,
            version: version,
            isDeleted: isDeleted,
            isComposite: isComposite,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$ProductTableTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: (
              {productModifierLinkTableRefs = false,
              recipeTableRefs = false,
              localStocksTableRefs = false,
              productSupplierTableRefs = false,
              purchaseOrderItemTableRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (productModifierLinkTableRefs) db.productModifierLinkTable,
                if (recipeTableRefs) db.recipeTable,
                if (localStocksTableRefs) db.localStocksTable,
                if (productSupplierTableRefs) db.productSupplierTable,
                if (purchaseOrderItemTableRefs) db.purchaseOrderItemTable
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (productModifierLinkTableRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable: $$ProductTableTableReferences
                            ._productModifierLinkTableRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$ProductTableTableReferences(db, table, p0)
                                .productModifierLinkTableRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.productUuid == item.uuid),
                        typedResults: items),
                  if (recipeTableRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable: $$ProductTableTableReferences
                            ._recipeTableRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$ProductTableTableReferences(db, table, p0)
                                .recipeTableRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.productUuid == item.uuid),
                        typedResults: items),
                  if (localStocksTableRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable: $$ProductTableTableReferences
                            ._localStocksTableRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$ProductTableTableReferences(db, table, p0)
                                .localStocksTableRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.productUuid == item.uuid),
                        typedResults: items),
                  if (productSupplierTableRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable: $$ProductTableTableReferences
                            ._productSupplierTableRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$ProductTableTableReferences(db, table, p0)
                                .productSupplierTableRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.productUuid == item.uuid),
                        typedResults: items),
                  if (purchaseOrderItemTableRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable: $$ProductTableTableReferences
                            ._purchaseOrderItemTableRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$ProductTableTableReferences(db, table, p0)
                                .purchaseOrderItemTableRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.productUuid == item.uuid),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$ProductTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $ProductTableTable,
    ProductTableData,
    $$ProductTableTableFilterComposer,
    $$ProductTableTableOrderingComposer,
    $$ProductTableTableAnnotationComposer,
    $$ProductTableTableCreateCompanionBuilder,
    $$ProductTableTableUpdateCompanionBuilder,
    (ProductTableData, $$ProductTableTableReferences),
    ProductTableData,
    PrefetchHooks Function(
        {bool productModifierLinkTableRefs,
        bool recipeTableRefs,
        bool localStocksTableRefs,
        bool productSupplierTableRefs,
        bool purchaseOrderItemTableRefs})>;
typedef $$RestaurantTableTableCreateCompanionBuilder = RestaurantTableCompanion
    Function({
  Value<int> id,
  required String uuid,
  required String name,
  Value<int> capacity,
  required double x,
  required double y,
  Value<bool> isOccupied,
  Value<String?> currentOrderUuid,
  required DateTime updatedAt,
});
typedef $$RestaurantTableTableUpdateCompanionBuilder = RestaurantTableCompanion
    Function({
  Value<int> id,
  Value<String> uuid,
  Value<String> name,
  Value<int> capacity,
  Value<double> x,
  Value<double> y,
  Value<bool> isOccupied,
  Value<String?> currentOrderUuid,
  Value<DateTime> updatedAt,
});

class $$RestaurantTableTableFilterComposer
    extends Composer<_$AppDatabase, $RestaurantTableTable> {
  $$RestaurantTableTableFilterComposer({
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

  ColumnFilters<int> get capacity => $composableBuilder(
      column: $table.capacity, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get x => $composableBuilder(
      column: $table.x, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get y => $composableBuilder(
      column: $table.y, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isOccupied => $composableBuilder(
      column: $table.isOccupied, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get currentOrderUuid => $composableBuilder(
      column: $table.currentOrderUuid,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));
}

class $$RestaurantTableTableOrderingComposer
    extends Composer<_$AppDatabase, $RestaurantTableTable> {
  $$RestaurantTableTableOrderingComposer({
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

  ColumnOrderings<int> get capacity => $composableBuilder(
      column: $table.capacity, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get x => $composableBuilder(
      column: $table.x, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get y => $composableBuilder(
      column: $table.y, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isOccupied => $composableBuilder(
      column: $table.isOccupied, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get currentOrderUuid => $composableBuilder(
      column: $table.currentOrderUuid,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));
}

class $$RestaurantTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $RestaurantTableTable> {
  $$RestaurantTableTableAnnotationComposer({
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

  GeneratedColumn<int> get capacity =>
      $composableBuilder(column: $table.capacity, builder: (column) => column);

  GeneratedColumn<double> get x =>
      $composableBuilder(column: $table.x, builder: (column) => column);

  GeneratedColumn<double> get y =>
      $composableBuilder(column: $table.y, builder: (column) => column);

  GeneratedColumn<bool> get isOccupied => $composableBuilder(
      column: $table.isOccupied, builder: (column) => column);

  GeneratedColumn<String> get currentOrderUuid => $composableBuilder(
      column: $table.currentOrderUuid, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$RestaurantTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $RestaurantTableTable,
    RestaurantTableData,
    $$RestaurantTableTableFilterComposer,
    $$RestaurantTableTableOrderingComposer,
    $$RestaurantTableTableAnnotationComposer,
    $$RestaurantTableTableCreateCompanionBuilder,
    $$RestaurantTableTableUpdateCompanionBuilder,
    (
      RestaurantTableData,
      BaseReferences<_$AppDatabase, $RestaurantTableTable, RestaurantTableData>
    ),
    RestaurantTableData,
    PrefetchHooks Function()> {
  $$RestaurantTableTableTableManager(
      _$AppDatabase db, $RestaurantTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$RestaurantTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$RestaurantTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$RestaurantTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> uuid = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<int> capacity = const Value.absent(),
            Value<double> x = const Value.absent(),
            Value<double> y = const Value.absent(),
            Value<bool> isOccupied = const Value.absent(),
            Value<String?> currentOrderUuid = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
          }) =>
              RestaurantTableCompanion(
            id: id,
            uuid: uuid,
            name: name,
            capacity: capacity,
            x: x,
            y: y,
            isOccupied: isOccupied,
            currentOrderUuid: currentOrderUuid,
            updatedAt: updatedAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String uuid,
            required String name,
            Value<int> capacity = const Value.absent(),
            required double x,
            required double y,
            Value<bool> isOccupied = const Value.absent(),
            Value<String?> currentOrderUuid = const Value.absent(),
            required DateTime updatedAt,
          }) =>
              RestaurantTableCompanion.insert(
            id: id,
            uuid: uuid,
            name: name,
            capacity: capacity,
            x: x,
            y: y,
            isOccupied: isOccupied,
            currentOrderUuid: currentOrderUuid,
            updatedAt: updatedAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$RestaurantTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $RestaurantTableTable,
    RestaurantTableData,
    $$RestaurantTableTableFilterComposer,
    $$RestaurantTableTableOrderingComposer,
    $$RestaurantTableTableAnnotationComposer,
    $$RestaurantTableTableCreateCompanionBuilder,
    $$RestaurantTableTableUpdateCompanionBuilder,
    (
      RestaurantTableData,
      BaseReferences<_$AppDatabase, $RestaurantTableTable, RestaurantTableData>
    ),
    RestaurantTableData,
    PrefetchHooks Function()>;
typedef $$ReservationTableTableCreateCompanionBuilder
    = ReservationTableCompanion Function({
  Value<int> id,
  required String uuid,
  required String customerName,
  Value<String?> phone,
  required int pax,
  required DateTime reservationTime,
  Value<String?> tableUuid,
  Value<String> status,
  Value<String?> note,
  required DateTime createdAt,
  required DateTime updatedAt,
});
typedef $$ReservationTableTableUpdateCompanionBuilder
    = ReservationTableCompanion Function({
  Value<int> id,
  Value<String> uuid,
  Value<String> customerName,
  Value<String?> phone,
  Value<int> pax,
  Value<DateTime> reservationTime,
  Value<String?> tableUuid,
  Value<String> status,
  Value<String?> note,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
});

class $$ReservationTableTableFilterComposer
    extends Composer<_$AppDatabase, $ReservationTableTable> {
  $$ReservationTableTableFilterComposer({
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

  ColumnFilters<String> get customerName => $composableBuilder(
      column: $table.customerName, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get phone => $composableBuilder(
      column: $table.phone, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get pax => $composableBuilder(
      column: $table.pax, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get reservationTime => $composableBuilder(
      column: $table.reservationTime,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get tableUuid => $composableBuilder(
      column: $table.tableUuid, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get note => $composableBuilder(
      column: $table.note, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));
}

class $$ReservationTableTableOrderingComposer
    extends Composer<_$AppDatabase, $ReservationTableTable> {
  $$ReservationTableTableOrderingComposer({
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

  ColumnOrderings<String> get customerName => $composableBuilder(
      column: $table.customerName,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get phone => $composableBuilder(
      column: $table.phone, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get pax => $composableBuilder(
      column: $table.pax, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get reservationTime => $composableBuilder(
      column: $table.reservationTime,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get tableUuid => $composableBuilder(
      column: $table.tableUuid, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get note => $composableBuilder(
      column: $table.note, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));
}

class $$ReservationTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $ReservationTableTable> {
  $$ReservationTableTableAnnotationComposer({
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

  GeneratedColumn<String> get customerName => $composableBuilder(
      column: $table.customerName, builder: (column) => column);

  GeneratedColumn<String> get phone =>
      $composableBuilder(column: $table.phone, builder: (column) => column);

  GeneratedColumn<int> get pax =>
      $composableBuilder(column: $table.pax, builder: (column) => column);

  GeneratedColumn<DateTime> get reservationTime => $composableBuilder(
      column: $table.reservationTime, builder: (column) => column);

  GeneratedColumn<String> get tableUuid =>
      $composableBuilder(column: $table.tableUuid, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<String> get note =>
      $composableBuilder(column: $table.note, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$ReservationTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ReservationTableTable,
    ReservationTableData,
    $$ReservationTableTableFilterComposer,
    $$ReservationTableTableOrderingComposer,
    $$ReservationTableTableAnnotationComposer,
    $$ReservationTableTableCreateCompanionBuilder,
    $$ReservationTableTableUpdateCompanionBuilder,
    (
      ReservationTableData,
      BaseReferences<_$AppDatabase, $ReservationTableTable,
          ReservationTableData>
    ),
    ReservationTableData,
    PrefetchHooks Function()> {
  $$ReservationTableTableTableManager(
      _$AppDatabase db, $ReservationTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ReservationTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ReservationTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ReservationTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> uuid = const Value.absent(),
            Value<String> customerName = const Value.absent(),
            Value<String?> phone = const Value.absent(),
            Value<int> pax = const Value.absent(),
            Value<DateTime> reservationTime = const Value.absent(),
            Value<String?> tableUuid = const Value.absent(),
            Value<String> status = const Value.absent(),
            Value<String?> note = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
          }) =>
              ReservationTableCompanion(
            id: id,
            uuid: uuid,
            customerName: customerName,
            phone: phone,
            pax: pax,
            reservationTime: reservationTime,
            tableUuid: tableUuid,
            status: status,
            note: note,
            createdAt: createdAt,
            updatedAt: updatedAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String uuid,
            required String customerName,
            Value<String?> phone = const Value.absent(),
            required int pax,
            required DateTime reservationTime,
            Value<String?> tableUuid = const Value.absent(),
            Value<String> status = const Value.absent(),
            Value<String?> note = const Value.absent(),
            required DateTime createdAt,
            required DateTime updatedAt,
          }) =>
              ReservationTableCompanion.insert(
            id: id,
            uuid: uuid,
            customerName: customerName,
            phone: phone,
            pax: pax,
            reservationTime: reservationTime,
            tableUuid: tableUuid,
            status: status,
            note: note,
            createdAt: createdAt,
            updatedAt: updatedAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$ReservationTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $ReservationTableTable,
    ReservationTableData,
    $$ReservationTableTableFilterComposer,
    $$ReservationTableTableOrderingComposer,
    $$ReservationTableTableAnnotationComposer,
    $$ReservationTableTableCreateCompanionBuilder,
    $$ReservationTableTableUpdateCompanionBuilder,
    (
      ReservationTableData,
      BaseReferences<_$AppDatabase, $ReservationTableTable,
          ReservationTableData>
    ),
    ReservationTableData,
    PrefetchHooks Function()>;
typedef $$EmployeeTableTableCreateCompanionBuilder = EmployeeTableCompanion
    Function({
  Value<int> id,
  required String uuid,
  required String name,
  required String pin,
  required String role,
  Value<bool> isActive,
  required DateTime createdAt,
  Value<DateTime?> updatedAt,
});
typedef $$EmployeeTableTableUpdateCompanionBuilder = EmployeeTableCompanion
    Function({
  Value<int> id,
  Value<String> uuid,
  Value<String> name,
  Value<String> pin,
  Value<String> role,
  Value<bool> isActive,
  Value<DateTime> createdAt,
  Value<DateTime?> updatedAt,
});

class $$EmployeeTableTableFilterComposer
    extends Composer<_$AppDatabase, $EmployeeTableTable> {
  $$EmployeeTableTableFilterComposer({
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

  ColumnFilters<String> get pin => $composableBuilder(
      column: $table.pin, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get role => $composableBuilder(
      column: $table.role, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isActive => $composableBuilder(
      column: $table.isActive, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));
}

class $$EmployeeTableTableOrderingComposer
    extends Composer<_$AppDatabase, $EmployeeTableTable> {
  $$EmployeeTableTableOrderingComposer({
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

  ColumnOrderings<String> get pin => $composableBuilder(
      column: $table.pin, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get role => $composableBuilder(
      column: $table.role, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isActive => $composableBuilder(
      column: $table.isActive, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));
}

class $$EmployeeTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $EmployeeTableTable> {
  $$EmployeeTableTableAnnotationComposer({
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

  GeneratedColumn<String> get pin =>
      $composableBuilder(column: $table.pin, builder: (column) => column);

  GeneratedColumn<String> get role =>
      $composableBuilder(column: $table.role, builder: (column) => column);

  GeneratedColumn<bool> get isActive =>
      $composableBuilder(column: $table.isActive, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$EmployeeTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $EmployeeTableTable,
    EmployeeTableData,
    $$EmployeeTableTableFilterComposer,
    $$EmployeeTableTableOrderingComposer,
    $$EmployeeTableTableAnnotationComposer,
    $$EmployeeTableTableCreateCompanionBuilder,
    $$EmployeeTableTableUpdateCompanionBuilder,
    (
      EmployeeTableData,
      BaseReferences<_$AppDatabase, $EmployeeTableTable, EmployeeTableData>
    ),
    EmployeeTableData,
    PrefetchHooks Function()> {
  $$EmployeeTableTableTableManager(_$AppDatabase db, $EmployeeTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$EmployeeTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$EmployeeTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$EmployeeTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> uuid = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String> pin = const Value.absent(),
            Value<String> role = const Value.absent(),
            Value<bool> isActive = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime?> updatedAt = const Value.absent(),
          }) =>
              EmployeeTableCompanion(
            id: id,
            uuid: uuid,
            name: name,
            pin: pin,
            role: role,
            isActive: isActive,
            createdAt: createdAt,
            updatedAt: updatedAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String uuid,
            required String name,
            required String pin,
            required String role,
            Value<bool> isActive = const Value.absent(),
            required DateTime createdAt,
            Value<DateTime?> updatedAt = const Value.absent(),
          }) =>
              EmployeeTableCompanion.insert(
            id: id,
            uuid: uuid,
            name: name,
            pin: pin,
            role: role,
            isActive: isActive,
            createdAt: createdAt,
            updatedAt: updatedAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$EmployeeTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $EmployeeTableTable,
    EmployeeTableData,
    $$EmployeeTableTableFilterComposer,
    $$EmployeeTableTableOrderingComposer,
    $$EmployeeTableTableAnnotationComposer,
    $$EmployeeTableTableCreateCompanionBuilder,
    $$EmployeeTableTableUpdateCompanionBuilder,
    (
      EmployeeTableData,
      BaseReferences<_$AppDatabase, $EmployeeTableTable, EmployeeTableData>
    ),
    EmployeeTableData,
    PrefetchHooks Function()>;
typedef $$ModifierGroupTableTableCreateCompanionBuilder
    = ModifierGroupTableCompanion Function({
  Value<int> id,
  required String uuid,
  required String name,
  Value<bool> allowMultiSelect,
  Value<int> minSelection,
  Value<int?> maxSelection,
  required DateTime updatedAt,
  Value<bool> isDeleted,
});
typedef $$ModifierGroupTableTableUpdateCompanionBuilder
    = ModifierGroupTableCompanion Function({
  Value<int> id,
  Value<String> uuid,
  Value<String> name,
  Value<bool> allowMultiSelect,
  Value<int> minSelection,
  Value<int?> maxSelection,
  Value<DateTime> updatedAt,
  Value<bool> isDeleted,
});

final class $$ModifierGroupTableTableReferences extends BaseReferences<
    _$AppDatabase, $ModifierGroupTableTable, ModifierGroupTableData> {
  $$ModifierGroupTableTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$ModifierItemTableTable,
      List<ModifierItemTableData>> _modifierItemTableRefsTable(
          _$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.modifierItemTable,
          aliasName: $_aliasNameGenerator(
              db.modifierGroupTable.uuid, db.modifierItemTable.groupUuid));

  $$ModifierItemTableTableProcessedTableManager get modifierItemTableRefs {
    final manager =
        $$ModifierItemTableTableTableManager($_db, $_db.modifierItemTable)
            .filter((f) => f.groupUuid.uuid($_item.uuid));

    final cache =
        $_typedResult.readTableOrNull(_modifierItemTableRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$ProductModifierLinkTableTable,
      List<ProductModifierLinkTableData>> _productModifierLinkTableRefsTable(
          _$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.productModifierLinkTable,
          aliasName: $_aliasNameGenerator(db.modifierGroupTable.uuid,
              db.productModifierLinkTable.modifierGroupUuid));

  $$ProductModifierLinkTableTableProcessedTableManager
      get productModifierLinkTableRefs {
    final manager = $$ProductModifierLinkTableTableTableManager(
            $_db, $_db.productModifierLinkTable)
        .filter((f) => f.modifierGroupUuid.uuid($_item.uuid));

    final cache =
        $_typedResult.readTableOrNull(_productModifierLinkTableRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$ModifierGroupTableTableFilterComposer
    extends Composer<_$AppDatabase, $ModifierGroupTableTable> {
  $$ModifierGroupTableTableFilterComposer({
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

  ColumnFilters<bool> get allowMultiSelect => $composableBuilder(
      column: $table.allowMultiSelect,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get minSelection => $composableBuilder(
      column: $table.minSelection, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get maxSelection => $composableBuilder(
      column: $table.maxSelection, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isDeleted => $composableBuilder(
      column: $table.isDeleted, builder: (column) => ColumnFilters(column));

  Expression<bool> modifierItemTableRefs(
      Expression<bool> Function($$ModifierItemTableTableFilterComposer f) f) {
    final $$ModifierItemTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.uuid,
        referencedTable: $db.modifierItemTable,
        getReferencedColumn: (t) => t.groupUuid,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ModifierItemTableTableFilterComposer(
              $db: $db,
              $table: $db.modifierItemTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> productModifierLinkTableRefs(
      Expression<bool> Function($$ProductModifierLinkTableTableFilterComposer f)
          f) {
    final $$ProductModifierLinkTableTableFilterComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.uuid,
            referencedTable: $db.productModifierLinkTable,
            getReferencedColumn: (t) => t.modifierGroupUuid,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$ProductModifierLinkTableTableFilterComposer(
                  $db: $db,
                  $table: $db.productModifierLinkTable,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }
}

class $$ModifierGroupTableTableOrderingComposer
    extends Composer<_$AppDatabase, $ModifierGroupTableTable> {
  $$ModifierGroupTableTableOrderingComposer({
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

  ColumnOrderings<bool> get allowMultiSelect => $composableBuilder(
      column: $table.allowMultiSelect,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get minSelection => $composableBuilder(
      column: $table.minSelection,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get maxSelection => $composableBuilder(
      column: $table.maxSelection,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isDeleted => $composableBuilder(
      column: $table.isDeleted, builder: (column) => ColumnOrderings(column));
}

class $$ModifierGroupTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $ModifierGroupTableTable> {
  $$ModifierGroupTableTableAnnotationComposer({
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

  GeneratedColumn<bool> get allowMultiSelect => $composableBuilder(
      column: $table.allowMultiSelect, builder: (column) => column);

  GeneratedColumn<int> get minSelection => $composableBuilder(
      column: $table.minSelection, builder: (column) => column);

  GeneratedColumn<int> get maxSelection => $composableBuilder(
      column: $table.maxSelection, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<bool> get isDeleted =>
      $composableBuilder(column: $table.isDeleted, builder: (column) => column);

  Expression<T> modifierItemTableRefs<T extends Object>(
      Expression<T> Function($$ModifierItemTableTableAnnotationComposer a) f) {
    final $$ModifierItemTableTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.uuid,
            referencedTable: $db.modifierItemTable,
            getReferencedColumn: (t) => t.groupUuid,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$ModifierItemTableTableAnnotationComposer(
                  $db: $db,
                  $table: $db.modifierItemTable,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }

  Expression<T> productModifierLinkTableRefs<T extends Object>(
      Expression<T> Function(
              $$ProductModifierLinkTableTableAnnotationComposer a)
          f) {
    final $$ProductModifierLinkTableTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.uuid,
            referencedTable: $db.productModifierLinkTable,
            getReferencedColumn: (t) => t.modifierGroupUuid,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$ProductModifierLinkTableTableAnnotationComposer(
                  $db: $db,
                  $table: $db.productModifierLinkTable,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }
}

class $$ModifierGroupTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ModifierGroupTableTable,
    ModifierGroupTableData,
    $$ModifierGroupTableTableFilterComposer,
    $$ModifierGroupTableTableOrderingComposer,
    $$ModifierGroupTableTableAnnotationComposer,
    $$ModifierGroupTableTableCreateCompanionBuilder,
    $$ModifierGroupTableTableUpdateCompanionBuilder,
    (ModifierGroupTableData, $$ModifierGroupTableTableReferences),
    ModifierGroupTableData,
    PrefetchHooks Function(
        {bool modifierItemTableRefs, bool productModifierLinkTableRefs})> {
  $$ModifierGroupTableTableTableManager(
      _$AppDatabase db, $ModifierGroupTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ModifierGroupTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ModifierGroupTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ModifierGroupTableTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> uuid = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<bool> allowMultiSelect = const Value.absent(),
            Value<int> minSelection = const Value.absent(),
            Value<int?> maxSelection = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<bool> isDeleted = const Value.absent(),
          }) =>
              ModifierGroupTableCompanion(
            id: id,
            uuid: uuid,
            name: name,
            allowMultiSelect: allowMultiSelect,
            minSelection: minSelection,
            maxSelection: maxSelection,
            updatedAt: updatedAt,
            isDeleted: isDeleted,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String uuid,
            required String name,
            Value<bool> allowMultiSelect = const Value.absent(),
            Value<int> minSelection = const Value.absent(),
            Value<int?> maxSelection = const Value.absent(),
            required DateTime updatedAt,
            Value<bool> isDeleted = const Value.absent(),
          }) =>
              ModifierGroupTableCompanion.insert(
            id: id,
            uuid: uuid,
            name: name,
            allowMultiSelect: allowMultiSelect,
            minSelection: minSelection,
            maxSelection: maxSelection,
            updatedAt: updatedAt,
            isDeleted: isDeleted,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$ModifierGroupTableTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: (
              {modifierItemTableRefs = false,
              productModifierLinkTableRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (modifierItemTableRefs) db.modifierItemTable,
                if (productModifierLinkTableRefs) db.productModifierLinkTable
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (modifierItemTableRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable: $$ModifierGroupTableTableReferences
                            ._modifierItemTableRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$ModifierGroupTableTableReferences(db, table, p0)
                                .modifierItemTableRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.groupUuid == item.uuid),
                        typedResults: items),
                  if (productModifierLinkTableRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable: $$ModifierGroupTableTableReferences
                            ._productModifierLinkTableRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$ModifierGroupTableTableReferences(db, table, p0)
                                .productModifierLinkTableRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.modifierGroupUuid == item.uuid),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$ModifierGroupTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $ModifierGroupTableTable,
    ModifierGroupTableData,
    $$ModifierGroupTableTableFilterComposer,
    $$ModifierGroupTableTableOrderingComposer,
    $$ModifierGroupTableTableAnnotationComposer,
    $$ModifierGroupTableTableCreateCompanionBuilder,
    $$ModifierGroupTableTableUpdateCompanionBuilder,
    (ModifierGroupTableData, $$ModifierGroupTableTableReferences),
    ModifierGroupTableData,
    PrefetchHooks Function(
        {bool modifierItemTableRefs, bool productModifierLinkTableRefs})>;
typedef $$ModifierItemTableTableCreateCompanionBuilder
    = ModifierItemTableCompanion Function({
  Value<int> id,
  required String uuid,
  required String groupUuid,
  required String name,
  Value<double> priceDelta,
  required DateTime updatedAt,
  Value<bool> isDeleted,
});
typedef $$ModifierItemTableTableUpdateCompanionBuilder
    = ModifierItemTableCompanion Function({
  Value<int> id,
  Value<String> uuid,
  Value<String> groupUuid,
  Value<String> name,
  Value<double> priceDelta,
  Value<DateTime> updatedAt,
  Value<bool> isDeleted,
});

final class $$ModifierItemTableTableReferences extends BaseReferences<
    _$AppDatabase, $ModifierItemTableTable, ModifierItemTableData> {
  $$ModifierItemTableTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $ModifierGroupTableTable _groupUuidTable(_$AppDatabase db) =>
      db.modifierGroupTable.createAlias($_aliasNameGenerator(
          db.modifierItemTable.groupUuid, db.modifierGroupTable.uuid));

  $$ModifierGroupTableTableProcessedTableManager? get groupUuid {
    if ($_item.groupUuid == null) return null;
    final manager =
        $$ModifierGroupTableTableTableManager($_db, $_db.modifierGroupTable)
            .filter((f) => f.uuid($_item.groupUuid!));
    final item = $_typedResult.readTableOrNull(_groupUuidTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$ModifierItemTableTableFilterComposer
    extends Composer<_$AppDatabase, $ModifierItemTableTable> {
  $$ModifierItemTableTableFilterComposer({
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

  ColumnFilters<double> get priceDelta => $composableBuilder(
      column: $table.priceDelta, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isDeleted => $composableBuilder(
      column: $table.isDeleted, builder: (column) => ColumnFilters(column));

  $$ModifierGroupTableTableFilterComposer get groupUuid {
    final $$ModifierGroupTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.groupUuid,
        referencedTable: $db.modifierGroupTable,
        getReferencedColumn: (t) => t.uuid,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ModifierGroupTableTableFilterComposer(
              $db: $db,
              $table: $db.modifierGroupTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$ModifierItemTableTableOrderingComposer
    extends Composer<_$AppDatabase, $ModifierItemTableTable> {
  $$ModifierItemTableTableOrderingComposer({
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

  ColumnOrderings<double> get priceDelta => $composableBuilder(
      column: $table.priceDelta, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isDeleted => $composableBuilder(
      column: $table.isDeleted, builder: (column) => ColumnOrderings(column));

  $$ModifierGroupTableTableOrderingComposer get groupUuid {
    final $$ModifierGroupTableTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.groupUuid,
        referencedTable: $db.modifierGroupTable,
        getReferencedColumn: (t) => t.uuid,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ModifierGroupTableTableOrderingComposer(
              $db: $db,
              $table: $db.modifierGroupTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$ModifierItemTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $ModifierItemTableTable> {
  $$ModifierItemTableTableAnnotationComposer({
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

  GeneratedColumn<double> get priceDelta => $composableBuilder(
      column: $table.priceDelta, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<bool> get isDeleted =>
      $composableBuilder(column: $table.isDeleted, builder: (column) => column);

  $$ModifierGroupTableTableAnnotationComposer get groupUuid {
    final $$ModifierGroupTableTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.groupUuid,
            referencedTable: $db.modifierGroupTable,
            getReferencedColumn: (t) => t.uuid,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$ModifierGroupTableTableAnnotationComposer(
                  $db: $db,
                  $table: $db.modifierGroupTable,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return composer;
  }
}

class $$ModifierItemTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ModifierItemTableTable,
    ModifierItemTableData,
    $$ModifierItemTableTableFilterComposer,
    $$ModifierItemTableTableOrderingComposer,
    $$ModifierItemTableTableAnnotationComposer,
    $$ModifierItemTableTableCreateCompanionBuilder,
    $$ModifierItemTableTableUpdateCompanionBuilder,
    (ModifierItemTableData, $$ModifierItemTableTableReferences),
    ModifierItemTableData,
    PrefetchHooks Function({bool groupUuid})> {
  $$ModifierItemTableTableTableManager(
      _$AppDatabase db, $ModifierItemTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ModifierItemTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ModifierItemTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ModifierItemTableTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> uuid = const Value.absent(),
            Value<String> groupUuid = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<double> priceDelta = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<bool> isDeleted = const Value.absent(),
          }) =>
              ModifierItemTableCompanion(
            id: id,
            uuid: uuid,
            groupUuid: groupUuid,
            name: name,
            priceDelta: priceDelta,
            updatedAt: updatedAt,
            isDeleted: isDeleted,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String uuid,
            required String groupUuid,
            required String name,
            Value<double> priceDelta = const Value.absent(),
            required DateTime updatedAt,
            Value<bool> isDeleted = const Value.absent(),
          }) =>
              ModifierItemTableCompanion.insert(
            id: id,
            uuid: uuid,
            groupUuid: groupUuid,
            name: name,
            priceDelta: priceDelta,
            updatedAt: updatedAt,
            isDeleted: isDeleted,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$ModifierItemTableTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({groupUuid = false}) {
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
                if (groupUuid) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.groupUuid,
                    referencedTable:
                        $$ModifierItemTableTableReferences._groupUuidTable(db),
                    referencedColumn: $$ModifierItemTableTableReferences
                        ._groupUuidTable(db)
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

typedef $$ModifierItemTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $ModifierItemTableTable,
    ModifierItemTableData,
    $$ModifierItemTableTableFilterComposer,
    $$ModifierItemTableTableOrderingComposer,
    $$ModifierItemTableTableAnnotationComposer,
    $$ModifierItemTableTableCreateCompanionBuilder,
    $$ModifierItemTableTableUpdateCompanionBuilder,
    (ModifierItemTableData, $$ModifierItemTableTableReferences),
    ModifierItemTableData,
    PrefetchHooks Function({bool groupUuid})>;
typedef $$ProductModifierLinkTableTableCreateCompanionBuilder
    = ProductModifierLinkTableCompanion Function({
  Value<int> id,
  required String productUuid,
  required String modifierGroupUuid,
  Value<int> sortOrder,
});
typedef $$ProductModifierLinkTableTableUpdateCompanionBuilder
    = ProductModifierLinkTableCompanion Function({
  Value<int> id,
  Value<String> productUuid,
  Value<String> modifierGroupUuid,
  Value<int> sortOrder,
});

final class $$ProductModifierLinkTableTableReferences extends BaseReferences<
    _$AppDatabase,
    $ProductModifierLinkTableTable,
    ProductModifierLinkTableData> {
  $$ProductModifierLinkTableTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $ProductTableTable _productUuidTable(_$AppDatabase db) =>
      db.productTable.createAlias($_aliasNameGenerator(
          db.productModifierLinkTable.productUuid, db.productTable.uuid));

  $$ProductTableTableProcessedTableManager? get productUuid {
    if ($_item.productUuid == null) return null;
    final manager = $$ProductTableTableTableManager($_db, $_db.productTable)
        .filter((f) => f.uuid($_item.productUuid!));
    final item = $_typedResult.readTableOrNull(_productUuidTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $ModifierGroupTableTable _modifierGroupUuidTable(_$AppDatabase db) =>
      db.modifierGroupTable.createAlias($_aliasNameGenerator(
          db.productModifierLinkTable.modifierGroupUuid,
          db.modifierGroupTable.uuid));

  $$ModifierGroupTableTableProcessedTableManager? get modifierGroupUuid {
    if ($_item.modifierGroupUuid == null) return null;
    final manager =
        $$ModifierGroupTableTableTableManager($_db, $_db.modifierGroupTable)
            .filter((f) => f.uuid($_item.modifierGroupUuid!));
    final item = $_typedResult.readTableOrNull(_modifierGroupUuidTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$ProductModifierLinkTableTableFilterComposer
    extends Composer<_$AppDatabase, $ProductModifierLinkTableTable> {
  $$ProductModifierLinkTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get sortOrder => $composableBuilder(
      column: $table.sortOrder, builder: (column) => ColumnFilters(column));

  $$ProductTableTableFilterComposer get productUuid {
    final $$ProductTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.productUuid,
        referencedTable: $db.productTable,
        getReferencedColumn: (t) => t.uuid,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ProductTableTableFilterComposer(
              $db: $db,
              $table: $db.productTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$ModifierGroupTableTableFilterComposer get modifierGroupUuid {
    final $$ModifierGroupTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.modifierGroupUuid,
        referencedTable: $db.modifierGroupTable,
        getReferencedColumn: (t) => t.uuid,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ModifierGroupTableTableFilterComposer(
              $db: $db,
              $table: $db.modifierGroupTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$ProductModifierLinkTableTableOrderingComposer
    extends Composer<_$AppDatabase, $ProductModifierLinkTableTable> {
  $$ProductModifierLinkTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get sortOrder => $composableBuilder(
      column: $table.sortOrder, builder: (column) => ColumnOrderings(column));

  $$ProductTableTableOrderingComposer get productUuid {
    final $$ProductTableTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.productUuid,
        referencedTable: $db.productTable,
        getReferencedColumn: (t) => t.uuid,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ProductTableTableOrderingComposer(
              $db: $db,
              $table: $db.productTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$ModifierGroupTableTableOrderingComposer get modifierGroupUuid {
    final $$ModifierGroupTableTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.modifierGroupUuid,
        referencedTable: $db.modifierGroupTable,
        getReferencedColumn: (t) => t.uuid,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ModifierGroupTableTableOrderingComposer(
              $db: $db,
              $table: $db.modifierGroupTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$ProductModifierLinkTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $ProductModifierLinkTableTable> {
  $$ProductModifierLinkTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get sortOrder =>
      $composableBuilder(column: $table.sortOrder, builder: (column) => column);

  $$ProductTableTableAnnotationComposer get productUuid {
    final $$ProductTableTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.productUuid,
        referencedTable: $db.productTable,
        getReferencedColumn: (t) => t.uuid,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ProductTableTableAnnotationComposer(
              $db: $db,
              $table: $db.productTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$ModifierGroupTableTableAnnotationComposer get modifierGroupUuid {
    final $$ModifierGroupTableTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.modifierGroupUuid,
            referencedTable: $db.modifierGroupTable,
            getReferencedColumn: (t) => t.uuid,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$ModifierGroupTableTableAnnotationComposer(
                  $db: $db,
                  $table: $db.modifierGroupTable,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return composer;
  }
}

class $$ProductModifierLinkTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ProductModifierLinkTableTable,
    ProductModifierLinkTableData,
    $$ProductModifierLinkTableTableFilterComposer,
    $$ProductModifierLinkTableTableOrderingComposer,
    $$ProductModifierLinkTableTableAnnotationComposer,
    $$ProductModifierLinkTableTableCreateCompanionBuilder,
    $$ProductModifierLinkTableTableUpdateCompanionBuilder,
    (ProductModifierLinkTableData, $$ProductModifierLinkTableTableReferences),
    ProductModifierLinkTableData,
    PrefetchHooks Function({bool productUuid, bool modifierGroupUuid})> {
  $$ProductModifierLinkTableTableTableManager(
      _$AppDatabase db, $ProductModifierLinkTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ProductModifierLinkTableTableFilterComposer(
                  $db: db, $table: table),
          createOrderingComposer: () =>
              $$ProductModifierLinkTableTableOrderingComposer(
                  $db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ProductModifierLinkTableTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> productUuid = const Value.absent(),
            Value<String> modifierGroupUuid = const Value.absent(),
            Value<int> sortOrder = const Value.absent(),
          }) =>
              ProductModifierLinkTableCompanion(
            id: id,
            productUuid: productUuid,
            modifierGroupUuid: modifierGroupUuid,
            sortOrder: sortOrder,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String productUuid,
            required String modifierGroupUuid,
            Value<int> sortOrder = const Value.absent(),
          }) =>
              ProductModifierLinkTableCompanion.insert(
            id: id,
            productUuid: productUuid,
            modifierGroupUuid: modifierGroupUuid,
            sortOrder: sortOrder,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$ProductModifierLinkTableTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: (
              {productUuid = false, modifierGroupUuid = false}) {
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
                if (productUuid) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.productUuid,
                    referencedTable: $$ProductModifierLinkTableTableReferences
                        ._productUuidTable(db),
                    referencedColumn: $$ProductModifierLinkTableTableReferences
                        ._productUuidTable(db)
                        .uuid,
                  ) as T;
                }
                if (modifierGroupUuid) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.modifierGroupUuid,
                    referencedTable: $$ProductModifierLinkTableTableReferences
                        ._modifierGroupUuidTable(db),
                    referencedColumn: $$ProductModifierLinkTableTableReferences
                        ._modifierGroupUuidTable(db)
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

typedef $$ProductModifierLinkTableTableProcessedTableManager
    = ProcessedTableManager<
        _$AppDatabase,
        $ProductModifierLinkTableTable,
        ProductModifierLinkTableData,
        $$ProductModifierLinkTableTableFilterComposer,
        $$ProductModifierLinkTableTableOrderingComposer,
        $$ProductModifierLinkTableTableAnnotationComposer,
        $$ProductModifierLinkTableTableCreateCompanionBuilder,
        $$ProductModifierLinkTableTableUpdateCompanionBuilder,
        (
          ProductModifierLinkTableData,
          $$ProductModifierLinkTableTableReferences
        ),
        ProductModifierLinkTableData,
        PrefetchHooks Function({bool productUuid, bool modifierGroupUuid})>;
typedef $$IngredientTableTableCreateCompanionBuilder = IngredientTableCompanion
    Function({
  Value<int> id,
  required String uuid,
  required String name,
  required String unit,
  Value<double> currentStock,
  Value<double> costPerUnit,
  required DateTime updatedAt,
  Value<bool> isDeleted,
});
typedef $$IngredientTableTableUpdateCompanionBuilder = IngredientTableCompanion
    Function({
  Value<int> id,
  Value<String> uuid,
  Value<String> name,
  Value<String> unit,
  Value<double> currentStock,
  Value<double> costPerUnit,
  Value<DateTime> updatedAt,
  Value<bool> isDeleted,
});

final class $$IngredientTableTableReferences extends BaseReferences<
    _$AppDatabase, $IngredientTableTable, IngredientTableData> {
  $$IngredientTableTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$RecipeTableTable, List<RecipeTableData>>
      _recipeTableRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.recipeTable,
              aliasName: $_aliasNameGenerator(
                  db.ingredientTable.uuid, db.recipeTable.ingredientUuid));

  $$RecipeTableTableProcessedTableManager get recipeTableRefs {
    final manager = $$RecipeTableTableTableManager($_db, $_db.recipeTable)
        .filter((f) => f.ingredientUuid.uuid($_item.uuid));

    final cache = $_typedResult.readTableOrNull(_recipeTableRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$IngredientTableTableFilterComposer
    extends Composer<_$AppDatabase, $IngredientTableTable> {
  $$IngredientTableTableFilterComposer({
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

  ColumnFilters<String> get unit => $composableBuilder(
      column: $table.unit, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get currentStock => $composableBuilder(
      column: $table.currentStock, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get costPerUnit => $composableBuilder(
      column: $table.costPerUnit, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isDeleted => $composableBuilder(
      column: $table.isDeleted, builder: (column) => ColumnFilters(column));

  Expression<bool> recipeTableRefs(
      Expression<bool> Function($$RecipeTableTableFilterComposer f) f) {
    final $$RecipeTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.uuid,
        referencedTable: $db.recipeTable,
        getReferencedColumn: (t) => t.ingredientUuid,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$RecipeTableTableFilterComposer(
              $db: $db,
              $table: $db.recipeTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$IngredientTableTableOrderingComposer
    extends Composer<_$AppDatabase, $IngredientTableTable> {
  $$IngredientTableTableOrderingComposer({
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

  ColumnOrderings<String> get unit => $composableBuilder(
      column: $table.unit, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get currentStock => $composableBuilder(
      column: $table.currentStock,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get costPerUnit => $composableBuilder(
      column: $table.costPerUnit, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isDeleted => $composableBuilder(
      column: $table.isDeleted, builder: (column) => ColumnOrderings(column));
}

class $$IngredientTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $IngredientTableTable> {
  $$IngredientTableTableAnnotationComposer({
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

  GeneratedColumn<String> get unit =>
      $composableBuilder(column: $table.unit, builder: (column) => column);

  GeneratedColumn<double> get currentStock => $composableBuilder(
      column: $table.currentStock, builder: (column) => column);

  GeneratedColumn<double> get costPerUnit => $composableBuilder(
      column: $table.costPerUnit, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<bool> get isDeleted =>
      $composableBuilder(column: $table.isDeleted, builder: (column) => column);

  Expression<T> recipeTableRefs<T extends Object>(
      Expression<T> Function($$RecipeTableTableAnnotationComposer a) f) {
    final $$RecipeTableTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.uuid,
        referencedTable: $db.recipeTable,
        getReferencedColumn: (t) => t.ingredientUuid,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$RecipeTableTableAnnotationComposer(
              $db: $db,
              $table: $db.recipeTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$IngredientTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $IngredientTableTable,
    IngredientTableData,
    $$IngredientTableTableFilterComposer,
    $$IngredientTableTableOrderingComposer,
    $$IngredientTableTableAnnotationComposer,
    $$IngredientTableTableCreateCompanionBuilder,
    $$IngredientTableTableUpdateCompanionBuilder,
    (IngredientTableData, $$IngredientTableTableReferences),
    IngredientTableData,
    PrefetchHooks Function({bool recipeTableRefs})> {
  $$IngredientTableTableTableManager(
      _$AppDatabase db, $IngredientTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$IngredientTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$IngredientTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$IngredientTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> uuid = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String> unit = const Value.absent(),
            Value<double> currentStock = const Value.absent(),
            Value<double> costPerUnit = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<bool> isDeleted = const Value.absent(),
          }) =>
              IngredientTableCompanion(
            id: id,
            uuid: uuid,
            name: name,
            unit: unit,
            currentStock: currentStock,
            costPerUnit: costPerUnit,
            updatedAt: updatedAt,
            isDeleted: isDeleted,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String uuid,
            required String name,
            required String unit,
            Value<double> currentStock = const Value.absent(),
            Value<double> costPerUnit = const Value.absent(),
            required DateTime updatedAt,
            Value<bool> isDeleted = const Value.absent(),
          }) =>
              IngredientTableCompanion.insert(
            id: id,
            uuid: uuid,
            name: name,
            unit: unit,
            currentStock: currentStock,
            costPerUnit: costPerUnit,
            updatedAt: updatedAt,
            isDeleted: isDeleted,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$IngredientTableTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({recipeTableRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (recipeTableRefs) db.recipeTable],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (recipeTableRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable: $$IngredientTableTableReferences
                            ._recipeTableRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$IngredientTableTableReferences(db, table, p0)
                                .recipeTableRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.ingredientUuid == item.uuid),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$IngredientTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $IngredientTableTable,
    IngredientTableData,
    $$IngredientTableTableFilterComposer,
    $$IngredientTableTableOrderingComposer,
    $$IngredientTableTableAnnotationComposer,
    $$IngredientTableTableCreateCompanionBuilder,
    $$IngredientTableTableUpdateCompanionBuilder,
    (IngredientTableData, $$IngredientTableTableReferences),
    IngredientTableData,
    PrefetchHooks Function({bool recipeTableRefs})>;
typedef $$RecipeTableTableCreateCompanionBuilder = RecipeTableCompanion
    Function({
  Value<int> id,
  required String productUuid,
  required String ingredientUuid,
  required double quantityRequired,
});
typedef $$RecipeTableTableUpdateCompanionBuilder = RecipeTableCompanion
    Function({
  Value<int> id,
  Value<String> productUuid,
  Value<String> ingredientUuid,
  Value<double> quantityRequired,
});

final class $$RecipeTableTableReferences
    extends BaseReferences<_$AppDatabase, $RecipeTableTable, RecipeTableData> {
  $$RecipeTableTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $ProductTableTable _productUuidTable(_$AppDatabase db) =>
      db.productTable.createAlias($_aliasNameGenerator(
          db.recipeTable.productUuid, db.productTable.uuid));

  $$ProductTableTableProcessedTableManager? get productUuid {
    if ($_item.productUuid == null) return null;
    final manager = $$ProductTableTableTableManager($_db, $_db.productTable)
        .filter((f) => f.uuid($_item.productUuid!));
    final item = $_typedResult.readTableOrNull(_productUuidTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $IngredientTableTable _ingredientUuidTable(_$AppDatabase db) =>
      db.ingredientTable.createAlias($_aliasNameGenerator(
          db.recipeTable.ingredientUuid, db.ingredientTable.uuid));

  $$IngredientTableTableProcessedTableManager? get ingredientUuid {
    if ($_item.ingredientUuid == null) return null;
    final manager =
        $$IngredientTableTableTableManager($_db, $_db.ingredientTable)
            .filter((f) => f.uuid($_item.ingredientUuid!));
    final item = $_typedResult.readTableOrNull(_ingredientUuidTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$RecipeTableTableFilterComposer
    extends Composer<_$AppDatabase, $RecipeTableTable> {
  $$RecipeTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get quantityRequired => $composableBuilder(
      column: $table.quantityRequired,
      builder: (column) => ColumnFilters(column));

  $$ProductTableTableFilterComposer get productUuid {
    final $$ProductTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.productUuid,
        referencedTable: $db.productTable,
        getReferencedColumn: (t) => t.uuid,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ProductTableTableFilterComposer(
              $db: $db,
              $table: $db.productTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$IngredientTableTableFilterComposer get ingredientUuid {
    final $$IngredientTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.ingredientUuid,
        referencedTable: $db.ingredientTable,
        getReferencedColumn: (t) => t.uuid,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$IngredientTableTableFilterComposer(
              $db: $db,
              $table: $db.ingredientTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$RecipeTableTableOrderingComposer
    extends Composer<_$AppDatabase, $RecipeTableTable> {
  $$RecipeTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get quantityRequired => $composableBuilder(
      column: $table.quantityRequired,
      builder: (column) => ColumnOrderings(column));

  $$ProductTableTableOrderingComposer get productUuid {
    final $$ProductTableTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.productUuid,
        referencedTable: $db.productTable,
        getReferencedColumn: (t) => t.uuid,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ProductTableTableOrderingComposer(
              $db: $db,
              $table: $db.productTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$IngredientTableTableOrderingComposer get ingredientUuid {
    final $$IngredientTableTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.ingredientUuid,
        referencedTable: $db.ingredientTable,
        getReferencedColumn: (t) => t.uuid,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$IngredientTableTableOrderingComposer(
              $db: $db,
              $table: $db.ingredientTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$RecipeTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $RecipeTableTable> {
  $$RecipeTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<double> get quantityRequired => $composableBuilder(
      column: $table.quantityRequired, builder: (column) => column);

  $$ProductTableTableAnnotationComposer get productUuid {
    final $$ProductTableTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.productUuid,
        referencedTable: $db.productTable,
        getReferencedColumn: (t) => t.uuid,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ProductTableTableAnnotationComposer(
              $db: $db,
              $table: $db.productTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$IngredientTableTableAnnotationComposer get ingredientUuid {
    final $$IngredientTableTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.ingredientUuid,
        referencedTable: $db.ingredientTable,
        getReferencedColumn: (t) => t.uuid,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$IngredientTableTableAnnotationComposer(
              $db: $db,
              $table: $db.ingredientTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$RecipeTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $RecipeTableTable,
    RecipeTableData,
    $$RecipeTableTableFilterComposer,
    $$RecipeTableTableOrderingComposer,
    $$RecipeTableTableAnnotationComposer,
    $$RecipeTableTableCreateCompanionBuilder,
    $$RecipeTableTableUpdateCompanionBuilder,
    (RecipeTableData, $$RecipeTableTableReferences),
    RecipeTableData,
    PrefetchHooks Function({bool productUuid, bool ingredientUuid})> {
  $$RecipeTableTableTableManager(_$AppDatabase db, $RecipeTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$RecipeTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$RecipeTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$RecipeTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> productUuid = const Value.absent(),
            Value<String> ingredientUuid = const Value.absent(),
            Value<double> quantityRequired = const Value.absent(),
          }) =>
              RecipeTableCompanion(
            id: id,
            productUuid: productUuid,
            ingredientUuid: ingredientUuid,
            quantityRequired: quantityRequired,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String productUuid,
            required String ingredientUuid,
            required double quantityRequired,
          }) =>
              RecipeTableCompanion.insert(
            id: id,
            productUuid: productUuid,
            ingredientUuid: ingredientUuid,
            quantityRequired: quantityRequired,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$RecipeTableTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: (
              {productUuid = false, ingredientUuid = false}) {
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
                if (productUuid) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.productUuid,
                    referencedTable:
                        $$RecipeTableTableReferences._productUuidTable(db),
                    referencedColumn:
                        $$RecipeTableTableReferences._productUuidTable(db).uuid,
                  ) as T;
                }
                if (ingredientUuid) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.ingredientUuid,
                    referencedTable:
                        $$RecipeTableTableReferences._ingredientUuidTable(db),
                    referencedColumn: $$RecipeTableTableReferences
                        ._ingredientUuidTable(db)
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

typedef $$RecipeTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $RecipeTableTable,
    RecipeTableData,
    $$RecipeTableTableFilterComposer,
    $$RecipeTableTableOrderingComposer,
    $$RecipeTableTableAnnotationComposer,
    $$RecipeTableTableCreateCompanionBuilder,
    $$RecipeTableTableUpdateCompanionBuilder,
    (RecipeTableData, $$RecipeTableTableReferences),
    RecipeTableData,
    PrefetchHooks Function({bool productUuid, bool ingredientUuid})>;
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

class $$CustomerTableTableFilterComposer
    extends Composer<_$AppDatabase, $CustomerTableTable> {
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
}

class $$CustomerTableTableOrderingComposer
    extends Composer<_$AppDatabase, $CustomerTableTable> {
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
    extends Composer<_$AppDatabase, $CustomerTableTable> {
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
}

class $$CustomerTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $CustomerTableTable,
    CustomerTableData,
    $$CustomerTableTableFilterComposer,
    $$CustomerTableTableOrderingComposer,
    $$CustomerTableTableAnnotationComposer,
    $$CustomerTableTableCreateCompanionBuilder,
    $$CustomerTableTableUpdateCompanionBuilder,
    (
      CustomerTableData,
      BaseReferences<_$AppDatabase, $CustomerTableTable, CustomerTableData>
    ),
    CustomerTableData,
    PrefetchHooks Function()> {
  $$CustomerTableTableTableManager(_$AppDatabase db, $CustomerTableTable table)
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
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$CustomerTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $CustomerTableTable,
    CustomerTableData,
    $$CustomerTableTableFilterComposer,
    $$CustomerTableTableOrderingComposer,
    $$CustomerTableTableAnnotationComposer,
    $$CustomerTableTableCreateCompanionBuilder,
    $$CustomerTableTableUpdateCompanionBuilder,
    (
      CustomerTableData,
      BaseReferences<_$AppDatabase, $CustomerTableTable, CustomerTableData>
    ),
    CustomerTableData,
    PrefetchHooks Function()>;
typedef $$OrderTableTableCreateCompanionBuilder = OrderTableCompanion Function({
  Value<int> id,
  required String uuid,
  required String orderNumber,
  Value<String?> shiftUuid,
  Value<String?> customerUuid,
  Value<String?> tenantId,
  Value<String> status,
  Value<String> paymentStatus,
  required DateTime transactionDate,
  required double subtotal,
  required double discountTotal,
  required double taxTotal,
  required double grandTotal,
  required String paymentMethod,
  Value<double?> tenderedAmount,
  Value<double?> changeAmount,
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
  Value<String> status,
  Value<String> paymentStatus,
  Value<DateTime> transactionDate,
  Value<double> subtotal,
  Value<double> discountTotal,
  Value<double> taxTotal,
  Value<double> grandTotal,
  Value<String> paymentMethod,
  Value<double?> tenderedAmount,
  Value<double?> changeAmount,
  Value<bool> isSynced,
  Value<int> version,
  Value<int> syncAttempts,
  Value<bool> isFulfilled,
});

final class $$OrderTableTableReferences
    extends BaseReferences<_$AppDatabase, $OrderTableTable, OrderTableData> {
  $$OrderTableTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$OrderItemTableTable, List<OrderItemTableData>>
      _orderItemTableRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.orderItemTable,
              aliasName: $_aliasNameGenerator(
                  db.orderTable.uuid, db.orderItemTable.orderUuid));

  $$OrderItemTableTableProcessedTableManager get orderItemTableRefs {
    final manager = $$OrderItemTableTableTableManager($_db, $_db.orderItemTable)
        .filter((f) => f.orderUuid.uuid($_item.uuid));

    final cache = $_typedResult.readTableOrNull(_orderItemTableRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$OrderTableTableFilterComposer
    extends Composer<_$AppDatabase, $OrderTableTable> {
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

  ColumnFilters<bool> get isSynced => $composableBuilder(
      column: $table.isSynced, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get version => $composableBuilder(
      column: $table.version, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get syncAttempts => $composableBuilder(
      column: $table.syncAttempts, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isFulfilled => $composableBuilder(
      column: $table.isFulfilled, builder: (column) => ColumnFilters(column));

  Expression<bool> orderItemTableRefs(
      Expression<bool> Function($$OrderItemTableTableFilterComposer f) f) {
    final $$OrderItemTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.uuid,
        referencedTable: $db.orderItemTable,
        getReferencedColumn: (t) => t.orderUuid,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$OrderItemTableTableFilterComposer(
              $db: $db,
              $table: $db.orderItemTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$OrderTableTableOrderingComposer
    extends Composer<_$AppDatabase, $OrderTableTable> {
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
    extends Composer<_$AppDatabase, $OrderTableTable> {
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

  GeneratedColumn<bool> get isSynced =>
      $composableBuilder(column: $table.isSynced, builder: (column) => column);

  GeneratedColumn<int> get version =>
      $composableBuilder(column: $table.version, builder: (column) => column);

  GeneratedColumn<int> get syncAttempts => $composableBuilder(
      column: $table.syncAttempts, builder: (column) => column);

  GeneratedColumn<bool> get isFulfilled => $composableBuilder(
      column: $table.isFulfilled, builder: (column) => column);

  Expression<T> orderItemTableRefs<T extends Object>(
      Expression<T> Function($$OrderItemTableTableAnnotationComposer a) f) {
    final $$OrderItemTableTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.uuid,
        referencedTable: $db.orderItemTable,
        getReferencedColumn: (t) => t.orderUuid,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$OrderItemTableTableAnnotationComposer(
              $db: $db,
              $table: $db.orderItemTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$OrderTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $OrderTableTable,
    OrderTableData,
    $$OrderTableTableFilterComposer,
    $$OrderTableTableOrderingComposer,
    $$OrderTableTableAnnotationComposer,
    $$OrderTableTableCreateCompanionBuilder,
    $$OrderTableTableUpdateCompanionBuilder,
    (OrderTableData, $$OrderTableTableReferences),
    OrderTableData,
    PrefetchHooks Function({bool orderItemTableRefs})> {
  $$OrderTableTableTableManager(_$AppDatabase db, $OrderTableTable table)
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
            Value<String> status = const Value.absent(),
            Value<String> paymentStatus = const Value.absent(),
            Value<DateTime> transactionDate = const Value.absent(),
            Value<double> subtotal = const Value.absent(),
            Value<double> discountTotal = const Value.absent(),
            Value<double> taxTotal = const Value.absent(),
            Value<double> grandTotal = const Value.absent(),
            Value<String> paymentMethod = const Value.absent(),
            Value<double?> tenderedAmount = const Value.absent(),
            Value<double?> changeAmount = const Value.absent(),
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
            Value<String> status = const Value.absent(),
            Value<String> paymentStatus = const Value.absent(),
            required DateTime transactionDate,
            required double subtotal,
            required double discountTotal,
            required double taxTotal,
            required double grandTotal,
            required String paymentMethod,
            Value<double?> tenderedAmount = const Value.absent(),
            Value<double?> changeAmount = const Value.absent(),
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
          prefetchHooksCallback: ({orderItemTableRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (orderItemTableRefs) db.orderItemTable
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (orderItemTableRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable: $$OrderTableTableReferences
                            ._orderItemTableRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$OrderTableTableReferences(db, table, p0)
                                .orderItemTableRefs,
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
    _$AppDatabase,
    $OrderTableTable,
    OrderTableData,
    $$OrderTableTableFilterComposer,
    $$OrderTableTableOrderingComposer,
    $$OrderTableTableAnnotationComposer,
    $$OrderTableTableCreateCompanionBuilder,
    $$OrderTableTableUpdateCompanionBuilder,
    (OrderTableData, $$OrderTableTableReferences),
    OrderTableData,
    PrefetchHooks Function({bool orderItemTableRefs})>;
typedef $$OrderItemTableTableCreateCompanionBuilder = OrderItemTableCompanion
    Function({
  Value<int> id,
  required String orderUuid,
  required String productUuid,
  required String name,
  required double price,
  required double quantity,
  Value<double> paidQty,
  Value<String?> note,
  Value<String?> modifiersJson,
  required double total,
});
typedef $$OrderItemTableTableUpdateCompanionBuilder = OrderItemTableCompanion
    Function({
  Value<int> id,
  Value<String> orderUuid,
  Value<String> productUuid,
  Value<String> name,
  Value<double> price,
  Value<double> quantity,
  Value<double> paidQty,
  Value<String?> note,
  Value<String?> modifiersJson,
  Value<double> total,
});

final class $$OrderItemTableTableReferences extends BaseReferences<
    _$AppDatabase, $OrderItemTableTable, OrderItemTableData> {
  $$OrderItemTableTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $OrderTableTable _orderUuidTable(_$AppDatabase db) =>
      db.orderTable.createAlias($_aliasNameGenerator(
          db.orderItemTable.orderUuid, db.orderTable.uuid));

  $$OrderTableTableProcessedTableManager? get orderUuid {
    if ($_item.orderUuid == null) return null;
    final manager = $$OrderTableTableTableManager($_db, $_db.orderTable)
        .filter((f) => f.uuid($_item.orderUuid!));
    final item = $_typedResult.readTableOrNull(_orderUuidTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$OrderItemTableTableFilterComposer
    extends Composer<_$AppDatabase, $OrderItemTableTable> {
  $$OrderItemTableTableFilterComposer({
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

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get price => $composableBuilder(
      column: $table.price, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get quantity => $composableBuilder(
      column: $table.quantity, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get paidQty => $composableBuilder(
      column: $table.paidQty, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get note => $composableBuilder(
      column: $table.note, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get modifiersJson => $composableBuilder(
      column: $table.modifiersJson, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get total => $composableBuilder(
      column: $table.total, builder: (column) => ColumnFilters(column));

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
}

class $$OrderItemTableTableOrderingComposer
    extends Composer<_$AppDatabase, $OrderItemTableTable> {
  $$OrderItemTableTableOrderingComposer({
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

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get price => $composableBuilder(
      column: $table.price, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get quantity => $composableBuilder(
      column: $table.quantity, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get paidQty => $composableBuilder(
      column: $table.paidQty, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get note => $composableBuilder(
      column: $table.note, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get modifiersJson => $composableBuilder(
      column: $table.modifiersJson,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get total => $composableBuilder(
      column: $table.total, builder: (column) => ColumnOrderings(column));

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
}

class $$OrderItemTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $OrderItemTableTable> {
  $$OrderItemTableTableAnnotationComposer({
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

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<double> get price =>
      $composableBuilder(column: $table.price, builder: (column) => column);

  GeneratedColumn<double> get quantity =>
      $composableBuilder(column: $table.quantity, builder: (column) => column);

  GeneratedColumn<double> get paidQty =>
      $composableBuilder(column: $table.paidQty, builder: (column) => column);

  GeneratedColumn<String> get note =>
      $composableBuilder(column: $table.note, builder: (column) => column);

  GeneratedColumn<String> get modifiersJson => $composableBuilder(
      column: $table.modifiersJson, builder: (column) => column);

  GeneratedColumn<double> get total =>
      $composableBuilder(column: $table.total, builder: (column) => column);

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
}

class $$OrderItemTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $OrderItemTableTable,
    OrderItemTableData,
    $$OrderItemTableTableFilterComposer,
    $$OrderItemTableTableOrderingComposer,
    $$OrderItemTableTableAnnotationComposer,
    $$OrderItemTableTableCreateCompanionBuilder,
    $$OrderItemTableTableUpdateCompanionBuilder,
    (OrderItemTableData, $$OrderItemTableTableReferences),
    OrderItemTableData,
    PrefetchHooks Function({bool orderUuid})> {
  $$OrderItemTableTableTableManager(
      _$AppDatabase db, $OrderItemTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$OrderItemTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$OrderItemTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$OrderItemTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> orderUuid = const Value.absent(),
            Value<String> productUuid = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<double> price = const Value.absent(),
            Value<double> quantity = const Value.absent(),
            Value<double> paidQty = const Value.absent(),
            Value<String?> note = const Value.absent(),
            Value<String?> modifiersJson = const Value.absent(),
            Value<double> total = const Value.absent(),
          }) =>
              OrderItemTableCompanion(
            id: id,
            orderUuid: orderUuid,
            productUuid: productUuid,
            name: name,
            price: price,
            quantity: quantity,
            paidQty: paidQty,
            note: note,
            modifiersJson: modifiersJson,
            total: total,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String orderUuid,
            required String productUuid,
            required String name,
            required double price,
            required double quantity,
            Value<double> paidQty = const Value.absent(),
            Value<String?> note = const Value.absent(),
            Value<String?> modifiersJson = const Value.absent(),
            required double total,
          }) =>
              OrderItemTableCompanion.insert(
            id: id,
            orderUuid: orderUuid,
            productUuid: productUuid,
            name: name,
            price: price,
            quantity: quantity,
            paidQty: paidQty,
            note: note,
            modifiersJson: modifiersJson,
            total: total,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$OrderItemTableTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({orderUuid = false}) {
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
                    referencedTable:
                        $$OrderItemTableTableReferences._orderUuidTable(db),
                    referencedColumn: $$OrderItemTableTableReferences
                        ._orderUuidTable(db)
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

typedef $$OrderItemTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $OrderItemTableTable,
    OrderItemTableData,
    $$OrderItemTableTableFilterComposer,
    $$OrderItemTableTableOrderingComposer,
    $$OrderItemTableTableAnnotationComposer,
    $$OrderItemTableTableCreateCompanionBuilder,
    $$OrderItemTableTableUpdateCompanionBuilder,
    (OrderItemTableData, $$OrderItemTableTableReferences),
    OrderItemTableData,
    PrefetchHooks Function({bool orderUuid})>;
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
    extends Composer<_$AppDatabase, $InventoryLedgerTableTable> {
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
    extends Composer<_$AppDatabase, $InventoryLedgerTableTable> {
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
    extends Composer<_$AppDatabase, $InventoryLedgerTableTable> {
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
    _$AppDatabase,
    $InventoryLedgerTableTable,
    InventoryLedgerTableData,
    $$InventoryLedgerTableTableFilterComposer,
    $$InventoryLedgerTableTableOrderingComposer,
    $$InventoryLedgerTableTableAnnotationComposer,
    $$InventoryLedgerTableTableCreateCompanionBuilder,
    $$InventoryLedgerTableTableUpdateCompanionBuilder,
    (
      InventoryLedgerTableData,
      BaseReferences<_$AppDatabase, $InventoryLedgerTableTable,
          InventoryLedgerTableData>
    ),
    InventoryLedgerTableData,
    PrefetchHooks Function()> {
  $$InventoryLedgerTableTableTableManager(
      _$AppDatabase db, $InventoryLedgerTableTable table)
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
        _$AppDatabase,
        $InventoryLedgerTableTable,
        InventoryLedgerTableData,
        $$InventoryLedgerTableTableFilterComposer,
        $$InventoryLedgerTableTableOrderingComposer,
        $$InventoryLedgerTableTableAnnotationComposer,
        $$InventoryLedgerTableTableCreateCompanionBuilder,
        $$InventoryLedgerTableTableUpdateCompanionBuilder,
        (
          InventoryLedgerTableData,
          BaseReferences<_$AppDatabase, $InventoryLedgerTableTable,
              InventoryLedgerTableData>
        ),
        InventoryLedgerTableData,
        PrefetchHooks Function()>;
typedef $$InventoryCacheTableTableCreateCompanionBuilder
    = InventoryCacheTableCompanion Function({
  Value<int> id,
  required String productUuid,
  required double serverQuantity,
  required DateTime lastSyncedAt,
});
typedef $$InventoryCacheTableTableUpdateCompanionBuilder
    = InventoryCacheTableCompanion Function({
  Value<int> id,
  Value<String> productUuid,
  Value<double> serverQuantity,
  Value<DateTime> lastSyncedAt,
});

class $$InventoryCacheTableTableFilterComposer
    extends Composer<_$AppDatabase, $InventoryCacheTableTable> {
  $$InventoryCacheTableTableFilterComposer({
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

  ColumnFilters<double> get serverQuantity => $composableBuilder(
      column: $table.serverQuantity,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get lastSyncedAt => $composableBuilder(
      column: $table.lastSyncedAt, builder: (column) => ColumnFilters(column));
}

class $$InventoryCacheTableTableOrderingComposer
    extends Composer<_$AppDatabase, $InventoryCacheTableTable> {
  $$InventoryCacheTableTableOrderingComposer({
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

  ColumnOrderings<double> get serverQuantity => $composableBuilder(
      column: $table.serverQuantity,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get lastSyncedAt => $composableBuilder(
      column: $table.lastSyncedAt,
      builder: (column) => ColumnOrderings(column));
}

class $$InventoryCacheTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $InventoryCacheTableTable> {
  $$InventoryCacheTableTableAnnotationComposer({
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

  GeneratedColumn<double> get serverQuantity => $composableBuilder(
      column: $table.serverQuantity, builder: (column) => column);

  GeneratedColumn<DateTime> get lastSyncedAt => $composableBuilder(
      column: $table.lastSyncedAt, builder: (column) => column);
}

class $$InventoryCacheTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $InventoryCacheTableTable,
    InventoryCacheTableData,
    $$InventoryCacheTableTableFilterComposer,
    $$InventoryCacheTableTableOrderingComposer,
    $$InventoryCacheTableTableAnnotationComposer,
    $$InventoryCacheTableTableCreateCompanionBuilder,
    $$InventoryCacheTableTableUpdateCompanionBuilder,
    (
      InventoryCacheTableData,
      BaseReferences<_$AppDatabase, $InventoryCacheTableTable,
          InventoryCacheTableData>
    ),
    InventoryCacheTableData,
    PrefetchHooks Function()> {
  $$InventoryCacheTableTableTableManager(
      _$AppDatabase db, $InventoryCacheTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$InventoryCacheTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$InventoryCacheTableTableOrderingComposer(
                  $db: db, $table: table),
          createComputedFieldComposer: () =>
              $$InventoryCacheTableTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> productUuid = const Value.absent(),
            Value<double> serverQuantity = const Value.absent(),
            Value<DateTime> lastSyncedAt = const Value.absent(),
          }) =>
              InventoryCacheTableCompanion(
            id: id,
            productUuid: productUuid,
            serverQuantity: serverQuantity,
            lastSyncedAt: lastSyncedAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String productUuid,
            required double serverQuantity,
            required DateTime lastSyncedAt,
          }) =>
              InventoryCacheTableCompanion.insert(
            id: id,
            productUuid: productUuid,
            serverQuantity: serverQuantity,
            lastSyncedAt: lastSyncedAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$InventoryCacheTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $InventoryCacheTableTable,
    InventoryCacheTableData,
    $$InventoryCacheTableTableFilterComposer,
    $$InventoryCacheTableTableOrderingComposer,
    $$InventoryCacheTableTableAnnotationComposer,
    $$InventoryCacheTableTableCreateCompanionBuilder,
    $$InventoryCacheTableTableUpdateCompanionBuilder,
    (
      InventoryCacheTableData,
      BaseReferences<_$AppDatabase, $InventoryCacheTableTable,
          InventoryCacheTableData>
    ),
    InventoryCacheTableData,
    PrefetchHooks Function()>;
typedef $$LocalStocksTableTableCreateCompanionBuilder
    = LocalStocksTableCompanion Function({
  Value<int> id,
  required String productUuid,
  required String warehouseUuid,
  Value<double> quantity,
  required DateTime updatedAt,
  Value<int> version,
});
typedef $$LocalStocksTableTableUpdateCompanionBuilder
    = LocalStocksTableCompanion Function({
  Value<int> id,
  Value<String> productUuid,
  Value<String> warehouseUuid,
  Value<double> quantity,
  Value<DateTime> updatedAt,
  Value<int> version,
});

final class $$LocalStocksTableTableReferences extends BaseReferences<
    _$AppDatabase, $LocalStocksTableTable, LocalStocksTableData> {
  $$LocalStocksTableTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $ProductTableTable _productUuidTable(_$AppDatabase db) =>
      db.productTable.createAlias($_aliasNameGenerator(
          db.localStocksTable.productUuid, db.productTable.uuid));

  $$ProductTableTableProcessedTableManager? get productUuid {
    if ($_item.productUuid == null) return null;
    final manager = $$ProductTableTableTableManager($_db, $_db.productTable)
        .filter((f) => f.uuid($_item.productUuid!));
    final item = $_typedResult.readTableOrNull(_productUuidTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$LocalStocksTableTableFilterComposer
    extends Composer<_$AppDatabase, $LocalStocksTableTable> {
  $$LocalStocksTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get warehouseUuid => $composableBuilder(
      column: $table.warehouseUuid, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get quantity => $composableBuilder(
      column: $table.quantity, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get version => $composableBuilder(
      column: $table.version, builder: (column) => ColumnFilters(column));

  $$ProductTableTableFilterComposer get productUuid {
    final $$ProductTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.productUuid,
        referencedTable: $db.productTable,
        getReferencedColumn: (t) => t.uuid,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ProductTableTableFilterComposer(
              $db: $db,
              $table: $db.productTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$LocalStocksTableTableOrderingComposer
    extends Composer<_$AppDatabase, $LocalStocksTableTable> {
  $$LocalStocksTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get warehouseUuid => $composableBuilder(
      column: $table.warehouseUuid,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get quantity => $composableBuilder(
      column: $table.quantity, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get version => $composableBuilder(
      column: $table.version, builder: (column) => ColumnOrderings(column));

  $$ProductTableTableOrderingComposer get productUuid {
    final $$ProductTableTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.productUuid,
        referencedTable: $db.productTable,
        getReferencedColumn: (t) => t.uuid,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ProductTableTableOrderingComposer(
              $db: $db,
              $table: $db.productTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$LocalStocksTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $LocalStocksTableTable> {
  $$LocalStocksTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get warehouseUuid => $composableBuilder(
      column: $table.warehouseUuid, builder: (column) => column);

  GeneratedColumn<double> get quantity =>
      $composableBuilder(column: $table.quantity, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<int> get version =>
      $composableBuilder(column: $table.version, builder: (column) => column);

  $$ProductTableTableAnnotationComposer get productUuid {
    final $$ProductTableTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.productUuid,
        referencedTable: $db.productTable,
        getReferencedColumn: (t) => t.uuid,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ProductTableTableAnnotationComposer(
              $db: $db,
              $table: $db.productTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$LocalStocksTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $LocalStocksTableTable,
    LocalStocksTableData,
    $$LocalStocksTableTableFilterComposer,
    $$LocalStocksTableTableOrderingComposer,
    $$LocalStocksTableTableAnnotationComposer,
    $$LocalStocksTableTableCreateCompanionBuilder,
    $$LocalStocksTableTableUpdateCompanionBuilder,
    (LocalStocksTableData, $$LocalStocksTableTableReferences),
    LocalStocksTableData,
    PrefetchHooks Function({bool productUuid})> {
  $$LocalStocksTableTableTableManager(
      _$AppDatabase db, $LocalStocksTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$LocalStocksTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$LocalStocksTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$LocalStocksTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> productUuid = const Value.absent(),
            Value<String> warehouseUuid = const Value.absent(),
            Value<double> quantity = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<int> version = const Value.absent(),
          }) =>
              LocalStocksTableCompanion(
            id: id,
            productUuid: productUuid,
            warehouseUuid: warehouseUuid,
            quantity: quantity,
            updatedAt: updatedAt,
            version: version,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String productUuid,
            required String warehouseUuid,
            Value<double> quantity = const Value.absent(),
            required DateTime updatedAt,
            Value<int> version = const Value.absent(),
          }) =>
              LocalStocksTableCompanion.insert(
            id: id,
            productUuid: productUuid,
            warehouseUuid: warehouseUuid,
            quantity: quantity,
            updatedAt: updatedAt,
            version: version,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$LocalStocksTableTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({productUuid = false}) {
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
                if (productUuid) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.productUuid,
                    referencedTable:
                        $$LocalStocksTableTableReferences._productUuidTable(db),
                    referencedColumn: $$LocalStocksTableTableReferences
                        ._productUuidTable(db)
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

typedef $$LocalStocksTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $LocalStocksTableTable,
    LocalStocksTableData,
    $$LocalStocksTableTableFilterComposer,
    $$LocalStocksTableTableOrderingComposer,
    $$LocalStocksTableTableAnnotationComposer,
    $$LocalStocksTableTableCreateCompanionBuilder,
    $$LocalStocksTableTableUpdateCompanionBuilder,
    (LocalStocksTableData, $$LocalStocksTableTableReferences),
    LocalStocksTableData,
    PrefetchHooks Function({bool productUuid})>;
typedef $$SupplierTableTableCreateCompanionBuilder = SupplierTableCompanion
    Function({
  Value<int> id,
  required String uuid,
  required String name,
  Value<String?> email,
  Value<String?> phone,
  Value<String?> address,
  required DateTime updatedAt,
});
typedef $$SupplierTableTableUpdateCompanionBuilder = SupplierTableCompanion
    Function({
  Value<int> id,
  Value<String> uuid,
  Value<String> name,
  Value<String?> email,
  Value<String?> phone,
  Value<String?> address,
  Value<DateTime> updatedAt,
});

final class $$SupplierTableTableReferences extends BaseReferences<_$AppDatabase,
    $SupplierTableTable, SupplierTableData> {
  $$SupplierTableTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$ProductSupplierTableTable,
      List<ProductSupplierTableData>> _productSupplierTableRefsTable(
          _$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.productSupplierTable,
          aliasName: $_aliasNameGenerator(
              db.supplierTable.uuid, db.productSupplierTable.supplierUuid));

  $$ProductSupplierTableTableProcessedTableManager
      get productSupplierTableRefs {
    final manager =
        $$ProductSupplierTableTableTableManager($_db, $_db.productSupplierTable)
            .filter((f) => f.supplierUuid.uuid($_item.uuid));

    final cache =
        $_typedResult.readTableOrNull(_productSupplierTableRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$PurchaseOrderTableTable,
      List<PurchaseOrderTableData>> _purchaseOrderTableRefsTable(
          _$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.purchaseOrderTable,
          aliasName: $_aliasNameGenerator(
              db.supplierTable.uuid, db.purchaseOrderTable.supplierUuid));

  $$PurchaseOrderTableTableProcessedTableManager get purchaseOrderTableRefs {
    final manager =
        $$PurchaseOrderTableTableTableManager($_db, $_db.purchaseOrderTable)
            .filter((f) => f.supplierUuid.uuid($_item.uuid));

    final cache =
        $_typedResult.readTableOrNull(_purchaseOrderTableRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$SupplierTableTableFilterComposer
    extends Composer<_$AppDatabase, $SupplierTableTable> {
  $$SupplierTableTableFilterComposer({
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

  ColumnFilters<String> get email => $composableBuilder(
      column: $table.email, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get phone => $composableBuilder(
      column: $table.phone, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get address => $composableBuilder(
      column: $table.address, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  Expression<bool> productSupplierTableRefs(
      Expression<bool> Function($$ProductSupplierTableTableFilterComposer f)
          f) {
    final $$ProductSupplierTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.uuid,
        referencedTable: $db.productSupplierTable,
        getReferencedColumn: (t) => t.supplierUuid,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ProductSupplierTableTableFilterComposer(
              $db: $db,
              $table: $db.productSupplierTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> purchaseOrderTableRefs(
      Expression<bool> Function($$PurchaseOrderTableTableFilterComposer f) f) {
    final $$PurchaseOrderTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.uuid,
        referencedTable: $db.purchaseOrderTable,
        getReferencedColumn: (t) => t.supplierUuid,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PurchaseOrderTableTableFilterComposer(
              $db: $db,
              $table: $db.purchaseOrderTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$SupplierTableTableOrderingComposer
    extends Composer<_$AppDatabase, $SupplierTableTable> {
  $$SupplierTableTableOrderingComposer({
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

  ColumnOrderings<String> get email => $composableBuilder(
      column: $table.email, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get phone => $composableBuilder(
      column: $table.phone, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get address => $composableBuilder(
      column: $table.address, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));
}

class $$SupplierTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $SupplierTableTable> {
  $$SupplierTableTableAnnotationComposer({
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

  GeneratedColumn<String> get email =>
      $composableBuilder(column: $table.email, builder: (column) => column);

  GeneratedColumn<String> get phone =>
      $composableBuilder(column: $table.phone, builder: (column) => column);

  GeneratedColumn<String> get address =>
      $composableBuilder(column: $table.address, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  Expression<T> productSupplierTableRefs<T extends Object>(
      Expression<T> Function($$ProductSupplierTableTableAnnotationComposer a)
          f) {
    final $$ProductSupplierTableTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.uuid,
            referencedTable: $db.productSupplierTable,
            getReferencedColumn: (t) => t.supplierUuid,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$ProductSupplierTableTableAnnotationComposer(
                  $db: $db,
                  $table: $db.productSupplierTable,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }

  Expression<T> purchaseOrderTableRefs<T extends Object>(
      Expression<T> Function($$PurchaseOrderTableTableAnnotationComposer a) f) {
    final $$PurchaseOrderTableTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.uuid,
            referencedTable: $db.purchaseOrderTable,
            getReferencedColumn: (t) => t.supplierUuid,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$PurchaseOrderTableTableAnnotationComposer(
                  $db: $db,
                  $table: $db.purchaseOrderTable,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }
}

class $$SupplierTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $SupplierTableTable,
    SupplierTableData,
    $$SupplierTableTableFilterComposer,
    $$SupplierTableTableOrderingComposer,
    $$SupplierTableTableAnnotationComposer,
    $$SupplierTableTableCreateCompanionBuilder,
    $$SupplierTableTableUpdateCompanionBuilder,
    (SupplierTableData, $$SupplierTableTableReferences),
    SupplierTableData,
    PrefetchHooks Function(
        {bool productSupplierTableRefs, bool purchaseOrderTableRefs})> {
  $$SupplierTableTableTableManager(_$AppDatabase db, $SupplierTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SupplierTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SupplierTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SupplierTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> uuid = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String?> email = const Value.absent(),
            Value<String?> phone = const Value.absent(),
            Value<String?> address = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
          }) =>
              SupplierTableCompanion(
            id: id,
            uuid: uuid,
            name: name,
            email: email,
            phone: phone,
            address: address,
            updatedAt: updatedAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String uuid,
            required String name,
            Value<String?> email = const Value.absent(),
            Value<String?> phone = const Value.absent(),
            Value<String?> address = const Value.absent(),
            required DateTime updatedAt,
          }) =>
              SupplierTableCompanion.insert(
            id: id,
            uuid: uuid,
            name: name,
            email: email,
            phone: phone,
            address: address,
            updatedAt: updatedAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$SupplierTableTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: (
              {productSupplierTableRefs = false,
              purchaseOrderTableRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (productSupplierTableRefs) db.productSupplierTable,
                if (purchaseOrderTableRefs) db.purchaseOrderTable
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (productSupplierTableRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable: $$SupplierTableTableReferences
                            ._productSupplierTableRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$SupplierTableTableReferences(db, table, p0)
                                .productSupplierTableRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.supplierUuid == item.uuid),
                        typedResults: items),
                  if (purchaseOrderTableRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable: $$SupplierTableTableReferences
                            ._purchaseOrderTableRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$SupplierTableTableReferences(db, table, p0)
                                .purchaseOrderTableRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.supplierUuid == item.uuid),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$SupplierTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $SupplierTableTable,
    SupplierTableData,
    $$SupplierTableTableFilterComposer,
    $$SupplierTableTableOrderingComposer,
    $$SupplierTableTableAnnotationComposer,
    $$SupplierTableTableCreateCompanionBuilder,
    $$SupplierTableTableUpdateCompanionBuilder,
    (SupplierTableData, $$SupplierTableTableReferences),
    SupplierTableData,
    PrefetchHooks Function(
        {bool productSupplierTableRefs, bool purchaseOrderTableRefs})>;
typedef $$ProductSupplierTableTableCreateCompanionBuilder
    = ProductSupplierTableCompanion Function({
  Value<int> id,
  required String productUuid,
  required String supplierUuid,
  Value<double> costPrice,
  Value<int> leadTimeDays,
  Value<double> minOrderQty,
});
typedef $$ProductSupplierTableTableUpdateCompanionBuilder
    = ProductSupplierTableCompanion Function({
  Value<int> id,
  Value<String> productUuid,
  Value<String> supplierUuid,
  Value<double> costPrice,
  Value<int> leadTimeDays,
  Value<double> minOrderQty,
});

final class $$ProductSupplierTableTableReferences extends BaseReferences<
    _$AppDatabase, $ProductSupplierTableTable, ProductSupplierTableData> {
  $$ProductSupplierTableTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $ProductTableTable _productUuidTable(_$AppDatabase db) =>
      db.productTable.createAlias($_aliasNameGenerator(
          db.productSupplierTable.productUuid, db.productTable.uuid));

  $$ProductTableTableProcessedTableManager? get productUuid {
    if ($_item.productUuid == null) return null;
    final manager = $$ProductTableTableTableManager($_db, $_db.productTable)
        .filter((f) => f.uuid($_item.productUuid!));
    final item = $_typedResult.readTableOrNull(_productUuidTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $SupplierTableTable _supplierUuidTable(_$AppDatabase db) =>
      db.supplierTable.createAlias($_aliasNameGenerator(
          db.productSupplierTable.supplierUuid, db.supplierTable.uuid));

  $$SupplierTableTableProcessedTableManager? get supplierUuid {
    if ($_item.supplierUuid == null) return null;
    final manager = $$SupplierTableTableTableManager($_db, $_db.supplierTable)
        .filter((f) => f.uuid($_item.supplierUuid!));
    final item = $_typedResult.readTableOrNull(_supplierUuidTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$ProductSupplierTableTableFilterComposer
    extends Composer<_$AppDatabase, $ProductSupplierTableTable> {
  $$ProductSupplierTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get costPrice => $composableBuilder(
      column: $table.costPrice, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get leadTimeDays => $composableBuilder(
      column: $table.leadTimeDays, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get minOrderQty => $composableBuilder(
      column: $table.minOrderQty, builder: (column) => ColumnFilters(column));

  $$ProductTableTableFilterComposer get productUuid {
    final $$ProductTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.productUuid,
        referencedTable: $db.productTable,
        getReferencedColumn: (t) => t.uuid,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ProductTableTableFilterComposer(
              $db: $db,
              $table: $db.productTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$SupplierTableTableFilterComposer get supplierUuid {
    final $$SupplierTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.supplierUuid,
        referencedTable: $db.supplierTable,
        getReferencedColumn: (t) => t.uuid,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$SupplierTableTableFilterComposer(
              $db: $db,
              $table: $db.supplierTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$ProductSupplierTableTableOrderingComposer
    extends Composer<_$AppDatabase, $ProductSupplierTableTable> {
  $$ProductSupplierTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get costPrice => $composableBuilder(
      column: $table.costPrice, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get leadTimeDays => $composableBuilder(
      column: $table.leadTimeDays,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get minOrderQty => $composableBuilder(
      column: $table.minOrderQty, builder: (column) => ColumnOrderings(column));

  $$ProductTableTableOrderingComposer get productUuid {
    final $$ProductTableTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.productUuid,
        referencedTable: $db.productTable,
        getReferencedColumn: (t) => t.uuid,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ProductTableTableOrderingComposer(
              $db: $db,
              $table: $db.productTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$SupplierTableTableOrderingComposer get supplierUuid {
    final $$SupplierTableTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.supplierUuid,
        referencedTable: $db.supplierTable,
        getReferencedColumn: (t) => t.uuid,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$SupplierTableTableOrderingComposer(
              $db: $db,
              $table: $db.supplierTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$ProductSupplierTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $ProductSupplierTableTable> {
  $$ProductSupplierTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<double> get costPrice =>
      $composableBuilder(column: $table.costPrice, builder: (column) => column);

  GeneratedColumn<int> get leadTimeDays => $composableBuilder(
      column: $table.leadTimeDays, builder: (column) => column);

  GeneratedColumn<double> get minOrderQty => $composableBuilder(
      column: $table.minOrderQty, builder: (column) => column);

  $$ProductTableTableAnnotationComposer get productUuid {
    final $$ProductTableTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.productUuid,
        referencedTable: $db.productTable,
        getReferencedColumn: (t) => t.uuid,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ProductTableTableAnnotationComposer(
              $db: $db,
              $table: $db.productTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$SupplierTableTableAnnotationComposer get supplierUuid {
    final $$SupplierTableTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.supplierUuid,
        referencedTable: $db.supplierTable,
        getReferencedColumn: (t) => t.uuid,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$SupplierTableTableAnnotationComposer(
              $db: $db,
              $table: $db.supplierTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$ProductSupplierTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ProductSupplierTableTable,
    ProductSupplierTableData,
    $$ProductSupplierTableTableFilterComposer,
    $$ProductSupplierTableTableOrderingComposer,
    $$ProductSupplierTableTableAnnotationComposer,
    $$ProductSupplierTableTableCreateCompanionBuilder,
    $$ProductSupplierTableTableUpdateCompanionBuilder,
    (ProductSupplierTableData, $$ProductSupplierTableTableReferences),
    ProductSupplierTableData,
    PrefetchHooks Function({bool productUuid, bool supplierUuid})> {
  $$ProductSupplierTableTableTableManager(
      _$AppDatabase db, $ProductSupplierTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ProductSupplierTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ProductSupplierTableTableOrderingComposer(
                  $db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ProductSupplierTableTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> productUuid = const Value.absent(),
            Value<String> supplierUuid = const Value.absent(),
            Value<double> costPrice = const Value.absent(),
            Value<int> leadTimeDays = const Value.absent(),
            Value<double> minOrderQty = const Value.absent(),
          }) =>
              ProductSupplierTableCompanion(
            id: id,
            productUuid: productUuid,
            supplierUuid: supplierUuid,
            costPrice: costPrice,
            leadTimeDays: leadTimeDays,
            minOrderQty: minOrderQty,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String productUuid,
            required String supplierUuid,
            Value<double> costPrice = const Value.absent(),
            Value<int> leadTimeDays = const Value.absent(),
            Value<double> minOrderQty = const Value.absent(),
          }) =>
              ProductSupplierTableCompanion.insert(
            id: id,
            productUuid: productUuid,
            supplierUuid: supplierUuid,
            costPrice: costPrice,
            leadTimeDays: leadTimeDays,
            minOrderQty: minOrderQty,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$ProductSupplierTableTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({productUuid = false, supplierUuid = false}) {
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
                if (productUuid) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.productUuid,
                    referencedTable: $$ProductSupplierTableTableReferences
                        ._productUuidTable(db),
                    referencedColumn: $$ProductSupplierTableTableReferences
                        ._productUuidTable(db)
                        .uuid,
                  ) as T;
                }
                if (supplierUuid) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.supplierUuid,
                    referencedTable: $$ProductSupplierTableTableReferences
                        ._supplierUuidTable(db),
                    referencedColumn: $$ProductSupplierTableTableReferences
                        ._supplierUuidTable(db)
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

typedef $$ProductSupplierTableTableProcessedTableManager
    = ProcessedTableManager<
        _$AppDatabase,
        $ProductSupplierTableTable,
        ProductSupplierTableData,
        $$ProductSupplierTableTableFilterComposer,
        $$ProductSupplierTableTableOrderingComposer,
        $$ProductSupplierTableTableAnnotationComposer,
        $$ProductSupplierTableTableCreateCompanionBuilder,
        $$ProductSupplierTableTableUpdateCompanionBuilder,
        (ProductSupplierTableData, $$ProductSupplierTableTableReferences),
        ProductSupplierTableData,
        PrefetchHooks Function({bool productUuid, bool supplierUuid})>;
typedef $$PurchaseOrderTableTableCreateCompanionBuilder
    = PurchaseOrderTableCompanion Function({
  Value<int> id,
  required String uuid,
  required String supplierUuid,
  required String targetWarehouseUuid,
  Value<String> status,
  Value<String?> referenceNumber,
  Value<String?> notes,
  Value<double> totalCost,
  required DateTime createdAt,
  required DateTime updatedAt,
  Value<bool> isSynced,
});
typedef $$PurchaseOrderTableTableUpdateCompanionBuilder
    = PurchaseOrderTableCompanion Function({
  Value<int> id,
  Value<String> uuid,
  Value<String> supplierUuid,
  Value<String> targetWarehouseUuid,
  Value<String> status,
  Value<String?> referenceNumber,
  Value<String?> notes,
  Value<double> totalCost,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<bool> isSynced,
});

final class $$PurchaseOrderTableTableReferences extends BaseReferences<
    _$AppDatabase, $PurchaseOrderTableTable, PurchaseOrderTableData> {
  $$PurchaseOrderTableTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $SupplierTableTable _supplierUuidTable(_$AppDatabase db) =>
      db.supplierTable.createAlias($_aliasNameGenerator(
          db.purchaseOrderTable.supplierUuid, db.supplierTable.uuid));

  $$SupplierTableTableProcessedTableManager? get supplierUuid {
    if ($_item.supplierUuid == null) return null;
    final manager = $$SupplierTableTableTableManager($_db, $_db.supplierTable)
        .filter((f) => f.uuid($_item.supplierUuid!));
    final item = $_typedResult.readTableOrNull(_supplierUuidTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static MultiTypedResultKey<$PurchaseOrderItemTableTable,
      List<PurchaseOrderItemTableData>> _purchaseOrderItemTableRefsTable(
          _$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.purchaseOrderItemTable,
          aliasName: $_aliasNameGenerator(
              db.purchaseOrderTable.uuid, db.purchaseOrderItemTable.poUuid));

  $$PurchaseOrderItemTableTableProcessedTableManager
      get purchaseOrderItemTableRefs {
    final manager = $$PurchaseOrderItemTableTableTableManager(
            $_db, $_db.purchaseOrderItemTable)
        .filter((f) => f.poUuid.uuid($_item.uuid));

    final cache =
        $_typedResult.readTableOrNull(_purchaseOrderItemTableRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$PurchaseOrderTableTableFilterComposer
    extends Composer<_$AppDatabase, $PurchaseOrderTableTable> {
  $$PurchaseOrderTableTableFilterComposer({
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

  ColumnFilters<String> get targetWarehouseUuid => $composableBuilder(
      column: $table.targetWarehouseUuid,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get referenceNumber => $composableBuilder(
      column: $table.referenceNumber,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get totalCost => $composableBuilder(
      column: $table.totalCost, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isSynced => $composableBuilder(
      column: $table.isSynced, builder: (column) => ColumnFilters(column));

  $$SupplierTableTableFilterComposer get supplierUuid {
    final $$SupplierTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.supplierUuid,
        referencedTable: $db.supplierTable,
        getReferencedColumn: (t) => t.uuid,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$SupplierTableTableFilterComposer(
              $db: $db,
              $table: $db.supplierTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<bool> purchaseOrderItemTableRefs(
      Expression<bool> Function($$PurchaseOrderItemTableTableFilterComposer f)
          f) {
    final $$PurchaseOrderItemTableTableFilterComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.uuid,
            referencedTable: $db.purchaseOrderItemTable,
            getReferencedColumn: (t) => t.poUuid,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$PurchaseOrderItemTableTableFilterComposer(
                  $db: $db,
                  $table: $db.purchaseOrderItemTable,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }
}

class $$PurchaseOrderTableTableOrderingComposer
    extends Composer<_$AppDatabase, $PurchaseOrderTableTable> {
  $$PurchaseOrderTableTableOrderingComposer({
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

  ColumnOrderings<String> get targetWarehouseUuid => $composableBuilder(
      column: $table.targetWarehouseUuid,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get referenceNumber => $composableBuilder(
      column: $table.referenceNumber,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get totalCost => $composableBuilder(
      column: $table.totalCost, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isSynced => $composableBuilder(
      column: $table.isSynced, builder: (column) => ColumnOrderings(column));

  $$SupplierTableTableOrderingComposer get supplierUuid {
    final $$SupplierTableTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.supplierUuid,
        referencedTable: $db.supplierTable,
        getReferencedColumn: (t) => t.uuid,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$SupplierTableTableOrderingComposer(
              $db: $db,
              $table: $db.supplierTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$PurchaseOrderTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $PurchaseOrderTableTable> {
  $$PurchaseOrderTableTableAnnotationComposer({
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

  GeneratedColumn<String> get targetWarehouseUuid => $composableBuilder(
      column: $table.targetWarehouseUuid, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<String> get referenceNumber => $composableBuilder(
      column: $table.referenceNumber, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<double> get totalCost =>
      $composableBuilder(column: $table.totalCost, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<bool> get isSynced =>
      $composableBuilder(column: $table.isSynced, builder: (column) => column);

  $$SupplierTableTableAnnotationComposer get supplierUuid {
    final $$SupplierTableTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.supplierUuid,
        referencedTable: $db.supplierTable,
        getReferencedColumn: (t) => t.uuid,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$SupplierTableTableAnnotationComposer(
              $db: $db,
              $table: $db.supplierTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<T> purchaseOrderItemTableRefs<T extends Object>(
      Expression<T> Function($$PurchaseOrderItemTableTableAnnotationComposer a)
          f) {
    final $$PurchaseOrderItemTableTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.uuid,
            referencedTable: $db.purchaseOrderItemTable,
            getReferencedColumn: (t) => t.poUuid,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$PurchaseOrderItemTableTableAnnotationComposer(
                  $db: $db,
                  $table: $db.purchaseOrderItemTable,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }
}

class $$PurchaseOrderTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $PurchaseOrderTableTable,
    PurchaseOrderTableData,
    $$PurchaseOrderTableTableFilterComposer,
    $$PurchaseOrderTableTableOrderingComposer,
    $$PurchaseOrderTableTableAnnotationComposer,
    $$PurchaseOrderTableTableCreateCompanionBuilder,
    $$PurchaseOrderTableTableUpdateCompanionBuilder,
    (PurchaseOrderTableData, $$PurchaseOrderTableTableReferences),
    PurchaseOrderTableData,
    PrefetchHooks Function(
        {bool supplierUuid, bool purchaseOrderItemTableRefs})> {
  $$PurchaseOrderTableTableTableManager(
      _$AppDatabase db, $PurchaseOrderTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PurchaseOrderTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PurchaseOrderTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PurchaseOrderTableTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> uuid = const Value.absent(),
            Value<String> supplierUuid = const Value.absent(),
            Value<String> targetWarehouseUuid = const Value.absent(),
            Value<String> status = const Value.absent(),
            Value<String?> referenceNumber = const Value.absent(),
            Value<String?> notes = const Value.absent(),
            Value<double> totalCost = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<bool> isSynced = const Value.absent(),
          }) =>
              PurchaseOrderTableCompanion(
            id: id,
            uuid: uuid,
            supplierUuid: supplierUuid,
            targetWarehouseUuid: targetWarehouseUuid,
            status: status,
            referenceNumber: referenceNumber,
            notes: notes,
            totalCost: totalCost,
            createdAt: createdAt,
            updatedAt: updatedAt,
            isSynced: isSynced,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String uuid,
            required String supplierUuid,
            required String targetWarehouseUuid,
            Value<String> status = const Value.absent(),
            Value<String?> referenceNumber = const Value.absent(),
            Value<String?> notes = const Value.absent(),
            Value<double> totalCost = const Value.absent(),
            required DateTime createdAt,
            required DateTime updatedAt,
            Value<bool> isSynced = const Value.absent(),
          }) =>
              PurchaseOrderTableCompanion.insert(
            id: id,
            uuid: uuid,
            supplierUuid: supplierUuid,
            targetWarehouseUuid: targetWarehouseUuid,
            status: status,
            referenceNumber: referenceNumber,
            notes: notes,
            totalCost: totalCost,
            createdAt: createdAt,
            updatedAt: updatedAt,
            isSynced: isSynced,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$PurchaseOrderTableTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: (
              {supplierUuid = false, purchaseOrderItemTableRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (purchaseOrderItemTableRefs) db.purchaseOrderItemTable
              ],
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
                if (supplierUuid) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.supplierUuid,
                    referencedTable: $$PurchaseOrderTableTableReferences
                        ._supplierUuidTable(db),
                    referencedColumn: $$PurchaseOrderTableTableReferences
                        ._supplierUuidTable(db)
                        .uuid,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (purchaseOrderItemTableRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable: $$PurchaseOrderTableTableReferences
                            ._purchaseOrderItemTableRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$PurchaseOrderTableTableReferences(db, table, p0)
                                .purchaseOrderItemTableRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.poUuid == item.uuid),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$PurchaseOrderTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $PurchaseOrderTableTable,
    PurchaseOrderTableData,
    $$PurchaseOrderTableTableFilterComposer,
    $$PurchaseOrderTableTableOrderingComposer,
    $$PurchaseOrderTableTableAnnotationComposer,
    $$PurchaseOrderTableTableCreateCompanionBuilder,
    $$PurchaseOrderTableTableUpdateCompanionBuilder,
    (PurchaseOrderTableData, $$PurchaseOrderTableTableReferences),
    PurchaseOrderTableData,
    PrefetchHooks Function(
        {bool supplierUuid, bool purchaseOrderItemTableRefs})>;
typedef $$PurchaseOrderItemTableTableCreateCompanionBuilder
    = PurchaseOrderItemTableCompanion Function({
  Value<int> id,
  required String poUuid,
  required String productUuid,
  required double quantityOrdered,
  Value<double> quantityReceived,
  required double unitCost,
});
typedef $$PurchaseOrderItemTableTableUpdateCompanionBuilder
    = PurchaseOrderItemTableCompanion Function({
  Value<int> id,
  Value<String> poUuid,
  Value<String> productUuid,
  Value<double> quantityOrdered,
  Value<double> quantityReceived,
  Value<double> unitCost,
});

final class $$PurchaseOrderItemTableTableReferences extends BaseReferences<
    _$AppDatabase, $PurchaseOrderItemTableTable, PurchaseOrderItemTableData> {
  $$PurchaseOrderItemTableTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $PurchaseOrderTableTable _poUuidTable(_$AppDatabase db) =>
      db.purchaseOrderTable.createAlias($_aliasNameGenerator(
          db.purchaseOrderItemTable.poUuid, db.purchaseOrderTable.uuid));

  $$PurchaseOrderTableTableProcessedTableManager? get poUuid {
    if ($_item.poUuid == null) return null;
    final manager =
        $$PurchaseOrderTableTableTableManager($_db, $_db.purchaseOrderTable)
            .filter((f) => f.uuid($_item.poUuid!));
    final item = $_typedResult.readTableOrNull(_poUuidTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $ProductTableTable _productUuidTable(_$AppDatabase db) =>
      db.productTable.createAlias($_aliasNameGenerator(
          db.purchaseOrderItemTable.productUuid, db.productTable.uuid));

  $$ProductTableTableProcessedTableManager? get productUuid {
    if ($_item.productUuid == null) return null;
    final manager = $$ProductTableTableTableManager($_db, $_db.productTable)
        .filter((f) => f.uuid($_item.productUuid!));
    final item = $_typedResult.readTableOrNull(_productUuidTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$PurchaseOrderItemTableTableFilterComposer
    extends Composer<_$AppDatabase, $PurchaseOrderItemTableTable> {
  $$PurchaseOrderItemTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get quantityOrdered => $composableBuilder(
      column: $table.quantityOrdered,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get quantityReceived => $composableBuilder(
      column: $table.quantityReceived,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get unitCost => $composableBuilder(
      column: $table.unitCost, builder: (column) => ColumnFilters(column));

  $$PurchaseOrderTableTableFilterComposer get poUuid {
    final $$PurchaseOrderTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.poUuid,
        referencedTable: $db.purchaseOrderTable,
        getReferencedColumn: (t) => t.uuid,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PurchaseOrderTableTableFilterComposer(
              $db: $db,
              $table: $db.purchaseOrderTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$ProductTableTableFilterComposer get productUuid {
    final $$ProductTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.productUuid,
        referencedTable: $db.productTable,
        getReferencedColumn: (t) => t.uuid,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ProductTableTableFilterComposer(
              $db: $db,
              $table: $db.productTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$PurchaseOrderItemTableTableOrderingComposer
    extends Composer<_$AppDatabase, $PurchaseOrderItemTableTable> {
  $$PurchaseOrderItemTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get quantityOrdered => $composableBuilder(
      column: $table.quantityOrdered,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get quantityReceived => $composableBuilder(
      column: $table.quantityReceived,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get unitCost => $composableBuilder(
      column: $table.unitCost, builder: (column) => ColumnOrderings(column));

  $$PurchaseOrderTableTableOrderingComposer get poUuid {
    final $$PurchaseOrderTableTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.poUuid,
        referencedTable: $db.purchaseOrderTable,
        getReferencedColumn: (t) => t.uuid,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PurchaseOrderTableTableOrderingComposer(
              $db: $db,
              $table: $db.purchaseOrderTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$ProductTableTableOrderingComposer get productUuid {
    final $$ProductTableTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.productUuid,
        referencedTable: $db.productTable,
        getReferencedColumn: (t) => t.uuid,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ProductTableTableOrderingComposer(
              $db: $db,
              $table: $db.productTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$PurchaseOrderItemTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $PurchaseOrderItemTableTable> {
  $$PurchaseOrderItemTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<double> get quantityOrdered => $composableBuilder(
      column: $table.quantityOrdered, builder: (column) => column);

  GeneratedColumn<double> get quantityReceived => $composableBuilder(
      column: $table.quantityReceived, builder: (column) => column);

  GeneratedColumn<double> get unitCost =>
      $composableBuilder(column: $table.unitCost, builder: (column) => column);

  $$PurchaseOrderTableTableAnnotationComposer get poUuid {
    final $$PurchaseOrderTableTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.poUuid,
            referencedTable: $db.purchaseOrderTable,
            getReferencedColumn: (t) => t.uuid,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$PurchaseOrderTableTableAnnotationComposer(
                  $db: $db,
                  $table: $db.purchaseOrderTable,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return composer;
  }

  $$ProductTableTableAnnotationComposer get productUuid {
    final $$ProductTableTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.productUuid,
        referencedTable: $db.productTable,
        getReferencedColumn: (t) => t.uuid,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ProductTableTableAnnotationComposer(
              $db: $db,
              $table: $db.productTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$PurchaseOrderItemTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $PurchaseOrderItemTableTable,
    PurchaseOrderItemTableData,
    $$PurchaseOrderItemTableTableFilterComposer,
    $$PurchaseOrderItemTableTableOrderingComposer,
    $$PurchaseOrderItemTableTableAnnotationComposer,
    $$PurchaseOrderItemTableTableCreateCompanionBuilder,
    $$PurchaseOrderItemTableTableUpdateCompanionBuilder,
    (PurchaseOrderItemTableData, $$PurchaseOrderItemTableTableReferences),
    PurchaseOrderItemTableData,
    PrefetchHooks Function({bool poUuid, bool productUuid})> {
  $$PurchaseOrderItemTableTableTableManager(
      _$AppDatabase db, $PurchaseOrderItemTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PurchaseOrderItemTableTableFilterComposer(
                  $db: db, $table: table),
          createOrderingComposer: () =>
              $$PurchaseOrderItemTableTableOrderingComposer(
                  $db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PurchaseOrderItemTableTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> poUuid = const Value.absent(),
            Value<String> productUuid = const Value.absent(),
            Value<double> quantityOrdered = const Value.absent(),
            Value<double> quantityReceived = const Value.absent(),
            Value<double> unitCost = const Value.absent(),
          }) =>
              PurchaseOrderItemTableCompanion(
            id: id,
            poUuid: poUuid,
            productUuid: productUuid,
            quantityOrdered: quantityOrdered,
            quantityReceived: quantityReceived,
            unitCost: unitCost,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String poUuid,
            required String productUuid,
            required double quantityOrdered,
            Value<double> quantityReceived = const Value.absent(),
            required double unitCost,
          }) =>
              PurchaseOrderItemTableCompanion.insert(
            id: id,
            poUuid: poUuid,
            productUuid: productUuid,
            quantityOrdered: quantityOrdered,
            quantityReceived: quantityReceived,
            unitCost: unitCost,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$PurchaseOrderItemTableTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({poUuid = false, productUuid = false}) {
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
                if (poUuid) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.poUuid,
                    referencedTable: $$PurchaseOrderItemTableTableReferences
                        ._poUuidTable(db),
                    referencedColumn: $$PurchaseOrderItemTableTableReferences
                        ._poUuidTable(db)
                        .uuid,
                  ) as T;
                }
                if (productUuid) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.productUuid,
                    referencedTable: $$PurchaseOrderItemTableTableReferences
                        ._productUuidTable(db),
                    referencedColumn: $$PurchaseOrderItemTableTableReferences
                        ._productUuidTable(db)
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

typedef $$PurchaseOrderItemTableTableProcessedTableManager
    = ProcessedTableManager<
        _$AppDatabase,
        $PurchaseOrderItemTableTable,
        PurchaseOrderItemTableData,
        $$PurchaseOrderItemTableTableFilterComposer,
        $$PurchaseOrderItemTableTableOrderingComposer,
        $$PurchaseOrderItemTableTableAnnotationComposer,
        $$PurchaseOrderItemTableTableCreateCompanionBuilder,
        $$PurchaseOrderItemTableTableUpdateCompanionBuilder,
        (PurchaseOrderItemTableData, $$PurchaseOrderItemTableTableReferences),
        PurchaseOrderItemTableData,
        PrefetchHooks Function({bool poUuid, bool productUuid})>;
typedef $$ShiftSessionTableTableCreateCompanionBuilder
    = ShiftSessionTableCompanion Function({
  Value<int> id,
  required String uuid,
  required String staffId,
  required String staffName,
  required DateTime startShift,
  Value<DateTime?> endShift,
  required double startCash,
  required double expectedCash,
  required double actualCash,
  required double difference,
  Value<bool> isClosed,
  Value<bool> isSynced,
});
typedef $$ShiftSessionTableTableUpdateCompanionBuilder
    = ShiftSessionTableCompanion Function({
  Value<int> id,
  Value<String> uuid,
  Value<String> staffId,
  Value<String> staffName,
  Value<DateTime> startShift,
  Value<DateTime?> endShift,
  Value<double> startCash,
  Value<double> expectedCash,
  Value<double> actualCash,
  Value<double> difference,
  Value<bool> isClosed,
  Value<bool> isSynced,
});

class $$ShiftSessionTableTableFilterComposer
    extends Composer<_$AppDatabase, $ShiftSessionTableTable> {
  $$ShiftSessionTableTableFilterComposer({
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

  ColumnFilters<String> get staffId => $composableBuilder(
      column: $table.staffId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get staffName => $composableBuilder(
      column: $table.staffName, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get startShift => $composableBuilder(
      column: $table.startShift, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get endShift => $composableBuilder(
      column: $table.endShift, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get startCash => $composableBuilder(
      column: $table.startCash, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get expectedCash => $composableBuilder(
      column: $table.expectedCash, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get actualCash => $composableBuilder(
      column: $table.actualCash, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get difference => $composableBuilder(
      column: $table.difference, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isClosed => $composableBuilder(
      column: $table.isClosed, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isSynced => $composableBuilder(
      column: $table.isSynced, builder: (column) => ColumnFilters(column));
}

class $$ShiftSessionTableTableOrderingComposer
    extends Composer<_$AppDatabase, $ShiftSessionTableTable> {
  $$ShiftSessionTableTableOrderingComposer({
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

  ColumnOrderings<String> get staffId => $composableBuilder(
      column: $table.staffId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get staffName => $composableBuilder(
      column: $table.staffName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get startShift => $composableBuilder(
      column: $table.startShift, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get endShift => $composableBuilder(
      column: $table.endShift, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get startCash => $composableBuilder(
      column: $table.startCash, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get expectedCash => $composableBuilder(
      column: $table.expectedCash,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get actualCash => $composableBuilder(
      column: $table.actualCash, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get difference => $composableBuilder(
      column: $table.difference, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isClosed => $composableBuilder(
      column: $table.isClosed, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isSynced => $composableBuilder(
      column: $table.isSynced, builder: (column) => ColumnOrderings(column));
}

class $$ShiftSessionTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $ShiftSessionTableTable> {
  $$ShiftSessionTableTableAnnotationComposer({
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

  GeneratedColumn<String> get staffId =>
      $composableBuilder(column: $table.staffId, builder: (column) => column);

  GeneratedColumn<String> get staffName =>
      $composableBuilder(column: $table.staffName, builder: (column) => column);

  GeneratedColumn<DateTime> get startShift => $composableBuilder(
      column: $table.startShift, builder: (column) => column);

  GeneratedColumn<DateTime> get endShift =>
      $composableBuilder(column: $table.endShift, builder: (column) => column);

  GeneratedColumn<double> get startCash =>
      $composableBuilder(column: $table.startCash, builder: (column) => column);

  GeneratedColumn<double> get expectedCash => $composableBuilder(
      column: $table.expectedCash, builder: (column) => column);

  GeneratedColumn<double> get actualCash => $composableBuilder(
      column: $table.actualCash, builder: (column) => column);

  GeneratedColumn<double> get difference => $composableBuilder(
      column: $table.difference, builder: (column) => column);

  GeneratedColumn<bool> get isClosed =>
      $composableBuilder(column: $table.isClosed, builder: (column) => column);

  GeneratedColumn<bool> get isSynced =>
      $composableBuilder(column: $table.isSynced, builder: (column) => column);
}

class $$ShiftSessionTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ShiftSessionTableTable,
    ShiftSessionTableData,
    $$ShiftSessionTableTableFilterComposer,
    $$ShiftSessionTableTableOrderingComposer,
    $$ShiftSessionTableTableAnnotationComposer,
    $$ShiftSessionTableTableCreateCompanionBuilder,
    $$ShiftSessionTableTableUpdateCompanionBuilder,
    (
      ShiftSessionTableData,
      BaseReferences<_$AppDatabase, $ShiftSessionTableTable,
          ShiftSessionTableData>
    ),
    ShiftSessionTableData,
    PrefetchHooks Function()> {
  $$ShiftSessionTableTableTableManager(
      _$AppDatabase db, $ShiftSessionTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ShiftSessionTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ShiftSessionTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ShiftSessionTableTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> uuid = const Value.absent(),
            Value<String> staffId = const Value.absent(),
            Value<String> staffName = const Value.absent(),
            Value<DateTime> startShift = const Value.absent(),
            Value<DateTime?> endShift = const Value.absent(),
            Value<double> startCash = const Value.absent(),
            Value<double> expectedCash = const Value.absent(),
            Value<double> actualCash = const Value.absent(),
            Value<double> difference = const Value.absent(),
            Value<bool> isClosed = const Value.absent(),
            Value<bool> isSynced = const Value.absent(),
          }) =>
              ShiftSessionTableCompanion(
            id: id,
            uuid: uuid,
            staffId: staffId,
            staffName: staffName,
            startShift: startShift,
            endShift: endShift,
            startCash: startCash,
            expectedCash: expectedCash,
            actualCash: actualCash,
            difference: difference,
            isClosed: isClosed,
            isSynced: isSynced,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String uuid,
            required String staffId,
            required String staffName,
            required DateTime startShift,
            Value<DateTime?> endShift = const Value.absent(),
            required double startCash,
            required double expectedCash,
            required double actualCash,
            required double difference,
            Value<bool> isClosed = const Value.absent(),
            Value<bool> isSynced = const Value.absent(),
          }) =>
              ShiftSessionTableCompanion.insert(
            id: id,
            uuid: uuid,
            staffId: staffId,
            staffName: staffName,
            startShift: startShift,
            endShift: endShift,
            startCash: startCash,
            expectedCash: expectedCash,
            actualCash: actualCash,
            difference: difference,
            isClosed: isClosed,
            isSynced: isSynced,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$ShiftSessionTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $ShiftSessionTableTable,
    ShiftSessionTableData,
    $$ShiftSessionTableTableFilterComposer,
    $$ShiftSessionTableTableOrderingComposer,
    $$ShiftSessionTableTableAnnotationComposer,
    $$ShiftSessionTableTableCreateCompanionBuilder,
    $$ShiftSessionTableTableUpdateCompanionBuilder,
    (
      ShiftSessionTableData,
      BaseReferences<_$AppDatabase, $ShiftSessionTableTable,
          ShiftSessionTableData>
    ),
    ShiftSessionTableData,
    PrefetchHooks Function()>;
typedef $$SyncQueueTableCreateCompanionBuilder = SyncQueueCompanion Function({
  Value<int> id,
  required String actionType,
  required String payloadJson,
  required String idempotencyKey,
  required DateTime createdAt,
  Value<String> status,
  Value<int> retryCount,
  Value<DateTime?> nextRetryAt,
});
typedef $$SyncQueueTableUpdateCompanionBuilder = SyncQueueCompanion Function({
  Value<int> id,
  Value<String> actionType,
  Value<String> payloadJson,
  Value<String> idempotencyKey,
  Value<DateTime> createdAt,
  Value<String> status,
  Value<int> retryCount,
  Value<DateTime?> nextRetryAt,
});

class $$SyncQueueTableFilterComposer
    extends Composer<_$AppDatabase, $SyncQueueTable> {
  $$SyncQueueTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get actionType => $composableBuilder(
      column: $table.actionType, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get payloadJson => $composableBuilder(
      column: $table.payloadJson, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get idempotencyKey => $composableBuilder(
      column: $table.idempotencyKey,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get retryCount => $composableBuilder(
      column: $table.retryCount, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get nextRetryAt => $composableBuilder(
      column: $table.nextRetryAt, builder: (column) => ColumnFilters(column));
}

class $$SyncQueueTableOrderingComposer
    extends Composer<_$AppDatabase, $SyncQueueTable> {
  $$SyncQueueTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get actionType => $composableBuilder(
      column: $table.actionType, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get payloadJson => $composableBuilder(
      column: $table.payloadJson, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get idempotencyKey => $composableBuilder(
      column: $table.idempotencyKey,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get retryCount => $composableBuilder(
      column: $table.retryCount, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get nextRetryAt => $composableBuilder(
      column: $table.nextRetryAt, builder: (column) => ColumnOrderings(column));
}

class $$SyncQueueTableAnnotationComposer
    extends Composer<_$AppDatabase, $SyncQueueTable> {
  $$SyncQueueTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get actionType => $composableBuilder(
      column: $table.actionType, builder: (column) => column);

  GeneratedColumn<String> get payloadJson => $composableBuilder(
      column: $table.payloadJson, builder: (column) => column);

  GeneratedColumn<String> get idempotencyKey => $composableBuilder(
      column: $table.idempotencyKey, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<int> get retryCount => $composableBuilder(
      column: $table.retryCount, builder: (column) => column);

  GeneratedColumn<DateTime> get nextRetryAt => $composableBuilder(
      column: $table.nextRetryAt, builder: (column) => column);
}

class $$SyncQueueTableTableManager extends RootTableManager<
    _$AppDatabase,
    $SyncQueueTable,
    SyncQueueData,
    $$SyncQueueTableFilterComposer,
    $$SyncQueueTableOrderingComposer,
    $$SyncQueueTableAnnotationComposer,
    $$SyncQueueTableCreateCompanionBuilder,
    $$SyncQueueTableUpdateCompanionBuilder,
    (
      SyncQueueData,
      BaseReferences<_$AppDatabase, $SyncQueueTable, SyncQueueData>
    ),
    SyncQueueData,
    PrefetchHooks Function()> {
  $$SyncQueueTableTableManager(_$AppDatabase db, $SyncQueueTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SyncQueueTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SyncQueueTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SyncQueueTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> actionType = const Value.absent(),
            Value<String> payloadJson = const Value.absent(),
            Value<String> idempotencyKey = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<String> status = const Value.absent(),
            Value<int> retryCount = const Value.absent(),
            Value<DateTime?> nextRetryAt = const Value.absent(),
          }) =>
              SyncQueueCompanion(
            id: id,
            actionType: actionType,
            payloadJson: payloadJson,
            idempotencyKey: idempotencyKey,
            createdAt: createdAt,
            status: status,
            retryCount: retryCount,
            nextRetryAt: nextRetryAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String actionType,
            required String payloadJson,
            required String idempotencyKey,
            required DateTime createdAt,
            Value<String> status = const Value.absent(),
            Value<int> retryCount = const Value.absent(),
            Value<DateTime?> nextRetryAt = const Value.absent(),
          }) =>
              SyncQueueCompanion.insert(
            id: id,
            actionType: actionType,
            payloadJson: payloadJson,
            idempotencyKey: idempotencyKey,
            createdAt: createdAt,
            status: status,
            retryCount: retryCount,
            nextRetryAt: nextRetryAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$SyncQueueTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $SyncQueueTable,
    SyncQueueData,
    $$SyncQueueTableFilterComposer,
    $$SyncQueueTableOrderingComposer,
    $$SyncQueueTableAnnotationComposer,
    $$SyncQueueTableCreateCompanionBuilder,
    $$SyncQueueTableUpdateCompanionBuilder,
    (
      SyncQueueData,
      BaseReferences<_$AppDatabase, $SyncQueueTable, SyncQueueData>
    ),
    SyncQueueData,
    PrefetchHooks Function()>;
typedef $$CashTransactionTableTableCreateCompanionBuilder
    = CashTransactionTableCompanion Function({
  Value<int> id,
  required String uuid,
  Value<String?> shiftUuid,
  required String type,
  required double amount,
  Value<String?> reason,
  required DateTime createdAt,
  Value<bool> isSynced,
});
typedef $$CashTransactionTableTableUpdateCompanionBuilder
    = CashTransactionTableCompanion Function({
  Value<int> id,
  Value<String> uuid,
  Value<String?> shiftUuid,
  Value<String> type,
  Value<double> amount,
  Value<String?> reason,
  Value<DateTime> createdAt,
  Value<bool> isSynced,
});

class $$CashTransactionTableTableFilterComposer
    extends Composer<_$AppDatabase, $CashTransactionTableTable> {
  $$CashTransactionTableTableFilterComposer({
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

  ColumnFilters<String> get shiftUuid => $composableBuilder(
      column: $table.shiftUuid, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get type => $composableBuilder(
      column: $table.type, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get amount => $composableBuilder(
      column: $table.amount, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get reason => $composableBuilder(
      column: $table.reason, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isSynced => $composableBuilder(
      column: $table.isSynced, builder: (column) => ColumnFilters(column));
}

class $$CashTransactionTableTableOrderingComposer
    extends Composer<_$AppDatabase, $CashTransactionTableTable> {
  $$CashTransactionTableTableOrderingComposer({
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

  ColumnOrderings<String> get shiftUuid => $composableBuilder(
      column: $table.shiftUuid, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get type => $composableBuilder(
      column: $table.type, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get amount => $composableBuilder(
      column: $table.amount, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get reason => $composableBuilder(
      column: $table.reason, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isSynced => $composableBuilder(
      column: $table.isSynced, builder: (column) => ColumnOrderings(column));
}

class $$CashTransactionTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $CashTransactionTableTable> {
  $$CashTransactionTableTableAnnotationComposer({
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

  GeneratedColumn<String> get shiftUuid =>
      $composableBuilder(column: $table.shiftUuid, builder: (column) => column);

  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<double> get amount =>
      $composableBuilder(column: $table.amount, builder: (column) => column);

  GeneratedColumn<String> get reason =>
      $composableBuilder(column: $table.reason, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<bool> get isSynced =>
      $composableBuilder(column: $table.isSynced, builder: (column) => column);
}

class $$CashTransactionTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $CashTransactionTableTable,
    CashTransactionTableData,
    $$CashTransactionTableTableFilterComposer,
    $$CashTransactionTableTableOrderingComposer,
    $$CashTransactionTableTableAnnotationComposer,
    $$CashTransactionTableTableCreateCompanionBuilder,
    $$CashTransactionTableTableUpdateCompanionBuilder,
    (
      CashTransactionTableData,
      BaseReferences<_$AppDatabase, $CashTransactionTableTable,
          CashTransactionTableData>
    ),
    CashTransactionTableData,
    PrefetchHooks Function()> {
  $$CashTransactionTableTableTableManager(
      _$AppDatabase db, $CashTransactionTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CashTransactionTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CashTransactionTableTableOrderingComposer(
                  $db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CashTransactionTableTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> uuid = const Value.absent(),
            Value<String?> shiftUuid = const Value.absent(),
            Value<String> type = const Value.absent(),
            Value<double> amount = const Value.absent(),
            Value<String?> reason = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<bool> isSynced = const Value.absent(),
          }) =>
              CashTransactionTableCompanion(
            id: id,
            uuid: uuid,
            shiftUuid: shiftUuid,
            type: type,
            amount: amount,
            reason: reason,
            createdAt: createdAt,
            isSynced: isSynced,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String uuid,
            Value<String?> shiftUuid = const Value.absent(),
            required String type,
            required double amount,
            Value<String?> reason = const Value.absent(),
            required DateTime createdAt,
            Value<bool> isSynced = const Value.absent(),
          }) =>
              CashTransactionTableCompanion.insert(
            id: id,
            uuid: uuid,
            shiftUuid: shiftUuid,
            type: type,
            amount: amount,
            reason: reason,
            createdAt: createdAt,
            isSynced: isSynced,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$CashTransactionTableTableProcessedTableManager
    = ProcessedTableManager<
        _$AppDatabase,
        $CashTransactionTableTable,
        CashTransactionTableData,
        $$CashTransactionTableTableFilterComposer,
        $$CashTransactionTableTableOrderingComposer,
        $$CashTransactionTableTableAnnotationComposer,
        $$CashTransactionTableTableCreateCompanionBuilder,
        $$CashTransactionTableTableUpdateCompanionBuilder,
        (
          CashTransactionTableData,
          BaseReferences<_$AppDatabase, $CashTransactionTableTable,
              CashTransactionTableData>
        ),
        CashTransactionTableData,
        PrefetchHooks Function()>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$TenantConfigTableTableTableManager get tenantConfigTable =>
      $$TenantConfigTableTableTableManager(_db, _db.tenantConfigTable);
  $$CategoryTableTableTableManager get categoryTable =>
      $$CategoryTableTableTableManager(_db, _db.categoryTable);
  $$ProductTableTableTableManager get productTable =>
      $$ProductTableTableTableManager(_db, _db.productTable);
  $$RestaurantTableTableTableManager get restaurantTable =>
      $$RestaurantTableTableTableManager(_db, _db.restaurantTable);
  $$ReservationTableTableTableManager get reservationTable =>
      $$ReservationTableTableTableManager(_db, _db.reservationTable);
  $$EmployeeTableTableTableManager get employeeTable =>
      $$EmployeeTableTableTableManager(_db, _db.employeeTable);
  $$ModifierGroupTableTableTableManager get modifierGroupTable =>
      $$ModifierGroupTableTableTableManager(_db, _db.modifierGroupTable);
  $$ModifierItemTableTableTableManager get modifierItemTable =>
      $$ModifierItemTableTableTableManager(_db, _db.modifierItemTable);
  $$ProductModifierLinkTableTableTableManager get productModifierLinkTable =>
      $$ProductModifierLinkTableTableTableManager(
          _db, _db.productModifierLinkTable);
  $$IngredientTableTableTableManager get ingredientTable =>
      $$IngredientTableTableTableManager(_db, _db.ingredientTable);
  $$RecipeTableTableTableManager get recipeTable =>
      $$RecipeTableTableTableManager(_db, _db.recipeTable);
  $$CustomerTableTableTableManager get customerTable =>
      $$CustomerTableTableTableManager(_db, _db.customerTable);
  $$OrderTableTableTableManager get orderTable =>
      $$OrderTableTableTableManager(_db, _db.orderTable);
  $$OrderItemTableTableTableManager get orderItemTable =>
      $$OrderItemTableTableTableManager(_db, _db.orderItemTable);
  $$InventoryLedgerTableTableTableManager get inventoryLedgerTable =>
      $$InventoryLedgerTableTableTableManager(_db, _db.inventoryLedgerTable);
  $$InventoryCacheTableTableTableManager get inventoryCacheTable =>
      $$InventoryCacheTableTableTableManager(_db, _db.inventoryCacheTable);
  $$LocalStocksTableTableTableManager get localStocksTable =>
      $$LocalStocksTableTableTableManager(_db, _db.localStocksTable);
  $$SupplierTableTableTableManager get supplierTable =>
      $$SupplierTableTableTableManager(_db, _db.supplierTable);
  $$ProductSupplierTableTableTableManager get productSupplierTable =>
      $$ProductSupplierTableTableTableManager(_db, _db.productSupplierTable);
  $$PurchaseOrderTableTableTableManager get purchaseOrderTable =>
      $$PurchaseOrderTableTableTableManager(_db, _db.purchaseOrderTable);
  $$PurchaseOrderItemTableTableTableManager get purchaseOrderItemTable =>
      $$PurchaseOrderItemTableTableTableManager(
          _db, _db.purchaseOrderItemTable);
  $$ShiftSessionTableTableTableManager get shiftSessionTable =>
      $$ShiftSessionTableTableTableManager(_db, _db.shiftSessionTable);
  $$SyncQueueTableTableManager get syncQueue =>
      $$SyncQueueTableTableManager(_db, _db.syncQueue);
  $$CashTransactionTableTableTableManager get cashTransactionTable =>
      $$CashTransactionTableTableTableManager(_db, _db.cashTransactionTable);
}
