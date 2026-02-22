class SmartCashHelper {
  static List<double> generateSuggestions(double total) {
    final Set<double> suggestions = {};

    // 1. Exact amount
    suggestions.add(total);

    // Adaptive Magnitude Logic
    if (total < 1000) {
      // "Dollar/Euro" Mode (Small Denominations)
      // Next $1
      if (total % 1 != 0) suggestions.add(total.ceilToDouble());
      // Next $5
      if (total % 5 != 0) suggestions.add(((total / 5).ceil() * 5).toDouble());
      // Next $10
      if (total % 10 != 0)
        suggestions.add(((total / 10).ceil() * 10).toDouble());
      // Next $20
      if (total % 20 != 0)
        suggestions.add(((total / 20).ceil() * 20).toDouble());
      // Next $50
      if (total % 50 != 0)
        suggestions.add(((total / 50).ceil() * 50).toDouble());
      // Next $100
      if (total % 100 != 0)
        suggestions.add(((total / 100).ceil() * 100).toDouble());
    } else {
      // "Rupiah/Yen" Mode (Large Denominations)
      // Next 1k
      suggestions.add(((total / 1000).ceil() * 1000).toDouble());
      // Next 5k
      suggestions.add(((total / 5000).ceil() * 5000).toDouble());
      // Next 10k
      suggestions.add(((total / 10000).ceil() * 10000).toDouble());
      // Next 50k
      suggestions.add(((total / 50000).ceil() * 50000).toDouble());
      // Next 100k
      suggestions.add(((total / 100000).ceil() * 100000).toDouble());
    }

    // Filter, Sort, Deduplicate
    final sorted = suggestions
        .where((s) => s >= total)
        .toSet() // Dedupe
        .toList()
      ..sort();

    // Return Top 4 unique suggestions taking the smallest viable ones
    return sorted.take(4).toList();
  }
}
