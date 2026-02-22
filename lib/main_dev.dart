import 'package:savvy_pos/bootstrap.dart';
import 'package:savvy_pos/core/config/app_config.dart';

void main() async {
  final config = AppConfig(
    appName: 'Savvy POS (Dev)',
    flavor: Flavor.dev,
    apiBaseUrl: 'http://localhost:8080/api',
    enableLogs: true,
  );

  await bootstrap(config);
}
