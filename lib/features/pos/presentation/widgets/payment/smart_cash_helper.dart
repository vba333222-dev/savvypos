class SmartCashHelper {
  static List<double> generateSuggestions(double total) {
    final Set<double> suggestions = {};
    
    // 1. Exact amount
    suggestions.add(total);

    // 2. Next nearest "neat" numbers (ceil to nearest 1k, 5k, 10k, 50k, 100k)
    // Assuming currency is like IDR or generic decimal, but logic applies broadly.
    // However, usually for POS:
    // If 12,500 -> 15,000 (nearest 5k), 20,000 (nearest 10k), 50,000, 100,000.
    
    // Round up to nearest 5,000
    if (total % 5000 != 0) {
      suggestions.add(((total / 5000).ceil() * 5000).toDouble());
    }

    // Round up to nearest 10,000
    if (total % 10000 != 0) {
      suggestions.add(((total / 10000).ceil() * 10000).toDouble());
    }

    // Round up to nearest 50,000
    if (total <= 50000 && total % 50000 != 0) {
       suggestions.add(50000);
    } else if (total > 50000) {
       suggestions.add(((total / 50000).ceil() * 50000).toDouble());
    }

    // Round up to nearest 100,000
    if (total <= 100000 && total % 100000 != 0) {
       suggestions.add(100000);
    } else if (total > 100000) {
       suggestions.add(((total / 100000).ceil() * 100000).toDouble());
    }

    // Filter out values smaller or equal to total (except the exact match we added first)
    // Wait, suggestions should be >= total.
    
    final sorted = suggestions.where((s) => s >= total).toList()..sort();
    
    // Take max 4 suggestions
    return sorted.take(4).toList();
  }
}
