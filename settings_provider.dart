import 'package:flutter/material.dart';

class SettingsProvider with ChangeNotifier {
  bool _isDarkMode = false;

  bool get isDarkMode => _isDarkMode;

  void toggleDarkMode(bool isDark) {
    _isDarkMode = isDark;
    notifyListeners();
  }
}
