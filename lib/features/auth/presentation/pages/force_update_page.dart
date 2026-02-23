import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:savvy_pos/core/config/theme/savvy_theme.dart';

class ForceUpdatePage extends StatelessWidget {
  const ForceUpdatePage({super.key});

  Future<void> _openPlayStore() async {
    // Attempting internal market intent first
    final Uri url = Uri.parse('market://details?id=com.savvy.pos');
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } else {
      // Fallback to web URL
      final Uri webUrl = Uri.parse('https://play.google.com/store/apps/details?id=com.savvy.pos');
      await launchUrl(webUrl, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<SavvyTheme>()!;
    
    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: theme.colors.bgPrimary,
        body: Center(
          child: Container(
            constraints: const BoxConstraints(maxWidth: 500),
            padding: const EdgeInsets.all(32.0),
            decoration: BoxDecoration(
              color: theme.colors.bgElevated,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.1),
                  blurRadius: 20,
                  offset: const Offset(0, 10),
                )
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Lottie.network(
                  'https://lottie.host/76cc89d4-c9f2-4ed0-b0ad-ec60d024d2fe/f82VvH72dJ.json', // simple update animation placeholder
                  height: 200,
                  width: 200,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) =>
                      Icon(Icons.system_update, size: 100, color: theme.colors.brandPrimary),
                ),
                const SizedBox(height: 24),
                Text(
                  'Pembaruan Diperlukan',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: theme.colors.textPrimary,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                Text(
                  'Sistem Anda Usang. Demi keamanan, mohon perbarui aplikasi.',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: theme.colors.textSecondary,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 32),
                SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: ElevatedButton(
                    onPressed: _openPlayStore,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: theme.colors.brandPrimary,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 0,
                    ),
                    child: const Text(
                      'Buka PlayStore',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
