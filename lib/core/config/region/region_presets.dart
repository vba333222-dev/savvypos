import 'package:flutter/material.dart';

class RegionPreset {
  final String id;
  final String name;
  final String flagEmoji;
  final Locale locale;
  final String currencySymbol;
  final double defaultTaxRate;

  const RegionPreset({
    required this.id,
    required this.name,
    required this.flagEmoji,
    required this.locale,
    required this.currencySymbol,
    required this.defaultTaxRate,
  });
}

class RegionPresets {
  static const List<RegionPreset> all = [
    RegionPreset(
        id: 'ID',
        name: 'Indonesia',
        flagEmoji: '🇮🇩',
        locale: Locale('id'),
        currencySymbol: 'Rp',
        defaultTaxRate: 0.11),
    RegionPreset(
        id: 'US',
        name: 'Global (English)',
        flagEmoji: '🌍',
        locale: Locale('en'),
        currencySymbol: '\$',
        defaultTaxRate: 0.10),
    RegionPreset(
        id: 'MY',
        name: 'Malaysia',
        flagEmoji: '🇲🇾',
        locale: Locale('ms'),
        currencySymbol: 'RM',
        defaultTaxRate: 0.06),
    RegionPreset(
        id: 'TH',
        name: 'Thailand',
        flagEmoji: '🇹🇭',
        locale: Locale('th'),
        currencySymbol: '฿',
        defaultTaxRate: 0.07),
    RegionPreset(
        id: 'VN',
        name: 'Vietnam',
        flagEmoji: '🇻🇳',
        locale: Locale('vi'),
        currencySymbol: '₫',
        defaultTaxRate: 0.10),
    RegionPreset(
        id: 'PH',
        name: 'Philippines',
        flagEmoji: '🇵🇭',
        locale: Locale('fil'),
        currencySymbol: '₱',
        defaultTaxRate: 0.12),
    RegionPreset(
        id: 'CN',
        name: 'China',
        flagEmoji: '🇨🇳',
        locale: Locale('zh'),
        currencySymbol: '¥',
        defaultTaxRate: 0.13),
    RegionPreset(
        id: 'JP',
        name: 'Japan',
        flagEmoji: '🇯🇵',
        locale: Locale('ja'),
        currencySymbol: '¥',
        defaultTaxRate: 0.10),
    RegionPreset(
        id: 'KR',
        name: 'Korea',
        flagEmoji: '🇰🇷',
        locale: Locale('ko'),
        currencySymbol: '₩',
        defaultTaxRate: 0.10),
  ];

  static RegionPreset getById(String id) {
    return all.firstWhere((r) => r.id == id,
        orElse: () => all[1]); // Default to Global
  }
}
