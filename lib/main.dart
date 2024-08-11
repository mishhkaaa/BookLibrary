import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isDarkMode = false;
  double _fontSize = 16.0;

  @override
  void initState() {
    super.initState();
    _loadSettings();
  }

  void _loadSettings() async {
    // Load settings from SharedPreferences
  }

  void _toggleDarkMode(bool value) async {
    setState(() {
      _isDarkMode = value;
    });
    // Save settings to SharedPreferences
  }

  void _changeFontSize(double value) async {
    setState(() {
      _fontSize = value;
    });
    // Save settings to SharedPreferences
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Book Library',
      theme: ThemeData(
        brightness: _isDarkMode ? Brightness.dark : Brightness.light,
        textTheme: TextTheme(
          bodyMedium: TextStyle(fontSize: _fontSize),
        ),
      ),
      home: HomeScreen(
        isDarkMode: _isDarkMode,
        onToggleDarkMode: _toggleDarkMode,
        fontSize: _fontSize,
        onChangeFontSize: _changeFontSize,
      ),
    );
  }
}
