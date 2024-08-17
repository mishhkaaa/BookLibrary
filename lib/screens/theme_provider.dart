import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier {
  double _fontSize = 16.0;

  double get fontSize => _fontSize;

  ThemeData get currentTheme {
    return ThemeData
        .light(); // Use light theme or choose ThemeData.dark() if you want a dark theme
  }

  void changeFontSize(double value) {
    _fontSize = value;
    notifyListeners();
  }
}
