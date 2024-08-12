import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'theme_provider.dart'; // Adjust import path as necessary

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
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          Text(
            'Appearance and Personalization',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          SwitchListTile(
            title: Text('Dark Mode'),
            value: isDarkMode,
            onChanged: onToggleDarkMode,
          ),
          SizedBox(height: 16),
          Text(
            'Font Size',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          Slider(
            value: fontSize,
            min: 12.0,
            max: 24.0,
            divisions: 6,
            label: fontSize.round().toString(),
            onChanged: (double newValue) {
              onChangeFontSize(newValue);
            },
          ),
          SizedBox(height: 16),
          Divider(),
          ListTile(
            title: Text('Privacy Settings'),
            leading: Icon(Icons.privacy_tip),
            onTap: () {
              // Navigate to Privacy Settings Page
            },
          ),
          ListTile(
            title: Text('Notification Settings'),
            leading: Icon(Icons.notifications),
            onTap: () {
              // Navigate to Notification Settings Page
            },
          ),
          Divider(),
          ListTile(
            title: Text('Help & Support'),
            leading: Icon(Icons.help),
            onTap: () {
              // Navigate to Help & Support Page
            },
          ),
          ListTile(
            title: Text('About & Legal'),
            leading: Icon(Icons.info),
            onTap: () {
              // Navigate to About & Legal Page
            },
          ),
        ],
      ),
    );
  }
}
