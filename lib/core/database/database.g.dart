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
        sku,
        barcode,
        price,
        costPrice,
        categoryId,
        trackStock,
        isService,
        colorHex,
        imageUrl,
        updatedAt,
        isSynced,
        isDeleted
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
    if (data.containsKey('is_deleted')) {
      context.handle(_isDeletedMeta,
          isDeleted.isAcceptableOrUnknown(data['is_deleted']!, _isDeletedMeta));
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
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
      isSynced: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_synced'])!,
      isDeleted: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_deleted'])!,
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
  final DateTime updatedAt;
  final bool isSynced;
  final bool isDeleted;
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
      required this.updatedAt,
      required this.isSynced,
      required this.isDeleted});
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
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['is_synced'] = Variable<bool>(isSynced);
    map['is_deleted'] = Variable<bool>(isDeleted);
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
      updatedAt: Value(updatedAt),
      isSynced: Value(isSynced),
      isDeleted: Value(isDeleted),
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
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      isSynced: serializer.fromJson<bool>(json['isSynced']),
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
      'sku': serializer.toJson<String?>(sku),
      'barcode': serializer.toJson<String?>(barcode),
      'price': serializer.toJson<double>(price),
      'costPrice': serializer.toJson<double?>(costPrice),
      'categoryId': serializer.toJson<String>(categoryId),
      'trackStock': serializer.toJson<bool>(trackStock),
      'isService': serializer.toJson<bool>(isService),
      'colorHex': serializer.toJson<String?>(colorHex),
      'imageUrl': serializer.toJson<String?>(imageUrl),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'isSynced': serializer.toJson<bool>(isSynced),
      'isDeleted': serializer.toJson<bool>(isDeleted),
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
          DateTime? updatedAt,
          bool? isSynced,
          bool? isDeleted}) =>
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
        updatedAt: updatedAt ?? this.updatedAt,
        isSynced: isSynced ?? this.isSynced,
        isDeleted: isDeleted ?? this.isDeleted,
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
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      isSynced: data.isSynced.present ? data.isSynced.value : this.isSynced,
      isDeleted: data.isDeleted.present ? data.isDeleted.value : this.isDeleted,
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
          ..write('updatedAt: $updatedAt, ')
          ..write('isSynced: $isSynced, ')
          ..write('isDeleted: $isDeleted')
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
      updatedAt,
      isSynced,
      isDeleted);
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
          other.updatedAt == this.updatedAt &&
          other.isSynced == this.isSynced &&
          other.isDeleted == this.isDeleted);
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
  final Value<DateTime> updatedAt;
  final Value<bool> isSynced;
  final Value<bool> isDeleted;
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
    this.updatedAt = const Value.absent(),
    this.isSynced = const Value.absent(),
    this.isDeleted = const Value.absent(),
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
    required DateTime updatedAt,
    this.isSynced = const Value.absent(),
    this.isDeleted = const Value.absent(),
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
    Expression<DateTime>? updatedAt,
    Expression<bool>? isSynced,
    Expression<bool>? isDeleted,
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
      if (updatedAt != null) 'updated_at': updatedAt,
      if (isSynced != null) 'is_synced': isSynced,
      if (isDeleted != null) 'is_deleted': isDeleted,
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
      Value<DateTime>? updatedAt,
      Value<bool>? isSynced,
      Value<bool>? isDeleted}) {
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
      updatedAt: updatedAt ?? this.updatedAt,
      isSynced: isSynced ?? this.isSynced,
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
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (isSynced.present) {
      map['is_synced'] = Variable<bool>(isSynced.value);
    }
    if (isDeleted.present) {
      map['is_deleted'] = Variable<bool>(isDeleted.value);
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
          ..write('updatedAt: $updatedAt, ')
          ..write('isSynced: $isSynced, ')
          ..write('isDeleted: $isDeleted')
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
          ..write('isDeleted: $isDeleted')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, uuid, name, phone, email, totalPoints,
      lastVisitAt, updatedAt, isSynced, isDeleted);
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
  static const VerificationMeta _syncAttemptsMeta =
      const VerificationMeta('syncAttempts');
  @override
  late final GeneratedColumn<int> syncAttempts = GeneratedColumn<int>(
      'sync_attempts', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
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
        syncAttempts
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
    if (data.containsKey('sync_attempts')) {
      context.handle(
          _syncAttemptsMeta,
          syncAttempts.isAcceptableOrUnknown(
              data['sync_attempts']!, _syncAttemptsMeta));
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
      syncAttempts: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}sync_attempts'])!,
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
  final int syncAttempts;
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
      required this.syncAttempts});
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
    map['sync_attempts'] = Variable<int>(syncAttempts);
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
      syncAttempts: Value(syncAttempts),
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
      syncAttempts: serializer.fromJson<int>(json['syncAttempts']),
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
      'syncAttempts': serializer.toJson<int>(syncAttempts),
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
          int? syncAttempts}) =>
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
        syncAttempts: syncAttempts ?? this.syncAttempts,
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
      syncAttempts: data.syncAttempts.present
          ? data.syncAttempts.value
          : this.syncAttempts,
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
          ..write('syncAttempts: $syncAttempts')
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
      syncAttempts);
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
          other.syncAttempts == this.syncAttempts);
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
  final Value<int> syncAttempts;
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
    this.syncAttempts = const Value.absent(),
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
    this.syncAttempts = const Value.absent(),
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
    Expression<int>? syncAttempts,
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
      if (syncAttempts != null) 'sync_attempts': syncAttempts,
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
      Value<int>? syncAttempts}) {
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
      syncAttempts: syncAttempts ?? this.syncAttempts,
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
    if (syncAttempts.present) {
      map['sync_attempts'] = Variable<int>(syncAttempts.value);
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
          ..write('syncAttempts: $syncAttempts')
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
  static const VerificationMeta _noteMeta = const VerificationMeta('note');
  @override
  late final GeneratedColumn<String> note = GeneratedColumn<String>(
      'note', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _totalMeta = const VerificationMeta('total');
  @override
  late final GeneratedColumn<double> total = GeneratedColumn<double>(
      'total', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, orderUuid, productUuid, name, price, quantity, note, total];
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
    if (data.containsKey('note')) {
      context.handle(
          _noteMeta, note.isAcceptableOrUnknown(data['note']!, _noteMeta));
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
      note: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}note']),
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
  final String? note;
  final double total;
  const OrderItemTableData(
      {required this.id,
      required this.orderUuid,
      required this.productUuid,
      required this.name,
      required this.price,
      required this.quantity,
      this.note,
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
    if (!nullToAbsent || note != null) {
      map['note'] = Variable<String>(note);
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
      note: note == null && nullToAbsent ? const Value.absent() : Value(note),
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
      note: serializer.fromJson<String?>(json['note']),
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
      'note': serializer.toJson<String?>(note),
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
          Value<String?> note = const Value.absent(),
          double? total}) =>
      OrderItemTableData(
        id: id ?? this.id,
        orderUuid: orderUuid ?? this.orderUuid,
        productUuid: productUuid ?? this.productUuid,
        name: name ?? this.name,
        price: price ?? this.price,
        quantity: quantity ?? this.quantity,
        note: note.present ? note.value : this.note,
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
      note: data.note.present ? data.note.value : this.note,
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
          ..write('note: $note, ')
          ..write('total: $total')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, orderUuid, productUuid, name, price, quantity, note, total);
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
          other.note == this.note &&
          other.total == this.total);
}

class OrderItemTableCompanion extends UpdateCompanion<OrderItemTableData> {
  final Value<int> id;
  final Value<String> orderUuid;
  final Value<String> productUuid;
  final Value<String> name;
  final Value<double> price;
  final Value<double> quantity;
  final Value<String?> note;
  final Value<double> total;
  const OrderItemTableCompanion({
    this.id = const Value.absent(),
    this.orderUuid = const Value.absent(),
    this.productUuid = const Value.absent(),
    this.name = const Value.absent(),
    this.price = const Value.absent(),
    this.quantity = const Value.absent(),
    this.note = const Value.absent(),
    this.total = const Value.absent(),
  });
  OrderItemTableCompanion.insert({
    this.id = const Value.absent(),
    required String orderUuid,
    required String productUuid,
    required String name,
    required double price,
    required double quantity,
    this.note = const Value.absent(),
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
    Expression<String>? note,
    Expression<double>? total,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (orderUuid != null) 'order_uuid': orderUuid,
      if (productUuid != null) 'product_uuid': productUuid,
      if (name != null) 'name': name,
      if (price != null) 'price': price,
      if (quantity != null) 'quantity': quantity,
      if (note != null) 'note': note,
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
      Value<String?>? note,
      Value<double>? total}) {
    return OrderItemTableCompanion(
      id: id ?? this.id,
      orderUuid: orderUuid ?? this.orderUuid,
      productUuid: productUuid ?? this.productUuid,
      name: name ?? this.name,
      price: price ?? this.price,
      quantity: quantity ?? this.quantity,
      note: note ?? this.note,
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
    if (note.present) {
      map['note'] = Variable<String>(note.value);
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
          ..write('note: $note, ')
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
  static const VerificationMeta _retryCountMeta =
      const VerificationMeta('retryCount');
  @override
  late final GeneratedColumn<int> retryCount = GeneratedColumn<int>(
      'retry_count', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  @override
  List<GeneratedColumn> get $columns =>
      [id, actionType, payloadJson, idempotencyKey, createdAt, retryCount];
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
    if (data.containsKey('retry_count')) {
      context.handle(
          _retryCountMeta,
          retryCount.isAcceptableOrUnknown(
              data['retry_count']!, _retryCountMeta));
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
      retryCount: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}retry_count'])!,
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
  final int retryCount;
  const SyncQueueData(
      {required this.id,
      required this.actionType,
      required this.payloadJson,
      required this.idempotencyKey,
      required this.createdAt,
      required this.retryCount});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['action_type'] = Variable<String>(actionType);
    map['payload_json'] = Variable<String>(payloadJson);
    map['idempotency_key'] = Variable<String>(idempotencyKey);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['retry_count'] = Variable<int>(retryCount);
    return map;
  }

  SyncQueueCompanion toCompanion(bool nullToAbsent) {
    return SyncQueueCompanion(
      id: Value(id),
      actionType: Value(actionType),
      payloadJson: Value(payloadJson),
      idempotencyKey: Value(idempotencyKey),
      createdAt: Value(createdAt),
      retryCount: Value(retryCount),
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
      retryCount: serializer.fromJson<int>(json['retryCount']),
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
      'retryCount': serializer.toJson<int>(retryCount),
    };
  }

  SyncQueueData copyWith(
          {int? id,
          String? actionType,
          String? payloadJson,
          String? idempotencyKey,
          DateTime? createdAt,
          int? retryCount}) =>
      SyncQueueData(
        id: id ?? this.id,
        actionType: actionType ?? this.actionType,
        payloadJson: payloadJson ?? this.payloadJson,
        idempotencyKey: idempotencyKey ?? this.idempotencyKey,
        createdAt: createdAt ?? this.createdAt,
        retryCount: retryCount ?? this.retryCount,
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
      retryCount:
          data.retryCount.present ? data.retryCount.value : this.retryCount,
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
          ..write('retryCount: $retryCount')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, actionType, payloadJson, idempotencyKey, createdAt, retryCount);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SyncQueueData &&
          other.id == this.id &&
          other.actionType == this.actionType &&
          other.payloadJson == this.payloadJson &&
          other.idempotencyKey == this.idempotencyKey &&
          other.createdAt == this.createdAt &&
          other.retryCount == this.retryCount);
}

class SyncQueueCompanion extends UpdateCompanion<SyncQueueData> {
  final Value<int> id;
  final Value<String> actionType;
  final Value<String> payloadJson;
  final Value<String> idempotencyKey;
  final Value<DateTime> createdAt;
  final Value<int> retryCount;
  const SyncQueueCompanion({
    this.id = const Value.absent(),
    this.actionType = const Value.absent(),
    this.payloadJson = const Value.absent(),
    this.idempotencyKey = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.retryCount = const Value.absent(),
  });
  SyncQueueCompanion.insert({
    this.id = const Value.absent(),
    required String actionType,
    required String payloadJson,
    required String idempotencyKey,
    required DateTime createdAt,
    this.retryCount = const Value.absent(),
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
    Expression<int>? retryCount,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (actionType != null) 'action_type': actionType,
      if (payloadJson != null) 'payload_json': payloadJson,
      if (idempotencyKey != null) 'idempotency_key': idempotencyKey,
      if (createdAt != null) 'created_at': createdAt,
      if (retryCount != null) 'retry_count': retryCount,
    });
  }

  SyncQueueCompanion copyWith(
      {Value<int>? id,
      Value<String>? actionType,
      Value<String>? payloadJson,
      Value<String>? idempotencyKey,
      Value<DateTime>? createdAt,
      Value<int>? retryCount}) {
    return SyncQueueCompanion(
      id: id ?? this.id,
      actionType: actionType ?? this.actionType,
      payloadJson: payloadJson ?? this.payloadJson,
      idempotencyKey: idempotencyKey ?? this.idempotencyKey,
      createdAt: createdAt ?? this.createdAt,
      retryCount: retryCount ?? this.retryCount,
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
    if (retryCount.present) {
      map['retry_count'] = Variable<int>(retryCount.value);
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
          ..write('retryCount: $retryCount')
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

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $TenantConfigTableTable tenantConfigTable =
      $TenantConfigTableTable(this);
  late final $ProductTableTable productTable = $ProductTableTable(this);
  late final $CustomerTableTable customerTable = $CustomerTableTable(this);
  late final $OrderTableTable orderTable = $OrderTableTable(this);
  late final $OrderItemTableTable orderItemTable = $OrderItemTableTable(this);
  late final $InventoryLedgerTableTable inventoryLedgerTable =
      $InventoryLedgerTableTable(this);
  late final $InventoryCacheTableTable inventoryCacheTable =
      $InventoryCacheTableTable(this);
  late final $ShiftSessionTableTable shiftSessionTable =
      $ShiftSessionTableTable(this);
  late final $SyncQueueTable syncQueue = $SyncQueueTable(this);
  late final $EmployeeTableTable employeeTable = $EmployeeTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        tenantConfigTable,
        productTable,
        customerTable,
        orderTable,
        orderItemTable,
        inventoryLedgerTable,
        inventoryCacheTable,
        shiftSessionTable,
        syncQueue,
        employeeTable
      ];
  @override
  StreamQueryUpdateRules get streamUpdateRules => const StreamQueryUpdateRules(
        [
          WritePropagation(
            on: TableUpdateQuery.onTableName('order_table',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('order_item_table', kind: UpdateKind.delete),
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
  required DateTime updatedAt,
  Value<bool> isSynced,
  Value<bool> isDeleted,
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
  Value<DateTime> updatedAt,
  Value<bool> isSynced,
  Value<bool> isDeleted,
});

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

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isSynced => $composableBuilder(
      column: $table.isSynced, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isDeleted => $composableBuilder(
      column: $table.isDeleted, builder: (column) => ColumnFilters(column));
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

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isSynced => $composableBuilder(
      column: $table.isSynced, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isDeleted => $composableBuilder(
      column: $table.isDeleted, builder: (column) => ColumnOrderings(column));
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

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<bool> get isSynced =>
      $composableBuilder(column: $table.isSynced, builder: (column) => column);

  GeneratedColumn<bool> get isDeleted =>
      $composableBuilder(column: $table.isDeleted, builder: (column) => column);
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
    (
      ProductTableData,
      BaseReferences<_$AppDatabase, $ProductTableTable, ProductTableData>
    ),
    ProductTableData,
    PrefetchHooks Function()> {
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
            Value<DateTime> updatedAt = const Value.absent(),
            Value<bool> isSynced = const Value.absent(),
            Value<bool> isDeleted = const Value.absent(),
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
            updatedAt: updatedAt,
            isSynced: isSynced,
            isDeleted: isDeleted,
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
            required DateTime updatedAt,
            Value<bool> isSynced = const Value.absent(),
            Value<bool> isDeleted = const Value.absent(),
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
            updatedAt: updatedAt,
            isSynced: isSynced,
            isDeleted: isDeleted,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
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
    (
      ProductTableData,
      BaseReferences<_$AppDatabase, $ProductTableTable, ProductTableData>
    ),
    ProductTableData,
    PrefetchHooks Function()>;
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
  Value<int> syncAttempts,
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
  Value<int> syncAttempts,
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
        .filter(
            (f) => f.orderUuid.uuid.sqlEquals($_itemColumn<String>('uuid')!));

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

  ColumnFilters<int> get syncAttempts => $composableBuilder(
      column: $table.syncAttempts, builder: (column) => ColumnFilters(column));

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

  ColumnOrderings<int> get syncAttempts => $composableBuilder(
      column: $table.syncAttempts,
      builder: (column) => ColumnOrderings(column));
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

  GeneratedColumn<int> get syncAttempts => $composableBuilder(
      column: $table.syncAttempts, builder: (column) => column);

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
            Value<int> syncAttempts = const Value.absent(),
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
            syncAttempts: syncAttempts,
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
            Value<int> syncAttempts = const Value.absent(),
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
            syncAttempts: syncAttempts,
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
                    await $_getPrefetchedData<OrderTableData, $OrderTableTable,
                            OrderItemTableData>(
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
  Value<String?> note,
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
  Value<String?> note,
  Value<double> total,
});

final class $$OrderItemTableTableReferences extends BaseReferences<
    _$AppDatabase, $OrderItemTableTable, OrderItemTableData> {
  $$OrderItemTableTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $OrderTableTable _orderUuidTable(_$AppDatabase db) =>
      db.orderTable.createAlias($_aliasNameGenerator(
          db.orderItemTable.orderUuid, db.orderTable.uuid));

  $$OrderTableTableProcessedTableManager get orderUuid {
    final $_column = $_itemColumn<String>('order_uuid')!;

    final manager = $$OrderTableTableTableManager($_db, $_db.orderTable)
        .filter((f) => f.uuid.sqlEquals($_column));
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

  ColumnFilters<String> get note => $composableBuilder(
      column: $table.note, builder: (column) => ColumnFilters(column));

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

  ColumnOrderings<String> get note => $composableBuilder(
      column: $table.note, builder: (column) => ColumnOrderings(column));

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

  GeneratedColumn<String> get note =>
      $composableBuilder(column: $table.note, builder: (column) => column);

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
            Value<String?> note = const Value.absent(),
            Value<double> total = const Value.absent(),
          }) =>
              OrderItemTableCompanion(
            id: id,
            orderUuid: orderUuid,
            productUuid: productUuid,
            name: name,
            price: price,
            quantity: quantity,
            note: note,
            total: total,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String orderUuid,
            required String productUuid,
            required String name,
            required double price,
            required double quantity,
            Value<String?> note = const Value.absent(),
            required double total,
          }) =>
              OrderItemTableCompanion.insert(
            id: id,
            orderUuid: orderUuid,
            productUuid: productUuid,
            name: name,
            price: price,
            quantity: quantity,
            note: note,
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
  Value<int> retryCount,
});
typedef $$SyncQueueTableUpdateCompanionBuilder = SyncQueueCompanion Function({
  Value<int> id,
  Value<String> actionType,
  Value<String> payloadJson,
  Value<String> idempotencyKey,
  Value<DateTime> createdAt,
  Value<int> retryCount,
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

  ColumnFilters<int> get retryCount => $composableBuilder(
      column: $table.retryCount, builder: (column) => ColumnFilters(column));
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

  ColumnOrderings<int> get retryCount => $composableBuilder(
      column: $table.retryCount, builder: (column) => ColumnOrderings(column));
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

  GeneratedColumn<int> get retryCount => $composableBuilder(
      column: $table.retryCount, builder: (column) => column);
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
            Value<int> retryCount = const Value.absent(),
          }) =>
              SyncQueueCompanion(
            id: id,
            actionType: actionType,
            payloadJson: payloadJson,
            idempotencyKey: idempotencyKey,
            createdAt: createdAt,
            retryCount: retryCount,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String actionType,
            required String payloadJson,
            required String idempotencyKey,
            required DateTime createdAt,
            Value<int> retryCount = const Value.absent(),
          }) =>
              SyncQueueCompanion.insert(
            id: id,
            actionType: actionType,
            payloadJson: payloadJson,
            idempotencyKey: idempotencyKey,
            createdAt: createdAt,
            retryCount: retryCount,
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

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$TenantConfigTableTableTableManager get tenantConfigTable =>
      $$TenantConfigTableTableTableManager(_db, _db.tenantConfigTable);
  $$ProductTableTableTableManager get productTable =>
      $$ProductTableTableTableManager(_db, _db.productTable);
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
  $$ShiftSessionTableTableTableManager get shiftSessionTable =>
      $$ShiftSessionTableTableTableManager(_db, _db.shiftSessionTable);
  $$SyncQueueTableTableManager get syncQueue =>
      $$SyncQueueTableTableManager(_db, _db.syncQueue);
  $$EmployeeTableTableTableManager get employeeTable =>
      $$EmployeeTableTableTableManager(_db, _db.employeeTable);
}
