import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ─────────────────────────────────────────────────────────────────────────────
// ThemeCubit — Single-source-of-truth for Light/Dark ThemeMode.
//
// Responsibilities:
//   1. Exposes ThemeMode state (light | dark)
//   2. On init: loads last saved preference from SharedPreferences
//   3. On toggle: writes new value to SharedPreferences synchronously
//      then emits, guaranteeing no lag between tap and screen change
//
// SharedPreferences key: 'savvy_theme_mode'
//   'dark'  → ThemeMode.dark
//   'light' → ThemeMode.light (default)
// ─────────────────────────────────────────────────────────────────────────────

const _kThemePrefKey = 'savvy_theme_mode';

class ThemeCubit extends Cubit<ThemeMode> {
  ThemeCubit() : super(ThemeMode.light);

  // ── Load saved preference on app start ─────────────────────────────────
  static Future<ThemeCubit> create() async {
    final prefs = await SharedPreferences.getInstance();
    final saved = prefs.getString(_kThemePrefKey);
    final initial = saved == 'dark' ? ThemeMode.dark : ThemeMode.light;
    return ThemeCubit()..emit(initial);
  }

  // ── Toggle and persist ──────────────────────────────────────────────────
  Future<void> toggle() async {
    final next = state == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    // Write to prefs BEFORE emitting — guarantees persistence even if
    // the app is killed immediately after the toggle
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_kThemePrefKey, next == ThemeMode.dark ? 'dark' : 'light');
    emit(next);
  }

  // ── Explicit setters (for settings page if needed) ──────────────────────
  Future<void> setLight() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_kThemePrefKey, 'light');
    emit(ThemeMode.light);
  }

  Future<void> setDark() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_kThemePrefKey, 'dark');
    emit(ThemeMode.dark);
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// ThemeToggleButton — Compact Sun/Moon icon for AppBar/NavigationRail.
//
// Reads ThemeCubit from context. No arguments required at call site:
//   const ThemeToggleButton()
// ─────────────────────────────────────────────────────────────────────────────
class ThemeToggleButton extends StatelessWidget {
  final bool compact; // true = icon only, false = icon + label
  const ThemeToggleButton({super.key, this.compact = true});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeMode>(
      builder: (context, mode) {
        final isDark = mode == ThemeMode.dark;
        final cubit = context.read<ThemeCubit>();

        return Tooltip(
          message: isDark ? 'Switch to Light Mode' : 'Switch to Dark Mode',
          child: GestureDetector(
            onTap: cubit.toggle,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeOutCubic,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              decoration: BoxDecoration(
                color: isDark
                    ? const Color(0xFF1E293B) // dark surface
                    : const Color(0xFFF1F5F9), // light surface
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: isDark
                      ? const Color(0xFF334155)
                      : const Color(0xFFCBD5E1),
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: 200),
                    transitionBuilder: (child, anim) =>
                        ScaleTransition(scale: anim, child: child),
                    child: Icon(
                      isDark ? Icons.dark_mode_rounded : Icons.light_mode_rounded,
                      key: ValueKey(isDark),
                      size: 18,
                      color: isDark
                          ? const Color(0xFF7AA2FF)  // blue-ish for night
                          : const Color(0xFFF59E0B), // amber for day
                    ),
                  ),
                  if (!compact) ...[
                    const SizedBox(width: 6),
                    AnimatedSwitcher(
                      duration: const Duration(milliseconds: 150),
                      child: Text(
                        isDark ? 'Dark' : 'Light',
                        key: ValueKey(isDark),
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: isDark
                              ? const Color(0xFF94A3B8)
                              : const Color(0xFF64748B),
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
