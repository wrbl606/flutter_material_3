import 'package:flutter/material.dart';
import 'package:rxdart/subjects.dart';

class SettingsService {
  final _useMaterial3 = BehaviorSubject<bool>.seeded(false);
  final _colorSeed = BehaviorSubject<Color>.seeded(Colors.blue);

  Future<bool> get useMaterial3 async {
    return _useMaterial3.value;
  }

  Stream<bool> get useMaterial3$ => _useMaterial3.stream;

  Future<void> updateMaterial3(bool useMaterial3) async {
    _useMaterial3.add(useMaterial3);
  }

  Future<Color> get colorSeed async {
    return _colorSeed.value;
  }

  Stream<Color> get colorSeed$ => _colorSeed.stream;

  Future<void> updateColorSeed(Color colorSeed) async {
    _colorSeed.add(colorSeed);
  }
}
