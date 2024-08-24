// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, deprecated_member_use

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
        scaffoldBackgroundColor: const Color.fromARGB(255, 208, 232, 241),
        textTheme: TextTheme(
          bodyLarge: TextStyle(
              color: themeProvider.currentTheme.textTheme.bodyLarge?.color,
              fontSize: themeProvider.fontSize),
          bodyMedium: TextStyle(
              color: themeProvider.currentTheme.textTheme.bodyMedium?.color,
              fontSize: themeProvider.fontSize),
          displayLarge: TextStyle(
              color: themeProvider.currentTheme.textTheme.displayLarge?.color,
              fontSize: themeProvider.fontSize),
          displayMedium: TextStyle(
              color: themeProvider.currentTheme.textTheme.displayMedium?.color,
              fontSize: themeProvider.fontSize),
          displaySmall: TextStyle(
              color: themeProvider.currentTheme.textTheme.displaySmall?.color,
              fontSize: themeProvider.fontSize),
          headlineMedium: TextStyle(
              color: themeProvider.currentTheme.textTheme.headlineMedium?.color,
              fontSize: themeProvider.fontSize),
          headlineSmall: TextStyle(
              color: themeProvider.currentTheme.textTheme.headlineSmall?.color,
              fontSize: themeProvider.fontSize),
          titleLarge: TextStyle(
              color: themeProvider.currentTheme.textTheme.titleLarge?.color,
              fontSize: themeProvider.fontSize),
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
        fontSize: themeProvider.fontSize,
        onChangeFontSize: (value) {
          themeProvider.changeFontSize(value);
        },
      ),
    );
  }
}
