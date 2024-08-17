import 'package:flutter/material.dart';
import 'app_colors.dart'; // Import the colors

class HomeTabContent extends StatefulWidget {
  final double height;

  const HomeTabContent({super.key, required this.height});

  @override
  _HomeTabContentState createState() => _HomeTabContentState();
}

class _HomeTabContentState extends State<HomeTabContent>
    with TickerProviderStateMixin {
  late AnimationController _textController;
  late Animation<double> _textAnimation;

  @override
  void initState() {
    super.initState();

    // Initialize the animation controller and animation
    _textController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _textAnimation = CurvedAnimation(
      parent: _textController,
      curve: Curves.easeIn,
    );

    // Start the animation
    _textController.forward();
  }

  @override
  void dispose() {
    // Dispose the animation controller to free up resources
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double textWidth = screenWidth * 0.8; // Adjusted text width
    final double logoSize = 125; // Set logo size

    return Scaffold(
      body: Container(
        height: widget.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppColors.darkBlue,
              AppColors.mediumBlue,
              AppColors.lightSkyBlue,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              // Logo at the top
              Container(
                width: logoSize,
                height: logoSize,
                margin: const EdgeInsets.only(bottom: 20),
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
              const SizedBox(height: 0),
              // Animated Text
              FadeTransition(
                opacity: _textAnimation,
                child: Container(
                  width: textWidth,
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Heading with gradient text
                      ShaderMask(
                        shaderCallback: (bounds) => LinearGradient(
                          colors: [
                            AppColors.lightSkyBlue,
                            AppColors.mediumBlue,
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ).createShader(bounds),
                        child: const Text(
                          'Libzary',
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.2,
                            color: Colors.transparent,
                          ),
                        ),
                      ),
                      const SizedBox(height: 0),
                      // Paragraph with custom font and color
                      Text(
                        'Librazy is your go-to app for discovering and managing your book collection. Our app offers features such as personalized book recommendations, easy search options, and a user-friendly interface to help you keep track of your reading progress and favorite titles. Whether you\'re an avid reader or just getting started, Libzary has something for everyone.',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white.withOpacity(0.9),
                          height: 1.5,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 0),
              // Section with arrow and instruction
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 0),
                  const SizedBox(height: 0),
                  ElevatedButton(
                    onPressed: () {
                      // Add navigation or feature exploration action here
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.accentOrange,
                      padding: const EdgeInsets.symmetric(
                        vertical: 12,
                        horizontal: 24,
                      ),
                    ),
                    child: Text(
                      'Tap the Add Books button to add new titles to your collection!\nNavigate to the ReadList Tab to access the added books',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 0),
            ],
          ),
        ),
      ),
    );
  }
}
