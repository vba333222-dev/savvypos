import 'dart:convert';
import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';
import 'package:savvy_pos/core/database/database.dart';
import 'package:savvy_pos/features/notification/domain/entities/staff_alert_entities.dart';
import 'package:savvy_pos/features/notification/domain/repositories/i_staff_alert_repository.dart';
import 'package:uuid/uuid.dart';

@LazySingleton(as: IStaffAlertRepository)
class StaffAlertRepositoryImpl implements IStaffAlertRepository {
  final AppDatabase _db;
  final _uuid = const Uuid();
  
  StaffAlertRepositoryImpl(this._db);
  
  // ===================================
  // ALERT CRUD
  // ===================================
  
  @override
  Future<StaffAlert> createAlert({
    required AlertType type,
    required AlertPriority priority,
    required String title,
    required String message,
    List<String>? targetRoles,
    List<String>? targetUserUuids,
    bool broadcastToAll = true,
    String? relatedOrderUuid,
    String? relatedTableUuid,
    String? relatedCustomerUuid,
    String? actionLabel,
    String? actionRoute,
    Duration? expiresIn,
    bool playSound = true,
    bool vibrate = true,
  }) async {
    final uuid = _uuid.v4();
    final now = DateTime.now();
    final expiresAt = expiresIn != null ? now.add(expiresIn) : null;
    
    await _db.into(_db.staffAlertTable).insert(
      StaffAlertTableCompanion(
        uuid: Value(uuid),
        type: Value(type.name),
        priority: Value(priority.name),
        title: Value(title),
        message: Value(message),
        status: Value(AlertStatus.active.name),
        targetRolesJson: Value(jsonEncode(targetRoles ?? [])),
        targetUserUuidsJson: Value(jsonEncode(targetUserUuids ?? [])),
        broadcastToAll: Value(broadcastToAll),
        relatedOrderUuid: Value(relatedOrderUuid),
        relatedTableUuid: Value(relatedTableUuid),
        relatedCustomerUuid: Value(relatedCustomerUuid),
        actionLabel: Value(actionLabel),
        actionRoute: Value(actionRoute),
        createdAt: Value(now),
        expiresAt: Value(expiresAt),
        playSound: Value(playSound),
        vibrate: Value(vibrate),
      )
    );
    
    return StaffAlert(
      uuid: uuid,
      type: type,
      priority: priority,
      title: title,
      message: message,
      status: AlertStatus.active,
      targetRoles: targetRoles ?? [],
      targetUserUuids: targetUserUuids ?? [],
      broadcastToAll: broadcastToAll,
      relatedOrderUuid: relatedOrderUuid,
      relatedTableUuid: relatedTableUuid,
      relatedCustomerUuid: relatedCustomerUuid,
      actionLabel: actionLabel,
      actionRoute: actionRoute,
      createdAt: now,
      expiresAt: expiresAt,
      playSound: playSound,
      vibrate: vibrate,
    );
  }
  
  @override
  Future<List<StaffAlert>> getActiveAlerts() async {
    final now = DateTime.now();
    
    final rows = await (_db.select(_db.staffAlertTable)
      ..where((t) => t.status.equals(AlertStatus.active.name))
      ..where((t) => t.expiresAt.isNull() | t.expiresAt.isBiggerThanValue(now))
      ..orderBy([(t) => OrderingTerm.desc(t.createdAt)]))
      .get();
      
    // TODO: Filter by target user/role (requires current user context)
    // For now returning all active
    
    return rows.map(_mapToAlert).toList();
  }
  
  @override
  Future<List<StaffAlert>> getAllAlerts({
    AlertType? type,
    AlertPriority? priority,
    AlertStatus? status,
    DateTime? since,
    int? limit,
  }) async {
    final query = _db.select(_db.staffAlertTable);
    
    if (type != null) query.where((t) => t.type.equals(type.name));
    if (priority != null) query.where((t) => t.priority.equals(priority.name));
    if (status != null) query.where((t) => t.status.equals(status.name));
    if (since != null) query.where((t) => t.createdAt.isBiggerThanValue(since));
    
    query.orderBy([(t) => OrderingTerm.desc(t.createdAt)]);
    if (limit != null) query.limit(limit);
    
    final rows = await query.get();
    return rows.map(_mapToAlert).toList();
  }
  
  @override
  Future<StaffAlert?> getAlert(String uuid) async {
    final row = await (_db.select(_db.staffAlertTable)
      ..where((t) => t.uuid.equals(uuid)))
      .getSingleOrNull();
      
    if (row == null) return null;
    return _mapToAlert(row);
  }
  
  // ===================================
  // STATUS MANAGEMENT
  // ===================================
  
  @override
  Future<void> acknowledgeAlert(String uuid, String userUuid) async {
    await (_db.update(_db.staffAlertTable)
      ..where((t) => t.uuid.equals(uuid)))
      .write(StaffAlertTableCompanion(
        status: Value(AlertStatus.acknowledged.name),
        acknowledgedAt: Value(DateTime.now()),
        acknowledgedByUuid: Value(userUuid),
      ));
  }
  
  @override
  Future<void> resolveAlert(String uuid, String userUuid) async {
    await (_db.update(_db.staffAlertTable)
      ..where((t) => t.uuid.equals(uuid)))
      .write(StaffAlertTableCompanion(
        status: Value(AlertStatus.resolved.name),
        resolvedAt: Value(DateTime.now()),
        resolvedByUuid: Value(userUuid),
      ));
  }
  
  @override
  Future<void> dismissAlert(String uuid) async {
    // Dismissing usually just sets it to acknowledged state implicitly or separate state
    // Let's assume we just mark it as resolved or acknowledged if not already
    await (_db.update(_db.staffAlertTable)
      ..where((t) => t.uuid.equals(uuid)))
      .write(StaffAlertTableCompanion(
        status: Value(AlertStatus.resolved.name), // Treat dismiss as resolve for UI
        resolvedAt: Value(DateTime.now()),
      ));
  }
  
  @override
  Future<int> expireOldAlerts() async {
    final now = DateTime.now();
    return (_db.update(_db.staffAlertTable)
      ..where((t) => t.status.equals(AlertStatus.active.name))
      ..where((t) => t.expiresAt.isSmallerThanValue(now)))
      .write(StaffAlertTableCompanion(
        status: Value(AlertStatus.expired.name),
      ));
  }
  
  // ===================================
  // STREAMS
  // ===================================
  
  @override
  Stream<StaffAlert> watchNewAlerts() {
    // Watch for latest active alert
    return (_db.select(_db.staffAlertTable)
      ..where((t) => t.status.equals(AlertStatus.active.name))
      ..orderBy([(t) => OrderingTerm.desc(t.createdAt)])
      ..limit(1))
      .watchSingle()
      .map(_mapToAlert);
  }
  
  @override
  Stream<int> watchActiveAlertCount() {
    final now = DateTime.now();
    final count = _db.staffAlertTable.uuid.count();
    
    return (_db.selectOnly(_db.staffAlertTable)
      ..addColumns([count])
      ..where(_db.staffAlertTable.status.equals(AlertStatus.active.name))
      ..where(_db.staffAlertTable.expiresAt.isNull() | _db.staffAlertTable.expiresAt.isBiggerThanValue(now)))
      .watch()
      .map((rows) => rows.isEmpty ? 0 : (rows.first.read(count) ?? 0));
  }
  
  // ===================================
  // QUICK ALERTS
  // ===================================
  
  @override
  Future<StaffAlert> sendTableReadyAlert(String tableUuid, String tableName) {
    return createAlert(
      type: AlertType.tableReady,
      priority: AlertPriority.medium,
      title: 'Table Ready',
      message: 'Table $tableName is now available for seating.',
      relatedTableUuid: tableUuid,
      expiresIn: const Duration(minutes: 15),
    );
  }
  
  @override
  Future<StaffAlert> sendOrderReadyAlert(String orderUuid, String orderNumber) {
    return createAlert(
      type: AlertType.orderReady,
      priority: AlertPriority.high,
      title: 'Order Ready',
      message: 'Order #$orderNumber is ready for pickup.',
      relatedOrderUuid: orderUuid,
      expiresIn: const Duration(minutes: 30),
    );
  }
  
  @override
  Future<StaffAlert> sendCustomerAssistanceAlert(String tableUuid, String tableName, String message) {
    return createAlert(
      type: AlertType.customerRequest,
      priority: AlertPriority.high,
      title: 'Assistance Needed',
      message: 'Table $tableName: $message',
      relatedTableUuid: tableUuid,
      actionLabel: 'Go to Table',
      expiresIn: const Duration(minutes: 10),
    );
  }
  
  @override
  List<AlertTemplate> getAlertTemplates() {
    return const [
      AlertTemplate(
        id: 'kitchen_delay',
        name: 'Kitchen Delay',
        type: AlertType.kitchenAlert,
        priority: AlertPriority.medium,
        messageTemplate: 'Kitchen is experiencing delays (approx 15 mins).',
      ),
      AlertTemplate(
        id: '86_item',
        name: 'Item 86\'d',
        type: AlertType.lowStock,
        priority: AlertPriority.high,
        messageTemplate: 'Item [NAME] is now out of stock.',
      ),
    ];
  }
  
  // ===================================
  // MAPPERS
  // ===================================
  
  StaffAlert _mapToAlert(StaffAlertTableData row) {
    return StaffAlert(
      uuid: row.uuid,
      type: AlertType.values.firstWhere((e) => e.name == row.type),
      priority: AlertPriority.values.firstWhere((e) => e.name == row.priority),
      title: row.title,
      message: row.message,
      status: AlertStatus.values.firstWhere((e) => e.name == row.status),
      targetRoles: List<String>.from(jsonDecode(row.targetRolesJson)),
      targetUserUuids: List<String>.from(jsonDecode(row.targetUserUuidsJson)),
      broadcastToAll: row.broadcastToAll,
      relatedOrderUuid: row.relatedOrderUuid,
      relatedTableUuid: row.relatedTableUuid,
      relatedCustomerUuid: row.relatedCustomerUuid,
      actionLabel: row.actionLabel,
      actionRoute: row.actionRoute,
      createdAt: row.createdAt,
      expiresAt: row.expiresAt,
      acknowledgedAt: row.acknowledgedAt,
      acknowledgedByUuid: row.acknowledgedByUuid,
      resolvedAt: row.resolvedAt,
      resolvedByUuid: row.resolvedByUuid,
      playSound: row.playSound,
      vibrate: row.vibrate,
    );
  }
}
