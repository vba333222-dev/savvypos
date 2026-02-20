// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'theme_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SavvyThemeConfig _$SavvyThemeConfigFromJson(Map<String, dynamic> json) =>
    SavvyThemeConfig(
      colors: SavvyColors.fromJson(json['colors'] as Map<String, dynamic>),
      shapes: SavvyShapes.fromJson(json['shapes'] as Map<String, dynamic>),
      motion: SavvyMotion.fromJson(json['motion'] as Map<String, dynamic>),
      elevations:
          SavvyElevations.fromJson(json['elevations'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SavvyThemeConfigToJson(SavvyThemeConfig instance) =>
    <String, dynamic>{
      'colors': instance.colors.toJson(),
      'shapes': instance.shapes.toJson(),
      'motion': instance.motion.toJson(),
      'elevations': instance.elevations.toJson(),
    };

SavvyColors _$SavvyColorsFromJson(Map<String, dynamic> json) => SavvyColors(
      brandPrimary: SavvyColors._colorFromJson(json['brandPrimary'] as String),
      brandSecondary:
          SavvyColors._colorFromJson(json['brandSecondary'] as String),
      brandAccent: SavvyColors._colorFromJson(json['brandAccent'] as String),
      bgPrimary: SavvyColors._colorFromJson(json['bgPrimary'] as String),
      bgSecondary: SavvyColors._colorFromJson(json['bgSecondary'] as String),
      bgElevated: SavvyColors._colorFromJson(json['bgElevated'] as String),
      textPrimary: SavvyColors._colorFromJson(json['textPrimary'] as String),
      textSecondary:
          SavvyColors._colorFromJson(json['textSecondary'] as String),
      textMuted: SavvyColors._colorFromJson(json['textMuted'] as String),
      textInverse: SavvyColors._colorFromJson(json['textInverse'] as String),
      borderDefault:
          SavvyColors._colorFromJson(json['borderDefault'] as String),
      stateSuccess: SavvyColors._colorFromJson(json['stateSuccess'] as String),
      stateError: SavvyColors._colorFromJson(json['stateError'] as String),
      stateWarning: SavvyColors._colorFromJson(json['stateWarning'] as String),
    );

Map<String, dynamic> _$SavvyColorsToJson(SavvyColors instance) =>
    <String, dynamic>{
      'brandPrimary': SavvyColors._colorToJson(instance.brandPrimary),
      'brandSecondary': SavvyColors._colorToJson(instance.brandSecondary),
      'brandAccent': SavvyColors._colorToJson(instance.brandAccent),
      'bgPrimary': SavvyColors._colorToJson(instance.bgPrimary),
      'bgSecondary': SavvyColors._colorToJson(instance.bgSecondary),
      'bgElevated': SavvyColors._colorToJson(instance.bgElevated),
      'textPrimary': SavvyColors._colorToJson(instance.textPrimary),
      'textSecondary': SavvyColors._colorToJson(instance.textSecondary),
      'textMuted': SavvyColors._colorToJson(instance.textMuted),
      'textInverse': SavvyColors._colorToJson(instance.textInverse),
      'borderDefault': SavvyColors._colorToJson(instance.borderDefault),
      'stateSuccess': SavvyColors._colorToJson(instance.stateSuccess),
      'stateError': SavvyColors._colorToJson(instance.stateError),
      'stateWarning': SavvyColors._colorToJson(instance.stateWarning),
    };

SavvyShapes _$SavvyShapesFromJson(Map<String, dynamic> json) => SavvyShapes(
      radiusSm: (json['radiusSm'] as num).toDouble(),
      radiusMd: (json['radiusMd'] as num).toDouble(),
      radiusLg: (json['radiusLg'] as num).toDouble(),
      radiusXl: (json['radiusXl'] as num).toDouble(),
      radiusPill: (json['radiusPill'] as num).toDouble(),
      spacingXs: (json['spacingXs'] as num).toDouble(),
      spacingSm: (json['spacingSm'] as num).toDouble(),
      spacingMd: (json['spacingMd'] as num).toDouble(),
      spacingLg: (json['spacingLg'] as num).toDouble(),
      spacingXl: (json['spacingXl'] as num).toDouble(),
    );

Map<String, dynamic> _$SavvyShapesToJson(SavvyShapes instance) =>
    <String, dynamic>{
      'radiusSm': instance.radiusSm,
      'radiusMd': instance.radiusMd,
      'radiusLg': instance.radiusLg,
      'radiusXl': instance.radiusXl,
      'radiusPill': instance.radiusPill,
      'spacingXs': instance.spacingXs,
      'spacingSm': instance.spacingSm,
      'spacingMd': instance.spacingMd,
      'spacingLg': instance.spacingLg,
      'spacingXl': instance.spacingXl,
    };

SavvyMotion _$SavvyMotionFromJson(Map<String, dynamic> json) => SavvyMotion(
      durationFast:
          SavvyMotion._durationFromJson((json['durationFast'] as num).toInt()),
      durationMedium: SavvyMotion._durationFromJson(
          (json['durationMedium'] as num).toInt()),
      durationSlow:
          SavvyMotion._durationFromJson((json['durationSlow'] as num).toInt()),
    );

Map<String, dynamic> _$SavvyMotionToJson(SavvyMotion instance) =>
    <String, dynamic>{
      'durationFast': SavvyMotion._durationToJson(instance.durationFast),
      'durationMedium': SavvyMotion._durationToJson(instance.durationMedium),
      'durationSlow': SavvyMotion._durationToJson(instance.durationSlow),
    };

SavvyElevations _$SavvyElevationsFromJson(Map<String, dynamic> json) =>
    SavvyElevations(
      sm: SavvyShadow.fromJson(json['sm'] as Map<String, dynamic>),
      md: SavvyShadow.fromJson(json['md'] as Map<String, dynamic>),
      lg: SavvyShadow.fromJson(json['lg'] as Map<String, dynamic>),
      floating: SavvyShadow.fromJson(json['floating'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SavvyElevationsToJson(SavvyElevations instance) =>
    <String, dynamic>{
      'sm': instance.sm.toJson(),
      'md': instance.md.toJson(),
      'lg': instance.lg.toJson(),
      'floating': instance.floating.toJson(),
    };

SavvyShadow _$SavvyShadowFromJson(Map<String, dynamic> json) => SavvyShadow(
      color: SavvyColors._colorFromJson(json['color'] as String),
      y: (json['y'] as num).toDouble(),
      blur: (json['blur'] as num).toDouble(),
      spread: (json['spread'] as num).toDouble(),
    );

Map<String, dynamic> _$SavvyShadowToJson(SavvyShadow instance) =>
    <String, dynamic>{
      'color': SavvyColors._colorToJson(instance.color),
      'y': instance.y,
      'blur': instance.blur,
      'spread': instance.spread,
    };
