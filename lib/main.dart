import 'package:flutter/material.dart';
// import 'screen/login_screen.dart';
import 'screen/splash_screen.dart';
void main() {
  runApp(const CampusCareApp());
}

class CampusCareApp extends StatelessWidget {
  const CampusCareApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CampusCare',
      theme: ThemeData(
        brightness: Brightness.light,
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'Inter',
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF007245),
          primary: const Color(0xFF007245),
        ),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}