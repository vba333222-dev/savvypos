import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:savvy_pos/core/config/theme/savvy_theme.dart';

enum SavvyTextStyle {
  h1,
  h2,
  h3,
  bodyLarge,
  bodyMedium,
  bodySmall,
  label,
}

class SavvyText extends StatelessWidget {
  final String text;
  final SavvyTextStyle style;
  final Color? color;
  final TextAlign? align;
  final int? maxLines;
  final TextOverflow? overflow;

  const SavvyText(
    this.text, {
    super.key,
    this.style = SavvyTextStyle.bodyMedium,
    this.color,
    this.align,
    this.maxLines,
    this.overflow,
  });

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
      case SavvyTextStyle.label:
        textStyle = GoogleFonts.inter(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.5, // Slightly wider for labels
          height: 1.2,
        );
        break;
    }

    return Text(
      text,
      style: textStyle.copyWith(color: color ?? defaultColor),
      textAlign: align,
      maxLines: maxLines,
      overflow: overflow,
    );
  }
}
