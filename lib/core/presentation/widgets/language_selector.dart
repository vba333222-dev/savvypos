import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:savvy_pos/core/config/theme/savvy_theme.dart';
import 'package:savvy_pos/core/presentation/widgets/savvy_text.dart';

class LanguageSelector extends StatefulWidget {
  const LanguageSelector({super.key});

  @override
  State<LanguageSelector> createState() => _LanguageSelectorState();
}

class _LanguageSelectorState extends State<LanguageSelector> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final currentLocale = context.locale;
    
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onTap: () {
            setState(() => _isExpanded = !_isExpanded);
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: context.savvy.colors.bgSurface,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: context.savvy.colors.border),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildFlag(currentLocale.languageCode),
                const SizedBox(width: 8),
                SavvyText.body(currentLocale.languageCode == 'en' ? 'English' : 'Bahasa'),
                const SizedBox(width: 4),
                Icon(_isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down, size: 16),
              ],
            ),
          ),
        ),
        
        // Expanded Options
        if (_isExpanded)
          Container(
            margin: const EdgeInsets.only(top: 8),
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: context.savvy.colors.bgSurface,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.1), blurRadius: 10)],
            ),
            child: Column(
              children: [
                _buildOption(context, 'en', 'English'),
                const Divider(height: 1),
                _buildOption(context, 'id', 'Bahasa'),
              ],
            ),
          ).animate().fadeIn().scaleY(alignment: Alignment.topCenter),
      ],
    );
  }

  Widget _buildOption(BuildContext context, String code, String label) {
    return InkWell(
      onTap: () async {
        setState(() => _isExpanded = false);
        await context.setLocale(Locale(code));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildFlag(code),
            const SizedBox(width: 8),
            Text(label, style: TextStyle(fontWeight: context.locale.languageCode == code ? FontWeight.bold : FontWeight.normal)),
          ],
        ),
      ),
    );
  }

  Widget _buildFlag(String code) {
    // Simple Emoji Flags for MVP
    return Text(code == 'en' ? '🇺🇸' : '🇮🇩', style: const TextStyle(fontSize: 20));
  }
}
