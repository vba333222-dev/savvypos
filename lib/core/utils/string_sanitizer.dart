class StringSanitizer {
  /// Aggressively sanitizes a string for thermal ESC/POS printers.
  /// Removes Emojis, zalgo text, and unsupported Unicode characters.
  /// Retains basic ASCII (32-126) and common Latin-1 characters
  /// that are usually safe on Code Page 858 / 850.
  static String sanitizeForPrinter(String input) {
    if (input.isEmpty) return input;

    // Pattern matches:
    // - \n (Newline)
    // - \r (Carriage Return)
    // - [\x20-\x7E] (Standard printable ASCII: space to ~)
    // - [\xA0-\xFF] (Latin-1 Supplement: accented chars, currencies like £ ¥, etc.)
    // Anything OUTSIDE this range will be stripped out.
    final allowedChars = RegExp(r'[\n\r\x20-\x7E\xA0-\xFF]');

    final Iterable<Match> matches = allowedChars.allMatches(input);

    return matches.map((m) => m.group(0)).join('');
  }
}
