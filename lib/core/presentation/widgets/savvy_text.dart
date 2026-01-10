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
  // Compute style without context? Need GoogleFonts.
  // Actually simplest is to expose a helper or let SavvyText handle it.
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

  const SavvyText.h1(this.text, {super.key, this.textStyle, this.color, this.align, this.maxLines, this.overflow}) : style = SavvyTextStyle.h1;
  const SavvyText.h2(this.text, {super.key, this.textStyle, this.color, this.align, this.maxLines, this.overflow}) : style = SavvyTextStyle.h2;
  const SavvyText.h3(this.text, {super.key, this.textStyle, this.color, this.align, this.maxLines, this.overflow}) : style = SavvyTextStyle.h3;
  const SavvyText.h4(this.text, {super.key, this.textStyle, this.color, this.align, this.maxLines, this.overflow}) : style = SavvyTextStyle.h4; 
  const SavvyText.h5(this.text, {super.key, this.textStyle, this.color, this.align, this.maxLines, this.overflow}) : style = SavvyTextStyle.h5; 
  
  const SavvyText.body(this.text, {super.key, this.textStyle, this.color, this.align, this.maxLines, this.overflow}) : style = SavvyTextStyle.bodyMedium;
  const SavvyText.label(this.text, {super.key, this.textStyle, this.color, this.align, this.maxLines, this.overflow}) : style = SavvyTextStyle.labelMedium;
  const SavvyText.small(this.text, {super.key, this.textStyle, this.color, this.align, this.maxLines, this.overflow}) : style = SavvyTextStyle.bodySmall;

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
        textStyle = GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.normal, height: 1.5);
        break;
      case SavvyTextStyle.bodySm:
        textStyle = GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.normal, height: 1.5);
        break;
      case SavvyTextStyle.label:
        textStyle = GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.w600, letterSpacing: 0.5, height: 1.2);
        break;
      case SavvyTextStyle.labelLg:
        textStyle = GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w600, letterSpacing: 0.1, height: 1.2);
        break;
    }

    final finalStyle = textStyle.merge(this.textStyle).copyWith(color: color ?? this.textStyle?.color ?? defaultColor);

    return Text(
      text,
      style: finalStyle,
      textAlign: align,
      maxLines: maxLines,
      overflow: overflow,
    );
  }
}
