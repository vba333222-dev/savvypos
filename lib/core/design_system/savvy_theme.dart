import 'package:flutter/material.dart';
import 'package:savvy_pos/core/design_system/theme_config.dart';

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

  // Factory to create from Config
  factory SavvyTheme.fromConfig(SavvyThemeConfig config) {
    return SavvyTheme(
      colors: config.colors,
      shapes: config.shapes,
      motion: config.motion,
      elevations: config.elevations,
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
    if (other is! SavvyTheme) {
      return this;
    }
    // We don't really want to lerp design tokens usually, but if needed:
    // For now, return other if t > 0.5
    return t < 0.5 ? this : other;
  }
}

// Extension to allow `context.savvy`
extension SavvyContext on BuildContext {
  SavvyTheme get savvy {
    final theme = Theme.of(this).extension<SavvyTheme>();
    if (theme == null) {
      throw UnimplementedError(
        'SavvyTheme is not added to the MaterialApp theme extensions.',
      );
    }
    return theme;
  }
}
