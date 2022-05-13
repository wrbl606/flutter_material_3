import 'package:flutter/material.dart';
import 'package:rxdart/subjects.dart';

/// A service that stores and retrieves user settings.
///
/// By default, this class does not persist user settings. If you'd like to
/// persist the user settings locally, use the shared_preferences package. If
/// you'd like to store settings on a web server, use the http package.
class SettingsService {
  final _useMaterial3 = BehaviorSubject<bool>.seeded(false);
  final _colorSeed = BehaviorSubject<Color>.seeded(Colors.blue);

  /// Loads the User's preferred ThemeMode from local or remote storage.
  Future<bool> get useMaterial3 async {
    return _useMaterial3.value;
  }

  Stream<bool> get useMaterial3$ => _useMaterial3.stream;

  /// Persists the user's preferred ThemeMode to local or remote storage.
  Future<void> updateMaterial3(bool useMaterial3) async {
    _useMaterial3.add(useMaterial3);
  }

  /// Loads the User's preferred ThemeMode from local or remote storage.
  Future<Color> get colorSeed async {
    return _colorSeed.value;
  }

  Stream<Color> get colorSeed$ => _colorSeed.stream;

  /// Persists the user's preferred ThemeMode to local or remote storage.
  Future<void> updateColorSeed(Color colorSeed) async {
    _colorSeed.add(colorSeed);
  }
}
