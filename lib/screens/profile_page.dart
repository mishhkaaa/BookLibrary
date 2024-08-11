import 'package:flutter/material.dart';
import 'settings_page.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          Center(
            child: Column(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage:
                      NetworkImage('https://placeimg.com/100/100/people'),
                ),
                SizedBox(height: 20),
                Text(
                  'User Name',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'user@example.com',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[600],
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Phone Number: +1234567890',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[600],
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Location: New York, USA',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 30),
          ListTile(
            title: Text('Books Read'),
            subtitle: Text('10 Books'),
            leading: Icon(Icons.book),
            onTap: () {
              // Navigate to Books Read Page
            },
          ),
          ListTile(
            title: Text('Currently Reading'),
            subtitle: Text('5 Books'),
            leading: Icon(Icons.bookmark),
            onTap: () {
              // Navigate to Currently Reading Page
            },
          ),
          ListTile(
            title: Text('Reading Goals'),
            subtitle: Text('2024 Goal: 50 Books'),
            leading: Icon(Icons.flag),
            onTap: () {
              // Navigate to Reading Goals Page
            },
          ),
          ListTile(
            title: Text('Edit Profile'),
            leading: Icon(Icons.edit),
            onTap: () {
              // Navigate to Edit Profile Page
            },
          ),
          ListTile(
            title: Text('Change Password'),
            leading: Icon(Icons.lock),
            onTap: () {
              // Navigate to Change Password Page
            },
          ),
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
          ListTile(
            title: Text('App Settings'),
            leading: Icon(Icons.settings),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SettingsPage(
                          isDarkMode: false,
                          onToggleDarkMode: (value) {},
                          fontSize: 16.0,
                          onChangeFontSize: (value) {},
                        )),
              );
            },
          ),
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
          SizedBox(height: 30),
          ElevatedButton(
            onPressed: () {
              // Handle logout
            },
            child: Text('Logout'),
          ),
        ],
      ),
    );
  }
}
