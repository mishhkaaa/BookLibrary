import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier {
  bool _isDarkMode = false;
  double _fontSize = 16.0;

  bool get isDarkMode => _isDarkMode;
  double get fontSize => _fontSize;

  ThemeData get currentTheme {
    return _isDarkMode ? ThemeData.dark() : ThemeData.light();
  }

  void toggleDarkMode(bool value) {
    _isDarkMode = value;
    notifyListeners();
  }

  void changeFontSize(double value) {
    _fontSize = value;
    notifyListeners();
  }
}
