import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';
import 'package:savvy_pos/core/database/database.dart';
import 'package:savvy_pos/features/reservations/domain/entities/waitlist_entities.dart';
import 'package:savvy_pos/features/reservations/domain/repositories/i_waitlist_repository.dart';
import 'package:uuid/uuid.dart';

@LazySingleton(as: IWaitlistRepository)
class WaitlistRepositoryImpl implements IWaitlistRepository {
  final AppDatabase _db;
  final _uuid = const Uuid();
  
  WaitlistRepositoryImpl(this._db);
  
  // ===================================
  // WAITLIST CRUD
  // ===================================
  
  @override
  Future<WaitlistEntry> addToWaitlist({
    required String guestName,
    required String phoneNumber,
    required int partySize,
    String? specialRequests,
    bool highchairNeeded = false,
    bool wheelchairAccessible = false,
    String? tablePreference,
  }) async {
    final uuid = _uuid.v4();
    final now = DateTime.now();
    final estimatedMinutes = await estimateWaitTime(partySize);
    final quotedTime = now.add(Duration(minutes: estimatedMinutes));
    
    // Calculate new position
    final count = await (_db.select(_db.waitlistTable)
      ..where((t) => t.status.equals(WaitlistStatus.waiting.name)))
      .get()
      .then((rows) => rows.length);
      
    await _db.into(_db.waitlistTable).insert(
      WaitlistTableCompanion(
        uuid: Value(uuid),
        guestName: Value(guestName),
        phoneNumber: Value(phoneNumber),
        partySize: Value(partySize),
        specialRequests: Value(specialRequests),
        highchairNeeded: Value(highchairNeeded),
        wheelchairAccessible: Value(wheelchairAccessible),
        tablePreference: Value(tablePreference),
        status: Value(WaitlistStatus.waiting.name),
        createdAt: Value(now),
        quotedWaitTime: Value(quotedTime),
        queuePosition: Value(count + 1),
      )
    );
    
    return WaitlistEntry(
      uuid: uuid,
      guestName: guestName,
      phoneNumber: phoneNumber,
      partySize: partySize,
      specialRequests: specialRequests,
      highchairNeeded: highchairNeeded,
      wheelchairAccessible: wheelchairAccessible,
      tablePreference: tablePreference,
      status: WaitlistStatus.waiting,
      createdAt: now,
      quotedWaitTime: quotedTime,
      queuePosition: count + 1,
    );
  }
  
  @override
  Future<List<WaitlistEntry>> getWaitingEntries() async {
    final rows = await (_db.select(_db.waitlistTable)
      ..where((t) => t.status.equals(WaitlistStatus.waiting.name))
      ..orderBy([(t) => OrderingTerm.asc(t.createdAt)]))
      .get();
      
    return rows.map(_mapToEntry).toList();
  }
  
  @override
  Future<WaitlistEntry?> getEntry(String uuid) async {
    final row = await (_db.select(_db.waitlistTable)
      ..where((t) => t.uuid.equals(uuid)))
      .getSingleOrNull();
      
    if (row == null) return null;
    return _mapToEntry(row);
  }
  
  @override
  Future<void> updateEntry(WaitlistEntry entry) async {
    await (_db.update(_db.waitlistTable)
      ..where((t) => t.uuid.equals(entry.uuid)))
      .write(WaitlistTableCompanion(
        guestName: Value(entry.guestName),
        phoneNumber: Value(entry.phoneNumber),
        partySize: Value(entry.partySize),
        specialRequests: Value(entry.specialRequests),
        highchairNeeded: Value(entry.highchairNeeded),
        wheelchairAccessible: Value(entry.wheelchairAccessible),
        tablePreference: Value(entry.tablePreference),
        quotedWaitTime: Value(entry.quotedWaitTime),
      ));
  }
  
  @override
  Future<void> removeFromWaitlist(String uuid) async {
    await (_db.delete(_db.waitlistTable)
      ..where((t) => t.uuid.equals(uuid)))
      .go();
      
    await recalculatePositions();
  }
  
  // ===================================
  // STATUS MANAGEMENT
  // ===================================
  
  @override
  Future<void> markAsSeated(String uuid, String tableUuid) async {
    await (_db.update(_db.waitlistTable)
      ..where((t) => t.uuid.equals(uuid)))
      .write(WaitlistTableCompanion(
        status: Value(WaitlistStatus.seated.name),
        seatedAt: Value(DateTime.now()),
        seatedTableUuid: Value(tableUuid),
        queuePosition: const Value(null),
      ));
      
    await recalculatePositions();
  }
  
  @override
  Future<void> markAsNoShow(String uuid) async {
    await (_db.update(_db.waitlistTable)
      ..where((t) => t.uuid.equals(uuid)))
      .write(WaitlistTableCompanion(
        status: Value(WaitlistStatus.noShow.name),
        queuePosition: const Value(null),
      ));
      
    await recalculatePositions();
  }
  
  @override
  Future<void> markAsCancelled(String uuid) async {
    await (_db.update(_db.waitlistTable)
      ..where((t) => t.uuid.equals(uuid)))
      .write(WaitlistTableCompanion(
        status: Value(WaitlistStatus.cancelled.name),
        queuePosition: const Value(null),
      ));
      
    await recalculatePositions();
  }
  
  // ===================================
  // NOTIFICATIONS
  // ===================================
  
  @override
  Future<void> sendReadyNotification(String uuid) async {
    // In real app, integrate with SMS provider (Twilio, etc.)
    await (_db.update(_db.waitlistTable)
      ..where((t) => t.uuid.equals(uuid)))
      .write(WaitlistTableCompanion(
        notifiedAt: Value(DateTime.now()),
      ));
  }
  
  @override
  Future<List<WaitlistEntry>> getReadyToNotify() async {
    // Logic: Find entries within 5 mins of quoted time that haven't been notified
    // This query is simplified
    
    final rows = await (_db.select(_db.waitlistTable)
      ..where((t) => t.status.equals(WaitlistStatus.waiting.name))
      ..where((t) => t.notifiedAt.isNull()))
      .get();
      
    return rows.map(_mapToEntry).where((e) => e.isReadyToNotify).toList();
  }
  
  // ===================================
  // ANALYTICS
  // ===================================
  
  @override
  Future<WaitlistSummary> getSummary() async {
    final waiting = await getWaitingEntries();
    final now = DateTime.now();
    
    // Calculate stats
    int totalWaitMinutes = 0;
    int longestWait = 0;
    final partySizeDist = <int, int>{};
    
    for (var e in waiting) {
      final waitTime = now.difference(e.createdAt).inMinutes;
      totalWaitMinutes += waitTime;
      if (waitTime > longestWait) longestWait = waitTime;
      
      partySizeDist[e.partySize] = (partySizeDist[e.partySize] ?? 0) + 1;
    }
    
    return WaitlistSummary(
      totalWaiting: waiting.length,
      avgWaitMinutes: waiting.isNotEmpty ? totalWaitMinutes ~/ waiting.length : 0,
      longestWaitMinutes: longestWait,
      partySizeDistribution: partySizeDist,
    );
  }
  
  @override
  Future<int> estimateWaitTime(int partySize) async {
    // Simple algorithm: 15 mins base + 5 mins per existing party of similar size
    final waiting = await getWaitingEntries();
    final similarParties = waiting.where((e) => (e.partySize - partySize).abs() <= 2).length;
    
    return 15 + (similarParties * 5);
  }
  
  @override
  Future<void> recalculatePositions() async {
    final waiting = await getWaitingEntries();
    // Provide explicit type for index
    for (int i = 0; i < waiting.length; i++) {
        final entry = waiting[i];
      await (_db.update(_db.waitlistTable)
        ..where((t) => t.uuid.equals(entry.uuid)))
        .write(WaitlistTableCompanion(
          queuePosition: Value(i + 1),
        ));
    }
  }
  
  // ===================================
  // MAPPERS
  // ===================================
  
  WaitlistEntry _mapToEntry(WaitlistTableData row) {
    return WaitlistEntry(
      uuid: row.uuid,
      guestName: row.guestName,
      phoneNumber: row.phoneNumber,
      partySize: row.partySize,
      specialRequests: row.specialRequests,
      highchairNeeded: row.highchairNeeded,
      wheelchairAccessible: row.wheelchairAccessible,
      tablePreference: row.tablePreference,
      status: WaitlistStatus.values.firstWhere((e) => e.name == row.status),
      createdAt: row.createdAt,
      quotedWaitTime: row.quotedWaitTime,
      notifiedAt: row.notifiedAt,
      seatedAt: row.seatedAt,
      seatedTableUuid: row.seatedTableUuid,
      queuePosition: row.queuePosition,
    );
  }
}
