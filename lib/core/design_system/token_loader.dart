import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:savvy_pos/core/design_system/theme_config.dart';

@singleton
class TokenLoader {
  SavvyThemeConfig? _config;

  SavvyThemeConfig get config {
    if (_config == null) {
      throw Exception('SavvyThemeConfig not loaded! Call load() first.');
    }
    return _config!;
  }

  Future<void> load() async {
    try {
      final String jsonString =
          await rootBundle.loadString('assets/config/token.json');
      final Map<String, dynamic> jsonMap = json.decode(jsonString);
      _config = SavvyThemeConfig.fromJson(jsonMap);
    } catch (e) {
      // Fallback or rethrow? For now, we want to fail hard if design tokens are missing.
      // In a real production app, might have a fallback hardcoded config.
      throw Exception('Failed to load design tokens: $e');
    }
  }
}
