import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:savvy_pos/core/database/database.dart';
import 'package:savvy_pos/features/auth/domain/repositories/i_tenant_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

@LazySingleton(as: ITenantRepository)
class TenantRepositoryImpl implements ITenantRepository {
  final AppDatabase db;
  final Uuid _uuid = const Uuid();
  final _outletChangedSubject = PublishSubject<String>();

  TenantRepositoryImpl(this.db);

  @override
  Stream<String> get onOutletChanged => _outletChangedSubject.stream;

  @override
  Future<TenantConfigTableData?> getConfig() async {
    return (db.select(db.tenantConfigTable)..limit(1)).getSingleOrNull();
  }

  @override
  Future<void> saveConfig(String outletName, String address, String currency) async {
    await db.into(db.tenantConfigTable).insert(TenantConfigTableCompanion.insert(
      tenantId: _uuid.v4(),
      outletName: outletName,
      address: address,
      currencySymbol: currency,
      tier: 0, // Free tier default
      isAdsEnabled: true,
      updatedAt: DateTime.now(),
    ));
  }
  @override
  Future<void> saveActiveScope(String outletId, String warehouseId) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('active_outlet_id', outletId);
    await prefs.setString('active_warehouse_id', warehouseId);
    
    // Broadcast the change for Global State Purge (Multi-Store Isolation)
    _outletChangedSubject.add(outletId);
  }

  @override
  Future<Map<String, String?>> getActiveScope() async {
    final prefs = await SharedPreferences.getInstance();
    return {
      'outletId': prefs.getString('active_outlet_id'),
      'warehouseId': prefs.getString('active_warehouse_id'),
    };
  }
}
