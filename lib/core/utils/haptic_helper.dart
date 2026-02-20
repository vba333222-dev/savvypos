import 'package:flutter/services.dart';

class HapticHelper {
  // Private constructor
  HapticHelper._();

  static Future<void> onTap() async {
    await HapticFeedback.lightImpact();
  }

  static Future<void> onLand() async {
    // Medium impact for landing "weight"
    await HapticFeedback.mediumImpact();
  }
  
  static Future<void> onSelection() async {
    await HapticFeedback.selectionClick();
  }

  static Future<void> onError() async {
     await HapticFeedback.heavyImpact();
  }
}
