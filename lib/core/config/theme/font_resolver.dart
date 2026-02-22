import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FontResolver {
  static TextTheme resolve(Locale locale, TextTheme baseTheme) {
    if (locale.languageCode == 'th') {
      return GoogleFonts.promptTextTheme(baseTheme);
    } else if (locale.languageCode == 'zh') {
      return GoogleFonts.notoSansScTextTheme(baseTheme);
    } else if (locale.languageCode == 'ja') {
      return GoogleFonts.notoSansJpTextTheme(baseTheme);
    } else if (locale.languageCode == 'ko') {
      return GoogleFonts.notoSansKrTextTheme(baseTheme);
    } else if (locale.languageCode == 'ms' ||
        locale.languageCode == 'id' ||
        locale.languageCode == 'vi' ||
        locale.languageCode == 'fil') {
      return GoogleFonts.poppinsTextTheme(baseTheme);
    }
    // Default
    return GoogleFonts.poppinsTextTheme(baseTheme);
  }

  static String? getFontFamily(Locale locale) {
    if (locale.languageCode == 'th') return GoogleFonts.prompt().fontFamily;
    if (locale.languageCode == 'zh') return GoogleFonts.notoSansSc().fontFamily;
    if (locale.languageCode == 'ja') return GoogleFonts.notoSansJp().fontFamily;
    if (locale.languageCode == 'ko') return GoogleFonts.notoSansKr().fontFamily;
    return GoogleFonts.poppins().fontFamily;
  }
}
