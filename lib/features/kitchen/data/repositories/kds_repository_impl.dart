import 'dart:convert';
import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';
import 'package:savvy_pos/core/database/database.dart';
import 'package:savvy_pos/features/kitchen/domain/entities/kds_entities.dart';
import 'package:savvy_pos/features/kitchen/domain/repositories/i_kds_repository.dart';
import 'package:uuid/uuid.dart';

@LazySingleton(as: IKDSRepository)
class KDSRepositoryImpl implements IKDSRepository {
  final AppDatabase _db;
  final _uuid = const Uuid();
  
  KDSRepositoryImpl(this._db);
  
  // ===================================
  // TICKET MANAGEMENT
  // ===================================
  
  @override
  Future<KDSTicket> createTicket({
    required String orderUuid,
    required String orderNumber,
    required List<KDSItem> items,
    String? tableUuid,
    String? tableName,
    String? serverName,
    String? note,
  }) async {
    final uuid = _uuid.v4();
    final now = DateTime.now();
    
    // Calculate target time (e.g. 15 mins default)
    // In a real app, this would be based on max(item.prepTime)
    final targetTime = now.add(const Duration(minutes: 15));
    
    await _db.transaction(() async {
      // 1. Insert Ticket
      await _db.into(_db.kitchenTicketTable).insert(
        KitchenTicketTableCompanion(
          uuid: Value(uuid),
          orderUuid: Value(orderUuid),
          orderNumber: Value(orderNumber),
          tableUuid: Value(tableUuid),
          guestTableName: Value(tableName),
          serverName: Value(serverName),
          note: Value(note),
          status: Value(KDSTicketStatus.fired.name),
          firedAt: Value(now),
          targetTime: Value(targetTime),
        )
      );
      
      // 2. Insert Items
      for (var item in items) {
        // Use provided item UUID or generate new one if it's a domain object being passed down
        // The domain entity passed in might be a temp one from domain layer
        // If items already have UUIDs (e.g. from order items), use them or map them
        // Here assuming we create new KDS items linked to ticket
        
        await _db.into(_db.kitchenItemTable).insert(
          KitchenItemTableCompanion(
            uuid: Value(item.uuid),
            ticketUuid: Value(uuid),
            orderItemUuid: Value(item.orderItemUuid),
            name: Value(item.name),
            quantity: Value(item.quantity),
            modifiersJson: Value(jsonEncode(item.modifiers)),
            note: Value(item.note),
            course: Value(item.course.name),
            status: Value(KDSTicketStatus.fired.name),
          )
        );
      }
    });
    
    return getTicket(uuid).then((t) => t!);
  }
  
  @override
  Future<List<KDSTicket>> getActiveTickets({
    List<KDSCourse>? filterCourses,
    bool includeDone = false,
  }) async {
    // 1. Query tickets
    final query = _db.select(_db.kitchenTicketTable);
    
    if (includeDone) {
      query.where((t) => t.status.isIn([
        KDSTicketStatus.fired.name, 
        KDSTicketStatus.prep.name, 
        KDSTicketStatus.ready.name
      ]));
    } else {
      query.where((t) => t.status.isIn([
        KDSTicketStatus.fired.name, 
        KDSTicketStatus.prep.name
      ]));
    }
    
    query.orderBy([(t) => OrderingTerm.asc(t.firedAt)]);
    
    final ticketRows = await query.get();
    
    // 2. Fetch items for these tickets
    // Optimization: efficient batch fetch could be done here
    // For now simple loop or join
    
    final tickets = <KDSTicket>[];
    
    for (var row in ticketRows) {
      final items = await _getItemsForTicket(row.uuid);
      tickets.add(_mapToTicket(row, items));
    }
    
    return tickets;
  }
  
  @override
  Future<KDSTicket?> getTicket(String uuid) async {
    final row = await (_db.select(_db.kitchenTicketTable)
      ..where((t) => t.uuid.equals(uuid)))
      .getSingleOrNull();
      
    if (row == null) return null;
    
    final items = await _getItemsForTicket(uuid);
    return _mapToTicket(row, items);
  }
  
  // ===================================
  // STATUS UPDATES
  // ===================================
  
  @override
  Future<void> updateTicketStatus(String ticketUuid, KDSTicketStatus status) async {
    final now = DateTime.now();
    
    final companion = KitchenTicketTableCompanion(
      status: Value(status.name),
    );
    
    // Add timestamps based on status
    if (status == KDSTicketStatus.prep) {
      // If moving to prep, set startedAt if not set
      // We need custom statement or logic to check if null
      await (_db.update(_db.kitchenTicketTable)..where((t) => t.uuid.equals(ticketUuid))).write(
        KitchenTicketTableCompanion(
          status: Value(status.name),
          startedAt: Value(now), // Simplified: always update start time on prep
        )
      );
    } else if (status == KDSTicketStatus.ready || status == KDSTicketStatus.served) {
       await (_db.update(_db.kitchenTicketTable)..where((t) => t.uuid.equals(ticketUuid))).write(
        KitchenTicketTableCompanion(
          status: Value(status.name),
          completedAt: Value(now),
        )
      );
    } else {
       await (_db.update(_db.kitchenTicketTable)..where((t) => t.uuid.equals(ticketUuid))).write(companion);
    }
    
    // Cascading status to items if needed?
    // Usually moving ticket moves all items, unless items track status individually
    // Let's update all items to match ticket status for consistency in this simple model
    await (_db.update(_db.kitchenItemTable)
      ..where((t) => t.ticketUuid.equals(ticketUuid)))
      .write(KitchenItemTableCompanion(status: Value(status.name)));
  }
  
  @override
  Future<void> updateItemStatus(String itemUuid, KDSTicketStatus status) async {
    await (_db.update(_db.kitchenItemTable)
      ..where((t) => t.uuid.equals(itemUuid)))
      .write(KitchenItemTableCompanion(status: Value(status.name)));
      
    // Logic: If all items are ready, mark ticket as ready?
    // This requires checking all sibling items. Leaving out for now to keep it manual/simple.
  }
  
  @override
  Future<void> bumpTicket(String ticketUuid) async {
    final ticket = await getTicket(ticketUuid);
    if (ticket == null) return;
    
    var nextStatus = ticket.status;
    switch (ticket.status) {
      case KDSTicketStatus.fired:
        nextStatus = KDSTicketStatus.prep;
        break;
      case KDSTicketStatus.prep:
        nextStatus = KDSTicketStatus.ready;
        break;
      case KDSTicketStatus.ready:
        nextStatus = KDSTicketStatus.served;
        break;
      default:
        // No op
        return;
    }
    
    await updateTicketStatus(ticketUuid, nextStatus);
  }
  
  @override
  Future<void> recallTicket(String ticketUuid) async {
    // Only implemented for served/voided -> ready?
    // Or ready -> prep?
    // Simple implementation: move any "served" ticket back to "ready"
    final ticket = await getTicket(ticketUuid);
    if (ticket == null) return;
    
    if (ticket.status == KDSTicketStatus.served) {
      await updateTicketStatus(ticketUuid, KDSTicketStatus.ready);
    }
  }
  
  // ===================================
  // EXPO & ANALYTICS
  // ===================================
  
  @override
  Future<KDSExpoSummary> getExpoSummary() async {
    final activeTickets = await getActiveTickets();
    
    int totalActive = activeTickets.length;
    int itemsInPrep = 0;
    int itemsReady = 0;
    final itemCounts = <String, int>{};
    
    for (var t in activeTickets) {
      if (t.status == KDSTicketStatus.prep) itemsInPrep += t.items.length; // Approximate
      if (t.status == KDSTicketStatus.ready) itemsReady += t.items.length;
      
      for (var item in t.items) {
        if (item.status != KDSTicketStatus.served && item.status != KDSTicketStatus.voided) {
          itemCounts[item.name] = (itemCounts[item.name] ?? 0) + item.quantity;
        }
      }
    }
    
    // Avg prep time calculation (mock/placeholder)
    // Real impl would query historical average of (completedAt - firedAt)
    double avgPrep = 12.5; 
    
    return KDSExpoSummary(
      totalActiveTickets: totalActive,
      itemsInPrep: itemsInPrep,
      itemsReady: itemsReady,
      avgPrepTimeMinutes: avgPrep,
      activeItemCounts: itemCounts,
    );
  }
  
  @override
  Future<Map<KDSCourse, double>> getAveragePrepTimes() async {
    return {
      KDSCourse.appetizer: 8.0,
      KDSCourse.main: 15.0,
      KDSCourse.dessert: 6.0,
    };
  }
  
  // ===================================
  // STREAMS
  // ===================================
  
  @override
  Stream<List<KDSTicket>> watchActiveTickets() {
    // Watching complex joins/logic is hard with drift streams directly if doing manual joins
    // Simplest approach: Watch the ticket table, then re-fetch full objects
    // This triggers on ANY ticket table change
    
    return (_db.select(_db.kitchenTicketTable)
      ..where((t) => t.status.isIn([
        KDSTicketStatus.fired.name, 
        KDSTicketStatus.prep.name,
        KDSTicketStatus.ready.name
      ]))
      ..orderBy([(t) => OrderingTerm.asc(t.firedAt)]))
      .watch()
      .asyncMap((rows) async {
        final tickets = <KDSTicket>[];
        for (var row in rows) {
          final items = await _getItemsForTicket(row.uuid);
          tickets.add(_mapToTicket(row, items));
        }
        return tickets;
      });
  }
  
  @override
  Stream<KDSExpoSummary> watchExpoSummary() {
    // Re-run getExpoSummary whenever tickets change
    return _db.kitchenTicketTable.select().watch().asyncMap((_) => getExpoSummary());
  }
  
  // ===================================
  // HELPERS
  // ===================================
  
  Future<List<KDSItem>> _getItemsForTicket(String ticketUuid) async {
    final rows = await (_db.select(_db.kitchenItemTable)
      ..where((t) => t.ticketUuid.equals(ticketUuid)))
      .get();
      
    return rows.map((row) => KDSItem(
      uuid: row.uuid,
      ticketUuid: row.ticketUuid,
      orderItemUuid: row.orderItemUuid,
      name: row.name,
      quantity: row.quantity,
      modifiers: List<String>.from(jsonDecode(row.modifiersJson)),
      note: row.note,
      course: KDSCourse.values.firstWhere(
        (e) => e.name == row.course, 
        orElse: () => KDSCourse.main
      ),
      status: KDSTicketStatus.values.firstWhere(
        (e) => e.name == row.status, 
        orElse: () => KDSTicketStatus.fired
      ),
    )).toList();
  }
  
  KDSTicket _mapToTicket(KitchenTicketTableData row, List<KDSItem> items) {
    return KDSTicket(
      uuid: row.uuid,
      orderUuid: row.orderUuid,
      orderNumber: row.orderNumber,
      tableUuid: row.tableUuid,
      tableName: row.guestTableName,
      serverName: row.serverName,
      items: items,
      status: KDSTicketStatus.values.firstWhere(
        (e) => e.name == row.status, 
        orElse: () => KDSTicketStatus.fired
      ),
      firedAt: row.firedAt,
      startedAt: row.startedAt,
      completedAt: row.completedAt,
      targetTime: row.targetTime,
      note: row.note,
      isRush: row.isRush,
    );
  }
}
