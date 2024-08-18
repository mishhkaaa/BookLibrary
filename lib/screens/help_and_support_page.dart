// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, library_private_types_in_public_api

import 'package:flutter/material.dart';

class HelpAndSupportPage extends StatefulWidget {
  @override
  _HelpAndSupportPageState createState() => _HelpAndSupportPageState();
}

class _HelpAndSupportPageState extends State<HelpAndSupportPage> {
  bool _isChecked = false; // State for the checkbox

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Help & Support'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Guidelines and Rules',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            SizedBox(height: 20),
            Text(
              'Here are the guidelines and rules that need to be followed. Please read them carefully and make sure you understand them before accepting:',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Text(
              '1. Follow the community guidelines.\n'
              '2. Respect other users.\n'
              '3. No spamming or inappropriate content.\n'
              '4. Report any issues or violations.\n'
              '5. Use the app responsibly.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Checkbox(
                  value: _isChecked,
                  onChanged: (bool? value) {
                    setState(() {
                      _isChecked = value ?? false;
                    });
                  },
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Text(
                    'I have read and agree to the guidelines and rules.',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _isChecked
                  ? () {
                      // Handle submission or acknowledgment
                      Navigator.pop(context);
                    }
                  : null, // Disable button if checkbox is not checked
              child: Text('Accept'),
            ),
          ],
        ),
      ),
    );
  }
}
