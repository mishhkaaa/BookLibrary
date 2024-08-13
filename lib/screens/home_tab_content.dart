import 'package:flutter/material.dart';
import 'app_colors.dart'; // Import the colors

class HomeTabContent extends StatelessWidget {
  final double height;

  const HomeTabContent({super.key, required this.height});

  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
    return Center(
      child: Text('Home Tab Content'),
=======
    final double screenWidth = MediaQuery.of(context).size.width;
    final double textWidth = screenWidth * 0.5;
    final double logoSize = 180;

    return Scaffold(
      body: Container(
        height: height, // Adjust height to fill available space
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppColors.darkBlue, // Dark Blue
              AppColors.mediumBlue, // Medium Blue
              AppColors.lightSkyBlue, // Light Sky Blue
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 50),
                  // Row to place the logo and text side by side
                  Row(
                    children: [
                      // Container for the logo
                      Container(
                        width: logoSize,
                        height: logoSize,
                        margin: const EdgeInsets.only(left: 20),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              spreadRadius: 5,
                              blurRadius: 10,
                              offset: const Offset(0, 3),
                            ),
                          ],
                          image: const DecorationImage(
                            image: NetworkImage(
                                'https://th.bing.com/th/id/OIP.-Qy9IXjlkDb8FYRyJhbTuwHaF7?rs=1&pid=ImgDetMain'), // Replace with your logo URL
                            fit: BoxFit.cover,
                            alignment: Alignment.center,
                          ),
                        ),
                      ),
                      // Container for the text
                      Container(
                        margin: const EdgeInsets.only(left: 20),
                        width: textWidth,
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Heading with gradient text
                            ShaderMask(
                              shaderCallback: (bounds) => LinearGradient(
                                colors: [
                                  AppColors.lightSkyBlue,
                                  AppColors.mediumBlue
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ).createShader(bounds),
                              child: const Text(
                                'Libzary',
                                style: TextStyle(
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1.2,
                                  color: Colors
                                      .transparent, // Text color is made transparent as gradient is applied
                                ),
                              ),
                            ),
                            const SizedBox(height: 12),
                            // Paragraph with custom font and color
                            Text(
                              'Librazy is your go-to app for discovering and managing your book collection. Our app offers features such as personalized book recommendations, easy search options, and a user-friendly interface to help you keep track of your reading progress and favorite titles. Whether you\'re an avid reader or just getting started, Libzary has something for everyone.',
                              style: TextStyle(
                                fontSize: 26,
                                color: Colors.white.withOpacity(0.9),
                                height: 1.5,
                              ),
                            ),
                            const SizedBox(height: 30),
                            // Text box indicating towards the add books button
                            Container(
                              padding: const EdgeInsets.all(16.0),
                              color: AppColors.accentOrange,
                              child: const Text(
                                'Tap the Add Books button to add new titles to your collection!\n Navigate to the ReadList Tab to access the added books',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
            SliverFillRemaining(
              child: Container(
                height:
                    height - 200, // Adjust height based on the content above
              ),
            ),
          ],
        ),
      ),
>>>>>>> 692d4392bc18a8a20d4408325b903b5f83e9c1d8
    );
  }
}
