import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:logger/logger.dart';

class TokenService {
  static final TokenService _instance = TokenService._internal();
  factory TokenService() => _instance;
  TokenService._internal();

  final Logger _logger = Logger();
  Map<String, dynamic>? _tokens;

  Future<void> loadTokens() async {
    try {
      final jsonString = await rootBundle.loadString('assets/config/token.json');
      _tokens = json.decode(jsonString);
      _logger.i('TokenService: loaded token.json');
    } catch (e) {
      _logger.e('TokenService: Failed to load token.json. Using fallbacks.', error: e);
      _tokens = null;
    }
  }

  // --- Colors ---
  String? getColorHex(String key) {
    return _tokens?['colors']?[key] as String?;
  }

  // --- Shapes ---
  double? getShape(String key) {
    final val = _tokens?['shapes']?[key];
    if (val is num) return val.toDouble();
    return null;
  }

  // --- Motion ---
  int? getDuration(String key) {
     final val = _tokens?['motion']?[key];
     if (val is num) return val.toInt();
     return null;
  }

  // --- Elevations ---
  Map<String, dynamic>? getElevation(String key) {
    return _tokens?['elevations']?[key] as Map<String, dynamic>?;
  }
}
