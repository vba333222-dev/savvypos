import 'package:savvy_pos/core/database/database.dart';

abstract class ITenantRepository {
  Future<TenantConfigTableData?> getConfig();
  Future<void> saveConfig(String outletName, String address, String currency);
}
