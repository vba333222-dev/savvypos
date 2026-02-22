import 'package:flutter/material.dart'; // Added for Widget

enum Flavor { dev, stg, prod }

class AppConfig {
  final String appName;
  final Flavor flavor;
  final String apiBaseUrl;
  final bool enableLogs;
  final Widget Function()? userApp; // Optional builder

  AppConfig({
    required this.appName,
    required this.flavor,
    required this.apiBaseUrl,
    this.enableLogs = false,
    this.userApp,
  });

  bool get isProd => flavor == Flavor.prod;
  bool get isDev => flavor == Flavor.dev;
}
