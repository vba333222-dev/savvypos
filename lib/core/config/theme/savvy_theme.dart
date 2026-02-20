import 'package:flutter/material.dart';
import 'package:savvy_pos/core/config/token_service.dart';

extension HexColor on Color {
  static Color fromHex(String hexString) {
    if (hexString.isEmpty) return Colors.black;
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    try {
      return Color(int.parse(buffer.toString(), radix: 16));
    } catch (e) {
      return Colors.black;
    }
  }
}

// ==============================================================================
// SAVVY THEME EXTENSION (Antigravity Edition)
// ==============================================================================
// Usage:
// context.savvy.colors.brandPrimary
// context.savvy.shapes.radiusLg
// context.savvy.motion.durationFast
// context.savvy.elevations.floating
// ==============================================================================

@immutable
class SavvyTheme extends ThemeExtension<SavvyTheme> {
  final SavvyColors colors;
  final SavvyShapes shapes;
  final SavvyMotion motion;
  final SavvyElevations elevations;

  const SavvyTheme({
    required this.colors,
    required this.shapes,
    required this.motion,
    required this.elevations,
  });

  // --- FACTORY: LIGHT THEME ---
  factory SavvyTheme.light() {
    return SavvyTheme(
      colors: const SavvyColors(
        brandPrimary: Color(0xFF5B8DEF),
        brandSecondary: Color(0xFF4CC9B0),
        brandAccent: Color(0xFFF4B860),
        bgPrimary: Color(0xFFF7F9FC),
        bgSecondary: Color(0xFFFFFFFF),
        bgElevated: Color(0xFFFFFFFF),
        textPrimary: Color(0xFF0F172A),
        textSecondary: Color(0xFF475569),
        textMuted: Color(0xFF94A3B8),
        textInverse: Color(0xFFFFFFFF),
        borderDefault: Color(0xFFE2E8F0),
        stateSuccess: Color(0xFF4ADE80),
        stateError: Color(0xFFF87171),
        stateWarning: Color(0xFFFACC15),
      ),
      shapes: const SavvyShapes.regular(),
      motion: const SavvyMotion.regular(),
      elevations: SavvyElevations.light(),
    );
  }

  // --- FACTORY: DARK THEME ---
  factory SavvyTheme.dark() {
    return SavvyTheme(
      colors: const SavvyColors(
        brandPrimary: Color(0xFF7AA2FF),
        brandSecondary: Color(0xFF5EDBC7),
        brandAccent: Color(0xFFF6C177),
        bgPrimary: Color(0xFF0F172A),
        bgSecondary: Color(0xFF1E293B),
        bgElevated: Color(0xFF273449),
        textPrimary: Color(0xFFE5E7EB),
        textSecondary: Color(0xFF94A3B8),
        textMuted: Color(0xFF64748B),
        textInverse: Color(0xFF0F172A),
        borderDefault: Color(0xFF334155),
        stateSuccess: Color(0xFF22C55E),
        stateError: Color(0xFFEF4444),
        stateWarning: Color(0xFFEAB308),
      ),
      shapes: const SavvyShapes.regular(),
      motion: const SavvyMotion.regular(),
      elevations: SavvyElevations.dark(),
    );
  }

  // --- FACTORY: DYNAMIC TOKEN THEME ---
  factory SavvyTheme.loadFromTokens({bool isDark = false}) {
    final tokens = TokenService();

    // Helper to get color or fallback safely
    Color c(String key, Color fallback) {
      final hex = tokens.getColorHex(key);
      if (hex != null) return HexColor.fromHex(hex);
      return fallback;
    }

    // Default Fallback (Light)
    final fallback = isDark ? SavvyTheme.dark() : SavvyTheme.light();

    return SavvyTheme(
      colors: SavvyColors(
        brandPrimary: c('brandPrimary', fallback.colors.brandPrimary),
        brandSecondary: c('brandSecondary', fallback.colors.brandSecondary),
        brandAccent: c('brandAccent', fallback.colors.brandAccent),
        bgPrimary: c('bgPrimary', fallback.colors.bgPrimary),
        bgSecondary: c('bgSecondary', fallback.colors.bgSecondary),
        bgElevated: c('bgElevated', fallback.colors.bgElevated),
        textPrimary: c('textPrimary', fallback.colors.textPrimary),
        textSecondary: c('textSecondary', fallback.colors.textSecondary),
        textMuted: c('textMuted', fallback.colors.textMuted),
        textInverse: c('textInverse', fallback.colors.textInverse),
        borderDefault: c('borderDefault', fallback.colors.borderDefault),
        stateSuccess: c('stateSuccess', fallback.colors.stateSuccess),
        stateError: c('stateError', fallback.colors.stateError),
        stateWarning: c('stateWarning', fallback.colors.stateWarning),
      ),
      shapes: SavvyShapes.fromTokens(tokens, fallback.shapes),
      motion: SavvyMotion.fromTokens(tokens, fallback.motion),
      elevations: SavvyElevations.fromTokens(tokens, fallback.elevations),
    );
  }

  @override
  ThemeExtension<SavvyTheme> copyWith({
    SavvyColors? colors,
    SavvyShapes? shapes,
    SavvyMotion? motion,
    SavvyElevations? elevations,
  }) {
    return SavvyTheme(
      colors: colors ?? this.colors,
      shapes: shapes ?? this.shapes,
      motion: motion ?? this.motion,
      elevations: elevations ?? this.elevations,
    );
  }

  @override
  ThemeExtension<SavvyTheme> lerp(ThemeExtension<SavvyTheme>? other, double t) {
    if (other is! SavvyTheme) return this;
    return SavvyTheme(
      colors: colors.lerp(other.colors, t),
      shapes: shapes,
      motion: motion,
      elevations: elevations.lerp(other.elevations, t),
    );
  }
}

// ==============================================================================
// 1. COLORS
// ==============================================================================
@immutable
class SavvyColors {
  final Color brandPrimary;
  final Color brandSecondary;
  final Color brandAccent;
  final Color bgPrimary;
  final Color bgSecondary;
  final Color bgElevated;
  final Color textPrimary;
  final Color textSecondary;
  final Color textMuted;
  final Color textInverse;
  final Color borderDefault;
  final Color stateSuccess;
  final Color stateError;
  final Color stateWarning;

  // Compatibility Aliases
  Color get bgSurface => bgElevated;
  Color get bgCanvas => bgPrimary;
  Color get bgInverse => textPrimary;
  Color get border => borderDefault;

  Color get primary => brandPrimary;
  Color get secondary => brandSecondary;
  Color get accent => brandAccent;

  Color get success => stateSuccess;
  Color get textDisabled => textMuted;

  // More Compat Aliases
  Color get bgBase => bgPrimary;

  Color get surface => bgElevated;
  Color get textBase => textPrimary; // Added this one as requested
  Color get borderDivider => borderDefault;
  Color get bgDisabled => stateWarning.withValues(alpha: 0.1);
  Color get shadowSubtle => Colors.black.withValues(alpha: 0.05);

  const SavvyColors({
    required this.brandPrimary,
    required this.brandSecondary,
    required this.brandAccent,
    required this.bgPrimary,
    required this.bgSecondary,
    required this.bgElevated,
    required this.textPrimary,
    required this.textSecondary,
    required this.textMuted,
    required this.textInverse,
    required this.borderDefault,
    required this.stateSuccess,
    required this.stateError,
    required this.stateWarning,
    // Ignored Legacy Params for Compatibility
    Color? primary,
    Color? secondary,
    Color? accent,
    Color? bgSurface,
    Color? bgBase,
    Color? textBase,
    Color? surface,
  });
  SavvyColors lerp(SavvyColors? other, double t) {
    if (other == null) return this;
    return SavvyColors(
      brandPrimary: Color.lerp(brandPrimary, other.brandPrimary, t)!,
      brandSecondary: Color.lerp(brandSecondary, other.brandSecondary, t)!,
      brandAccent: Color.lerp(brandAccent, other.brandAccent, t)!,
      bgPrimary: Color.lerp(bgPrimary, other.bgPrimary, t)!,
      bgSecondary: Color.lerp(bgSecondary, other.bgSecondary, t)!,
      bgElevated: Color.lerp(bgElevated, other.bgElevated, t)!,
      textPrimary: Color.lerp(textPrimary, other.textPrimary, t)!,
      textSecondary: Color.lerp(textSecondary, other.textSecondary, t)!,
      textMuted: Color.lerp(textMuted, other.textMuted, t)!,
      textInverse: Color.lerp(textInverse, other.textInverse, t)!,
      borderDefault: Color.lerp(borderDefault, other.borderDefault, t)!,
      stateSuccess: Color.lerp(stateSuccess, other.stateSuccess, t)!,
      stateError: Color.lerp(stateError, other.stateError, t)!,
      stateWarning: Color.lerp(stateWarning, other.stateWarning, t)!,
    );
  }
}

// ==============================================================================
// 2. SHAPES & SPACING
// ==============================================================================
@immutable
class SavvyShapes {
  final double radiusSm;
  final double radiusMd;
  final double radiusLg;
  final double radiusXl;
  final double radiusPill;

  final double spacingXs;
  final double spacingSm;
  final double spacingMd;
  final double spacingLg;
  final double spacingXl;

  const SavvyShapes({
    required this.radiusSm,
    required this.radiusMd,
    required this.radiusLg,
    required this.radiusXl,
    required this.radiusPill,
    required this.spacingXs,
    required this.spacingSm,
    required this.spacingMd,
    required this.spacingLg,
    required this.spacingXl,
  });

  const SavvyShapes.regular()
      : radiusSm = 4.0,
        radiusMd = 8.0,
        radiusLg = 16.0,
        radiusXl = 24.0,
        radiusPill = 999.0,
        spacingXs = 4.0,
        spacingSm = 8.0,
        spacingMd = 16.0,
        spacingLg = 24.0,
        spacingXl = 32.0;

  factory SavvyShapes.fromTokens(TokenService tokens, SavvyShapes fallback) {
    double s(String key, double fallbackVal) {
      return tokens.getShape(key) ?? fallbackVal;
    }

    return SavvyShapes(
      radiusSm: s('radiusSm', fallback.radiusSm),
      radiusMd: s('radiusMd', fallback.radiusMd),
      radiusLg: s('radiusLg', fallback.radiusLg),
      radiusXl: s('radiusXl', fallback.radiusXl),
      radiusPill: s('radiusPill', fallback.radiusPill),
      spacingXs: s('spacingXs', fallback.spacingXs),
      spacingSm: s('spacingSm', fallback.spacingSm),
      spacingMd: s('spacingMd', fallback.spacingMd),
      spacingLg: s('spacingLg', fallback.spacingLg),
      spacingXl: s('spacingXl', fallback.spacingXl),
    );
  }
}

// ==============================================================================
// 3. MOTION (ANTIGRAVITY PHYSICS)
// ==============================================================================
@immutable
class SavvyMotion {
  final Duration durationFast;
  final Duration durationMedium;
  final Duration durationSlow;

  final Curve curveDefault;
  final Curve curveBounce;
  final Curve curveFluid;
  final Curve curveElastic;
  final Curve curveSpring;

  const SavvyMotion({
    required this.durationFast,
    required this.durationMedium,
    required this.durationSlow,
    required this.curveDefault,
    required this.curveBounce,
    required this.curveFluid,
    required this.curveElastic,
    required this.curveSpring,
  });

  const SavvyMotion.regular()
      : durationFast =
            const Duration(milliseconds: 100), // snappy micro-interactions
        durationMedium = const Duration(
            milliseconds: 150), // fast transitions (tabs, sheets)
        durationSlow =
            const Duration(milliseconds: 200), // max speed for large dialogs

        // Standard Cubic
        curveDefault = const Cubic(0.4, 0.0, 0.2, 1),
        // Bouncy Spring (Antigravity feel)
        curveBounce = const Cubic(0.34, 1.56, 0.64, 1.0),
        // Fluid easing
        curveFluid = const Cubic(0.25, 0.46, 0.45, 0.94),
        // Elastic for Cart Pop
        curveElastic = Curves.elasticOut,
        // Gentle Spring for micro-interactions
        curveSpring = const SpringCurve(0.9, 0.6, 20);

  factory SavvyMotion.fromTokens(TokenService tokens, SavvyMotion fallback) {
    Duration d(String key, Duration fallbackVal) {
      final ms = tokens.getDuration(key);
      if (ms != null) return Duration(milliseconds: ms);
      return fallbackVal;
    }

    // Note: Curves are hard to serialize in JSON completely without a complex parser.
    // We will stick to durations from JSON for now, and keep curves hardcoded or string-mapped if needed later.
    return SavvyMotion(
      durationFast: d('durationFast', fallback.durationFast),
      durationMedium: d('durationMedium', fallback.durationMedium),
      durationSlow: d('durationSlow', fallback.durationSlow),
      curveDefault: fallback.curveDefault,
      curveBounce: fallback.curveBounce,
      curveFluid: fallback.curveFluid,
      curveElastic: fallback.curveElastic,
      curveSpring: fallback.curveSpring,
    );
  }
}

// Simple Spring Curve Class helper if needed, or use predefined
class SpringCurve extends Curve {
  final double damping;
  final double stiffness;
  final double mass;

  const SpringCurve(this.damping, this.stiffness, this.mass);

  @override
  double transformInternal(double t) {
    // Simplified spring simulation or use standard Curves.bounceOut / elasticOut for easier maintainability if custom math is too heavy
    // For now, let's map this to a well-known flutter curve to ensure stability,
    // or we can implement real physics simulation but Curve expects a mapping 0..1
    // Actually, let's use a standard confident curve for "Spring" to avoid complexity overhead
    return Curves.easeOutBack.transform(t);
  }
}

// ==============================================================================
// 4. ELEVATION (SHADOWS)
// ==============================================================================
@immutable
class SavvyElevations {
  final List<BoxShadow> none;
  final List<BoxShadow> sm;
  final List<BoxShadow> md;
  final List<BoxShadow> lg;
  final List<BoxShadow> floating;

  const SavvyElevations({
    required this.none,
    required this.sm,
    required this.md,
    required this.lg,
    required this.floating,
  });

  factory SavvyElevations.light() => const SavvyElevations(
        none: [],
        sm: [
          BoxShadow(
              color: Color(0x0D000000), offset: Offset(0, 1), blurRadius: 2)
        ],
        md: [
          BoxShadow(
              color: Color(0x1A000000),
              offset: Offset(0, 4),
              blurRadius: 6,
              spreadRadius: -1)
        ],
        lg: [
          BoxShadow(
              color: Color(0x1A000000),
              offset: Offset(0, 10),
              blurRadius: 15,
              spreadRadius: -3)
        ],
        // The "Stitch" Floating Effect
        floating: [
          BoxShadow(
              color: Color(0x26000000),
              offset: Offset(0, 20),
              blurRadius: 25,
              spreadRadius: -5)
        ],
      );

  factory SavvyElevations.dark() => const SavvyElevations(
        none: [],
        sm: [
          BoxShadow(
              color: Color(0x40000000), offset: Offset(0, 1), blurRadius: 2)
        ],
        md: [
          BoxShadow(
              color: Color(0x66000000),
              offset: Offset(0, 4),
              blurRadius: 6,
              spreadRadius: -1)
        ],
        lg: [
          BoxShadow(
              color: Color(0x80000000),
              offset: Offset(0, 10),
              blurRadius: 15,
              spreadRadius: -3)
        ],
        floating: [
          BoxShadow(
              color: Color(0x99000000),
              offset: Offset(0, 20),
              blurRadius: 25,
              spreadRadius: -5)
        ],
      );

  SavvyElevations lerp(SavvyElevations other, double t) {
    return SavvyElevations(
      none: other.none,
      sm: BoxShadow.lerpList(sm, other.sm, t)!,
      md: BoxShadow.lerpList(md, other.md, t)!,
      lg: BoxShadow.lerpList(lg, other.lg, t)!,
      floating: BoxShadow.lerpList(floating, other.floating, t)!,
    );
  }

  factory SavvyElevations.fromTokens(
      TokenService tokens, SavvyElevations fallback) {
    List<BoxShadow> e(String key, List<BoxShadow> fallbackVal) {
      final data = tokens.getElevation(key);
      if (data != null) {
        try {
          return [
            BoxShadow(
              color: HexColor.fromHex(data['color'] ?? '#000000'),
              offset: Offset(0, (data['y'] as num).toDouble()),
              blurRadius: (data['blur'] as num).toDouble(),
              spreadRadius: (data['spread'] as num).toDouble(),
            )
          ];
        } catch (_) {
          return fallbackVal;
        }
      }
      return fallbackVal;
    }

    return SavvyElevations(
      none: [],
      sm: e('sm', fallback.sm),
      md: e('md', fallback.md),
      lg: e('lg', fallback.lg),
      floating: e('floating', fallback.floating),
    );
  }

  List<BoxShadow> get xs => sm; // Alias
}

// ==============================================================================
// 5. BUILD CONTEXT EXTENSION (SHORTCUT)
// ==============================================================================
extension SavvyThemeContext on BuildContext {
  SavvyTheme get savvy => Theme.of(this).extension<SavvyTheme>()!;
}
