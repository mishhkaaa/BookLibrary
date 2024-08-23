import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'settings_page.dart';
import 'book_provider.dart'; // Adjust import path as necessary

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String _userName = 'User Name';
  String _email = 'user@example.com';
  String _phoneNumber = '+1234567890';
  String _location = 'New York, USA';

  void _editProfile() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        final _userNameController = TextEditingController(text: _userName);
        final _emailController = TextEditingController(text: _email);
        final _phoneNumberController =
            TextEditingController(text: _phoneNumber);
        final _locationController = TextEditingController(text: _location);

        return AlertDialog(
          backgroundColor: Colors.white,
          title: Text('Edit Profile',
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 24,
                  color: Color.fromARGB(255, 8, 27, 149))),
          content: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  controller: _userNameController,
                  decoration: InputDecoration(
                      labelText: 'User Name',
                      labelStyle: TextStyle(
                          color: Color.fromARGB(255, 8, 27, 149),
                          fontWeight: FontWeight.bold)),
                ),
                TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                      labelText: 'Email',
                      labelStyle: TextStyle(
                          color: Color.fromARGB(255, 8, 27, 149),
                          fontWeight: FontWeight.bold)),
                ),
                TextField(
                  controller: _phoneNumberController,
                  decoration: InputDecoration(
                      labelText: 'Phone Number',
                      labelStyle: TextStyle(
                          color: Color.fromARGB(255, 8, 27, 149),
                          fontWeight: FontWeight.bold)),
                ),
                TextField(
                  controller: _locationController,
                  decoration: InputDecoration(
                      labelText: 'Location',
                      labelStyle: TextStyle(
                          color: Color.fromARGB(255, 8, 27, 149),
                          fontWeight: FontWeight.bold)),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  _userName = _userNameController.text;
                  _email = _emailController.text;
                  _phoneNumber = _phoneNumberController.text;
                  _location = _locationController.text;
                });
                Navigator.of(context).pop();
              },
              child: Text('Save'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final bookProvider = Provider.of<BookProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profile',
          style: TextStyle(color: Colors.white, fontSize: 26),
        ),
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
                  _userName,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  _email,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[600],
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Phone Number: $_phoneNumber',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[600],
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Location: $_location',
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
            subtitle: Text('${bookProvider.recentlyRead.length} Books'),
            leading: Icon(Icons.book),
            onTap: () {
              // Navigate to Books Read Page
            },
          ),
          ListTile(
            title: Text('Currently Reading'),
            subtitle: Text('${bookProvider.continueReading.length} Books'),
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
            onTap: _editProfile,
          ),
          ListTile(
            title: Text('App Settings'),
            leading: Icon(Icons.settings),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SettingsPage(
                    fontSize: 16.0, // Provide a default or current font size
                    onChangeFontSize: (value) {
                      // Handle font size change if necessary
                    },
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
