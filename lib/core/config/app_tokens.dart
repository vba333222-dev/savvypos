import 'package:flutter/material.dart';

/// STATIC MAPPING OF token.json
/// DO NOT EDIT MANUALLY. UPDATE token.json AND RE-RUN GENERATOR (Future Goal).
/// Current Version: 2.0.0
class AppTokens {
  AppTokens._();

  static const colors = _AppColors();
  static const shapes = _AppShapes();
  static const motion = _AppMotion();
  static const elevations = _AppElevations();
}

class _AppColors {
  const _AppColors();

  // Brand
  final brandPrimaryLight = const Color(0xFF5B8DEF);
  final brandPrimaryDark = const Color(0xFF7AA2FF);
  final brandSecondaryLight = const Color(0xFF4CC9B0);
  final brandSecondaryDark = const Color(0xFF5EDBC7);
  final brandAccentLight = const Color(0xFFF4B860);
  final brandAccentDark = const Color(0xFFF6C177);

  // Background
  final bgPrimaryLight = const Color(0xFFF7F9FC);
  final bgPrimaryDark = const Color(0xFF0F172A);
  final bgSecondaryLight = const Color(0xFFFFFFFF);
  final bgSecondaryDark = const Color(0xFF1E293B);
  final bgElevatedLight = const Color(0xFFFFFFFF);
  final bgElevatedDark = const Color(0xFF273449);
  final bgOverlayLight = const Color(0x1A0F172A); // #0F172A1A
  final bgOverlayDark = const Color(0x80000000); // #00000080

  // Text
  final textPrimaryLight = const Color(0xFF0F172A);
  final textPrimaryDark = const Color(0xFFE5E7EB);
  final textSecondaryLight = const Color(0xFF475569);
  final textSecondaryDark = const Color(0xFF94A3B8);
  final textMutedLight = const Color(0xFF94A3B8);
  final textMutedDark = const Color(0xFF64748B);
  final textInverseLight = const Color(0xFFFFFFFF);
  final textInverseDark = const Color(0xFF0F172A);

  // Border
  final borderDefaultLight = const Color(0xFFE2E8F0);
  final borderDefaultDark = const Color(0xFF334155);
  final borderFocusLight = const Color(0xFF5B8DEF);
  final borderFocusDark = const Color(0xFF7AA2FF);

  // State
  final stateSuccessLight = const Color(0xFF4ADE80);
  final stateSuccessDark = const Color(0xFF22C55E);
  final stateWarningLight = const Color(0xFFFACC15);
  final stateWarningDark = const Color(0xFFEAB308);
  final stateErrorLight = const Color(0xFFF87171);
  final stateErrorDark = const Color(0xFFEF4444);
  final stateInfoLight = const Color(0xFF60A5FA);
  final stateInfoDark = const Color(0xFF3B82F6);
}

class _AppShapes {
  const _AppShapes();

  // Radius
  final double radiusSm = 4.0;
  final double radiusMd = 8.0;
  final double radiusLg = 16.0;
  final double radiusXl = 24.0;
  final double radiusPill = 999.0;

  // Spacing
  final double spacingXs = 4.0;
  final double spacingSm = 8.0;
  final double spacingMd = 16.0;
  final double spacingLg = 24.0;
  final double spacingXl = 32.0;
  final double spacingXxl = 48.0;
}

class _AppMotion {
  const _AppMotion();

  // Duration
  final durationFast = const Duration(milliseconds: 200);
  final durationMedium = const Duration(milliseconds: 400);
  final durationSlow = const Duration(milliseconds: 600);

  // Curve
  final curveDefault = const Cubic(0.4, 0.0, 0.2, 1.0);
  final curveBounce = const Cubic(0.34, 1.56, 0.64, 1.0);
  final curveFluid = const Cubic(0.25, 0.46, 0.45, 0.94);
}

class _AppElevations {
  const _AppElevations();

  // Shadows (Light/Dark variants handled in ThemeConfig usually, but exposed here as raw data)
  // Converting straight from JSON to BoxShadow list
  
  // None
  List<BoxShadow> get none => [];

  // SM
  List<BoxShadow> get smLight => [
    BoxShadow(color: Color(0x0D000000), offset: Offset(0, 1), blurRadius: 2, spreadRadius: 0) // 0.05 opacity = 0x0D
  ];
  List<BoxShadow> get smDark => [
    BoxShadow(color: Color(0x40000000), offset: Offset(0, 1), blurRadius: 2, spreadRadius: 0) // 0.25 opacity = 0x40
  ];

  // MD
  List<BoxShadow> get mdLight => [
    BoxShadow(color: Color(0x1A000000), offset: Offset(0, 4), blurRadius: 6, spreadRadius: -1) // 0.1 opacity = 0x1A
  ];
  List<BoxShadow> get mdDark => [
    BoxShadow(color: Color(0x66000000), offset: Offset(0, 4), blurRadius: 6, spreadRadius: -1) // 0.4 opacity = 0x66
  ];

  // LG
  List<BoxShadow> get lgLight => [
    BoxShadow(color: Color(0x1A000000), offset: Offset(0, 10), blurRadius: 15, spreadRadius: -3) // 0.1 opacity = 0x1A
  ];
  List<BoxShadow> get lgDark => [
    BoxShadow(color: Color(0x80000000), offset: Offset(0, 10), blurRadius: 15, spreadRadius: -3) // 0.5 opacity = 0x80
  ];

  // Floating
  List<BoxShadow> get floatingLight => [
    BoxShadow(color: Color(0x26000000), offset: Offset(0, 20), blurRadius: 25, spreadRadius: -5) // 0.15 opacity = 0x26
  ];
  List<BoxShadow> get floatingDark => [
    BoxShadow(color: Color(0x99000000), offset: Offset(0, 20), blurRadius: 25, spreadRadius: -5) // 0.6 opacity = 0x99
  ];
}
