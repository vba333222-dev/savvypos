import 'package:injectable/injectable.dart';

enum Flavor { dev, stg, prod }

@singleton
class AppConfig {
  final String appName;
  final Flavor flavor;
  final String apiBaseUrl;
  final bool enableLogs;

  AppConfig({
    required this.appName,
    required this.flavor,
    required this.apiBaseUrl,
    this.enableLogs = false,
  });
  
  bool get isProd => flavor == Flavor.prod;
  bool get isDev => flavor == Flavor.dev;
}
