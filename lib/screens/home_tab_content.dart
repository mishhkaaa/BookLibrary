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
        _opacity = (_scrollController.offset > 100)
            ? 1.0
            : 0.0; // Adjust threshold as needed
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
    // Calculate available width for text and logo
    final double screenWidth = MediaQuery.of(context).size.width;
    final double textWidth = screenWidth * 0.6;
    final double logoSize = 200; // Increased logo size for better visibility

    return Scaffold(
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                // Container for the logo
                Container(
                  width: logoSize,
                  height: logoSize,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: NetworkImage(
                          'https://th.bing.com/th/id/OIP.-Qy9IXjlkDb8FYRyJhbTuwHaF7?rs=1&pid=ImgDetMain'), // Replace with your logo URL
                      fit:
                          BoxFit.cover, // Ensure the image covers the container
                      alignment: Alignment
                          .center, // Center the image within the container
                    ),
                  ),
                ),
                const SizedBox(
                    height: 10), // Reduced space between logo and text
                // Add some extra space to ensure scrolling works
                Container(height: 300), // Adjust the height as needed
                // Container for the text with fade-in effect
                AnimatedOpacity(
                  opacity: _opacity,
                  duration: const Duration(seconds: 1),
                  child: Container(
                    width: textWidth,
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Heading
                        Text(
                          'Libzary',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        // Paragraph
                        Text(
                          'Libzary is your go-to app for discovering and managing your book collection. Our app offers features such as personalized book recommendations, easy search options, and a user-friendly interface to help you keep track of your reading progress and favorite titles. Whether you\'re an avid reader or just getting started, Libzary has something for everyone.',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey[700],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
