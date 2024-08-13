import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/home_screen.dart';
import 'screens/theme_provider.dart'; // Adjust import path as needed
import 'screens/search_provider.dart'; // Adjust import path as needed
import 'screens/readlist_provider.dart'; // Import the ReadlistProvider
import 'screens/book_provider.dart';
import 'screens/app_colors.dart'; // Import the colors

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
        ChangeNotifierProvider(create: (context) => SearchProvider()),
        ChangeNotifierProvider(create: (context) => ReadlistProvider()),
        ChangeNotifierProvider(create: (context) => BookProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return MaterialApp(
      title: 'Book Library',
      theme: ThemeData(
        primaryColor: AppColors.darkBlue,
        hintColor: AppColors.accentOrange,
        scaffoldBackgroundColor: AppColors.lightSkyBlue,
        textTheme: themeProvider.isDarkMode
            ? TextTheme(
                bodyLarge: TextStyle(
                    color: Colors.white, fontSize: themeProvider.fontSize),
                bodyMedium: TextStyle(
                    color: Colors.white, fontSize: themeProvider.fontSize),
                displayLarge: TextStyle(
                    color: Colors.white, fontSize: themeProvider.fontSize),
                displayMedium: TextStyle(
                    color: Colors.white, fontSize: themeProvider.fontSize),
                displaySmall: TextStyle(
                    color: Colors.white, fontSize: themeProvider.fontSize),
                headlineMedium: TextStyle(
                    color: Colors.white, fontSize: themeProvider.fontSize),
                headlineSmall: TextStyle(
                    color: Colors.white, fontSize: themeProvider.fontSize),
                titleLarge: TextStyle(
                    color: Colors.white, fontSize: themeProvider.fontSize),
              )
            : TextTheme(
                bodyLarge: TextStyle(
                    color: Colors.black, fontSize: themeProvider.fontSize),
                bodyMedium: TextStyle(
                    color: Colors.black, fontSize: themeProvider.fontSize),
                displayLarge: TextStyle(
                    color: Colors.black, fontSize: themeProvider.fontSize),
                displayMedium: TextStyle(
                    color: Colors.black, fontSize: themeProvider.fontSize),
                displaySmall: TextStyle(
                    color: Colors.black, fontSize: themeProvider.fontSize),
                headlineMedium: TextStyle(
                    color: Colors.black, fontSize: themeProvider.fontSize),
                headlineSmall: TextStyle(
                    color: Colors.black, fontSize: themeProvider.fontSize),
                titleLarge: TextStyle(
                    color: Colors.black, fontSize: themeProvider.fontSize),
              ),
        buttonTheme: ButtonThemeData(
          buttonColor: AppColors.accentOrange, // Color of buttons
          textTheme: ButtonTextTheme.primary,
        ),
        appBarTheme: AppBarTheme(
          color: AppColors.darkBlue,
          iconTheme: IconThemeData(color: AppColors.neutralWhite),
        ),
        colorScheme: ColorScheme(
          primary: AppColors.darkBlue,
          secondary: AppColors.accentOrange,
          surface: AppColors.neutralWhite,
          background: AppColors.lightSkyBlue,
          error: Colors.red,
          onPrimary: Colors.white,
          onSecondary: Colors.white,
          onSurface: Colors.black,
          onBackground: Colors.black,
          onError: Colors.white,
          brightness: Brightness.light,
        ),
      ),
      home: HomeScreen(
        isDarkMode: themeProvider.isDarkMode,
        onToggleDarkMode: (value) {
          themeProvider.toggleDarkMode(value);
        },
        fontSize: themeProvider.fontSize,
        onChangeFontSize: (value) {
          themeProvider.changeFontSize(value);
        },
      ),
    );
  }
}
