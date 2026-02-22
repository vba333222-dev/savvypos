import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:savvy_pos/core/config/theme/savvy_theme.dart';

enum SavvyTextStyle {
  h1,
  h2,
  h3,
  h4,
  h5,
  bodyLarge,
  bodyMedium,
  bodySmall,
  labelLarge,
  labelMedium,
  labelSmall,
  // Compatibility Aliases
  bodyLg,
  bodySm,
  label, // Alias for labelMedium
  labelLg,
}

extension SavvyTextStyleX on SavvyTextStyle {
  TextStyle get style {
    switch (this) {
      case SavvyTextStyle.h1:
        return GoogleFonts.outfit(
            fontSize: 32, fontWeight: FontWeight.bold, height: 1.2);
      case SavvyTextStyle.h2:
        return GoogleFonts.outfit(
            fontSize: 24, fontWeight: FontWeight.w600, height: 1.3);
      case SavvyTextStyle.h3:
        return GoogleFonts.outfit(
            fontSize: 20, fontWeight: FontWeight.w600, height: 1.4);
      case SavvyTextStyle.h4:
        return GoogleFonts.outfit(
            fontSize: 18, fontWeight: FontWeight.w600, height: 1.4);
      case SavvyTextStyle.h5:
        return GoogleFonts.outfit(
            fontSize: 16, fontWeight: FontWeight.w600, height: 1.5);
      case SavvyTextStyle.bodyLarge:
      case SavvyTextStyle.bodyLg:
        return GoogleFonts.inter(
            fontSize: 16, fontWeight: FontWeight.normal, height: 1.5);
      case SavvyTextStyle.bodyMedium:
        return GoogleFonts.inter(
            fontSize: 14, fontWeight: FontWeight.normal, height: 1.5);
      case SavvyTextStyle.bodySmall:
      case SavvyTextStyle.bodySm:
        return GoogleFonts.inter(
            fontSize: 12, fontWeight: FontWeight.normal, height: 1.5);
      case SavvyTextStyle.labelLarge:
      case SavvyTextStyle.label: // Alias check
      case SavvyTextStyle.labelLg:
        return GoogleFonts.inter(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.1,
            height: 1.2);
      case SavvyTextStyle.labelMedium:
        return GoogleFonts.inter(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.5,
            height: 1.2);
      case SavvyTextStyle.labelSmall:
        return GoogleFonts.inter(
            fontSize: 10,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.5,
            height: 1.2);
    }
  }

  TextStyle copyWith({
    bool? inherit,
    Color? color,
    Color? backgroundColor,
    double? fontSize,
    FontWeight? fontWeight,
    FontStyle? fontStyle,
    double? letterSpacing,
    double? wordSpacing,
    TextBaseline? textBaseline,
    double? height,
    Locale? locale,
    Paint? foreground,
    Paint? background,
    List<Shadow>? shadows,
    List<FontFeature>? fontFeatures,
    TextDecoration? decoration,
    Color? decorationColor,
    TextDecorationStyle? decorationStyle,
    double? decorationThickness,
    String? debugLabel,
    String? fontFamily,
    List<String>? fontFamilyFallback,
    String? package,
    TextOverflow? overflow,
  }) {
    return style.copyWith(
      inherit: inherit,
      color: color,
      backgroundColor: backgroundColor,
      fontSize: fontSize,
      fontWeight: fontWeight,
      fontStyle: fontStyle,
      letterSpacing: letterSpacing,
      wordSpacing: wordSpacing,
      textBaseline: textBaseline,
      height: height,
      locale: locale,
      foreground: foreground,
      background: background,
      shadows: shadows,
      fontFeatures: fontFeatures,
      decoration: decoration,
      decorationColor: decorationColor,
      decorationStyle: decorationStyle,
      decorationThickness: decorationThickness,
      debugLabel: debugLabel,
      fontFamily: fontFamily,
      fontFamilyFallback: fontFamilyFallback,
      package: package,
      overflow: overflow,
    );
  }
}

class SavvyText extends StatelessWidget {
  final String text;
  final SavvyTextStyle style;
  final TextStyle? textStyle; // Custom override
  final Color? color;
  final TextAlign? align;
  final int? maxLines;
  final TextOverflow? overflow;

  const SavvyText(
    this.text, {
    super.key,
    this.style = SavvyTextStyle.bodyMedium,
    this.textStyle,
    this.color,
    this.align,
    this.maxLines,
    this.overflow,
  });

  const SavvyText.h1(this.text,
      {super.key,
      this.textStyle,
      this.color,
      this.align,
      this.maxLines,
      this.overflow})
      : style = SavvyTextStyle.h1;
  const SavvyText.h2(this.text,
      {super.key,
      this.textStyle,
      this.color,
      this.align,
      this.maxLines,
      this.overflow})
      : style = SavvyTextStyle.h2;
  const SavvyText.h3(this.text,
      {super.key,
      this.textStyle,
      this.color,
      this.align,
      this.maxLines,
      this.overflow})
      : style = SavvyTextStyle.h3;
  const SavvyText.h4(this.text,
      {super.key,
      this.textStyle,
      this.color,
      this.align,
      this.maxLines,
      this.overflow})
      : style = SavvyTextStyle.h4;
  const SavvyText.h5(this.text,
      {super.key,
      this.textStyle,
      this.color,
      this.align,
      this.maxLines,
      this.overflow})
      : style = SavvyTextStyle.h5;

  const SavvyText.body(this.text,
      {super.key,
      this.textStyle,
      this.color,
      this.align,
      this.maxLines,
      this.overflow})
      : style = SavvyTextStyle.bodyMedium;
  const SavvyText.label(this.text,
      {super.key,
      this.textStyle,
      this.color,
      this.align,
      this.maxLines,
      this.overflow})
      : style = SavvyTextStyle.labelMedium;
  const SavvyText.small(this.text,
      {super.key,
      this.textStyle,
      this.color,
      this.align,
      this.maxLines,
      this.overflow})
      : style = SavvyTextStyle.bodySmall;

  @override
  Widget build(BuildContext context) {
    final theme = context.savvy;
    final defaultColor = theme.colors.textPrimary;

    TextStyle textStyle;

    switch (style) {
      case SavvyTextStyle.h1:
        textStyle = GoogleFonts.outfit(
          fontSize: 32,
          fontWeight: FontWeight.bold,
          height: 1.2,
        );
        break;
      case SavvyTextStyle.h2:
        textStyle = GoogleFonts.outfit(
          fontSize: 24,
          fontWeight: FontWeight.w600,
          height: 1.3,
        );
        break;
      case SavvyTextStyle.h3:
        textStyle = GoogleFonts.outfit(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          height: 1.4,
        );
        break;
      case SavvyTextStyle.h4:
        textStyle = GoogleFonts.outfit(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          height: 1.4,
        );
        break;
      case SavvyTextStyle.h5:
        textStyle = GoogleFonts.outfit(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          height: 1.5,
        );
        break;
      case SavvyTextStyle.bodyLarge:
        textStyle = GoogleFonts.inter(
          fontSize: 16,
          fontWeight: FontWeight.normal,
          height: 1.5,
        );
        break;
      case SavvyTextStyle.bodyMedium:
        textStyle = GoogleFonts.inter(
          fontSize: 14,
          fontWeight: FontWeight.normal,
          height: 1.5,
        );
        break;
      case SavvyTextStyle.bodySmall:
        textStyle = GoogleFonts.inter(
          fontSize: 12,
          fontWeight: FontWeight.normal,
          height: 1.5,
        );
        break;
      case SavvyTextStyle.labelLarge:
        textStyle = GoogleFonts.inter(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.1,
          height: 1.2,
        );
        break;
      case SavvyTextStyle.labelMedium:
        textStyle = GoogleFonts.inter(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.5,
          height: 1.2,
        );
        break;
      case SavvyTextStyle.labelSmall:
        textStyle = GoogleFonts.inter(
          fontSize: 10,
          fontWeight: FontWeight.bold,
          letterSpacing: 0.5,
          height: 1.2,
        );
        break;
      // Compatibility Aliases - Mapping to existing styles
      case SavvyTextStyle.bodyLg:
        textStyle = GoogleFonts.inter(
            fontSize: 16, fontWeight: FontWeight.normal, height: 1.5);
        break;
      case SavvyTextStyle.bodySm:
        textStyle = GoogleFonts.inter(
            fontSize: 12, fontWeight: FontWeight.normal, height: 1.5);
        break;
      case SavvyTextStyle.label:
        textStyle = GoogleFonts.inter(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.5,
            height: 1.2);
        break;
      case SavvyTextStyle.labelLg:
        textStyle = GoogleFonts.inter(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.1,
            height: 1.2);
        break;
    }

    final finalStyle = textStyle
        .merge(this.textStyle)
        .copyWith(color: color ?? this.textStyle?.color ?? defaultColor);

    return Text(
      text,
      style: finalStyle,
      textAlign: align,
      maxLines: maxLines,
      overflow: overflow,
    );
  }
}
