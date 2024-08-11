import 'package:flutter/material.dart';

class MyBooksPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Books'),
      ),
      body: Center(
        child: Text('My Books Page Content'),
      ),
    );
  }
}
