// ignore_for_file: use_key_in_widget_constructors, prefer_const_declarations, sized_box_for_whitespace, prefer_const_constructors, library_private_types_in_public_api

import 'package:flutter/material.dart';

class HomeTabContent extends StatefulWidget {
  @override
  _HomeTabContentState createState() => _HomeTabContentState();
}

class _HomeTabContentState extends State<HomeTabContent> {
  final ScrollController _scrollController = ScrollController();
  double _opacity = 0.0;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      setState(() {
        // Update opacity based on scroll position
        // Adjust the threshold based on the size of the logo and desired effect
        _opacity = (_scrollController.offset > 150) ? 1.0 : 0.0;
      });
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Home Tab Content'),
    );
  }
}
