import 'package:flutter/painting.dart';
import 'package:json_annotation/json_annotation.dart';

part 'theme_config.g.dart';

@JsonSerializable(explicitToJson: true)
class SavvyThemeConfig {
  final SavvyColors colors;
  final SavvyShapes shapes;
  final SavvyMotion motion;
  final SavvyElevations elevations;

  const SavvyThemeConfig({
    required this.colors,
    required this.shapes,
    required this.motion,
    required this.elevations,
  });

  factory SavvyThemeConfig.fromJson(Map<String, dynamic> json) =>
      _$SavvyThemeConfigFromJson(json);

  Map<String, dynamic> toJson() => _$SavvyThemeConfigToJson(this);
}

@JsonSerializable()
class SavvyColors {
  @JsonKey(fromJson: _colorFromJson, toJson: _colorToJson)
  final Color brandPrimary;
  @JsonKey(fromJson: _colorFromJson, toJson: _colorToJson)
  final Color brandSecondary;
  @JsonKey(fromJson: _colorFromJson, toJson: _colorToJson)
  final Color brandAccent;
  @JsonKey(fromJson: _colorFromJson, toJson: _colorToJson)
  final Color bgPrimary;
  @JsonKey(fromJson: _colorFromJson, toJson: _colorToJson)
  final Color bgSecondary;
  @JsonKey(fromJson: _colorFromJson, toJson: _colorToJson)
  final Color bgElevated;
  @JsonKey(fromJson: _colorFromJson, toJson: _colorToJson)
  final Color textPrimary;
  @JsonKey(fromJson: _colorFromJson, toJson: _colorToJson)
  final Color textSecondary;
  @JsonKey(fromJson: _colorFromJson, toJson: _colorToJson)
  final Color textMuted;
  @JsonKey(fromJson: _colorFromJson, toJson: _colorToJson)
  final Color textInverse;
  @JsonKey(fromJson: _colorFromJson, toJson: _colorToJson)
  final Color borderDefault;
  @JsonKey(fromJson: _colorFromJson, toJson: _colorToJson)
  final Color stateSuccess;
  @JsonKey(fromJson: _colorFromJson, toJson: _colorToJson)
  final Color stateError;
  @JsonKey(fromJson: _colorFromJson, toJson: _colorToJson)
  final Color stateWarning;

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
  });

  factory SavvyColors.fromJson(Map<String, dynamic> json) =>
      _$SavvyColorsFromJson(json);
  Map<String, dynamic> toJson() => _$SavvyColorsToJson(this);

  static Color _colorFromJson(String hex) {
    hex = hex.replaceAll('#', '');
    if (hex.length == 6) {
      hex = 'FF$hex';
    }
    return Color(int.parse(hex, radix: 16));
  }

  static String _colorToJson(Color color) {
    return '#${color.toARGB32().toRadixString(16).padLeft(8, '0').substring(2)}';
  }
}

@JsonSerializable()
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

  factory SavvyShapes.fromJson(Map<String, dynamic> json) =>
      _$SavvyShapesFromJson(json);
  Map<String, dynamic> toJson() => _$SavvyShapesToJson(this);
}

@JsonSerializable()
class SavvyMotion {
  @JsonKey(fromJson: _durationFromJson, toJson: _durationToJson)
  final Duration durationFast;
  @JsonKey(fromJson: _durationFromJson, toJson: _durationToJson)
  final Duration durationMedium;
  @JsonKey(fromJson: _durationFromJson, toJson: _durationToJson)
  final Duration durationSlow;

  const SavvyMotion({
    required this.durationFast,
    required this.durationMedium,
    required this.durationSlow,
  });

  factory SavvyMotion.fromJson(Map<String, dynamic> json) =>
      _$SavvyMotionFromJson(json);
  Map<String, dynamic> toJson() => _$SavvyMotionToJson(this);

  static Duration _durationFromJson(int ms) => Duration(milliseconds: ms);
  static int _durationToJson(Duration d) => d.inMilliseconds;
}

@JsonSerializable(explicitToJson: true)
class SavvyElevations {
  final SavvyShadow sm;
  final SavvyShadow md;
  final SavvyShadow lg;
  final SavvyShadow floating;

  const SavvyElevations({
    required this.sm,
    required this.md,
    required this.lg,
    required this.floating,
  });

  factory SavvyElevations.fromJson(Map<String, dynamic> json) =>
      _$SavvyElevationsFromJson(json);
  Map<String, dynamic> toJson() => _$SavvyElevationsToJson(this);
}

@JsonSerializable()
class SavvyShadow {
  @JsonKey(
      fromJson: SavvyColors._colorFromJson, toJson: SavvyColors._colorToJson)
  final Color color;
  final double y;
  final double blur;
  final double spread;

  const SavvyShadow({
    required this.color,
    required this.y,
    required this.blur,
    required this.spread,
  });

  factory SavvyShadow.fromJson(Map<String, dynamic> json) =>
      _$SavvyShadowFromJson(json);
  Map<String, dynamic> toJson() => _$SavvyShadowToJson(this);

  BoxShadow toBoxShadow() {
    return BoxShadow(
      color: color,
      offset: Offset(0, y),
      blurRadius: blur,
      spreadRadius: spread,
    );
  }
}
