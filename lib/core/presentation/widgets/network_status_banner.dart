import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

// ─────────────────────────────────────────────────────────────────────────────
// NetworkStatusBanner
//
// A 24px-tall ribbon that sits at the very top of the app shell.
// It does NOT shift the UI below — it animates in/out with AnimatedSize
// so the content area only moves by the banner's natural height, smoothly.
//
// States:
//   ONLINE      → invisible (height = 0, no layout impact)
//   OFFLINE     → amber ribbon with pulse animation
//   BACK ONLINE → brief green flash for 2.5s, then auto-hides
// ─────────────────────────────────────────────────────────────────────────────

enum _BannerState { hidden, offline, backOnline }

class NetworkStatusBanner extends StatefulWidget {
  const NetworkStatusBanner({super.key});

  @override
  State<NetworkStatusBanner> createState() => _NetworkStatusBannerState();
}

class _NetworkStatusBannerState extends State<NetworkStatusBanner> {
  late StreamSubscription<List<ConnectivityResult>> _subscription;
  _BannerState _state = _BannerState.hidden;
  Timer? _hideTimer;

  @override
  void initState() {
    super.initState();
    // Check initial state
    Connectivity().checkConnectivity().then(_updateStatus);
    // Listen for changes
    _subscription = Connectivity().onConnectivityChanged.listen(_updateStatus);
  }

  void _updateStatus(List<ConnectivityResult> results) {
    if (!mounted) return;
    final isOffline =
        results.isEmpty || results.every((r) => r == ConnectivityResult.none);

    setState(() {
      if (isOffline) {
        // Cancel any pending hide timer when going offline
        _hideTimer?.cancel();
        _state = _BannerState.offline;
      } else if (_state == _BannerState.offline) {
        // Was offline → now back online: flash green for 2.5s then hide
        _state = _BannerState.backOnline;
        _hideTimer?.cancel();
        _hideTimer = Timer(const Duration(milliseconds: 2500), () {
          if (mounted) setState(() => _state = _BannerState.hidden);
        });
      }
      // If was already hidden → stay hidden (normal startup/reconnect with no prior offline)
    });
  }

  @override
  void dispose() {
    _subscription.cancel();
    _hideTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // AnimatedSize handles the height transition — no jarring layout jumps
    return AnimatedSize(
      duration: const Duration(milliseconds: 280),
      curve: Curves.easeOutCubic,
      child: _state == _BannerState.hidden
          ? const SizedBox.shrink()
          : _BannerContent(state: _state),
    );
  }
}

class _BannerContent extends StatelessWidget {
  final _BannerState state;
  const _BannerContent({required this.state});

  @override
  Widget build(BuildContext context) {
    final isOffline = state == _BannerState.offline;

    // Colors
    final bgColor = isOffline
        ? const Color(0xFFF59E0B) // Amber-500 — visible but not alarming
        : const Color(0xFF10B981); // Emerald-500 — "back online" green
    const textColor = Color(0xFF1A1A1A); // Dark text on colored bg

    final icon = isOffline ? Icons.wifi_off_rounded : Icons.wifi_rounded;
    final label = isOffline
        ? 'Mode Offline — Transaksi Disimpan Lokal'
        : 'Koneksi Pulih — Sinkronisasi Otomatis';

    Widget content = Container(
      width: double.infinity,
      height: 24,
      color: bgColor,
      alignment: Alignment.center,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 13, color: textColor),
          const SizedBox(width: 6),
          Text(
            label,
            style: const TextStyle(
              color: textColor,
              fontWeight: FontWeight.w700,
              fontSize: 11,
              letterSpacing: 0.3,
            ),
          ),
        ],
      ),
    );

    // Offline: subtle left-right pulse to attract attention without being obnoxious
    if (isOffline) {
      content = content
          .animate(onPlay: (c) => c.repeat(reverse: true))
          .shimmer(
            duration: 2000.ms,
            color: Colors.white.withValues(alpha: 0.15),
          );
    }

    // Both states slide in from top when they appear
    return content
        .animate()
        .slideY(begin: -1.0, end: 0, duration: 280.ms, curve: Curves.easeOutCubic)
        .fadeIn(duration: 200.ms);
  }
}
