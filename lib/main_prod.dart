import 'package:savvy_pos/bootstrap.dart';
import 'package:savvy_pos/core/config/app_config.dart';

void main() async {
  final config = AppConfig(
    appName: 'Savvy POS',
    flavor: Flavor.prod,
    apiBaseUrl: 'https://api.savvypos.com',
    enableLogs: false,
  );
  
  await bootstrap(config);
}
