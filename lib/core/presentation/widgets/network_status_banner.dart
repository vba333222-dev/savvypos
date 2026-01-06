import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:savvy_pos/core/config/theme_config.dart';
import 'package:savvy_pos/core/presentation/widgets/savvy_widgets.dart';

class NetworkStatusBanner extends StatefulWidget {
  const NetworkStatusBanner({super.key});

  @override
  State<NetworkStatusBanner> createState() => _NetworkStatusBannerState();
}

class _NetworkStatusBannerState extends State<NetworkStatusBanner> {
  late StreamSubscription<List<ConnectivityResult>> _subscription;
  bool _isOffline = false;

  @override
  void initState() {
    super.initState();
    // Start listening
    _subscription = Connectivity().onConnectivityChanged.listen((results) {
       _updateStatus(results);
    });
    // Check initial status
    Connectivity().checkConnectivity().then(_updateStatus);
  }

  void _updateStatus(List<ConnectivityResult> results) {
    // If ANY result is not 'none', we are good (for multi-interface devices)
    // Actually ConnectivityPlus returns List in v6.
    final isOffline = results.isEmpty || results.every((r) => r == ConnectivityResult.none);
    
    if (mounted && isOffline != _isOffline) {
      setState(() {
        _isOffline = isOffline;
      });
    }
  }

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!_isOffline) return const SizedBox.shrink();

    final theme = context.savvy;

    return Container(
      width: double.infinity,
      color: theme.colors.stateError,
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.wifi_off, color: theme.colors.textInverse, size: 16),
          const SizedBox(width: 8),
          Text(
            "OFFLINE MODE - Cash Payments Only",
            style: TextStyle(
              color: theme.colors.textInverse,
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
