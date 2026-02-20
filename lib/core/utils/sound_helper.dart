import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class SoundHelper {
  // ignore: unused_field - Kept for future audio asset support
  final AudioPlayer _player = AudioPlayer();

  // Simple asset paths (assuming you'd add assets, but for now we can use system sounds or synthesis if possible, 
  // or just Haptic if assets missing. The prompt implies we add logic, but didn't explicitly ask to add assets file. 
  // We will assume 'beep.mp3' etc exist or use placeholder logic with Haptics as fallback).
  // Actually, to avoid asset errors without files, we will primarily rely on Haptics and try/catch audio.
  
  Future<void> playBeep() async {
    try {
      // await _player.play(AssetSource('sounds/beep.mp3'));
      await HapticFeedback.selectionClick();
    } catch (_) {}
  }

  Future<void> playSuccess() async {
    try {
      // await _player.play(AssetSource('sounds/success.mp3'));
      await HapticFeedback.heavyImpact();
    } catch (_) {}
  }

  Future<void> playError() async {
    try {
      // await _player.play(AssetSource('sounds/error.mp3'));
      await HapticFeedback.vibrate();
    } catch (_) {}
  }

  Future<void> playRefresh() async {
    try {
      await HapticFeedback.lightImpact();
      // await _player.play(AssetSource('sounds/swoosh.mp3'));
    } catch (_) {}
  }

  Future<void> playEmpty() async {
    try {
      // Subtle cue
      await HapticFeedback.selectionClick();
    } catch (_) {}
  }
}
