import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class SettingsPage extends StatelessWidget {
  final bool isDarkMode;
  final ValueChanged<bool> onToggleDarkMode;
  final double fontSize;
  final ValueChanged<double> onChangeFontSize;

  SettingsPage({
    required this.isDarkMode,
    required this.onToggleDarkMode,
    required this.fontSize,
    required this.onChangeFontSize,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          SwitchListTile(
            title: Text('Dark Mode'),
            value: isDarkMode,
            onChanged: onToggleDarkMode,
          ),
          SizedBox(height: 16),
          Text('Font Size'),
          Slider(
            value: fontSize,
            min: 12.0,
            max: 24.0,
            divisions: 6,
            label: fontSize.round().toString(),
            onChanged: onChangeFontSize,
          ),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: () async {
              final tempDir = await getTemporaryDirectory();
              tempDir.delete(recursive: true);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Cache Cleared')),
              );
            },
            child: Text('Clear Cache'),
          ),
        ],
      ),
    );
  }
}
