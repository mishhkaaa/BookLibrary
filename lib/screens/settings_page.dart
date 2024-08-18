// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  final double fontSize;
  final ValueChanged<double> onChangeFontSize;

  SettingsPage({
    required this.fontSize,
    required this.onChangeFontSize,
  });

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  // Notification settings
  bool _emailNotifications = true;
  bool _pushNotifications = false;
  String _notificationFrequency = 'Daily';

  // Font size options
  List<double> _fontSizeOptions = [12.0, 14.0, 16.0, 18.0, 20.0, 22.0];
  double get fontSize => widget.fontSize;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Settings',
          style: TextStyle(color: Colors.white, fontSize: 26),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          // Appearance and Personalization Section
          Text(
            'Appearance and Personalization',
            style: TextStyle(
              fontSize: 24, // Custom font size
              fontWeight: FontWeight.bold, // Custom font weight
            ),
          ),
          SizedBox(height: 16),
          ListTile(
            title: Text(
              'Font Size',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            subtitle: DropdownButton<double>(
              value: fontSize,
              items: _fontSizeOptions.map((size) {
                return DropdownMenuItem<double>(
                  value: size,
                  child: Text(
                    '$size',
                    style: TextStyle(fontSize: size),
                  ),
                );
              }).toList(),
              onChanged: (value) {
                if (value != null) {
                  widget.onChangeFontSize(value);
                }
              },
            ),
          ),
          SizedBox(height: 16),
          Divider(),

          // Notification Settings Section
          Text(
            'Notification Settings',
            style: TextStyle(
              fontSize: 24, // Custom font size
              fontWeight: FontWeight.bold, // Custom font weight
            ),
          ),
          SizedBox(height: 16),
          SwitchListTile(
            title: Text('Email Notifications'),
            value: _emailNotifications,
            onChanged: (value) {
              setState(() {
                _emailNotifications = value;
              });
            },
          ),
          SwitchListTile(
            title: Text('Push Notifications'),
            value: _pushNotifications,
            onChanged: (value) {
              setState(() {
                _pushNotifications = value;
              });
            },
          ),
          SizedBox(height: 16),
          Text(
            'Notification Frequency',
            style: TextStyle(
              fontSize: 18, // Custom font size
              fontWeight: FontWeight.bold, // Custom font weight
            ),
          ),
          DropdownButton<String>(
            value: _notificationFrequency,
            items: ['Daily', 'Weekly', 'Monthly'].map((frequency) {
              return DropdownMenuItem<String>(
                value: frequency,
                child: Text(frequency),
              );
            }).toList(),
            onChanged: (value) {
              if (value != null) {
                setState(() {
                  _notificationFrequency = value;
                });
              }
            },
          ),
          SizedBox(height: 16),
          Divider(),

          // Settings List
          ListTile(
            title: Text('Privacy Settings'),
            leading: Icon(Icons.privacy_tip),
            onTap: () => _showPrivacySettingsDialog(context),
          ),
          ListTile(
            title: Text('Help & Support'),
            leading: Icon(Icons.help),
            onTap: () => _showHelpAndSupportDialog(context),
          ),
          ListTile(
            title: Text('About & Legal'),
            leading: Icon(Icons.info),
            onTap: () => _showAboutAndLegalDialog(context),
          ),
        ],
      ),
    );
  }

  void _showPrivacySettingsDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: Text(
            'Privacy Settings',
            style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 24,
                color: Color.fromARGB(255, 8, 27, 149)),
          ),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Privacy Policy',
                  style: TextStyle(
                    color: Color.fromARGB(255, 8, 27, 149),
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'We value your privacy. Your personal data will not be shared with third parties without your consent. For more details, please refer to our privacy policy on our website.',
                ),
                SizedBox(height: 16),
                Text(
                  'Data Collection',
                  style: TextStyle(
                    color: Color.fromARGB(255, 8, 27, 149),
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'We collect data to improve your user experience. This includes information about your usage of the app and feedback you provide.',
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }

  void _showHelpAndSupportDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: Text(
            'Help & Support',
            style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 24,
                color: Color.fromARGB(255, 8, 27, 149)),
          ),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Help Center',
                  style: TextStyle(
                    color: Color.fromARGB(255, 8, 27, 149),
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'For assistance, visit our Help Center at www.example.com/help or contact our support team at support@example.com.',
                ),
                SizedBox(height: 16),
                Text(
                  'FAQ',
                  style: TextStyle(
                    color: Color.fromARGB(255, 8, 27, 149),
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Check our FAQ section for answers to common questions.',
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }

  void _showAboutAndLegalDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: Text(
            'About & Legal',
            style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 24,
                color: Color.fromARGB(255, 8, 27, 149)),
          ),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'About Us',
                  style: TextStyle(
                    color: Color.fromARGB(255, 8, 27, 149),
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Librazy is a comprehensive book management app designed to help you track and organize your reading. We strive to provide the best user experience with a focus on simplicity and functionality.',
                ),
                SizedBox(height: 16),
                Text(
                  'Version',
                  style: TextStyle(
                    color: Color.fromARGB(255, 8, 27, 149),
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Version 1.0.0',
                ),
                SizedBox(height: 16),
                Text(
                  'Legal Information',
                  style: TextStyle(
                    color: Color.fromARGB(255, 8, 27, 149),
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'By using this app, you agree to our terms of service and privacy policy. For more details, please visit our website.',
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }
}
