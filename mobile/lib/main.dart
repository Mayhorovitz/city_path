import 'package:flutter/material.dart';
import 'package:city_path/screens/splash_screen.dart';

void main() {
  runApp(const CityPathApp());
}

class CityPathApp extends StatelessWidget {
  const CityPathApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'City Path',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(
          0xFFF9F2E9,
        ), // App background color
      ),
      home: const SplashScreen(), // Start with splash screen
      debugShowCheckedModeBanner: false,
    );
  }
}
