import 'dart:async';

import 'package:flutter/material.dart';

import 'settings_service.dart';

/// A class that many Widgets can interact with to read user settings, update
/// user settings, or listen to user settings changes.
///
/// Controllers glue Data Services to Flutter Widgets. The SettingsController
/// uses the SettingsService to store and retrieve user settings.
class SettingsController with ChangeNotifier {
  SettingsController(this._settingsService);

  // Make SettingsService a private variable so it is not used directly.
  final SettingsService _settingsService;
  StreamSubscription<bool>? _useMaterial3Sub;
  StreamSubscription<Color>? _colorSeedSub;

  // Make ThemeMode a private variable so it is not updated directly without
  // also persisting the changes with the SettingsService.
  late bool _useMaterial3;
  late Color _colorSeed;

  // Allow Widgets to read the user's preferred ThemeMode.
  bool get useMaterial3 => _useMaterial3;
  Color get colorSeed => _colorSeed;

  /// Load the user's settings from the SettingsService. It may load from a
  /// local database or the internet. The controller only knows it can load the
  /// settings from the service.
  Future<void> loadSettings() async {
    _useMaterial3Sub = _settingsService.useMaterial3$.listen((useMaterial3) {
      _useMaterial3 = useMaterial3;
      notifyListeners();
    });
    _colorSeedSub = _settingsService.colorSeed$.listen((colorSeed) {
      _colorSeed = colorSeed;
      notifyListeners();
    });
  }

  @override
  void dispose() {
    _useMaterial3Sub?.cancel();
    _colorSeedSub?.cancel();
    super.dispose();
  }

  /// Update and persist the ThemeMode based on the user's selection.
  Future<void> updateUseMaterial3(bool useMaterial3) async {
    // Do not perform any work if new and old ThemeMode are identical
    if (_useMaterial3 == useMaterial3) return;

    // Persist the changes to a local database or the internet using the
    // SettingService.
    await _settingsService.updateMaterial3(useMaterial3);
  }

  /// Update and persist the ThemeMode based on the user's selection.
  Future<void> updateColorSeed(Color colorSeed) async {
    // Do not perform any work if new and old ThemeMode are identical
    if (_colorSeed == colorSeed) return;

    // Persist the changes to a local database or the internet using the
    // SettingService.
    await _settingsService.updateColorSeed(colorSeed);
  }
}
